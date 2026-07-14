import RequestProject.Construction.BlockPrimePool
import RequestProject.Construction.BlockSupportCompatibility
import RequestProject.GlobalControl.BlockSystem

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Dyadic block-system and prime selection

The concrete construction needs a sufficiently large dyadic block system and
a prescribed finite number of primes from one of its blocks. These choices
depend only on the abstract block-system interface and dyadic prime density.
-/

/-- A dyadic block system with arbitrarily large bottom scale, admissible
global range, and the full bottom block of primes in its support. -/
theorem exists_dyadic_blockSystem_with_bottom_block (k0min : ℕ) :
    ∃ BS : BlockSystem,
      k0min ≤ BS.k0 ∧ admissibleGlobalRange BS ∧
        blockPrimes BS.k0 ⊆ blockSupport BS := by
  set k0 : ℕ := max k0min 5 with hk0def
  have h5 : 5 ≤ k0 := le_max_right _ _
  refine ⟨{
    k0 := k0
    K := 3 * k0
    hk := by omega
    hk0 := by omega
    P := dyadicBlock
    hprime := by
      intro k p hp
      exact (Finset.mem_filter.mp hp).2
    hwindow := by
      intro k p hp
      have := (Finset.mem_filter.mp hp).1
      rw [Finset.mem_Ico] at this
      exact this
    hdensity := by
      intro k hk1 _hk2
      exact dyadic_prime_density k (le_trans h5 hk1) }, ?_, ?_, ?_⟩
  · exact le_max_left _ _
  · dsimp only [admissibleGlobalRange]
    omega
  · intro p hp
    simpa [blockPrimes, blockSupport] using hp

/-- A dyadic block contains any prescribed finite number of primes once its
prime-density lower bound exceeds that number. -/
lemma exists_primes_in_dyadicBlock (k : ℕ) (hk : 5 ≤ k) (G : ℕ)
    (hG : (G : ℝ) ≤ (2 : ℝ) ^ k / (2 * Real.log ((2 : ℝ) ^ k))) :
    ∃ S : Finset ℕ, S ⊆ dyadicBlock k ∧ S.card = G ∧
      (∀ s ∈ S, Nat.Prime s) ∧ (∀ s ∈ S, 2 ^ k ≤ s) := by
  have hcard : G ≤ (dyadicBlock k).card := by
    have h := dyadic_prime_density k hk
    exact_mod_cast le_trans hG h
  obtain ⟨S, hSsub, hScard⟩ := Finset.exists_subset_card_eq hcard
  refine ⟨S, hSsub, hScard, fun s hs => ?_, fun s hs => ?_⟩ <;>
    · have hs' := hSsub hs
      rw [dyadicBlock, Finset.mem_filter, Finset.mem_Ico] at hs'
      first | exact hs'.2 | exact hs'.1.1

/-- There is a sufficiently large dyadic block system whose support contains
the bottom block and the block at twice the bottom scale, while avoiding every
prime factor of `b`. -/
lemma exists_dyadic_blockSystem (b : ℕ) (hb : 3 ≤ b) (k0min : ℕ) :
    ∃ BS : BlockSystem,
      k0min ≤ BS.k0 ∧ 5 ≤ BS.k0 ∧ admissibleGlobalRange BS ∧
      blockPrimes BS.k0 ⊆ blockSupport BS ∧
      BlockSupportCoprimeWith BS b ∧
      (∀ r ∈ b.primeFactors, Nat.Prime r) ∧
      (∀ r ∈ b.primeFactors, r ∣ b) ∧
      CoversPrimeDivisors b.primeFactors b ∧
      (∀ r ∈ b.primeFactors, r ∉ blockSupport BS) ∧
      2 * BS.k0 ≤ BS.K ∧
      dyadicBlock (2 * BS.k0) ⊆ blockSupport BS := by
  obtain ⟨BS, hk0, hadm, hsub⟩ :=
    exists_dyadic_blockSystem_with_bottom_block (max (max k0min 5) (b + 1))
  refine' ⟨BS, _, _, hadm, hsub, _, _, _, _⟩ <;> norm_num at *
  all_goals norm_num [BlockSupportCoprimeWith, CoversPrimeDivisors]
  any_goals tauto
  · intro s hs
    exact Nat.Coprime.symm <| Nat.Coprime.gcd_eq_one <| Nat.Coprime.symm <|
      Nat.Coprime.gcd_eq_one <| Nat.Coprime.coprime_dvd_right
        (show b ∣ b from dvd_rfl) <| Nat.Coprime.gcd_eq_one <|
          Nat.Prime.coprime_iff_not_dvd
            (show Nat.Prime s from by grind +suggestions) |>.2 <| by
              have hslow : ∀ s ∈ blockSupport BS, b < s := by
                intro s hs
                simp [blockSupport] at hs
                obtain ⟨k, ⟨hkk0, _⟩, hsk⟩ := hs
                have h2k : 2 ^ k ≤ s := (BS.hwindow k s hsk).1
                have hk0le : 2 ^ BS.k0 ≤ s :=
                  le_trans (Nat.pow_le_pow_right (by norm_num) hkk0) h2k
                have hbk : b + 1 ≤ BS.k0 := by linarith
                have hk0lt : BS.k0 < 2 ^ BS.k0 := Nat.lt_two_pow_self
                omega
              exact Nat.not_dvd_of_pos_of_lt (by omega) (hslow s hs)
  · refine' ⟨fun r hr hr' => ⟨hr, hr', by linarith⟩, _, _, _⟩
    · intro r hr hrdvd hb0 hrBS
      have hrle : r ≤ b := Nat.le_of_dvd (by omega) hrdvd
      have hslow : ∀ s ∈ blockSupport BS, b < s := by
        intro s hs
        simp only [blockSupport, mem_biUnion, mem_Icc] at hs
        obtain ⟨k, ⟨hkk0, _⟩, hsk⟩ := hs
        have h2k : 2 ^ k ≤ s := (BS.hwindow k s hsk).1
        have hk0le : 2 ^ BS.k0 ≤ s :=
          le_trans (Nat.pow_le_pow_right (by norm_num) hkk0) h2k
        have hk0lt : BS.k0 < 2 ^ BS.k0 := Nat.lt_two_pow_self
        omega
      have := hslow r hrBS
      linarith
    · linarith [hadm.1]
    · intro p hp
      simp_all +decide [blockPrimes, blockSupport]
      grind

end CircleMethod

end
