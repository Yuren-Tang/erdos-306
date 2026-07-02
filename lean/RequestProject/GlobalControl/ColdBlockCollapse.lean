import RequestProject.GlobalControl.LocalizationData

/-!
# Cold-block collapse

At a sufficiently small forcing constant, every cold block has no exceptional primes; the local labels therefore propagate globally.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## Cold-block collapse -/

/- **Bundled cold constants + the substantive `cold_no_exceptions` step.**

Produces the cold constants `c2,e0,X0` (a refinement of those produced by
`boundary_penalty_per_k`, with `c2` shrunk to be explicitly small), together with:
* the per-cold-block facts (small exception set, sharp label bound, conformity);
* the boundary penalty floor (`Pifloor ≤ Xen`);
* **`cold_no_exceptions`**: in the no-hot regime every cold block has an empty
  exception set.

The first two components are derived from `boundary_penalty_per_k` by
monotonicity in `c2`.  The third is the no-exception input,
proved in `cold_no_exceptions_core`. -/
/-- Monotonicity of the forcing floor in its constant: a smaller `c2` gives a
smaller `Rw`. -/
private lemma Rw_le_of_c2_le {c c' : ℝ} (h : c ≤ c') (k : ℕ) : Rw c k ≤ Rw c' k := by
  have hlog : 0 ≤ Real.log ((2:ℝ) ^ k) :=
    Real.log_nonneg (one_le_pow₀ (by norm_num : (1:ℝ) ≤ 2))
  have ht : 0 ≤ (2:ℝ) ^ k / (Real.log (2 ^ k)) ^ 3 :=
    div_nonneg (by positivity) (pow_nonneg hlog 3)
  unfold Rw
  rw [mul_div_assoc, mul_div_assoc]
  exact mul_le_mul_of_nonneg_right h ht

/-- A block that is cold for `c'` is cold for any smaller `c ≤ c'`. -/
private lemma not_isHot_mono {c c' : ℝ} (h : c ≤ c') (BS : BlockSystem)
    (a : GlobalAssignment BS) (k : ℕ) (hni : ¬ isHot BS c a k) : ¬ isHot BS c' a k := by
  simp only [isHot, not_le] at *
  exact lt_of_lt_of_le hni (Rw_le_of_c2_le h k)

