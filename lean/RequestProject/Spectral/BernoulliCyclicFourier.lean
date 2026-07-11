import RequestProject.Spectral.BernoulliSum
import RequestProject.Spectral.CyclicCharacter

/-!
# Bernoulli factors on a finite cyclic group

This module identifies the local Bernoulli expectation built from cyclic
characters with the finite Fourier factors used by the circle method.
-/

open Complex Finset BigOperators Real

noncomputable section

namespace CircleMethod

/-- The Bernoulli expectation of a local cyclic character. -/
def bernoulliSpectralFactor (E : Finset ℕ) (theta : ℕ → ℝ) (L : ℕ)
    (j : {e // e ∈ E}) (ω : Fin L) : ℂ :=
  ∑ a : Bool, ((if a then theta j.1 else 1 - theta j.1 : ℝ) : ℂ)
      * cyclicCharacter L ω (if a then ((L / j.1 : ℕ) : ℤ) else 0)

/-- The product of the local Bernoulli factors with the conjugate target phase. -/
def bernoulliFourierTerm (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ) (ω : Fin L) : ℂ :=
  (∏ j : {e // e ∈ E}, bernoulliSpectralFactor E theta L j ω)
    * (starRingEnd ℂ) (cyclicCharacter L ω (q : ℤ))

lemma bernoulliSpectralFactor_eq (E : Finset ℕ) (theta : ℕ → ℝ) (L : ℕ)
    (j : {e // e ∈ E}) (ω : Fin L) :
    bernoulliSpectralFactor E theta L j ω =
      (theta j.1 : ℂ) *
          Complex.exp (2 * Real.pi * Complex.I * (ω : ℂ) *
            ((L / j.1 : ℕ) : ℂ) / (L : ℂ)) +
        (1 - theta j.1) := by
  unfold bernoulliSpectralFactor
  simp +decide
  unfold cyclicCharacter
  norm_num
  norm_cast
  aesop

lemma norm_bernoulliSpectralFactor_le_one (E : Finset ℕ) (theta : ℕ → ℝ) (L : ℕ)
    (j : {e // e ∈ E}) (ω : Fin L)
    (h0 : 0 ≤ theta j.1) (h1 : theta j.1 ≤ 1) :
    ‖bernoulliSpectralFactor E theta L j ω‖ ≤ 1 := by
  rw [bernoulliSpectralFactor_eq]
  convert norm_add_le
    ((theta j : ℂ) * Complex.exp
      (2 * Real.pi * Complex.I * (ω : ℂ) * (L / j : ℕ) / L))
    (1 - (theta j : ℂ)) using 2
  norm_num [Complex.norm_exp]
  norm_cast
  rw [abs_of_nonneg h0]
  rw [Real.norm_of_nonneg] <;> linarith

/-- The cyclic Bernoulli term is the circle method's `fourierTerm`. -/
lemma bernoulliFourierTerm_eq_fourierTerm
    (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ) (ω : Fin L) :
    bernoulliFourierTerm E theta q L ω = fourierTerm E theta q L (ω : ℕ) := by
  unfold bernoulliFourierTerm fourierTerm
  congr! 1
  · refine' Finset.prod_bij (fun j _ => j.val) _ _ _ _ <;>
      simp +decide [bernoulliSpectralFactor_eq]
  · unfold cyclicCharacter
    rw [← Complex.exp_conj]
    congr 1
    apply Complex.ext
    · norm_num [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im]
    · norm_num [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im]
      ring

end CircleMethod

end
