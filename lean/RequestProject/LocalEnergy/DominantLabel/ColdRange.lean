import RequestProject.LocalEnergy.DominantLabel.Encoding
import RequestProject.LocalEnergy.DominantLabel.Threshold

/-!
# Dominant labels in the cold energy range

Below the nondominant threshold, every low-energy assignment has a dominant
label. The general label and exception estimates then become uniform bounds
throughout the cold range.
-/

open Finset

namespace LocalEnergy

open scoped Classical

/-! ## Low-energy level-set bound

The nondominant energy lower bound makes every assignment below
`c'X/log³X` dominant, where the dominant level-set estimate applies. -/

/-
**Corollary** (`29 §7`).  For `ε > 0` there are `c', X₀` so that for `X ≥ X₀`
    and all `R ≤ c'·X/log³X`,
    `#{a : QP P a ≤ R} ≤ exp(εR)·(1 + 20√R/σ_P)`.

    This directly combines `nondominant_energy_lower_bound` with
    `dominant_level_set_bound`.
-/
theorem low_energy_level_set_bound
    (eps : ℝ) (hε : 0 < eps) (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4) :
    ∃ (cp X0 : ℝ), 0 < cp ∧ 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X →
        ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1]
          (_hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X)
          (_hN : (X:ℝ)/(2 * Real.log X) ≤ P.card)
          (R : ℝ), 1 ≤ R → R ≤ cp * (X:ℝ) / (Real.log X)^3 →
            ((Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)).card : ℝ)
              ≤ Real.exp (eps * R) * (1 + 20 * Real.sqrt R / sigmaP P) := by
  obtain ⟨X0A, hX0A, HA⟩ := dominant_level_set_bound eps hε ρ hρ hρ4
  obtain ⟨c2, X0B, hc2, hX0B, HB⟩ := nondominant_energy_lower_bound ρ hρ hρ4
  use c2 / 2, max X0A X0B;
  refine' ⟨ by positivity, by positivity, fun X hX P hP hN R hR₁ hR₂ => _ ⟩;
  intro hR₃
  have h_dom : ∀ a : BlockAssignment P, QP P a ≤ hR₁ → HasDominantLabel X P a ρ := by
    intro a ha;
    contrapose! HB;
    refine' ⟨ X, _, P, hP, hN, R, a, hR₁, ha, HB, _ ⟩;
    · exact le_trans ( le_max_right _ _ ) hX;
    · grind;
  refine' le_trans _ ( le_trans ( HA X ( le_trans ( le_max_left _ _ ) hX ) P hN R hR₁ hR₂ ) _ );
  · exact_mod_cast Finset.card_le_card fun x hx => by aesop;
  · gcongr;
    · exact Real.sqrt_nonneg _;
    · rw [ div_le_iff₀ ] <;> linarith

/-
For a cold block
    (`R ≤ c₂·X/log³X`) the dominant-label exception set has *absolutely* bounded
    size `e0 = 2^18·c₂/(1-ρ)`, uniformly in `X ≥ X0`.  Corollary of
    `dominant_exception_count_bound` with the density `N ≥ X/(2 log X)` and the cold range
    inserted.