/-
**`cold_no_exceptions` core.**  With an *explicitly small* forcing constant
`c2 ≤ 1/2^21`, a cold block (`¬ isHot`) with a bounded exception set and a sharp
label bound has an *empty* exception set.  Proof: by `exception_count_bound` the
exception count is `≤ 2^15·R·X²/((1-ρ)N³)` with `R = blockEnergy < Rw c2 k`; the
density `N ≥ X/(2 log X)` and `c2 ≤ 1/2^21` make this `< 1`, hence `0`.
-/
private lemma cold_no_exceptions_core (c2 e0 : ℝ) (hc2 : 0 < c2) (hc2small : c2 ≤ 1 / 2 ^ 21)
    (he0 : 0 < e0) :
    ∃ X0 : ℝ, 0 < X0 ∧ ∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
      BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k → ¬ isHot BS c2 a k →
      ((excSet BS a k).card : ℝ) ≤ e0 →
      |(coldLabel BS a k : ℝ)| ≤ ((BS.P k).card : ℝ) * ((2:ℝ) ^ k) / 64 →
      excSet BS a k = ∅ := by
  obtain ⟨ X0r, hX0r_pos, hX0r ⟩ := GlobalControl.block_energy_threshold_eventually_large 1 c2 hc2 ; obtain ⟨ X0d, hX0d_pos, hX0d ⟩ := RequestProject.eventually_const_mul_log_le_nat ( 8 * e0 + 64 ) ; use max 16 ( max X0r X0d ) ; norm_num at *;
  intro BS a k hk0 hkK hk16 hkX0r hkX0d hnot_hot hexc hlabel
  have hblock : 4 ≤ k := by
    exact le_of_not_gt fun h => by interval_cases k <;> norm_num at hk16;
  have hX : 16 ≤ 2 ^ k := by
    exact_mod_cast hk16
  have hXr : 1 ≤ k := by
    linarith
  have hXd : X0d ≤ (2 ^ k : ℝ) := by
    exact_mod_cast hkX0d
  have hX0r' : X0r ≤ (2 ^ k : ℝ) := by
    exact_mod_cast hkX0r
  have hR : 1 ≤ Rw c2 k := by
    exact hX0r k hXr hX0r'
  have hclass : (1 - 1 / 4 : ℝ) * (BS.P k).card ≤ (classCount BS a k (coldLabel BS a k) : ℝ) := by
    have hclass : (classCount BS a k (coldLabel BS a k) : ℝ) = (BS.P k).card - (excSet BS a k).card := by
      rw [ ← conform_card_eq BS a k ( Finset.mem_Icc.mpr ⟨ hk0, hkK ⟩ ), Finset.card_sdiff ];
      rw [ Finset.inter_eq_left.mpr ( excSet_subset BS a k ), Nat.cast_sub ( Finset.card_le_card ( excSet_subset BS a k ) ) ]
    generalize_proofs at *;
    have := BS.hdensity k hk0 hkK; norm_num at *; (
    have := hX0d ( 2 ^ k ) ( by simpa using hXd ) ; norm_num at * ; ( rw [ div_le_iff₀ ] at * <;> try positivity ) ;
    nlinarith [ show ( 0 : ℝ ) < k * Real.log 2 by positivity ]);
  generalize_proofs at *;
  have hN : (BS.P k).card ≥ (2 ^ k : ℝ) / (2 * Real.log (2 ^ k)) := by
    exact BS.hdensity k hk0 hkK
  have hN32 : 32 ≤ (BS.P k).card := by
    have := hX0d ( 2 ^ k ) ( by exact_mod_cast hXd ) ; norm_num at *;
    rw [ div_le_iff₀ ( by positivity ) ] at hN;
    exact_mod_cast ( by nlinarith [ show ( 0 :ℝ ) < k * Real.log 2 by positivity ] : ( 32 :ℝ ) ≤ # ( BS.P k ) )
  have hNpos : 0 < (BS.P k).card := by
    linarith
  have hN_ge_4e0 : 4 * e0 ≤ (BS.P k).card := by
    have := hX0d ( 2 ^ k ) ( by simpa using hXd ) ; norm_num at *;
    rw [ div_le_iff₀ ( by positivity ) ] at hN ; nlinarith [ Real.log_pos one_lt_two, show ( k : ℝ ) ≥ 4 by norm_cast, show ( 2 : ℝ ) ^ k > 0 by positivity ] ;
  generalize_proofs at *;
  have hmsmall : |(coldLabel BS a k : ℝ)| ≤ (BS.P k).card * (2 ^ k : ℝ) / 16 := by
    exact hlabel.trans ( by gcongr ; norm_num )
  generalize_proofs at *;
  have hcount : (excSet BS a k).card ≤ 2 ^ 15 * Rw c2 k * (2 ^ k : ℝ) ^ 2 / ((1 - 1 / 4) * (BS.P k).card ^ 3) := by
    have hQ : QP (BS.P k) (restrict BS a k) ≤ Rw c2 k := by
      exact le_of_not_ge fun h => hnot_hot <| by unfold isHot; exact h;
    generalize_proofs at *;
    have := LocalEnergy.dominant_exception_count_bound ( 2 ^ k ) ( by linarith ) ( BS.P k ) ( by
      exact fun p hp => ⟨ BS.hprime k p hp, by linarith [ BS.hwindow k p hp ], by linarith [ BS.hwindow k p hp, show 2 ^ ( k + 1 ) = 2 * 2 ^ k by ring ] ⟩ ) ( by linarith ) ( 1 / 4 ) ( by linarith ) ( by linarith ) ( restrict BS a k ) ( coldLabel BS a k ) ( Rw c2 k ) ( by linarith ) ( by
      exact hQ ) ( by
      exact_mod_cast hmsmall ) ( by
      norm_num at hclass ⊢
      simpa only [classCount] using hclass )
    generalize_proofs at *;
    convert this using 1 ; norm_num [ excSet_card_eq ];
    · convert excSet_card_eq BS a k ( Finset.mem_Icc.mpr ⟨ hk0, hkK ⟩ ) using 1;
    · norm_cast
  generalize_proofs at *;
  -- Substitute the bounds into the inequality.
  have h_subst : (excSet BS a k).card ≤ 2 ^ 15 * (c2 * (2 ^ k : ℝ) / (Real.log (2 ^ k)) ^ 3) * (2 ^ k : ℝ) ^ 2 / ((1 - 1 / 4) * ((2 ^ k : ℝ) / (2 * Real.log (2 ^ k))) ^ 3) := by
    refine le_trans hcount ?_;
    gcongr;
    · exact mul_pos ( by norm_num ) ( pow_pos ( div_pos ( by positivity ) ( mul_pos zero_lt_two ( Real.log_pos ( by norm_cast; linarith ) ) ) ) _ );
    · exact le_rfl;
    · exact div_nonneg ( by positivity ) ( mul_nonneg zero_le_two ( Real.log_nonneg ( by norm_cast; linarith ) ) )
  generalize_proofs at *;
  -- Simplify the expression to show that it is less than 1.
  have h_simplified : (excSet BS a k).card ≤ 2 ^ 20 * c2 / 3 := by
    convert h_subst using 1 ; ring_nf ; norm_num [ Real.log_pow ] ; ring_nf ; norm_num [ show ( 2 : ℝ ) ^ k ≠ 0 by positivity, show ( Real.log 2 : ℝ ) ≠ 0 by positivity ] ;
    norm_num [ show k ≠ 0 by linarith, show ( 2 : ℝ ) ^ ( k * 3 ) ≠ 0 by positivity ];
    norm_num [ mul_assoc, ← mul_pow ]
  generalize_proofs at *;
  exact Finset.card_eq_zero.mp ( Nat.eq_zero_of_le_zero ( Nat.le_of_lt_succ ( by rw [ ← @Nat.cast_lt ℝ ] ; push_cast; linarith ) ) )

lemma cold_no_exceptions :
    ∃ (c2 e0 X0 : ℝ), 0 < c2 ∧ 0 < e0 ∧ 0 < X0 ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k → ¬ isHot BS c2 a k →
        ((excSet BS a k).card : ℝ) ≤ e0 ∧
        |(coldLabel BS a k : ℝ)| ≤ ((BS.P k).card : ℝ) * ((2:ℝ) ^ k) / 64 ∧
        (∀ p ∈ BS.P k \ excSet BS a k,
          (toPlain BS a p : ZMod p) = ((coldLabel BS a k : ℤ) : ZMod p))) ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k < BS.K → X0 ≤ (2:ℝ) ^ k → k ∈ boundarySet BS c2 a →
        Pifloor BS e0 k ≤ Xen BS a k) ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k → ¬ isHot BS c2 a k →
        excSet BS a k = ∅) := by
  obtain ⟨c2b, e0, X0b, hc2b, he0, hX0b, hcf, hbd⟩ := boundary_penalty_per_k
  obtain ⟨X0c, hX0c, hcore⟩ :=
    cold_no_exceptions_core (min c2b (1 / 2 ^ 21)) e0
      (lt_min hc2b (by positivity)) (min_le_right _ _) he0
  set c2 := min c2b (1 / 2 ^ 21) with hc2def
  have hc2 : 0 < c2 := lt_min hc2b (by positivity)
  have hle : c2 ≤ c2b := min_le_left _ _
  refine ⟨c2, e0, max X0b X0c, hc2, he0, by positivity, ?_, ?_, ?_⟩
  · -- cold facts: reduce to `c2b`
    intro BS a k hk0 hkK hX hcold
    exact hcf BS a k hk0 hkK (le_trans (le_max_left _ _) hX)
      (not_isHot_mono hle BS a k hcold)
  · -- boundary penalty: reduce to `c2b`
    intro BS a k hk0 hkK hX hbdry
    have hbdry' : k ∈ boundarySet BS c2b a := by
      rw [boundarySet, Finset.mem_filter] at hbdry ⊢
      exact ⟨hbdry.1, not_isHot_mono hle BS a k hbdry.2.1,
        not_isHot_mono hle BS a (k + 1) hbdry.2.2.1, hbdry.2.2.2⟩
    exact hbd BS a k hk0 hkK (le_trans (le_max_left _ _) hX) hbdry'
  · -- no exceptions: use the explicitly-small-`c2` core
    intro BS a k hk0 hkK hX hcold
    have hcoldb := not_isHot_mono hle BS a k hcold
    obtain ⟨hexc, hlabel, _⟩ := hcf BS a k hk0 hkK (le_trans (le_max_left _ _) hX) hcoldb
    exact hcore BS a k hk0 hkK (le_trans (le_max_right _ _) hX) hcold hexc hlabel

end GlobalControl

end
