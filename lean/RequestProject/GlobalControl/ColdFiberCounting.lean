import RequestProject.GlobalControl.ColdLabelReduction
import RequestProject.GlobalControl.Encoding.FixedLabelCount
import RequestProject.GlobalControl.LevelSetFiberBound

/-!
# Uniform cold-fiber counting

The small-label estimate and the wrapped-label reduction give a bound uniform
in the label. Multiplying these block estimates yields the global fiber bound.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- **Wrapped huge-label cold count.**
    For a label beyond the CRT wrap threshold (`(2^k)²/2 < |m|`), the per-block
    conforming count is still `≤ exp(2ε(n+1))`.  The actual wrapped-label work is
    isolated in `wrapped_count_le_small_fixed_label`; this lemma only applies
    `fixed_label_block_count` to the resulting small fixed label. -/
private lemma cold_count_wrap (eps : ℝ) (heps : 0 < eps) (_heps1 : eps < 1)
    (c2 : ℝ) (hc2 : 0 < c2) (hdomB : ColdDominance c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
        ∀ (m : ℤ) (n : ℕ),
          (n : ℝ) + 1 < Rw c2 k →
          ((2:ℝ) ^ k) ^ 2 / 2 < |((m : ℤ) : ℝ)| →
          ((Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
              QP (BS.P k) b ≤ (n : ℝ) + 1 ∧
              (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
                (((BS.P k).attach.filter
                  (fun p => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ))).card : ℝ)
            ≤ Real.exp (2 * eps * ((n : ℝ) + 1)) := by
  obtain ⟨Xr, hXr0, hReduce⟩ := wrapped_count_le_small_fixed_label c2 hc2 hdomB
  obtain ⟨Xc, hXc0, hCold⟩ := fixed_label_block_count (2 * eps) (by positivity)
  refine ⟨max Xr Xc, by positivity, ?_⟩
  intro BS k hk1 hk2 hk3 m n hn hwrap
  obtain ⟨M, hMsmall, hleM⟩ :=
    hReduce BS k hk1 hk2 (le_trans (le_max_left _ _) hk3) m n hn hwrap
  exact le_trans hleM
    (by
      convert hCold BS k hk1 hk2 (le_trans (le_max_right _ _) hk3) M hMsmall n using 1)

/-- **Huge-label cold count in the low-energy
    regime.**  For a cold block (`n+1 < Rw c2 k`) and a label `m` LARGER than
    `fixed_label_block_count`'s window (`|m| > N·2^k/16`), the count of `(3/4)`-conforming
    block-assignments of energy `≤ n+1` is `≤ exp(2ε(n+1))`.  Case split on the CRT
    wrap threshold `(2^k)²/2`: non-wrapped via `cold_count_nonwrap` (empty fiber),
    wrapped via `cold_count_wrap`. -/
private lemma cold_count_huge_label (eps : ℝ) (heps : 0 < eps) (heps1 : eps < 1)
    (c2 : ℝ) (hc2 : 0 < c2) (hdomB : ColdDominance c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
        ∀ (m : ℤ) (n : ℕ),
          (n : ℝ) + 1 < Rw c2 k →
          ((BS.P k).card : ℝ) * (2 ^ k) / 16 < |((m : ℤ) : ℝ)| →
          ((Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
              QP (BS.P k) b ≤ (n : ℝ) + 1 ∧
              (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
                (((BS.P k).attach.filter
                  (fun p => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ))).card : ℝ)
            ≤ Real.exp (2 * eps * ((n : ℝ) + 1)) := by
  obtain ⟨Xnw, hXnw0, hNW⟩ := cold_count_nonwrap c2 hc2
  obtain ⟨Xw, hXw0, hW⟩ := cold_count_wrap eps heps heps1 c2 hc2 hdomB
  refine ⟨max Xnw Xw, by positivity, fun BS k hk1 hk2 hk3 m n hn hm => ?_⟩
  by_cases hwrap : |((m : ℤ) : ℝ)| ≤ ((2:ℝ) ^ k) ^ 2 / 2
  · rw [hNW BS k hk1 hk2 (le_trans (le_max_left _ _) hk3) m n hn hm hwrap]
    simpa using Real.exp_nonneg (2 * eps * ((n : ℝ) + 1))
  · exact hW BS k hk1 hk2 (le_trans (le_max_right _ _) hk3) m n hn (lt_of_not_ge hwrap)

/-
**Label-uniform per-cold-block count.**  For ANY label `m` (no size bound)
    and ANY shell `n`, the count of `(3/4)`-conforming block-assignments of
    energy `≤ n+1` is `≤ exp(2ε(n+1))`.  Proof by case analysis:
    * if `Rw c2 k ≤ n+1` (energy floor met), the unconstrained count is already
      `≤ exp(2ε(n+1))` via `hot_block_count`;
    * else, if `|m| ≤ N·2^k/16`, the conforming count is `≤ exp(ε(n+1))` via
      `fixed_label_block_count`;
    * else (`|m| > N·2^k/16` and `n+1 < Rw c2 k`) it is `cold_count_huge_label`.
-/
private lemma cold_count_large (eps : ℝ) (heps : 0 < eps) (heps1 : eps < 1)
    (c2 : ℝ) (hc2 : 0 < c2) (hdomB : ColdDominance c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
        ∀ (m : ℤ) (n : ℕ),
          ((Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
              QP (BS.P k) b ≤ (n : ℝ) + 1 ∧
              (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
                (((BS.P k).attach.filter
                  (fun p => b p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ))).card : ℝ)
            ≤ Real.exp (2 * eps * ((n : ℝ) + 1)) := by
  obtain ⟨Xh, hXh0, hHot⟩ := hot_block_count eps heps heps1 c2 hc2
  obtain ⟨Xc, hXc0, hCold⟩ := fixed_label_block_count eps heps
  obtain ⟨Xg, hXg0, hHuge⟩ := cold_count_huge_label eps heps heps1 c2 hc2 hdomB
  use max Xh (max Xc Xg);
  refine' ⟨ by positivity, fun BS k hk1 hk2 hk3 m n => _ ⟩;
  by_cases hRw : Rw c2 k ≤ (n : ℝ) + 1;
  · refine' le_trans _ ( hHot BS k hk1 hk2 ( le_trans ( le_max_left _ _ ) hk3 ) n hRw );
    exact_mod_cast Finset.card_le_card fun x hx => by aesop;
  · by_cases hm : |(m : ℝ)| ≤ ((BS.P k).card : ℝ) * (2 ^ k) / 16;
    · exact le_trans ( hCold BS k hk1 hk2 ( le_trans ( le_max_of_le_right ( le_max_left _ _ ) ) hk3 ) m hm n ) ( Real.exp_le_exp.mpr ( by nlinarith ) );
    · exact hHuge BS k hk1 hk2 ( le_trans ( le_max_of_le_right ( le_max_right _ _ ) ) hk3 ) m n ( not_le.mp hRw ) ( not_le.mp hm )

/-
**Label-uniform per-fiber count.**  The per-fiber
count `∏_k exp(2ε(v_k+1))` holds for every label
    assignment `ℓ`.  Hot blocks use `hot_block_count`; cold blocks use the
    label-uniform `cold_count_large`.
-/
lemma fiber_card_exp_bound (eps : ℝ) (heps : 0 < eps) (heps1 : eps < 1)
    (c2 : ℝ) (hc2 : 0 < c2) (hdomB : ColdDominance c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (BS : BlockSystem) (H B : Finset ℕ) (v : ℕ → ℕ) (ℓ : ℕ → ℤ),
        X0 ≤ (2:ℝ) ^ BS.k0 →
        (∀ k ∈ Finset.Icc BS.k0 BS.K, k ∈ H → Rw c2 k ≤ (v k : ℝ) + 1) →
        ((fiber BS H B v ℓ).card : ℝ) ≤
          ∏ k ∈ Finset.Icc BS.k0 BS.K, Real.exp (2 * eps * ((v k : ℝ) + 1)) := by
  obtain ⟨Xh, hXh0, hHot⟩ := GlobalControl.hot_block_count eps heps heps1 c2 hc2
  obtain ⟨Xc, hXc0, hCold⟩ := GlobalControl.cold_count_large eps heps heps1 c2 hc2 hdomB
  use max Xh Xc
  constructor
  ·
    positivity
  ·
    intro BS H B v ℓ hX hHot';
    apply GlobalControl.fiber_prod_bound;
    intro k hk; by_cases hkH : k ∈ H <;> simp_all +decide ;
    · exact hHot BS k hk.1 hk.2 ( by linarith [ pow_le_pow_right₀ ( by norm_num : ( 1 : ℝ ) ≤ 2 ) hk.1 ] ) _ ( hHot' k hk.1 hk.2 hkH );
    · exact hCold BS k hk.1 hk.2 ( by linarith [ pow_le_pow_right₀ ( by norm_num : ( 1 : ℝ ) ≤ 2 ) hk.1 ] ) _ _
end GlobalControl

end
