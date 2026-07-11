import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar

/-!
# Cyclic additive characters

The explicit exponential character on `Fin L`, its identification with
Mathlib's standard character on `ZMod L`, and the resulting orthogonality and
factorization laws.
-/

open Complex Finset BigOperators Real

noncomputable section

namespace CircleMethod

/-- The additive character `n ↦ exp(2πi·ω·n/L)` on `ℤ`, indexed by `ω : Fin L`. -/
def cyclicCharacter (L : ℕ) (ω : Fin L) (n : ℤ) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * (ω : ℂ) * (n : ℂ) / (L : ℂ))

/-- The explicit cyclic character is Mathlib's standard additive character on
`ZMod L`, evaluated at the product of the frequency and the integer argument. -/
lemma cyclicCharacter_eq_stdAddChar (L : ℕ) [NeZero L] (ω : Fin L) (n : ℤ) :
    cyclicCharacter L ω n =
      ZMod.stdAddChar (((((ω : ℕ) : ℤ) * n : ℤ) : ZMod L)) := by
  rw [cyclicCharacter, ZMod.stdAddChar_coe]
  congr 1
  push_cast
  ring

/-- `cyclicCharacter` has unit norm. -/
lemma norm_cyclicCharacter (L : ℕ) (ω : Fin L) (n : ℤ) : ‖cyclicCharacter L ω n‖ = 1 := by
  unfold cyclicCharacter
  norm_num [Complex.norm_exp]

/-- Multiplying by the conjugate target character evaluates the character on
the difference. -/
lemma cyclicCharacter_mul_star (L : ℕ) (ω : Fin L) (m q : ℤ) :
    cyclicCharacter L ω m * (starRingEnd ℂ) (cyclicCharacter L ω q) =
      cyclicCharacter L ω (m - q) := by
  unfold cyclicCharacter
  rw [← Complex.exp_conj, ← Complex.exp_add]
  congr 1
  apply Complex.ext
  · norm_num [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im]
  · norm_num [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im]
    ring

/-- Orthogonality of the cyclic characters indexed by `Fin L`. -/
lemma charsum_orth (L : ℕ) (hL : 0 < L) (n : ℤ) :
    (∑ ω : Fin L, cyclicCharacter L ω n) =
      if (L : ℤ) ∣ n then (L : ℂ) else 0 := by
  letI : NeZero L := ⟨hL.ne'⟩
  let ψ := (ZMod.stdAddChar (N := L)).mulShift (n : ZMod L)
  have hsum : ∑ x : ZMod L, ψ x = if ψ = 0 then (L : ℂ) else 0 := by
    simpa [ZMod.card] using AddChar.sum_eq_ite ψ
  have hψ : ψ = 0 ↔ (n : ZMod L) = 0 := by
    constructor
    · intro h
      by_contra hn
      exact (ZMod.isPrimitive_stdAddChar L hn) (h.trans AddChar.one_eq_zero.symm)
    · intro h
      calc
        ψ = 1 := by simp [ψ, h]
        _ = 0 := AddChar.one_eq_zero
  have hfin : ∀ ω : Fin L, ZMod.finEquiv L ω = (ω : ZMod L) := by
    intro ω
    cases L with
    | zero => exact Fin.elim0 ω
    | succ L =>
        change (ω : ZMod (L + 1)) = (ω.val : ZMod (L + 1))
        exact (ZMod.natCast_zmod_val (show ZMod (L + 1) from ω)).symm
  rw [← (ZMod.finEquiv L).sum_comp] at hsum
  simpa [ψ, cyclicCharacter_eq_stdAddChar, AddChar.mulShift_apply, mul_comm, hψ, hfin,
    ZMod.intCast_zmod_eq_zero_iff_dvd] using hsum

/-- Inside one fundamental interval, the normalized cyclic character sum is
the indicator of equality. -/
lemma cyclicCharacter_indicator_of_abs_sub_lt
    (L : ℕ) (hL : 0 < L) (m q : ℤ) (hnowrap : |m - q| < L) :
    (if m = q then (1 : ℂ) else 0) =
      (1 / (L : ℂ)) *
        ∑ ω : Fin L, cyclicCharacter L ω m *
          (starRingEnd ℂ) (cyclicCharacter L ω q) := by
  rw [Finset.sum_congr rfl fun ω _ => cyclicCharacter_mul_star L ω m q]
  rw [charsum_orth L hL]
  by_cases hmq : m = q
  · simp [hmq, hL.ne']
  · have hnotdvd : ¬(L : ℤ) ∣ m - q := fun hdiv =>
      hmq (sub_eq_zero.mp (Int.eq_zero_of_abs_lt_dvd hdiv hnowrap))
    simp [hmq, hnotdvd]

/-- Additive characters turn a finite sum into a product. -/
lemma cyclicCharacter_sum_eq_prod (L : ℕ) (ω : Fin L)
    {ι : Type*} [Fintype ι] (g : ι → ℤ) :
    cyclicCharacter L ω (∑ i, g i) = ∏ i, cyclicCharacter L ω (g i) := by
  unfold cyclicCharacter
  simp +decide [← Complex.exp_sum]
  ring_nf
  simp +decide [mul_assoc, mul_comm, mul_left_comm, Finset.mul_sum _ _ _]

end CircleMethod

end
