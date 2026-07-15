import RequestProject.Construction.MassPool
import RequestProject.GlobalControl.DyadicPrimeBlockBounds
import RequestProject.GlobalControl.BlockRestriction

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# The base-load budget on the control and gadget edges

Single motivating question: **before the residual mass batch `D.Q` is even
chosen, how much of the total load window does the *fixed* base load (the
control edges plus the gadget edges) already spend?**  This is independent of
how `Q` is chosen (`Construction.MassPool`): it is about the other two edge
sets.  Three ingredients: control/gadget disjointness (so the base load
splits additively), a dyadic analytic estimate that the control load is
eventually negligible, and a finite cardinality bound on the gadget load.

The forbidden-budget bridge (`ForbiddenEdgeBudget.of_basePieces`) discharges
`Construction.MassPool`'s `ForbiddenEdgeBudget` using exactly this base-load
split, which is why this file imports that one rather than the reverse.

-/

/-- The support factors of a control edge both lie in `blockSupport BS`. -/
lemma mem_ctrlEdges_support_pair
    {BS : BlockSystem} {e : ℕ} (he : e ∈ ctrlEdges BS) :
    ∃ p ∈ blockSupport BS, ∃ q ∈ blockSupport BS, e = p * q := by
  rw [ctrlEdges, Finset.mem_image] at he
  obtain ⟨pq, hpq, rfl⟩ := he
  obtain ⟨hp, hq⟩ := ctrlPairs_mem_blockSupport BS hpq
  exact ⟨pq.1, hp, pq.2, hq, rfl⟩

/-- **Control/gadget disjointness.** If every gadget prime `r ∈ R` is prime and
outside the block support, then no control edge equals a gadget edge. -/
theorem ctrlEdges_disjoint_gadgetEdges_of_R_outside_blockSupport
    {BS : BlockSystem} {R S : Finset ℕ}
    (hRprime : ∀ r ∈ R, Nat.Prime r)
    (hRout : ∀ r ∈ R, r ∉ blockSupport BS) :
    Disjoint (ctrlEdges BS) (gadgetEdges R S) := by
  rw [Finset.disjoint_left]
  intro e hectrl hegadget
  obtain ⟨p, hp, q, hq, rfl⟩ := mem_ctrlEdges_support_pair hectrl
  rw [mem_gadgetEdges] at hegadget
  obtain ⟨r, hr, s, hs, hrs⟩ := hegadget
  have hrp : Nat.Prime r := hRprime r hr
  have hpp : Nat.Prime p := blockSupport_prime BS hp
  have hqp : Nat.Prime q := blockSupport_prime BS hq
  have hdvd : r ∣ p * q := by
    rw [hrs]
    exact dvd_mul_right r s
  rcases (Nat.Prime.dvd_mul hrp).mp hdvd with hrp' | hrq'
  · have : r = p := (Nat.prime_dvd_prime_iff_eq hrp hpp).mp hrp'
    exact hRout r hr (this ▸ hp)
  · have : r = q := (Nat.prime_dvd_prime_iff_eq hrp hqp).mp hrq'
    exact hRout r hr (this ▸ hq)

/-- Record-facing wrapper: the control/gadget components of an `ConstructionData`
record are disjoint as soon as its denominator primes are kept outside the block
support. -/
theorem ctrlEdges_disjoint_gadgetEdges_of_denominator_primes_outside_blockSupport
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (hRprime : ∀ r ∈ D.R, Nat.Prime r)
    (hRout : ∀ r ∈ D.R, r ∉ blockSupport D.BS) :
    Disjoint (ctrlEdges D.BS) (gadgetEdges D.R D.S) :=
  ctrlEdges_disjoint_gadgetEdges_of_R_outside_blockSupport hRprime hRout

/-- The fixed base load splits over disjoint control and gadget components. -/
lemma baseLoad_eq_ctrl_add_gadget_of_disjoint
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (hdisj : Disjoint (ctrlEdges D.BS) (gadgetEdges D.R D.S)) :
    D.baseLoad =
      ConstructionData.recipLoad (ctrlEdges D.BS) +
        ConstructionData.recipLoad (gadgetEdges D.R D.S) := by
  unfold ConstructionData.baseLoad ConstructionData.recipLoad
  rw [Finset.sum_union hdisj]

