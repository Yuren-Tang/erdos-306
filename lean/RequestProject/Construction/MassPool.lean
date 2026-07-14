import RequestProject.Construction.Edges

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# The residual mass-batch pool and its selection

Single motivating question: **how is the residual mass batch `D.Q` chosen?**
A canonical candidate pool (products of two ordered block-support primes,
after removing the obstruction set and the already-fixed control/gadget
edges) is selected via the generic greedy-window reduction
(`ConstructionData.exists_residual_subset_recip_window`); this file supplies
the pool-specific facts the selector needs (structural membership,
individual smallness, remaining reciprocal mass) and packages the result as
`MassBatchSupply`.

This node does *not* include bounding the control/gadget edges' own load —
that is a separate mechanism, independent of how `Q` is chosen, in
`Construction.BaseLoadBudget`.

-/

/-- Reciprocal load is monotone under finite-set inclusion. -/
lemma recipLoad_mono {A B : Finset ℕ} (hAB : A ⊆ B) :
    ConstructionData.recipLoad A ≤ ConstructionData.recipLoad B := by
  unfold ConstructionData.recipLoad
  exact Finset.sum_le_sum_of_subset_of_nonneg hAB
    (by intro x _hxB _hxA; positivity)

/-- The product image of `blockPrimes k0` ordered pairs has the expected
reciprocal load. -/
lemma blockPrimes_pairImage_recipLoad_eq (k0 : ℕ) :
    ConstructionData.recipLoad
        (((blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2)).image
          (fun pq : ℕ × ℕ => pq.1 * pq.2))
      =
        ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
          (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)) := by
  unfold ConstructionData.recipLoad
  rw [Finset.sum_image]
  · exact Finset.sum_congr rfl fun pq _hpq => by
      simp [Nat.cast_mul]
  · exact blockPrimes_pair_prod_injOn k0

/-- All ordered block-support prime products `p*q` with `p < q`. -/
def blockSupportPairPool (BS : BlockSystem) : Finset ℕ :=
  ((blockSupport BS).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2)).image
    (fun pq : ℕ × ℕ => pq.1 * pq.2)

/-- Edges forbidden for the residual mass batch: the obstruction set plus the
already-fixed control/gadget products. -/
def residualForbidden {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b) :
    Finset ℕ :=
  T ∪ (ctrlEdges D.BS ∪ gadgetEdges D.R D.S)

/-- The residual mass-batch pool after deleting the obstruction set and the
already-fixed control/gadget edge products. -/
def residualPairPool {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b) :
    Finset ℕ :=
  blockSupportPairPool D.BS \ residualForbidden D

lemma blockSupportPairPool_pair {BS : BlockSystem} {e : ℕ}
    (he : e ∈ blockSupportPairPool BS) :
    ∃ p q, p ∈ blockSupport BS ∧ q ∈ blockSupport BS ∧ p < q ∧ e = p * q := by
  rw [blockSupportPairPool, Finset.mem_image] at he
  obtain ⟨pq, hpq, rfl⟩ := he
  rw [Finset.mem_filter, Finset.mem_offDiag] at hpq
  exact ⟨pq.1, pq.2, hpq.1.1, hpq.1.2.1, hpq.2, rfl⟩

/-- If `blockPrimes k0` is contained in the support of a block system, then the
product image of its ordered pairs is contained in `blockSupportPairPool`. -/
lemma blockPrimes_pairImage_subset_blockSupportPairPool
    (BS : BlockSystem) (k0 : ℕ)
    (hsub : blockPrimes k0 ⊆ blockSupport BS) :
    ((blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2)).image
        (fun pq : ℕ × ℕ => pq.1 * pq.2)
      ⊆ blockSupportPairPool BS := by
  intro e he
  rw [Finset.mem_image] at he
  obtain ⟨pq, hpq, rfl⟩ := he
  rw [blockSupportPairPool, Finset.mem_image]
  refine ⟨pq, ?_, rfl⟩
  rw [Finset.mem_filter, Finset.mem_offDiag] at hpq ⊢
  exact ⟨⟨hsub hpq.1.1, hsub hpq.1.2.1, fun h => hpq.1.2.2 h⟩, hpq.2⟩

