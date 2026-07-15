import RequestProject.Spectral.BernoulliCharacteristic
import RequestProject.Spectral.MainArcParameters
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds

open Complex Finset BigOperators Real

noncomputable section

namespace CircleMethod

/-!
# Bernoulli logarithm expansion on the main arc

Foundation for the positive main term. The per-edge complex Taylor estimate rests on
the second-order log remainder `log(1−w) = −w − w²/2 + O(w³)` (Mathlib's
`norm_log_sub_logTaylor_le` at order 2, with `logTaylor 3 (−w) = −w − w²/2`).
-/

/-- **Second-order logarithmic remainder.** For `‖w‖ < 1`,
`‖log(1−w) − (−w − w²/2)‖ ≤ ‖w‖³ · (1−‖w‖)⁻¹ / 3`. -/
lemma log_one_sub_remainder (w : ℂ) (hw : ‖w‖ < 1) :
    ‖Complex.log (1 - w) - (-w - w ^ 2 / 2)‖ ≤ ‖w‖ ^ 3 * (1 - ‖w‖)⁻¹ / 3 := by
  have hz : ‖-w‖ < 1 := by rwa [norm_neg]
  have h := norm_log_sub_logTaylor_le 2 hz
  have ht : logTaylor 3 (-w) = -w - w ^ 2 / 2 := by
    have hrfl : logTaylor 3 (-w)
        = ∑ j ∈ Finset.range 3, (-1) ^ (j + 1) * (-w) ^ j / (j : ℂ) := rfl
    rw [hrfl, Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one]
    norm_num; ring
  rw [ht, show (1 : ℂ) + (-w) = 1 - w by ring, norm_neg] at h
  norm_num at h ⊢
  linarith [h]

/-- A unit-scale exponential perturbation loses at most twice its norm in real
part. -/
lemma one_sub_two_norm_le_exp_re (δ : ℂ) (hδ : ‖δ‖ ≤ 1) :
    1 - 2 * ‖δ‖ ≤ (Complex.exp δ).re := by
  have hexp : ‖Complex.exp δ - 1‖ ≤ 2 * ‖δ‖ :=
    Complex.norm_exp_sub_one_le hδ
  have hre : |(Complex.exp δ - 1).re| ≤ ‖Complex.exp δ - 1‖ :=
    Complex.abs_re_le_norm _
  have hid : (Complex.exp δ).re = 1 + (Complex.exp δ - 1).re := by
    rw [Complex.sub_re, Complex.one_re]
    ring
  rw [hid]
  linarith [(abs_le.mp (hre.trans hexp)).1]

