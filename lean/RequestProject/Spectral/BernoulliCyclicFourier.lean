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

/-- Periodizing a Bernoulli factor through a common multiple `L` recovers its
characteristic function at the rational frequency `h / e`. -/
lemma periodizedBernoulliFactor_eq_charFun
    (theta : ℝ) (h e L : ℕ) (he0 : 0 < e) (heL : e ∣ L) (hL : 0 < L) :
    (theta : ℂ) *
          Complex.exp
            (2 * Real.pi * Complex.I * (h : ℂ) * ((L / e : ℕ) : ℂ) / (L : ℂ)) +
        (1 - theta) =
      bernoulliCharFun theta ((h : ℝ) / (e : ℝ)) := by
  unfold bernoulliCharFun
  have heC : (e : ℂ) ≠ 0 := by exact_mod_cast he0.ne'
  have hLC : (L : ℂ) ≠ 0 := by exact_mod_cast hL.ne'
  have hcast : ((L / e : ℕ) : ℂ) = (L : ℂ) / (e : ℂ) := by
    rw [Nat.cast_div heL heC]
  have harg :
      2 * Real.pi * Complex.I * (h : ℂ) * ((L / e : ℕ) : ℂ) / (L : ℂ) =
        2 * (Real.pi : ℂ) * (((h : ℝ) / (e : ℝ) : ℝ) : ℂ) * Complex.I := by
    rw [hcast]
    push_cast
    field_simp
  rw [harg]
  push_cast
  ring

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

/-- Replacing `-log ‖b_j‖` by a finite nonnegative value at zero changes the
exponential product bound by at most the corresponding fallback tail. -/
lemma bernoulliSpectralTail_pointwise
    (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ)
    (hthlb : ∀ e ∈ E, 0 ≤ theta e) (hthub : ∀ e ∈ E, theta e ≤ 1)
    (Ktail : ℝ) (hK0 : 0 ≤ Ktail) (ω : Fin L) :
    Real.exp (-(∑ j : {e // e ∈ E},
        (if ‖bernoulliSpectralFactor E theta L j ω‖ = 0 then Ktail
         else -Real.log ‖bernoulliSpectralFactor E theta L j ω‖))) ≤
      ‖fourierTerm E theta q L (ω : ℕ)‖ + Real.exp (-Ktail) := by
  by_cases h : ∃ j : {e // e ∈ E}, ‖bernoulliSpectralFactor E theta L j ω‖ = 0
  · obtain ⟨j, hj⟩ := h
    simp_all +decide
    refine' le_trans _ (le_add_of_nonneg_left <| norm_nonneg _)
    rw [Finset.sum_eq_add_sum_sdiff_singleton_of_mem (Finset.mem_attach _ j)]
    simp [hj]
    exact le_trans (by aesop)
      (Finset.single_le_sum
        (fun x _ => by
          split_ifs <;> first
          | positivity
          | exact neg_nonneg_of_nonpos <| Real.log_nonpos (norm_nonneg _) <|
              le_trans (norm_bernoulliSpectralFactor_le_one E theta L x ω
                (hthlb _ x.2) (hthub _ x.2)) (by norm_num))
        (Finset.mem_attach _ j))
  · simp_all +decide
    rw [Real.exp_sum, Finset.prod_congr rfl fun x hx =>
      Real.exp_log (norm_pos_iff.mpr (h _ x.2))]
    rw [show fourierTerm E theta q L ω = bernoulliFourierTerm E theta q L ω by
      rw [bernoulliFourierTerm_eq_fourierTerm]]
    unfold bernoulliFourierTerm
    norm_num [norm_mul, norm_cyclicCharacter]
    positivity

end CircleMethod

end