/-- Bridge a `blockPrimes` product-load lower bound into the full
`blockSupportPairPool` lower bound. -/
theorem blockSupportPairPool_load_ge_of_blockPrimes_subset
    (BS : BlockSystem) (k0 : ℕ)
    (hsub : blockPrimes k0 ⊆ blockSupport BS)
    (hload :
      (1 : ℝ) / 2 ≤
        ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
          (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ))) :
    (1 : ℝ) / 2 ≤ ConstructionData.recipLoad (blockSupportPairPool BS) := by
  let P :=
    ((blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2)).image
      (fun pq : ℕ × ℕ => pq.1 * pq.2)
  have hPsub : P ⊆ blockSupportPairPool BS :=
    blockPrimes_pairImage_subset_blockSupportPairPool BS k0 hsub
  have hmono : ConstructionData.recipLoad P ≤
      ConstructionData.recipLoad (blockSupportPairPool BS) :=
    recipLoad_mono hPsub
  have hPeq :
      ConstructionData.recipLoad P =
        ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
          (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)) := by
    exact blockPrimes_pairImage_recipLoad_eq k0
  linarith

/-- Convenient large-scale corollary from the existing `blockPrimes` load
theorem. -/
theorem blockSupportPairPool_load_ge_half_of_contains_large_blockPrimes
    (BS : BlockSystem) (k1 : ℕ)
    (hlarge : k1 ≤ BS.k0)
    (hsub : blockPrimes BS.k0 ⊆ blockSupport BS)
    (hload : ∀ k0 : ℕ, k1 ≤ k0 →
      (1 : ℝ) / 2 ≤
        ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
          (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ))) :
    (1 : ℝ) / 2 ≤ ConstructionData.recipLoad (blockSupportPairPool BS) := by
  exact blockSupportPairPool_load_ge_of_blockPrimes_subset BS BS.k0 hsub
    (hload BS.k0 hlarge)

/-- Existential form using `blockPrimes_product_load_ge`. -/
theorem exists_k1_blockSupportPairPool_load_ge_half
    (BS : BlockSystem)
    (hsub : blockPrimes BS.k0 ⊆ blockSupport BS) :
    ∃ k1 : ℕ, 5 ≤ k1 ∧ (k1 ≤ BS.k0 →
      (1 : ℝ) / 2 ≤ ConstructionData.recipLoad (blockSupportPairPool BS)) := by
  obtain ⟨k1, hk15, hload⟩ := blockPrimes_product_load_ge
  exact ⟨k1, hk15, fun hlarge =>
    blockSupportPairPool_load_ge_half_of_contains_large_blockPrimes BS k1
      hlarge hsub hload⟩

lemma residualPairPool_pair {T : Finset ℕ} {b e : ℕ}
    (D : ConstructionData T b) (he : e ∈ residualPairPool D) :
    ∃ p q, p ∈ blockSupport D.BS ∧ q ∈ blockSupport D.BS ∧ p < q ∧ e = p * q := by
  rw [residualPairPool, Finset.mem_sdiff] at he
  exact blockSupportPairPool_pair he.1

lemma residualPairPool_avoid {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) :
    ∀ e ∈ residualPairPool D, e ∉ T := by
  intro e he hT
  rw [residualPairPool, Finset.mem_sdiff] at he
  exact he.2 (by simp [residualForbidden, hT])

lemma residualPairPool_disjoint_fixed {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) :
    Disjoint (residualPairPool D) (ctrlEdges D.BS ∪ gadgetEdges D.R D.S) := by
  rw [Finset.disjoint_left]
  intro e he hfixed
  rw [residualPairPool, Finset.mem_sdiff] at he
  exact he.2 (by simp [residualForbidden, hfixed])

