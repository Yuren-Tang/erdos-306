import RequestProject.BlockCRTEnergy

/-! Finite CRT assignments, centered representatives, quadratic block energy,
and the associated deviation scale. -/

namespace LocalEnergy

/-- If two residues are induced by an integer whose absolute value is less
than half the product of two distinct prime moduli, their centered CRT
representative recovers that integer. -/
lemma crtRepr_eq_of_eq_intCast (p q : ℕ) (hp : Nat.Prime p) (hq : Nat.Prime q) (hpq : p ≠ q)
    (m : ℤ) (hm : 2 * |m| < (p:ℤ) * q)
    (ap : ZMod p) (aq : ZMod q) (hap : ap = (m : ZMod p)) (haq : aq = (m : ZMod q)) :
    crtRepr p q ap aq = m := by
  obtain ⟨k, hk⟩ : ∃ k : ℤ, crtRepr p q ap aq - m = k * (p * q) := by
    have h_crt : (crtRepr p q ap aq : ℤ) ≡ m [ZMOD p] ∧ (crtRepr p q ap aq : ℤ) ≡ m [ZMOD q] := by
      have h_crt : (crtRepr p q ap aq : ZMod p) = ap ∧ (crtRepr p q ap aq : ZMod q) = aq := by
        exact ⟨ by simpa using crtRepr_congr_left p q ap aq ( (Nat.coprime_primes hp hq).mpr hpq ), by simpa using crtRepr_congr_right p q ap aq ( (Nat.coprime_primes hp hq).mpr hpq ) ⟩;
      simp_all +decide [ ← ZMod.intCast_eq_intCast_iff ];
    have h_crt : (p * q : ℤ) ∣ (crtRepr p q ap aq - m) := by
      convert Int.coe_lcm_dvd ( Int.modEq_iff_dvd.mp h_crt.1.symm ) ( Int.modEq_iff_dvd.mp h_crt.2.symm ) using 1 ; norm_cast ; rw [ Nat.Coprime.lcm_eq_mul <| hp.coprime_iff_not_dvd.mpr fun h => hpq <| Nat.prime_dvd_prime_iff_eq hp hq |>.1 h ];
    exact dvd_iff_exists_eq_mul_left.mp h_crt;
  -- The centered representative and `m` lie in the same interval of length `pq`.
  have h_abs_crtRepr : |crtRepr p q ap aq| ≤ (p * q) / 2 := by
    apply crtRepr_abs_le;
    · simpa [ hpq ] using Nat.coprime_primes hp hq;
    · exact hp.pos;
    · exact hq.pos;
  rcases lt_trichotomy k 0 with hk' | rfl | hk' <;> nlinarith [ Int.mul_ediv_add_emod ( p * q ) 2, Int.emod_nonneg ( p * q ) two_ne_zero, Int.emod_lt_of_pos ( p * q ) two_pos, abs_le.mp h_abs_crtRepr, abs_le.mp ( show |m| ≤ |m| by rfl ) ]
/-- A block-energy sublevel set is no larger than the full assignment space;
if every modulus in the block is at most `2X`, its cardinality is at most
`(2X) ^ P.card`. -/
lemma levelset_card_le_pow (X : ℕ) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, p ≤ 2 * X) (R : ℝ) :
    ((Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)).card : ℝ)
      ≤ (2 * (X : ℝ)) ^ P.card := by
  refine' le_trans _ _
  exact (∏ p ∈ P, p : ℝ)
  · refine' le_trans (Nat.cast_le.mpr <| Finset.card_filter_le _ _) _
    simp +decide [Fintype.card_pi]
    conv_rhs => rw [← Finset.prod_attach]
  · exact le_trans
      (Finset.prod_le_prod (fun _ _ => Nat.cast_nonneg _)
        fun p hp => Nat.cast_le.mpr (hP p hp))
      (by norm_num)

/-- For a prime block contained in `[X, 2X]`, the block deviation satisfies
`sigmaP P ≤ P.card / X ^ 2`. -/
lemma block_deviation_upper_bound (X : ℕ) (hX : 1 ≤ X) (P : Finset ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X) :
    sigmaP P ≤ (P.card : ℝ) / (X : ℝ) ^ 2 := by
  refine Real.sqrt_le_iff.mpr ?_
  refine' ⟨by positivity, le_trans (Finset.sum_le_sum fun pq hpq =>
    one_div_le_one_div_of_le ?_ <| pow_le_pow_left₀ (by positivity)
      (mul_le_mul (Nat.cast_le.mpr <| (hP _ pq.1.2).2.1)
        (Nat.cast_le.mpr <| (hP _ pq.2.2).2.1)
        (by positivity) (by positivity)) 2) _⟩ <;> norm_num
  · positivity
  · field_simp
    exact_mod_cast le_trans (Finset.card_filter_le _ _)
      (by norm_num [sq, Finset.card_product])

end LocalEnergy