/-- **L1: per-edge Bernoulli Taylor** (note 44).  For `θ ∈ [1/3,2/3]` and
`|t| ≤ 1/10`, `log φ_θ(t) = 2πiθt − 2π²θ(1−θ)t² + O(|t|³)` with an absolute
constant.  Built from `log_one_sub_remainder` + `Complex.exp_bound`. -/
private lemma bernoulli_log_taylor_explicit (θ t : ℝ) (hθlb : 1/3 ≤ θ) (hθub : θ ≤ 2/3)
    (ht : |t| ≤ 1 / 10) :
    ‖Complex.log (bernoulliCharFun θ t) -
        (2*Real.pi*θ*t*Complex.I - 2*Real.pi^2*θ*(1-θ)*t^2)‖ ≤
      100000 * |t|^3 := by
  have hθ0 : (0:ℝ) ≤ θ := le_trans (by norm_num) hθlb
  have hpi : (0:ℝ) < Real.pi := Real.pi_pos
  have ht0 : (0:ℝ) ≤ |t| := abs_nonneg t
  have ht2 : |t|^2 ≤ |t|/10 := by nlinarith [ht, ht0]
  have ht3 : |t|^3 ≤ |t|^2/10 := by nlinarith [ht, ht0, sq_nonneg t, pow_nonneg ht0 2]
  have ht3b : |t|^3 ≤ |t|/100 := by nlinarith [ht2, ht3, ht0]
  set z : ℂ := ((2*Real.pi*t : ℝ):ℂ) * Complex.I with hzdef
  have hZ : ‖z‖ = 2*Real.pi*|t| := by
    rw [hzdef, norm_mul, Complex.norm_I, mul_one, Complex.norm_real, Real.norm_eq_abs]
    rw [abs_mul, abs_mul, abs_of_pos (by norm_num : (0:ℝ)<2), abs_of_pos hpi]
  have hZt : ‖z‖ ≤ 8*|t| := by rw [hZ]; nlinarith [Real.pi_le_four, ht0]
  have hZ0 : (0:ℝ) ≤ ‖z‖ := norm_nonneg z
  have hZle : ‖z‖ ≤ 1 := by linarith [hZt, ht]
  have hZsq : ‖z‖^2 ≤ 64*|t|^2 := by
    calc ‖z‖^2 ≤ (8*|t|)^2 := by gcongr
      _ = 64*|t|^2 := by ring
  set s : ℂ := Complex.exp z - 1 with hsdef
  set r3 : ℂ := s - z - z^2/2 with hr3def
  have hr3 : ‖r3‖ ≤ (2/9) * ‖z‖^3 := by
    have hb := Complex.exp_bound hZle (n := 3) (by norm_num)
    have he : (∑ m ∈ Finset.range 3, z^m / (m.factorial:ℂ)) = 1 + z + z^2/2 := by
      simp [Finset.sum_range_succ]
    rw [he, show Complex.exp z - (1 + z + z^2/2) = r3 from by rw [hr3def, hsdef]; ring] at hb
    refine le_trans hb (le_of_eq ?_)
    norm_num [Nat.factorial]; ring
  have hr3t : ‖r3‖ ≤ 114 * |t|^3 := by
    have h8 : ‖z‖^3 ≤ 512*|t|^3 := by
      calc ‖z‖^3 ≤ (8*|t|)^3 := by gcongr
        _ = 512*|t|^3 := by ring
    linarith [hr3, h8, pow_nonneg ht0 3]
  have hbern : bernoulliCharFun θ t = 1 + (θ:ℂ) * s := by
    rw [bernoulliCharFun, hsdef, hzdef]; push_cast; ring
  have hsval : s = z + z^2/2 + r3 := by rw [hr3def]; ring
  have hsb : ‖s‖ ≤ ‖z‖ + ‖z‖^2/2 + ‖r3‖ := by
    rw [hsval]
    calc ‖z + z^2/2 + r3‖ ≤ ‖z + z^2/2‖ + ‖r3‖ := norm_add_le _ _
      _ ≤ ‖z‖ + ‖z^2/2‖ + ‖r3‖ := by linarith [norm_add_le z (z^2/2)]
      _ = ‖z‖ + ‖z‖^2/2 + ‖r3‖ := by rw [norm_div, norm_pow]; norm_num
  have hst : ‖s‖ ≤ 13 * |t| := by linarith [hsb, hZt, hZsq, hr3t, ht2, ht3b, pow_nonneg ht0 2]
  have hNeq : ‖(θ:ℂ)*s‖ = θ * ‖s‖ := by
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hθ0]
  have hN9 : ‖(θ:ℂ)*s‖ ≤ 9 * |t| := by
    rw [hNeq]
    have hmul : θ * ‖s‖ ≤ (2/3)*(13*|t|) :=
      mul_le_mul hθub hst (norm_nonneg s) (by norm_num)
    linarith [hmul]
  have hNhalf : ‖(θ:ℂ)*s‖ ≤ 9/10 := by linarith [hN9, ht]
  have hN0 : (0:ℝ) ≤ ‖(θ:ℂ)*s‖ := norm_nonneg _
  have hNlt1 : ‖(θ:ℂ)*s‖ < 1 := by linarith [hNhalf]
  have hA := log_one_sub_remainder (-(↑θ*s)) (by rw [norm_neg]; exact hNlt1)
  rw [show (1:ℂ) - (-(↑θ*s)) = bernoulliCharFun θ t from by rw [hbern]; ring,
    show -(-(↑θ*s)) - (-(↑θ*s))^2/2 = (↑θ*s - (↑θ*s)^2/2) from by ring, norm_neg] at hA
  set T : ℂ := 2*Real.pi*θ*t*Complex.I - 2*Real.pi^2*θ*(1-θ)*t^2 with hTdef
  have hT : T = (↑θ)*z + (↑θ)*(1-↑θ)*z^2/2 := by
    rw [hTdef, hzdef, mul_pow, Complex.I_sq]; push_cast; ring
  have hB : (↑θ*s - (↑θ*s)^2/2) - T = (↑θ)^2*(z^2-s^2)/2 + ↑θ*r3 := by
    rw [hT, hr3def]; ring
  have hzs_fac : z^2 - s^2 = (z - s)*(z + s) := by ring
  have hzms : ‖z - s‖ ≤ ‖z‖^2/2 + ‖r3‖ := by
    rw [show z - s = -(z^2/2 + r3) from by rw [hsval]; ring, norm_neg]
    calc ‖z^2/2 + r3‖ ≤ ‖z^2/2‖ + ‖r3‖ := norm_add_le _ _
      _ = ‖z‖^2/2 + ‖r3‖ := by rw [norm_div, norm_pow]; norm_num
  have hzps : ‖z + s‖ ≤ 2*‖z‖ + ‖z‖^2/2 + ‖r3‖ := by
    rw [show z + s = 2*z + z^2/2 + r3 from by rw [hsval]; ring]
    calc ‖2*z + z^2/2 + r3‖ ≤ ‖2*z + z^2/2‖ + ‖r3‖ := norm_add_le _ _
      _ ≤ ‖2*z‖ + ‖z^2/2‖ + ‖r3‖ := by linarith [norm_add_le (2*z) (z^2/2)]
      _ = 2*‖z‖ + ‖z‖^2/2 + ‖r3‖ := by rw [norm_mul, norm_div, norm_pow]; norm_num
  have hzms_t : ‖z - s‖ ≤ 80 * |t|^2 := by
    nlinarith only [hzms, hZsq, hr3t, ht3, pow_nonneg ht0 2]
  have hzps_t : ‖z + s‖ ≤ 21 * |t| := by
    nlinarith only [hzps, hZt, hZsq, hr3t, ht2, ht3b, pow_nonneg ht0 2]
  have hzsq_t : ‖z^2 - s^2‖ ≤ 1680 * |t|^3 := by
    rw [hzs_fac, norm_mul]
    calc ‖z - s‖ * ‖z + s‖ ≤ (80*|t|^2) * (21*|t|) :=
          mul_le_mul hzms_t hzps_t (norm_nonneg _) (by positivity)
      _ = 1680 * |t|^3 := by ring
  have hBnorm : ‖(↑θ*s - (↑θ*s)^2/2) - T‖ ≤ 1000 * |t|^3 := by
    rw [hB]
    have hsplit : ‖(↑θ:ℂ)^2*(z^2-s^2)/2 + ↑θ*r3‖ ≤ θ^2*‖z^2-s^2‖/2 + θ*‖r3‖ := by
      calc ‖(↑θ:ℂ)^2*(z^2-s^2)/2 + ↑θ*r3‖
          ≤ ‖(↑θ:ℂ)^2*(z^2-s^2)/2‖ + ‖(↑θ:ℂ)*r3‖ := norm_add_le _ _
        _ = θ^2*‖z^2-s^2‖/2 + θ*‖r3‖ := by
            rw [norm_div, norm_mul, norm_mul, norm_pow, Complex.norm_real, Real.norm_eq_abs,
              abs_of_nonneg hθ0]; norm_num
    refine le_trans hsplit ?_
    have hb1 : θ^2*‖z^2-s^2‖/2 ≤ (2/3)^2*(1680*|t|^3)/2 := by
      have : θ^2 ≤ (2/3)^2 := by nlinarith only [hθub, hθ0]
      nlinarith only [this, hzsq_t, norm_nonneg (z^2-s^2), pow_nonneg ht0 3]
    have hb2 : θ*‖r3‖ ≤ (2/3)*(114*|t|^3) := mul_le_mul hθub hr3t (norm_nonneg r3) (by norm_num)
    nlinarith only [hb1, hb2, pow_nonneg ht0 3]
  have hAbnd : ‖Complex.log (bernoulliCharFun θ t) - (↑θ*s - (↑θ*s)^2/2)‖ ≤ 99000 * |t|^3 := by
    refine le_trans hA ?_
    have hinv : (1 - ‖(θ:ℂ)*s‖)⁻¹ ≤ 10 := by
      rw [inv_le_comm₀ (by linarith [hNhalf]) (by norm_num)]; linarith [hNhalf]
    have hcube : ‖(θ:ℂ)*s‖^3 ≤ (9*|t|)^3 := by gcongr
    have hstep : ‖(θ:ℂ)*s‖^3 * (1 - ‖(θ:ℂ)*s‖)⁻¹ / 3 ≤ (9*|t|)^3 * 10 / 3 := by
      apply div_le_div_of_nonneg_right _ (by norm_num)
      exact mul_le_mul hcube hinv (inv_nonneg.mpr (by linarith [hNhalf])) (by positivity)
    refine le_trans hstep ?_
    have : (9*|t|)^3 = 729*|t|^3 := by ring
    rw [this]
    nlinarith only [pow_nonneg ht0 3]
  calc ‖Complex.log (bernoulliCharFun θ t) - T‖
      = ‖(Complex.log (bernoulliCharFun θ t) - (↑θ*s - (↑θ*s)^2/2)) +
          ((↑θ*s - (↑θ*s)^2/2) - T)‖ := by ring_nf
    _ ≤ ‖Complex.log (bernoulliCharFun θ t) - (↑θ*s - (↑θ*s)^2/2)‖ +
          ‖(↑θ*s - (↑θ*s)^2/2) - T‖ := norm_add_le _ _
    _ ≤ 99000 * |t|^3 + 1000 * |t|^3 := add_le_add hAbnd hBnorm
    _ = 100000 * |t|^3 := by ring

