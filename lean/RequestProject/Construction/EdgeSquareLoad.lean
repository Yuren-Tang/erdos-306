import RequestProject.Construction.MassPool
import RequestProject.Construction.BaseLoadBudget
import RequestProject.CircleMethod.ControlVarianceComparison
import RequestProject.Core.ExponentialDomination
import RequestProject.DyadicBlockUpper
import RequestProject.GlobalControl.BlockRestriction

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Reciprocal-square load of the construction edges

The block-support, residual mass-batch, and high-scale gadget edges together
have reciprocal-square load bounded by a constant multiple of the control
variance. The concrete constants remain private to the eventual bound.
-/

/-- The reciprocal-square mass of a block support decays at its natural
dyadic scale. -/
lemma blockSupport_inv_sq_le (BS : BlockSystem) (hk0 : 1 ≤ BS.k0) :
    ∑ p ∈ blockSupport BS, (1 : ℝ) / (p : ℝ) ^ 2
      ≤ 8 / ((BS.k0 : ℝ) * (2 : ℝ) ^ BS.k0) := by
  have h_sum_le_card : (blockSupport BS).sum (fun p => (1 : ℝ) / p ^ 2) ≤
      ∑ k ∈ Finset.Icc BS.k0 BS.K,
        (dyadicBlock k).card * (1 / (2 ^ k) ^ 2 : ℝ) := by
    have h_sum_le_card : (blockSupport BS).sum (fun p => (1 : ℝ) / p ^ 2) ≤
        ∑ k ∈ Finset.Icc BS.k0 BS.K, (BS.P k).sum (fun p => (1 : ℝ) / p ^ 2) := by
      rw [← Finset.sum_biUnion]
      · exact Finset.sum_le_sum_of_subset_of_nonneg (by aesop_cat)
          fun _ _ _ => by positivity
      · exact fun x hx y hy hxy => blocks_disjoint BS hxy
    refine le_trans h_sum_le_card <| Finset.sum_le_sum fun k hk => ?_
    refine' le_trans (Finset.sum_le_sum fun p hp =>
      one_div_le_one_div_of_le (by positivity) <|
        pow_le_pow_left₀ (by positivity)
          (show (p : ℝ) ≥ 2 ^ k from mod_cast (BS.hwindow k p hp).1) 2) _
    simp +zetaDelta at *
    exact mul_le_mul_of_nonneg_right
      (mod_cast Finset.card_le_card <| show BS.P k ⊆ dyadicBlock k from
        fun x hx => Finset.mem_filter.mpr
          ⟨Finset.mem_Ico.mpr (BS.hwindow k x hx), BS.hprime k x hx⟩)
      (by positivity)
  have h_card_bound : ∀ k ∈ Finset.Icc BS.k0 BS.K,
      (dyadicBlock k).card * (1 / (2 ^ k) ^ 2 : ℝ) ≤
        4 / (BS.k0 * 2 ^ k) := by
    intro k hk
    have h_card_bound : (dyadicBlock k).card ≤ (2 ^ (k + 2)) / k := by
      have := dyadic_block_card_upper k
      rw [Nat.le_div_iff_mul_le (by linarith [Finset.mem_Icc.mp hk])]
      norm_cast at *
      linarith
    rw [mul_one_div, div_le_div_iff₀] <;> norm_cast <;>
      norm_num [pow_succ'] at *
    · exact le_trans (Nat.mul_le_mul_right _ h_card_bound) (by
        nlinarith [Nat.div_mul_le_self (2 * (2 * 2 ^ k)) k,
          pow_pos (zero_lt_two' ℕ) k, pow_pos (zero_lt_two' ℕ) (k + 1),
          pow_pos (zero_lt_two' ℕ) (k + 2),
          Nat.mul_le_mul_right (2 ^ k) hk.1])
    · linarith
  refine le_trans h_sum_le_card <| le_trans (Finset.sum_le_sum h_card_bound) ?_
  erw [Finset.sum_Ico_eq_sum_range]
  norm_num [div_eq_mul_inv, Finset.mul_sum, mul_assoc, mul_comm, mul_left_comm, pow_add]
  ring_nf
  norm_num
  norm_num [← Finset.mul_sum, ← Finset.sum_mul]
  rw [geom_sum_eq] <;> ring_nf <;> norm_num

/-- The non-control edges have bounded reciprocal-square mass relative to the
control variance once their scale is sufficiently large. -/
private lemma extraEdges_inv_sq_le {T : Finset ℕ} {b : ℕ} (c : ℝ) (hc : 1 ≤ c)
    (D : ConstructionData T b)
    (hk0 : 1 ≤ D.BS.k0)
    (hsigma : (1 : ℝ) / (c * (D.BS.k0 : ℝ) * (2 : ℝ) ^ D.BS.k0) ≤
      sigmaCtrl D.BS)
    (hgrowth : ((b * D.S.card : ℕ) : ℝ) * c ^ 2 * (D.BS.k0 : ℝ) ^ 2 ≤
      (4 : ℝ) ^ D.BS.k0)
    (QB : MassBatchSupply D)
    (hSge : ∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s)
    (hRpos : ∀ r ∈ D.R, 2 ≤ r) (hRcard : D.R.card ≤ b) :
    ∑ e ∈ D.E \ ctrlEdges D.BS, (1 : ℝ) / (e : ℝ) ^ 2
      ≤ ((8 * c) ^ 2 + 1) * (sigmaCtrl D.BS) ^ 2 := by
  have hQ_mass : ∑ e ∈ D.Q, (1 : ℝ) / e ^ 2 ≤
      (8 / ((D.BS.k0 : ℝ) * (2 : ℝ) ^ D.BS.k0)) ^ 2 := by
    have hQ : (∑ e ∈ D.Q, (1 : ℝ) / (e : ℝ) ^ 2) ≤
        (∑ p ∈ blockSupport D.BS, (1 : ℝ) / (p : ℝ) ^ 2) ^ 2 := by
      have hpair := QB.hQpair
      have h_sum_Q_le : D.Q.sum (fun e => (1 : ℝ) / e ^ 2) ≤
          (blockSupport D.BS ×ˢ blockSupport D.BS).sum
            (fun pq => (1 : ℝ) / (pq.1 * pq.2) ^ 2) := by
        choose! p q hp hq hpq he using hpair
        have h_image : D.Q.sum (fun e => (1 : ℝ) / e ^ 2) ≤
            (Finset.image (fun e => (p e, q e)) D.Q).sum
              (fun pq => (1 : ℝ) / (pq.1 * pq.2) ^ 2) := by
          rw [Finset.sum_image]
          · exact Finset.sum_le_sum fun x hx => by rw [← Nat.cast_mul, ← he x hx]
          · intros e he e' he' h_eq
            grind
        exact h_image.trans <| Finset.sum_le_sum_of_subset_of_nonneg
          (Finset.image_subset_iff.mpr fun e he =>
            Finset.mem_product.mpr ⟨hp e he, hq e he⟩) fun _ _ _ => by positivity
      convert h_sum_Q_le using 1
      all_goals norm_num [Finset.sum_product, mul_pow]; ring_nf
      simp +decide only [sq, ← Finset.mul_sum, ← Finset.sum_mul]
    exact hQ.trans <| pow_le_pow_left₀
      (Finset.sum_nonneg fun _ _ => by positivity)
      (blockSupport_inv_sq_le D.BS hk0) _
  have hgadget_mass : ∑ e ∈ gadgetEdges D.R D.S, (1 : ℝ) / e ^ 2 ≤
      (D.R.card * D.S.card) * (2 : ℝ) ^ (-4 * D.BS.k0 : ℝ) := by
    refine' le_trans (Finset.sum_le_sum fun e he =>
      one_div_le_one_div_of_le (by positivity)
        (show (e : ℝ) ^ 2 ≥ (2 ^ (2 * D.BS.k0)) ^ 2 by
          gcongr
          norm_cast
          simp_all +decide [gadgetEdges]
          obtain ⟨a, c, ⟨ha, hc⟩, rfl⟩ := he
          nlinarith [hRpos a ha, hSge c hc])) _
    all_goals norm_num [← pow_mul]; ring_nf; norm_num
    norm_num [Real.rpow_neg, Real.div_rpow]
    norm_cast
    norm_num [gadgetEdges_card_le_product]
    exact mul_le_mul (mod_cast gadgetEdges_card_le_product D.R D.S)
      (by norm_num [← inv_pow]) (by positivity) (by positivity)
  have h_combined : ∑ e ∈ D.E \ ctrlEdges D.BS, (1 : ℝ) / e ^ 2 ≤
      (8 / ((D.BS.k0 : ℝ) * (2 : ℝ) ^ D.BS.k0)) ^ 2 +
        (b * D.S.card) * (2 : ℝ) ^ (-4 * D.BS.k0 : ℝ) := by
    have h_subset : ∑ e ∈ D.E \ ctrlEdges D.BS, (1 : ℝ) / e ^ 2 ≤
        ∑ e ∈ D.Q ∪ gadgetEdges D.R D.S, (1 : ℝ) / e ^ 2 := by
      refine Finset.sum_le_sum_of_subset_of_nonneg ?_ fun _ _ _ => by positivity
      intro e he
      rw [Finset.mem_sdiff] at he
      have heE := he.1
      have henc := he.2
      rw [ConstructionData.E, constructionEdges] at heE
      rw [Finset.mem_union]
      rcases Finset.mem_union.mp heE with h | h
      · rcases Finset.mem_union.mp h with h' | h'
        · exact absurd h' henc
        · exact Or.inl h'
      · exact Or.inr h
    refine le_trans h_subset ?_
    refine le_trans ?_ (add_le_add hQ_mass <| hgadget_mass.trans ?_)
    · rw [← Finset.sum_union_inter]
      norm_num
      exact Finset.sum_nonneg fun _ _ => by positivity
    · exact mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_right (mod_cast hRcard) (Nat.cast_nonneg _))
        (by positivity)
  have h_second_term : (b * D.S.card : ℝ) *
      (2 : ℝ) ^ (-4 * D.BS.k0 : ℝ) ≤ (sigmaCtrl D.BS) ^ 2 := by
    have h_second_term : (b * D.S.card : ℝ) *
        (2 : ℝ) ^ (-4 * D.BS.k0 : ℝ) ≤
          (1 / (c * (D.BS.k0 : ℝ) * (2 : ℝ) ^ D.BS.k0)) ^ 2 := by
      rw [Real.rpow_mul] <;> norm_num
      rw [one_div_pow, one_div]
      have hc0 : 0 < c := lt_of_lt_of_le zero_lt_one hc
      have hk0' : (0 : ℝ) < D.BS.k0 := by exact_mod_cast (lt_of_lt_of_le Nat.zero_lt_one hk0)
      have hden : 0 < c ^ 2 * (D.BS.k0 : ℝ) ^ 2 * (16 : ℝ) ^ D.BS.k0 := by
        positivity
      calc
        (b * D.S.card : ℝ) * ((16 : ℝ) ^ D.BS.k0)⁻¹ =
            ((b * D.S.card : ℝ) * c ^ 2 * (D.BS.k0 : ℝ) ^ 2) /
              (c ^ 2 * (D.BS.k0 : ℝ) ^ 2 * (16 : ℝ) ^ D.BS.k0) := by
                field_simp
        _ ≤ (4 : ℝ) ^ D.BS.k0 /
              (c ^ 2 * (D.BS.k0 : ℝ) ^ 2 * (16 : ℝ) ^ D.BS.k0) :=
          div_le_div_of_nonneg_right
            (by simpa [Nat.cast_mul, mul_assoc] using hgrowth) hden.le
        _ = ((2 ^ D.BS.k0)⁻¹ * ((D.BS.k0 : ℝ)⁻¹ * c⁻¹)) ^ 2 := by
          rw [show (16 : ℝ) = 4 ^ 2 by norm_num, ← pow_mul, Nat.mul_comm, pow_mul]
          field_simp
          rw [show (4 : ℝ) = 2 ^ 2 by norm_num, ← pow_mul, Nat.mul_comm, pow_mul]
    exact h_second_term.trans <|
      pow_le_pow_left₀ (by positivity) hsigma 2
  refine le_trans h_combined <| le_trans
    (add_le_add
      (show (8 / (D.BS.k0 * 2 ^ D.BS.k0 : ℝ)) ^ 2 ≤
          (8 * c) ^ 2 * sigmaCtrl D.BS ^ 2 from ?_)
      h_second_term) ?_
  · refine le_trans ?_ (mul_le_mul_of_nonneg_left
      (pow_le_pow_left₀ (by positivity) hsigma 2)
      (by positivity))
    · field_simp [show c ≠ 0 by positivity]
      norm_num
  · ring_nf
    exact le_rfl

