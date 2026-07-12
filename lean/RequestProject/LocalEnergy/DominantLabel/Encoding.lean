import Mathlib.Analysis.Complex.ExponentialBounds
import RequestProject.Core.Asymptotics
import RequestProject.Core.FiniteSums
import RequestProject.LocalEnergy.DominantLabel.Definition
import RequestProject.LocalEnergy.DominantLabel.Energy

/-!
# Entropy encoding for assignments with a dominant label

Once energy bounds the number of exceptional coordinates, an assignment is
encoded by its dominant integer label, its exception set, and the residues on
that set. The resulting binomial sum gives the dominant-level-set estimate.
-/

open Finset

namespace LocalEnergy

open scoped Classical

/-
**(A4 encoding) Dominant encoding count.**  The number of assignments whose
    `m`-exception set has `≤ h` elements is `≤ ∑_{e≤h} C(N,e)(2X)^e`: an assignment
    is determined by its exception set and the residues there (outside, `a_q = m`).
    Mirrors `LocalEnergy.decoding_card_bound`.
-/
lemma dominant_assignment_encoding_bound (X : ℕ) (_hX : 1 ≤ X) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (m : ℤ) (h : ℕ) :
    ((Finset.univ.filter (fun a : BlockAssignment P =>
        (P.attach.filter (fun q => a q ≠ ((m:ℤ):ZMod (q:ℕ)))).card ≤ h)).card : ℝ)
      ≤ ∑ e ∈ Finset.range (h+1), (Nat.choose P.card e : ℝ) * (2*(X:ℝ))^e := by
  refine' le_trans ( Nat.cast_le.mpr _ ) _;
  exact ∑ S ∈ Finset.powerset ( Finset.attach P ), if S.card ≤ h then ∏ q ∈ S, q.1 else 0;
  · have h_card : ∀ S ∈ Finset.powerset (Finset.attach P), Finset.card (Finset.filter (fun a : BlockAssignment P => {q ∈ P.attach | a q ≠ (m : ZMod q.1)} = S) Finset.univ) ≤ ∏ q ∈ S, (q.1 : ℕ) := by
      intro S hS
      have h_card : Finset.card (Finset.image (fun a : BlockAssignment P => fun q : S => a q) (Finset.filter (fun a : BlockAssignment P => {q ∈ P.attach | a q ≠ (m : ZMod q.1)} = S) Finset.univ)) ≤ ∏ q ∈ S, (q.1 : ℕ) := by
        refine' le_trans ( Finset.card_le_univ _ ) _ ; norm_num [ Finset.card_univ ];
        refine' le_of_eq _;
        refine' Finset.prod_bij ( fun x hx => x ) _ _ _ _ <;> aesop;
      rwa [ Finset.card_image_of_injOn ] at h_card;
      intro a ha b hb; simp_all +decide [ funext_iff, Finset.ext_iff ] ;
      grind;
    have h_card : Finset.card (Finset.filter (fun a : BlockAssignment P => (Finset.card (Finset.filter (fun q => a q ≠ (m : ZMod q.1)) (Finset.attach P))) ≤ h) Finset.univ) ≤ ∑ S ∈ Finset.powerset (Finset.attach P), if S.card ≤ h then Finset.card (Finset.filter (fun a : BlockAssignment P => {q ∈ P.attach | a q ≠ (m : ZMod q.1)} = S) Finset.univ) else 0 := by
      rw [ ← Finset.sum_filter ];
      rw [ ← Finset.card_biUnion ];
      · refine Finset.card_le_card ?_;
        intro a ha; aesop;
      · exact fun x hx y hy hxy => Finset.disjoint_left.mpr fun z hz₁ hz₂ => hxy <| by aesop;
    exact h_card.trans ( Finset.sum_le_sum fun S hS => by aesop );
  · exact_mod_cast RequestProject.weightedPowersetSum_le_binomial
      P.attach (fun q : P => q.1) (2 * X) P.card h (by simp)
      (fun q _ => (hP q.1 q.2).2.2)