/-- Concrete forbidden budget using zero obstruction overlap and the full
control/gadget reciprocal loads as component budgets. -/
def ForbiddenEdgeBudget.of_basePieces
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (hTsmall : ∀ e ∈ T, e < 2 ^ D.BS.k0 * 2 ^ D.BS.k0) :
    ForbiddenEdgeBudget D where
  FT := 0
  Fctrl := ConstructionData.recipLoad (ctrlEdges D.BS)
  Fgadget := ConstructionData.recipLoad (gadgetEdges D.R D.S)
  hT := by
    rw [blockSupportPairPool_inter_T_eq_empty_of_lt_k0_square hTsmall]
    simp [ConstructionData.recipLoad]
  hctrl := by
    exact recipLoad_mono (Finset.inter_subset_right)
  hgadget := by
    exact recipLoad_mono (Finset.inter_subset_right)

/-- For `b ≥ 3`, the target load obeys `3/(2b) ≤ 1/2`. -/
lemma three_div_two_mul_le_half_of_three_le {b : ℕ} (hb : 3 ≤ b) :
    3 / (2 * (b : ℝ)) ≤ (1 : ℝ) / 2 := by
  have hbR : (3 : ℝ) ≤ (b : ℝ) := by exact_mod_cast hb
  have hbne : (b : ℝ) ≠ 0 := by positivity
  field_simp [hbne]
  nlinarith

/-- With zero obstruction overlap and disjoint fixed components, the net load
of the base-piece forbidden budget is at most `1/2`. -/
theorem ForbiddenEdgeBudget.of_basePieces_net_load_le_half
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (hb : 3 ≤ b)
    (hTsmall : ∀ e ∈ T, e < 2 ^ D.BS.k0 * 2 ^ D.BS.k0)
    (hdisj : Disjoint (ctrlEdges D.BS) (gadgetEdges D.R D.S)) :
    let B := ForbiddenEdgeBudget.of_basePieces D hTsmall
    (3 / (2 * (b : ℝ)) - D.baseLoad) + (B.FT + B.Fctrl + B.Fgadget)
      ≤ (1 : ℝ) / 2 := by
  intro B
  have hbase := baseLoad_eq_ctrl_add_gadget_of_disjoint D hdisj
  have htarget := three_div_two_mul_le_half_of_three_le hb
  dsimp [B, ForbiddenEdgeBudget.of_basePieces]
  rw [hbase]
  linarith

/-- The fixed base load splits exactly into control and gadget reciprocal
loads, if every gadget denominator prime lies outside the block support. -/
theorem baseLoad_eq_ctrl_add_gadget_of_R_outside
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (hRprime : ∀ r ∈ D.R, Nat.Prime r)
    (hRout : ∀ r ∈ D.R, r ∉ blockSupport D.BS) :
    D.baseLoad =
      ConstructionData.recipLoad (ctrlEdges D.BS) +
        ConstructionData.recipLoad (gadgetEdges D.R D.S) := by
  exact baseLoad_eq_ctrl_add_gadget_of_disjoint D
    (ctrlEdges_disjoint_gadgetEdges_of_denominator_primes_outside_blockSupport D hRprime hRout)

/-- Separate control/gadget budgets for the base-load upper condition. -/
structure BaseLoadBudget
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b) where
  Cctrl : ℝ
  Cgadget : ℝ
  hctrl : ConstructionData.recipLoad (ctrlEdges D.BS) ≤ Cctrl
  hgadget : ConstructionData.recipLoad (gadgetEdges D.R D.S) ≤ Cgadget
  hsum : Cctrl + Cgadget < 3 / (2 * (b : ℝ))

/-- Component budgets imply the requested strict base-load upper bound. -/
theorem baseLoad_lt_of_budget
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (hRprime : ∀ r ∈ D.R, Nat.Prime r)
    (hRout : ∀ r ∈ D.R, r ∉ blockSupport D.BS)
    (B : BaseLoadBudget D) :
    D.baseLoad < 3 / (2 * (b : ℝ)) := by
  rw [baseLoad_eq_ctrl_add_gadget_of_R_outside D hRprime hRout]
  exact lt_of_le_of_lt (add_le_add B.hctrl B.hgadget) B.hsum

