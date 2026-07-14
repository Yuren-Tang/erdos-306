import RequestProject.LocalEnergy.BlockEnergy

/-!
# Elementary bounds for block energy

These estimates use only the size of the assignment space and the dyadic
location of the moduli. They form the elementary interface between the CRT
block model and the later level-set arguments.
-/

namespace LocalEnergy

/-- A block-energy sublevel set is no larger than the full assignment space;
if every modulus in the block is at most `2X`, its cardinality is at most
`(2X) ^ P.card`. -/
lemma levelset_card_le_pow (X : ℕ) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, p ≤ 2 * X) (R : ℝ) :
    ((Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)).card : ℝ)
      ≤ (2 * (X : ℝ)) ^ P.card := by
  refine' le_trans _ _
  exact (∏ p ∈ P, p : ℝ)
  · have hcard :
        (Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)).card ≤
          ∏ p ∈ P, p :=
      (Finset.card_filter_le _ _).trans_eq (blockAssignment_card P)
    rw [← Nat.cast_prod]
    exact_mod_cast hcard
  · exact le_trans
      (Finset.prod_le_prod (fun _ _ => Nat.cast_nonneg _)
        fun p hp => Nat.cast_le.mpr (hP p hp))
      (by norm_num)

/-- If every modulus in a block is at least `X`, then its deviation is at most
`P.card / X ^ 2`. -/
lemma block_deviation_upper_bound (X : ℕ) (hX : 1 ≤ X) (P : Finset ℕ)
    (hP : ∀ p ∈ P, X ≤ p) :
    sigmaP P ≤ (P.card : ℝ) / (X : ℝ) ^ 2 := by
  refine Real.sqrt_le_iff.mpr ?_
  refine' ⟨by positivity, le_trans (Finset.sum_le_sum fun pq hpq =>
    one_div_le_one_div_of_le ?_ <| pow_le_pow_left₀ (by positivity)
      (mul_le_mul (Nat.cast_le.mpr <| hP _ pq.1.2)
        (Nat.cast_le.mpr <| hP _ pq.2.2)
        (by positivity) (by positivity)) 2) _⟩ <;> norm_num
  · positivity
  · field_simp
    exact_mod_cast le_trans (Finset.card_filter_le _ _)
      (by norm_num [sq, Finset.card_product])

end LocalEnergy
