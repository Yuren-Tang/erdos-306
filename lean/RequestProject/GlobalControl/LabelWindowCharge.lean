import Mathlib.Analysis.Complex.ExponentialBounds
import RequestProject.Core.Asymptotics
import RequestProject.GlobalControl.LevelSetParameters

/-!
# Analytic charge for label windows

Exponential dyadic growth eventually absorbs the polynomial-logarithmic size
of every dominant-label window following a hot block.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ### Analytic growth and per-label charge -/

/-
An exponential `2^{s-1}` term over a cube of logs
    eventually dominates any affine-plus-`log log` expression.  This is the only
    genuine analysis in the label-charging argument; everything else is algebra.
-/
lemma pow_beats_poly_log (C D : ℝ) (hD : 0 < D) :
    ∃ N : ℕ, ∀ s : ℕ, N ≤ s →
      C + (3 * s / 2) * Real.log 2 + Real.log (Real.log (2 ^ s))
        ≤ D * 2 ^ (s - 1) / (Real.log (2 ^ (s - 1))) ^ 3 := by
  -- We can divide both sides of the equation by $2^{s-1}$, which is positive.
  suffices h_div' : Filter.Tendsto (fun s : ℕ => (C + 3 * s / 2 * Real.log 2 + Real.log (Real.log (2 ^ s))) / (2 ^ (s - 1) / (Real.log (2 ^ (s - 1))) ^ 3)) Filter.atTop (nhds 0) by
    obtain ⟨ N, hN ⟩ := Metric.tendsto_atTop.mp h_div' D hD;
    refine' ⟨ N + 2, fun s hs => _ ⟩ ; specialize hN s ( by linarith ) ; simp_all +decide [ mul_div_assoc ];
    rw [ abs_of_nonneg ( Real.log_nonneg <| by nlinarith [ show ( s : ℝ ) ≥ 2 by norm_cast; linarith, Real.log_two_gt_d9, mul_div_cancel₀ ( 3 : ℝ ) two_ne_zero ] ) ] at hN ; rw [ div_lt_iff₀ <| by exact div_pos ( pow_pos zero_lt_two _ ) <| pow_pos ( mul_pos ( Nat.cast_pos.mpr <| Nat.sub_pos_of_lt <| by linarith ) <| Real.log_pos one_lt_two ) _ ] at hN ; linarith [ abs_le.mp ( show |C + 3 * ( s / 2 : ℝ ) * Real.log 2 + Real.log ( s * Real.log 2 )| ≤ _ from le_of_eq rfl ) ] ;
  -- We'll use the fact that $2^{s-1}$ grows much faster than $(\log (2^{s-1}))^3$.
  have h_exp_growth : Filter.Tendsto (fun s : ℕ => (s : ℝ) / (2 ^ (s - 1) / (Real.log (2 ^ (s - 1))) ^ 3)) Filter.atTop (nhds 0) := by
    -- We can simplify the expression inside the limit.
    suffices h_simp : Filter.Tendsto (fun s : ℕ => (s : ℝ) * (Real.log 2 * (s - 1)) ^ 3 / (2 ^ (s - 1))) Filter.atTop (nhds 0) by
      convert h_simp using 2 ; norm_num [ Real.log_pow ] ; ring_nf;
      cases ‹_› <;> norm_num ; ring;
    -- We can factor out $s^4$ from the numerator and denominator.
    suffices h_factor : Filter.Tendsto (fun s : ℕ => (s ^ 4 : ℝ) / (2 ^ (s - 1))) Filter.atTop (nhds 0) by
      refine' squeeze_zero_norm' _ h_factor ; norm_num;
      refine' ⟨ 2, fun n hn => _ ⟩ ; gcongr;
      rw [ abs_of_nonneg ( Real.log_nonneg one_le_two ), abs_of_nonneg ( sub_nonneg_of_le ( by norm_cast; linarith ) ) ];
      exact le_trans ( mul_le_mul_of_nonneg_left ( pow_le_pow_left₀ ( mul_nonneg ( Real.log_nonneg one_le_two ) ( sub_nonneg.mpr ( Nat.one_le_cast.mpr ( by linarith ) ) ) ) ( mul_le_of_le_one_left ( sub_nonneg.mpr ( Nat.one_le_cast.mpr ( by linarith ) ) ) ( Real.log_two_lt_d9.le.trans ( by norm_num ) ) ) _ ) ( Nat.cast_nonneg _ ) ) ( by nlinarith [ show ( n : ℝ ) ≥ 2 by norm_cast, pow_two ( n - 1 : ℝ ) ] );
    rw [ ← Filter.tendsto_add_atTop_iff_nat 1 ] ; norm_num;
    refine' squeeze_zero_norm' _ tendsto_inv_atTop_nhds_zero_nat ; norm_num;
    refine' ⟨ 200, fun n hn => _ ⟩ ; rw [ inv_eq_one_div, div_le_div_iff₀ ] <;> norm_cast <;> induction hn <;> norm_num [ Nat.pow_succ ] at *;
    nlinarith [ Nat.zero_le ( 2 ^ ‹_› ), pow_nonneg ( Nat.zero_le ‹_› ) 2, pow_nonneg ( Nat.zero_le ‹_› ) 3, pow_nonneg ( Nat.zero_le ‹_› ) 4 ];
  -- We'll use the fact that $Real.log (Real.log (2 ^ s))$ grows much slower than $s$.
  have h_log_log_growth : Filter.Tendsto (fun s : ℕ => Real.log (Real.log (2 ^ s)) / (2 ^ (s - 1) / (Real.log (2 ^ (s - 1))) ^ 3)) Filter.atTop (nhds 0) := by
    refine' squeeze_zero_norm' _ h_exp_growth;
    norm_num [ Real.log_pow ];
    refine' ⟨ 2, fun n hn => _ ⟩ ; rw [ abs_of_nonneg ( Real.log_nonneg <| by nlinarith [ show ( n : ℝ ) ≥ 2 by norm_cast, Real.log_two_gt_d9, Real.log_le_sub_one_of_pos zero_lt_two ] ) ] ; rw [ abs_of_nonneg ( Real.log_nonneg one_le_two ) ] ; gcongr;
    exact le_trans ( Real.log_le_sub_one_of_pos ( by positivity ) ) ( by nlinarith [ Real.log_le_sub_one_of_pos zero_lt_two, show ( n : ℝ ) ≥ 2 by norm_cast ] );
  convert Filter.Tendsto.add ( Filter.Tendsto.add ( tendsto_const_nhds.mul ( show Filter.Tendsto ( fun s : ℕ => ( 1 : ℝ ) / ( 2 ^ ( s - 1 ) / Real.log ( 2 ^ ( s - 1 ) ) ^ 3 ) ) Filter.atTop ( nhds 0 ) from ?_ ) ) ( h_exp_growth.const_mul ( 3 * Real.log 2 / 2 ) ) ) h_log_log_growth using 2 <;> ring_nf;
  -- We'll use the fact that $(s-1)^3 * (1/2)^{s-1}$ tends to $0$ as $s$ tends to infinity.
  have h_lim : Filter.Tendsto (fun s : ℕ => (s : ℝ) ^ 3 * (1 / 2) ^ s) Filter.atTop (nhds 0) := by
    refine' squeeze_zero_norm' _ tendsto_inv_atTop_nhds_zero_nat;
    norm_num;
    refine' ⟨ 20, fun n hn => _ ⟩ ; rw [ inv_eq_one_div, div_pow, mul_div, div_le_div_iff₀ ] <;> norm_cast <;> induction hn <;> norm_num [ Nat.pow_succ ] at *;
    nlinarith [ Nat.pow_le_pow_left ‹20 ≤ _› 3 ];
  convert h_lim.comp ( Filter.tendsto_sub_atTop_nat 1 ) |> Filter.Tendsto.mul_const ( Real.log 2 ^ 3 ) using 2 <;> norm_num ; ring