lemma block_recip_sum_le_four_div (BS : BlockSystem) (k : ℕ) (hk : 1 ≤ k) :
    ∑ p ∈ BS.P k, (1 : ℝ) / (p : ℝ) ≤ 4 / (k : ℝ) := by
  refine le_trans
    (Finset.sum_le_sum_of_subset_of_nonneg ?_ (fun _ _ _ => by positivity))
    (dyadicBlock_recip_sum_le_four_div k hk)
  intro p hp
  exact Finset.mem_filter.mpr ⟨Finset.mem_Ico.mpr (BS.hwindow k p hp), BS.hprime k p hp⟩

lemma internalPairs_recip_sum_le_sq (BS : BlockSystem) (k : ℕ) :
    ∑ pq ∈ internalPairs BS k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2)
      ≤ (∑ p ∈ BS.P k, (1 : ℝ) / (p : ℝ)) ^ 2 := by
  have hsub : internalPairs BS k ⊆ BS.P k ×ˢ BS.P k := by
    intro pq hpq
    rw [internalPairs, Finset.mem_filter] at hpq
    exact hpq.1
  calc
    ∑ pq ∈ internalPairs BS k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2)
        ≤ ∑ pq ∈ BS.P k ×ˢ BS.P k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) :=
          Finset.sum_le_sum_of_subset_of_nonneg hsub (fun _ _ _ => by positivity)
    _ = (∑ p ∈ BS.P k, (1 : ℝ) / (p : ℝ)) ^ 2 := by
      rw [Finset.sum_product]
      rw [sq]
      simp [div_eq_mul_inv, Finset.mul_sum, mul_comm]

lemma bipartitePairs_recip_sum_eq_mul (BS : BlockSystem) (k : ℕ) :
    ∑ pq ∈ bipartitePairs BS k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2)
      =
        (∑ q ∈ BS.P (k + 1), (1 : ℝ) / (q : ℝ)) *
          (∑ p ∈ BS.P k, (1 : ℝ) / (p : ℝ)) := by
  rw [bipartitePairs, Finset.sum_product_right]
  simp [div_eq_mul_inv, Finset.mul_sum, mul_comm]

lemma inv_sq_sum_Icc_le (k0 K : ℕ) (hk0 : 2 ≤ k0) :
    ∑ k ∈ Finset.Icc k0 K, (1 : ℝ) / (k : ℝ) ^ 2 ≤ 1 / ((k0 : ℝ) - 1) := by
  by_cases hK : k0 ≤ K
  · have h_sum_bound : ∀ n : ℕ, k0 ≤ n → (1 : ℝ) / (n : ℝ) ^ 2 ≤
        1 / ((n : ℝ) - 1) - 1 / (n : ℝ) := by
      intro n hn
      have hn2 : (2 : ℝ) ≤ n := by exact_mod_cast le_trans hk0 hn
      rw [div_sub_div, div_le_div_iff₀] <;> nlinarith
    have h_telescope : ∀ N : ℕ, k0 ≤ N →
        (∑ n ∈ Finset.Ico k0 N, (1 / ((n : ℝ) - 1) - 1 / (n : ℝ)))
          = (1 / ((k0 : ℝ) - 1)) - (1 / ((N : ℝ) - 1)) := by
      intro N hN
      induction hN with
      | refl =>
          simp
      | @step N hN ih =>
          rw [Finset.sum_Ico_succ_top hN, ih]
          norm_num
    have hIcc :
        ∑ k ∈ Finset.Icc k0 K, (1 : ℝ) / (k : ℝ) ^ 2
          = ∑ k ∈ Finset.Ico k0 (K + 1), (1 : ℝ) / (k : ℝ) ^ 2 := by
      have hsets : Finset.Icc k0 K = Finset.Ico k0 (K + 1) := by
        ext k
        simp
      rw [hsets]
    rw [hIcc]
    exact le_trans (Finset.sum_le_sum fun i hi => h_sum_bound i (Finset.mem_Ico.mp hi).1) (by
      rw [h_telescope (K + 1) (Nat.le_succ_of_le hK)]
      exact sub_le_self _ <| one_div_nonneg.mpr <| sub_nonneg.mpr <| by
        exact_mod_cast (by omega : 1 ≤ K + 1))
  · have hempty : Finset.Icc k0 K = ∅ := by
      ext x
      constructor
      · intro hx
        exact False.elim (hK (le_trans (Finset.mem_Icc.mp hx).1 (Finset.mem_Icc.mp hx).2))
      · intro hx
        exact False.elim (Finset.notMem_empty x hx)
    rw [hempty]
    simp
    omega

