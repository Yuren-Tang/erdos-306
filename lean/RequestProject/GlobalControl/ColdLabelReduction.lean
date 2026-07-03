import RequestProject.GlobalControl.ColdDominance

/-!
# Reduction of cold labels

Cold conforming fibers with labels outside the fixed-label window are either
empty before CRT wrapping or reduce to a fiber carrying a uniformly small
integer label after wrapping.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-
Block cardinality lower bound: past a uniform `2^k` threshold the block
    density forces `8 ≤ (BS.P k).card`.  (`2^k/(2 log 2^k) → ∞`.)
-/
private lemma block_card_lower :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
        8 ≤ (BS.P k).card := by
  -- Choose X0 such that for all k, if 2^k ≥ X0, then (2:ℝ)^k/(2*Real.log (2^k)) ≥ 8.
  obtain ⟨K0, hK0⟩ : ∃ K0 : ℕ, ∀ k ≥ K0, (2 : ℝ) ^ k / (2 * Real.log (2 ^ k)) ≥ 8 := by
    have h_tendsto : Filter.Tendsto (fun k : ℕ => (2 : ℝ) ^ k / (2 * Real.log (2 ^ k))) Filter.atTop Filter.atTop := by
      have h_log : Filter.Tendsto (fun k : ℕ => (2 : ℝ) ^ k / k) Filter.atTop Filter.atTop := by
        -- We can use the fact that $2^k / k$ grows exponentially.
        have h_exp_growth : Filter.Tendsto (fun k : ℕ => (Real.exp (k * Real.log 2)) / (k : ℝ)) Filter.atTop Filter.atTop := by
          have h_exp_growth : Filter.Tendsto (fun x : ℝ => Real.exp x / x) Filter.atTop Filter.atTop := by
            simpa using Real.tendsto_exp_div_pow_atTop 1;
          have := h_exp_growth.comp ( tendsto_natCast_atTop_atTop.atTop_mul_const ( Real.log_pos one_lt_two ) );
          convert this.const_mul_atTop ( show 0 < Real.log 2 by positivity ) using 2 ; norm_num [ div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm ];
        simpa [ Real.exp_nat_mul, Real.exp_log ] using h_exp_growth
      convert h_log.const_mul_atTop ( show 0 < ( 1 / ( 2 * Real.log 2 ) ) by positivity ) using 2 ; norm_num [ Real.log_pow ] ; ring;
    exact Filter.eventually_atTop.mp ( h_tendsto.eventually_ge_atTop 8 );
  refine' ⟨ 2 ^ K0, by positivity, fun BS k hk₁ hk₂ hk₃ => _ ⟩;
  exact_mod_cast le_trans ( hK0 k ( Nat.le_of_not_lt fun hk₄ => not_le_of_gt ( pow_lt_pow_right₀ ( by norm_num ) hk₄ ) hk₃ ) ) ( BS.hdensity k hk₁ hk₂ )

/-
**Non-wrapped huge-label cold count (empty fiber).**  When the label is
    above `fixed_label_block_count`'s window (`N·2^k/16 < |m|`) but below the CRT wrap
    threshold (`|m| ≤ (2^k)²/2`), in the low-energy regime (`n+1 < Rw c2 k`) the
    fiber is EMPTY: by `dominant_label_bound` any `(3/4)`-conforming `b` of energy
    `≤ n+1` would force `|m| ≤ (20/3)√(n+1)/σ_k`, and combined with `block_deviation_lower_bound`
    and the density `N ≥ 2^k/(2 log 2^k)` this contradicts `N·2^k/16 < |m|` once
    `2^k` is large (`2^k` beats every power of `log 2^k`).
