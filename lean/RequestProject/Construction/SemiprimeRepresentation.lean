import RequestProject.Construction.Certificates.Assembly
import RequestProject.CircleMethod.ReciprocalSelection
import RequestProject.Core.UnitNumeratorReduction

/-!
# Reciprocal semiprime representations from the circle method

This leaf closes the circle-method chain with the concrete construction theorem
`exists_arcConstruction`, including the small-denominator reductions and
the reduction from a general numerator to the unit-numerator case.
-/

open scoped BigOperators

namespace CircleMethod

/-- The semiprime construction supplies a circle-method certificate, whose abstract
reciprocal-selection theorem gives the required avoiding representation. -/
theorem hasEgyptianSemiprimeReprAvoiding_one_div_of_three_le
    (T : Finset ℕ) (b : ℕ) (hb : 3 ≤ b) (hbsf : Squarefree b) :
    HasEgyptianSemiprimeReprAvoiding T ((1 : ℚ) / (b : ℚ)) := by
  obtain ⟨c⟩ := exists_arcConstruction T b hb hbsf
  exact c.hasEgyptianSemiprimeReprAvoiding (by omega)

/-- The case `b = 2`, using `1/2 = 1/3 + 1/6`. -/
theorem hasEgyptianSemiprimeReprAvoiding_one_div_two (T : Finset ℕ) :
    HasEgyptianSemiprimeReprAvoiding T ((1 : ℚ) / (2 : ℚ)) := by
  have sf6 : Squarefree 6 := by
    show Squarefree (2 * 3)
    rw [Nat.squarefree_mul_iff]
    exact ⟨by norm_num, Nat.prime_two.squarefree, Nat.prime_three.squarefree⟩
  obtain ⟨S3, hs3semi, hs3disj, hs3sum⟩ :=
    hasEgyptianSemiprimeReprAvoiding_one_div_of_three_le
      T 3 (by norm_num) Nat.prime_three.squarefree
  obtain ⟨S6, hs6semi, hs6disj, hs6sum⟩ :=
    hasEgyptianSemiprimeReprAvoiding_one_div_of_three_le (T ∪ S3) 6 (by norm_num) sf6
  obtain ⟨hs6T, hs6S3⟩ := Finset.disjoint_union_right.mp hs6disj
  refine ⟨S3 ∪ S6, ?_, Finset.disjoint_union_left.mpr ⟨hs3disj, hs6T⟩, ?_⟩
  · intro e he
    rcases Finset.mem_union.mp he with h | h
    · exact hs3semi e h
    · exact hs6semi e h
  · rw [Finset.sum_union hs6S3.symm, hs3sum, hs6sum]; norm_num

/-- The unit-numerator representation for every squarefree denominator at least two. -/
theorem hasEgyptianSemiprimeReprAvoiding_one_div_of_two_le
    (T : Finset ℕ) (b : ℕ) (hb : 2 ≤ b) (hbsf : Squarefree b) :
    HasEgyptianSemiprimeReprAvoiding T ((1 : ℚ) / (b : ℚ)) := by
  rcases Nat.eq_or_lt_of_le hb with hb2 | hb3
  · rw [← hb2]; exact hasEgyptianSemiprimeReprAvoiding_one_div_two T
  · exact hasEgyptianSemiprimeReprAvoiding_one_div_of_three_le T b hb3 hbsf