/-
**(A4 entropy) Exception entropy.**  For `X` large, `∑_{e≤h} C(N,e)(2X)^e ≤ e^{εR}`
    when `h ≤ 2¹⁵RX²/((1-ρ)N³)` and `N ≥ X/(2 log X)` (`3h log X ≤ εR`).  Mirrors
    `LocalEnergy.entropy_inequality`.
-/
lemma dominant_encoding_entropy_bound (eps ρ : ℝ) (hε : 0 < eps) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4) :
    ∃ X0 : ℝ, 0 < X0 ∧ ∀ (X N h : ℕ) (R : ℝ),
      X0 ≤ X → 1 ≤ R → 1 ≤ N → N ≤ 2*X → (X:ℝ)/(2*Real.log X) ≤ (N:ℝ) →
      (h:ℝ) ≤ 2^15 * R * (X:ℝ)^2 / ((1-ρ)*(N:ℝ)^3) →
      ∑ e ∈ Finset.range (h+1), (Nat.choose N e : ℝ) * (2*(X:ℝ))^e ≤ Real.exp (eps * R) := by
  -- Choose X0 large enough such that for X ≥ X0, 5 * 2^18 * (Real.log X)^4 / ((1-ρ)*X) ≤ eps.
  obtain ⟨X0, hX0⟩ : ∃ X0 : ℝ, 0 < X0 ∧ ∀ X : ℕ, (X0 ≤ ↑X → 5 * 2^18 * (Real.log X)^4 / ((1-ρ)*↑X) ≤ eps) := by
    have h_log_bound : Filter.Tendsto (fun X : ℝ => (Real.log X) ^ 4 / X) Filter.atTop (nhds 0) := by
      -- Let $y = \log X$, therefore the expression becomes $\frac{y^4}{e^y}$.
      suffices h_log : Filter.Tendsto (fun y : ℝ => y^4 / Real.exp y) Filter.atTop (nhds 0) by
        have := h_log.comp Real.tendsto_log_atTop;
        exact this.congr' ( by filter_upwards [ Filter.eventually_gt_atTop 0 ] with x hx using by rw [ Function.comp_apply, Real.exp_log hx ] );
      simpa [div_eq_mul_inv, Real.exp_neg] using
        Real.tendsto_pow_mul_exp_neg_atTop_nhds_zero 4;
    have := h_log_bound.const_mul ( 5 * 2 ^ 18 / ( 1 - ρ ) );
    have := this.eventually ( ge_mem_nhds <| show ( 5 * 2 ^ 18 / ( 1 - ρ ) * 0 : ℝ ) < eps by norm_num; linarith ) ; norm_num at *;
    obtain ⟨ X0, hX0 ⟩ := this; exact ⟨ ⌈X0⌉₊ + 1, by positivity, fun X hX => by
      convert hX0 X (by
        linarith [Nat.le_ceil X0,
          show (X : ℝ) ≥ ⌈X0⌉₊ + 1 by exact_mod_cast hX]) using 1
      · rfl
      · rw [div_mul_div_comm] ⟩ ;
  refine' ⟨ Max.max X0 16, _, _ ⟩ <;> norm_num;
  intro X N h R hX0 hX16 hR1 hN1 hN2 hN3 hh
  have hL : Real.log X ≥ 1 := by
    exact Real.le_log_iff_exp_le ( by positivity ) |>.2 ( by exact Real.exp_one_lt_d9.le.trans ( by norm_num; linarith [ show ( X : ℝ ) ≥ 16 by norm_cast ] ) )
  have hsum : (∑ e ∈ Finset.range (h + 1), (Nat.choose N e : ℝ) * (2 * (X : ℝ)) ^ e) ≤ (h + 1) * (2 * (N : ℝ) * X) ^ h := by
    refine' le_trans ( Finset.sum_le_sum fun i hi => mul_le_mul_of_nonneg_right ( show ( Nat.choose N i : ℝ ) ≤ N ^ i by exact_mod_cast Nat.le_trans ( Nat.choose_le_pow _ _ ) <| by ring_nf; norm_num ) <| by positivity ) _;
    norm_num [ ← mul_pow ];
    exact le_trans ( Finset.sum_le_sum fun _ _ => pow_le_pow_right₀ ( by nlinarith [ show ( N : ℝ ) ≥ 1 by norm_cast, show ( X : ℝ ) ≥ 16 by norm_cast ] ) ( Finset.mem_range_succ_iff.mp ‹_› ) ) ( by norm_num; ring_nf; norm_num )
  have hlog : Real.log ((h + 1) * (2 * (N : ℝ) * X) ^ h) ≤ 5 * (h : ℝ) * Real.log X := by
    rw [ Real.log_mul ( by positivity ) ( by positivity ), Real.log_pow ];
    refine' le_trans ( add_le_add ( Real.log_le_sub_one_of_pos ( by positivity ) ) ( mul_le_mul_of_nonneg_left ( Real.log_le_log ( by positivity ) ( show ( 2 * N * X : ℝ ) ≤ 4 * X ^ 2 by norm_cast; nlinarith ) ) ( by positivity ) ) ) _ ; ring_nf;
    rw [ show ( X : ℝ ) ^ 2 * 4 = ( X : ℝ ) ^ 2 * 2 ^ 2 by norm_num, Real.log_mul ( by positivity ) ( by positivity ), Real.log_pow, Real.log_pow ] ; ring_nf;
    nlinarith [ show ( Real.log 2 : ℝ ) ≤ 1 by exact Real.log_two_lt_d9.le.trans ( by norm_num ), show ( Real.log X : ℝ ) ≥ 1 by exact hL ]
  have hfinal : 5 * (h : ℝ) * Real.log X ≤ eps * R := by
    have hfinal : 5 * (h : ℝ) * Real.log X ≤ 5 * 2^18 * R * (Real.log X)^4 / ((1 - ρ) * X) := by
      have hfinal : (N : ℝ) ^ 3 ≥ (X : ℝ) ^ 3 / (8 * (Real.log X) ^ 3) := by
        rw [ div_le_iff₀ ] at hN3 <;> try positivity;
        rw [ ge_iff_le, div_le_iff₀ ] <;> first | positivity | nlinarith [ pow_le_pow_left₀ ( by positivity ) hN3 3 ] ;
      have hfinal : (h : ℝ) ≤ 32768 * R * X^2 / ((1 - ρ) * (X^3 / (8 * (Real.log X)^3))) := by
        exact hh.trans ( div_le_div_of_nonneg_left ( by positivity ) ( by exact mul_pos ( by linarith ) ( by positivity ) ) ( mul_le_mul_of_nonneg_left hfinal ( by linarith ) ) );
      convert mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_left hfinal (show (0 : ℝ) ≤ 5 by norm_num))
        (show (0 : ℝ) ≤ Real.log X by positivity) using 1
      all_goals first | rfl | ring_nf
      grind +splitImp;
    exact hfinal.trans ( by have := ‹0 < X0 ∧ ∀ X : ℕ, X0 ≤ ↑X → 5 * 2 ^ 18 * Real.log ↑X ^ 4 / ( ( 1 - ρ ) * ↑X ) ≤ eps›.2 X hX0; ring_nf at *; nlinarith )
  have hexp : (h + 1) * (2 * (N : ℝ) * X) ^ h ≤ Real.exp (eps * R) := by
    rw [ ← Real.log_le_iff_le_exp ( by positivity ) ] ; linarith
  exact le_trans hsum hexp

