import RequestProject.Construction.Certificates.MainArcWindow
import RequestProject.R2TopAssembly

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Minor-arc estimate certificate
-/

/-! ## Minor-arc budget layer

The minor-arc budget factors through explicitly named certificate steps:

* **classification + lanes** — `r2_buildFreqLanes` builds the
  `R2MinorEndgameFrequencyLanes`, i.e. the block-lane fibre-tail estimate
  (`r2_blockFiberTail`, with the bounded `b`-to-1 multiplicity), the extra
  frequency count bound (`r2_extra_count_le`, `≤ b(2N+1)`), and the per-frequency
  gadget damping (`r2ExtraSiblingChoice_of_intLabelData`, the `G`-fold damping).
* **support budget** — `minor_arc_support_budget` feeds those lanes through the
  abstract minor-support supply principle `F.ledger.hSB` to produce the
  `R2MinorSupportBudgetData` (the block/extra cover with its two budget fields).
* **lane bound** — `minor_arc_lane_bound` combines the block and extra budgets via
  `hminorSum_of_block_extra_norm_bounds` into the per-`MainArcFields` minor sum
  bound `≤ minorArcBudget`.
* **budget closure** — `minor_arc_budget_lt_main_term` proves the budget is dominated by
  the main-term floor at the actual `σ_E` (the ledger's single `hbudget` inequality +
  monotonicity of division by the positive Gaussian scales, parametric in the
  abstract bridge constant `K`).
-/

/-- **Minor-arc budget value.**  The block component
`(b·η + b·Ctail·e^{-C²·(16/9)/2})/σ_ctrl` plus the extra component
`b·(2N+1)·Dmp`. -/
def minorArcBudget {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) {Cc : GadgetEdgeCertificate F}
    (M : WeightedEdgeCertificate F Cc) (A : MainArcWindowCertificate F Cc M) : ℝ :=
  ((b : ℝ) * F.ledger.η + (b : ℝ) * (F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2)))
      / sigmaCtrl M.D.BS
    + (b : ℝ) * (2 * (A.N : ℝ) + 1) * F.ledger.Dmp

/-- **Minor classification + support-budget certificate.**  Build the block,
extra-count, and gadget-damping frequency lanes (`r2_buildFreqLanes`) and feed
them through the abstract minor-support supply principle `F.ledger.hSB` to obtain the
`R2MinorSupportBudgetData`: the block/extra cover of the minor frequencies with
its block budget `(b·(η + Ctail·e^{…}))/σ_ctrl` and extra budget `b·(2N+1)·Dmp`. -/
lemma minor_arc_support_budget {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) (A : MainArcWindowCertificate F Cc M) :
    Nonempty (R2MinorSupportBudgetData M.D M.W A.N
      ((b : ℝ) * (F.ledger.η + F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2)) / sigmaCtrl M.D.BS)
      ((b : ℝ) * (2 * (A.N : ℝ) + 1) * F.ledger.Dmp)) := by
  classical
  have hbpos := F.ledger.hbpos
  set D : R2ConcreteData T b := M.D with hDeq
  set W : R2ConcreteData.Weights D := M.W with hWeq
  set N : ℤ := A.N with hNeq
  -- bridge the opaque mass-batch data back to the foundation/concrete witnesses
  have hBS : D.BS = F.bsCert.BS := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_BS]
  have hS : D.S = Cc.S := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_S]
  have hR : D.R = b.primeFactors := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_R]
  have hcovRD : CoversPrimeDivisors D.R b := by rw [hR]; exact F.bsCert.hcovR
  have hcopBD : BlockSupportCoprimeWith D.BS b := by rw [hBS]; exact F.bsCert.hcopB
  have hRpD : ∀ r ∈ D.R, Nat.Prime r := by rw [hR]; exact F.bsCert.hRp
  have hSprimeD : ∀ s ∈ D.S, Nat.Prime s := by rw [hS]; exact Cc.hSprime
  have hRdvdD : ∀ r ∈ D.R, r ∣ b := by rw [hR]; exact F.bsCert.hRdvd
  have hSblockD : D.S ⊆ blockSupport D.BS := by rw [hS, hBS]; exact Cc.hSblock
  have hlt'D : ∀ r ∈ D.R, ∀ s ∈ D.S, r < s := by rw [hR, hS]; exact Cc.hlt'
  have hSgeD : ∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s := by rw [hS, hBS]; exact Cc.hSge
  have hScardD : D.S.card = F.ledger.G := by rw [hS]; exact Cc.hScard
  have hk0minMD : F.ledger.k0minM ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk0minM
  have hadmD : admissibleGlobalRange D.BS := by rw [hBS]; exact F.bsCert.hadm
  have hCge1 : (1 : ℝ) ≤ F.ledger.C := F.ledger.hCge1
  -- classification + block/extra/gadget lanes
  obtain ⟨Ln⟩ := r2_buildFreqLanes D W N F.ledger.C F.ledger.η F.ledger.Ctail F.ledger.Dmp F.ledger.G hbpos F.ledger.hbsf
    hcovRD hcopBD hRpD hSprimeD hRdvdD hSblockD hlt'D M.hctrlAvoid M.hgadgetAvoid
    M.heL M.he0 M.hL M.hLeq hCge1 A.hNnonneg hSgeD hScardD A.hNlo A.hN2
    (le_of_lt F.ledger.hDmppos) (F.ledger.hbbdef ▸ F.ledger.hG)
  -- abstract minor-support supply principle applied to the lanes
  exact F.ledger.hSB D W N
    ((b : ℝ) * (F.ledger.η + F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2)) / sigmaCtrl D.BS)
    ((b : ℝ) * (2 * (N : ℝ) + 1) * F.ledger.Dmp) (N : ℝ)
    (mainArcClassificationData D W N F.ledger.C) hk0minMD hadmD Ln.toMultiGadget

