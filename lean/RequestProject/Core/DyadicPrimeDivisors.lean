import Mathlib.RingTheory.Int.Basic

/-!
# Prime divisors in a dyadic interval

Three distinct prime divisors from `[X,2X]` have product at least `X³`.
Consequently a nonzero integer of absolute value below `X³` has at most two
such divisors.
-/

namespace RequestProject

/-- A nonzero integer smaller than `X³` has at most two prime divisors in
`[X,2X]`. -/
lemma card_dyadicPrimeDivisors_le_two (X : ℕ) (n : ℤ) (hn : n ≠ 0)
    (hX : |n| < (X : ℤ) ^ 3) :
    ((Finset.Icc X (2 * X)).filter
      (fun p => Nat.Prime p ∧ (p : ℤ) ∣ n)).card ≤ 2 := by
  by_contra h_contra
  obtain ⟨a, b, c, ha, hb, hc, habc⟩ :
      ∃ a b c : ℕ, a ∈ Finset.Icc X (2 * X) ∧ b ∈ Finset.Icc X (2 * X) ∧
        c ∈ Finset.Icc X (2 * X) ∧ Nat.Prime a ∧ Nat.Prime b ∧ Nat.Prime c ∧
        a ∣ Int.natAbs n ∧ b ∣ Int.natAbs n ∧ c ∣ Int.natAbs n ∧
        a ≠ b ∧ a ≠ c ∧ b ≠ c := by
    obtain ⟨s, hs⟩ := Finset.two_lt_card.mp (by linarith)
    simp_all +decide
    rcases hs with ⟨⟨⟨hs₁, hs₂⟩, hs₃, hs₄⟩, b,
      ⟨⟨hb₁, hb₂⟩, hb₃, hb₄⟩, c, ⟨⟨hc₁, hc₂⟩, hc₃, hc₄⟩, hbc⟩
    use s, ⟨hs₁, hs₂⟩, b, ⟨hb₁, hb₂⟩, c, ⟨hc₁, hc₂⟩
    simp_all +decide [← Int.natCast_dvd_natCast]
  have h_prod_div : (a * b * c : ℤ) ∣ n.natAbs := by
    norm_cast
    apply_mod_cast Nat.Coprime.mul_dvd_of_dvd_of_dvd
    · simp_all +decide [Nat.coprime_mul_iff_left, Nat.coprime_primes]
    · exact Nat.Coprime.mul_dvd_of_dvd_of_dvd
        (by have := Nat.coprime_primes habc.1 habc.2.1; aesop)
        habc.2.2.2.1 habc.2.2.2.2.1
    · tauto
  have h_prod_ge : (a * b * c : ℤ) ≥ X ^ 3 := by
    norm_cast
    exact le_trans (by ring_nf; norm_num)
      (Nat.mul_le_mul (Nat.mul_le_mul (Finset.mem_Icc.mp ha).1
        (Finset.mem_Icc.mp hb).1) (Finset.mem_Icc.mp hc).1)
  exact not_lt_of_ge (Int.le_of_dvd (by positivity) h_prod_div)
    (by simpa [abs_mul] using hX.trans_le h_prod_ge)

end RequestProject
