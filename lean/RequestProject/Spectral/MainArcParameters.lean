import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

/-!
# Quantitative parameters for the Bernoulli main arc

These definitions name the distinct analytic roles played by the current
explicit Taylor estimate.  Their numerical values are witnesses supplied by
the analytic leaf, not structural parameters of the R2 construction.
-/

namespace CircleMethod

noncomputable section

/-- Radius on which the explicit Bernoulli logarithm estimate is used. -/
def bernoulliTaylorRadius : ℝ := 1 / 10

/-- Cubic coefficient in the current explicit Bernoulli logarithm remainder. -/
def bernoulliTaylorRemainderConstant : ℝ := 100000

lemma bernoulliTaylorRemainderConstant_nonneg :
    0 ≤ bernoulliTaylorRemainderConstant := by
  norm_num [bernoulliTaylorRemainderConstant]

/-- Total logarithmic remainder allowed in the positive main term. -/
def bernoulliMainTermRemainderBudget : ℝ := 1 / 10

/-- Fraction of the Gaussian retained after the exponential perturbation. -/
def bernoulliMainTermRetention : ℝ :=
  1 - 2 * bernoulliMainTermRemainderBudget

/-- Universal scalar in the resulting Gaussian main-term lower bound. -/
def bernoulliMainTermConstant : ℝ :=
  bernoulliMainTermRetention * (Real.exp (-(Real.pi ^ 2 / 2)) / 2)

end

end CircleMethod
