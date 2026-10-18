import RequestProject.DyadicBlockDef
import RequestProject.NoAxiomMertensBlock
import RequestProject.NoAxiomDensity

/-!
# Dyadic prime estimates (axiom-free)

The two Rosser–Schoenfeld (1962) axioms formerly stated here (Corollary 3 and
Theorem 5) have been removed.  The dyadic specializations the construction
consumes are now proved elementarily:

* `dyadic_prime_density` (for `k ≥ 56`) — Chebyshev's `30`-combination
  `log(30m)! − log(15m)! − log(10m)! − log(6m)! + log m!` (`NoAxiomChebyshev`,
  `NoAxiomDensity`);
* `dyadic_mertens_cumulative` — elementary Mertens bounds on
  `∑_{p≤n} log p / p` (`NoAxiomMertens`, `NoAxiomMertensBlock`).
-/

open Finset BigOperators

noncomputable section

namespace RosserSchoenfeld

/-- `∑_{p ≤ x} 1 / p`, with the real endpoint represented by `⌊x⌋₊`. -/
def primeRecipSum (x : ℝ) : ℝ :=
  ∑ p ∈ (Finset.Icc 2 ⌊x⌋₊).filter Nat.Prime, (1 : ℝ) / (p : ℝ)

end RosserSchoenfeld

namespace GlobalControl

/-- `2 ^ n` is not prime once `n ≥ 2` (it has the proper divisor `2`). -/
lemma two_pow_not_prime {n : ℕ} (hn : 2 ≤ n) : ¬ (2 ^ n).Prime := by
  intro hp
  have hdvd : (2 : ℕ) ∣ 2 ^ n := dvd_pow_self 2 (by omega)
  have heq : (2 : ℕ) = 2 ^ n := (Nat.prime_dvd_prime_iff_eq Nat.prime_two hp).mp hdvd
  have hge : (4 : ℕ) ≤ 2 ^ n := by
    calc (4 : ℕ) = 2 ^ 2 := by norm_num
      _ ≤ 2 ^ n := Nat.pow_le_pow_right (by norm_num) hn
  omega

/-- `π n = π' n` when `n` is not prime (no contribution from `n` itself). -/
lemma primeCounting_eq_primeCounting'_of_not_prime {n : ℕ} (hn : ¬ n.Prime) :
    Nat.primeCounting n = Nat.primeCounting' n := by
  unfold Nat.primeCounting Nat.primeCounting'
  rw [Nat.count_succ, if_neg hn, Nat.add_zero]