/-
**R-polynomial bound from the trivial-window cutoff.**  For `X` large, if
    `εR < N·log(2X)` (i.e. `R` below the trivial threshold) then
    `R ≤ N⁴(1-ρ)²/(409600 X²)` (the regime where the label is small).
-/
private lemma dominant_energy_polynomial_bound (eps ρ : ℝ) (hε : 0 < eps) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4) :
    ∃ X0 : ℝ, 0 < X0 ∧ ∀ (X N : ℕ) (R : ℝ),
      X0 ≤ X → 1 ≤ R → 1 ≤ N → N ≤ 2*X → (X:ℝ)/(2*Real.log X) ≤ (N:ℝ) →
      eps*R < (N:ℝ)*Real.log (2*X) →
      R ≤ (N:ℝ)^4*(1-ρ)^2/(409600*(X:ℝ)^2) := by
  -- Choose X0 so that for all X ≥ X0, (Real.log X)^4/X ≤ eps*(1-ρ)^2/6553600 (and X ≥ 2, log X ≥ 1).
  have hX0 : ∃ X0 : ℝ, 0 < X0 ∧ ∀ X : ℝ, X0 ≤ X → (Real.log X)^4 / X ≤ eps * (1 - ρ)^2 / 6553600 := by
    have := Real.tendsto_pow_mul_exp_neg_atTop_nhds_zero 4;
    have := Metric.tendsto_nhds.mp ( this.comp ( Real.tendsto_log_atTop ) );
    norm_num [ Real.exp_neg, Real.exp_log ] at this;
    obtain ⟨ X0, hX0 ⟩ := this ( eps * ( 1 - ρ ) ^ 2 / 6553600 ) ( by exact div_pos ( mul_pos hε ( sq_pos_of_pos ( by linarith ) ) ) ( by norm_num ) ) ; exact ⟨ Max.max X0 2, by positivity, fun X hX => le_of_lt <| by simpa [ div_eq_mul_inv, abs_of_nonneg ( Real.log_nonneg <| show 1 ≤ X by linarith [ le_max_right X0 2 ] ), Real.exp_log ( show 0 < X by linarith [ le_max_right X0 2 ] ) ] using hX0 X <| le_trans ( le_max_left X0 2 ) hX ⟩ ;
  obtain ⟨ X0, hX0₁, hX0₂ ⟩ := hX0; use ⌈X0⌉₊ + 2;
  refine' ⟨ by positivity, fun X N R hX₁ hR₁ hN₁ hN₂ hN₃ hN₄ => _ ⟩;
  -- Using the bound from hX0₂, we get:
  have h_bound : 6553600 * (Real.log X)^4 ≤ eps * (1 - ρ)^2 * X := by
    have := hX0₂ X ( by linarith [ Nat.le_ceil X0, show ( X : ℝ ) ≥ ⌈X0⌉₊ + 2 by exact_mod_cast hX₁ ] ) ; rw [ div_le_iff₀ ( by linarith [ Nat.le_ceil X0, show ( X : ℝ ) ≥ ⌈X0⌉₊ + 2 by exact_mod_cast hX₁ ] ) ] at this; linarith;
  -- Using the bound from h_bound, we get:
  have h_bound' : 409600 * X^2 * Real.log (2 * X) ≤ eps * (1 - ρ)^2 * N^3 := by
    have h_bound' : 409600 * X^2 * Real.log (2 * X) ≤ eps * (1 - ρ)^2 * (X / (2 * Real.log X))^3 := by
      have h_bound' : 409600 * X^2 * Real.log (2 * X) ≤ 409600 * X^2 * (2 * Real.log X) := by
        rw [ Real.log_mul ( by positivity ) ( by norm_cast; linarith ) ];
        exact mul_le_mul_of_nonneg_left ( by linarith [ Real.log_le_log ( by norm_num ) ( show ( X : ℝ ) ≥ 2 by linarith [ Nat.le_ceil X0 ] ) ] ) ( by positivity );
      by_cases hX : Real.log X = 0 <;> simp_all +decide [ div_pow, mul_pow ];
      · rcases hX with ( rfl | rfl | hX ) <;> norm_cast at *;
      · rw [ mul_div, le_div_iff₀ ] <;> nlinarith [ show 0 < Real.log X ^ 3 by exact pow_pos ( Real.log_pos <| Nat.one_lt_cast.mpr <| Nat.one_lt_iff_ne_zero_and_ne_one.mpr ⟨ hX.1, hX.2.1 ⟩ ) 3 ];
    exact h_bound'.trans ( mul_le_mul_of_nonneg_left ( pow_le_pow_left₀ ( by exact div_nonneg ( Nat.cast_nonneg _ ) ( mul_nonneg zero_le_two ( Real.log_nonneg ( by norm_cast; linarith ) ) ) ) hN₃ 3 ) ( by exact mul_nonneg hε.le ( sq_nonneg _ ) ) );
  rw [ le_div_iff₀ ] <;> nlinarith [ show ( 0 :ℝ ) < X ^ 2 by norm_cast; nlinarith ]

