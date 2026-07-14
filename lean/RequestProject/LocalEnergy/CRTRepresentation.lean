import Mathlib.Data.ZMod.ValMinAbs

/-!
# Centered Chinese-remainder representatives

For coprime moduli `p,q`, `crtRepr p q ap aq` is the unique simultaneous
representative centered in `(-pq/2, pq/2]`. This is the arithmetic input from
which the local quadratic energy is built.
-/

noncomputable section

/-- Centered CRT representative, returning zero when the moduli are not
coprime. -/
def crtRepr (p q : ℕ) (ap : ZMod p) (aq : ZMod q) : ℤ :=
  if hcop : Nat.Coprime p q then
    ((ZMod.chineseRemainder hcop).symm (ap, aq)).valMinAbs
  else 0

/-- The centered representative has absolute value at most `pq/2`. -/
theorem crtRepr_abs_le (p q : ℕ) (ap : ZMod p) (aq : ZMod q)
    (hcop : Nat.Coprime p q) (hp : 0 < p) (hq : 0 < q) :
    |crtRepr p q ap aq| ≤ ↑(p * q) / 2 := by
  unfold crtRepr
  rw [dif_pos hcop]
  haveI : NeZero (p * q) := ⟨Nat.ne_of_gt (Nat.mul_pos hp hq)⟩
  rw [Int.abs_eq_natAbs]
  exact_mod_cast ZMod.natAbs_valMinAbs_le ((ZMod.chineseRemainder hcop).symm (ap, aq))

/-- Reduction of the centered representative modulo the left modulus. -/
theorem crtRepr_congr_left (p q : ℕ) (ap : ZMod p) (aq : ZMod q)
    (hcop : Nat.Coprime p q) :
    (crtRepr p q ap aq : ZMod p) = ap := by
  simp only [crtRepr, dif_pos hcop]
  set combined := (ZMod.chineseRemainder hcop).symm (ap, aq)
  calc
    (combined.valMinAbs : ZMod p) =
        ZMod.cast (combined.valMinAbs : ZMod (p * q)) :=
      (ZMod.cast_intCast (R := ZMod p) (Nat.dvd_mul_right p q)
        combined.valMinAbs).symm
    _ = (ZMod.chineseRemainder hcop (combined.valMinAbs : ZMod (p * q))).1 := by
      simp [ZMod.chineseRemainder]
    _ = (ZMod.chineseRemainder hcop combined).1 := by rw [ZMod.coe_valMinAbs]
    _ = ap := by simp [combined]

/-- Reduction of the centered representative modulo the right modulus. -/
theorem crtRepr_congr_right (p q : ℕ) (ap : ZMod p) (aq : ZMod q)
    (hcop : Nat.Coprime p q) :
    (crtRepr p q ap aq : ZMod q) = aq := by
  simp only [crtRepr, dif_pos hcop]
  set combined := (ZMod.chineseRemainder hcop).symm (ap, aq)
  calc
    (combined.valMinAbs : ZMod q) =
        ZMod.cast (combined.valMinAbs : ZMod (p * q)) :=
      (ZMod.cast_intCast (R := ZMod q) (Nat.dvd_mul_left q p)
        combined.valMinAbs).symm
    _ = (ZMod.chineseRemainder hcop (combined.valMinAbs : ZMod (p * q))).2 := by
      simp [ZMod.chineseRemainder]
    _ = (ZMod.chineseRemainder hcop combined).2 := by rw [ZMod.coe_valMinAbs]
    _ = aq := by simp [combined]

end