private lemma exists_bernoulli_taylor_remainder_constant :
    ∃ C : ℝ, 0 < C ∧
      ∀ θ t : ℝ, 1 / 3 ≤ θ → θ ≤ 2 / 3 → |t| ≤ bernoulliTaylorRadius →
        ‖Complex.log (bernoulliCharFun θ t) -
            (2 * Real.pi * θ * t * Complex.I -
              2 * Real.pi ^ 2 * θ * (1 - θ) * t ^ 2)‖ ≤ C * |t| ^ 3 := by
  refine ⟨100000, by norm_num, ?_⟩
  intro θ t hθlb hθub ht
  exact bernoulli_log_taylor_explicit θ t hθlb hθub (by simpa [bernoulliTaylorRadius] using ht)

/-- A supplied cubic remainder coefficient for the Bernoulli logarithm estimate.
Its numerical witness is confined to the analytic existence proof above. -/
noncomputable def bernoulliTaylorRemainderConstant : ℝ :=
  Classical.choose exists_bernoulli_taylor_remainder_constant

lemma bernoulliTaylorRemainderConstant_pos :
    0 < bernoulliTaylorRemainderConstant :=
  (Classical.choose_spec exists_bernoulli_taylor_remainder_constant).1

lemma bernoulliTaylorRemainderConstant_nonneg :
    0 ≤ bernoulliTaylorRemainderConstant :=
  bernoulliTaylorRemainderConstant_pos.le