-/
lemma cold_count_nonwrap (c2 : ℝ) (hc2 : 0 < c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
        ∀ (m : ℤ) (n : ℕ),
          (n : ℝ) + 1 < Rw c2 k →
          ((BS.P k).card : ℝ) * (2 ^ k) / 16 < |((m : ℤ) : ℝ)| →
          |((m : ℤ) : ℝ)| ≤ ((2:ℝ) ^ k) ^ 2 / 2 →
          (Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
              QP (BS.P k) b ≤ (n : ℝ) + 1 ∧
              (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
                (((BS.P k).attach.filter
                  (fun p => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ))).card = 0 := by
  -- Let's choose any $X0$ such that $X0 > 0$.
  obtain ⟨X0, hX0⟩ : ∃ X0 : ℝ, 0 < X0 ∧
    ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
      ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1], (∀ p ∈ P, Nat.Prime p ∧ (2:ℕ) ^ k ≤ p ∧ p ≤ 2 * (2:ℕ) ^ k) → (P.card : ℝ) ≥ (2:ℝ) ^ k / (2 * Real.log (2 ^ k)) →
      ∀ (a : BlockAssignment P) (m : ℤ) (R : ℝ), 1 ≤ R →
        |m| ≤ (2 ^ k : ℤ) ^ 2 / 2 →
        (1 - (1/4:ℝ)) * (P.card : ℝ) ≤ ((P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) →
          QP P a ≤ R → R ≤ c2 * (2:ℝ) ^ k / (Real.log (2 ^ k)) ^ 3 →
            |(m : ℝ)| ≤ (P.card : ℝ) * (2 ^ k) / 16 := by
              obtain ⟨ X0, hX0_pos, hX0 ⟩ := GlobalControl.cold_label_bound_div_64 c2 hc2;
              use Nat.ceil X0;
              refine' ⟨ Nat.cast_pos.mpr ( Nat.ceil_pos.mpr hX0_pos ), _ ⟩;
              intro BS k hk1 hk2 hk3 P _ hP hP' a m R hR hm hR' hR''; specialize hX0 ( 2 ^ k ) ( by exact le_trans ( Nat.le_ceil _ ) ( mod_cast hk3 ) ) P; simp_all +decide [ Nat.cast_pow ] ;
              exact fun h => le_trans ( hX0 a m R hR hm hR' hR'' h ) ( by gcongr ; norm_num );
  obtain ⟨Xb, hXb⟩ : ∃ Xb : ℝ, 0 < Xb ∧
    ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → Xb ≤ (2:ℝ) ^ k →
      8 ≤ (BS.P k).card := by
        convert GlobalControl.block_card_lower;
  refine' ⟨ Max.max X0 ( Max.max Xb 16 ), _, _ ⟩ <;> norm_num;
  intro BS k hk1 hk2 hk3 hk4 hk5 m n hn hm₁ hm₂ x hx;
  contrapose! hX0;
  intro hX0_pos
  use BS, k, hk1, hk2, hk3, BS.P k, by
    exact fun p => ⟨ Nat.Prime.ne_zero ( BS.hprime k p.1 p.2 ) ⟩, by
    exact fun p hp => ⟨ BS.hprime k p hp, by have := BS.hwindow k p hp; ring_nf at *; linarith, by have := BS.hwindow k p hp; ring_nf at *; linarith ⟩, by
    exact BS.hdensity k hk1 hk2, x, m, n + 1, by
    linarith, by
    exact Int.le_ediv_of_mul_le ( by norm_num ) ( by rw [ ← @Int.cast_le ℝ ] ; push_cast; linarith ), by
    linarith, by
    convert hx using 1, by
    exact hn.le

/-
**Per-assignment small-label extraction with residue agreement.**
    For a cold block-assignment `b` conforming to a (possibly wrapped) label `m`
    on `≥ 3/4·N` primes, Theorem B yields a dominant label `mb` with
    `|mb| ≤ N·2^k/16`, conforming on `≥ 3/4·N` primes, and agreeing with `m`
    modulo `≥ 3/4·N - e0` primes (`e0` absolute).
-/
private lemma cold_small_label_agree (c2 : ℝ) (hc2 : 0 < c2) (hdomB : ColdDominance c2) :
    ∃ (e0 X0 : ℝ), 0 < e0 ∧ 0 < X0 ∧
      ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
        ∀ (m : ℤ) (n : ℕ), (n : ℝ) + 1 < Rw c2 k →
        ∀ (b : BlockAssignment (BS.P k)),
          QP (BS.P k) b ≤ (n : ℝ) + 1 →
          (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
            (((BS.P k).attach.filter (fun p => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) →
          ∃ mb : ℤ,
            |(mb : ℝ)| ≤ ((BS.P k).card : ℝ) * (2 ^ k) / 16 ∧
            (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
              (((BS.P k).attach.filter (fun p => b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) ∧
            (3/4 : ℝ) * ((BS.P k).card : ℝ) - e0 ≤
              (((BS.P k).attach.filter
                (fun (p : {x // x ∈ BS.P k}) =>
                  ((m : ℤ) : ZMod (p : ℕ)) = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) := by
  obtain ⟨X1, hX1pos, hdom⟩ := hdomB;
  obtain ⟨X0s, hX0s0, Hsize⟩ := LocalEnergy.cold_label_bound (1/4) (by norm_num) (by norm_num) c2 hc2
  obtain ⟨e0, X0e, he0pos, hX0e0, Hexc⟩ := LocalEnergy.cold_exception_count_bound (1/4) (by norm_num) (by norm_num) c2 hc2;
  refine' ⟨ e0, Max.max X1 ( Max.max X0s ( Max.max X0e 16 ) ), he0pos, _, _ ⟩ <;> norm_num;
  intro BS k hk1 hk2 hk3 hk4 hk5 hk6 m n hn b hQ hconf
  obtain ⟨mb, hmb_abs, hmb_conf⟩ := hdom BS k hk1 hk2 hk3 b ((n:ℝ)+1) hQ hn
  refine' ⟨mb, _, _, _⟩;
  · convert Hsize ( 2 ^ k ) ( mod_cast hk4 ) ( BS.P k ) _ _ b mb ( n + 1 ) _ _ _ _ using 1 <;> norm_num;
    any_goals assumption;
    · exact Or.inl <| le_of_lt <| by simpa [ Rw ] using hn;
    · exact fun p hp => ⟨ BS.hprime k p hp, BS.hwindow k p hp |>.1, by linarith [ BS.hwindow k p hp |>.2, pow_succ' ( 2 : ℕ ) k ] ⟩;
    · convert BS.hdensity k hk1 hk2 using 1 ; norm_num [ Real.log_pow ];
    · linarith;
  · linarith;
  · have hmb_small : |(mb : ℝ)| ≤ ((BS.P k).card : ℝ) * (2 ^ k) / 16 := by
      convert Hsize ( 2 ^ k ) _ ( BS.P k ) _ _ b mb ( n + 1 ) _ _ _ _ using 1 <;> norm_num;
      any_goals assumption;
      · exact Or.inl <| le_of_lt <| by simpa [ Rw ] using hn;
      · exact fun p hp => ⟨ BS.hprime k p hp, by linarith [ BS.hwindow k p hp ], by linarith [ BS.hwindow k p hp, pow_succ' ( 2 : ℕ ) k ] ⟩;
      · convert BS.hdensity k hk1 hk2 using 1 ; ring_nf;
        norm_num [ Real.log_pow ] ; ring;
      · grind +revert;
    have hmb_small : ((Finset.univ.filter (fun q : {x // x ∈ BS.P k} => b q ≠ ((mb : ℤ) : ZMod (q : ℕ)))).card : ℝ) ≤ e0 := by
      convert Hexc ( 2 ^ k ) ( mod_cast hk5 ) ( BS.P k ) _ _ b mb ( n + 1 ) _ _ _ _ _ using 1 <;> norm_num;
      any_goals linarith;
      · exact fun p hp => ⟨ BS.hprime k p hp, by linarith [ BS.hwindow k p hp ], by linarith [ BS.hwindow k p hp, pow_succ' ( 2 : ℕ ) k ] ⟩;
      · have := BS.hdensity k hk1 hk2;
        simpa [ Real.log_pow ] using this;
      · simpa [Rw, Real.log_pow] using hn.le
    have hmb_small : ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) ≥ ((BS.P k).card : ℝ) - e0 := by
      have hmb_small : ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) + ((Finset.univ.filter (fun q : {x // x ∈ BS.P k} => b q ≠ ((mb : ℤ) : ZMod (q : ℕ)))).card : ℝ) = (BS.P k).card := by
        rw_mod_cast [ Finset.card_filter_add_card_filter_not ];
        simp +decide;
      linarith;
    have hmb_small : ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((m : ℤ) : ZMod (p : ℕ)) ∧ b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) ≥ ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) + ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) - ((BS.P k).card : ℝ) := by
      have hmb_small : ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((m : ℤ) : ZMod (p : ℕ)) ∨ b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) ≤ ((BS.P k).card : ℝ) := by
        exact_mod_cast le_trans ( Finset.card_le_univ _ ) ( by norm_num );
      have hmb_small : ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((m : ℤ) : ZMod (p : ℕ)) ∨ b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) = ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) + ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) - ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((m : ℤ) : ZMod (p : ℕ)) ∧ b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) := by
        rw [ ← Nat.cast_add, ← Finset.card_union_add_card_inter ];
        simp +decide [ Finset.filter_or, Finset.filter_and ];
      linarith;
    have hmb_small : ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => b p = ((m : ℤ) : ZMod (p : ℕ)) ∧ b p = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) ≤ ((Finset.univ.filter (fun p : {x // x ∈ BS.P k} => ((m : ℤ) : ZMod (p : ℕ)) = ((mb : ℤ) : ZMod (p : ℕ)))).card : ℝ) := by
      gcongr;
      exact fun h => h.1.symm.trans h.2;
    linarith!

/-- **Wrapped-label reduction.**
    In the low-energy wrapped regime, the assignments conforming to a large
    wrapped label `m` inject into the fixed-label fiber for one small label `M`.
    This is the Theorem-A-internal dominant-representative extraction and
    transport step; with it, `cold_count_wrap` is just `fixed_label_block_count`.  The cold
    dominance for arbitrary block assignments is supplied via `hdomB`. -/
lemma wrapped_count_le_small_fixed_label (c2 : ℝ) (hc2 : 0 < c2)
    (hdomB : ColdDominance c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
        ∀ (m : ℤ) (n : ℕ),
          (n : ℝ) + 1 < Rw c2 k →
          ((2:ℝ) ^ k) ^ 2 / 2 < |((m : ℤ) : ℝ)| →
          ∃ M : ℤ,
            |(M : ℝ)| ≤ ((BS.P k).card : ℝ) * (2 ^ k) / 16 ∧
            ((Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
              QP (BS.P k) b ≤ (n : ℝ) + 1 ∧
              (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
                (((BS.P k).attach.filter
                  (fun p => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ))).card : ℝ)
            ≤
            ((Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
              QP (BS.P k) b ≤ (n : ℝ) + 1 ∧
              (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
                (((BS.P k).attach.filter
                  (fun p => b p = ((M : ℤ) : ZMod (p : ℕ)))).card : ℝ))).card : ℝ) := by
  obtain ⟨e0, X0a, he0, hX0a, Hagree⟩ := cold_small_label_agree c2 hc2 hdomB
  obtain ⟨X0c, hX0c0, hlog⟩ := RequestProject.eventually_const_mul_log_le_nat (8 * e0 + 8)
  refine ⟨max X0a (max X0c 16), by positivity, fun BS k hk1 hk2 hk3 m n hn _hwrap => ?_⟩
  have hlogpos : 0 < Real.log ((2:ℝ) ^ k) := by
    apply Real.log_pos
    have : (16:ℝ) ≤ (2:ℝ) ^ k := le_trans (le_max_of_le_right (le_max_right _ _)) hk3
    linarith
  have hNbig : 4 * e0 + 4 ≤ ((BS.P k).card : ℝ) := by
    have hdens : (2:ℝ) ^ k / (2 * Real.log ((2:ℝ) ^ k)) ≤ ((BS.P k).card : ℝ) :=
      BS.hdensity k hk1 hk2
    have hL : (8 * e0 + 8) * Real.log ((2:ℝ) ^ k) ≤ (2:ℝ) ^ k := by
      have := hlog (2 ^ k) (by exact_mod_cast le_trans (le_max_of_le_right (le_max_left _ _)) hk3)
      simpa using this
    rw [div_le_iff₀ (by positivity)] at hdens
    nlinarith [hdens, hL, hlogpos]
  have hNX : ((BS.P k).card : ℤ) ≤ (2 : ℤ) ^ k := by exact_mod_cast GlobalControl.block_card_le BS k
  have hPwin : ∀ p ∈ BS.P k, Nat.Prime p ∧ 2 ^ k ≤ p ∧ p ≤ 2 * 2 ^ k := by
    intro p hp
    refine ⟨BS.hprime k p hp, (BS.hwindow k p hp).1, ?_⟩
    have h := (BS.hwindow k p hp).2
    have h2 : p < 2 * 2 ^ k := by rw [← pow_succ']; exact h
    omega
  classical
  by_cases hfe :
      (Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
        QP (BS.P k) b ≤ (n : ℝ) + 1 ∧
        (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
          (((BS.P k).attach.filter (fun p => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ))).card = 0
  · refine ⟨0, by simp only [Int.cast_zero, abs_zero]; positivity, ?_⟩
    rw [hfe, Nat.cast_zero]
    exact Nat.cast_nonneg _
  · obtain ⟨b0, hb0mem⟩ := Finset.card_pos.mp (Nat.pos_of_ne_zero hfe)
    rw [Finset.mem_filter] at hb0mem
    obtain ⟨M, hM_small, hM_conf, hM_agree⟩ :=
      Hagree BS k hk1 hk2 (le_trans (le_max_left _ _) hk3) m n hn b0 hb0mem.2.1 hb0mem.2.2
    refine ⟨M, hM_small, ?_⟩
    apply Nat.cast_le.mpr
    apply Finset.card_le_card
    intro b hb
    rw [Finset.mem_filter] at hb ⊢
    obtain ⟨mb, hmb_small, hmb_conf, hmb_agree⟩ :=
      Hagree BS k hk1 hk2 (le_trans (le_max_left _ _) hk3) m n hn b hb.2.1 hb.2.2
    set A : Finset {x // x ∈ BS.P k} :=
      (BS.P k).attach.filter (fun p => ((m : ℤ) : ZMod (p : ℕ)) = ((mb : ℤ) : ZMod (p : ℕ))) with hAdef
    set B : Finset {x // x ∈ BS.P k} :=
      (BS.P k).attach.filter (fun p => ((m : ℤ) : ZMod (p : ℕ)) = ((M : ℤ) : ZMod (p : ℕ))) with hBdef
    have hmbM : mb = M := by
      apply two_prime_label_eq (2 ^ k) (BS.P k) hPwin mb M (A ∩ B)
      · have hcards := Finset.card_union_add_card_inter A B
        have hsub : A ∪ B ⊆ (BS.P k).attach :=
          Finset.union_subset (Finset.filter_subset _ _) (Finset.filter_subset _ _)
        have hUle := Finset.card_le_card hsub
        rw [Finset.card_attach] at hUle
        have hcardsR : ((A ∪ B).card : ℝ) + ((A ∩ B).card : ℝ)
            = (A.card : ℝ) + (B.card : ℝ) := by exact_mod_cast hcards
        have hUleR : ((A ∪ B).card : ℝ) ≤ ((BS.P k).card : ℝ) := by exact_mod_cast hUle
        have hAc : (3/4 : ℝ) * ((BS.P k).card : ℝ) - e0 ≤ (A.card : ℝ) := by
          simpa only [hAdef] using hmb_agree
        have hBc : (3/4 : ℝ) * ((BS.P k).card : ℝ) - e0 ≤ (B.card : ℝ) := by
          simpa only [hBdef] using hM_agree
        rw [← Nat.cast_le (α := ℝ)]; push_cast
        nlinarith [hUleR, hcardsR, hAc, hBc, hNbig]
      · intro p hp
        rw [Finset.mem_inter, hAdef, hBdef, Finset.mem_filter, Finset.mem_filter] at hp
        exact hp.1.2.symm.trans hp.2.2
      · have hb1 : |(mb : ℝ) - (M : ℝ)| ≤ ((BS.P k).card : ℝ) * 2 ^ k / 8 := by
          have h1 := abs_le.mp hmb_small; have h2 := abs_le.mp hM_small
          rw [abs_le]; constructor <;> linarith [h1.1, h1.2, h2.1, h2.2]
        have hNle : ((BS.P k).card : ℝ) ≤ (2:ℝ) ^ k := by exact_mod_cast hNX
        have hb2 : |(mb : ℝ) - (M : ℝ)| < ((2:ℝ) ^ k) ^ 2 := by
          have hpos : (0:ℝ) < (2:ℝ) ^ k := by positivity
          nlinarith [hb1, hNle, hpos]
        have e1 : ((|mb - M| : ℤ) : ℝ) = |(mb : ℝ) - (M : ℝ)| := by
          rw [Int.cast_abs]; push_cast; ring_nf
        have e2 : (((2 ^ k : ℤ) ^ 2 : ℤ) : ℝ) = ((2:ℝ) ^ k) ^ 2 := by push_cast; ring
        have hcast : ((|mb - M| : ℤ) : ℝ) < (((2 ^ k : ℤ) ^ 2 : ℤ) : ℝ) := by
          rw [e1, e2]; exact hb2
        exact_mod_cast hcast
    refine ⟨Finset.mem_univ _, hb.2.1, ?_⟩
    rw [← hmbM]; exact hmb_conf

end GlobalControl

end