/- **Label `≤ NX/16`.**  In the small-`R` regime, the label-range bound
    `(5/(1-ρ))√R/σ_P` is `≤ N·X/16` (uses `block_deviation_lower_bound`). -/
lemma dominant_label_linear_bound_with_divisor
    (X : ℕ) (hX : 1 ≤ X) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (hN : 2 ≤ P.card)
    (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4) (D R : ℝ) (hD : 0 < D) (_hR0 : 0 ≤ R)
    (hRpoly : R ≤ (P.card:ℝ)^4*(1-ρ)^2/((40*D)^2*(X:ℝ)^2)) :
    (5/(1-ρ)) * Real.sqrt R / sigmaP P ≤ (P.card:ℝ) * X / D := by
  have hXpos : (0:ℝ) < X := by positivity
  have hNpos : (0:ℝ) < (P.card:ℝ) := by positivity
  have hρ1 : (0:ℝ) < 1 - ρ := by linarith
  have hσ : (P.card:ℝ)/(8*(X:ℝ)^2) ≤ sigmaP P := block_deviation_lower_bound X hX P hP hN
  have hσpos : 0 < sigmaP P := lt_of_lt_of_le (by positivity) hσ
  have hsqrtR : Real.sqrt R ≤ (P.card:ℝ)^2*(1-ρ)/((40*D)*X) := by
    rw [show (P.card:ℝ)^2*(1-ρ)/((40*D)*X) =
        Real.sqrt (((P.card:ℝ)^2*(1-ρ)/((40*D)*X))^2) by
      rw [Real.sqrt_sq (by positivity)]]
    apply Real.sqrt_le_sqrt
    have key : ((P.card:ℝ)^2*(1-ρ)/((40*D)*X))^2 =
        (P.card:ℝ)^4*(1-ρ)^2/((40*D)^2*(X:ℝ)^2) := by ring
    rw [key]; exact hRpoly
  rw [div_le_iff₀ hσpos]
  have hub : (5/(1-ρ)) * Real.sqrt R ≤ (P.card:ℝ)^2/((8*D)*(X:ℝ)) := by
    calc (5/(1-ρ)) * Real.sqrt R
        ≤ (5/(1-ρ)) * ((P.card:ℝ)^2*(1-ρ)/((40*D)*X)) :=
          mul_le_mul_of_nonneg_left hsqrtR (by positivity)
      _ = (P.card:ℝ)^2/((8*D)*(X:ℝ)) := by (field_simp; ring)
  have hlb : (P.card:ℝ)^2/((8*D)*(X:ℝ)) ≤ (P.card:ℝ)*X/D * sigmaP P := by
    have h2 : (P.card:ℝ)*X/D * ((P.card:ℝ)/(8*(X:ℝ)^2)) ≤
        (P.card:ℝ)*X/D * sigmaP P :=
      mul_le_mul_of_nonneg_left hσ (by positivity)
    calc (P.card:ℝ)^2/((8*D)*(X:ℝ))
        = (P.card:ℝ)*X/D * ((P.card:ℝ)/(8*(X:ℝ)^2)) := by field_simp
      _ ≤ (P.card:ℝ)*X/D * sigmaP P := h2
  linarith [hub, hlb]