/-- Some universal slack bounds the reciprocal-square load of the complete
edge set once the block scale dominates the numbers of gadget and denominator
primes. -/
lemma exists_edge_square_load_bound :
    ∃ S : ℝ, 1 ≤ S ∧ ∀ G b : ℕ, ∃ K0 : ℕ, ∀ {T : Finset ℕ}
      (D : ConstructionData T b), MassBatchSupply D →
      K0 ≤ D.BS.k0 → D.S.card = G →
      (∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s) →
      (∀ r ∈ D.R, 2 ≤ r) → D.R.card ≤ b →
      ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2 ≤
        S * (sigmaCtrl D.BS) ^ 2 := by
  obtain ⟨c, hc, Ksigma, hsigma⟩ := exists_sigmaCtrl_lower_bound
  refine ⟨(8 * c) ^ 2 + 2, by nlinarith [sq_nonneg (8 * c)], fun G b => ?_⟩
  obtain ⟨Kgrowth, hgrowth⟩ := RequestProject.exists_threshold_mul_pow_le_const_pow
    (((b * G : ℕ) : ℝ) * c ^ 2) 2 (show (1 : ℝ) < 4 by norm_num)
  refine ⟨max (max Ksigma Kgrowth) 1, ?_⟩
  intro T D QB hthr hcard hSge hRpos hRcard
  have hscale : max Ksigma Kgrowth ≤ D.BS.k0 :=
    (le_max_left _ _).trans hthr
  have hk0 : 1 ≤ D.BS.k0 := (le_max_right _ _).trans hthr
  have hsigma' := hsigma D.BS ((le_max_left _ _).trans hscale)
  have hgrowth' := hgrowth D.BS.k0 ((le_max_right _ _).trans hscale)
  have hgrowth'' : ((b * D.S.card : ℕ) : ℝ) * c ^ 2 * (D.BS.k0 : ℝ) ^ 2 ≤
      (4 : ℝ) ^ D.BS.k0 := by simpa [hcard] using hgrowth'
  have hextra := extraEdges_inv_sq_le c hc D hk0 hsigma' hgrowth'' QB hSge hRpos hRcard
  have hsplit : ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2 =
      (∑ e ∈ ctrlEdges D.BS, (1 : ℝ) / (e : ℝ) ^ 2) +
        ∑ e ∈ D.E \ ctrlEdges D.BS, (1 : ℝ) / (e : ℝ) ^ 2 := by
    rw [← Finset.sum_sdiff D.ctrlEdges_subset_E]
    ring
  rw [hsplit, sum_inv_sq_ctrlEdges_eq_sigmaCtrl_sq]
  nlinarith [hextra, sq_nonneg (sigmaCtrl D.BS)]

end CircleMethod

end
