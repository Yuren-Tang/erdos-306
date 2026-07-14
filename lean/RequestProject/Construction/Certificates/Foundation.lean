import RequestProject.BlockMassPool
import RequestProject.CircleMethod.MainArcNumericBounds
import RequestProject.Construction.BaseLoadBudget
import RequestProject.Construction.BlockSystemSelection
import RequestProject.Construction.EdgeSquareLoad
import RequestProject.Construction.MinorEndgame
import RequestProject.Construction.ParameterSelection

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Circle-method construction parameters and foundation
-/

/-! ## Foundation / scale layer -/

/-- **Numeric ledger.**  The scale-parameter / constant slice of the foundation: the
budget quantities (`c3, η, Ctail, C, base_b, Dmp, G`), the abstract analytic constants
(`cSigma, Sload, K` — supplied existentially by leaf lemmas; no witness value is visible
at this level), the bottom-scale thresholds, and all the facts *independent of the chosen
block system*.  Every field states exactly the property its downstream consumer uses:
the single budget inequality `hbudget` replaces any definitional pinning of `η`/`Dmp`
(the allocation scheme is the constructor's private witness), and each threshold field
carries its eventual-domination fact parametrically. -/
structure ConstructionParameters (b : ℕ) where
  c3 : ℝ
  η : ℝ
  Ctail : ℝ
  C : ℝ
  base_b : ℝ
  Dmp : ℝ
  G : ℕ
  /-- abstract `σ_ctrl` lower-bound coefficient (`exists_sigmaCtrl_lower_bound`). -/
  cSigma : ℝ
  /-- abstract edge square-load slack (`exists_edge_square_load_bound`). -/
  Sload : ℝ
  /-- abstract `σ_E ≤ K·σ_ctrl` bridge constant. -/
  K : ℝ
  k0minM : ℕ
  k0density : ℕ
  k0ctrl : ℕ
  k1 : ℕ
  /-- threshold for the two residual mass-batch scale inequalities. -/
  k0mass : ℕ
  /-- threshold for the `σ_ctrl` lower bound. -/
  k0sigma : ℕ
  /-- threshold for the main-arc window-growth domination. -/
  k0window : ℕ
  /-- threshold for the cubic-Taylor quartic-absorption domination. -/
  k0cubic : ℕ
  /-- threshold for the edge square-load bound. -/
  k0load : ℕ
  hbpos : 0 < b
  hb3 : 3 ≤ b
  hbsf : Squarefree b
  hc3eq : c3 = bernoulliMainTermConstant
  hc3pos : 0 < c3
  hηpos : 0 < η
  hCtail : 0 < Ctail
  hcS1 : 1 ≤ cSigma
  hS1 : 1 ≤ Sload
  hK1 : 1 ≤ K
  hKS : Sload ≤ 4 * K ^ 2
  hG1 : 1 ≤ G
  hSB : ∀ {T' : Finset ℕ} {b' : ℕ}
      (D : R2ConcreteData T' b') (W : R2ConcreteData.Weights D) (N : ℤ)
      (Bblock Bextra ρ : ℝ) (Cls : R2MinorClassificationData D W N),
      k0minM ≤ D.BS.k0 → admissibleGlobalRange D.BS →
      R2MinorEndgameMultiGadgetLanes D W N Bblock Bextra η Ctail ρ Cls →
      Nonempty (R2MinorSupportBudgetData D W N Bblock Bextra)
  hCge3 : (3 : ℝ) ≤ C
  hCge1 : (1 : ℝ) ≤ C
  hbbdef : base_b = Real.sqrt (1 - (8 / 9) / (b : ℝ) ^ 2)
  hG : base_b ^ G ≤ Dmp
  hDmppos : 0 < Dmp
  /-- the whole minor budget beats `c3/K`; how it is allocated among the three lanes
  is the constructor's private witness. -/
  hbudget : (b : ℝ) * η + (b : ℝ) * (Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2))
      + (b : ℝ) * Dmp * (2 * C + 3) < c3 / K
  hk0density : ∀ k : ℕ, k0density ≤ k →
      (G : ℝ) ≤ (2 : ℝ) ^ k / (2 * Real.log ((2 : ℝ) ^ k))
  hk0ctrl : ∀ BS' : BlockSystem, k0ctrl ≤ BS'.k0 →
      R2ConcreteData.recipLoad (ctrlEdges BS') ≤ 3 / (4 * (b : ℝ))
  hk0massFact : ∀ k : ℕ, k0mass ≤ k →
      2 * b * (b.primeFactors.card * G) < 3 * 2 ^ k ∧
      2 * b < 2 ^ k
  hk0sigmaFact : ∀ BS' : BlockSystem, k0sigma ≤ BS'.k0 →
      (1 : ℝ) / (cSigma * (BS'.k0 : ℝ) * (2 : ℝ) ^ BS'.k0) ≤ sigmaCtrl BS'
  hk0windowFact : ∀ k : ℕ, k0window ≤ k →
      10 * (cSigma * (k : ℝ) ^ 2 * (2 : ℝ) ^ k + 1) ≤ (2 : ℝ) ^ (2 * k)
  hk0cubicFact : ∀ k : ℕ, k0cubic ≤ k →
      (40 * bernoulliTaylorRemainderConstant * Sload * (cSigma + 1)) *
        (k : ℝ) ^ 4 ≤ (2 : ℝ) ^ k
  hk0loadFact : ∀ {T' : Finset ℕ} (D : R2ConcreteData T' b), R2MassBatchSupply D →
      k0load ≤ D.BS.k0 → D.S.card = G →
      (∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s) → (∀ r ∈ D.R, 2 ≤ r) → D.R.card ≤ b →
      ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2 ≤ Sload * (sigmaCtrl D.BS) ^ 2
  hk15 : 5 ≤ k1
  hload : ∀ k0 : ℕ, k1 ≤ k0 →
      (1 : ℝ) / 2 ≤ ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
        (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ))

/-- **Block-system / prime-factor certificate.**  Given the numeric ledger `L`,
construct a block system `BS` whose bottom scale dominates every ledger threshold
(so all the later `k0`-largeness side conditions hold), together with the
prime-factor / support facts of `b` relative to `BS` (`hRp, hRdvd, hcovR, hRout`,
the block-support coprimality `hcopB`, and `hsub, hdyadic2k`). -/
structure BlockSystemCertificate (T : Finset ℕ) (b : ℕ) (L : ConstructionParameters b) where
  BS : BlockSystem
  hk05 : 5 ≤ BS.k0
  hadm : admissibleGlobalRange BS
  hsub : blockPrimes BS.k0 ⊆ blockSupport BS
  hcopB : BlockSupportCoprimeWith BS b
  hRp : ∀ r ∈ b.primeFactors, Nat.Prime r
  hRdvd : ∀ r ∈ b.primeFactors, r ∣ b
  hcovR : CoversPrimeDivisors b.primeFactors b
  hRout : ∀ r ∈ b.primeFactors, r ∉ blockSupport BS
  hdyadic2k : dyadicBlock (2 * BS.k0) ⊆ blockSupport BS
  hk0minM : L.k0minM ≤ BS.k0
  hk0dens : L.k0density ≤ BS.k0
  hk0ctrlle : L.k0ctrl ≤ BS.k0
  hk1le : L.k1 ≤ BS.k0
  hk0mass : L.k0mass ≤ BS.k0
  hk0T : T.sup id + 1 ≤ BS.k0
  hk0sigma : L.k0sigma ≤ BS.k0
  hk0window : L.k0window ≤ BS.k0
  hk0cubic : L.k0cubic ≤ BS.k0
  hk0load : L.k0load ≤ BS.k0
  hk0C : Nat.ceil L.C ≤ BS.k0

/-- **Foundation certificate.**  The join of the two foundation stages: the
numeric ledger of constants and thresholds (chosen first, independently of any
block system) and the block-system / prime-factor certificate at a bottom
scale dominating every ledger threshold. -/
structure ConstructionFoundation (T : Finset ℕ) (b : ℕ) where
  /-- the scale-parameter / constant stage. -/
  ledger : ConstructionParameters b
  /-- the block-system stage, at a scale dominating the ledger thresholds. -/
  bsCert : BlockSystemCertificate T b ledger

/-- Choose the numeric ledger of constants and bottom-scale thresholds.  This is
the scale-parameter slice of the foundation; no block system is constructed. -/
lemma exists_construction_parameters (b : ℕ) (hb : 3 ≤ b) (hbsf : Squarefree b) :
    Nonempty (ConstructionParameters b) := by
  classical
  have hbpos : 0 < b := by omega
  have hbR : (0 : ℝ) < (b : ℝ) := by exact_mod_cast hbpos
  have hc3pos : 0 < bernoulliMainTermConstant := bernoulliMainTermConstant_pos
  set c3 := bernoulliMainTermConstant with hc3def
  -- abstract analytic constants from the supply leaves (all witnesses stay inside them)
  obtain ⟨S, hS1, hSfam⟩ := exists_edge_square_load_bound
  have hS0 : (0 : ℝ) < S := lt_of_lt_of_le one_pos hS1
  obtain ⟨cσ, hcS1, k0sigma, hk0sigmaFact⟩ := exists_sigmaCtrl_lower_bound
  -- σ_E/σ_ctrl bridge constant: any K ≥ 1 with Sload ≤ 4K²
  set K : ℝ := max 1 (Real.sqrt S) with hKdef
  have hK1 : (1 : ℝ) ≤ K := le_max_left _ _
  have hK0 : (0 : ℝ) < K := lt_of_lt_of_le one_pos hK1
  have hKS : S ≤ 4 * K ^ 2 := by
    have h1 : Real.sqrt S ≤ K := le_max_right _ _
    have h2 : Real.sqrt S ^ 2 = S := Real.sq_sqrt hS0.le
    nlinarith [mul_self_le_mul_self (Real.sqrt_nonneg S) h1, h2, sq_nonneg K]
  -- budget allocation (the equal-quarters split below is a private witness of this proof)
  set η : ℝ := c3 / (4 * K * (b : ℝ)) with hηdef
  have hηpos : 0 < η := by rw [hηdef]; positivity
  obtain ⟨k0minM, Ctail, hCtail, hSB⟩ :=
    exists_r2_minorSupportBudget_from_multiGadget_lanes η hηpos
  obtain ⟨C0, hC0one, hC0bd⟩ :=
    exists_gaussian_tail_cutoff Ctail (c3 / K) b (by positivity)
  set C : ℝ := max C0 3 with hCdef
  have hCge3 : (3 : ℝ) ≤ C := le_max_right _ _
  have hCge1 : (1 : ℝ) ≤ C := le_trans (by norm_num) hCge3
  have h2C3 : (0 : ℝ) < 2 * C + 3 := by linarith
  set base_b : ℝ := Real.sqrt (1 - (8 / 9) / (b : ℝ) ^ 2) with hbbdef
  have hbb0 : 0 ≤ base_b := Real.sqrt_nonneg _
  have hbb1 : base_b < 1 := by
    rw [hbbdef]
    have hbr : (3 : ℝ) ≤ (b : ℝ) := by exact_mod_cast hb
    refine (Real.sqrt_lt' (by norm_num)).2 ?_
    rw [one_pow]
    have : (0 : ℝ) < (8 / 9) / (b : ℝ) ^ 2 := by positivity
    linarith
  set Dmp : ℝ := c3 / (4 * K * (b : ℝ) * (2 * C + 3)) with hDmpdef
  have hDmppos : 0 < Dmp := by
    rw [hDmpdef]; positivity
  obtain ⟨G', hG'⟩ := exists_pow_lt_of_lt_one hDmppos hbb1
  set G : ℕ := max 1 G' with hGdef
  have hG1 : 1 ≤ G := le_max_left _ _
  have hG : base_b ^ G ≤ Dmp :=
    le_trans (pow_le_pow_of_le_one hbb0 hbb1.le (le_max_right 1 G')) hG'.le
  obtain ⟨k0density, hk0density⟩ := exists_dyadic_density_threshold G
  obtain ⟨k0mass, hk0massFact⟩ := exists_mass_batch_scale_threshold G b
  obtain ⟨k1, hk15, hload⟩ := blockPrimes_product_load_ge
  obtain ⟨k0ctrl, hk0ctrl⟩ := exists_k0_controlLoad_lt (3 / (4 * (b : ℝ))) (by positivity)
  -- eventual polynomial ≪ exponential thresholds, at coefficients built from the
  -- abstract constants
  have hcS0 : (0 : ℝ) < cσ := lt_of_lt_of_le one_pos hcS1
  obtain ⟨kw, hkw⟩ :=
    RequestProject.exists_threshold_mul_pow_le_const_pow (10 * (cσ + 1)) 2 one_lt_two
  have hk0windowFact : ∀ k : ℕ, max kw 1 ≤ k →
      10 * (cσ * (k : ℝ) ^ 2 * (2 : ℝ) ^ k + 1) ≤ (2 : ℝ) ^ (2 * k) := by
    intro k hk
    have hk1 : 1 ≤ k := le_trans (le_max_right kw 1) hk
    have hk1R : (1 : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk1
    have hkw' := hkw k (le_trans (le_max_left kw 1) hk)
    have h2k : (1 : ℝ) ≤ (2 : ℝ) ^ k := one_le_pow₀ (by norm_num)
    have hk2 : (1 : ℝ) ≤ (k : ℝ) ^ 2 := one_le_pow₀ hk1R
    have hprod : (1 : ℝ) ≤ (k : ℝ) ^ 2 * (2 : ℝ) ^ k :=
      le_trans hk2 (le_mul_of_one_le_right (by positivity) h2k)
    calc 10 * (cσ * (k : ℝ) ^ 2 * (2 : ℝ) ^ k + 1)
        ≤ (10 * (cσ + 1)) * (k : ℝ) ^ 2 * (2 : ℝ) ^ k := by nlinarith [hprod]
      _ ≤ (2 : ℝ) ^ k * (2 : ℝ) ^ k := mul_le_mul_of_nonneg_right hkw' (by positivity)
      _ = (2 : ℝ) ^ (2 * k) := by rw [two_mul, pow_add]
  obtain ⟨k0cubic, hk0cubicFact⟩ :=
    RequestProject.exists_threshold_mul_pow_le_const_pow
      (40 * bernoulliTaylorRemainderConstant * S * (cσ + 1)) 4 one_lt_two
  obtain ⟨k0load, hk0loadFact⟩ := hSfam G b
  -- the single budget inequality (allocation: one quarter of `c3/K` per lane, one spare)
  have hbne : (b : ℝ) ≠ 0 := hbR.ne'
  have hKne : K ≠ 0 := hK0.ne'
  have h2C3ne : (2 * C + 3 : ℝ) ≠ 0 := h2C3.ne'
  have hb1 : (b : ℝ) * η = c3 / (4 * K) := by
    rw [hηdef]; field_simp
  have hb3 : (b : ℝ) * Dmp * (2 * C + 3) = c3 / (4 * K) := by
    rw [hDmpdef]; field_simp
  have hb2 : (b : ℝ) * (Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2)) < c3 / (4 * K) := by
    have hCC0 : C0 ≤ C := le_max_left _ _
    have hC0nn : (0 : ℝ) ≤ C0 := le_trans (by norm_num) hC0one
    have hmono : Real.exp (-C ^ 2 * (16 / 9) / 2) ≤ Real.exp (-C0 ^ 2 * (16 / 9) / 2) := by
      apply Real.exp_le_exp.mpr; nlinarith only [hCC0, hC0nn]
    calc (b : ℝ) * (Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2))
        = (b : ℝ) * Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2) := by ring
      _ ≤ (b : ℝ) * Ctail * Real.exp (-C0 ^ 2 * (16 / 9) / 2) :=
          mul_le_mul_of_nonneg_left hmono (by positivity)
      _ < c3 / K / 4 := hC0bd
      _ = c3 / (4 * K) := by rw [div_div, mul_comm]
  have hbudget : (b : ℝ) * η + (b : ℝ) * (Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2))
      + (b : ℝ) * Dmp * (2 * C + 3) < c3 / K := by
    have hq : (0 : ℝ) < c3 / (4 * K) := by positivity
    have h4 : 4 * (c3 / (4 * K)) = c3 / K := by
      rw [mul_div_assoc']
      exact mul_div_mul_left c3 K (by norm_num)
    linarith [hb1, hb2, hb3, hq, h4]
  exact ⟨{
    c3 := c3, η := η, Ctail := Ctail, C := C, base_b := base_b, Dmp := Dmp, G := G,
    cSigma := cσ, Sload := S, K := K,
    k0minM := k0minM, k0density := k0density, k0ctrl := k0ctrl, k1 := k1,
    k0mass := k0mass,
    k0sigma := k0sigma, k0window := max kw 1, k0cubic := k0cubic, k0load := k0load,
    hbpos := hbpos, hb3 := hb, hbsf := hbsf, hc3eq := hc3def, hc3pos := hc3pos,
    hηpos := hηpos, hCtail := hCtail,
    hcS1 := hcS1, hS1 := hS1, hK1 := hK1, hKS := hKS, hG1 := hG1,
    hSB := hSB, hCge3 := hCge3, hCge1 := hCge1,
    hbbdef := hbbdef, hG := hG, hDmppos := hDmppos, hbudget := hbudget,
    hk0density := hk0density, hk0ctrl := hk0ctrl, hk0massFact := hk0massFact,
    hk0sigmaFact := hk0sigmaFact, hk0windowFact := hk0windowFact,
    hk0cubicFact := hk0cubicFact, hk0loadFact := hk0loadFact,
    hk15 := hk15, hload := hload }⟩

/-- Build the block-system / prime-factor certificate at a bottom scale large
enough to dominate every threshold of the ledger `L`. -/
lemma exists_block_system_certificate (T : Finset ℕ) (b : ℕ) (hb : 3 ≤ b)
    (L : ConstructionParameters b) :
    Nonempty (BlockSystemCertificate T b L) := by
  classical
  set k0min' : ℕ :=
    L.k0minM + L.k0density + L.k1 + L.k0ctrl + (T.sup id + 1) + L.k0mass
      + L.k0sigma + L.k0window + L.k0cubic + L.k0load + Nat.ceil L.C
      with hk0mindef
  obtain ⟨BS, hk0, hk05, hadm, hsub, hcopB, hRp, hRdvd, hcovR, hRout, _h2kK, hdyadic2k⟩ :=
    exists_dyadic_blockSystem b hb k0min'
  have hk0minM : L.k0minM ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0dens : L.k0density ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk1le : L.k1 ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0ctrlle : L.k0ctrl ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0mass : L.k0mass ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0T : T.sup id + 1 ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0sigma : L.k0sigma ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0window : L.k0window ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0cubic : L.k0cubic ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0load : L.k0load ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  have hk0C : Nat.ceil L.C ≤ BS.k0 := by have h := hk0; rw [hk0mindef] at h; omega
  exact ⟨{
    BS := BS, hk05 := hk05, hadm := hadm, hsub := hsub, hcopB := hcopB,
    hRp := hRp, hRdvd := hRdvd, hcovR := hcovR, hRout := hRout, hdyadic2k := hdyadic2k,
    hk0minM := hk0minM, hk0dens := hk0dens, hk0ctrlle := hk0ctrlle, hk1le := hk1le,
    hk0mass := hk0mass, hk0T := hk0T,
    hk0sigma := hk0sigma, hk0window := hk0window, hk0cubic := hk0cubic,
    hk0load := hk0load, hk0C := hk0C }⟩

/-- Produce the foundation certificate from its two stages. -/
lemma exists_construction_foundation (T : Finset ℕ) (b : ℕ) (hb : 3 ≤ b)
    (hbsf : Squarefree b) :
    Nonempty (ConstructionFoundation T b) := by
  obtain ⟨L⟩ := exists_construction_parameters b hb hbsf
  obtain ⟨BSc⟩ := exists_block_system_certificate T b hb L
  exact ⟨⟨L, BSc⟩⟩



end CircleMethod

end