/-- The standard `/16` specialization of the parameterized dominant-label
linear bound. -/
private lemma dominant_label_linear_bound (X : ℕ) (hX : 1 ≤ X) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (hN : 2 ≤ P.card)
    (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4) (R : ℝ) (hR0 : 0 ≤ R)
    (hRpoly : R ≤ (P.card:ℝ)^4*(1-ρ)^2/(409600*(X:ℝ)^2)) :
    (5/(1-ρ)) * Real.sqrt R / sigmaP P ≤ (P.card:ℝ) * X / 16 := by
  apply dominant_label_linear_bound_with_divisor X hX P hP hN ρ hρ hρ4 16 R
    (by norm_num) hR0
  norm_num
  exact hRpoly

/- For `ε > 0`, `ρ ∈ (0, 1/4]`, and `X` large, the
    number of *dominant* low-energy assignments is at most
    `exp(ε R) · (1 + (10/(1-ρ))·√R/σ_P)`.

    The proof combines the label range
    `|m| ≤ (5/(1-ρ))·√R/σ_P`, a contribution of at least
    `N³/2¹⁵X²` from each exceptional coordinate, and the exception-encoding
    entropy bound `3e log X ≤ εR`. -/
theorem dominant_level_set_bound
    (eps : ℝ) (hε : 0 < eps) (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X →
        ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1]
          (_hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X)
          (_hN : (X:ℝ)/(2 * Real.log X) ≤ P.card)
          (R : ℝ), 1 ≤ R →
            ((Finset.univ.filter
                (fun a : BlockAssignment P => QP P a ≤ R ∧ HasDominantLabel X P a ρ)).card : ℝ)
              ≤ Real.exp (eps * R) *
                  (1 + (10/(1-ρ)) * Real.sqrt R / sigmaP P) := by
  obtain ⟨X0e, hX0e, Hent⟩ := dominant_encoding_entropy_bound eps ρ hε hρ hρ4
  obtain ⟨X0r, hX0r, HRpoly⟩ := dominant_energy_polynomial_bound eps ρ hε hρ hρ4
  obtain ⟨X0c, hX0c, Hlog⟩ := RequestProject.eventually_const_mul_log_le_nat 64
  refine ⟨ max (max X0e X0r) (max X0c 16), by positivity, ?_ ⟩
  intro X hX P inst hP hN R hR1
  have hρ1 : (0:ℝ) < 1 - ρ := by linarith
  have hX16 : (16:ℝ) ≤ X := le_trans (le_max_of_le_right (le_max_right _ _)) hX
  have hX16' : 16 ≤ X := by exact_mod_cast hX16
  have hXe : X0e ≤ X := le_trans (le_max_of_le_left (le_max_left _ _)) hX
  have hXr : X0r ≤ X := le_trans (le_max_of_le_left (le_max_right _ _)) hX
  have hXc : X0c ≤ X := le_trans (le_max_of_le_right (le_max_left _ _)) hX
  have hXpos : (0:ℝ) < X := by linarith
  have hX1 : 1 ≤ X := by omega
  have hlogXpos : 0 < Real.log X := Real.log_pos (by exact_mod_cast (by linarith : (1:ℝ) < X))
  have hN32 : 32 ≤ P.card := by
    have h64 := Hlog X hXc
    have h1 : (32:ℝ) ≤ (X:ℝ)/(2*Real.log X) := by rw [le_div_iff₀ (by positivity)]; linarith
    have h2 : (32:ℝ) ≤ (P.card:ℝ) := le_trans h1 hN
    exact_mod_cast h2
  have hN8 : 8 ≤ P.card := by omega
  have hσpos : 0 < sigmaP P := sigmaP_pos_of_two P (fun p hp => (hP p hp).1) (by omega)
  by_cases htriv : (2*(X:ℝ))^P.card ≤ Real.exp (eps*R)
  · have hsub : (Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R ∧ HasDominantLabel X P a ρ))
        ⊆ Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R) := by
      intro a ha; rw [Finset.mem_filter] at ha ⊢; exact ⟨ha.1, ha.2.1⟩
    have hle : ((Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R ∧ HasDominantLabel X P a ρ)).card : ℝ)
        ≤ (2*(X:ℝ))^P.card := by
      refine le_trans (Nat.cast_le.mpr (Finset.card_le_card hsub)) ?_
      exact LocalEnergy.levelset_card_le_pow X P (fun p hp => (hP p hp).2.2) R
    have hRHS : Real.exp (eps*R) ≤ Real.exp (eps*R) * (1 + (10/(1-ρ)) * Real.sqrt R / sigmaP P) := by
      have hnn : (0:ℝ) ≤ (10/(1-ρ)) * Real.sqrt R / sigmaP P := by positivity
      nlinarith [Real.exp_pos (eps*R), hnn]
    linarith [le_trans hle htriv]
  · push Not at htriv
    have hRtriv : eps*R < (P.card:ℝ)*Real.log (2*X) := by
      have h1 : Real.exp (eps*R) < (2*(X:ℝ))^P.card := htriv
      have h2 := Real.log_lt_log (Real.exp_pos _) h1
      rw [Real.log_exp, Real.log_pow] at h2
      linarith
    have hN2X : P.card ≤ 2*X := RequestProject.card_le_upper_bound_of_pos P (2 * X)
      (fun p hp => (hP p hp).1.pos) (fun p hp => (hP p hp).2.2)
    have hRpoly := HRpoly X P.card R hXr hR1 (by omega) hN2X hN hRtriv
    have hLNX := dominant_label_linear_bound X hX1 P hP (by omega) ρ hρ hρ4 R (by linarith) hRpoly
    set L := (5/(1-ρ)) * Real.sqrt R / sigmaP P with hLdef
    have hL0 : 0 ≤ L := by rw [hLdef]; positivity
    set Mlab : Finset ℤ := Finset.Icc (-⌊L⌋) ⌊L⌋ with hMdef
    set fib : ℤ → Finset (BlockAssignment P) := fun m =>
      Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R ∧
        (1-ρ)*(P.card:ℝ) ≤ ((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).card:ℝ)) with hfibdef
    have hcover : (Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R ∧ HasDominantLabel X P a ρ))
        ⊆ Mlab.biUnion fib := by
      intro a ha
      rw [Finset.mem_filter] at ha
      obtain ⟨_, hQ, m0, hm0abs, hm0class⟩ := ha
      have hrange := dominant_label_bound X hX16' P hP hN8 ρ hρ hρ4 a m0 R hm0abs hm0class hQ
      rw [← hLdef] at hrange
      rw [Finset.mem_biUnion]
      refine ⟨m0, ?_, ?_⟩
      · rw [hMdef, Finset.mem_Icc]
        refine ⟨?_, ?_⟩
        · rw [neg_le, Int.le_floor]; push_cast; linarith [(abs_le.mp hrange).1]
        · rw [Int.le_floor]; exact (abs_le.mp hrange).2
      · rw [hfibdef, Finset.mem_filter]; exact ⟨Finset.mem_univ _, hQ, hm0class⟩
    have hfibcard : ∀ m ∈ Mlab, ((fib m).card : ℝ) ≤ Real.exp (eps*R) := by
      intro m hm
      rw [hMdef, Finset.mem_Icc] at hm
      have hm1 : -(⌊L⌋:ℝ) ≤ (m:ℝ) := by exact_mod_cast hm.1
      have hm2 : (m:ℝ) ≤ (⌊L⌋:ℝ) := by exact_mod_cast hm.2
      have hLfL : (⌊L⌋:ℝ) ≤ L := Int.floor_le L
      have hmabs : |(m:ℝ)| ≤ (P.card:ℝ)*X/16 := by
        rw [abs_le]; constructor <;> [linarith [hm1, hLfL, hLNX]; linarith [hm2, hLfL, hLNX]]
      set Hr := 2^15*R*(X:ℝ)^2/((1-ρ)*(P.card:ℝ)^3) with hHrdef
      have hHr0 : (0:ℝ) ≤ Hr := by rw [hHrdef]; positivity
      have hfsub : fib m ⊆ Finset.univ.filter (fun a : BlockAssignment P =>
          (P.attach.filter (fun q => a q ≠ ((m:ℤ):ZMod (q:ℕ)))).card ≤ ⌊Hr⌋₊) := by
        intro a ha
        rw [hfibdef, Finset.mem_filter] at ha
        obtain ⟨_, hQa, hclassa⟩ := ha
        have hcb := dominant_exception_count_bound X hX16' P hP hN32 ρ hρ hρ4 a m R hR1 hQa hmabs hclassa
        rw [← hHrdef] at hcb
        rw [Finset.mem_filter]
        exact ⟨Finset.mem_univ _, Nat.le_floor hcb⟩
      calc ((fib m).card : ℝ)
          ≤ ((Finset.univ.filter (fun a : BlockAssignment P =>
              (P.attach.filter (fun q => a q ≠ ((m:ℤ):ZMod (q:ℕ)))).card ≤ ⌊Hr⌋₊)).card : ℝ) := by
            exact_mod_cast Finset.card_le_card hfsub
        _ ≤ ∑ e ∈ Finset.range (⌊Hr⌋₊+1), (Nat.choose P.card e : ℝ) * (2*(X:ℝ))^e :=
            dominant_assignment_encoding_bound X hX1 P hP m ⌊Hr⌋₊
        _ ≤ Real.exp (eps*R) := Hent X P.card ⌊Hr⌋₊ R hXe hR1 (by omega) hN2X hN (by rw [hHrdef]; exact Nat.floor_le hHr0)
    have hfn : (0:ℤ) ≤ ⌊L⌋ := Int.floor_nonneg.mpr hL0
    have hMc : (Mlab.card:ℝ) = 2*(⌊L⌋:ℝ)+1 := by
      rw [hMdef, Int.card_Icc, show (⌊L⌋ + 1 - -⌊L⌋) = 2*⌊L⌋+1 by ring]
      have h1 : ((2*⌊L⌋+1).toNat : ℤ) = 2*⌊L⌋+1 := Int.toNat_of_nonneg (by linarith)
      calc (((2*⌊L⌋+1).toNat : ℕ) : ℝ) = (((2*⌊L⌋+1).toNat : ℤ) : ℝ) := by push_cast; ring
        _ = ((2*⌊L⌋+1 : ℤ) : ℝ) := by rw [h1]
        _ = 2*(⌊L⌋:ℝ)+1 := by push_cast; ring
    have hMcard : (Mlab.card:ℝ) ≤ 1 + (10/(1-ρ)) * Real.sqrt R / sigmaP P := by
      rw [hMc]
      have hLfL : (⌊L⌋:ℝ) ≤ L := Int.floor_le L
      rw [hLdef] at hLfL
      have heq : (10/(1-ρ)) * Real.sqrt R / sigmaP P = 2*((5/(1-ρ)) * Real.sqrt R / sigmaP P) := by ring
      rw [heq]; linarith [hLfL]
    calc ((Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R ∧ HasDominantLabel X P a ρ)).card : ℝ)
        ≤ ((Mlab.biUnion fib).card : ℝ) := by exact_mod_cast Finset.card_le_card hcover
      _ ≤ (∑ m ∈ Mlab, (fib m).card : ℝ) := by exact_mod_cast Finset.card_biUnion_le
      _ ≤ ∑ m ∈ Mlab, Real.exp (eps*R) := by
          exact Finset.sum_le_sum (fun m hm => hfibcard m hm)
      _ = (Mlab.card : ℝ) * Real.exp (eps*R) := by rw [Finset.sum_const, nsmul_eq_mul]
      _ ≤ Real.exp (eps * R) * (1 + (10/(1-ρ)) * Real.sqrt R / sigmaP P) := by
          rw [mul_comm]
          exact mul_le_mul_of_nonneg_left hMcard (Real.exp_pos _).le



end LocalEnergy
