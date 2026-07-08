import Mathlib

/-!
# Polynomial ≪ exponential thresholds

The single asymptotic mechanism behind every "`k₀` large enough" numeric fact in the R2
main-arc chase: for any real coefficient `A` and degree `d`, eventually `A·k^d ≤ 2^k`.
Consumers hold only an abstract threshold (a ledger field dominated by `BS.k0`); no decimal
witness escapes this file — and there is none even here, since the threshold comes from
Mathlib's polynomial-vs-exponential asymptotics rather than a hand-rolled induction with a
magic base.
-/

namespace CircleMethod

/-- Eventual exponential domination with an arbitrary real coefficient. -/
lemma exists_threshold_mul_pow_le_two_pow (A : ℝ) (d : ℕ) :
    ∃ K : ℕ, ∀ k : ℕ, K ≤ k → A * (k : ℝ) ^ d ≤ (2 : ℝ) ^ k := by
  set M : ℝ := max A 1 with hM
  have hM0 : (0 : ℝ) < M := lt_of_lt_of_le one_pos (le_max_right _ _)
  have ho : (fun n : ℕ => (n : ℝ) ^ d) =o[Filter.atTop] fun n : ℕ => (2 : ℝ) ^ n :=
    isLittleO_pow_const_const_pow_of_one_lt d one_lt_two
  obtain ⟨K, hK⟩ := Filter.eventually_atTop.mp (ho.def (show (0 : ℝ) < 1 / M by positivity))
  refine ⟨K, fun k hk => ?_⟩
  have h := hK k hk
  rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg (by positivity),
    abs_of_nonneg (by positivity)] at h
  calc A * (k : ℝ) ^ d ≤ M * (k : ℝ) ^ d :=
        mul_le_mul_of_nonneg_right (le_max_left _ _) (by positivity)
    _ ≤ M * (1 / M * (2 : ℝ) ^ k) := mul_le_mul_of_nonneg_left h hM0.le
    _ = (2 : ℝ) ^ k := by field_simp

end CircleMethod
