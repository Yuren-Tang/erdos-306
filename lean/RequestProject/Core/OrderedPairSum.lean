import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Finset.Sym
import Mathlib.Tactic.Ring

/-! # The ordered-pair expansion of a squared finite sum -/

open Finset BigOperators

namespace RequestProject

/-- The square of a finite sum is the sum of the diagonal squares plus twice
the sum over strictly ordered pairs. -/
lemma sq_sum_eq_sum_sq_add_twice_sum_lt {α R : Type*} [LinearOrder α]
    [CommRing R] (s : Finset α) (x : α → R) :
    (∑ p ∈ s, x p) ^ 2 = (∑ p ∈ s, (x p) ^ 2) +
      2 * ∑ pq ∈ s.offDiag.filter (fun pq => pq.1 < pq.2), x pq.1 * x pq.2 := by
  classical
  have hexp : (∑ p ∈ s, x p) ^ 2 = ∑ pq ∈ s ×ˢ s, x pq.1 * x pq.2 := by
    rw [sq, Finset.sum_mul_sum, Finset.sum_product]
  rw [hexp, ← Finset.diag_union_offDiag s,
    Finset.sum_union (Finset.disjoint_diag_offDiag s), Finset.sum_diag]
  have hdiag : ∑ p ∈ s, x p * x p = ∑ p ∈ s, (x p) ^ 2 :=
    Finset.sum_congr rfl (fun p _ => by rw [sq])
  rw [hdiag]
  congr 1
  have hsplit := Finset.sum_filter_add_sum_filter_not s.offDiag
    (fun pq => pq.1 < pq.2) (fun pq => x pq.1 * x pq.2)
  have hswap :
      ∑ pq ∈ s.offDiag.filter (fun pq => ¬pq.1 < pq.2), x pq.1 * x pq.2 =
        ∑ pq ∈ s.offDiag.filter (fun pq => pq.1 < pq.2), x pq.1 * x pq.2 := by
    refine Finset.sum_nbij' (fun pq => Prod.swap pq) (fun pq => Prod.swap pq) ?_ ?_ ?_ ?_ ?_
    · intro pq hpq
      rw [Finset.mem_filter, Finset.mem_offDiag] at hpq ⊢
      obtain ⟨⟨h1, h2, hne⟩, hnlt⟩ := hpq
      refine ⟨⟨h2, h1, fun h => hne h.symm⟩, ?_⟩
      simp only [Prod.fst_swap, Prod.snd_swap]
      exact lt_of_le_of_ne (not_lt.mp hnlt) hne.symm
    · intro pq hpq
      rw [Finset.mem_filter, Finset.mem_offDiag] at hpq ⊢
      obtain ⟨⟨h1, h2, hne⟩, hlt⟩ := hpq
      refine ⟨⟨h2, h1, fun h => hne h.symm⟩, ?_⟩
      simp only [Prod.fst_swap, Prod.snd_swap]
      exact not_lt.mpr hlt.le
    · intro pq _; simp
    · intro pq _; simp
    · intro pq _; simp only [Prod.fst_swap, Prod.snd_swap]; ring
  rw [← hsplit, hswap]
  ring

end RequestProject
