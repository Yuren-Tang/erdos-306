import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Tactic.NormNum.RealSqrt
import RequestProject.Core.Asymptotics
import RequestProject.LocalEnergy.DominantLabel.Covering

/-!
# Nondominant energy threshold

Low- and high-cutoff estimates convert the covering dichotomy into the uniform nondominant energy lower bound.
-/

open Finset

namespace LocalEnergy

open scoped Classical

private lemma exists_logarithmic_threshold (K : ℝ) :
    ∃ X0 : ℝ, 0 < X0 ∧ ∀ X : ℕ, X0 ≤ X → K ≤ (X:ℝ)/Real.log X := by
  simpa using RequestProject.eventually_le_natCast_div_log_pow 1 K

/-
**Left-disjunct chase.**  Pure algebra: the large-energy disjunct of the
covering dichotomy forces `R ≳ X/log³X`.
-/
/-- A cutoff with scale coefficient `kappa` and comparison loss `lambda`
transfers an energy lower bound into a quadratic lower bound with the single
combined loss `kappa * lambda`.  This is the parameter mechanism behind the
left branch of the covering dichotomy; numerical choices belong only in its
specialization. -/
private lemma cutoff_energy_quadratic_lower_bound
    (energy kappa lambda rho R x N : ℝ)
    (hkappa : 0 < kappa) (hlambda : 0 < lambda) (hrho : 0 < rho)
    (hx : 0 < x) (hN : 0 < N)
    (h : energy * rho ^ 4 * N ^ 4 / (lambda * x ^ 2) ≤
      (kappa / rho) * R ^ 2 * x ^ 2 / N ^ 2) :
    energy * rho ^ 5 * N ^ 6 / (kappa * lambda * x ^ 4) ≤ R ^ 2 := by
  field_simp at h ⊢
  nlinarith