/-- **Minor lane bound.**  Combine the block and extra budgets of the
`R2MinorSupportBudgetData` (via `hminorSum_of_block_extra_norm_bounds`) into the
per-`MainArcFields` minor-sum bound `∑_{h∈Sm} ‖fourierTerm h‖ ≤ minorArcBudget`. -/
lemma minor_arc_lane_bound {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) (A : MainArcWindowCertificate F Cc M) :
    ∀ MA : MainArcFields M.D.E M.W.theta (M.D.L / b) M.D.L A.N,
      (∑ h ∈ MA.Sm, ‖fourierTerm M.D.E M.W.theta (M.D.L / b) M.D.L h‖) ≤ minorArcBudget F M A := by
  obtain ⟨MB⟩ := minor_arc_support_budget F Cc M A
  intro MA
  refine hminorSum_of_block_extra_norm_bounds M.D.E M.W.theta (M.D.L / b) M.D.L MA.Sm
    ⟨MB.Sblock MA, MB.Sextra MA, MB.hcover MA⟩ _ _ (minorArcBudget F M A)
    (MB.hblock MA) (MB.hextra MA) (le_of_eq ?_)
  unfold minorArcBudget
  ring

/-- **Minor budget closure.**  The minor-arc budget is strictly dominated by the
main-term floor `0.8·e^{-π²/2}/2 / σ_E` at the actual edge variance `σ_E`.  Consumes
only the ledger's single budget inequality `hbudget` (how the budget was allocated
among the lanes is the ledger constructor's private witness), the window bound
`(2N+1)·σ ≤ 2C+3`, and the abstract comparison `σ_E ≤ K·σ_ctrl` — every step works
for an arbitrary positive `K`. -/
lemma minor_arc_budget_lt_main_term {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) (A : MainArcWindowCertificate F Cc M) :
    minorArcBudget F M A < bernoulliMainTermConstant /
      Real.sqrt (sigmaE2 M.D.E M.W.theta) := by
  have hbpos := F.ledger.hbpos
  have hσpos : 0 < sigmaCtrl M.D.BS := A.hsigmapos
  have hK0 : (0 : ℝ) < F.ledger.K := lt_of_lt_of_le one_pos F.ledger.hK1
  -- the extra lane, rescaled through `(2N+1)·σ ≤ 2C+3`
  have hA3 : (b : ℝ) * (2 * (A.N : ℝ) + 1) * F.ledger.Dmp
      ≤ (b : ℝ) * F.ledger.Dmp * (2 * F.ledger.C + 3) / sigmaCtrl M.D.BS := by
    rw [le_div_iff₀ hσpos]
    calc (b : ℝ) * (2 * (A.N : ℝ) + 1) * F.ledger.Dmp * sigmaCtrl M.D.BS
        = (b : ℝ) * F.ledger.Dmp * ((2 * (A.N : ℝ) + 1) * sigmaCtrl M.D.BS) := by ring
      _ ≤ (b : ℝ) * F.ledger.Dmp * (2 * F.ledger.C + 3) :=
          mul_le_mul_of_nonneg_left A.h2N1sigma
            (mul_nonneg (by positivity) F.ledger.hDmppos.le)
  have hsum : minorArcBudget F M A
      ≤ ((b : ℝ) * F.ledger.η
          + (b : ℝ) * (F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2))
          + (b : ℝ) * F.ledger.Dmp * (2 * F.ledger.C + 3)) / sigmaCtrl M.D.BS := by
    unfold minorArcBudget
    have hsplit : ((b : ℝ) * F.ledger.η
        + (b : ℝ) * (F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2))
        + (b : ℝ) * F.ledger.Dmp * (2 * F.ledger.C + 3)) / sigmaCtrl M.D.BS
        = ((b : ℝ) * F.ledger.η
            + (b : ℝ) * (F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2)))
              / sigmaCtrl M.D.BS
          + (b : ℝ) * F.ledger.Dmp * (2 * F.ledger.C + 3) / sigmaCtrl M.D.BS :=
      add_div _ _ _
    rw [hsplit]
    linarith [hA3]
  have hlt : minorArcBudget F M A < F.ledger.c3 / (F.ledger.K * sigmaCtrl M.D.BS) := by
    have hstep : ((b : ℝ) * F.ledger.η
        + (b : ℝ) * (F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2))
        + (b : ℝ) * F.ledger.Dmp * (2 * F.ledger.C + 3)) / sigmaCtrl M.D.BS
        < (F.ledger.c3 / F.ledger.K) / sigmaCtrl M.D.BS := by
      gcongr
      exact F.ledger.hbudget
    calc minorArcBudget F M A
        ≤ _ := hsum
      _ < (F.ledger.c3 / F.ledger.K) / sigmaCtrl M.D.BS := hstep
      _ = F.ledger.c3 / (F.ledger.K * sigmaCtrl M.D.BS) := div_div _ _ _
  have hc3eq : F.ledger.c3 = bernoulliMainTermConstant := F.ledger.hc3eq
  rw [← hc3eq]
  exact lt_of_lt_of_le hlt (by
    rw [div_le_div_iff₀ (by positivity) A.hsigmaEpos]
    nlinarith [F.ledger.hc3pos, A.hsigmaE_ub])

