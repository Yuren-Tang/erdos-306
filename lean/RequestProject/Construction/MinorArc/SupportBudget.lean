import RequestProject.CircleMethod.MinorArcCover
import RequestProject.Construction.Edges
import RequestProject.CircleMethod.MainArcPeriodicity

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# Minor-arc support classification and budgets

A classification covers the minor frequencies by block and extra parts. The
corresponding analytic lanes bound each part, and their combination is the
support-budget interface consumed by the final minor-arc estimate.
-/

/-- Classification lane: a choice of block/extra support sets covering every
minor frequency set supplied by `MainArcFields`. -/
structure MinorArcClassification
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ) where
  Sblock : MainArcFields D.E W.theta (D.L / b) D.L N → Finset ℕ
  Sextra : MainArcFields D.E W.theta (D.L / b) D.L N → Finset ℕ
  hcover : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    MA.Sm ⊆ Sblock MA ∪ Sextra MA

/-- Analytic budget lanes for a fixed classification. -/
structure MinorArcBudgetLanes
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ)
    (C : MinorArcClassification D W N)
    (Bblock Bextra : ℝ) where
  hblock : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    ∑ h ∈ blockMinorPart MA.Sm (C.Sblock MA),
      fourierNormWeight D.E W.theta (D.L / b) D.L h ≤ Bblock
  hextra : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    ∑ h ∈ extraMinorPart MA.Sm (C.Sblock MA) (C.Sextra MA),
      fourierNormWeight D.E W.theta (D.L / b) D.L h ≤ Bextra

/-- Packaged minor support and norm-sum budgets for fixed construction data. -/
structure MinorArcSupportBudget
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ)
    (Bblock Bextra : ℝ) where
  Sblock : MainArcFields D.E W.theta (D.L / b) D.L N → Finset ℕ
  Sextra : MainArcFields D.E W.theta (D.L / b) D.L N → Finset ℕ
  hcover : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    MA.Sm ⊆ Sblock MA ∪ Sextra MA
  hblock : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    ∑ h ∈ blockMinorPart MA.Sm (Sblock MA),
      fourierNormWeight D.E W.theta (D.L / b) D.L h ≤ Bblock
  hextra : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    ∑ h ∈ extraMinorPart MA.Sm (Sblock MA) (Sextra MA),
      fourierNormWeight D.E W.theta (D.L / b) D.L h ≤ Bextra
/-- Assemble the support-budget record from an independent classification lane
and analytic budget lanes. -/
def minorArcSupportBudget_of_classification_and_lanes
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (Bblock Bextra : ℝ)
    (C : MinorArcClassification D W N)
    (L : MinorArcBudgetLanes D W N C Bblock Bextra) :
    MinorArcSupportBudget D W N Bblock Bextra where
  Sblock := C.Sblock
  Sextra := C.Sextra
  hcover := C.hcover
  hblock := L.hblock
  hextra := L.hextra

end CircleMethod

end