private lemma low_cutoff_energy_bound (cE ρ : ℝ) (hcE0 : 0 < cE) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4)
    (X : ℕ) (N R u : ℝ)
    (hlogX : 0 < Real.log X) (hN : (X:ℝ)/(2*Real.log X) ≤ N) (hNpos : 0 < N)
    (hR0 : 0 < R) (hu0 : 0 ≤ u)
    (husq : u^2 = (256/ρ)*R*(X:ℝ)^2/N^2)
    (hRle : R ≤ cE*ρ^4*(X:ℝ)^2/(8192*(Real.log X)^4))
    (hdisj : cE*(ρ*N/2)^4/(2*(X:ℝ)^2*(2*u+2)^2) ≤ R) :
    ρ^2 * Real.sqrt (cE*ρ) / (10^6) * (X:ℝ)/(Real.log X)^3 ≤ R := by
  -- From hN: N^4 ≥ (X/(2 log X))^4 = X^4/(16*(log X)^4), so T ≥ cE*ρ^4*X^2/(4096*(log X)^4) = 2*(cE*ρ^4*X^2/(8192*(log X)^4)) ≥ 2*R (by hRle). So R ≤ T/2.
  set T := cE * ρ^4 * N^4 / (256 * X^2)
  have hT : T ≥ 2 * R := by
    have hT' : N^4 ≥ X^4 / (16 * (Real.log X)^4) := by
      exact le_trans ( by rw [ div_pow ] ; ring_nf; norm_num ) ( pow_le_pow_left₀ ( by positivity ) hN 4 );
    by_cases hX : X = 0 <;> simp_all +decide [ div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm ];
    rw [ le_div_iff₀ ] <;> first | positivity | nlinarith [ show 0 < cE * ρ ^ 4 by positivity ] ;
  -- So (256/ρ)*R^2*X^2/N^2 ≥ T/2 = cE*ρ^4*N^4/(512*X^2).
  have hR2 : (256 / ρ) * R^2 * X^2 / N^2 ≥ cE * ρ^4 * N^4 / (512 * X^2) := by
    have hR2 : cE * ρ^5 * N^6 / 16 ≤ 16 * 256 * R^2 * X^4 + 16 * ρ * R * X^2 * N^2 := by
      have hR2 : cE * ρ^5 * N^6 / 16 ≤ 2 * X^2 * (2 * u + 2)^2 * R * ρ * N^2 := by
        rw [ div_le_iff₀ ] at hdisj;
        · nlinarith [ show 0 < ρ * N ^ 2 by positivity ];
        · exact mul_pos ( mul_pos two_pos ( sq_pos_of_pos ( Nat.cast_pos.mpr ( Nat.pos_of_ne_zero ( by rintro rfl; norm_num at * ) ) ) ) ) ( sq_pos_of_pos ( by positivity ) );
      have hR2 : (2 * u + 2)^2 ≤ 4 * (u^2 + 1) * 2 := by
        nlinarith only [ sq_nonneg ( u - 1 ), hu0 ];
      rw [ husq ] at hR2;
      field_simp at hR2;
      nlinarith [ show 0 < ρ * N ^ 2 by positivity, show 0 < R * X ^ 2 by exact mul_pos hR0 ( sq_pos_of_pos ( Nat.cast_pos.mpr ( Nat.pos_of_ne_zero ( by rintro rfl; norm_num at * ) ) ) ) ];
    rw [ ge_iff_le, div_le_div_iff₀ ] <;> try positivity;
    · rw [ ge_iff_le, le_div_iff₀ ] at hT;
      · field_simp at *;
        nlinarith [ show 0 < ρ * N ^ 2 by positivity ];
      · exact mul_pos ( by norm_num ) ( sq_pos_of_pos ( Nat.cast_pos.mpr ( Nat.pos_of_ne_zero ( by rintro rfl; norm_num at * ) ) ) );
    · exact mul_pos ( by norm_num ) ( sq_pos_of_pos ( Nat.cast_pos.mpr ( Nat.pos_of_ne_zero ( by rintro rfl; norm_num at * ) ) ) );
  have hX_pos : (0 : ℝ) < X :=
    zero_lt_one.trans ((Real.log_pos_iff (Nat.cast_nonneg X)).mp hlogX)
  -- The numerical cutoff and comparison losses enter only through their product.
  have hR2_sq : R^2 ≥ cE * ρ^5 * N^6 / ((256 * 512) * X^4) :=
    cutoff_energy_quadratic_lower_bound cE 256 512 ρ R X N
      (by norm_num) (by norm_num) hρ hX_pos hNpos hR2
  -- Substitute only the density estimate `N ≥ X/(2 log X)`.
  have hR2_sq_final : R^2 ≥
      cE * ρ^5 * X^2 / ((64 * 256 * 512) * (Real.log X)^6) := by
    -- From hN: N^6 ≥ (X/(2 log X))^6 = X^6/(64*(log X)^6).
    have hN6 : N^6 ≥ X^6 / (64 * (Real.log X)^6) := by
      exact le_trans ( by rw [ div_pow ] ; ring_nf; norm_num ) ( pow_le_pow_left₀ ( by positivity ) hN 6 );
    refine le_trans ?_ hR2_sq;
    convert mul_le_mul_of_nonneg_left hN6
      (show 0 ≤ cE * ρ ^ 5 / ((256 * 512) * X ^ 4) by positivity) using 1 ; ring_nf;
    · grind;
    · ring;
  refine' le_of_pow_le_pow_left₀ ( by positivity ) ( by positivity ) ( le_trans _ hR2_sq_final );
  field_simp;
  rw [ Real.sq_sqrt ( by positivity ) ] ; nlinarith [ show 0 ≤ ρ * cE * X ^ 2 by positivity ]

/-
**Right-disjunct chase.**  Pure algebra: the tiny-mass disjunct of the covering
    dichotomy forces `R ≳ X/log³X`.
-/
private lemma high_cutoff_energy_bound (ρ : ℝ) (hρ : 0 < ρ) (_hρ4 : ρ ≤ 1/4)
    (X : ℕ) (N R u : ℝ)
    (hlogX : 0 < Real.log X) (hN : (X:ℝ)/(2*Real.log X) ≤ N) (hNpos : 0 < N)
    (_hR0 : 0 < R) (_hu0 : 0 ≤ u)
    (husq : u^2 = (256/ρ)*R*(X:ℝ)^2/N^2)
    (hbigN : 2304/ρ ≤ N)
    (hdisj : ρ*N/4 < (2*u+2)*(32*(u+1)+8)) :
    ρ^2 / (64 * (9 * 8192)) * (X:ℝ)/(Real.log X)^3 ≤ R := by
  rw [ div_le_iff₀ ( by positivity ) ] at *;
  have h_combined : ρ^2 * N^3 / 8 < (9 * 8192) * R * X^2 := by
    field_simp at *;
    nlinarith [ sq_nonneg ( u - 1 ), mul_le_mul_of_nonneg_left hbigN hρ.le, mul_le_mul_of_nonneg_left hbigN hNpos.le ];
  have h_combined : N^3 ≥ X^3 / (8 * (Real.log X)^3) := by
    rw [ ge_iff_le, div_le_iff₀ ];
    · convert pow_le_pow_left₀ ( by positivity ) hN 3 using 1 ; ring;
    · positivity;
  rw [ ge_iff_le, div_le_iff₀ ] at h_combined <;> nlinarith [ pow_pos hlogX 3 ]

