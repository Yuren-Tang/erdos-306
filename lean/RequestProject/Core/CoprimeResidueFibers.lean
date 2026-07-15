import Mathlib.Data.Nat.ChineseRemainder
import Mathlib.Data.ZMod.Basic

/-!
# Fibers of residue vectors for coprime moduli

A finite pairwise-coprime family of moduli determines a residue vector whose
value fixes an integer modulo the product of the moduli.  Consequently, on an
initial interval of length `b` times that product, every residue-vector fiber
has cardinality at most `b`.
-/

open Finset BigOperators Classical

noncomputable section

namespace RequestProject

/-- The vector of residues of a natural number along a finite family of moduli. -/
def residueVector (P : Finset ℕ) (h : ℕ) :
    (p : {p : ℕ // p ∈ P}) → ZMod p.1 :=
  fun p => (h : ZMod p.1)

/-- Equal residue vectors for pairwise-coprime moduli give congruence modulo
their product. -/
lemma residueVector_eq_modEq_prod {P : Finset ℕ} {h h' : ℕ}
    (hcop : P.toList.Pairwise (fun p q : ℕ => Nat.Coprime p q))
    (heq : residueVector P h = residueVector P h') :
    h ≡ h' [MOD ∏ p ∈ P, p] := by
  have hlist : h ≡ h' [MOD (P.toList.map id).prod] := by
    refine (Nat.modEq_list_map_prod_iff (s := id) (l := P.toList) hcop).mpr ?_
    intro p hp
    have hpP : p ∈ P := by simpa using hp
    exact (ZMod.natCast_eq_natCast_iff h h' p).mp
      (congrFun heq ⟨p, hpP⟩)
  have hprod : (P.toList.map id).prod = ∏ p ∈ P, p := by
    rw [List.map_id]
    change (P.toList : Multiset ℕ).prod = ∏ p ∈ P, p
    rw [Finset.coe_toList, Finset.prod_val]
    rfl
  simpa [hprod] using hlist

/-- The residue-vector map is injective among natural numbers having the same
quotient by the product of the moduli. -/
lemma residueVector_injective_on_quotientFiber {P : Finset ℕ} {h h' q : ℕ}
    (hcop : P.toList.Pairwise (fun p q : ℕ => Nat.Coprime p q))
    (hdiv : h / (∏ p ∈ P, p) = q)
    (hdiv' : h' / (∏ p ∈ P, p) = q)
    (heq : residueVector P h = residueVector P h') :
    h = h' := by
  have hmod := residueVector_eq_modEq_prod hcop heq
  unfold Nat.ModEq at hmod
  have hdecomp : h = (∏ p ∈ P, p) * (h / (∏ p ∈ P, p)) +
      h % (∏ p ∈ P, p) := by
    simpa [Nat.mul_comm] using (Nat.div_add_mod h (∏ p ∈ P, p)).symm
  have hdecomp' : h' = (∏ p ∈ P, p) * (h' / (∏ p ∈ P, p)) +
      h' % (∏ p ∈ P, p) := by
    simpa [Nat.mul_comm] using (Nat.div_add_mod h' (∏ p ∈ P, p)).symm
  rw [hdecomp, hdecomp', hdiv, hdiv', hmod]

/-- On an initial interval of length `b * ∏ P`, every residue-vector fiber has
cardinality at most `b`. -/
theorem residueVector_fiber_card_le {P : Finset ℕ}
    (hcop : P.toList.Pairwise (fun p q : ℕ => Nat.Coprime p q))
    (L b : ℕ) (hL : L = b * ∏ p ∈ P, p) :
    ∀ a : (p : {p : ℕ // p ∈ P}) → ZMod p.1,
      ((Finset.range L).filter (fun h => residueVector P h = a)).card ≤ b := by
  intro a
  let D : ℕ := ∏ p ∈ P, p
  let S : Finset ℕ :=
    (Finset.range L).filter (fun h => residueVector P h = a)
  by_cases hb0 : b = 0
  · have hL0 : L = 0 := by simp [hL, hb0]
    simp [hL0, hb0]
  have hmap : Set.MapsTo (fun h : ℕ => h / D) S (Finset.range b) := by
    intro h hh
    rw [Finset.mem_coe, Finset.mem_range]
    have hltL : h < L := Finset.mem_range.mp (Finset.mem_filter.mp hh).1
    rw [hL, mul_comm b D] at hltL
    exact Nat.div_lt_of_lt_mul hltL
  have hinj : (S : Set ℕ).InjOn (fun h : ℕ => h / D) := by
    intro h hh h' hh' hquot
    have heqh := (Finset.mem_filter.mp (show h ∈ S by simpa using hh)).2
    have heqh' := (Finset.mem_filter.mp (show h' ∈ S by simpa using hh')).2
    exact residueVector_injective_on_quotientFiber hcop
      (hdiv := rfl) (hdiv' := hquot.symm) (heqh.trans heqh'.symm)
  have hcard : S.card ≤ (Finset.range b).card :=
    Finset.card_le_card_of_injOn (fun h : ℕ => h / D) hmap hinj
  simpa [S] using hcard

end RequestProject

end