/-- **Minor certificate.**  The minor-arc budget `Bm`, the per-`MainArcFields`
minor-sum bound (assembled from the block lane and the gadget/extra lane via the
frequency-lane construction and the minor-support budget supply), and the
domination `hbeat` of `Bm` by the main-term floor at the actual `σ_E`. -/
structure MinorArcEstimateCertificate {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) (A : MainArcWindowCertificate F Cc M) where
  /-- the minor-arc budget. -/
  Bm : ℝ
  hminor : ∀ MA : MainArcFields M.D.E M.W.theta (M.D.L / b) M.D.L A.N,
      (∑ h ∈ MA.Sm, ‖fourierTerm M.D.E M.W.theta (M.D.L / b) M.D.L h‖) ≤ Bm
  hbeat : Bm < bernoulliMainTermConstant /
      Real.sqrt (sigmaE2 M.D.E M.W.theta)

/-- Produce the minor-arc certificate: take the minor budget `minorArcBudget`, its
per-`MainArcFields` lane bound (`minor_arc_lane_bound`), and the budget-closure
domination (`minor_arc_budget_lt_main_term`).  This layer only assembles the named
component certificates. -/
lemma exists_minor_arc_estimate_certificate {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) (A : MainArcWindowCertificate F Cc M) :
    Nonempty (MinorArcEstimateCertificate F Cc M A) :=
  ⟨⟨minorArcBudget F M A, minor_arc_lane_bound F Cc M A, minor_arc_budget_lt_main_term F Cc M A⟩⟩


end CircleMethod

end

