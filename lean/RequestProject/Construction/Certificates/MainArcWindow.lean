import RequestProject.Construction.Certificates.WeightedEdges
import RequestProject.CircleMethod.MainArcNumericBounds

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Main-arc window certificate
-/

/-! ## Main-arc window layer -/

/-- **σ_E ↔ σ_ctrl comparison.**  The edge variance `σ_E = √(sigmaE2 E θ)` is
two-sidedly comparable with the control deviation `σ_ctrl`: it is at least
`√(2/9)·σ_ctrl` (the `2/9` is the extremal value of `θ(1−θ)` on the weight window
`[1/3, 2/3]`, so this is a structural constant) and at most `K·σ_ctrl` for the
ledger's abstract bridge constant `K`.  The upper bound uses only the square-load
certificate `M.hsumE` and `Sload ≤ 4K²`; no witness value of either constant
appears anywhere in this chain. -/
lemma main_arc_variance_comparison {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) :
    Real.sqrt (2 / 9) * sigmaCtrl M.D.BS ≤ Real.sqrt (sigmaE2 M.D.E M.W.theta)
      ∧ Real.sqrt (sigmaE2 M.D.E M.W.theta) ≤ F.ledger.K * sigmaCtrl M.D.BS
      ∧ 0 < Real.sqrt (sigmaE2 M.D.E M.W.theta) := by
  classical
  set D : R2ConcreteData T b := M.D with hDeq
  set W : R2ConcreteData.Weights D := M.W with hWeq
  have hBS : D.BS = F.bsCert.BS := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_BS]
  have hadmD : admissibleGlobalRange D.BS := by rw [hBS]; exact F.bsCert.hadm
  have hK0 : (0 : ℝ) < F.ledger.K := lt_of_lt_of_le one_pos F.ledger.hK1
  have hsumE : ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2
      ≤ F.ledger.Sload * (sigmaCtrl D.BS) ^ 2 := M.hsumE
  set σ : ℝ := sigmaCtrl D.BS with hσdef
  have hσpos : 0 < σ := by
    rw [hσdef]
    exact sigmaCtrl_pos_of_admissible_range D.BS hadmD
  have hsigmaE2_le : sigmaE2 D.E W.theta ≤ F.ledger.K ^ 2 * σ ^ 2 := by
    have h := sigmaE2_le_quarter_sum_inv_sq D.E W.theta
    nlinarith [h, hsumE, mul_nonneg (sub_nonneg.mpr F.ledger.hKS) (sq_nonneg σ)]
  have hsigmaE_ub : Real.sqrt (sigmaE2 D.E W.theta) ≤ F.ledger.K * σ := by
    rw [show F.ledger.K * σ = Real.sqrt ((F.ledger.K * σ) ^ 2) by
      rw [Real.sqrt_sq (by positivity)]]
    apply Real.sqrt_le_sqrt
    calc sigmaE2 D.E W.theta ≤ F.ledger.K ^ 2 * σ ^ 2 := hsigmaE2_le
      _ = (F.ledger.K * σ) ^ 2 := by ring
  have hsigmaE_lb : Real.sqrt (2 / 9) * σ ≤ Real.sqrt (sigmaE2 D.E W.theta) := by
    rw [show Real.sqrt (2 / 9) * σ = Real.sqrt ((2 / 9) * σ ^ 2) by
      rw [Real.sqrt_mul (by norm_num), Real.sqrt_sq hσpos.le]]
    apply Real.sqrt_le_sqrt
    have := sigmaE2_ge_ctrl D W; rw [show σ = sigmaCtrl D.BS from hσdef]; linarith
  have hsigmaEpos : 0 < Real.sqrt (sigmaE2 D.E W.theta) :=
    lt_of_lt_of_le (by positivity) hsigmaE_lb
  exact ⟨hsigmaE_lb, hsigmaE_ub, hsigmaEpos⟩


