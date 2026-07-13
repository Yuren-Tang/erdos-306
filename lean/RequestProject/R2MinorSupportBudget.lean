import RequestProject.CircleMethod.MinorArcCover
import RequestProject.Construction.Edges
import RequestProject.R2AssemblyFields

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# R2 minor support/budget package

This thin downstream leaf packages the minor-support data consumed by the final
R2 assembly.  It is deliberately only a record/wrapper layer: the actual block
and extra analytic estimates can be proved independently and then inserted as
fields.
-/

/-- Packaged minor support and norm-sum budgets for a fixed concrete R2 setup. -/
structure R2MinorSupportBudgetData
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
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

end CircleMethod

end
