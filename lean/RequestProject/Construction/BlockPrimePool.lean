import RequestProject.GlobalControl.AnalyticInputs
import RequestProject.Core.OrderedPairSum

open Finset BigOperators

noncomputable section

namespace CircleMethod

/-!
# Reciprocal load of the block-prime pool

The available reciprocal load from products `p·q` of two distinct block primes
is `∑_{p<q} 1/(pq) = (S² − S₂)/2`, where `S = ∑ 1/p` and `S₂ = ∑ 1/p²`.
The lower bound `≥ 1/2` follows from `dyadic_mertens_cumulative`
(`S ≥ 21/20`) plus a tail bound `S₂ ≤ 1/(2^{k₀}−1)`.
-/

/-! ## The block-prime pool -/

open GlobalControl in
/-- The block primes drawn from the dyadic blocks `[2^{k₀}, 2^{3k₀+1})`. -/
def blockPrimes (k0 : ℕ) : Finset ℕ :=
  (Finset.Icc k0 (3 * k0)).biUnion GlobalControl.dyadicBlock

open GlobalControl in
/-- Every block prime is prime. -/
lemma blockPrimes_prime {k0 p : ℕ} (hp : p ∈ blockPrimes k0) : Nat.Prime p := by
  rw [blockPrimes, Finset.mem_biUnion] at hp
  obtain ⟨k, _, hpk⟩ := hp
  exact (Finset.mem_filter.mp hpk).2

open GlobalControl in
/-- Every block prime is `≥ 2^{k₀}`. -/
lemma blockPrimes_ge {k0 p : ℕ} (hp : p ∈ blockPrimes k0) : 2 ^ k0 ≤ p := by
  rw [blockPrimes, Finset.mem_biUnion] at hp
  obtain ⟨k, hk, hpk⟩ := hp
  rw [GlobalControl.dyadicBlock, Finset.mem_filter, Finset.mem_Ico] at hpk
  rw [Finset.mem_Icc] at hk
  exact le_trans (Nat.pow_le_pow_right (by norm_num) hk.1) hpk.1.1

open GlobalControl in
/-- Every block prime is `< 2^{3k₀+1}`. -/
lemma blockPrimes_lt {k0 p : ℕ} (hp : p ∈ blockPrimes k0) : p < 2 ^ (3 * k0 + 1) := by
  rw [blockPrimes, Finset.mem_biUnion] at hp
  obtain ⟨k, hk, hpk⟩ := hp
  rw [GlobalControl.dyadicBlock, Finset.mem_filter, Finset.mem_Ico] at hpk
  rw [Finset.mem_Icc] at hk
  exact lt_of_lt_of_le hpk.1.2 (Nat.pow_le_pow_right (by norm_num) (by omega))

/-- The block primes are contained in `Ico (2^{k₀}) (2^{3k₀+1})`. -/
lemma blockPrimes_subset_Ico (k0 : ℕ) :
    blockPrimes k0 ⊆ Finset.Ico (2 ^ k0) (2 ^ (3 * k0 + 1)) := by
  intro p hp
  rw [Finset.mem_Ico]
  exact ⟨blockPrimes_ge hp, blockPrimes_lt hp⟩

/-! ## T1 — the squared tail is small -/

/-
**T1.**  The reciprocal-square load of the block primes is at most
`1/(2^{k₀}-1)`.
-/
lemma blockPrimes_sub_sq_tail (k0 : ℕ) (hk0 : 5 ≤ k0) :
    ∑ p ∈ blockPrimes k0, (1 : ℝ) / (p : ℝ) ^ 2 ≤ 1 / ((2 ^ k0 : ℝ) - 1) := by
  refine' le_trans ( Finset.sum_le_sum_of_subset_of_nonneg ( blockPrimes_subset_Ico k0 ) ( fun _ _ _ => by positivity ) ) _;
  have h_sum_bound : ∀ n : ℕ, 2^k0 ≤ n → (1 : ℝ) / n^2 ≤ 1 / (n - 1) - 1 / n := by
    intro n hn; rw [ div_sub_div, div_le_div_iff₀ ] <;> nlinarith [ show ( n : ℝ ) ≥ 2 ^ k0 by exact_mod_cast hn, show ( 2 : ℝ ) ^ k0 ≥ 32 by exact le_trans ( by norm_num ) ( pow_le_pow_right₀ ( by norm_num ) hk0 ) ] ;
  have h_telescope : ∀ N : ℕ, 2^k0 ≤ N → (∑ n ∈ Finset.Ico (2^k0) N, (1 / (n - 1 : ℝ) - 1 / (n : ℝ))) = (1 / (2^k0 - 1 : ℝ)) - (1 / (N - 1 : ℝ)) := by
    intro N hN; induction hN <;> simp_all +decide [ Finset.sum_Ico_succ_top ] ;
    linarith;
  exact le_trans ( Finset.sum_le_sum fun i hi => h_sum_bound i <| Finset.mem_Ico.mp hi |>.1 ) ( by rw [ h_telescope _ <| Nat.pow_le_pow_right ( by decide ) <| by linarith ] ; exact sub_le_self _ <| one_div_nonneg.mpr <| sub_nonneg.mpr <| mod_cast Nat.one_le_iff_ne_zero.mpr <| by positivity )

