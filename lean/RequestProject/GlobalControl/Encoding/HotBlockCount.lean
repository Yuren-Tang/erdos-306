import RequestProject.GlobalControl.Encoding.BlockData
import RequestProject.LocalEnergy.LevelSet

/-!
# Hot-block entropy absorption

Deviation-scale control and asymptotic absorption of the polynomial prefactor
in the single-block level-set bound above the hot-block energy floor.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-
Block-`σ` lower control: `1/sigmaP (BS.P k) ≤ 16·2^k·log(2^k)`, from the
    block-density `card ≥ 2^k/(2 log 2^k)` and `sigmaP_lower`.
-/
lemma block_deviation_reciprocal_bound (BS : BlockSystem) (k : ℕ) (hk1 : BS.k0 ≤ k) (hk2 : k ≤ BS.K) :
    1 / sigmaP (BS.P k) ≤ 16 * (2:ℝ) ^ k * Real.log (2 ^ k) := by
  by_cases hN : 2 ≤ (BS.P k).card;
  · have h_sigmaP_lower : (BS.P k).card / (8 * (2 ^ k : ℝ) ^ 2) ≤ sigmaP (BS.P k) := by
      convert LocalEnergy.block_deviation_lower_bound ( 2 ^ k ) ( one_le_pow₀ ( by norm_num ) ) ( BS.P k ) _ _ using 1 <;> norm_num;
      · exact fun p hp => ⟨ BS.hprime k p hp, by linarith [ BS.hwindow k p hp ], by linarith [ BS.hwindow k p hp, pow_succ' 2 k ] ⟩;
      · linarith;
    have h_density : (BS.P k).card ≥ (2 ^ k : ℝ) / (2 * Real.log (2 ^ k)) := by
      convert BS.hdensity k hk1 hk2 using 1;
    rw [ div_le_iff₀ ] at * <;> norm_num at *;
    · rw [ div_le_iff₀ ] at h_density <;> nlinarith [ show ( 0 : ℝ ) < 2 ^ k by positivity, show ( 0 : ℝ ) < k * Real.log 2 by exact mul_pos ( Nat.cast_pos.mpr <| by linarith [ BS.hk0 ] ) <| Real.log_pos <| by norm_num ];
    · exact lt_of_lt_of_le ( by positivity ) h_sigmaP_lower;
  · interval_cases _ : Finset.card ( BS.P k ) <;> simp_all +decide;
    · have := BS.hdensity k hk1 hk2; norm_num [ ‹BS.P k = ∅› ] at this;
      exact absurd this ( not_le_of_gt ( div_pos ( by positivity ) ( mul_pos zero_lt_two ( mul_pos ( Nat.cast_pos.mpr ( by linarith [ BS.hk0 ] ) ) ( Real.log_pos one_lt_two ) ) ) ) );
    · have := BS.hdensity k hk1 hk2;
      rw [ div_le_iff₀ ] at this <;> norm_num [ Real.log_pow ] at *;
      · rcases k with ( _ | _ | k ) <;> norm_num at *;
        · norm_num [ ‹#(BS.P 1) = 1› ] at this ; linarith [ Real.log_lt_sub_one_of_pos zero_lt_two ( by norm_num ) ];
        · norm_num [ ‹#(BS.P (k + 1 + 1)) = 1› ] at this;
          exact absurd this ( by { exact not_le_of_gt ( by { exact Nat.recOn k ( by norm_num; have := Real.log_two_lt_d9; norm_num1 at *; linarith ) fun n ihn => by norm_num [ pow_succ' ] at * ; nlinarith [ Real.log_nonneg one_le_two ] } ) } );
      · exact mul_pos ( Nat.cast_pos.mpr ( by linarith [ BS.hk0 ] ) ) ( Real.log_pos ( by norm_num ) )

/-
Analytic threshold for the hot-block absorption (helper for `hot_block_count`).
    For `X` large the energy floor `c2·X/log³X` dominates the logarithmic
    polynomial factor coming from `block_level_set_bound`.
-/
lemma eventually_absorb_block_level_set_prefactor (eps c2 C0 : ℝ) (heps : 0 < eps) (hc2 : 0 < c2) :
    ∃ X0 : ℕ, 2 ≤ X0 ∧ ∀ X : ℕ, X0 ≤ X →
      eps * c2 * X / (Real.log X) ^ 3 ≥
        2 * (Real.log C0 + Real.log 34 + Real.log X + Real.log (Real.log X) + 1) ∧
      eps * (c2 * X / (Real.log X) ^ 3) ≥ Real.log (c2 * X / (Real.log X) ^ 3) := by
  obtain ⟨X0₁, hX0₁⟩ : ∃ X0₁ : ℕ, 2 ≤ X0₁ ∧ ∀ X : ℕ, X0₁ ≤ X → eps * c2 * (X : ℝ) / (Real.log X) ^ 3 ≥ 2 * (Real.log C0 + Real.log 34 + Real.log X + Real.log (Real.log X) + 1) := by
    set A := Real.log C0 + Real.log 34 + 1
    obtain ⟨Xa, _hXa0, hXa⟩ := RequestProject.eventually_le_natCast_div_log_pow 3
      (4 * |A| / (eps * c2))
    obtain ⟨Xb, _hXb0, hXb⟩ := RequestProject.eventually_le_natCast_div_log_pow 4
      (8 / (eps * c2))
    refine ⟨Nat.ceil (max Xa Xb) + 3, by omega, fun X hX => ?_⟩
    have hceil : Nat.ceil (max Xa Xb) ≤ X := by omega
    have hmax : max Xa Xb ≤ (X : ℝ) :=
      le_trans (Nat.le_ceil _) (by exact_mod_cast hceil)
    have ha := hXa X (le_trans (le_max_left _ _) hmax)
    have hb := hXb X (le_trans (le_max_right _ _) hmax)
    have hX3 : 3 ≤ X := by omega
    have hlog : 0 < Real.log X := Real.log_pos (by norm_cast; omega)
    have hloglog : Real.log (Real.log X) ≤ Real.log X := by
      linarith [Real.log_le_sub_one_of_pos hlog]
    have hec : 0 < eps * c2 := mul_pos heps hc2
    have ha_scaled := mul_le_mul_of_nonneg_left ha
      (show 0 ≤ eps * c2 / 2 by positivity)
    have hconstant :
        2 * |A| ≤ (eps * c2 / 2) * ((X : ℝ) / (Real.log X) ^ 3) := by
      calc
        2 * |A| = (eps * c2 / 2) * (4 * |A| / (eps * c2)) := by
          field_simp [hec.ne']; ring
        _ ≤ (eps * c2 / 2) * ((X : ℝ) / (Real.log X) ^ 3) := ha_scaled
    have hb_scaled := mul_le_mul_of_nonneg_left hb
      (mul_nonneg (show 0 ≤ eps * c2 / 2 by positivity) hlog.le)
    have hlogterm :
        4 * Real.log X ≤ (eps * c2 / 2) * ((X : ℝ) / (Real.log X) ^ 3) := by
      calc
        4 * Real.log X =
            (eps * c2 / 2 * Real.log X) * (8 / (eps * c2)) := by
          field_simp [hec.ne']; ring
        _ ≤ (eps * c2 / 2 * Real.log X) *
            ((X : ℝ) / (Real.log X) ^ 4) := hb_scaled
        _ = (eps * c2 / 2) * ((X : ℝ) / (Real.log X) ^ 3) := by
          field_simp [hlog.ne']
    have hAupper : A ≤ |A| := le_abs_self A
    dsimp [A] at hconstant ⊢
    dsimp [A] at hAupper
    ring_nf at hconstant hlogterm hAupper ⊢
    nlinarith
  have h_scale_inf :
      Filter.Tendsto (fun X : ℕ => c2 * X / (Real.log X) ^ 3)
        Filter.atTop Filter.atTop := by
    simpa [mul_div_assoc] using
      (RequestProject.tendsto_natCast_div_log_pow_atTop 3).const_mul_atTop hc2
  obtain ⟨t0, _ht0, hlog⟩ := RequestProject.eventually_log_le_mul_self eps heps
  obtain ⟨X0₂, hX0₂⟩ := Filter.eventually_atTop.mp
    (h_scale_inf.eventually_ge_atTop t0)
  refine' ⟨ X0₁ + X0₂ + 2, _, _ ⟩ <;> norm_num at *;
  intro X hX
  exact ⟨hX0₁.2 X (by linarith), hlog _ (hX0₂ X (by linarith))⟩

/-
Helper: `Rw c2 k → ∞`, so for `X = 2^k` large, `1/eps ≤ Rw c2 k`.
-/
lemma block_energy_threshold_eventually_large (eps c2 : ℝ) (hc2 : 0 < c2) :
    ∃ X0 : ℝ, 0 < X0 ∧ ∀ (k : ℕ), 1 ≤ k → X0 ≤ (2:ℝ) ^ k → 1 / eps ≤ Rw c2 k := by
  have h_Rw_inf : Filter.Tendsto (fun k : ℕ => Rw c2 k) Filter.atTop Filter.atTop := by
    have hscale := (RequestProject.tendsto_natCast_div_log_pow_atTop 3).const_mul_atTop hc2
    have hpow : Filter.Tendsto (fun k : ℕ => 2 ^ k) Filter.atTop Filter.atTop :=
      tendsto_pow_atTop_atTop_of_one_lt (by norm_num)
    refine (hscale.comp hpow).congr' (Filter.Eventually.of_forall fun k => ?_)
    simp [Rw, Function.comp_apply, mul_div_assoc]
  obtain ⟨ k, hk ⟩ := Filter.eventually_atTop.mp ( h_Rw_inf.eventually_ge_atTop ( 1 / eps ) );
  exact ⟨ 2 ^ k, by positivity, fun n hn hn' => hk n <| Nat.le_of_not_lt fun h => by linarith [ pow_lt_pow_right₀ ( by norm_num : ( 1 : ℝ ) < 2 ) h ] ⟩

/-
Per-hot-block count: once the block energy floor
    `Rw c2 k ≤ n+1` holds (hot block), the unconstrained level-set count is
    `≤ exp(2ε(n+1))` — the entropy `block_level_set_bound` bound `C₀ e^{ε(n+1)}(1+√/σ)`
    has its polynomial factor absorbed by the (large) energy floor.  Valid for
    `k0 ≥` a threshold encoded as `X0 ≤ 2^k`.
-/
lemma hot_block_count (eps : ℝ) (heps : 0 < eps) (heps1 : eps < 1) (c2 : ℝ) (hc2 : 0 < c2) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (BS : BlockSystem) (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k →
        ∀ (n : ℕ), Rw c2 k ≤ (n : ℝ) + 1 →
          ((Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
              QP (BS.P k) b ≤ (n : ℝ) + 1)).card : ℝ)
            ≤ Real.exp (2 * eps * ((n : ℝ) + 1)) := by
  obtain ⟨ C0, X1, hC0, hX1, h ⟩ := LocalEnergy.block_level_set_bound eps heps heps1
  obtain ⟨ X0₈, hX0₈ ⟩ := eventually_absorb_block_level_set_prefactor eps c2 C0 heps hc2
  obtain ⟨ X0r, hX0r, hX0r' ⟩ := block_energy_threshold_eventually_large eps c2 hc2
  set X0 := Nat.ceil X1 + X0₈ + X0r + 16 with hX0_def
  use X0
  simp [hX0_def] at *;
  refine' ⟨ by positivity, fun BS k hk1 hk2 hk3 n hn => _ ⟩;
  refine' le_trans _ ( Real.exp_le_exp.mpr <| show 2 * eps * ( n + 1 ) ≥ eps * ( n + 1 ) + Real.log ( C0 * 17 * 2 ^ k * Real.log ( 2 ^ k ) * Real.sqrt ( n + 1 ) ) from _ );
  · -- Apply the `block_level_set_bound` bound to the block `BS.P k`, the radius `R = n + 1`, and the window and density conditions from `BS`.
    have h_unified : (Finset.filter (fun b : BlockAssignment (BS.P k) => QP (BS.P k) b ≤ (n : ℝ) + 1) (Finset.univ : Finset (BlockAssignment (BS.P k)))).card ≤ C0 * Real.exp (eps * (n + 1)) * (1 + Real.sqrt (n + 1) / sigmaP (BS.P k)) := by
      convert h ( 2 ^ k ) _ ( BS.P k ) _ _ ( n + 1 ) _ using 1 <;> norm_num at *;
      · linarith [ Nat.le_ceil X1, show ( X0₈ : ℝ ) ≥ 2 by norm_cast; linarith, show ( 2 : ℝ ) ^ k ≥ 0 by positivity ];
      · exact fun p hp => ⟨ Nat.Prime.ne_zero ( BS.hprime k p hp ) ⟩;
      · exact fun p hp => ⟨ BS.hprime k p hp, by linarith [ BS.hwindow k p hp ], by linarith [ BS.hwindow k p hp, pow_succ' 2 k ] ⟩;
      · convert BS.hdensity k hk1 hk2 using 1;
        norm_num [ Real.log_pow ];
    -- Apply the `block_deviation_reciprocal_bound` to the block `BS.P k`.
    have h_inv_sigmaP : 1 + Real.sqrt (n + 1) / sigmaP (BS.P k) ≤ 17 * 2 ^ k * Real.log (2 ^ k) * Real.sqrt (n + 1) := by
      have h_simplified : 1 / sigmaP (BS.P k) ≤ 16 * (2 : ℝ) ^ k * Real.log (2 ^ k) := by
        exact block_deviation_reciprocal_bound BS k hk1 hk2;
      ring_nf at *;
      nlinarith [ show 1 ≤ Real.sqrt ( 1 + n : ℝ ) by exact Real.le_sqrt_of_sq_le ( by linarith ), show 1 ≤ Real.log ( 2 ^ k ) * 2 ^ k by exact one_le_mul_of_one_le_of_one_le ( Real.le_log_iff_exp_le ( by positivity ) |>.2 <| by exact Real.exp_one_lt_d9.le.trans <| by norm_num; linarith [ show ( 2 : ℝ ) ^ k ≥ 2 by exact le_trans ( by norm_num ) ( pow_le_pow_right₀ ( by norm_num ) <| show k ≥ 1 by linarith [ BS.hk0 ] ) ] ) ( one_le_pow₀ <| by norm_num ) ];
    refine' le_trans h_unified ( le_trans ( mul_le_mul_of_nonneg_left h_inv_sigmaP <| by positivity ) _ );
    rw [ Real.exp_add, Real.exp_log ( by exact mul_pos ( mul_pos ( mul_pos ( mul_pos hC0 ( by norm_num ) ) ( by positivity ) ) ( Real.log_pos ( one_lt_pow₀ ( by norm_num ) ( by linarith [ show k > 0 from Nat.pos_of_ne_zero ( by rintro rfl; linarith [ Nat.le_ceil X1 ] ) ] ) ) ) ) ( Real.sqrt_pos.mpr ( by positivity ) ) ) ] ; ring_nf ; norm_num [ Real.exp_pos, hC0, heps ] ;
  · -- Apply the logarithmic bound from `log_le_linear_of_base`.
    have h_log_bound : Real.log (C0 * 17 * 2 ^ k * Real.log (2 ^ k)) ≤ (eps / 2) * (n + 1) := by
      have h_log_bound : Real.log C0 + Real.log 17 + Real.log (2 ^ k) + Real.log (Real.log (2 ^ k)) ≤ (eps / 2) * (n + 1) := by
        have := hX0₈.2 ( 2 ^ k ) ( by linarith [ Nat.le_ceil X1, show ( 2 : ℕ ) ^ k ≥ X0₈ by exact_mod_cast ( by linarith [ Nat.le_ceil X1 ] : ( X0₈ : ℝ ) ≤ 2 ^ k ) ] ) ; norm_num at *;
        rw [ show ( 34 : ℝ ) = 2 * 17 by norm_num, Real.log_mul ( by positivity ) ( by positivity ) ] at this;
        unfold Rw at hn; norm_num at hn; ring_nf at *; nlinarith [ Real.log_pos one_lt_two ] ;
      convert h_log_bound using 1 ; rw [ Real.log_mul, Real.log_mul, Real.log_mul ] <;> norm_num <;> try positivity;
      linarith [ BS.hk0 ];
    rw [ Real.log_mul ( by exact ne_of_gt <| mul_pos ( mul_pos ( mul_pos hC0 <| by norm_num ) <| by positivity ) <| Real.log_pos <| one_lt_pow₀ one_lt_two <| by linarith [ show k > 0 from Nat.pos_of_ne_zero <| by rintro rfl; linarith [ Nat.le_ceil X1 ] ] ) <| by positivity, Real.log_sqrt <| by positivity ];
    have h_log_bound : Real.log (n + 1) ≤ eps * (n + 1) := by
      apply RequestProject.log_le_linear_of_base eps (Rw c2 k) (n + 1) heps (by
      exact div_pos ( mul_pos hc2 ( pow_pos ( by norm_num ) _ ) ) ( pow_pos ( Real.log_pos ( one_lt_pow₀ ( by norm_num ) ( by linarith [ show k > 0 from Nat.pos_of_ne_zero <| by rintro rfl; linarith [ Nat.le_ceil X1 ] ] ) ) ) _ )) (by
      exact hX0r' k ( by linarith [ show k > 0 from Nat.pos_of_ne_zero <| by rintro rfl; linarith [ Nat.le_ceil X1 ] ] ) ( by linarith [ Nat.le_ceil X1 ] ) |> le_trans ( by norm_num )) (by
      convert hX0₈.2 ( 2 ^ k ) ( by linarith [ Nat.le_ceil X1, show ( 2 : ℕ ) ^ k ≥ X0₈ by exact_mod_cast ( by linarith : ( X0₈ : ℝ ) ≤ 2 ^ k ) ] ) |>.2 using 1; all_goals norm_num [ Rw ]) (by
      exact hn);
    linarith

end GlobalControl

end
