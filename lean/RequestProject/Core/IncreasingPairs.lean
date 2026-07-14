import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.Prod

/-!
# Increasing pairs in a finite linear order

An unordered two-element subset of a linearly ordered finite set has a unique
increasing enumeration. This file packages that representative and its basic
cardinality formulas.
-/

open Finset

variable {α : Type*} [LinearOrder α]

/-- Pairs of elements of `s`, represented in increasing order. -/
def increasingPairs (s : Finset α) : Finset (s × s) :=
  (s.attach ×ˢ s.attach).filter fun xy => xy.1.1 < xy.2.1

/-- Increasing pairs are in bijection with two-element subsets. -/
theorem card_increasingPairs (s : Finset α) :
    (increasingPairs s).card = Nat.choose s.card 2 := by
  have hpairs : (increasingPairs s).card =
      (Finset.powersetCard 2 s).card := by
    refine' Finset.card_bij (fun x hx => {x.1.1, x.2.1}) _ _ _ <;>
      simp +decide [increasingPairs]
    · grind
    · simp +contextual [Finset.Subset.antisymm_iff, Finset.subset_iff]
      grind
    · intro t ht ht2
      rw [Finset.card_eq_two] at ht2
      obtain ⟨x, y, hxy, rfl⟩ := ht2
      cases lt_trichotomy x y <;> aesop
  rw [hpairs, Finset.card_powersetCard]

/-- Restricting both endpoints to `t` leaves exactly `|t| choose 2`
increasing pairs. -/
theorem card_filter_increasingPairs (s : Finset α) (t : Finset s) :
    ((increasingPairs s).filter fun xy => xy.1 ∈ t ∧ xy.2 ∈ t).card =
      Nat.choose t.card 2 := by
  have hpairs :
      ((increasingPairs s).filter fun xy => xy.1 ∈ t ∧ xy.2 ∈ t).card =
        (Finset.powersetCard 2 t).card := by
    refine' Finset.card_bij (fun xy hxy => {xy.1, xy.2}) _ _ _ <;>
      simp +decide [increasingPairs]
    · grind
    · simp +contextual [Finset.Subset.antisymm_iff, Finset.subset_iff]
      intros
      grind
    · intro u hu hu2
      rw [Finset.card_eq_two] at hu2
      obtain ⟨x, y, hxy⟩ := hu2
      simp_all +decide [Finset.subset_iff]
      cases lt_or_gt_of_ne
          (show x.1 ≠ y.1 from fun h => hxy.1 (Subtype.ext h)) <;>
        [exact ⟨x.1, x.2, y.1, y.2, ⟨by assumption, hu.1, hu.2⟩, by aesop⟩;
         exact ⟨y.1, y.2, x.1, x.2, ⟨by assumption, hu.2, hu.1⟩, by aesop⟩]
  rw [hpairs, Finset.card_powersetCard]
