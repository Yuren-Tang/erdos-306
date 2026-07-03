import RequestProject.GlobalControl.LevelSetParameters
import RequestProject.GlobalPeierlsBookkeeping

/-!
# Entropy bound for charged subsets

A family of subsets with bounded total nonnegative weight has an exponentially
bounded partition sum. This is the abstract charge estimate used for both hot
and boundary block sets.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- Generic charge-sum bound: summing the per-element charge `exp(ε·w j)` over
    all weight-`≤R` subsets is `≤ exp(2εR)·exp(numBlocks)`, via
    `weighted_subset_entropy` (with `ε' = 4ε`).  Instantiated for the hot
    (`w = Rw`) and boundary (`w = Pifloor`) charges. -/
lemma sum_subset_charge_le (BS : BlockSystem) (w : ℕ → ℝ) (R eps : ℝ)
    (heps : 0 < eps) (hw : ∀ j ∈ Finset.Icc BS.k0 BS.K, 0 ≤ w j) :
    (∑ S ∈ (Finset.Icc BS.k0 BS.K).powerset.filter (fun S => ∑ j ∈ S, w j ≤ R),
        ∏ j ∈ S, Real.exp (eps * w j))
      ≤ Real.exp (2 * eps * R) * Real.exp (numBlocks BS) := by
  have hcb : ∀ j ∈ Finset.Icc BS.k0 BS.K,
      Real.exp (eps * w j) ≤ Real.exp (4 * eps * w j / 4) :=
    fun j _ => le_of_eq (by congr 1; ring)
  have hwse := GlobalPeierls.weighted_subset_entropy (Finset.Icc BS.k0 BS.K) w
    (fun j => Real.exp (eps * w j)) (4 * eps) R (by linarith)
    (fun _ _ => Real.exp_nonneg _) hcb
  refine le_trans hwse ?_
  refine mul_le_mul (Real.exp_le_exp.mpr (le_of_eq (by ring)))
    (Real.exp_le_exp.mpr ?_) (Real.exp_nonneg _) (Real.exp_nonneg _)
  calc (∑ j ∈ Finset.Icc BS.k0 BS.K, Real.exp (-(4 * eps) * w j / 4))
      ≤ ∑ _j ∈ Finset.Icc BS.k0 BS.K, (1 : ℝ) :=
        Finset.sum_le_sum (fun j hj =>
          Real.exp_le_one_iff.mpr (by nlinarith [hw j hj, heps]))
    _ = (numBlocks BS : ℝ) := by
        rw [Finset.sum_const, nsmul_eq_mul, mul_one, Nat.card_Icc]
        norm_cast

end GlobalControl

end

