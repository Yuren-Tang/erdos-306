import RequestProject.R2MinorBudgetNumerics

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# R2 minor ready package

This leaf packages the exact data the final construction sockets need from the
minor-arc analysis: concrete block/extra budgets, the support-budget record,
and the strict main-term domination inequality.
-/

/-- Minor-arc data ready for insertion into the final R2 construction socket. -/
structure R2MinorReadyData
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ) where
  Bblock : ℝ
  Bextra : ℝ
  MB : R2MinorSupportBudgetData D W N Bblock Bextra
  hminorCtrl :
    Bblock + Bextra <
      (0.8 * (Real.exp (-(Real.pi ^ 2 / 2)) / 2)) / sigmaCtrl D.BS

end CircleMethod

end
