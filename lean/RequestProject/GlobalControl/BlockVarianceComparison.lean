import RequestProject.GlobalControl.BlockRestriction
import RequestProject.GlobalControl.ControlEnergy
import RequestProject.LocalEnergy.CRTModel

/-!
# Comparison of local and global deviations

The reciprocal-square sum for an internal prime block embeds in the global
control-pair sum, so every block deviation is bounded by the global deviation.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## Comparison with block deviations -/

/-
Reindexing the internal block deviation sum: the subtype-encoded
    `orderedPrimePairsA (BS.P k)` and the `ℕ×ℕ`-encoded `internalPairs BS k`
    carry the same `1/(p·q)²` sum.
-/
lemma sigmaP_sq_eq_internal (BS : BlockSystem) (k : ℕ) :
    (∑ pq ∈ orderedPrimePairsA (BS.P k),
        (1 : ℝ) / ((pq.1.1 : ℝ) * pq.2.1) ^ 2)
      = ∑ pq ∈ internalPairs BS k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 := by
  refine' Finset.sum_bij _ _ _ _ _;
  use fun a ha => ( a.1.1, a.2.1 );
  · unfold orderedPrimePairsA internalPairs; aesop;
  · grind +qlia;
  · unfold internalPairs orderedPrimePairsA; aesop;
  · grind +splitIndPred

/-- Every internal block deviation is bounded by the global control
deviation. -/
lemma sigmaP_block_le (BS : BlockSystem) (k : ℕ) (hk1 : BS.k0 ≤ k) (hk2 : k ≤ BS.K) :
    sigmaP (BS.P k) ≤ sigmaCtrl BS := by
  refine Real.sqrt_le_sqrt ?_;
  have h_subset : Finset.image (fun pq => (pq.1.1, pq.2.1)) (orderedPrimePairsA (BS.P k)) ⊆ ctrlPairs BS := by
    intro pq hpq
    simp [ctrlPairs] at *;
    rcases hpq with ⟨ a, ha, b, ⟨ hb, h ⟩, rfl ⟩ ; exact Or.inl ⟨ k, ⟨ hk1, hk2 ⟩, by unfold orderedPrimePairsA at h; unfold internalPairs; aesop ⟩ ;
  refine' le_trans _ ( Finset.sum_le_sum_of_subset_of_nonneg h_subset fun _ _ _ => by positivity );
  rw [ Finset.sum_image ] ; aesop

end GlobalControl

end

