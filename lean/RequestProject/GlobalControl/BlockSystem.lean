import Mathlib.Analysis.SpecialFunctions.Log.Basic

open Finset Classical

noncomputable section

namespace GlobalControl

/-- A finite system of prime blocks indexed by consecutive dyadic scales. -/
structure BlockSystem where
  k0 : ℕ
  K : ℕ
  hk : k0 ≤ K
  hk0 : 1 ≤ k0
  P : ℕ → Finset ℕ
  hprime : ∀ k, ∀ p ∈ P k, Nat.Prime p
  hwindow : ∀ k, ∀ p ∈ P k, 2 ^ k ≤ p ∧ p < 2 ^ (k + 1)
  hdensity : ∀ k, k0 ≤ k → k ≤ K →
    (2 ^ k : ℝ) / (2 * Real.log (2 ^ k)) ≤ (P k).card

/-- A scale estimate of the form `2 c log(2^k) ≤ 2^k` turns the block-density
assumption into the cardinality bound `c ≤ |P_k|`. -/
lemma BlockSystem.card_ge_of_two_mul_log_le (BS : BlockSystem) (k : ℕ)
    (hk0 : BS.k0 ≤ k) (hkK : k ≤ BS.K) (c : ℝ)
    (hscale : 2 * c * Real.log ((2 : ℝ) ^ k) ≤ (2 : ℝ) ^ k) :
    c ≤ (BS.P k).card := by
  have hk : 0 < k := lt_of_lt_of_le (Nat.zero_lt_of_lt BS.hk0) hk0
  have hlog : 0 < Real.log ((2 : ℝ) ^ k) :=
    Real.log_pos (one_lt_pow₀ one_lt_two hk.ne')
  refine le_trans ?_ (BS.hdensity k hk0 hkK)
  rw [le_div_iff₀ (mul_pos two_pos hlog)]
  nlinarith

/-- The finite set of primes occurring in a block system. -/
def blockSupport (BS : BlockSystem) : Finset ℕ :=
  (Finset.Icc BS.k0 BS.K).biUnion (fun k => BS.P k)

/-- A residue assignment on precisely the primes occurring in the system. -/
abbrev GlobalAssignment (BS : BlockSystem) :=
  (p : {p : ℕ // p ∈ blockSupport BS}) → ZMod p.1

/-- Every prime in the support inherits primality from its block. -/
lemma blockSupport_prime (BS : BlockSystem) {p : ℕ} (hp : p ∈ blockSupport BS) :
    Nat.Prime p := by
  rw [blockSupport, Finset.mem_biUnion] at hp
  obtain ⟨k, _, hpk⟩ := hp
  exact BS.hprime k p hpk

instance instNeZeroBlockSupport (BS : BlockSystem)
    (p : {p : ℕ // p ∈ blockSupport BS}) : NeZero p.1 :=
  ⟨(blockSupport_prime BS p.2).ne_zero⟩

/-- Number of dyadic blocks in the system. -/
def numBlocks (BS : BlockSystem) : ℕ := BS.K + 1 - BS.k0

/-- The scale range is long enough to carry the construction and grows at most
linearly with its initial scale. -/
def admissibleGlobalRange (BS : BlockSystem) : Prop :=
  2 * BS.k0 ≤ BS.K ∧ BS.K ≤ 3 * BS.k0

end GlobalControl

end