/-- `exists_semiprime_egyptian_one` (`1 = 1/2 + 1/3 + 1/6` with semiprimes) wired
to the circle-method construction. -/
theorem exists_semiprime_reciprocal_sum_one_avoiding (T : Finset ℕ) :
    ∃ G : Finset ℕ, (∀ e ∈ G, IsSemiprime e) ∧ (∀ e ∈ G, e ∉ T) ∧
      (∑ e ∈ G, (1 : ℚ) / (e : ℚ)) = 1 := by
  have sf6 : Squarefree 6 := by
    show Squarefree (2 * 3)
    rw [Nat.squarefree_mul_iff]
    exact ⟨by norm_num, Nat.prime_two.squarefree, Nat.prime_three.squarefree⟩
  obtain ⟨S2, hs2semi, hs2disj, hs2sum⟩ :=
    hasEgyptianSemiprimeReprAvoiding_one_div_of_two_le
      T 2 (by norm_num) Nat.prime_two.squarefree
  obtain ⟨S3, hs3semi, hs3disj, hs3sum⟩ :=
    hasEgyptianSemiprimeReprAvoiding_one_div_of_two_le
      (T ∪ S2) 3 (by norm_num) Nat.prime_three.squarefree
  obtain ⟨S6, hs6semi, hs6disj, hs6sum⟩ :=
    hasEgyptianSemiprimeReprAvoiding_one_div_of_two_le (T ∪ S2 ∪ S3) 6 (by norm_num) sf6
  obtain ⟨hs3T, hs3S2⟩ := Finset.disjoint_union_right.mp hs3disj
  obtain ⟨hs6TS2, hs6S3⟩ := Finset.disjoint_union_right.mp hs6disj
  obtain ⟨hs6T, hs6S2⟩ := Finset.disjoint_union_right.mp hs6TS2
  have hd23 : Disjoint S2 S3 := hs3S2.symm
  have hd26 : Disjoint S2 S6 := hs6S2.symm
  have hd36 : Disjoint S3 S6 := hs6S3.symm
  refine ⟨S2 ∪ S3 ∪ S6, ?_, ?_, ?_⟩
  · intro e he
    rcases Finset.mem_union.mp he with h | h6
    · rcases Finset.mem_union.mp h with h2 | h3
      · exact hs2semi e h2
      · exact hs3semi e h3
    · exact hs6semi e h6
  · intro e he
    rcases Finset.mem_union.mp he with h | h6
    · rcases Finset.mem_union.mp h with h2 | h3
      · exact Finset.disjoint_left.mp hs2disj h2
      · exact Finset.disjoint_left.mp hs3T h3
    · exact Finset.disjoint_left.mp hs6T h6
  · have hd_23_6 : Disjoint (S2 ∪ S3) S6 := Finset.disjoint_union_left.mpr ⟨hd26, hd36⟩
    rw [Finset.sum_union hd_23_6, Finset.sum_union hd23, hs2sum, hs3sum, hs6sum]
    norm_num

/-- The avoiding unit-numerator representation for every positive squarefree denominator. -/
theorem hasEgyptianSemiprimeReprAvoiding_one_div (T : Finset ℕ) (b : ℕ) (hb : 0 < b)
    (hbsf : Squarefree b) :
    HasEgyptianSemiprimeReprAvoiding T ((1 : ℚ) / (b : ℚ)) := by
  rcases Nat.lt_or_ge b 2 with hb1 | hb2
  · have hb1' : b = 1 := by omega
    subst hb1'
    obtain ⟨G, hsemi, havoid, hsum⟩ := exists_semiprime_reciprocal_sum_one_avoiding T
    exact ⟨G, hsemi, Finset.disjoint_left.mpr havoid, by rw [Nat.cast_one, div_one]; exact hsum⟩
  · rcases Nat.eq_or_lt_of_le hb2 with hb2' | hb3
    · rw [← hb2']; exact hasEgyptianSemiprimeReprAvoiding_one_div_two T
    · exact hasEgyptianSemiprimeReprAvoiding_one_div_of_three_le T b hb3 hbsf

end CircleMethod

/-- For positive `a` and squarefree positive `b`, the rational `a / b` has an
Egyptian representation by distinct squarefree semiprimes. -/
theorem hasEgyptianSemiprimeRepr_div_of_squarefree
    (a b : ℕ) (_ : 0 < a) (hb : 0 < b) (hbsf : Squarefree b) :
    HasEgyptianSemiprimeRepr ((a : ℚ) / b) :=
  reduction_to_unit_numerator_avoiding
    (fun T b hb hbsf =>
      CircleMethod.hasEgyptianSemiprimeReprAvoiding_one_div T b hb hbsf)
    b hb hbsf a