/-! ## Injectivity of the product map on distinct-prime pairs -/

/-
The product map `(p,q) ↦ p·q` is injective on the strictly-ordered
off-diagonal pairs of block primes (unique factorization of a semiprime).
-/
lemma blockPrimes_pair_prod_injOn (k0 : ℕ) :
    Set.InjOn (fun pq : ℕ × ℕ => pq.1 * pq.2)
      ↑((blockPrimes k0).offDiag.filter (fun pq => pq.1 < pq.2)) := by
  intros pq hpq pq' hpq' h_eq;
  simp +zetaDelta at *;
  -- Since `pq.1` and `pq.2` are primes and `pq.1 * pq.2 = pq'.1 * pq'.2`, we have `pq.1 = pq'.1` or `pq.1 = pq'.2`.
  have h_cases : pq.1 = pq'.1 ∨ pq.1 = pq'.2 := by
    have h_cases : Nat.Prime pq.1 ∧ Nat.Prime pq.2 ∧ Nat.Prime pq'.1 ∧ Nat.Prime pq'.2 := by
      exact ⟨ blockPrimes_prime hpq.1.1, blockPrimes_prime hpq.1.2.1, blockPrimes_prime hpq'.1.1, blockPrimes_prime hpq'.1.2.1 ⟩;
    have := h_cases.1.dvd_mul.mp ( h_eq ▸ dvd_mul_right _ _ ) ; simp_all +decide [ Nat.prime_dvd_prime_iff_eq ] ;
  cases h_cases <;> simp_all +decide [ mul_comm ];
  · cases h_eq <;> simp_all +decide [ Prod.ext_iff ];
    exact absurd (blockPrimes_prime hpq'.1.1) Nat.not_prime_zero
  · grind

/-! ## T2 — the product-load lower bound -/

/-
**T2 (core).**  Given the Mertens reciprocal-sum lower bound `S ≥ 21/20` for a
fixed `k₀ ≥ 5`, the off-diagonal (`p<q`) reciprocal product-load of the block
primes is at least `1/2`.  (The Mertens input is supplied as a hypothesis here;
the unconditional `blockPrimes_product_load_ge` feeds it from the axiom.)
-/
lemma blockPrimes_product_load_ge_of (k0 : ℕ) (hk0 : 5 ≤ k0)
    (hmertens : (21 : ℝ) / 20 ≤ ∑ p ∈ blockPrimes k0, (1 : ℝ) / (p : ℝ)) :
    (1 : ℝ) / 2 ≤
      ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq => pq.1 < pq.2),
        (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)) := by
  -- Expand `S²` into diagonal and strictly ordered pair contributions.
  have h_identity : (∑ p ∈ blockPrimes k0, (1 : ℝ) / (p : ℝ)) ^ 2 =
    (∑ p ∈ blockPrimes k0, (1 : ℝ) / (p : ℝ) ^ 2) +
    2 * ∑ pq ∈ (blockPrimes k0 |>.offDiag.filter (fun pq => pq.1 < pq.2)), (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)) := by
      convert RequestProject.sq_sum_eq_sum_sq_add_twice_sum_lt ( blockPrimes k0 ) ( fun p : ℕ => ( 1 : ℝ ) / p ) using 1 ; norm_num [ mul_comm ];
  nlinarith [ show ( ∑ p ∈ blockPrimes k0, 1 / ( p : ℝ ) ^ 2 ) ≤ 1 / 31 by exact le_trans ( blockPrimes_sub_sq_tail k0 hk0 ) ( by rw [ div_le_div_iff₀ ] <;> linarith [ pow_le_pow_right₀ ( by norm_num : ( 1 : ℝ ) ≤ 2 ) hk0 ] ) ]

/-! ## T2 and T3 — unconditional forms (fed from the dyadic-Mertens axiom) -/

/-- **T2.**  For all large `k₀`, the off-diagonal (`p<q`) reciprocal product-load
of the block primes is at least `1/2`.  This is `blockPrimes_product_load_ge_of`
with the Mertens reciprocal-sum lower bound supplied by
`GlobalControl.dyadic_mertens_cumulative`. -/
lemma blockPrimes_product_load_ge :
    ∃ k1 : ℕ, 5 ≤ k1 ∧ ∀ k0 : ℕ, k1 ≤ k0 →
      (1 : ℝ) / 2 ≤
        ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq => pq.1 < pq.2),
          (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)) := by
  obtain ⟨k1, h5, hk⟩ := GlobalControl.dyadic_mertens_cumulative
  refine ⟨k1, h5, fun k0 hle => ?_⟩
  exact blockPrimes_product_load_ge_of k0 (le_trans h5 hle) (hk k0 hle)

end CircleMethod

end