/-
**Get the dichotomy in `u = B/X` form.**  Picks the base point `p0` and threshold
    `B = √(A²R)·X²/N` (so the exception count is `≤ ρN/8`), and packages the covering
    dichotomy with `u := B/X`.
-/
private lemma nondominant_energy_dichotomy
    (X : ℕ) (hX : 1 ≤ X) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (hcard2 : 2 ≤ P.card)
    (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4)
    (a : BlockAssignment P) (hnd : ¬ HasDominantLabel X P a ρ)
    (R : ℝ) (hR0 : 0 < R) (hQ : QP P a ≤ R)
    (hAR : (256/ρ)*R ≤ ((P.card:ℝ))^2/16)
    (h1 : 1 ≤ ρ*(P.card:ℝ)/8)
    (cE : ℝ) (hcE0 : 0 < cE)
    (hcE : ∀ (Y : ℕ) (Q : Finset ℕ) [∀ p : Q, NeZero p.1]
        (b : BlockAssignment Q) (n n' : ℤ) (D : ℝ),
        n ≠ n' → |(n:ℝ)| ≤ D → |(n':ℝ)| ≤ D → D ≤ (Y:ℝ)^2/4 →
        ∀ (C C' : Finset Q),
          (∀ p ∈ C, Nat.Prime (p:ℕ) ∧ Y ≤ (p:ℕ) ∧ (p:ℕ) ≤ 2*Y) →
          (∀ q ∈ C', Nat.Prime (q:ℕ) ∧ Y ≤ (q:ℕ) ∧ (q:ℕ) ≤ 2*Y) →
          Disjoint C C' →
          (32 * (D/Y + 1) : ℝ) ≤ C.card → (8:ℝ) ≤ C'.card →
          (∀ p ∈ C, b p = ((n : ℤ) : ZMod (p:ℕ))) →
          (∀ q ∈ C', b q = ((n' : ℤ) : ZMod (q:ℕ))) →
          cE * (C.card : ℝ)^3 * C'.card / (Y:ℝ)^2 ≤
            ∑ p ∈ C, ∑ q ∈ C',
              ((crtRepr (p:ℕ) (q:ℕ) (b p) (b q) : ℝ) / ((p:ℕ) * (q:ℕ)))^2) :
    ∃ u : ℝ, 0 ≤ u ∧ u^2 = (256/ρ)*R*(X:ℝ)^2/(P.card:ℝ)^2 ∧
      (cE*(ρ*(P.card:ℝ)/2)^4/(2*(X:ℝ)^2*(2*u+2)^2) ≤ R ∨
        ρ*(P.card:ℝ)/4 < (2*u+2)*(32*(u+1)+8)) := by
  refine' ⟨ Real.sqrt ( 256 / ρ * R * X ^ 2 / P.card ^ 2 ), _, _, _ ⟩;
  · positivity;
  · rw [ Real.sq_sqrt ( by positivity ) ];
  · obtain ⟨p0, hp0mem, hp0⟩ : ∃ p0 : P, p0 ∈ P.attach ∧ ((P.attach.filter (fun q => q ≠ p0 ∧ Real.sqrt ((256 / ρ) * R) * (X : ℝ) ^ 2 / P.card < |(crtRepr p0.1 q.1 (a p0) (a q) : ℝ)|)).card : ℝ) ≤ ρ * P.card / 8 := by
      have := exists_sparse_crt_basepoint X hX P hP (by linarith) a R hR0.le hQ (Real.sqrt ((256 / ρ) * R) * (X : ℝ) ^ 2 / P.card) (by
      positivity);
      convert this using 4;
      field_simp;
      rw [ Real.sq_sqrt ( by positivity ), mul_div_cancel₀ _ ( by positivity ) ] ; ring;
    convert label_covering_energy_dichotomy X hX P hP hcard2 ρ hρ hρ4 a hnd R hR0 hQ p0 ( Real.sqrt ( 256 / ρ * R ) * X ^ 2 / P.card ) _ _ _ _ cE hcE0 hcE using 2 <;> norm_num [ hR0.le, hρ.le, hX ];
    any_goals assumption;
    · field_simp;
    · field_simp;
    · positivity;
    · rw [ div_le_iff₀ ];
      · convert mul_le_mul_of_nonneg_left ( Real.sqrt_le_sqrt hAR ) ( show ( 0 : ℝ ) ≤ X ^ 2 by positivity ) using 1 ; ring_nf;
        · norm_num [ hρ.le, hR0.le ] ; ring;
        · norm_num ; ring;
      · positivity;
    · convert hp0 using 4 ; norm_num [ div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm, hR0.le, hρ.le ]

