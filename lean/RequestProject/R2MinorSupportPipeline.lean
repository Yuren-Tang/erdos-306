import RequestProject.R2MinorSupportBudget

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# R2 minor support pipeline

The minor support-budget record `R2MinorSupportBudgetData` splits naturally
into a combinatorial half (a choice of block/extra support sets covering every
minor frequency set) and an analytic half (the two summed-norm budgets over
those sets).  This file names the two halves and assembles them.
-/

/-- Classification lane: a choice of block/extra support sets covering every
minor frequency set supplied by `MainArcFields`. -/
structure R2MinorClassificationData
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ) where
  Sblock : MainArcFields D.E W.theta b D.L N → Finset ℕ
  Sextra : MainArcFields D.E W.theta b D.L N → Finset ℕ
  hcover : ∀ MA : MainArcFields D.E W.theta b D.L N,
    MA.Sm ⊆ Sblock MA ∪ Sextra MA

/-- Analytic budget lanes for a fixed classification. -/
structure R2MinorBudgetLanes
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (C : R2MinorClassificationData D W N)
    (Bblock Bextra : ℝ) where
  hblock : ∀ MA : MainArcFields D.E W.theta b D.L N,
    ∑ h ∈ blockMinorPart MA.Sm (C.Sblock MA),
      fourierNormWeight D.E W.theta b D.L h ≤ Bblock
  hextra : ∀ MA : MainArcFields D.E W.theta b D.L N,
    ∑ h ∈ extraMinorPart MA.Sm (C.Sblock MA) (C.Sextra MA),
      fourierNormWeight D.E W.theta b D.L h ≤ Bextra

/-- Assemble the support-budget record from an independent classification lane
and analytic budget lanes. -/
def r2_minorSupportBudget_of_classification_and_budgetLanes
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b)
    (W : R2ConcreteData.Weights D)
    (N : ℤ)
    (Bblock Bextra : ℝ)
    (C : R2MinorClassificationData D W N)
    (L : R2MinorBudgetLanes D W N C Bblock Bextra) :
    R2MinorSupportBudgetData D W N Bblock Bextra where
  Sblock := C.Sblock
  Sextra := C.Sextra
  hcover := C.hcover
  hblock := L.hblock
  hextra := L.hextra

end CircleMethod

end
