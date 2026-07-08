import RequestProject.R2MinorReady
import RequestProject.R2MinorEndgameLanes
import RequestProject.Construction.ExtraReservoir
import RequestProject.Construction.ExtraSiblingChoice
import RequestProject.R2ComponentCoreSupply

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# Terminal minor-arc endgame assembly (node C6, mechanism 4)

Single motivating question: **given the block-minor lane
(`R2BlockFiberTailData`, `Construction.BaseLoadBudget`'s sibling node
`R2MinorEndgameLanes`) and an extra-minor lane (a multi-gadget reservoir,
`Construction.ExtraReservoir`), how do they combine into the final
minor-support-budget / minor-ready record consumed by
`R2Certificates`/`R2TopAssembly`?**

Two lane shapes, not two competing strategies: `R2MinorEndgameMultiGadgetLanes`
takes an already-assembled `R2MultiGadgetReservoir` directly; the frequency
variant `R2MinorEndgameFrequencyLanes` instead takes raw CRT block-label data
(`Construction.ExtraSiblingChoice`) and reduces to the multi-gadget shape via
`.toMultiGadget` — a genuine two-step refinement (choose the gadgets from
concrete label data, then feed the generic multi-gadget assembly), not a
duplicated strategy. `R2MinorEndgameFrequencyLanes` is the one actually
consumed by `R2MainArcClassification`.

See `docs/construction-redesign.md` node C6.
-/

/-- Endgame lanes where the extra-minor side supplies a finite multi-gadget
reservoir for every main arc. -/
structure R2MinorEndgameMultiGadgetLanes
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (Bblock Bextra η Ctail ρ : ℝ)
    (Cls : R2MinorClassificationData D W N) where
  component : R2ComponentScaleCoreSupply D N ρ
  block : ∀ MA : MainArcFields D.E W.theta b D.L N,
    R2BlockFiberTailData D W N MA (Cls.Sblock MA) Bblock η Ctail
  extra : ∀ MA : MainArcFields D.E W.theta b D.L N,
    R2MultiGadgetReservoir D W N MA (Cls.Sblock MA) (Cls.Sextra MA) Bextra

