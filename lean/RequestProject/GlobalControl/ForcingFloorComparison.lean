import RequestProject.GlobalControl.Encoding.BlockData

/-!
# Forcing-floor comparison

The forcing floor is monotone in scale and is eventually dominated by every later boundary penalty floor.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## monotonicity of the forcing floor `Rw` -/

/-- One monotonicity step of `Rw` for `k ≥ 4` . -/
private lemma Rw_mono_step (c2 : ℝ) (hc2 : 0 < c2) (k : ℕ) (hk : 4 ≤ k) :
    Rw c2 k ≤ Rw c2 (k+1) := by
  have hlog2 : (0:ℝ) < Real.log 2 := Real.log_pos (by norm_num)
  have hkR : (4:ℝ) ≤ (k:ℝ) := by exact_mod_cast hk
  have hcube : ((k:ℝ)+1)^3 ≤ 2 * (k:ℝ)^3 := by
    nlinarith [hkR, mul_nonneg (show (0:ℝ) ≤ (k:ℝ)-4 by linarith) (sq_nonneg (k:ℝ)),
      mul_nonneg (show (0:ℝ) ≤ (k:ℝ) by linarith) (show (0:ℝ) ≤ (k:ℝ)-3 by linarith)]
  have hrw : ∀ j:ℕ, 1 ≤ j → Rw c2 j = (c2/(Real.log 2)^3) * ((2:ℝ)^j/(j:ℝ)^3) := by
    intro j hj
    have hjR : (0:ℝ) < (j:ℝ) := by exact_mod_cast hj
    unfold Rw; rw [Real.log_pow, mul_pow]; field_simp
  have key : (2:ℝ)^k / (k:ℝ)^3 ≤ (2:ℝ)^(k+1) / ((k:ℝ)+1)^3 := by
    have hps : (2:ℝ)^(k+1) = 2 * 2^k := by rw [pow_succ]; ring
    rw [div_le_div_iff₀ (by positivity) (by positivity)]
    have h1 : (2:ℝ)^k * ((k:ℝ)+1)^3 ≤ 2^k * (2*(k:ℝ)^3) :=
      mul_le_mul_of_nonneg_left hcube (by positivity)
    have h2 : (2:ℝ)^k * (2*(k:ℝ)^3) = 2^(k+1)*(k:ℝ)^3 := by rw [hps]; ring
    linarith [h1, h2]
  rw [hrw k (by omega), hrw (k+1) (by omega)]
  push_cast
  exact mul_le_mul_of_nonneg_left key (by positivity)

/-- For `c2 > 0` and `4 ≤ k0 ≤ k`,
`Rw c2 k0 ≤ Rw c2 k`. -/
lemma Rw_mono (c2 : ℝ) (hc2 : 0 < c2) {k0 k : ℕ} (hk0 : 4 ≤ k0) (hkk : k0 ≤ k) :
    Rw c2 k0 ≤ Rw c2 k := by
  induction k, hkk using Nat.le_induction with
  | base => exact le_refl _
  | succ n hn ih =>
      exact le_trans ih (Rw_mono_step c2 hc2 n (le_trans hk0 hn))

/-! ## the forcing floor at `k0` is below the boundary penalty floor -/

