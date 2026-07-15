import RequestProject.Spectral.BernoulliSum
import RequestProject.CircleMethod.BernoulliLogExpansion
import RequestProject.CircleMethod.MainArcPeriodicity
import RequestProject.Core.Semiprime

open Complex Finset BigOperators Real

noncomputable section

namespace CircleMethod

/-!
# Circle-method construction data

This file records the three mathematical inputs of a complete
`ArcConstruction`: an admissible weighted reciprocal family, a main-arc
certificate, and a minor-arc spectral-gap certificate. The downstream theorem
`ArcConstruction.exists_reciprocal_subset` combines the latter two through
abstract spectral selection and interprets the result using the first.

The earlier bespoke positivity glue (`wcount_pos_of_split`,
`exists_pos_weighted_of_construction`) has been retired: the arc-separation
positivity, the finite Fourier identity, and the subset extraction are now all
discharged by that principle.
-/

/-- A weighted family of admissible reciprocal denominators with a common
period and total expected mass `1 / b`. -/
structure WeightedReciprocalFamily (T : Finset ℕ) (b : ℕ) where
  E : Finset ℕ
  theta : ℕ → ℝ
  L : ℕ
  hsemi : ∀ e ∈ E, IsSemiprime e
  havoid : ∀ e ∈ E, e ∉ T
  hne : E.Nonempty
  hL : 0 < L
  hbL : b ∣ L
  heL : ∀ e ∈ E, e ∣ L
  he0 : ∀ e ∈ E, 0 < e
  hbound : (∑ e ∈ E, (L / e : ℕ)) < L
  hlb : ∀ e ∈ E, 1 / 3 ≤ theta e
  hub : ∀ e ∈ E, theta e ≤ 2 / 3
  hmass : (∑ e ∈ E, theta e / (e : ℝ)) = 1 / (b : ℝ)

/-- Main-arc data and local estimates for a weighted reciprocal family. -/
structure MainArcCertificate {T : Finset ℕ} {b : ℕ}
    (F : WeightedReciprocalFamily T b) where
  N : ℤ
  fields : MainArcFields F.E F.theta (F.L / b) F.L N
  hN : (1 : ℝ) / Real.sqrt (sigmaE2 F.E F.theta) ≤ (N : ℝ)
  htw : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ F.E,
    |(m : ℝ) / (e : ℝ)| ≤ bernoulliTaylorRadius
  hsmall : ∀ m ∈ Finset.Icc (-N) N,
    (∑ e ∈ F.E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤
      bernoulliMainTermRemainderBudget

/-- Minor-arc norm budget and the strict spectral gap against the Gaussian
main term. -/
structure MinorArcCertificate {T : Finset ℕ} {b : ℕ}
    (F : WeightedReciprocalFamily T b) (M : MainArcCertificate F) where
  Bm : ℝ
  hminor :
    (∑ h ∈ M.fields.Sm, ‖fourierTerm F.E F.theta (F.L / b) F.L h‖) ≤ Bm
  hbeat : Bm < bernoulliMainTermConstant / Real.sqrt (sigmaE2 F.E F.theta)

/-- A complete circle-method construction is the convergence of an admissible
weighted reciprocal family with compatible main- and minor-arc certificates. -/
structure ArcConstruction (T : Finset ℕ) (b : ℕ) where
  family : WeightedReciprocalFamily T b
  main : MainArcCertificate family
  minor : MinorArcCertificate family main


end CircleMethod

end
