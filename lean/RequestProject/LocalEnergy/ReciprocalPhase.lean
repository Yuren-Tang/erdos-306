import Mathlib.Analysis.Normed.Group.Quotient
import Mathlib.Data.ZMod.Basic
import Mathlib.Topology.Instances.AddCircle.Real

/-!
# Reciprocal phases on the unit circle

The reciprocal phase records the distance to the nearest integer of an
integer multiplied by a modular inverse. Its elementary metric properties are
independent of the later dispersion estimates.
-/

namespace LocalEnergy

/-- The distance to the nearest integer of `E q⁻¹ / p`. -/
noncomputable def reciprocalPhase (E : ℤ) (q p : ℕ) : ℝ :=
  ‖(((E : ℝ) * (((q : ZMod p)⁻¹).val : ℝ) / (p : ℝ) : ℝ) : UnitAddCircle)‖

lemma reciprocalPhase_nonneg (E : ℤ) (q p : ℕ) : 0 ≤ reciprocalPhase E q p :=
  norm_nonneg _

/-- The reciprocal phase is even in its integer argument. -/
lemma reciprocalPhase_neg (E : ℤ) (q p : ℕ) :
    reciprocalPhase (-E) q p = reciprocalPhase E q p := by
  unfold reciprocalPhase
  rw [show ((-E : ℤ) : ℝ) * ((q : ZMod p)⁻¹).val / p =
      -((E : ℝ) * ((q : ZMod p)⁻¹).val / p) by push_cast; ring]
  simp

/-- Triangle inequality for reciprocal phases. -/
lemma reciprocalPhase_sub_le (A B : ℤ) (q p : ℕ) :
    reciprocalPhase (A - B) q p ≤ reciprocalPhase A q p + reciprocalPhase B q p := by
  simpa [reciprocalPhase, Int.cast_sub, sub_mul, sub_div] using
    norm_sub_le
      ((((A : ℝ) * (((q : ZMod p)⁻¹).val : ℝ) / (p : ℝ) : ℝ) : UnitAddCircle))
      ((((B : ℝ) * (((q : ZMod p)⁻¹).val : ℝ) / (p : ℝ) : ℝ) : UnitAddCircle))

end LocalEnergy