/-
Exponential eventually dominates any affine function: for any `D`, there is
a threshold past which `D·(k+1) ≤ 2^k`.
-/
private lemma exists_pow_ge_affine (D : ℝ) :
    ∃ N : ℕ, ∀ k : ℕ, N ≤ k → D * ((k : ℝ) + 1) ≤ (2 : ℝ) ^ k := by
  -- The sequence $\frac{k+1}{2^k}$ tends to $0$ as $k$ tends to infinity.
  have h_seq_zero : Filter.Tendsto (fun k : ℕ => (k + 1 : ℝ) / 2 ^ k) Filter.atTop (nhds 0) := by
    refine' squeeze_zero_norm' _ tendsto_inv_atTop_nhds_zero_nat;
    norm_num;
    exact ⟨ 8, fun n hn => by rw [ inv_eq_one_div, div_le_div_iff₀ ] <;> norm_cast <;> induction hn <;> norm_num [ Nat.pow_succ ] at * ; nlinarith ⟩;
  rcases Metric.tendsto_atTop.mp h_seq_zero ( 1 / ( Max.max D 1 ) ) ( by positivity ) with ⟨ N, hN ⟩;
  simp +zetaDelta at *;
  exact ⟨ N, fun n hn => by have := hN n hn; rw [ div_lt_iff₀ ( by positivity ) ] at this; rw [ abs_of_nonneg ( by positivity ) ] at this; nlinarith [ le_max_left D 1, le_max_right D 1, inv_mul_cancel₀ ( show ( max D 1 ) ≠ 0 by positivity ), pow_pos ( zero_lt_two' ℝ ) n ] ⟩

/-
For `k` large enough (density past the
exception threshold, exponential-beats-linear), the boundary penalty floor at
block `k` dominates the forcing floor at `k`.  Single-index analytic core.
-/
private lemma Pifloor_ge_Rw (c2 e0 : ℝ) (he0 : 0 < e0) :
    ∃ k0min : ℕ, 4 ≤ k0min ∧
      ∀ (BS : BlockSystem), k0min ≤ BS.k0 →
        ∀ k, BS.k0 ≤ k → k < BS.K → Rw c2 k ≤ Pifloor BS e0 k := by
  obtain ⟨Na, hNa⟩ := exists_pow_ge_affine (4 * e0 * Real.log 2)
  obtain ⟨Nb, hNb⟩ := exists_pow_ge_affine (2 * (e0 + 1) * Real.log 2)
  obtain ⟨Nc, hNc⟩ := exists_pow_ge_affine (2 ^ 20 * c2 * Real.log 2);
  refine' ⟨ 4 + Na + Nb + Nc, _, _ ⟩;
  · linarith;
  · intro BS hBS k hk hk'; rw [ Rw, Pifloor ] ;
    -- Apply the density bounds from `hdensity`.
    have h_density_k : (BS.P k).card ≥ (2 ^ k : ℝ) / (2 * (k : ℝ) * Real.log 2) := by
      have := BS.hdensity k ( by linarith ) ( by linarith ) ; simp_all +decide [ mul_assoc, mul_comm, mul_left_comm ] ;
    have h_density_k1 : (BS.P (k + 1)).card ≥ (2 * 2 ^ k : ℝ) / (2 * ((k + 1) : ℝ) * Real.log 2) := by
      have := BS.hdensity ( k + 1 ) ( by linarith ) ( by linarith ) ; norm_num [ Real.log_pow ] at * ; ring_nf at * ; aesop;
    -- Apply the bounds from `hNa`, `hNb`, and `hNc`.
    have h_bounds : (2 ^ k : ℝ) / (4 * (k : ℝ) * Real.log 2) ≤ (BS.P k).card - e0 ∧ (2 ^ k : ℝ) / (2 * ((k + 1) : ℝ) * Real.log 2) ≤ (BS.P (k + 1)).card - e0 - 1 := by
      constructor;
      · rw [ ge_iff_le, div_le_iff₀ ] at * <;> try positivity;
        · nlinarith [ hNa k ( by linarith ), Real.log_pos one_lt_two, show ( k : ℝ ) ≥ 4 by norm_cast; linarith ];
        · exact mul_pos ( mul_pos two_pos ( Nat.cast_pos.mpr ( by linarith ) ) ) ( Real.log_pos one_lt_two );
        · exact mul_pos ( mul_pos ( by norm_num ) ( Nat.cast_pos.mpr ( by linarith ) ) ) ( Real.log_pos ( by norm_num ) );
      · rw [ ge_iff_le, div_le_iff₀ ] at * <;> try positivity;
        · nlinarith [ hNb k ( by linarith ), Real.log_pos one_lt_two ];
        · exact mul_pos ( mul_pos two_pos ( Nat.cast_pos.mpr ( by linarith ) ) ) ( Real.log_pos one_lt_two );
    refine' le_trans _ ( div_le_div_of_nonneg_right ( mul_le_mul h_bounds.2 ( pow_le_pow_left₀ _ h_bounds.1 3 ) _ _ ) _ );
    · have hkpos : 0 < (k : ℝ) := by exact_mod_cast (show 0 < k by linarith)
      rw [div_mul_eq_mul_div, div_div, div_le_div_iff₀]
      · norm_num [Real.log_pow]
        field_simp
        have hc := hNc k (by linarith)
        ring_nf at hc ⊢
        exact hc
      · rw [Real.log_pow]
        positivity
      · positivity
    · positivity;
    · positivity;
    · exact le_trans ( by positivity ) h_bounds.2;
    · positivity

/-- For `k0` large enough (density past the
exception threshold, power-beats-poly-log), the forcing floor at `k0` is below
the boundary penalty floor at any block `k0 ≤ k < K`. -/
lemma Rw_le_Pifloor (c2 e0 : ℝ) (hc2 : 0 < c2) (he0 : 0 < e0) :
    ∃ k0min : ℕ, 4 ≤ k0min ∧
      ∀ (BS : BlockSystem), k0min ≤ BS.k0 → admissibleGlobalRange BS →
        ∀ k, BS.k0 ≤ k → k < BS.K → Rw c2 BS.k0 ≤ Pifloor BS e0 k := by
  obtain ⟨k1, hk1, hPR⟩ := Pifloor_ge_Rw c2 e0 he0
  refine ⟨k1, hk1, fun BS hk0 _ k hk0k hkK => ?_⟩
  exact le_trans (Rw_mono c2 hc2 (le_trans hk1 hk0) hk0k) (hPR BS hk0 k hk0k hkK)

end GlobalControl

end
