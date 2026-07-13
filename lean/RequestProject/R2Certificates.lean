import RequestProject.R2TopAssembly
import RequestProject.Construction.MassBatchSupply
import RequestProject.R2FinalAssembly
import RequestProject.CircleMethod.MainArcNumericBounds

/-!
# R2 construction certificates

This file makes the architecture of the R2 arc construction explicit by factoring
the (previously monolithic) terminal assembly
`CircleMethod.exists_arcConstruction_final` through a sequence of named
*certificate* structures, one per conceptual layer:

* `R2FoundationCertificate` — global scale, the numeric ledger of constants
  (`c3, η, Ctail, C, base_b, Dmp, G, …`), the block system `BS`, and the
  prime-supply / large-`k0` facts every later layer consumes.
* `R2ConcreteCertificate` — the gadget-prime reservoir `S` and the prime-side
  structural facts (sizes, ordering, block membership).
* `R2MassCertificate` — the residual mass batch `Q` (a `R2MassBatchSupply`), the
  concrete edge data `D`, weights `W`, and the semiprime / avoidance /
  divisibility / nonemptiness / reciprocal-load-window facts of the edge set.
* `R2MainArcWindow` — the main-arc window parameter `N`, the `σ_E ↔ σ_ctrl`
  comparison, the Taylor/Gaussian numeric fields, and the `2N+1 ≤ L` bound.
* `R2MinorCertificate` — the minor-arc budget `Bm`, its block/extra component
  ledger, the domination `hbeat`, and the per-`MainArcFields` minor bound.
* `R2FinalSupply` (already defined upstream) — the socket consumed to produce an
  `ArcConstruction`.

The terminal theorem then reads as the schematic obtain-chain
`foundation → concrete → mass → main-arc → minor → final`, and each layer is an
independently inspectable node of the dependency graph rather than one black hole.

All proofs are transplanted verbatim from the original assembly; no mathematics
is changed.
-/

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-! ## Foundation / scale layer -/