/-- Reciprocal load splits into the part outside `B` and the part inside `B`. -/
lemma recipLoad_eq_sdiff_add_inter (A B : Finset ℕ) :
    ConstructionData.recipLoad A =
      ConstructionData.recipLoad (A \ B) +
        ConstructionData.recipLoad (A ∩ B) := by
  have hdisj : Disjoint (A \ B) (A ∩ B) := by
    rw [Finset.disjoint_left]
    intro x hx hxint
    rw [Finset.mem_sdiff] at hx
    rw [Finset.mem_inter] at hxint
    exact hx.2 hxint.2
  have hunion : (A \ B) ∪ (A ∩ B) = A := by
    ext x
    by_cases hxA : x ∈ A
    · by_cases hxB : x ∈ B <;> simp [hxA, hxB]
    · simp [hxA]
  calc
    ConstructionData.recipLoad A =
        ConstructionData.recipLoad ((A \ B) ∪ (A ∩ B)) := by rw [hunion]
    _ = ConstructionData.recipLoad (A \ B) +
          ConstructionData.recipLoad (A ∩ B) := by
        unfold ConstructionData.recipLoad
        rw [Finset.sum_union hdisj]

/-- If the full block-support pair pool beats the target plus the forbidden
budget, then the residual pool beats the target. -/
lemma residualPairPool_load_lower_of_forbidden_budget
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (target : ℝ)
    (hbudget :
      target +
          ConstructionData.recipLoad
            (blockSupportPairPool D.BS ∩ residualForbidden D)
        ≤ ConstructionData.recipLoad (blockSupportPairPool D.BS)) :
    target ≤ ConstructionData.recipLoad (residualPairPool D) := by
  have hsplit :=
    recipLoad_eq_sdiff_add_inter (blockSupportPairPool D.BS) (residualForbidden D)
  rw [residualPairPool] at *
  linarith

/-- Every block-support prime is at least the bottom dyadic scale. -/
lemma blockSupport_ge_k0 {BS : BlockSystem} {p : ℕ}
    (hp : p ∈ blockSupport BS) :
    2 ^ BS.k0 ≤ p := by
  rw [blockSupport, Finset.mem_biUnion] at hp
  obtain ⟨k, hk, hpk⟩ := hp
  have hk0k : BS.k0 ≤ k := (Finset.mem_Icc.mp hk).1
  exact le_trans (Nat.pow_le_pow_right (by norm_num) hk0k)
    (BS.hwindow k p hpk).1

/-- Every residual pair-pool edge is at least `(2^k₀)^2`. -/
lemma residualPairPool_edge_ge_k0_square {T : Finset ℕ} {b e : ℕ}
    (D : ConstructionData T b) (he : e ∈ residualPairPool D) :
    2 ^ D.BS.k0 * 2 ^ D.BS.k0 ≤ e := by
  obtain ⟨p, q, hp, hq, _hpq, rfl⟩ := residualPairPool_pair D he
  exact Nat.mul_le_mul (blockSupport_ge_k0 hp) (blockSupport_ge_k0 hq)

/-- Elementary reciprocal comparison used by the residual pool. -/
lemma one_div_nat_lt_three_div_two_mul
    {b e : ℕ} (hb : 0 < b) (he : 0 < e)
    (hlarge : 2 * b < 3 * e) :
    (1 : ℝ) / (e : ℝ) < 3 / (2 * (b : ℝ)) := by
  have heR : 0 < (e : ℝ) := by exact_mod_cast he
  have hbR : 0 < (2 * (b : ℝ)) := by positivity
  rw [div_lt_div_iff₀ heR hbR]
  norm_num
  exact_mod_cast hlarge

/-- A single bottom-scale inequality makes every residual-pool reciprocal small
enough for the greedy residual-window selector. -/
lemma residualPairPool_small_of_k0_square
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (hb : 0 < b)
    (hlarge : 2 * b < 3 * (2 ^ D.BS.k0 * 2 ^ D.BS.k0)) :
    ∀ e ∈ residualPairPool D,
      (1 : ℝ) / (e : ℝ) < 3 / (2 * (b : ℝ)) := by
  intro e he
  have hedge := residualPairPool_edge_ge_k0_square D he
  have hepos : 0 < e := by omega
  exact one_div_nat_lt_three_div_two_mul hb hepos
    (lt_of_lt_of_le hlarge (Nat.mul_le_mul_left 3 hedge))