/-- **Main-arc window certificate.**  The window parameter `N ≈ C/σ`, the
two-sided `σ_E ↔ σ_ctrl` comparison, the window bounds (`N·σ`, `(2N+1)·σ`, and
`2N < 2^{2k0}`), the period bound `2N+1 ≤ L`, and the Taylor/Gaussian numeric
fields `MainArcNumericBounds`. The fields are stated so the minor-arc layer can
reuse the window facts (`hNlo`, `hN2`, `h2N1sigma`, `hsigmaE_ub`, `hsigmaEpos`)
without re-deriving `N`. -/
structure MainArcWindowCertificate {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) where
  /-- the main-arc window parameter. -/
  N : ℤ
  hNnonneg : 0 ≤ N
  hNlo : F.ledger.C / sigmaCtrl M.D.BS ≤ (N : ℝ)
  hN2 : 2 * N < (2 : ℤ) ^ (2 * M.D.BS.k0)
  hNL : 2 * N + 1 ≤ (M.D.L : ℤ)
  hsigmapos : 0 < sigmaCtrl M.D.BS
  h2N1sigma : (2 * (N : ℝ) + 1) * sigmaCtrl M.D.BS ≤ 2 * F.ledger.C + 3
  hsigmaE_ub : Real.sqrt (sigmaE2 M.D.E M.W.theta) ≤ F.ledger.K * sigmaCtrl M.D.BS
  hsigmaEpos : 0 < Real.sqrt (sigmaE2 M.D.E M.W.theta)
  hNF : MainArcNumericBounds M.D.E M.W.theta N

/-- **Main-arc window scale/period bounds.**  For `N` essentially `⌈C/σ_ctrl⌉`
(`hNhi`), the window stays below the squared bottom scale (`2N < 2^{2k₀}`), fits
inside the common period (`2N+1 ≤ L`), and obeys the explicit growth bound
`N ≤ 100·k₀²·2^{k₀}+1` consumed by the Taylor numeric fields.  This boxes the
constant-chasing "N-window" ledger out of the main-arc assembly. -/
lemma main_arc_window_scale_period {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) (N : ℤ)
    (hNhi : (N : ℝ) ≤ F.ledger.C / sigmaCtrl M.D.BS + 1) :
    2 * N < (2 : ℤ) ^ (2 * M.D.BS.k0)
      ∧ 2 * N + 1 ≤ (M.D.L : ℤ)
      ∧ (N : ℝ) ≤ F.ledger.cSigma * (M.D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ M.D.BS.k0 + 1 := by
  classical
  have hbpos := F.ledger.hbpos
  set D : R2ConcreteData T b := M.D with hDeq
  set C : ℝ := F.ledger.C with hCeq
  set cS : ℝ := F.ledger.cSigma with hcSeq
  have hcS1 : (1 : ℝ) ≤ cS := F.ledger.hcS1
  have hcS0 : (0 : ℝ) < cS := lt_of_lt_of_le one_pos hcS1
  have hBS : D.BS = F.bsCert.BS := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_BS]
  have hS : D.S = Cc.S := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_S]
  have hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p := M.hLeq
  have hadmD : admissibleGlobalRange D.BS := by rw [hBS]; exact F.bsCert.hadm
  have hCge3 : (3 : ℝ) ≤ C := F.ledger.hCge3
  have hbr : (3 : ℝ) ≤ (b : ℝ) := by exact_mod_cast F.ledger.hb3
  have hSgeD : ∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s := by rw [hS, hBS]; exact Cc.hSge
  have hSblockD : D.S ⊆ blockSupport D.BS := by rw [hS, hBS]; exact Cc.hSblock
  have hScardD : D.S.card = F.ledger.G := by rw [hS]; exact Cc.hScard
  set σ : ℝ := sigmaCtrl D.BS with hσdef
  have hσpos : 0 < σ := by
    rw [hσdef]
    exact sigmaCtrl_pos_of_admissible_range D.BS hadmD
  have hσstrong : (1 : ℝ) / (cS * (D.BS.k0 : ℝ) * (2 : ℝ) ^ D.BS.k0) ≤ σ := by
    have hthr : F.ledger.k0sigma ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk0sigma
    rw [hσdef, hcSeq]; exact F.ledger.hk0sigmaFact D.BS hthr
  have hwindow : 10 * (cS * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 + 1)
      ≤ (2 : ℝ) ^ (2 * D.BS.k0) := by
    have hthr : F.ledger.k0window ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk0window
    rw [hcSeq]; exact F.ledger.hk0windowFact D.BS.k0 hthr
  have hNreal : (N : ℝ) ≤ cS * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 + 1 := by
    have hk05 : 5 ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk05
    have hk0cast : (0 : ℝ) < (D.BS.k0 : ℝ) := by
      exact_mod_cast (by omega : 0 < D.BS.k0)
    have hinvσ : (1 : ℝ) / σ ≤ cS * (D.BS.k0 : ℝ) * (2 : ℝ) ^ D.BS.k0 := by
      rw [div_le_iff₀ hσpos]
      have hs := hσstrong
      rw [div_le_iff₀ (by positivity)] at hs
      nlinarith only [hs, hσpos]
    have hCk0 : C ≤ (D.BS.k0 : ℝ) := by
      have hCm : C ≤ (Nat.ceil C : ℝ) := Nat.le_ceil C
      have hmk0 : (Nat.ceil C : ℝ) ≤ (D.BS.k0 : ℝ) := by
        have hnat : Nat.ceil C ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk0C
        exact_mod_cast hnat
      linarith
    have hCσ : C / σ ≤ cS * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 := by
      rw [div_eq_mul_one_div]
      calc C * (1 / σ)
          ≤ (D.BS.k0 : ℝ) * (cS * (D.BS.k0 : ℝ) * (2 : ℝ) ^ D.BS.k0) :=
            mul_le_mul hCk0 hinvσ (by positivity) (by positivity)
        _ = cS * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 := by ring
    linarith [hNhi, hCσ]
  have hN2 : 2 * N < (2 : ℤ) ^ (2 * D.BS.k0) := by
    have hX0 : (0 : ℝ) ≤ cS * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 := by positivity
    have hR : 2 * (N : ℝ) < (2 : ℝ) ^ (2 * D.BS.k0) := by nlinarith [hNreal, hwindow, hX0]
    have hcast : ((2 * N : ℤ) : ℝ) < (((2 : ℤ) ^ (2 * D.BS.k0) : ℤ) : ℝ) := by
      push_cast
      linarith [hR]
    exact_mod_cast hcast
  have hNL : 2 * N + 1 ≤ (D.L : ℤ) := by
    have hG1 : 1 ≤ F.ledger.G := F.ledger.hG1
    have hSne : D.S.Nonempty := by rw [← Finset.card_pos, hScardD]; omega
    obtain ⟨s, hs⟩ := hSne
    have hprodpos : 0 < ∏ p ∈ blockSupport D.BS, p :=
      Finset.prod_pos (fun p hp => (blockSupport_prime D.BS hp).pos)
    have hLge : (2 : ℕ) ^ (2 * D.BS.k0) ≤ D.L := by
      rw [hLeq]
      calc (2 : ℕ) ^ (2 * D.BS.k0) ≤ s := hSgeD s hs
        _ ≤ ∏ p ∈ blockSupport D.BS, p :=
            Nat.le_of_dvd hprodpos (Finset.dvd_prod_of_mem _ (hSblockD hs))
        _ ≤ b * ∏ p ∈ blockSupport D.BS, p := Nat.le_mul_of_pos_left _ hbpos
    calc 2 * N + 1 ≤ (2 : ℤ) ^ (2 * D.BS.k0) := by linarith [hN2]
      _ ≤ (D.L : ℤ) := by exact_mod_cast hLge
  exact ⟨hN2, hNL, hNreal⟩


