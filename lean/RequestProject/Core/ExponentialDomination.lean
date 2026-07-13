import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity

/-!
# Exponential domination thresholds

The common asymptotic mechanism behind natural-number scale choices: every
constant multiple of a fixed power of the scale is eventually dominated by
`2 ^ k`.
-/

namespace RequestProject

/-- For every real coefficient and fixed degree, `A * k ^ d` is eventually at
most `2 ^ k` along the natural numbers. -/
lemma exists_threshold_mul_pow_le_two_pow (A : ℝ) (d : ℕ) :
    ∃ K : ℕ, ∀ k : ℕ, K ≤ k → A * (k : ℝ) ^ d ≤ (2 : ℝ) ^ k := by
  set M : ℝ := max A 1 with hM
  have hM0 : (0 : ℝ) < M := lt_of_lt_of_le one_pos (le_max_right _ _)
  have ho : (fun n : ℕ => (n : ℝ) ^ d) =o[Filter.atTop] fun n : ℕ => (2 : ℝ) ^ n :=
    isLittleO_pow_const_const_pow_of_one_lt d one_lt_two
  obtain ⟨K, hK⟩ := Filter.eventually_atTop.mp
    (ho.def (show (0 : ℝ) < 1 / M by positivity))
  refine ⟨K, fun k hk => ?_⟩
  have h := hK k hk
  rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg (by positivity),
    abs_of_nonneg (by positivity)] at h
  calc
    A * (k : ℝ) ^ d ≤ M * (k : ℝ) ^ d :=
      mul_le_mul_of_nonneg_right (le_max_left _ _) (by positivity)
    _ ≤ M * (1 / M * (2 : ℝ) ^ k) := mul_le_mul_of_nonneg_left h hM0.le
    _ = (2 : ℝ) ^ k := by field_simp

end RequestProject
