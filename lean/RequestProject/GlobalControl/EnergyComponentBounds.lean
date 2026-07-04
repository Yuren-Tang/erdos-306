import RequestProject.GlobalControl.EnergyBudget

/-!
# Components of global control energy

Every internal block energy and every consecutive bipartite energy is bounded
by the global control energy of the assignment.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- The internal energy of a single block is at most the global control
energy. -/
lemma blockEnergy_le_Qctrl (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ)
    (hk : k ∈ Finset.Icc BS.k0 BS.K) :
    blockEnergy BS a k ≤ Qctrl BS a := by
  refine' le_trans _
    (GlobalControl.energy_splits BS a |> le_trans (le_add_of_nonneg_right _))
  · exact Finset.single_le_sum
      (fun x _ => show 0 ≤ QP (BS.P x) (restrict BS a x) from
        Finset.sum_nonneg fun _ _ => sq_nonneg _) hk
  · exact Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _

/-- The bipartite cross-energy at level `k` is at most the global control
energy. -/
lemma Xen_le_Qctrl (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ)
    (hk : k ∈ Finset.Ico BS.k0 BS.K) :
    Xen BS a k ≤ Qctrl BS a := by
  refine' le_trans _
    (GlobalControl.energy_splits BS a |> le_trans (le_add_of_nonneg_left _))
  · exact Finset.single_le_sum
      (fun x _ => Finset.sum_nonneg fun y _ => sq_nonneg _) hk |> le_trans (by rfl)
  · exact Finset.sum_nonneg fun _ _ => QP_nonneg _ _

end GlobalControl

end