/-- Elementary dyadic control-load bound. -/
lemma ctrl_recipLoad_le_tail (BS : BlockSystem) (hk0 : 2 ≤ BS.k0) :
    ConstructionData.recipLoad (ctrlEdges BS) ≤ 512 / ((BS.k0 : ℝ) - 1) := by
  let f : ℕ × ℕ → ℝ := fun pq => (1 : ℝ) / ((pq.1 : ℝ) * pq.2)
  have hsum_ctrl :
      ConstructionData.recipLoad (ctrlEdges BS) = ∑ pq ∈ ctrlPairs BS, f pq := by
    unfold ConstructionData.recipLoad ctrlEdges f
    rw [Finset.sum_image (fun a ha b hb hab => ctrlPairs_prod_injOn BS ha hb hab)]
    simp only [Nat.cast_mul]
  have hpair :
      ∑ pq ∈ ctrlPairs BS, f pq
        ≤ ∑ k ∈ Finset.Icc BS.k0 BS.K, (4 / (k : ℝ)) ^ 2
          + ∑ k ∈ Finset.Ico BS.k0 BS.K, (4 / (k : ℝ)) * (4 / ((k + 1 : ℕ) : ℝ)) := by
    have hint : ∀ k ∈ Finset.Icc BS.k0 BS.K,
        ∑ pq ∈ internalPairs BS k, f pq ≤ (4 / (k : ℝ)) ^ 2 := by
      intro k hk
      have hk1 : 1 ≤ k := le_trans (le_trans (by omega : 1 ≤ BS.k0) (Finset.mem_Icc.mp hk).1) le_rfl
      have hsum_nonneg : 0 ≤ ∑ p ∈ BS.P k, (1 : ℝ) / (p : ℝ) :=
        Finset.sum_nonneg fun _ _ => by positivity
      have hblock := block_recip_sum_le_four_div BS k hk1
      have hfour_nonneg : 0 ≤ 4 / (k : ℝ) := by positivity
      exact le_trans (internalPairs_recip_sum_le_sq BS k)
        (sq_le_sq' (by nlinarith) hblock)
    have hbip : ∀ k ∈ Finset.Ico BS.k0 BS.K,
        ∑ pq ∈ bipartitePairs BS k, f pq
          ≤ (4 / (k : ℝ)) * (4 / ((k + 1 : ℕ) : ℝ)) := by
      intro k hk
      have hk1 : 1 ≤ k := by
        exact le_trans (by omega : 1 ≤ BS.k0) (Finset.mem_Ico.mp hk).1
      have hk1' : 1 ≤ k + 1 := by omega
      rw [bipartitePairs_recip_sum_eq_mul]
      have h1 := block_recip_sum_le_four_div BS (k + 1) hk1'
      have h2 := block_recip_sum_le_four_div BS k hk1
      have hmul := mul_le_mul h1 h2 (by positivity) (by positivity)
      nlinarith
    refine le_trans ?_ (add_le_add (Finset.sum_le_sum hint) (Finset.sum_le_sum hbip))
    rw [ctrlPairs, ← Finset.sum_biUnion, ← Finset.sum_biUnion]
    · rw [← Finset.sum_union_inter]
      exact le_add_of_le_of_nonneg
        (Finset.sum_le_sum_of_subset_of_nonneg (by aesop_cat) fun _ _ _ => by positivity)
        (Finset.sum_nonneg fun _ _ => by positivity)
    · intros k hk l hl hkl
      simp_all +decide [Finset.disjoint_left, bipartitePairs]
      intro a b ha hb ha' hb'
      have := blocks_disjoint BS (show k ≠ l by tauto)
      simp_all +decide [Finset.disjoint_left]
    · intros k hk l hl hkl
      simp_all +decide [Finset.disjoint_left, internalPairs]
      exact fun a b ha hb hab ha' hb' => hkl <| by
        have := blocks_disjoint BS (show k ≠ l from hkl)
        exact False.elim <| Finset.disjoint_left.mp this ha ha'
  rw [hsum_ctrl]
  refine le_trans hpair ?_
  have hIco_sub : Finset.Ico BS.k0 BS.K ⊆ Finset.Icc BS.k0 BS.K := by
    intro k hk
    exact Finset.mem_Icc.mpr ⟨(Finset.mem_Ico.mp hk).1, (Finset.mem_Ico.mp hk).2.le⟩
  have hterm_Icc : ∀ k ∈ Finset.Icc BS.k0 BS.K,
      (4 / (k : ℝ)) ^ 2 ≤ 16 * ((1 : ℝ) / (k : ℝ) ^ 2) := by
    intro k hk
    ring_nf
    exact le_rfl
  have hterm_Ico : ∀ k ∈ Finset.Ico BS.k0 BS.K,
      (4 / (k : ℝ)) * (4 / ((k + 1 : ℕ) : ℝ)) ≤
        16 * ((1 : ℝ) / (k : ℝ) ^ 2) := by
    intro k hk
    have hkpos : (0 : ℝ) < k := by
      exact_mod_cast lt_of_lt_of_le (by omega : 0 < BS.k0) (Finset.mem_Ico.mp hk).1
    have hsucc : (k : ℝ) ≤ ((k + 1 : ℕ) : ℝ) := by norm_num
    have hinv : (1 : ℝ) / ((k + 1 : ℕ) : ℝ) ≤ 1 / (k : ℝ) :=
      one_div_le_one_div_of_le hkpos hsucc
    have hnonneg : 0 ≤ (1 : ℝ) / (k : ℝ) := one_div_nonneg.mpr hkpos.le
    have hmul := mul_le_mul_of_nonneg_left hinv hnonneg
    ring_nf at hmul ⊢
    nlinarith
  calc
    ∑ k ∈ Finset.Icc BS.k0 BS.K, (4 / (k : ℝ)) ^ 2
          + ∑ k ∈ Finset.Ico BS.k0 BS.K, (4 / (k : ℝ)) * (4 / ((k + 1 : ℕ) : ℝ))
        ≤ ∑ k ∈ Finset.Icc BS.k0 BS.K, 16 * ((1 : ℝ) / (k : ℝ) ^ 2)
          + ∑ k ∈ Finset.Ico BS.k0 BS.K, 16 * ((1 : ℝ) / (k : ℝ) ^ 2) :=
        add_le_add (Finset.sum_le_sum hterm_Icc) (Finset.sum_le_sum hterm_Ico)
    _ ≤ ∑ k ∈ Finset.Icc BS.k0 BS.K, 16 * ((1 : ℝ) / (k : ℝ) ^ 2)
          + ∑ k ∈ Finset.Icc BS.k0 BS.K, 16 * ((1 : ℝ) / (k : ℝ) ^ 2) := by
        have hsecond :
            ∑ k ∈ Finset.Ico BS.k0 BS.K, 16 * ((1 : ℝ) / (k : ℝ) ^ 2)
              ≤ ∑ k ∈ Finset.Icc BS.k0 BS.K, 16 * ((1 : ℝ) / (k : ℝ) ^ 2) :=
          Finset.sum_le_sum_of_subset_of_nonneg hIco_sub (fun _ _ _ => by positivity)
        exact add_le_add_right hsecond _
    _ = 32 * ∑ k ∈ Finset.Icc BS.k0 BS.K, ((1 : ℝ) / (k : ℝ) ^ 2) := by
        rw [← Finset.sum_add_distrib, Finset.mul_sum]
        exact Finset.sum_congr rfl (fun k _ => by ring)
    _ ≤ 512 / ((BS.k0 : ℝ) - 1) := by
        have htail := inv_sq_sum_Icc_le BS.k0 BS.K hk0
        have hden_nonneg : 0 ≤ (BS.k0 : ℝ) - 1 := by
          have hcast : (1 : ℝ) ≤ BS.k0 := by exact_mod_cast (by omega : 1 ≤ BS.k0)
          linarith
        have hpos : 0 ≤ (1 : ℝ) / ((BS.k0 : ℝ) - 1) :=
          one_div_nonneg.mpr hden_nonneg
        calc
          32 * ∑ k ∈ Finset.Icc BS.k0 BS.K, (1 : ℝ) / (k : ℝ) ^ 2
              ≤ 32 * (1 / ((BS.k0 : ℝ) - 1)) :=
            mul_le_mul_of_nonneg_left htail (by norm_num)
          _ ≤ 512 / ((BS.k0 : ℝ) - 1) := by
            show 32 * (1 / ((BS.k0 : ℝ) - 1)) ≤ 512 / ((BS.k0 : ℝ) - 1)
            simpa [div_eq_mul_inv, one_mul] using
              mul_le_mul_of_nonneg_right (by norm_num : (32 : ℝ) ≤ 512) hpos

/-- Analytic socket: the dyadic reciprocal estimate needed to make the control
load eventually small.  Existing dyadic inputs are lower bounds and do not imply
this upper bound. -/
theorem dyadic_control_recipLoad_eventually_small :
  ∀ ε : ℝ, 0 < ε →
    ∃ k0min : ℕ, ∀ BS : BlockSystem, k0min ≤ BS.k0 →
      ConstructionData.recipLoad (ctrlEdges BS) ≤ ε :=
by
  intro ε hε
  obtain ⟨N, hN⟩ : ∃ N : ℕ, 2 ≤ N ∧ 512 / ((N : ℝ) - 1) ≤ ε := by
    obtain ⟨N0, hN0⟩ := exists_nat_gt (512 / ε + 2)
    let N := max 3 N0
    refine ⟨N, by omega, ?_⟩
    have hbig : 512 / ε < (N : ℝ) - 1 := by
      have hle : (N0 : ℝ) ≤ N := by exact_mod_cast Nat.le_max_right 3 N0
      nlinarith
    have hmul : 512 < ε * ((N : ℝ) - 1) := by
      rw [div_lt_iff₀ hε] at hbig
      linarith
    have hden : 0 < (N : ℝ) - 1 := by nlinarith [hε, hmul]
    exact le_of_lt (by
      rw [div_lt_iff₀ hden]
      exact hmul)
  refine ⟨N, fun BS hBS => ?_⟩
  exact le_trans (ctrl_recipLoad_le_tail BS (le_trans hN.1 hBS)) (by
    have hden : (N : ℝ) - 1 ≤ (BS.k0 : ℝ) - 1 := by
      have hcast : (N : ℝ) ≤ BS.k0 := by exact_mod_cast hBS
      linarith
    have hposN : 0 < (N : ℝ) - 1 := by
      have hcast : (1 : ℝ) < N := by exact_mod_cast (by omega : 1 < N)
      linarith
    have hposBS : 0 < (BS.k0 : ℝ) - 1 := by
      have hcast : (1 : ℝ) < BS.k0 := by exact_mod_cast (lt_of_lt_of_le (by omega : 1 < N) hBS)
      linarith
    have hmono : 512 / ((BS.k0 : ℝ) - 1) ≤ 512 / ((N : ℝ) - 1) := by
      exact div_le_div_of_nonneg_left (by norm_num) hposN hden
    exact le_trans hmono hN.2)

/-- Construction-facing wrapper for the dyadic control-load input. -/
theorem exists_k0_controlLoad_lt
    (ε : ℝ) (hε : 0 < ε) :
    ∃ k0min : ℕ, ∀ BS : BlockSystem, k0min ≤ BS.k0 →
      ConstructionData.recipLoad (ctrlEdges BS) ≤ ε :=
  dyadic_control_recipLoad_eventually_small ε hε

lemma gadgetEdges_ge_mul
    {R S : Finset ℕ} {r0 s0 e : ℕ}
    (hRlow : ∀ r ∈ R, r0 ≤ r)
    (hSlow : ∀ s ∈ S, s0 ≤ s)
    (he : e ∈ gadgetEdges R S) :
    r0 * s0 ≤ e := by
  rw [mem_gadgetEdges] at he
  obtain ⟨r, hr, s, hs, rfl⟩ := he
  exact Nat.mul_le_mul (hRlow r hr) (hSlow s hs)

lemma gadgetEdges_card_le_product (R S : Finset ℕ) :
    (gadgetEdges R S).card ≤ R.card * S.card := by
  rw [gadgetEdges]
  refine le_trans Finset.card_image_le ?_
  rw [Finset.card_product]

lemma gadget_recip_le_of_lower_bounds
    {R S : Finset ℕ} {r0 s0 e : ℕ}
    (hr0 : 0 < r0) (hs0 : 0 < s0)
    (hRlow : ∀ r ∈ R, r0 ≤ r)
    (hSlow : ∀ s ∈ S, s0 ≤ s)
    (he : e ∈ gadgetEdges R S) :
    (1 : ℝ) / (e : ℝ) ≤ 1 / ((r0 * s0 : ℕ) : ℝ) := by
  have hle : ((r0 * s0 : ℕ) : ℝ) ≤ (e : ℝ) := by
    exact_mod_cast gadgetEdges_ge_mul hRlow hSlow he
  have hpos : (0 : ℝ) < ((r0 * s0 : ℕ) : ℝ) := by
    exact_mod_cast Nat.mul_pos hr0 hs0
  exact one_div_le_one_div_of_le hpos hle

theorem gadget_recipLoad_le_card_div
    {R S : Finset ℕ} (r0 s0 : ℕ)
    (hr0 : 0 < r0) (hs0 : 0 < s0)
    (hRlow : ∀ r ∈ R, r0 ≤ r)
    (hSlow : ∀ s ∈ S, s0 ≤ s) :
    ConstructionData.recipLoad (gadgetEdges R S)
      ≤ ((R.card * S.card : ℕ) : ℝ) / ((r0 * s0 : ℕ) : ℝ) := by
  have hpos : (0 : ℝ) < ((r0 * s0 : ℕ) : ℝ) := by
    exact_mod_cast Nat.mul_pos hr0 hs0
  have hcard :
      ((gadgetEdges R S).card : ℝ) ≤ ((R.card * S.card : ℕ) : ℝ) := by
    exact_mod_cast gadgetEdges_card_le_product R S
  calc
    ConstructionData.recipLoad (gadgetEdges R S)
        ≤ ∑ _e ∈ gadgetEdges R S, (1 : ℝ) / ((r0 * s0 : ℕ) : ℝ) := by
          refine Finset.sum_le_sum (fun e he => ?_)
          exact gadget_recip_le_of_lower_bounds hr0 hs0 hRlow hSlow he
    _ = ((gadgetEdges R S).card : ℝ) * (1 / ((r0 * s0 : ℕ) : ℝ)) := by
          rw [Finset.sum_const, nsmul_eq_mul]
    _ ≤ ((R.card * S.card : ℕ) : ℝ) * (1 / ((r0 * s0 : ℕ) : ℝ)) := by
          exact mul_le_mul_of_nonneg_right hcard (le_of_lt (one_div_pos.mpr hpos))
    _ = ((R.card * S.card : ℕ) : ℝ) / ((r0 * s0 : ℕ) : ℝ) := by
          ring

def baseLoadBudget_of_component_bounds
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (Cctrl Cgadget : ℝ)
    (hctrl : ConstructionData.recipLoad (ctrlEdges D.BS) ≤ Cctrl)
    (hgadget : ConstructionData.recipLoad (gadgetEdges D.R D.S) ≤ Cgadget)
    (hsum : Cctrl + Cgadget < 3 / (2 * (b : ℝ))) :
    BaseLoadBudget D where
  Cctrl := Cctrl
  Cgadget := Cgadget
  hctrl := hctrl
  hgadget := hgadget
  hsum := hsum

def baseLoadBudget_of_control_and_gadget
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (Cctrl Cgadget : ℝ)
    (hctrl : ConstructionData.recipLoad (ctrlEdges D.BS) ≤ Cctrl)
    (hgadget : ConstructionData.recipLoad (gadgetEdges D.R D.S) ≤ Cgadget)
    (hsum : Cctrl + Cgadget < 3 / (2 * (b : ℝ))) :
    BaseLoadBudget D :=
  baseLoadBudget_of_component_bounds D Cctrl Cgadget hctrl hgadget hsum

theorem exists_k0_baseLoadBudget_of_gadget_bound
    {T : Finset ℕ} {b : ℕ}
    (D0 : ConstructionData T b)
    (Cgadget : ℝ)
    (hgap : Cgadget < 3 / (2 * (b : ℝ)))
    (hgadget_bound : ∀ D : ConstructionData T b,
      D.R = D0.R → D.S = D0.S →
      ConstructionData.recipLoad (gadgetEdges D.R D.S) ≤ Cgadget) :
    ∃ k0min : ℕ, ∀ D : ConstructionData T b, k0min ≤ D.BS.k0 →
      D.R = D0.R → D.S = D0.S →
      Nonempty (BaseLoadBudget D) := by
  let target : ℝ := 3 / (2 * (b : ℝ))
  let ε : ℝ := (target - Cgadget) / 2
  have hε : 0 < ε := by
    dsimp [ε, target]
    nlinarith
  obtain ⟨k0min, hctrl⟩ := exists_k0_controlLoad_lt ε hε
  refine ⟨k0min, ?_⟩
  intro D hk0 hR hS
  refine ⟨baseLoadBudget_of_component_bounds D ε Cgadget (hctrl D.BS hk0)
    (hgadget_bound D hR hS) ?_⟩
  · dsimp [ε, target]
    nlinarith

def baseLoadBudget_of_control_epsilon_and_gadget_scale
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (ε : ℝ) (r0 s0 : ℕ)
    (hr0 : 0 < r0) (hs0 : 0 < s0)
    (hctrl : ConstructionData.recipLoad (ctrlEdges D.BS) ≤ ε)
    (hRlow : ∀ r ∈ D.R, r0 ≤ r)
    (hSlow : ∀ s ∈ D.S, s0 ≤ s)
    (hsum :
      ε + ((D.R.card * D.S.card : ℕ) : ℝ) / ((r0 * s0 : ℕ) : ℝ)
        < 3 / (2 * (b : ℝ))) :
    BaseLoadBudget D :=
  baseLoadBudget_of_component_bounds D ε
    (((D.R.card * D.S.card : ℕ) : ℝ) / ((r0 * s0 : ℕ) : ℝ))
    hctrl
    (gadget_recipLoad_le_card_div r0 s0 hr0 hs0 hRlow hSlow)
    hsum

lemma blockSupport_ge_pow_k0 (BS : BlockSystem) {p : ℕ}
    (hp : p ∈ blockSupport BS) :
    2 ^ BS.k0 ≤ p := by
  rw [blockSupport, Finset.mem_biUnion] at hp
  obtain ⟨k, hk, hpk⟩ := hp
  rw [Finset.mem_Icc] at hk
  calc 2 ^ BS.k0 ≤ 2 ^ k := Nat.pow_le_pow_right (by norm_num) hk.1
    _ ≤ p := (BS.hwindow k p hpk).1

lemma ctrlEdges_ge_k0_square
    (BS : BlockSystem) {e : ℕ} (he : e ∈ ctrlEdges BS) :
    2 ^ BS.k0 * 2 ^ BS.k0 ≤ e := by
  rw [ctrlEdges, Finset.mem_image] at he
  obtain ⟨pq, hpq, rfl⟩ := he
  obtain ⟨h1, h2⟩ := ctrlPairs_mem_blockSupport BS hpq
  exact Nat.mul_le_mul (blockSupport_ge_pow_k0 BS h1) (blockSupport_ge_pow_k0 BS h2)

end CircleMethod

end
