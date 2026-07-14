import RequestProject.R2BlockMinorLane
import RequestProject.R2MinorSupportPipeline
import RequestProject.CircleMethod.QuadraticEnergy

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# R2 block-minor lane data

The per-main-arc block-minor package for the G7/fiber-tail budget, shared by
every extra-minor discharge strategy (`R2MinorEndgameMultiGadget`,
`R2MinorEndgameFrequency`).
-/

/-- Per-main-arc block-minor data for the G7/fiber-tail budget. -/
structure R2BlockFiberTailData
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock : Finset ℕ) (Bblock η Ctail : ℝ) where
  C : ℝ
  K : ℝ
  Qextra : ℕ → ℝ
  hC : 1 ≤ C
  hK : 0 ≤ K
  heL : ∀ e ∈ D.E, e ∣ D.L
  he0 : ∀ e ∈ D.E, 0 < e
  hL : 0 < D.L
  hQE : ∀ h ∈ blockMinorPart MA.Sm Sblock,
    Qctrl D.BS (fun p => ((h : ZMod p.1))) + Qextra h ≤ quadraticEnergy D.E h
  hnotmain : ∀ h ∈ blockMinorPart MA.Sm Sblock,
    (fun p => ((h : ZMod p.1)) : GlobalAssignment D.BS) ∉ mainArc D.BS C
  hfiber : ∀ a : GlobalAssignment D.BS,
    ∑ h ∈ (blockMinorPart MA.Sm Sblock).filter
      (fun h => (fun p => ((h : ZMod p.1)) : GlobalAssignment D.BS) = a),
      Real.exp (-(16 / 9 : ℝ) * Qextra h) ≤ K
  hbudget :
    K * ((η + Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2)) / sigmaCtrl D.BS)
      ≤ Bblock

end CircleMethod

end