/-- **Numeric ledger.**  The scale-parameter / constant slice of the foundation: the
budget quantities (`c3, η, Ctail, C, base_b, Dmp, G`), the abstract analytic constants
(`cSigma, Sload, K` — supplied existentially by leaf lemmas; no witness value is visible
at this level), the bottom-scale thresholds, and all the facts *independent of the chosen
block system*.  Every field states exactly the property its downstream consumer uses:
the single budget inequality `hbudget` replaces any definitional pinning of `η`/`Dmp`
(the allocation scheme is the constructor's private witness), and each threshold field
carries its eventual-domination fact parametrically. -/
structure R2NumericLedger (b : ℕ) where
  c3 : ℝ
  η : ℝ
  Ctail : ℝ
  C : ℝ
  base_b : ℝ
  Dmp : ℝ
  G : ℕ
  /-- abstract `σ_ctrl` lower-bound coefficient (`exists_sigmaCtrl_lower_supply`). -/
  cSigma : ℝ
  /-- abstract edge square-load slack (`exists_edge_square_load_supply`). -/
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
structure R2BlockSystemCertificate (T : Finset ℕ) (b : ℕ) (L : R2NumericLedger b) where
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
structure R2FoundationCertificate (T : Finset ℕ) (b : ℕ) where
  /-- the scale-parameter / constant stage. -/
  ledger : R2NumericLedger b
  /-- the block-system stage, at a scale dominating the ledger thresholds. -/
  bsCert : R2BlockSystemCertificate T b ledger

/-- Choose the numeric ledger of constants and bottom-scale thresholds.  This is
the scale-parameter slice of the foundation; no block system is constructed. -/
lemma exists_r2_numeric_ledger (b : ℕ) (hb : 3 ≤ b) (hbsf : Squarefree b) :
    Nonempty (R2NumericLedger b) := by
  classical
  have hbpos : 0 < b := by omega
  have hbR : (0 : ℝ) < (b : ℝ) := by exact_mod_cast hbpos
  have hc3pos : 0 < bernoulliMainTermConstant := bernoulliMainTermConstant_pos
  set c3 := bernoulliMainTermConstant with hc3def
  -- abstract analytic constants from the supply leaves (all witnesses stay inside them)
  obtain ⟨S, hS1, hSfam⟩ := exists_edge_square_load_supply
  have hS0 : (0 : ℝ) < S := lt_of_lt_of_le one_pos hS1
  obtain ⟨cσ, hcS1, k0sigma, hk0sigmaFact⟩ := exists_sigmaCtrl_lower_supply
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
    r2_exists_C Ctail (c3 / K) b (by positivity)
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
  obtain ⟨G', hG'⟩ := r2_exists_pow_le base_b Dmp hbb1 hDmppos
  set G : ℕ := max 1 G' with hGdef
  have hG1 : 1 ≤ G := le_max_left _ _
  have hG : base_b ^ G ≤ Dmp :=
    le_trans (pow_le_pow_of_le_one hbb0 hbb1.le (le_max_right 1 G')) hG'
  obtain ⟨k0density, hk0density⟩ := r2_exists_k0_density G
  obtain ⟨k0mass, hk0massFact⟩ := exists_mass_batch_scale_threshold G b
  obtain ⟨k1, hk15, hload⟩ := blockPrimes_product_load_ge
  obtain ⟨k0ctrl, hk0ctrl⟩ := exists_k0_controlLoad_lt (3 / (4 * (b : ℝ))) (by positivity)
  -- eventual polynomial ≪ exponential thresholds, at coefficients built from the
  -- abstract constants
  have hcS0 : (0 : ℝ) < cσ := lt_of_lt_of_le one_pos hcS1
  obtain ⟨kw, hkw⟩ :=
    RequestProject.exists_threshold_mul_pow_le_two_pow (10 * (cσ + 1)) 2
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
    RequestProject.exists_threshold_mul_pow_le_two_pow
      (40 * bernoulliTaylorRemainderConstant * S * (cσ + 1)) 4
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
lemma exists_r2_block_system_certificate (T : Finset ℕ) (b : ℕ) (hb : 3 ≤ b)
    (L : R2NumericLedger b) :
    Nonempty (R2BlockSystemCertificate T b L) := by
  classical
  set k0min' : ℕ :=
    L.k0minM + L.k0density + L.k1 + L.k0ctrl + (T.sup id + 1) + L.k0mass
      + L.k0sigma + L.k0window + L.k0cubic + L.k0load + Nat.ceil L.C
      with hk0mindef
  obtain ⟨BS, hk0, hk05, hadm, hsub, hcopB, hRp, hRdvd, hcovR, hRout, _h2kK, hdyadic2k⟩ :=
    exists_r2_foundation_dyadic b hb k0min'
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
lemma exists_r2_foundation_certificate (T : Finset ℕ) (b : ℕ) (hb : 3 ≤ b)
    (hbsf : Squarefree b) :
    Nonempty (R2FoundationCertificate T b) := by
  obtain ⟨L⟩ := exists_r2_numeric_ledger b hb hbsf
  obtain ⟨BSc⟩ := exists_r2_block_system_certificate T b hb L
  exact ⟨⟨L, BSc⟩⟩


/-! ## Concrete semiprime data layer (gadget prime reservoir) -/

/-- **Concrete certificate.**  The gadget-prime reservoir `S` chosen in the high
dyadic block `2·k0`, together with the prime-side structural facts: `S` consists
of primes that are large (`≥ 2^{2k0}`), sit in the block support, number exactly
`G`, and dominate the divisor primes `R = b.primeFactors`. -/
structure R2ConcreteCertificate {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) where
  /-- the gadget primes. -/
  S : Finset ℕ
  hScard : S.card = F.ledger.G
  hSprime : ∀ s ∈ S, Nat.Prime s
  hSge : ∀ s ∈ S, 2 ^ (2 * F.bsCert.BS.k0) ≤ s
  hSblock : S ⊆ blockSupport F.bsCert.BS
  hb2k0 : b < 2 ^ F.bsCert.BS.k0
  hRpos' : ∀ r ∈ b.primeFactors, 2 ≤ r
  hlt' : ∀ r ∈ b.primeFactors, ∀ s ∈ S, r < s

/-- Produce the concrete (gadget-prime) certificate from the foundation. -/
lemma exists_r2_concrete_certificate {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) :
    Nonempty (R2ConcreteCertificate F) := by
  classical
  have hbpos := F.ledger.hbpos
  have hk05 := F.bsCert.hk05
  have hk0dens := F.bsCert.hk0dens
  have hmass := F.ledger.hk0massFact F.bsCert.BS.k0 F.bsCert.hk0mass
  obtain ⟨S, hSsub, hScard, hSprime, hSge⟩ :=
    exists_block_primes (2 * F.bsCert.BS.k0) (by omega) F.ledger.G
      (F.ledger.hk0density (2 * F.bsCert.BS.k0) (by omega))
  have hSblock : S ⊆ blockSupport F.bsCert.BS := fun s hs => F.bsCert.hdyadic2k (hSsub hs)
  have hb2k0 : b < 2 ^ F.bsCert.BS.k0 := by omega
  have hRpos' : ∀ r ∈ b.primeFactors, 2 ≤ r := fun r hr => (F.bsCert.hRp r hr).two_le
  have hlt' : ∀ r ∈ b.primeFactors, ∀ s ∈ S, r < s := by
    intro r hr s hs
    have hrle : r ≤ b := Nat.le_of_dvd hbpos (F.bsCert.hRdvd r hr)
    have hsge : 2 ^ (2 * F.bsCert.BS.k0) ≤ s := hSge s hs
    have : 2 ^ F.bsCert.BS.k0 ≤ 2 ^ (2 * F.bsCert.BS.k0) := Nat.pow_le_pow_right (by norm_num) (by omega)
    omega
  exact ⟨⟨S, hScard, hSprime, hSge, hSblock, hb2k0, hRpos', hlt'⟩⟩

/-! ## Mass batch layer (residual batch `Q`, edge data, load window) -/

/-- **Mass certificate.**  The residual mass batch `Q` (packaged as a
`R2MassBatchSupply`, which records the reciprocal-load window
`3/(2b) ≤ baseLoad + recipLoad Q < 3/b`), the assembled concrete edge data `D`
and weights `W`, and the structural facts of the edge set: every edge is a
semiprime, positive, divides the period `L`, avoids `T`; the set is nonempty;
the total reciprocal load is `< 3/b`; and the inverse-square load is controlled
by `σ_ctrl`. -/
structure R2MassCertificate {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F) where
  /-- the residual mass batch. -/
  Q : Finset ℕ
  /-- the assembled concrete edge data. -/
  D : R2ConcreteData T b
  /-- the edge weights. -/
  W : R2ConcreteData.Weights D
  /-- the mass-batch supply (encodes the load window). -/
  QB : R2MassBatchSupply D
  hDdef : D = (⟨F.bsCert.BS, ∅, b.primeFactors, Cc.S⟩ : R2ConcreteData T b).withQ Q
  hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p
  hL : 0 < D.L
  hsemi : ∀ e ∈ D.E, IsSemiprime e
  he0 : ∀ e ∈ D.E, 0 < e
  heL : ∀ e ∈ D.E, e ∣ D.L
  hne : D.E.Nonempty
  hctrlAvoid : ∀ e ∈ ctrlEdges D.BS, e ∉ T
  hgadgetAvoid : ∀ e ∈ gadgetEdges D.R D.S, e ∉ T
  havoid : ∀ e ∈ D.E, e ∉ T
  hloadUpper : R2ConcreteData.recipLoad D.E < 3 / (b : ℝ)
  hsumE : ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2 ≤ F.ledger.Sload * (sigmaCtrl D.BS) ^ 2

/-- Produce the mass-batch certificate: choose the residual batch `Q`, assemble
`D` and `W`, and discharge the edge structural facts. -/
lemma exists_r2_mass_certificate {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F) :
    Nonempty (R2MassCertificate F Cc) := by
  classical
  have hbpos := F.ledger.hbpos
  have hmass : 2 * b * (b.primeFactors.card * Cc.S.card) < 3 * 2 ^ F.bsCert.BS.k0 ∧
      2 * b < 2 ^ F.bsCert.BS.k0 := by
    simpa [Cc.hScard] using
      F.ledger.hk0massFact F.bsCert.BS.k0 F.bsCert.hk0mass
  obtain ⟨Q, QB⟩ := r2_getQ F.ledger.hb3 F.bsCert.BS Cc.S F.bsCert.hsub Cc.hSge F.bsCert.hRout
    (F.ledger.hk0ctrl F.bsCert.BS F.bsCert.hk0ctrlle) F.ledger.k1 F.ledger.hk15 F.bsCert.hk1le F.ledger.hload
    hmass F.bsCert.hk0T
  set D : R2ConcreteData T b := (⟨F.bsCert.BS, ∅, b.primeFactors, Cc.S⟩ : R2ConcreteData T b).withQ Q
    with hDdef
  set W : R2ConcreteData.Weights D := QB.weights hbpos with hWdef
  have hScardD : D.S.card = F.ledger.G := Cc.hScard
  have hk0TD : T.sup id + 1 ≤ D.BS.k0 := F.bsCert.hk0T
  have hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p := rfl
  have hL : 0 < D.L := D.period_pos hbpos
  have hsemi : ∀ e ∈ D.E, IsSemiprime e := D.semiprime QB.q_semiprime F.bsCert.hRp Cc.hSprime Cc.hlt'
  have he0 : ∀ e ∈ D.E, 0 < e := D.edges_pos hsemi
  have heL : ∀ e ∈ D.E, e ∣ D.L := D.dvd_period QB.q_dvd_period F.bsCert.hRdvd Cc.hSblock
  have hne : D.E.Nonempty := D.nonempty_of_massBatch_nonempty QB.hQne
  have hTlt : ∀ e ∈ T, e < 2 ^ (2 * D.BS.k0) := by
    intro e he
    have h1 : e ≤ T.sup id := Finset.le_sup (f := id) he
    have h2 : D.BS.k0 < 2 ^ D.BS.k0 := Nat.lt_two_pow_self
    have h3 : 2 ^ D.BS.k0 ≤ 2 ^ (2 * D.BS.k0) := Nat.pow_le_pow_right (by norm_num) (by omega)
    omega
  have hctrlAvoid : ∀ e ∈ ctrlEdges D.BS, e ∉ T := by
    intro e he hT
    have hge : 2 ^ D.BS.k0 * 2 ^ D.BS.k0 ≤ e := ctrlEdges_ge_k0_square D.BS he
    have : 2 ^ D.BS.k0 * 2 ^ D.BS.k0 = 2 ^ (2 * D.BS.k0) := by rw [← pow_add]; ring_nf
    have := hTlt e hT; omega
  have hgadgetAvoid : ∀ e ∈ gadgetEdges D.R D.S, e ∉ T := by
    intro e he hT
    rw [mem_gadgetEdges] at he
    obtain ⟨r, hr, s, hs, rfl⟩ := he
    have hsge : 2 ^ (2 * D.BS.k0) ≤ s := Cc.hSge s hs
    have hr2 : 2 ≤ r := Cc.hRpos' r hr
    have := hTlt (r * s) hT
    have hsr : s ≤ r * s := le_mul_of_one_le_left (Nat.zero_le s) (by omega)
    omega
  have havoid : ∀ e ∈ D.E, e ∉ T :=
    D.avoid hctrlAvoid QB.hQavoid hgadgetAvoid
  have hloadUpper : R2ConcreteData.recipLoad D.E < 3 / (b : ℝ) :=
    (D.total_recipLoad_window_of_residual QB.hloadDisj QB.hloadLower QB.hloadUpper).2
  have hRcard : D.R.card ≤ b :=
    le_trans (Finset.card_le_card (fun x hx => Finset.mem_Icc.mpr
      ⟨Nat.pos_of_mem_primeFactors hx, Nat.le_of_mem_primeFactors hx⟩))
      (by rw [Nat.card_Icc]; omega)
  have hsumE : ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2
      ≤ F.ledger.Sload * (sigmaCtrl D.BS) ^ 2 :=
    F.ledger.hk0loadFact D QB F.bsCert.hk0load hScardD Cc.hSge Cc.hRpos' hRcard
  exact ⟨⟨Q, D, W, QB, hDdef, hLeq, hL, hsemi, he0, heL, hne, hctrlAvoid,
    hgadgetAvoid, havoid, hloadUpper, hsumE⟩⟩

/-! ## Main-arc window layer -/

/-- **σ_E ↔ σ_ctrl comparison.**  The edge variance `σ_E = √(sigmaE2 E θ)` is
two-sidedly comparable with the control deviation `σ_ctrl`: it is at least
`√(2/9)·σ_ctrl` (the `2/9` is the extremal value of `θ(1−θ)` on the weight window
`[1/3, 2/3]`, so this is a structural constant) and at most `K·σ_ctrl` for the
ledger's abstract bridge constant `K`.  The upper bound uses only the square-load
certificate `M.hsumE` and `Sload ≤ 4K²`; no witness value of either constant
appears anywhere in this chain. -/
lemma r2_main_arc_sigmaE_compare {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) :
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
structure R2MainArcWindow {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) where
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
lemma r2_main_arc_window_scale_period {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) (N : ℤ)
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
lemma exists_r2_main_arc_window {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) :
    Nonempty (R2MainArcWindow F Cc M) := by
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
  obtain ⟨hsigmaE_lb, hsigmaE_ub, hsigmaEpos⟩ := r2_main_arc_sigmaE_compare F Cc M
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
  obtain ⟨hN2, hNL, hNreal⟩ := r2_main_arc_window_scale_period F Cc M N hNhi
  have hNF : MainArcNumericBounds D.E W.theta N :=
    r2_close_numericFields D W N σ C F.ledger.cSigma F.ledger.Sload hσpos he0 QB hSgeD
      hRpos'D F.ledger.hcS1 F.ledger.hS1 hsumE hsigmaE_lb hNnonneg hCge3 hNlo hNsigma
      hk0pos hCk0 hwindow hcubic hNreal
  exact ⟨⟨N, hNnonneg, hNlo, hN2, hNL, hσpos, h2N1sigma, hsigmaE_ub, hsigmaEpos, hNF⟩⟩

/-! ## Minor-arc budget layer

The minor-arc budget factors through explicitly named certificate steps:

* **classification + lanes** — `r2_buildFreqLanes` builds the
  `R2MinorEndgameFrequencyLanes`, i.e. the block-lane fibre-tail estimate
  (`r2_blockFiberTail`, with the bounded `b`-to-1 multiplicity), the extra
  frequency count bound (`r2_extra_count_le`, `≤ b(2N+1)`), and the per-frequency
  gadget damping (`r2ExtraSiblingChoice_of_intLabelData`, the `G`-fold damping).
* **support budget** — `r2_minor_support_budget` feeds those lanes through the
  abstract minor-support supply principle `F.ledger.hSB` to produce the
  `R2MinorSupportBudgetData` (the block/extra cover with its two budget fields).
* **lane bound** — `r2_minor_lane_bound` combines the block and extra budgets via
  `hminorSum_of_block_extra_norm_bounds` into the per-`MainArcFields` minor sum
  bound `≤ r2MinorBudget`.
* **budget closure** — `r2_minor_budget_closure` proves the budget is dominated by
  the main-term floor at the actual `σ_E` (the ledger's single `hbudget` inequality +
  `hbeat_of_sigma_le_sigmaCtrl`, parametric in the abstract bridge constant `K`).
-/

/-- **Minor-arc budget value.**  The block component
`(b·η + b·Ctail·e^{-C²·(16/9)/2})/σ_ctrl` plus the extra component
`b·(2N+1)·Dmp`. -/
def r2MinorBudget {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) {Cc : R2ConcreteCertificate F}
    (M : R2MassCertificate F Cc) (A : R2MainArcWindow F Cc M) : ℝ :=
  ((b : ℝ) * F.ledger.η + (b : ℝ) * (F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2)))
      / sigmaCtrl M.D.BS
    + (b : ℝ) * (2 * (A.N : ℝ) + 1) * F.ledger.Dmp

/-- **Minor classification + support-budget certificate.**  Build the block,
extra-count, and gadget-damping frequency lanes (`r2_buildFreqLanes`) and feed
them through the abstract minor-support supply principle `F.ledger.hSB` to obtain the
`R2MinorSupportBudgetData`: the block/extra cover of the minor frequencies with
its block budget `(b·(η + Ctail·e^{…}))/σ_ctrl` and extra budget `b·(2N+1)·Dmp`. -/
lemma r2_minor_support_budget {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) (A : R2MainArcWindow F Cc M) :
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
per-`MainArcFields` minor-sum bound `∑_{h∈Sm} ‖fourierTerm h‖ ≤ r2MinorBudget`. -/
lemma r2_minor_lane_bound {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) (A : R2MainArcWindow F Cc M) :
    ∀ MA : MainArcFields M.D.E M.W.theta (M.D.L / b) M.D.L A.N,
      (∑ h ∈ MA.Sm, ‖fourierTerm M.D.E M.W.theta (M.D.L / b) M.D.L h‖) ≤ r2MinorBudget F M A := by
  obtain ⟨MB⟩ := r2_minor_support_budget F Cc M A
  intro MA
  refine hminorSum_of_block_extra_norm_bounds M.D.E M.W.theta (M.D.L / b) M.D.L MA.Sm
    ⟨MB.Sblock MA, MB.Sextra MA, MB.hcover MA⟩ _ _ (r2MinorBudget F M A)
    (MB.hblock MA) (MB.hextra MA) (le_of_eq ?_)
  unfold r2MinorBudget
  ring

/-- **Minor budget closure.**  The minor-arc budget is strictly dominated by the
main-term floor `0.8·e^{-π²/2}/2 / σ_E` at the actual edge variance `σ_E`.  Consumes
only the ledger's single budget inequality `hbudget` (how the budget was allocated
among the lanes is the ledger constructor's private witness), the window bound
`(2N+1)·σ ≤ 2C+3`, and the abstract comparison `σ_E ≤ K·σ_ctrl` — every step works
for an arbitrary positive `K`. -/
lemma r2_minor_budget_closure {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) (A : R2MainArcWindow F Cc M) :
    r2MinorBudget F M A < bernoulliMainTermConstant /
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
  have hsum : r2MinorBudget F M A
      ≤ ((b : ℝ) * F.ledger.η
          + (b : ℝ) * (F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2))
          + (b : ℝ) * F.ledger.Dmp * (2 * F.ledger.C + 3)) / sigmaCtrl M.D.BS := by
    unfold r2MinorBudget
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
  have hlt : r2MinorBudget F M A < F.ledger.c3 / (F.ledger.K * sigmaCtrl M.D.BS) := by
    have hstep : ((b : ℝ) * F.ledger.η
        + (b : ℝ) * (F.ledger.Ctail * Real.exp (-F.ledger.C ^ 2 * (16 / 9) / 2))
        + (b : ℝ) * F.ledger.Dmp * (2 * F.ledger.C + 3)) / sigmaCtrl M.D.BS
        < (F.ledger.c3 / F.ledger.K) / sigmaCtrl M.D.BS := by
      gcongr
      exact F.ledger.hbudget
    calc r2MinorBudget F M A
        ≤ _ := hsum
      _ < (F.ledger.c3 / F.ledger.K) / sigmaCtrl M.D.BS := hstep
      _ = F.ledger.c3 / (F.ledger.K * sigmaCtrl M.D.BS) := div_div _ _ _
  have hc3eq : F.ledger.c3 = bernoulliMainTermConstant := F.ledger.hc3eq
  rw [← hc3eq]
  exact hbeat_of_sigma_le_sigmaCtrl F.ledger.c3 (Real.sqrt (sigmaE2 M.D.E M.W.theta))
    (F.ledger.K * sigmaCtrl M.D.BS) (r2MinorBudget F M A)
    F.ledger.hc3pos A.hsigmaEpos (by positivity) A.hsigmaE_ub hlt

/-- **Minor certificate.**  The minor-arc budget `Bm`, the per-`MainArcFields`
minor-sum bound (assembled from the block lane and the gadget/extra lane via the
frequency-lane construction and the minor-support budget supply), and the
domination `hbeat` of `Bm` by the main-term floor at the actual `σ_E`. -/
structure R2MinorCertificate {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) (A : R2MainArcWindow F Cc M) where
  /-- the minor-arc budget. -/
  Bm : ℝ
  hminor : ∀ MA : MainArcFields M.D.E M.W.theta (M.D.L / b) M.D.L A.N,
      (∑ h ∈ MA.Sm, ‖fourierTerm M.D.E M.W.theta (M.D.L / b) M.D.L h‖) ≤ Bm
  hbeat : Bm < bernoulliMainTermConstant /
      Real.sqrt (sigmaE2 M.D.E M.W.theta)

/-- Produce the minor-arc certificate: take the minor budget `r2MinorBudget`, its
per-`MainArcFields` lane bound (`r2_minor_lane_bound`), and the budget-closure
domination (`r2_minor_budget_closure`).  This layer only assembles the named
component certificates. -/
lemma exists_r2_minor_certificate {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) (A : R2MainArcWindow F Cc M) :
    Nonempty (R2MinorCertificate F Cc M A) :=
  ⟨⟨r2MinorBudget F M A, r2_minor_lane_bound F Cc M A, r2_minor_budget_closure F Cc M A⟩⟩



/-! ## Final assembly -/

/-- **Final assembly.**  Consume the five certificates and fill the
`ArcConstruction` socket through the upstream `R2FinalSupply` endpoint.  This
layer chooses no parameters and chases no constants — it only threads the
already-built certificate data into `exists_arcConstruction_of_mainArcParams`. -/
lemma assemble_arcConstruction {T : Finset ℕ} {b : ℕ}
    (F : R2FoundationCertificate T b) (Cc : R2ConcreteCertificate F)
    (M : R2MassCertificate F Cc) (A : R2MainArcWindow F Cc M)
    (R : R2MinorCertificate F Cc M A) :
    Nonempty (ArcConstruction T b) :=
  exists_arcConstruction_of_mainArcParams F.ledger.hb3 M.D M.W A.N R.Bm A.hNnonneg A.hNL
    M.hsemi M.havoid M.hne M.heL M.he0 M.hloadUpper A.hNF.hN A.hNF.htw A.hNF.hsmall
    R.hminor R.hbeat

/-- **Terminal R2 existence theorem (factored).**  The arc construction exists
for squarefree `b ≥ 3`, assembled through the explicit certificate chain
`foundation → concrete → mass → main-arc → minor → final`. -/
theorem exists_arcConstruction_final (T : Finset ℕ) (b : ℕ)
    (hb : 3 ≤ b) (hbsf : Squarefree b) :
    Nonempty (ArcConstruction T b) := by
  obtain ⟨F⟩ := exists_r2_foundation_certificate T b hb hbsf
  obtain ⟨Cc⟩ := exists_r2_concrete_certificate F
  obtain ⟨M⟩ := exists_r2_mass_certificate F Cc
  obtain ⟨A⟩ := exists_r2_main_arc_window F Cc M
  obtain ⟨Rm⟩ := exists_r2_minor_certificate F Cc M A
  exact assemble_arcConstruction F Cc M A Rm

end CircleMethod

end
