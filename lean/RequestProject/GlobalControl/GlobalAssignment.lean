import RequestProject.GlobalControl.BlockSystem

/-!
# Global residue assignments

A finite assignment on the block support extends canonically by zero to a
dependent residue function on all natural moduli.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

def toPlain (BS : BlockSystem) (a : GlobalAssignment BS) : (p : ℕ) → ZMod p :=
  fun p => if h : p ∈ blockSupport BS then a ⟨p, h⟩ else 0
end GlobalControl

end