/-- The dyadic block `[2ᵏ, 2ᵏ⁺¹)` has exactly `π'(2ᵏ⁺¹) − π'(2ᵏ)` primes. -/
lemma dyadicBlock_card_eq (k : ℕ) :
    (dyadicBlock k).card
      = Nat.primeCounting' (2 ^ (k + 1)) - Nat.primeCounting' (2 ^ k) := by
  have hle : (2 : ℕ) ^ k ≤ 2 ^ (k + 1) := Nat.pow_le_pow_right (by norm_num) (Nat.le_succ k)
  have hsub : Nat.primesBelow (2 ^ k) ⊆ Nat.primesBelow (2 ^ (k + 1)) := by
    intro p hp
    simp only [Nat.primesBelow, Finset.mem_filter, Finset.mem_range] at hp ⊢
    exact ⟨lt_of_lt_of_le hp.1 hle, hp.2⟩
  have hset : dyadicBlock k = Nat.primesBelow (2 ^ (k + 1)) \ Nat.primesBelow (2 ^ k) := by
    ext p
    simp only [dyadicBlock, Nat.primesBelow, Finset.mem_filter, Finset.mem_Ico,
      Finset.mem_sdiff, Finset.mem_range]
    constructor
    · rintro ⟨⟨h1, h2⟩, hp⟩
      exact ⟨⟨h2, hp⟩, fun h => absurd h.1 (not_lt.mpr h1)⟩
    · rintro ⟨⟨h2, hp⟩, hn⟩
      refine ⟨⟨?_, h2⟩, hp⟩
      by_contra h
      exact hn ⟨not_le.mp h, hp⟩
  have hkey : (dyadicBlock k).card + Nat.primeCounting' (2 ^ k)
      = Nat.primeCounting' (2 ^ (k + 1)) := by
    rw [hset, ← Nat.primesBelow_card_eq_primeCounting' (2 ^ k),
      ← Nat.primesBelow_card_eq_primeCounting' (2 ^ (k + 1))]
    exact Finset.card_sdiff_add_card_eq_card hsub
  omega

/-- **Dyadic prime density** (axiom-free; proved in `NoAxiomDensity` by
Chebyshev's elementary method).  For `k ≥ 56`,
`2ᵏ / (2 log 2ᵏ) ≤ #{p prime : 2ᵏ ≤ p < 2ᵏ⁺¹}`. -/
theorem dyadic_prime_density (k : ℕ) (hk : 56 ≤ k) :
    (2 ^ k : ℝ) / (2 * Real.log (2 ^ k)) ≤ ((dyadicBlock k).card : ℝ) :=
  dyadic_prime_density_noAxiom k hk

/-- `exp 1.06 < 3`, hence `1.06 < log 3` (the true value is `≈ 1.0986`); the
cheap lower bound used to clear the `21/20` threshold. -/
private lemma log_three_gt : (1.06 : ℝ) < Real.log 3 := by
  refine (Real.lt_log_iff_exp_lt (by norm_num)).mpr ?_
  have hb : (0.94 : ℝ) ≤ Real.exp (-0.06) := by
    have h := Real.add_one_le_exp (-0.06 : ℝ); linarith
  have hpos06 : (0 : ℝ) < Real.exp 0.06 := Real.exp_pos _
  rw [Real.exp_neg] at hb
  have h06m : (0.94 : ℝ) * Real.exp 0.06 ≤ 1 := by
    have := mul_le_mul_of_nonneg_right hb (le_of_lt hpos06)
    rwa [inv_mul_cancel₀ (ne_of_gt hpos06)] at this
  have he1 : Real.exp 1 < 2.7182818286 := Real.exp_one_lt_d9
  have hsplit : Real.exp (1.06 : ℝ) = Real.exp 1 * Real.exp 0.06 := by
    rw [← Real.exp_add]; norm_num
  rw [hsplit]
  nlinarith [he1, h06m, hpos06]

/-- For `m ≥ 2`, `∑_{p ≤ 2^m} 1/p = ∑_{p ∈ primesBelow (2^m)} 1/p` (the endpoint
`2^m` is composite, so the closed and open upper limits agree). -/
private lemma primeRecipSum_two_pow {m : ℕ} (hm : 2 ≤ m) :
    RosserSchoenfeld.primeRecipSum ((2 : ℝ) ^ m)
      = ∑ p ∈ Nat.primesBelow (2 ^ m), (1 : ℝ) / (p : ℝ) := by
  have hfloor : ⌊((2 : ℝ) ^ m)⌋₊ = 2 ^ m := by
    rw [show ((2 : ℝ) ^ m) = ((2 ^ m : ℕ) : ℝ) by push_cast; ring, Nat.floor_natCast]
  have hset : (Finset.Icc 2 (2 ^ m)).filter Nat.Prime = Nat.primesBelow (2 ^ m) := by
    ext p
    simp only [Nat.primesBelow, Finset.mem_filter, Finset.mem_Icc, Finset.mem_range]
    constructor
    · rintro ⟨⟨_, hple⟩, hp⟩
      exact ⟨lt_of_le_of_ne hple (fun h => two_pow_not_prime hm (h ▸ hp)), hp⟩
    · rintro ⟨hlt, hp⟩
      exact ⟨⟨hp.two_le, le_of_lt hlt⟩, hp⟩
  unfold RosserSchoenfeld.primeRecipSum
  rw [hfloor, hset]

/-- The biUnion of dyadic blocks over `[k0, 3k0]` is exactly the primes in
`[2^{k0}, 2^{3k0+1})`. -/
private lemma biUnion_dyadicBlock_eq_sdiff (k0 : ℕ) :
    (Finset.Icc k0 (3 * k0)).biUnion dyadicBlock
      = Nat.primesBelow (2 ^ (3 * k0 + 1)) \ Nat.primesBelow (2 ^ k0) := by
  ext p
  simp only [Finset.mem_biUnion, Finset.mem_Icc, dyadicBlock, Finset.mem_filter,
    Finset.mem_Ico, Nat.primesBelow, Finset.mem_sdiff, Finset.mem_range, not_and]
  constructor
  · rintro ⟨k, ⟨hk0k, hk3⟩, ⟨h2k, hlt2k1⟩, hp⟩
    refine ⟨⟨?_, hp⟩, ?_⟩
    · calc p < 2 ^ (k + 1) := hlt2k1
        _ ≤ 2 ^ (3 * k0 + 1) := Nat.pow_le_pow_right (by norm_num) (by omega)
    · exact fun hlt =>
        absurd hlt (not_lt.mpr (le_trans (Nat.pow_le_pow_right (by norm_num) hk0k) h2k))
  · rintro ⟨⟨hlt, hp⟩, hge⟩
    have hp0 : p ≠ 0 := hp.pos.ne'
    have hge' : 2 ^ k0 ≤ p := by
      by_contra h
      exact hge (not_le.mp h) hp
    have hkle : 2 ^ Nat.log 2 p ≤ p := Nat.pow_log_le_self 2 hp0
    have hklt : p < 2 ^ (Nat.log 2 p + 1) := Nat.lt_pow_succ_log_self (by norm_num) p
    refine ⟨Nat.log 2 p, ⟨?_, ?_⟩, ⟨hkle, hklt⟩, hp⟩
    · by_contra hc
      push_neg at hc
      have : p < 2 ^ k0 := lt_of_lt_of_le hklt (Nat.pow_le_pow_right (by norm_num) (by omega))
      omega
    · by_contra hc
      push_neg at hc
      have : 2 ^ (3 * k0 + 1) ≤ p :=
        le_trans (Nat.pow_le_pow_right (by norm_num) (by omega)) hkle
      omega

/-- **Dyadic Mertens cumulative lower bound** (axiom-free).  For all large `k0`, the
reciprocal sum of the primes in `[2^{k0}, 2^{3k0+1})` is at least `21/20` (the
true limit is `log 3 ≈ 1.0986`).  Proved in `NoAxiomMertensBlock` from the
elementary Mertens bounds `log n − 3 ≤ ∑_{p≤n} log p/p ≤ log n + log 4`
(Legendre's formula, Stirling's lower bound, `primorial ≤ 4ⁿ`), applied on
exponent blocks of width `10⁴` and telescoped through `log`. -/
theorem dyadic_mertens_cumulative :
    ∃ k1 : ℕ, 5 ≤ k1 ∧ ∀ k0 : ℕ, k1 ≤ k0 →
      (21 : ℝ) / 20 ≤
        ∑ p ∈ (Finset.Icc k0 (3 * k0)).biUnion dyadicBlock, (1 : ℝ) / (p : ℝ) := by
  exact dyadic_mertens_cumulative_noAxiom

end GlobalControl

end