/-- G7 plus block lanes and multi-gadget extra lanes produce the final minor
support-budget record. -/
theorem exists_r2_minorSupportBudget_from_multiGadget_lanes
    (η : ℝ) (hη : 0 < η) :
    ∃ (k0min : ℕ) (Ctail : ℝ), 0 < Ctail ∧
      ∀ {T : Finset ℕ} {b : ℕ}
      (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
      (Bblock Bextra ρ : ℝ)
      (Cls : R2MinorClassificationData D W N),
      k0min ≤ D.BS.k0 → admissibleGlobalRange D.BS →
      R2MinorEndgameMultiGadgetLanes D W N Bblock Bextra η Ctail ρ Cls →
      Nonempty (R2MinorSupportBudgetData D W N Bblock Bextra) := by
  obtain ⟨k0min, Ctail, hCtail, hblockG7⟩ :=
    exists_r2_block_minor_budget_from_fiber_tail_g7 η hη
  refine ⟨k0min, Ctail, hCtail, ?_⟩
  intro T b D W N Bblock Bextra ρ Cls hk0 hadm Lanes
  refine ⟨r2_minorSupportBudget_of_classification_and_budgetLanes D W N
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

/-- Multi-gadget lanes with scaled block/extra constants produce minor-ready
data. -/
theorem exists_r2_minorReady_from_multiGadget_lanes
    (η : ℝ) (hη : 0 < η) :
    ∃ (k0min : ℕ) (Ctail : ℝ), 0 < Ctail ∧
      ∀ {T : Finset ℕ} {b : ℕ}
      (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
      (Ablock Aextra ρ : ℝ)
      (Cls : R2MinorClassificationData D W N),
      k0min ≤ D.BS.k0 → admissibleGlobalRange D.BS →
      R2MinorEndgameMultiGadgetLanes D W N
        (Ablock / sigmaCtrl D.BS) (Aextra / sigmaCtrl D.BS) η Ctail ρ Cls →
      Ablock + Aextra < r2MinorMainCtrlConstant →
      Nonempty (R2MinorReadyData D W N) := by
  obtain ⟨k0min, Ctail, hCtail, hminor⟩ :=
    exists_r2_minorSupportBudget_from_multiGadget_lanes η hη
  refine ⟨k0min, Ctail, hCtail, ?_⟩
  intro T b D W N Ablock Aextra ρ Cls hk0 hadm Lanes hscaled
  obtain ⟨MB⟩ := hminor D W N
    (Ablock / sigmaCtrl D.BS) (Aextra / sigmaCtrl D.BS) ρ Cls hk0 hadm Lanes
  refine ⟨{
    Bblock := Ablock / sigmaCtrl D.BS
    Bextra := Aextra / sigmaCtrl D.BS
    MB := MB
    hminorCtrl := ?_
  }⟩
  exact r2_minor_ctrl_from_scaled_budgets_admissible D
    (Ablock / sigmaCtrl D.BS) (Aextra / sigmaCtrl D.BS) Ablock Aextra
    hadm le_rfl le_rfl hscaled

/-- Endgame lanes where the extra-minor side is supplied by block-label data and
gadget reservoirs, rather than by an already-assembled
`R2MultiGadgetReservoir`. -/
structure R2MinorEndgameFrequencyLanes
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (Bblock Bextra η Ctail ρ Cextra : ℝ)
    (Cls : R2MinorClassificationData D W N) where
  component : R2ComponentScaleCoreSupply D N ρ
  hbpos : 0 < b
  hsqfree : Squarefree b
  hcoverR : CoversPrimeDivisors D.R b
  hcopBlock : BlockSupportCoprimeWith D.BS b
  block : ∀ MA : MainArcFields D.E W.theta b D.L N,
    R2BlockFiberTailData D W N MA (Cls.Sblock MA) Bblock η Ctail
  label : ∀ MA : MainArcFields D.E W.theta b D.L N,
    R2ExtraIntFrequencyLabelData D W N MA (Cls.Sblock MA) (Cls.Sextra MA)
  Gset : (MainArcFields D.E W.theta b D.L N) → ℕ → Finset ℕ
  hSmem : ∀ MA : MainArcFields D.E W.theta b D.L N,
    ∀ h ∈ extraMinorPart MA.Sm (Cls.Sblock MA) (Cls.Sextra MA),
      Gset MA h ⊆ D.S
  hm_small : ∀ MA : MainArcFields D.E W.theta b D.L N,
    ∀ h ∈ extraMinorPart MA.Sm (Cls.Sblock MA) (Cls.Sextra MA),
      ∀ s ∈ Gset MA h,
        2 * |(label MA).mfun h| < (s : ℤ)
  hcard : ∀ MA : MainArcFields D.E W.theta b D.L N,
      ((extraMinorPart MA.Sm (Cls.Sblock MA) (Cls.Sextra MA)).card : ℝ) *
          Cextra ≤ Bextra
  hpt : ∀ MA : MainArcFields D.E W.theta b D.L N,
    ∀ h ∈ extraMinorPart MA.Sm (Cls.Sblock MA) (Cls.Sextra MA),
      (Real.sqrt (1 - (8 / 9) /
        (((r2ExtraSiblingChoice_of_intLabelData D W N MA (Cls.Sblock MA)
          (Cls.Sextra MA) (label MA) hbpos
          hsqfree hcoverR hcopBlock).rfun h : ℝ) ^ 2))) ^
            (Gset MA h).card ≤ Cextra

/-- Frequency-label lanes produce the already-built multi-gadget lane package. -/
def R2MinorEndgameFrequencyLanes.toMultiGadget
    {T : Finset ℕ} {b : ℕ}
    {D : R2ConcreteData T b} {W : R2ConcreteData.Weights D} {N : ℤ}
    {Bblock Bextra η Ctail ρ Cextra : ℝ}
    {Cls : R2MinorClassificationData D W N}
    (L : R2MinorEndgameFrequencyLanes D W N Bblock Bextra η Ctail ρ Cextra Cls) :
    R2MinorEndgameMultiGadgetLanes D W N Bblock Bextra η Ctail ρ Cls where
  component := L.component
  block := L.block
  extra := by
    intro MA
    exact r2MultiGadgetReservoir_of_intExtraFrequencyLabelData D W N MA
      (Cls.Sblock MA) (Cls.Sextra MA) Cextra Bextra (L.label MA) (L.Gset MA)
      L.hbpos L.hsqfree L.hcoverR L.hcopBlock L.component.hSblock
      (L.hSmem MA) (L.hm_small MA) (L.hcard MA) (L.hpt MA)

/-- G7 plus block lanes and extra-frequency label lanes produce minor-ready
data. -/
theorem exists_r2_minorReady_from_frequency_lanes
    (η : ℝ) (hη : 0 < η) :
    ∃ (k0min : ℕ) (Ctail : ℝ), 0 < Ctail ∧
      ∀ {T : Finset ℕ} {b : ℕ}
      (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
      (Ablock Aextra ρ Cextra : ℝ)
      (Cls : R2MinorClassificationData D W N),
      k0min ≤ D.BS.k0 → admissibleGlobalRange D.BS →
      R2MinorEndgameFrequencyLanes D W N
        (Ablock / sigmaCtrl D.BS) (Aextra / sigmaCtrl D.BS)
        η Ctail ρ Cextra Cls →
      Ablock + Aextra < r2MinorMainCtrlConstant →
      Nonempty (R2MinorReadyData D W N) := by
  obtain ⟨k0min, Ctail, hCtail, hminor⟩ :=
    exists_r2_minorReady_from_multiGadget_lanes η hη
  refine ⟨k0min, Ctail, hCtail, ?_⟩
  intro T b D W N Ablock Aextra ρ Cextra Cls hk0 hadm L hscaled
  exact hminor D W N Ablock Aextra ρ Cls hk0 hadm L.toMultiGadget hscaled

end CircleMethod

end
