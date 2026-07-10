import RequestProject.Spectral.BernoulliCharacteristic

/-!
# Fourier data of a finite Bernoulli sum

This module contains the definitions shared by the main- and minor-arc
arguments: the variance of a weighted Bernoulli sum, its diagonal Fourier term,
and the corresponding term at a finite cyclic frequency.  Variance positivity
and analytic estimates belong to downstream modules.
-/

open Complex Finset BigOperators Real

noncomputable section

namespace CircleMethod

/-- The variance parameter `σ_E² = ∑_e θ_e(1-θ_e)/e²`. -/
def sigmaE2 (E : Finset ℕ) (θ : ℕ → ℝ) : ℝ :=
  ∑ e ∈ E, θ e * (1 - θ e) / (e : ℝ) ^ 2

/-- The diagonal Fourier term at integer label `m`. -/
def term_label (E : Finset ℕ) (θ : ℕ → ℝ) (q L : ℕ) (m : ℤ) : ℂ :=
  (∏ e ∈ E, bernoulliCharFun (θ e) ((m : ℝ) / (e : ℝ)))
    * Complex.exp (2 * Real.pi * (-((m : ℝ) * (q : ℝ) / (L : ℝ))) * Complex.I)

/-- The finite cyclic Fourier term at natural frequency `h`. -/
def fourierTerm (E : Finset ℕ) (θ : ℕ → ℝ) (q L h : ℕ) : ℂ :=
  (∏ e ∈ E, ((θ e : ℂ) *
      Complex.exp (2 * Real.pi * Complex.I * (h : ℂ) * ((L / e : ℕ) : ℂ) / (L : ℂ))
      + (1 - θ e)))
    * Complex.exp (-(2 * Real.pi * Complex.I * (h : ℂ) * (q : ℂ) / (L : ℂ)))

end CircleMethod

end