/-
For `X ≥ 3`, `1 ≤ Real.log X`.
-/
private lemma one_le_log_of_large (X : ℕ) (hX : 3 ≤ X) : 1 ≤ Real.log X := by
  exact Real.le_log_iff_exp_le ( by positivity ) |>.2 ( Real.exp_one_lt_d9.le.trans ( by norm_num; linarith [ show ( X : ℝ ) ≥ 3 by norm_cast ] ) )

/-
When `1 ≤ Real.log X`, `X/ log X ≤ X· log X`.
-/
private lemma self_div_log_le_self (X : ℕ) (h : 1 ≤ Real.log X) :
    (X:ℝ)/Real.log X ≤ (X:ℝ)*Real.log X := by
  rw [ div_le_iff₀ ] <;> nlinarith [ show ( X : ℝ ) ≥ 1 by exact Nat.one_le_cast.mpr ( Nat.pos_of_ne_zero ( by rintro rfl; norm_num at h ) ), mul_le_mul_of_nonneg_left h ( show ( 0 : ℝ ) ≤ X by positivity ) ]

/-
Combine `R ≤ c2·X/log³X` with the threshold `64·A²·c2 ≤ X·log X` to get `A²R ≤ N²/16`.
-/
private lemma nondominant_cutoff_range_bound (ρ c2 : ℝ) (hρ : 0 < ρ) (_hc2 : 0 ≤ c2)
    (X : ℕ) (N R : ℝ) (hlog0 : 0 < Real.log X)
    (hN : (X:ℝ)/(2*Real.log X) ≤ N)
    (hR : R ≤ c2*(X:ℝ)/(Real.log X)^3)
    (hThr1 : 64*(256/ρ)*c2 ≤ (X:ℝ)*Real.log X) :
    (256/ρ)*R ≤ N^2/16 := by
  have hXpos : (0 : ℝ) < X :=
    zero_lt_one.trans ((Real.log_pos_iff (Nat.cast_nonneg X)).mp hlog0)
  refine le_trans ( mul_le_mul_of_nonneg_left hR ( by positivity ) ) ?_;
  rw [ ← mul_div_assoc, div_le_iff₀ ] at *;
  · ring_nf at *;
    nlinarith [ sq_nonneg ( N * Real.log X - X ), mul_le_mul_of_nonneg_left hN hlog0.le, mul_le_mul_of_nonneg_left hN hXpos.le, Real.log_le_sub_one_of_pos hXpos, Real.log_le_sub_one_of_pos hlog0 ];
  · positivity;
  · positivity

/-
Combine `R ≤ c2·X/log³X` with `8192·c2/(cEρ⁴) ≤ X/log X` to bound `R` by the
    case-B threshold.
-/
private lemma cutoff_energy_upper_bound (cE ρ c2 : ℝ) (hcE0 : 0 < cE) (hρ : 0 < ρ)
    (X : ℕ) (R : ℝ) (hlog0 : 0 < Real.log X)
    (hR : R ≤ c2*(X:ℝ)/(Real.log X)^3)
    (hThr2 : 8192*c2/(cE*ρ^4) ≤ (X:ℝ)/Real.log X) :
    R ≤ cE*ρ^4*(X:ℝ)^2/(8192*(Real.log X)^4) := by
  rw [ div_le_div_iff₀ ] at * <;> try positivity;
  rw [ le_div_iff₀ ] at * <;> nlinarith [ pow_pos hlog0 3, pow_pos hlog0 4 ]