/-
For a segment start `s` past a uniform threshold, the
    label-window size `2·labelBound c2 s + 1` is dominated by the Peierls energy
    of the predecessor hot block `s-1`.
-/
lemma labelBound_charge_hot (c2 eps : ℝ) (heps : 0 < eps) (hc2 : 0 < c2) :
    ∃ k0min : ℕ, ∀ s : ℕ, k0min ≤ s →
      (2 * (labelBound c2 s : ℝ) + 1) ≤ Real.exp (eps * Rw c2 (s - 1)) := by
  -- By `Int.ceil_le`/`Int.le_ceil`, `(labelBound c2 s : ℝ) ≤ (20/3)*√(c2*2^s)*(16*2^s*log(2^s)) + 1`.
  -- Hence `2*(labelBound c2 s)+1 ≤ (640/3)*√(c2*2^s)*(2^s*log(2^s)) + 3`.
  have h_labelBound_le : ∀ s : ℕ, s ≥ 4 → 2 * (labelBound c2 s : ℝ) + 1 ≤ (640 / 3) * Real.sqrt (c2 * (2 : ℝ) ^ s) * (2 ^ s * Real.log (2 ^ s)) + 3 := by
    intro s hs; rw [ labelBound ] ; norm_num ; ring_nf ;
    linarith [ Int.ceil_lt_add_one ( Real.sqrt c2 * Real.sqrt ( 2 ^ s ) * s * Real.log 2 * 2 ^ s * ( 320 / 3 ) ) ];
  -- Choose `k0min` large enough so that for all `s ≥ k0min`, `P + 3 ≤ Real.exp (Real.log P + 1)`.
  obtain ⟨k0min, hk0min⟩ : ∃ k0min : ℕ, ∀ s : ℕ, k0min ≤ s → (640 / 3) * Real.sqrt (c2 * (2 : ℝ) ^ s) * (2 ^ s * Real.log (2 ^ s)) + 3 ≤ Real.exp (Real.log ((640 / 3) * Real.sqrt (c2 * (2 : ℝ) ^ s) * (2 ^ s * Real.log (2 ^ s))) + 1) := by
    have h_exp_log : ∃ k0min : ℕ, ∀ s : ℕ, k0min ≤ s → (640 / 3) * Real.sqrt (c2 * (2 : ℝ) ^ s) * (2 ^ s * Real.log (2 ^ s)) ≥ 3 := by
      have h_exp_log : Filter.Tendsto (fun s : ℕ => (640 / 3) * Real.sqrt (c2 * (2 : ℝ) ^ s) * (2 ^ s * Real.log (2 ^ s))) Filter.atTop Filter.atTop := by
        refine' Filter.tendsto_atTop_mono _ _;
        use fun n => 640 / 3 * Real.sqrt c2 * 2 ^ n * Real.log 2 * n;
        · norm_num [ Real.sqrt_mul, hc2.le ] ; ring_nf ; norm_num;
          exact fun n => le_mul_of_one_le_right ( by positivity ) ( Real.le_sqrt_of_sq_le ( mod_cast Nat.one_le_pow _ _ ( by decide ) ) );
        · exact Filter.Tendsto.atTop_mul_atTop₀ ( Filter.Tendsto.atTop_mul_const ( by positivity ) ( Filter.Tendsto.const_mul_atTop ( by positivity ) ( tendsto_pow_atTop_atTop_of_one_lt one_lt_two ) ) ) tendsto_natCast_atTop_atTop;
      exact Filter.eventually_atTop.mp ( h_exp_log.eventually_ge_atTop 3 );
    obtain ⟨ k0min, hk0min ⟩ := h_exp_log; use k0min; intros s hs; rw [ Real.exp_add, Real.exp_log ( by linarith [ hk0min s hs ] ) ] ; nlinarith [ hk0min s hs, Real.add_one_le_exp 1 ] ;
  obtain ⟨N, hN⟩ : ∃ N : ℕ, ∀ s : ℕ, N ≤ s → Real.log ((640 / 3) * Real.sqrt (c2 * (2 : ℝ) ^ s) * (2 ^ s * Real.log (2 ^ s))) + 1 ≤ eps * c2 * 2 ^ (s - 1) / (Real.log (2 ^ (s - 1))) ^ 3 := by
    have := GlobalControl.pow_beats_poly_log ( Real.log ( 640 / 3 * Real.sqrt c2 ) + 2 ) ( eps * c2 ) ( by positivity );
    obtain ⟨ N, hN ⟩ := this; use N + 4; intros s hs; specialize hN s ( by linarith ) ; simp_all +decide [ Real.log_mul, Real.log_sqrt, hc2.le, ne_of_gt hc2 ] ;
    rw [ Real.log_mul, Real.log_mul, Real.log_mul, Real.log_mul, Real.log_sqrt, Real.log_sqrt ] <;> first | positivity | norm_num ; ring_nf at * ; norm_num at *;
    · grind +splitImp;
    · linarith;
    · linarith;
  use Max.max k0min ( Max.max N 4 ) ; intros s hs ; specialize h_labelBound_le s ( by linarith [ le_max_left k0min ( Max.max N 4 ), le_max_right k0min ( Max.max N 4 ), le_max_left N 4, le_max_right N 4 ] ) ; specialize hk0min s ( by linarith [ le_max_left k0min ( Max.max N 4 ), le_max_right k0min ( Max.max N 4 ), le_max_left N 4, le_max_right N 4 ] ) ; specialize hN s ( by linarith [ le_max_left k0min ( Max.max N 4 ), le_max_right k0min ( Max.max N 4 ), le_max_left N 4, le_max_right N 4 ] ) ; simp_all +decide [ Rw ] ;
  exact h_labelBound_le.trans ( hk0min.trans ( Real.exp_le_exp.mpr ( by simpa only [ mul_assoc, mul_div_assoc ] using hN ) ) )

end GlobalControl

end