/-- **L1: per-edge Bernoulli Taylor** (note 44), stated only through the
supplied remainder coefficient. -/
lemma bernoulli_log_taylor (θ t : ℝ) (hθlb : 1 / 3 ≤ θ) (hθub : θ ≤ 2 / 3)
    (ht : |t| ≤ bernoulliTaylorRadius) :
    ‖Complex.log (bernoulliCharFun θ t) -
        (2 * Real.pi * θ * t * Complex.I -
          2 * Real.pi ^ 2 * θ * (1 - θ) * t ^ 2)‖ ≤
      bernoulliTaylorRemainderConstant * |t| ^ 3 :=
  (Classical.choose_spec exists_bernoulli_taylor_remainder_constant).2
    θ t hθlb hθub ht

/-- **L2 foundation** (no branch issue): a finite product of nonzero complex
numbers equals `exp` of the sum of their `Complex.log`s. -/
lemma prod_eq_exp_sum_log {ι : Type*} (E : Finset ι) (f : ι → ℂ)
    (hf : ∀ e ∈ E, f e ≠ 0) :
    ∏ e ∈ E, f e = Complex.exp (∑ e ∈ E, Complex.log (f e)) := by
  rw [Complex.exp_sum]
  exact Finset.prod_congr rfl (fun e he => (Complex.exp_log (hf e he)).symm)

/-- **L2 (generic): summed Bernoulli Taylor.** Summing `bernoulli_log_taylor` over
any edge set with weights in `[1/3,2/3]` and `|t e| ≤ 1/10`. -/
lemma sum_bernoulli_log_taylor {ι : Type*} (E : Finset ι) (θ t : ι → ℝ)
    (hlb : ∀ e ∈ E, 1/3 ≤ θ e) (hub : ∀ e ∈ E, θ e ≤ 2/3)
    (ht : ∀ e ∈ E, |t e| ≤ bernoulliTaylorRadius) :
    ‖(∑ e ∈ E, Complex.log (bernoulliCharFun (θ e) (t e))) -
        ∑ e ∈ E, (2*Real.pi*(θ e)*(t e)*Complex.I
          - 2*Real.pi^2*(θ e)*(1-(θ e))*(t e)^2)‖
      ≤ ∑ e ∈ E, bernoulliTaylorRemainderConstant * |t e|^3 := by
  rw [← Finset.sum_sub_distrib]
  refine le_trans (norm_sum_le _ _) ?_
  exact Finset.sum_le_sum (fun e he =>
    bernoulli_log_taylor (θ e) (t e) (hlb e he) (hub e he) (ht e he))

end CircleMethod

end
