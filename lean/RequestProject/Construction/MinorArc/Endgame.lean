import RequestProject.Construction.MinorArc.BlockEstimate
import RequestProject.Construction.MinorArc.ControlGadgetScale
import RequestProject.Construction.MinorArc.SupportBudget
import RequestProject.Construction.ExtraSiblingChoice

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# Terminal minor-arc endgame assembly (node C6, mechanism 4)

Given the block-minor lane (`BlockMinorFiberTail`) and an extra-minor lane
(a multi-gadget reservoir,
`Construction.ExtraReservoir`), how do they combine into the final
minor-support budget consumed by the minor-arc certificate?

Two lane shapes, not two competing strategies: `MinorArcMultiGadgetLanes`
takes an already-assembled `R2MultiGadgetReservoir` directly; the frequency
variant `MinorArcFrequencyLanes` instead takes raw CRT block-label data
(`Construction.ExtraSiblingChoice`) and reduces to the multi-gadget shape via
`.toMultiGadget` — a genuine two-step refinement (choose the gadgets from
concrete label data, then feed the generic multi-gadget assembly), not a
duplicated strategy. `MinorArcFrequencyLanes` is the one actually
consumed by `Construction.MainArcClassification`.
-/

/-- Endgame lanes where the extra-minor side supplies a finite multi-gadget
reservoir for every main arc. -/
structure MinorArcMultiGadgetLanes
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (Bblock Bextra η Ctail ρ : ℝ)
    (Cls : MinorArcClassification D W N) where
  component : ControlGadgetScaleData D N ρ
  block : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    BlockMinorFiberTail D W N MA (Cls.Sblock MA) Bblock η Ctail
  extra : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    R2MultiGadgetReservoir D W N MA (Cls.Sblock MA) (Cls.Sextra MA) Bextra

/-- The global-control block lane and multi-gadget extra lanes produce the final minor
support-budget record. -/
theorem exists_minorArcSupportBudget_of_multiGadget_lanes
    (η : ℝ) (hη : 0 < η) :
    ∃ (k0min : ℕ) (Ctail : ℝ), 0 < Ctail ∧
      ∀ {T : Finset ℕ} {b : ℕ}
      (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
      (Bblock Bextra ρ : ℝ)
      (Cls : MinorArcClassification D W N),
      k0min ≤ D.BS.k0 → admissibleGlobalRange D.BS →
      MinorArcMultiGadgetLanes D W N Bblock Bextra η Ctail ρ Cls →
      Nonempty (MinorArcSupportBudget D W N Bblock Bextra) := by
  obtain ⟨k0min, Ctail, hCtail, hblockG7⟩ :=
    exists_blockMinor_budget_of_fiber_tail η hη
  refine ⟨k0min, Ctail, hCtail, ?_⟩
  intro T b D W N Bblock Bextra ρ Cls hk0 hadm Lanes
  refine ⟨minorArcSupportBudget_of_classification_and_lanes D W N
    Bblock Bextra Cls ?_⟩
  refine {
    hblock := ?_
    hextra := ?_
  }
  · intro MA
    let X := Lanes.block MA
    exact hblockG7 D W N MA (Cls.Sblock MA) Bblock X.C X.K X.Qextra
      hk0 hadm X.hC X.hK X.heL X.he0 X.hL X.hQE X.hnotmain X.hfiber X.hbudget
  · intro MA
    let X : R2ExtraMinorMultiGadgetBoundData D W N MA
        (Cls.Sblock MA) (Cls.Sextra MA) Bextra :=
      multiGadgetBoundData_of_reservoir D W N MA
        (Cls.Sblock MA) (Cls.Sextra MA) Bextra (Lanes.extra MA)
        Lanes.component.hRprime Lanes.component.hSprime Lanes.component.hlt
        (fun e he => by
          have hle := W.hlb e he
          norm_num at hle ⊢
          linarith)
        (fun e he => by
          have hle := W.hub e he
          norm_num at hle ⊢
          linarith)
        (Lanes.block MA).heL (Lanes.block MA).he0 (Lanes.block MA).hL
    exact r2_extra_minor_budget_of_multiGadgetBoundData D W N MA
      (Cls.Sblock MA) (Cls.Sextra MA) Bextra X

/-- Endgame lanes where the extra-minor side is supplied by block-label data and
gadget reservoirs, rather than by an already-assembled
`R2MultiGadgetReservoir`. -/
structure MinorArcFrequencyLanes
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (Bblock Bextra η Ctail ρ Cextra : ℝ)
    (Cls : MinorArcClassification D W N) where
  component : ControlGadgetScaleData D N ρ
  hbpos : 0 < b
  hsqfree : Squarefree b
  hcoverR : CoversPrimeDivisors D.R b
  hcopBlock : BlockSupportCoprimeWith D.BS b
  block : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    BlockMinorFiberTail D W N MA (Cls.Sblock MA) Bblock η Ctail
  label : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    R2ExtraIntFrequencyLabelData D W N MA (Cls.Sblock MA) (Cls.Sextra MA)
  Gset : (MainArcFields D.E W.theta (D.L / b) D.L N) → ℕ → Finset ℕ
  hSmem : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    ∀ h ∈ extraMinorPart MA.Sm (Cls.Sblock MA) (Cls.Sextra MA),
      Gset MA h ⊆ D.S
  hm_small : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    ∀ h ∈ extraMinorPart MA.Sm (Cls.Sblock MA) (Cls.Sextra MA),
      ∀ s ∈ Gset MA h,
        2 * |(label MA).mfun h| < (s : ℤ)
  hcard : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
      ((extraMinorPart MA.Sm (Cls.Sblock MA) (Cls.Sextra MA)).card : ℝ) *
          Cextra ≤ Bextra
  hpt : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
    ∀ h ∈ extraMinorPart MA.Sm (Cls.Sblock MA) (Cls.Sextra MA),
      (Real.sqrt (1 - (8 / 9) /
        (((r2ExtraSiblingChoice_of_intLabelData D W N MA (Cls.Sblock MA)
          (Cls.Sextra MA) (label MA) hbpos
          hsqfree hcoverR hcopBlock).rfun h : ℝ) ^ 2))) ^
            (Gset MA h).card ≤ Cextra

/-- Frequency-label lanes produce the already-built multi-gadget lane package. -/
def MinorArcFrequencyLanes.toMultiGadget
    {T : Finset ℕ} {b : ℕ}
    {D : R2ConcreteData T b} {W : R2ConcreteData.Weights D} {N : ℤ}
    {Bblock Bextra η Ctail ρ Cextra : ℝ}
    {Cls : MinorArcClassification D W N}
    (L : MinorArcFrequencyLanes D W N Bblock Bextra η Ctail ρ Cextra Cls) :
    MinorArcMultiGadgetLanes D W N Bblock Bextra η Ctail ρ Cls where
  component := L.component
  block := L.block
  extra := by
    intro MA
    exact r2MultiGadgetReservoir_of_intExtraFrequencyLabelData D W N MA
      (Cls.Sblock MA) (Cls.Sextra MA) Cextra Bextra (L.label MA) (L.Gset MA)
      L.hbpos L.hsqfree L.hcoverR L.hcopBlock L.component.hSblock
      (L.hSmem MA) (L.hm_small MA) (L.hcard MA) (L.hpt MA)

end CircleMethod

end