/-
For `ρ ∈ (0,1/4]` and `X` large, any low-energy
    assignment that is **not** dominant forces `R ≫ X/log³X`.  Concretely there is
    `c₂ > 0` with: if `QP P a ≤ R` and `a` is not `ρ`-dominant then
    `R ≥ c₂ · X / (Real.log X)^3`.

    The covering construction produces `≥ 2` substantial classes; cross-label
    energy with the mass accounting (`M₂ ≥ ρN/2`) forces
    `R² ≫ N⁴/(X²log²X)`, i.e. `R ≫ N²/(X log X) ≫ X/log³X`.

    The argument decomposes into the covering helpers
    (`large_crt_pair_count`, `exists_sparse_crt_basepoint`, `crt_label_shortlist_bound`), the energy
    core (`class_partition_energy_lower_bound`, `crossLabel_energy_sum_le`), the covering
    dichotomy (`label_covering_energy_dichotomy`) with the mass accounting, and the
    parameter chase (`nondominant_energy_dichotomy`, `low_cutoff_energy_bound`,
    `high_cutoff_energy_bound`).
-/
theorem nondominant_energy_lower_bound
    (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4) :
    ∃ (c2 X0 : ℝ), 0 < c2 ∧ 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X →
        ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1]
          (_hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X)
          (_hN : (X:ℝ)/(2 * Real.log X) ≤ P.card)
          (a : BlockAssignment P) (R : ℝ),
          QP P a ≤ R → ¬ HasDominantLabel X P a ρ →
            c2 * (X:ℝ) / (Real.log X)^3 ≤ R := by
  revert ρ hρ hρ4;
  obtain ⟨cE, hcE0, hcE⟩ : ∃ cE : ℝ, 0 < cE ∧ ∀ (Y : ℕ) (Q : Finset ℕ) [∀ p : Q, NeZero p.1] (b : BlockAssignment Q) (n n' : ℤ) (D : ℝ), n ≠ n' → |(n:ℝ)| ≤ D → |(n':ℝ)| ≤ D → D ≤ (Y:ℝ)^2/4 → ∀ (C C' : Finset Q), (∀ p ∈ C, Nat.Prime (p:ℕ) ∧ Y ≤ (p:ℕ) ∧ (p:ℕ) ≤ 2*Y) → (∀ q ∈ C', Nat.Prime (q:ℕ) ∧ Y ≤ (q:ℕ) ∧ (q:ℕ) ≤ 2*Y) → Disjoint C C' → (32 * (D/Y + 1) : ℝ) ≤ C.card → (8:ℝ) ≤ C'.card → (∀ p ∈ C, b p = ((n : ℤ) : ZMod (p:ℕ))) → (∀ q ∈ C', b q = ((n' : ℤ) : ZMod (q:ℕ))) → cE * (C.card : ℝ)^3 * C'.card / (Y:ℝ)^2 ≤ ∑ p ∈ C, ∑ q ∈ C', ((crtRepr (p:ℕ) (q:ℕ) (b p) (b q) : ℝ) / ((p:ℕ) * (q:ℕ)))^2 := by
    apply crossLabel_energy_lower_bound;
  intro ρ hρ hρ4
  set c2 := min (ρ^2 * Real.sqrt (cE*ρ) / 10^6)
    (ρ^2 / (64 * (9 * 8192))) with hc2def
  have hc2pos : 0 < c2 := by
    exact lt_min ( by positivity ) ( by positivity )
  generalize_proofs at *;
  set K := max (max 4 (16/ρ)) (max (4608/ρ) (max (64*(256/ρ)*c2) (8192*c2/(cE*ρ^4)))) with hKdef
  obtain ⟨X0', hX0'0, hK⟩ := exists_logarithmic_threshold K
  use c2, ⌈X0'⌉₊ + 3, hc2pos, by positivity
  intro X hX P inst hP hN a R hQ hnd
  have hX3 : 3 ≤ X := by
    exact_mod_cast hX.trans' ( le_add_of_nonneg_left <| Nat.cast_nonneg _ )
  have hX1 : 1 ≤ X := by
    linarith
  generalize_proofs at *;
  have hlog1 : 1 ≤ Real.log X := by
    exact Real.le_log_iff_exp_le ( by positivity ) |>.2 ( by exact Real.exp_one_lt_d9.le.trans ( by norm_num; linarith [ show ( X : ℝ ) ≥ 3 by norm_cast ] ) )
  have hlog0 : 0 < Real.log X := by
    linarith
  have hXpos : (0:ℝ) < X := by positivity
  have hKX : K ≤ (X:ℝ)/Real.log X := by
    exact hK X ( by linarith [ Nat.le_ceil X0' ] )
  have hself := self_div_log_le_self X hlog1
  set N := (P.card:ℝ) with hNdef
  have hNK : K/2 ≤ N := by
    have h1 : K / 2 ≤ (X:ℝ)/(2*Real.log X) := by
      convert div_le_div_of_nonneg_right hKX zero_le_two using 1
      all_goals first | rfl | ring_nf
    generalize_proofs at *;
    linarith [hN]
  have hNpos : 0 < N := by
    exact lt_of_lt_of_le ( by positivity ) hNK
  have hcard2 : 2 ≤ P.card := by
    have h1 : K/2 ≥ 2 := by
      exact le_trans ( by norm_num ) ( div_le_div_of_nonneg_right ( le_max_left _ _ |> le_trans ( le_max_left _ _ ) ) zero_le_two )
    generalize_proofs at *;
    exact_mod_cast h1.trans hNK |> le_trans <| hNdef.le
  generalize_proofs at *;
  by_cases hRbig : c2 * (X:ℝ)/(Real.log X)^3 ≤ R;
  · exact hRbig;
  · have hRle' : R ≤ c2 * (X:ℝ)/(Real.log X)^3 := by
      exact le_of_not_ge hRbig
    have hR0 : 0 < R := by
      by_contra hRneg
      push Not at hRneg
      exact hnd (zero_label_dominant_of_large_class X hX1 P hP hcard2 a ρ hρ.le (le_antisymm (le_trans hQ hRneg) (QP_nonneg P a)))
    generalize_proofs at *;
    have hThr1 : 64*(256/ρ)*c2 ≤ (X:ℝ)*Real.log X := by
      grind +splitImp
    have hThr2 : 8192*c2/(cE*ρ^4) ≤ (X:ℝ)/Real.log X := by
      exact le_trans ( le_max_of_le_right <| le_max_of_le_right <| le_max_right _ _ ) hKX
    have hAR : (256/ρ)*R ≤ N^2/16 := by
      apply nondominant_cutoff_range_bound ρ c2 hρ hc2pos.le X N R hlog0 hN hRle' hThr1
    have h1 : 1 ≤ ρ*N/8 := by
      have h16 : 16 / ρ ≤ K := by
        exact le_max_of_le_left ( le_max_right _ _ )
      generalize_proofs at *;
      nlinarith [ mul_div_cancel₀ 16 hρ.ne' ]
    generalize_proofs at *;
    obtain ⟨u, hu0, husq, hdisj⟩ := nondominant_energy_dichotomy X hX1 P hP hcard2 ρ hρ hρ4 a hnd R hR0 hQ hAR h1 cE hcE0 hcE
    rcases hdisj with hL | hRgt
    · have hRle : R ≤ cE*ρ^4*(X:ℝ)^2/(8192*(Real.log X)^4) := cutoff_energy_upper_bound cE ρ c2 hcE0 hρ X R hlog0 hRle' hThr2
      have hcl := low_cutoff_energy_bound cE ρ hcE0 hρ hρ4 X N R u hlog0 hN hNpos hR0 hu0 husq hRle hL
      refine le_trans ?_ hcl
      have hcle : c2 ≤ ρ^2 * Real.sqrt (cE*ρ) / 10^6 := min_le_left _ _
      gcongr
    · have hbigN : 2304/ρ ≤ N := by
        grind
      have hcr := high_cutoff_energy_bound ρ hρ hρ4 X N R u hlog0 hN hNpos hR0 hu0 husq hbigN hRgt
      refine le_trans ?_ hcr
      have hcr2 : c2 ≤ ρ^2 / (64 * (9 * 8192)) := min_le_right _ _
      gcongr

end LocalEnergy
