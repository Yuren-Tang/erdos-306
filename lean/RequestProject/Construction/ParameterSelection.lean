import RequestProject.Core.ExponentialDomination
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Analysis.SpecialFunctions.Log.Basic

open Finset BigOperators

noncomputable section

namespace CircleMethod

/-!
# Asymptotic parameter selection

These lemmas turn decay and eventual exponential domination into the concrete
cutoffs used by the circle-method construction. They depend only on scalar or
natural-number parameters, not on block systems or construction certificates.
-/

lemma exists_gaussian_tail_cutoff (Ctail c3 : ℝ) (b : ℕ) (hc3 : 0 < c3) :
    ∃ C : ℝ, 1 ≤ C ∧ (b : ℝ) * Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2) < c3 / 4 := by
  have h_exp_zero : Filter.Tendsto (fun C : ℝ => (b : ℝ) * Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2)) Filter.atTop (nhds 0) := by
    simpa using tendsto_const_nhds.mul ( Real.tendsto_exp_atBot.comp <| Filter.tendsto_atTop_atBot.mpr fun x => ⟨ |x| + 1, fun y hy => by cases abs_cases x <;> nlinarith ⟩ );
  exact Filter.eventually_atTop.mp ( h_exp_zero.eventually ( gt_mem_nhds <| by positivity ) ) |> fun ⟨ C, hC ⟩ ↦ ⟨ Max.max C 1, le_max_right _ _, hC _ <| le_max_left _ _ ⟩

lemma exists_dyadic_density_threshold (G : ℕ) :
    ∃ k0min : ℕ, ∀ k : ℕ, k0min ≤ k →
      (G : ℝ) ≤ (2 : ℝ) ^ k / (2 * Real.log ((2 : ℝ) ^ k)) := by
  -- We'll use that exponential functions grow faster than polynomial functions to find such a $k0min$.
  have h_exp_growth : Filter.Tendsto (fun k : ℕ => (2 : ℝ) ^ k / (2 * k * Real.log 2)) Filter.atTop Filter.atTop := by
    have h_exp_growth : Filter.Tendsto (fun k : ℕ => (2 : ℝ) ^ k / k) Filter.atTop Filter.atTop := by
      refine' Filter.tendsto_atTop_mono' _ _ tendsto_natCast_atTop_atTop;
      filter_upwards [ Filter.eventually_ge_atTop 8 ] with k hk using by rw [ le_div_iff₀ ( by positivity ) ] ; norm_cast; induction hk <;> norm_num [ Nat.pow_succ ] at * ; nlinarith;
    convert h_exp_growth.atTop_div_const ( show 0 < 2 * Real.log 2 by positivity ) using 2 ; ring;
  exact Filter.eventually_atTop.mp ( h_exp_growth.eventually_ge_atTop G ) |> fun ⟨ k0min, hk0min ⟩ ↦ ⟨ k0min, fun k hk ↦ by simpa [ Real.log_pow, mul_assoc, mul_comm, mul_left_comm ] using hk0min k hk ⟩

/-- A common bottom-scale threshold makes both residual-mass inequalities hold.
This is the only place where exponential growth is converted into the concrete
natural-number bounds needed by the mass-batch construction. -/
lemma exists_mass_batch_scale_threshold (G b : ℕ) :
    ∃ k0mass : ℕ, ∀ k : ℕ, k0mass ≤ k →
      2 * b * (b.primeFactors.card * G) < 3 * 2 ^ k ∧
      2 * b < 2 ^ k := by
  obtain ⟨K, hK⟩ := RequestProject.exists_threshold_mul_pow_le_const_pow
    ((2 * b * (b.primeFactors.card * G) + 2 * b + 1 : ℕ) : ℝ) 0 one_lt_two
  refine ⟨max K 1, fun k hk => ?_⟩
  have hkK : K ≤ k := (le_max_left K 1).trans hk
  have hk1 : 1 ≤ k := (le_max_right K 1).trans hk
  have hpow := hK k hkK
  norm_num at hpow
  have hpow_nat :
      2 * b * (b.primeFactors.card * G) + 2 * b + 1 ≤ 2 ^ k := by
    exact_mod_cast hpow
  have hmass_lt : 2 * b * (b.primeFactors.card * G) < 2 ^ k := by omega
  have hb_lt : 2 * b < 2 ^ k := by omega
  have hpow_one : 1 ≤ 2 ^ k := one_le_pow₀ (by omega)
  constructor
  · exact hmass_lt.trans (by omega)
  · exact hb_lt


end CircleMethod

end
