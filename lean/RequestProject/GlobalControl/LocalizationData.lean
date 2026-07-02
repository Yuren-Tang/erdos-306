import RequestProject.GlobalControl.BoundaryPenalty
import RequestProject.GlobalControl.MainArc

/-!
# Localization data

The control-energy floor, diagonal sector, and elementary comparisons with the global control energy.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## Localization definitions -/

/-- The control-energy floor: the smaller of the forcing floor `Rw c2 k0`
and the boundary penalty floor `Π(e0,k0)` at the first block. -/
def globalControlFloor (BS : BlockSystem) (c2 e0 : ℝ) : ℝ :=
  min (Rw c2 BS.k0) (Pifloor BS e0 BS.k0)

/-- The "diagonal sector": globally diagonal with a label outside the main-arc
window and *exact* quadratic control energy `m² σ²`. -/
def diagSector (BS : BlockSystem) (C : ℝ) (a : GlobalAssignment BS) : Prop :=
  ∃ m : ℤ,
    (∀ p : {p : ℕ // p ∈ blockSupport BS}, (a p : ZMod p.1) = (m : ZMod p.1)) ∧
    C / sigmaCtrl BS < |(m : ℝ)| ∧
    Qctrl BS a = (m : ℝ) ^ 2 * (sigmaCtrl BS) ^ 2

/-! ## Energy bookkeeping: single block / bipartite energies are `≤ Qctrl` -/

/-
The internal energy of a single block is at most the global control energy.
-/
lemma blockEnergy_le_Qctrl (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ)
    (hk : k ∈ Finset.Icc BS.k0 BS.K) :
    blockEnergy BS a k ≤ Qctrl BS a := by
  refine' le_trans _ ( GlobalControl.energy_splits BS a |> le_trans ( le_add_of_nonneg_right _ ) );
  · exact Finset.single_le_sum ( fun x _ => show 0 ≤ QP ( BS.P x ) ( restrict BS a x ) from Finset.sum_nonneg fun _ _ => sq_nonneg _ ) hk;
  · exact Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _

/-
The bipartite cross-energy at level `k` is at most the global control energy.
-/
lemma Xen_le_Qctrl (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ)
    (hk : k ∈ Finset.Ico BS.k0 BS.K) :
    Xen BS a k ≤ Qctrl BS a := by
  refine' le_trans _ ( GlobalControl.energy_splits BS a |> le_trans ( le_add_of_nonneg_left _ ) );
  · exact Finset.single_le_sum ( fun x hx => Finset.sum_nonneg fun y hy => sq_nonneg _ ) hk |> le_trans ( by rfl );
  · exact Finset.sum_nonneg fun _ _ => QP_nonneg _ _

end GlobalControl

end