/-- Replace only the residual mass batch of an `ConstructionData` record. -/
def ConstructionData.withQ {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (Q : Finset ℕ) : ConstructionData T b :=
  { BS := D.BS, Q := Q, R := D.R, S := D.S }

@[simp] lemma ConstructionData.withQ_BS {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (Q : Finset ℕ) :
    (D.withQ Q).BS = D.BS := rfl

@[simp] lemma ConstructionData.withQ_Q {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (Q : Finset ℕ) :
    (D.withQ Q).Q = Q := rfl

@[simp] lemma ConstructionData.withQ_R {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (Q : Finset ℕ) :
    (D.withQ Q).R = D.R := rfl

@[simp] lemma ConstructionData.withQ_S {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (Q : Finset ℕ) :
    (D.withQ Q).S = D.S := rfl

@[simp] lemma ConstructionData.withQ_baseLoad {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (Q : Finset ℕ) :
    (D.withQ Q).baseLoad = D.baseLoad := rfl

/-- Structural and load-window supply for the residual mass batch `D.Q`. -/
structure MassBatchSupply
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b) where
  hQpair : ∀ e ∈ D.Q, ∃ p q,
    p ∈ blockSupport D.BS ∧ q ∈ blockSupport D.BS ∧ p < q ∧ e = p * q
  hQavoid : ∀ e ∈ D.Q, e ∉ T
  hQne : D.Q.Nonempty
  hloadDisj : Disjoint D.Q (ctrlEdges D.BS ∪ gadgetEdges D.R D.S)
  hloadLower :
    3 / (2 * (b : ℝ)) ≤ D.baseLoad + ConstructionData.recipLoad D.Q
  hloadUpper :
    D.baseLoad + ConstructionData.recipLoad D.Q < 3 / (b : ℝ)

/-- A candidate residual pool supplies a valid mass-batch subset.

The hypotheses are deliberately local to the pool `P`: every candidate is a
product of two ordered block-support primes, avoids the obstruction set, is
disjoint from the fixed control/gadget edges, is individually small enough for
the greedy window, and has enough total reciprocal mass to fill the residual
gap below `3/(2b)`.
-/
theorem exists_massBatchSupply_of_pool
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (P : Finset ℕ)
    (hb : 0 < b)
    (hbase : D.baseLoad < 3 / (2 * (b : ℝ)))
    (hpair : ∀ e ∈ P, ∃ p q,
      p ∈ blockSupport D.BS ∧ q ∈ blockSupport D.BS ∧ p < q ∧ e = p * q)
    (havoid : ∀ e ∈ P, e ∉ T)
    (hdisj : Disjoint P (ctrlEdges D.BS ∪ gadgetEdges D.R D.S))
    (hsmall : ∀ e ∈ P, (1 : ℝ) / (e : ℝ) < 3 / (2 * (b : ℝ)))
    (hsum : 3 / (2 * (b : ℝ)) - D.baseLoad ≤ ConstructionData.recipLoad P) :
    ∃ Q : Finset ℕ, MassBatchSupply (D.withQ Q) := by
  obtain ⟨Q, hQsub, hQlower, hQupper⟩ :=
    ConstructionData.exists_residual_subset_recip_window P D.baseLoad b hb
      hbase hsmall hsum
  refine ⟨Q, ?_⟩
  have hQne : Q.Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro hQempty
    have htarget_le_base : 3 / (2 * (b : ℝ)) ≤ D.baseLoad := by
      simpa [ConstructionData.recipLoad, hQempty] using hQlower
    exact not_lt_of_ge htarget_le_base hbase
  refine
    { hQpair := ?_
      hQavoid := ?_
      hQne := hQne
      hloadDisj := ?_
      hloadLower := ?_
      hloadUpper := ?_ }
  · intro e he
    simpa using hpair e (hQsub he)
  · intro e he
    exact havoid e (hQsub he)
  · simpa [ConstructionData.withQ] using hdisj.mono_left hQsub
  · simpa [ConstructionData.withQ_baseLoad] using hQlower
  · simpa [ConstructionData.withQ_baseLoad] using hQupper

/-- The canonical residual pair pool supplies a valid mass-batch subset once its
remaining reciprocal mass is large enough. -/
theorem exists_massBatchSupply_of_residualPairPool
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (hb : 0 < b)
    (hbase : D.baseLoad < 3 / (2 * (b : ℝ)))
    (hsmall : ∀ e ∈ residualPairPool D,
      (1 : ℝ) / (e : ℝ) < 3 / (2 * (b : ℝ)))
    (hsum : 3 / (2 * (b : ℝ)) - D.baseLoad
      ≤ ConstructionData.recipLoad (residualPairPool D)) :
    ∃ Q : Finset ℕ, MassBatchSupply (D.withQ Q) := by
  exact exists_massBatchSupply_of_pool D (residualPairPool D) hb hbase
    (fun e he => residualPairPool_pair D he) (residualPairPool_avoid D)
    (residualPairPool_disjoint_fixed D) hsmall hsum

/-- Reciprocal load of a union is at most the sum of reciprocal loads. -/
lemma recipLoad_union_le (A B : Finset ℕ) :
    ConstructionData.recipLoad (A ∪ B)
      ≤ ConstructionData.recipLoad A + ConstructionData.recipLoad B := by
  have hdisj : Disjoint A (B \ A) := by
    rw [Finset.disjoint_left]
    intro x hxA hxBA
    exact (Finset.mem_sdiff.mp hxBA).2 hxA
  have hunion : A ∪ (B \ A) = A ∪ B := by
    ext x
    by_cases hxA : x ∈ A
    · simp [hxA]
    · by_cases hxB : x ∈ B <;> simp [hxA, hxB]
  calc
    ConstructionData.recipLoad (A ∪ B) =
        ConstructionData.recipLoad (A ∪ (B \ A)) := by rw [hunion]
    _ = ConstructionData.recipLoad A + ConstructionData.recipLoad (B \ A) := by
        unfold ConstructionData.recipLoad
        rw [Finset.sum_union hdisj]
    _ ≤ ConstructionData.recipLoad A + ConstructionData.recipLoad B := by
        exact add_le_add_right (recipLoad_mono (Finset.sdiff_subset)) _

/-- Intersection with a union has reciprocal load bounded by the two
intersection loads. -/
lemma recipLoad_inter_union_le (A B C : Finset ℕ) :
    ConstructionData.recipLoad (A ∩ (B ∪ C))
      ≤ ConstructionData.recipLoad (A ∩ B)
        + ConstructionData.recipLoad (A ∩ C) := by
  have hsub : A ∩ (B ∪ C) ⊆ (A ∩ B) ∪ (A ∩ C) := by
    intro x hx
    rw [Finset.mem_inter, Finset.mem_union] at hx
    rw [Finset.mem_union, Finset.mem_inter, Finset.mem_inter]
    exact hx.2.elim (fun hxB => Or.inl ⟨hx.1, hxB⟩)
      (fun hxC => Or.inr ⟨hx.1, hxC⟩)
  exact le_trans (recipLoad_mono hsub) (recipLoad_union_le (A ∩ B) (A ∩ C))

/-- Decompose the forbidden residual pair-pool load into obstruction, control,
and gadget pieces. -/
theorem residualForbidden_recipLoad_le_components
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b) :
    ConstructionData.recipLoad
        (blockSupportPairPool D.BS ∩ residualForbidden D)
      ≤ ConstructionData.recipLoad (blockSupportPairPool D.BS ∩ T)
        + ConstructionData.recipLoad
            (blockSupportPairPool D.BS ∩ ctrlEdges D.BS)
        + ConstructionData.recipLoad
            (blockSupportPairPool D.BS ∩ gadgetEdges D.R D.S) := by
  let A := blockSupportPairPool D.BS
  let C := ctrlEdges D.BS
  let G := gadgetEdges D.R D.S
  have h1 : ConstructionData.recipLoad (A ∩ (T ∪ (C ∪ G)))
      ≤ ConstructionData.recipLoad (A ∩ T) +
        ConstructionData.recipLoad (A ∩ (C ∪ G)) :=
    recipLoad_inter_union_le A T (C ∪ G)
  have h2 : ConstructionData.recipLoad (A ∩ (C ∪ G))
      ≤ ConstructionData.recipLoad (A ∩ C) +
        ConstructionData.recipLoad (A ∩ G) :=
    recipLoad_inter_union_le A C G
  dsimp [A, C, G] at h1 h2 ⊢
  rw [residualForbidden]
  linarith

/-- Separate numeric budgets for the three forbidden pieces. -/
structure ForbiddenEdgeBudget
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b) where
  FT : ℝ
  Fctrl : ℝ
  Fgadget : ℝ
  hT :
    ConstructionData.recipLoad (blockSupportPairPool D.BS ∩ T) ≤ FT
  hctrl :
    ConstructionData.recipLoad
      (blockSupportPairPool D.BS ∩ ctrlEdges D.BS) ≤ Fctrl
  hgadget :
    ConstructionData.recipLoad
      (blockSupportPairPool D.BS ∩ gadgetEdges D.R D.S) ≤ Fgadget

/-- The three-piece forbidden budget bounds the full forbidden load. -/
theorem residualForbidden_recipLoad_le_budget
    {T : Finset ℕ} {b : ℕ} {D : ConstructionData T b}
    (B : ForbiddenEdgeBudget D) :
    ConstructionData.recipLoad
        (blockSupportPairPool D.BS ∩ residualForbidden D)
      ≤ B.FT + B.Fctrl + B.Fgadget := by
  have hparts := residualForbidden_recipLoad_le_components D
  linarith [B.hT, B.hctrl, B.hgadget]

/-- Final candidate-pool mass-batch endpoint: it is enough to prove one lower
bound for the full block-support pair pool after budgeting the forbidden edges. -/
theorem exists_massBatchSupply_of_pairPool_forbidden_budget
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (hb : 0 < b)
    (hbase : D.baseLoad < 3 / (2 * (b : ℝ)))
    (hlarge : 2 * b < 3 * (2 ^ D.BS.k0 * 2 ^ D.BS.k0))
    (hbudget :
      (3 / (2 * (b : ℝ)) - D.baseLoad) +
          ConstructionData.recipLoad
            (blockSupportPairPool D.BS ∩ residualForbidden D)
        ≤ ConstructionData.recipLoad (blockSupportPairPool D.BS)) :
    ∃ Q : Finset ℕ, MassBatchSupply (D.withQ Q) := by
  refine exists_massBatchSupply_of_residualPairPool D hb hbase ?_ ?_
  · exact residualPairPool_small_of_k0_square D hb hlarge
  · exact residualPairPool_load_lower_of_forbidden_budget D
      (3 / (2 * (b : ℝ)) - D.baseLoad) hbudget

/-- Variant with the full-pool lower bound and forbidden-pool upper bound split
as separate estimates.  This is the preferred interface for parallel work. -/
theorem exists_massBatchSupply_of_pairPool_separate_bounds
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (hb : 0 < b)
    (hbase : D.baseLoad < 3 / (2 * (b : ℝ)))
    (hlarge : 2 * b < 3 * (2 ^ D.BS.k0 * 2 ^ D.BS.k0))
    (M F : ℝ)
    (hfull : M ≤ ConstructionData.recipLoad (blockSupportPairPool D.BS))
    (hforbidden :
      ConstructionData.recipLoad
          (blockSupportPairPool D.BS ∩ residualForbidden D) ≤ F)
    (hbudget : (3 / (2 * (b : ℝ)) - D.baseLoad) + F ≤ M) :
    ∃ Q : Finset ℕ, MassBatchSupply (D.withQ Q) := by
  refine exists_massBatchSupply_of_pairPool_forbidden_budget D hb hbase hlarge ?_
  linarith

/-- If the full pair pool has load at least `1/2`, and the base residual target
plus the three forbidden budgets is at most `1/2`, then the residual mass batch
exists. -/
theorem exists_massBatchSupply_of_half_fullPool_forbiddenBudget
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (hb : 0 < b)
    (hbase : D.baseLoad < 3 / (2 * (b : ℝ)))
    (hlarge : 2 * b < 3 * (2 ^ D.BS.k0 * 2 ^ D.BS.k0))
    (B : ForbiddenEdgeBudget D)
    (hfull :
      (1 : ℝ) / 2 ≤ ConstructionData.recipLoad (blockSupportPairPool D.BS))
    (hbudget :
      (3 / (2 * (b : ℝ)) - D.baseLoad) + (B.FT + B.Fctrl + B.Fgadget)
        ≤ (1 : ℝ) / 2) :
    ∃ Q : Finset ℕ, MassBatchSupply (D.withQ Q) := by
  refine exists_massBatchSupply_of_pairPool_separate_bounds D hb hbase hlarge
    ((1 : ℝ) / 2) (B.FT + B.Fctrl + B.Fgadget) hfull ?_ hbudget
  exact residualForbidden_recipLoad_le_budget B

/-- Version using the `blockPrimes` product-load estimate through the already
proved full-pool bridge. -/
theorem exists_massBatchSupply_of_blockPrimes_forbiddenBudget
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (hb : 0 < b)
    (hbase : D.baseLoad < 3 / (2 * (b : ℝ)))
    (hlarge : 2 * b < 3 * (2 ^ D.BS.k0 * 2 ^ D.BS.k0))
    (B : ForbiddenEdgeBudget D)
    (k1 : ℕ)
    (hklarge : k1 ≤ D.BS.k0)
    (hsub : blockPrimes D.BS.k0 ⊆ blockSupport D.BS)
    (hload : ∀ k0 : ℕ, k1 ≤ k0 →
      (1 : ℝ) / 2 ≤
        ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
          (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)))
    (hbudget :
      (3 / (2 * (b : ℝ)) - D.baseLoad) + (B.FT + B.Fctrl + B.Fgadget)
        ≤ (1 : ℝ) / 2) :
    ∃ Q : Finset ℕ, MassBatchSupply (D.withQ Q) := by
  have hfull :
      (1 : ℝ) / 2 ≤ ConstructionData.recipLoad (blockSupportPairPool D.BS) :=
    blockSupportPairPool_load_ge_half_of_contains_large_blockPrimes D.BS k1
      hklarge hsub hload
  exact exists_massBatchSupply_of_half_fullPool_forbiddenBudget D hb hbase hlarge
    B hfull hbudget

/-- If every obstruction is below the bottom pair scale, then no obstruction can
belong to the block-support pair pool. -/
lemma blockSupportPairPool_inter_T_eq_empty_of_lt_k0_square
    {T : Finset ℕ} {BS : BlockSystem}
    (hTsmall : ∀ e ∈ T, e < 2 ^ BS.k0 * 2 ^ BS.k0) :
    blockSupportPairPool BS ∩ T = ∅ := by
  ext e
  constructor
  · intro he
    rw [Finset.mem_inter] at he
    have hge : 2 ^ BS.k0 * 2 ^ BS.k0 ≤ e := by
      obtain ⟨p, q, hp, hq, _hpq, rfl⟩ := blockSupportPairPool_pair he.1
      exact Nat.mul_le_mul (blockSupport_ge_k0 hp) (blockSupport_ge_k0 hq)
    exact False.elim (not_le_of_gt (hTsmall e he.2) hge)
  · intro he
    simp at he

end CircleMethod

end
