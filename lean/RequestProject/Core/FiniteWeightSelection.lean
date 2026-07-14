import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Real.Basic
import Mathlib.Order.Preorder.Finite
import Mathlib.Tactic.Linarith

/-!
# Finite weight selection

A finite family whose total weight crosses a threshold contains a subfamily
whose weight lies in the first window above that threshold. The mechanism is
minimality under deletion; no arithmetic structure on the index type is used.
-/

open Finset BigOperators

namespace RequestProject

/-- If every individual weight is smaller than `gap`, a finite family with
total weight at least `target` has a subfamily with total weight in
`[target, target + gap)`. -/
lemma exists_subset_sum_in_window_strict {α : Type*} [DecidableEq α]
    (P : Finset α) (weight : α → ℝ) (target gap : ℝ)
    (htarget : 0 ≤ target) (hgap : 0 < gap)
    (hsmall : ∀ x ∈ P, weight x < gap)
    (hsum : target ≤ ∑ x ∈ P, weight x) :
    ∃ Q : Finset α, Q ⊆ P ∧ target ≤ ∑ x ∈ Q, weight x ∧
      ∑ x ∈ Q, weight x < target + gap := by
  let goodSubsets : Finset (Finset α) :=
    P.powerset.filter (fun Q => target ≤ ∑ x ∈ Q, weight x)
  have hgood_nonempty : goodSubsets.Nonempty := by
    exact ⟨P, Finset.mem_filter.mpr ⟨Finset.mem_powerset.mpr subset_rfl, hsum⟩⟩
  obtain ⟨Q, hQgood, hQmin⟩ :=
    goodSubsets.exists_minimalFor (fun Q : Finset α => Q.card) hgood_nonempty
  have hQsubset : Q ⊆ P := Finset.mem_powerset.mp (Finset.mem_filter.mp hQgood).1
  have hQsum : target ≤ ∑ x ∈ Q, weight x := (Finset.mem_filter.mp hQgood).2
  have hproper_lt : ∀ S ⊂ Q, (∑ x ∈ S, weight x) < target := by
    intro S hS
    exact not_le.mp fun hSsum => by
      have hSgood : S ∈ goodSubsets := Finset.mem_filter.mpr
        ⟨Finset.mem_powerset.mpr (hS.1.trans hQsubset), hSsum⟩
      have hcard_lt : S.card < Q.card := Finset.card_lt_card hS
      exact (not_lt_of_ge (hQmin hSgood hcard_lt.le)) hcard_lt
  rcases Q.eq_empty_or_nonempty with rfl | ⟨x, hx⟩
  · refine ⟨∅, empty_subset P, ?_, ?_⟩
    · simpa using hQsum
    · simp only [sum_empty]
      linarith
  · refine ⟨Q, hQsubset, hQsum, ?_⟩
    have hprev := hproper_lt (Q.erase x) (Finset.erase_ssubset hx)
    rw [Finset.sum_erase_eq_sub hx] at hprev
    linarith [hsmall x (hQsubset hx)]

/-- Closed-upper-bound form of `exists_subset_sum_in_window_strict`. -/
lemma exists_subset_sum_in_window {α : Type*} [DecidableEq α]
    (P : Finset α) (weight : α → ℝ) (target gap : ℝ)
    (htarget : 0 ≤ target) (hgap : 0 < gap)
    (hsmall : ∀ x ∈ P, weight x < gap)
    (hsum : target ≤ ∑ x ∈ P, weight x) :
    ∃ Q : Finset α, Q ⊆ P ∧ target ≤ ∑ x ∈ Q, weight x ∧
      ∑ x ∈ Q, weight x ≤ target + gap := by
  obtain ⟨Q, hQP, hQlo, hQhi⟩ :=
    exists_subset_sum_in_window_strict P weight target gap htarget hgap hsmall hsum
  exact ⟨Q, hQP, hQlo, hQhi.le⟩

/-- Residual form: after spending `base`, select an additional subfamily so
the combined weight lies in `[lo, hi)`. -/
lemma exists_subset_sum_in_residual_window {α : Type*} [DecidableEq α]
    (P : Finset α) (weight : α → ℝ) (base lo hi gap : ℝ)
    (hlo : base ≤ lo) (hgap_eq : gap = hi - lo) (hgap : 0 < gap)
    (hsmall : ∀ x ∈ P, weight x < gap)
    (hsum : lo - base ≤ ∑ x ∈ P, weight x) :
    ∃ Q : Finset α, Q ⊆ P ∧ lo ≤ base + ∑ x ∈ Q, weight x ∧
      base + ∑ x ∈ Q, weight x < hi := by
  obtain ⟨Q, hQP, hQlo, hQhi⟩ := exists_subset_sum_in_window_strict
    P weight (lo - base) gap (sub_nonneg.mpr hlo) hgap hsmall hsum
  refine ⟨Q, hQP, by linarith, ?_⟩
  rw [hgap_eq] at hQhi
  linarith

end RequestProject
