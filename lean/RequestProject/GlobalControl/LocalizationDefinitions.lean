import RequestProject.GlobalControl.ControlEnergy
import RequestProject.GlobalControl.Encoding.BlockData

/-!
# Localization sectors

The control-energy floor separates the large-energy sector from globally
diagonal assignments outside the main-arc label window.
-/

noncomputable section

namespace GlobalControl

/-- The smaller of the forcing floor and boundary-penalty floor at the first
block. -/
def globalControlFloor (BS : BlockSystem) (c2 e0 : ℝ) : ℝ :=
  min (Rw c2 BS.k0) (Pifloor BS e0 BS.k0)

/-- Globally diagonal assignments outside the label window, with their exact
quadratic control energy recorded. -/
def diagSector (BS : BlockSystem) (C : ℝ) (a : GlobalAssignment BS) : Prop :=
  ∃ m : ℤ,
    (∀ p : {p : ℕ // p ∈ blockSupport BS}, (a p : ZMod p.1) = (m : ZMod p.1)) ∧
    C / sigmaCtrl BS < |(m : ℝ)| ∧
    Qctrl BS a = (m : ℝ) ^ 2 * (sigmaCtrl BS) ^ 2

end GlobalControl

end