/-- Produce the main-arc window certificate: choose `N = ⌈C/σ⌉`, prove the
`σ_E ↔ σ_ctrl` comparison and window bounds, and build the numeric fields. -/
lemma exists_main_arc_window_certificate {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) :
    Nonempty (MainArcWindowCertificate F Cc M) := by
  classical
  have hbpos := F.ledger.hbpos
  set D : R2ConcreteData T b := M.D with hDeq
  set W : R2ConcreteData.Weights D := M.W with hWeq
  set QB : R2MassBatchSupply D := M.QB with hQBeq
  set C : ℝ := F.ledger.C with hCeq
  -- bridge the opaque mass-batch data back to the foundation/concrete witnesses
  have hBS : D.BS = F.bsCert.BS := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_BS]
  have hS : D.S = Cc.S := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_S]
  have hR : D.R = b.primeFactors := by simp only [hDeq, M.hDdef, R2ConcreteData.withQ_R]
  have he0 : ∀ e ∈ D.E, 0 < e := M.he0
  have hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p := M.hLeq
  have hsumE : ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2
      ≤ F.ledger.Sload * (sigmaCtrl D.BS) ^ 2 := M.hsumE
  have hk05 : 5 ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk05
  have hCge3 : (3 : ℝ) ≤ C := F.ledger.hCge3
  have hk0pos : 1 ≤ D.BS.k0 := by omega
  have hCk0 : C ≤ (D.BS.k0 : ℝ) := by
    have hnat : Nat.ceil C ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk0C
    calc C ≤ (Nat.ceil C : ℝ) := Nat.le_ceil C
      _ ≤ (D.BS.k0 : ℝ) := by exact_mod_cast hnat
  have hwindow : 10 * (F.ledger.cSigma * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 + 1)
      ≤ (2 : ℝ) ^ (2 * D.BS.k0) := by
    have hthr : F.ledger.k0window ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk0window
    exact F.ledger.hk0windowFact D.BS.k0 hthr
  have hcubic : (40 * bernoulliTaylorRemainderConstant * F.ledger.Sload *
      (F.ledger.cSigma + 1)) * (D.BS.k0 : ℝ) ^ 4
      ≤ (2 : ℝ) ^ D.BS.k0 := by
    have hthr : F.ledger.k0cubic ≤ D.BS.k0 := by rw [hBS]; exact F.bsCert.hk0cubic
    exact F.ledger.hk0cubicFact D.BS.k0 hthr
  have hadmD : admissibleGlobalRange D.BS := by rw [hBS]; exact F.bsCert.hadm
  have hSgeD : ∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s := by rw [hS, hBS]; exact Cc.hSge
  have hRpos'D : ∀ r ∈ D.R, 2 ≤ r := by rw [hR]; exact Cc.hRpos'
  set σ : ℝ := sigmaCtrl D.BS with hσdef
  have hσpos : 0 < σ := by
    rw [hσdef]
    exact sigmaCtrl_pos_of_admissible_range D.BS hadmD
  have hσle1 : σ ≤ 1 := by rw [hσdef]; exact sigmaCtrl_le_one D.BS (by omega)
  set N : ℤ := ⌈C / σ⌉ with hNdef
  have hNlo : C / σ ≤ (N : ℝ) := Int.le_ceil _
  have hNhi : (N : ℝ) ≤ C / σ + 1 := le_of_lt (Int.ceil_lt_add_one _)
  have hNnonneg : 0 ≤ N := by
    have : (0 : ℝ) ≤ C / σ := by positivity
    have := le_trans this hNlo
    exact_mod_cast this
  -- σ_E two-sided control (named certificate: compare σ_E with σ_ctrl)
  obtain ⟨hsigmaE_lb, hsigmaE_ub, hsigmaEpos⟩ := main_arc_variance_comparison F Cc M
  -- N bounds vs σ
  have hNsigma : (N : ℝ) * σ ≤ C + 1 := by
    have h1 : (N : ℝ) * σ ≤ (C / σ + 1) * σ := mul_le_mul_of_nonneg_right hNhi hσpos.le
    rw [add_mul, one_mul, div_mul_cancel₀ C (ne_of_gt hσpos)] at h1
    linarith [h1, hσle1]
  have h2N1sigma : (2 * (N : ℝ) + 1) * σ ≤ 2 * C + 3 := by
    have h1 : (2 * (N : ℝ) + 1) * σ ≤ (2 * (C / σ + 1) + 1) * σ := by
      apply mul_le_mul_of_nonneg_right _ hσpos.le; linarith [hNhi]
    have h2 : (2 * (C / σ + 1) + 1) * σ = 2 * C + 3 * σ := by
      have hσne : σ ≠ 0 := ne_of_gt hσpos; field_simp; ring
    rw [h2] at h1
    linarith [h1, hσle1]
  -- large-k0 window facts (named certificate: N-window scale/period ledger)
  obtain ⟨hN2, hNL, hNreal⟩ := main_arc_window_scale_period F Cc M N hNhi
  have hNF : MainArcNumericBounds D.E W.theta N :=
    r2_close_numericFields D W N σ C F.ledger.cSigma F.ledger.Sload hσpos he0 QB hSgeD
      hRpos'D F.ledger.hcS1 F.ledger.hS1 hsumE hsigmaE_lb hNnonneg hCge3 hNlo hNsigma
      hk0pos hCk0 hwindow hcubic hNreal
  exact ⟨⟨N, hNnonneg, hNlo, hN2, hNL, hσpos, h2N1sigma, hsigmaE_ub, hsigmaEpos, hNF⟩⟩


end CircleMethod

end