-/
lemma cold_exception_count_bound (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1 / 4)
    (c2 : ℝ) (hc2 : 0 < c2) :
    ∃ (e0 X0 : ℝ), 0 < e0 ∧ 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X →
        ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1],
          (∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X) →
          (X : ℝ) / (2 * Real.log X) ≤ P.card →
          ∀ (a : BlockAssignment P) (m : ℤ) (R : ℝ), 1 ≤ R →
          QP P a ≤ R → R ≤ c2 * X / (Real.log X) ^ 3 →
          |(m : ℝ)| ≤ (P.card : ℝ) * (X : ℝ) / 16 →
          (1 - ρ) * (P.card : ℝ) ≤ ((P.attach.filter
              (fun p => a p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) →
            ((P.attach.filter (fun q => a q ≠ ((m : ℤ) : ZMod (q : ℕ)))).card : ℝ) ≤ e0 := by
  obtain ⟨X0c, hX0c⟩ := RequestProject.eventually_const_mul_log_le_nat 64
  refine' ⟨ 2 ^ 18 * c2 / ( 1 - ρ ), Max.max X0c 16, _, _, _ ⟩ <;> norm_num;
  · exact div_pos ( by positivity ) ( by linarith );
  · intro X hX1 hX2 P _ hP hN a m R hR1 hQ hRcold hmsmall hclass
    have hN32 : 32 ≤ P.card := by
      exact_mod_cast ( by nlinarith [ hX0c.2 X hX1, show ( X : ℝ ) ≥ 16 by exact_mod_cast hX2, Real.log_pos ( show ( X : ℝ ) > 1 by exact_mod_cast by linarith ), mul_div_cancel₀ ( X : ℝ ) ( show ( 2 * Real.log X ) ≠ 0 by exact mul_ne_zero two_ne_zero <| ne_of_gt <| Real.log_pos <| show ( X : ℝ ) > 1 by exact_mod_cast by linarith ) ] : ( 32 : ℝ ) ≤ P.card );
    refine' le_trans _ ( _ : 2 ^ 15 * R * X ^ 2 / ( ( 1 - ρ ) * P.card ^ 3 ) ≤ _ );
    · convert dominant_exception_count_bound X hX2 P hP hN32 ρ hρ hρ4 a m R hR1 hQ hmsmall hclass using 1;
      exact fun p => by have := hP p p.2; exact ⟨ Nat.Prime.ne_zero this.1 ⟩ ;
    · rw [ div_le_div_iff₀ ] <;> try nlinarith [ show ( P.card : ℝ ) ≥ 32 by norm_cast ];
      · -- Substitute $N \geq X / (2 \log X)$ into the inequality.
        have hN_sub : (P.card : ℝ) ^ 3 ≥ (X / (2 * Real.log X)) ^ 3 := by
          exact pow_le_pow_left₀ ( by positivity ) hN 3;
        refine' le_trans _ ( mul_le_mul_of_nonneg_left ( mul_le_mul_of_nonneg_left hN_sub <| sub_nonneg.mpr <| by linarith ) <| by positivity );
        convert mul_le_mul_of_nonneg_right hRcold ( show 0 ≤ 2 ^ 15 * ( 1 - ρ ) * X ^ 2 by exact mul_nonneg ( mul_nonneg ( by norm_num ) ( by linarith ) ) ( by positivity ) ) using 1 ; ring;
        ring;
      · exact mul_pos ( by linarith ) ( by positivity )

/-
For a *cold* block
    (`R ≤ c₂·X/log³X`) with a dominant label `m`, the label is small:
    `|m| ≤ N·X/16`, uniformly in `X ≥ X0(c₂)`.  This feeds both `fixed_label_level_set_bound`
    / `cold_exception_count_bound` (which require `|m| ≤ N·X/16`) and the `hm`-type
    hypotheses of `GlobalControl.consecutive_block_mismatch_energy_lower_bound`.

    Proof: `dominant_label_bound` gives `|m| ≤ (5/(1-ρ))·√R/σ_P`; the cold range
    `R ≤ c₂·X/log³X` together with the density `N ≥ X/(2 log X)` implies the
    polynomial bound `R ≤ N⁴(1-ρ)²/(409600·X²)` for `X ≥ X0(c₂)` (a `K·log X ≤ X`
    threshold from `Core.Asymptotics`), and then `dominant_label_linear_bound`
    converts `(5/(1-ρ))·√R/σ_P ≤ N·X/16`.
-/
lemma cold_label_bound_with_divisor
    (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1 / 4) (D : ℝ) (hD : 0 < D)
    (c2 : ℝ) (_hc2 : 0 < c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X →
        ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1],
          (∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X) →
          (X : ℝ) / (2 * Real.log X) ≤ P.card →
          ∀ (a : BlockAssignment P) (m : ℤ) (R : ℝ), 1 ≤ R →
          |m| ≤ (X : ℤ) ^ 2 / 2 →
          (1 - ρ) * (P.card : ℝ) ≤ ((P.attach.filter
              (fun p => a p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) →
          QP P a ≤ R → R ≤ c2 * X / (Real.log X) ^ 3 →
            |(m : ℝ)| ≤ (P.card : ℝ) * (X : ℝ) / D := by
  -- Choose thresholds for the two log-vs-linear estimates used below.
  obtain ⟨X0K, hX0K_pos, hX0K⟩ := RequestProject.eventually_const_mul_log_le_nat
    (16 * (40 * D) ^ 2 * c2 / (1 - ρ)^2)
  obtain ⟨X0d, hX0d_pos, hX0d⟩ := RequestProject.eventually_const_mul_log_le_nat 64
  refine' ⟨ Max.max 16 ( Max.max X0K X0d ), _, _ ⟩;
  · positivity;
  · intro X hX P _ hP hN a m R hR hm hclass hQ hRcold
    have hN_ge_2 : 2 ≤ P.card := by
      have hN_ge_2 : (X : ℝ) / (2 * Real.log X) ≥ 2 := by
        rw [ ge_iff_le, le_div_iff₀ ] <;> norm_num at *;
        · linarith [ hX0d X hX.2.2 ];
        · exact Real.log_pos ( by norm_cast; linarith );
      exact_mod_cast hN_ge_2.trans hN
    have hN_ge_8 : 8 ≤ P.card := by
      rw [ div_le_iff₀ ] at hN <;> norm_num at *;
      · exact Nat.le_of_lt_succ <| by rw [ ← @Nat.cast_lt ℝ ] ; push_cast; nlinarith [ hX0d X hX.2.2, Real.log_pos <| show ( X : ℝ ) > 1 by norm_cast; linarith ] ;
      · exact Real.log_pos ( by norm_cast; linarith )
    have hlogX_pos : 0 < Real.log X := by
      exact Real.log_pos <| Nat.one_lt_cast.mpr <| by linarith [ show X ≥ 16 by exact_mod_cast le_trans ( le_max_left _ _ ) hX ] ;
    have hRpoly : R ≤ (P.card : ℝ)^4 * (1 - ρ)^2 / ((40 * D)^2 * X^2) := by
      have hRpoly : R ≤ c2 * X / (Real.log X)^3 ∧
          c2 * X / (Real.log X)^3 ≤
            (X / (2 * Real.log X))^4 * (1 - ρ)^2 / ((40 * D)^2 * X^2) := by
        have := hX0K X ( by linarith [ le_max_left 16 ( max X0K X0d ), le_max_right 16 ( max X0K X0d ), le_max_left X0K X0d, le_max_right X0K X0d ] );
        have hDsq : 0 < (40 * D) ^ 2 := pow_pos (mul_pos (by norm_num) hD) 2
        rw [ div_pow, div_mul_eq_mul_div, div_div, div_le_div_iff₀ ] <;>
          try positivity
        · rw [ div_mul_eq_mul_div, div_le_iff₀ ] at this <;> try nlinarith;
          exact ⟨ hRcold, by nlinarith [ show 0 < ( X : ℝ ) ^ 3 * Real.log X ^ 3 by exact mul_pos ( pow_pos ( Nat.cast_pos.mpr ( by linarith [ show X ≥ 16 by exact_mod_cast le_trans ( le_max_left _ _ ) hX ] ) ) 3 ) ( pow_pos hlogX_pos 3 ) ] ⟩;
        · exact mul_pos (pow_pos (mul_pos zero_lt_two hlogX_pos) 4)
            (mul_pos hDsq (sq_pos_of_pos (Nat.cast_pos.mpr
              (Nat.pos_of_ne_zero (by rintro rfl; norm_num at *)))))
      refine le_trans hRpoly.1 <| hRpoly.2.trans ?_;
      gcongr;
    convert dominant_label_bound X ( by norm_num at hX; linarith ) P hP hN_ge_8 ρ hρ hρ4 a m R ( by
      exact hm ) hclass hQ |> le_trans <| dominant_label_linear_bound_with_divisor X
        ( by norm_num at hX; linarith ) P hP hN_ge_2 ρ hρ hρ4 D R hD
        ( by positivity ) hRpoly using 1

/-- The standard `/16` cold-label bound. -/
lemma cold_label_bound (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1 / 4) (c2 : ℝ) (hc2 : 0 < c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X →
        ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1],
          (∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X) →
          (X : ℝ) / (2 * Real.log X) ≤ P.card →
          ∀ (a : BlockAssignment P) (m : ℤ) (R : ℝ), 1 ≤ R →
          |m| ≤ (X : ℤ) ^ 2 / 2 →
          (1 - ρ) * (P.card : ℝ) ≤ ((P.attach.filter
              (fun p => a p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) →
          QP P a ≤ R → R ≤ c2 * X / (Real.log X) ^ 3 →
            |(m : ℝ)| ≤ (P.card : ℝ) * (X : ℝ) / 16 := by
  simpa using cold_label_bound_with_divisor ρ hρ hρ4 16 (by norm_num) c2 hc2

end LocalEnergy
