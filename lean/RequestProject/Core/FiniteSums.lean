import Mathlib.Algebra.Order.Chebyshev
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Topology.MetricSpace.Pseudo.Defs

/-!
# Finite sums over subtypes and covers

Elementary bridges between finite sums and `tsum`s over subtypes, together
with subadditivity under a finite disjunctive cover.
-/

open Finset BigOperators Classical

noncomputable section

namespace RequestProject

/-- A `tsum` over a subtype of a finite type is the corresponding filtered
finite sum. -/
lemma fintype_subtype_tsum_eq {α : Type*} [Fintype α] (S : α → Prop)
    [DecidablePred S] (f : α → ℝ) :
    ∑' a : {x // S x}, f a.1 = ∑ a ∈ Finset.univ.filter S, f a := by
  rw [tsum_fintype]
  exact (Finset.sum_subtype (Finset.univ.filter S) (by intro x; simp) f).symm

/-- A nonnegative sum over a predicate is bounded by the sums over two
predicates whose union covers it. -/
lemma fintype_subtype_tsum_le_of_or {α : Type*} [Fintype α]
    (S P Q : α → Prop) [DecidablePred S] [DecidablePred P] [DecidablePred Q]
    (f : α → ℝ) (hf : ∀ a, 0 ≤ f a) (hor : ∀ a, S a → P a ∨ Q a) :
    ∑' a : {x // S x}, f a.1 ≤
      (∑' a : {x // P x}, f a.1) + ∑' a : {x // Q x}, f a.1 := by
  rw [fintype_subtype_tsum_eq S f, fintype_subtype_tsum_eq P f,
    fintype_subtype_tsum_eq Q f]
  have hsub : Finset.univ.filter S ⊆
      Finset.univ.filter P ∪ Finset.univ.filter Q := by
    intro a ha
    rw [Finset.mem_filter] at ha
    rcases hor a ha.2 with hP | hQ
    · exact Finset.mem_union_left _ (Finset.mem_filter.mpr ⟨ha.1, hP⟩)
    · exact Finset.mem_union_right _ (Finset.mem_filter.mpr ⟨ha.1, hQ⟩)
  calc
    ∑ a ∈ Finset.univ.filter S, f a
        ≤ ∑ a ∈ Finset.univ.filter P ∪ Finset.univ.filter Q, f a :=
      Finset.sum_le_sum_of_subset_of_nonneg hsub (fun a _ _ => hf a)
    _ ≤ (∑ a ∈ Finset.univ.filter P, f a) + ∑ a ∈ Finset.univ.filter Q, f a := by
      have hsum :
          (∑ a ∈ Finset.univ.filter P ∪ Finset.univ.filter Q, f a) +
              ∑ a ∈ (Finset.univ.filter P) ∩ (Finset.univ.filter Q), f a =
            (∑ a ∈ Finset.univ.filter P, f a) +
              ∑ a ∈ Finset.univ.filter Q, f a :=
        Finset.sum_union_inter
      have hnonneg :
          0 ≤ ∑ a ∈ (Finset.univ.filter P) ∩ (Finset.univ.filter Q), f a :=
        Finset.sum_nonneg (fun a _ => hf a)
      linarith

/-- A map whose weighted fibers have mass at most `K` pushes a weighted sum
to at most `K` times the corresponding sum on the target. -/
lemma sum_comp_mul_le_of_fiber_sum_le
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (s : Finset α) (t : Finset β) (f : α → β)
    (g : β → ℝ) (w : α → ℝ) (K : ℝ)
    (hg : ∀ y ∈ t, 0 ≤ g y)
    (hmaps : ∀ x ∈ s, f x ∈ t)
    (hfiber : ∀ y ∈ t, ∑ x ∈ s.filter (fun x => f x = y), w x ≤ K) :
    ∑ x ∈ s, g (f x) * w x ≤ K * ∑ y ∈ t, g y := by
  rw [← Finset.sum_fiberwise_of_maps_to hmaps (fun x => g (f x) * w x)]
  calc
    ∑ y ∈ t, ∑ x ∈ s.filter (fun x => f x = y), g (f x) * w x
        ≤ ∑ y ∈ t, K * g y := by
          refine Finset.sum_le_sum fun y hy => ?_
          have heq : ∀ x ∈ s.filter (fun x => f x = y),
              g (f x) * w x = g y * w x := by
            intro x hx
            rw [(Finset.mem_filter.mp hx).2]
          rw [Finset.sum_congr rfl heq, ← Finset.mul_sum, mul_comm]
          exact mul_le_mul_of_nonneg_right (hfiber y hy) (hg y hy)
    _ = K * ∑ y ∈ t, g y := by rw [Finset.mul_sum]

/-- For a finite nonnegative family with a maximal entry, the off-diagonal
cubic form controls the fourth power of the mass away from that entry. -/
lemma offDiagonalCubeSum_lower_bound {ι : Type*} [DecidableEq ι]
    (L : Finset ι) (x : ι → ℝ) (hx : ∀ i ∈ L, 0 ≤ x i)
    (m : ι) (hm : m ∈ L) (hmax : ∀ i ∈ L, x i ≤ x m) :
    (∑ i ∈ L \ {m}, x i) ^ 4 / (L.card : ℝ) ^ 2 ≤
      ∑ i ∈ L, ∑ j ∈ L \ {i}, x i ^ 3 * x j := by
  have h_simplify : (∑ i ∈ L, ∑ j ∈ L \ {i}, x i ^ 3 * x j) ≥
      (∑ i ∈ L, x i ^ 3) * (∑ i ∈ L \ {m}, x i) := by
    have hrewrite : (∑ i ∈ L, ∑ j ∈ L \ {i}, x i ^ 3 * x j) =
        ∑ i ∈ L, x i ^ 3 * (∑ j ∈ L \ {i}, x j) := by
      simp +decide only [Finset.mul_sum _ _ _]
    rw [hrewrite, Finset.sum_mul]
    refine Finset.sum_le_sum fun i hi =>
      mul_le_mul_of_nonneg_left ?_ (pow_nonneg (hx i hi) 3)
    by_cases him : i = m <;>
      simp_all +decide [Finset.sdiff_singleton_eq_erase]
    linarith [hmax i hi]
  have h_power_mean :
      (∑ i ∈ L \ {m}, x i) ^ 3 / (L.card - 1 : ℝ) ^ 2 ≤
        ∑ i ∈ L \ {m}, x i ^ 3 := by
    have h := pow_sum_div_card_le_sum_pow
      (s := L \ {m}) (f := x)
      (fun i hi => hx i (Finset.mem_sdiff.mp hi).1) 2
    simpa [Finset.card_sdiff, hm,
      Nat.cast_pred (Finset.card_pos.mpr ⟨m, hm⟩)] using h
  by_cases hL : L.card = 1 <;>
    simp_all +decide [Finset.sdiff_singleton_eq_erase]
  · rw [Finset.card_eq_one] at hL
    aesop
  · have hLtwoNat : 2 ≤ L.card := by
      have := Finset.card_pos.mpr ⟨m, hm⟩
      omega
    have hLtwo : (2 : ℝ) ≤ L.card := by exact_mod_cast hLtwoNat
    refine le_trans ?_ (h_simplify.trans ?_)
    · refine le_trans ?_ (mul_le_mul_of_nonneg_right
        (show ∑ i ∈ L, x i ^ 3 ≥
          (∑ i ∈ L, x i - x m) ^ 3 / (L.card - 1 : ℝ) ^ 2 from ?_)
        (sub_nonneg.mpr <| Finset.single_le_sum (fun i _ => hx i ‹_›) hm))
      · rw [div_mul_eq_mul_div, div_le_div_iff₀]
        · exact mul_le_mul_of_nonneg_left
            (by nlinarith only [hLtwo])
            (mul_nonneg
              (pow_nonneg (sub_nonneg.mpr <| Finset.single_le_sum
                (fun i _ => hx i ‹_›) hm) _)
              (sub_nonneg.mpr <| Finset.single_le_sum (fun i _ => hx i ‹_›) hm))
        · exact sq_pos_of_pos (Nat.cast_pos.mpr (Finset.card_pos.mpr ⟨m, hm⟩))
        · exact sq_pos_of_pos (by linarith)
      · exact h_power_mean.trans (sub_le_self _ (pow_nonneg (hx m hm) _))
    · rfl

/-- If every coordinate has at most `M` choices, the total weight of supports
of size at most `h` is bounded by the corresponding truncated binomial sum.
The ambient cardinality `N` may be larger than the actual coordinate set. -/
lemma weightedPowersetSum_le_binomial {α : Type*} [DecidableEq α]
    (S : Finset α) (w : α → ℕ) (M N h : ℕ)
    (hSN : S.card ≤ N) (hw : ∀ i ∈ S, w i ≤ M) :
    ∑ T ∈ S.powerset, (if T.card ≤ h then ∏ i ∈ T, w i else 0) ≤
      ∑ k ∈ Finset.range (h + 1), Nat.choose N k * M ^ k := by
  rw [Finset.sum_ite]
  simp only [Finset.sum_const_zero, add_zero]
  have hdecomp :
      S.powerset.filter (fun T => T.card ≤ h) =
        (Finset.range (h + 1)).biUnion fun k => S.powersetCard k := by
    ext T
    simp [Finset.mem_biUnion, Finset.mem_powersetCard]
    tauto
  rw [hdecomp, Finset.sum_biUnion]
  · change (∑ k ∈ Finset.range (h + 1),
      ∑ T ∈ S.powersetCard k, ∏ i ∈ T, w i) ≤ _
    refine Finset.sum_le_sum fun k hk => ?_
    have hprod : ∀ T ∈ S.powersetCard k, ∏ i ∈ T, w i ≤ M ^ k := by
      intro T hT
      exact le_trans (Finset.prod_le_prod' fun i hi =>
        hw i ((Finset.mem_powersetCard.mp hT).1 hi)) (by
          simp [(Finset.mem_powersetCard.mp hT).2])
    calc
      ∑ T ∈ S.powersetCard k, ∏ i ∈ T, w i
          ≤ ∑ _T ∈ S.powersetCard k, M ^ k := Finset.sum_le_sum hprod
      _ = Nat.choose S.card k * M ^ k := by
        simp [Finset.card_powersetCard]
      _ ≤ Nat.choose N k * M ^ k :=
        Nat.mul_le_mul_right _ (Nat.choose_le_choose k hSN)
  · exact fun i _ j _ hij => Finset.disjoint_left.mpr fun T hi hj =>
      hij <| by
        rw [Finset.mem_powersetCard] at hi hj
        omega

/-- When `h ≤ N ≤ M`, every term of the truncated weighted binomial sum is
bounded by its final term. -/
lemma truncatedBinomialSum_le_last (N M h : ℕ) (hhN : h ≤ N) (hNM : N ≤ M) :
    ∑ k ∈ Finset.range (h + 1), Nat.choose N k * M ^ k ≤
      (h + 1) * Nat.choose N h * M ^ h := by
  have hterm : ∀ k ∈ Finset.range (h + 1),
      Nat.choose N k * M ^ k ≤ Nat.choose N h * M ^ h := by
    intro k hk
    have hk_le : k ≤ h := Finset.mem_range_succ_iff.mp hk
    have hstep : ∀ j < h, Nat.choose N j ≤ Nat.choose N (j + 1) * M := by
      intro j hj
      have hchoose : Nat.choose N j ≤ Nat.choose N (j + 1) * (j + 1) := by
        nlinarith [Nat.add_one_mul_choose_eq N j, Nat.choose_succ_succ N j]
      exact hchoose.trans (Nat.mul_le_mul_left _ (le_trans (by omega) hNM))
    have hiterate : ∀ m : ℕ, k + m ≤ h →
        Nat.choose N k ≤ Nat.choose N (k + m) * M ^ m := by
      intro m hm
      induction m with
      | zero => simp
      | succ m ih =>
        exact le_trans (ih (by omega)) <| calc
          Nat.choose N (k + m) * M ^ m
              ≤ (Nat.choose N (k + m + 1) * M) * M ^ m :=
                Nat.mul_le_mul_right _ (hstep (k + m) (by omega))
          _ = Nat.choose N (k + (m + 1)) * M ^ (m + 1) := by
                rw [pow_succ]
                ring_nf
    have hchoose : Nat.choose N k ≤ Nat.choose N h * M ^ (h - k) := by
      simpa [Nat.add_sub_of_le hk_le] using hiterate (h - k) (by omega)
    exact le_trans (Nat.mul_le_mul_right _ hchoose) (by
      rw [mul_assoc, ← pow_add, Nat.sub_add_cancel hk_le])
  simpa [mul_assoc] using Finset.sum_le_sum hterm

end RequestProject

end
