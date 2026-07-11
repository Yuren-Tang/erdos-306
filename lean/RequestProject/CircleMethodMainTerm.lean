import RequestProject.CircleMethodMainArc
import RequestProject.Spectral.BernoulliVariance

open Complex Finset BigOperators Real

noncomputable section

namespace CircleMethod

/-!
# Bernoulli main-arc estimate

Builds the positive real main term of the circle method from the per-edge Taylor
expansion `bernoulli_log_taylor` and the diagonal Gaussian lower bound
`main_arc_gaussian_lower`.  Everything here is self-contained over an edge
set `E : Finset ℕ` (edge value `val(e) = e`), weights `θ`, and a rational
Fourier target `q/L`, with mass identity `∑_e θ_e/e = q/L`; no `BlockSystem`
is needed.  The final theorem `main_sum_re_lower` reindexes this label sum as
the low-frequency Fourier sum used by spectral selection.
-/

/-- **Non-vanishing of the Bernoulli factor on the main arc.**  For `θ ∈ [1/3,2/3]`
and `|t| ≤ 1/10`, `φ_θ(t) ≠ 0`.  (Indeed `|φ|² ≥ cos²(πt) > 0`.) -/
lemma bernoulliCharFun_ne_zero_main (θ t : ℝ) (hlb : 1/3 ≤ θ) (hub : θ ≤ 2/3)
    (ht : |t| ≤ 1/10) :
    bernoulliCharFun θ t ≠ 0 := by
  have hns : Complex.normSq (bernoulliCharFun θ t)
      = 1 - 4 * θ * (1 - θ) * Real.sin (Real.pi * t) ^ 2 := bernoulliCharFun_normSq θ t
  -- 4θ(1-θ) ≤ 1
  have hcoef : 4 * θ * (1 - θ) ≤ 1 := by nlinarith [sq_nonneg (2 * θ - 1)]
  have hcoef0 : 0 ≤ 4 * θ * (1 - θ) := by nlinarith
  -- cos(πt) > 0 since |πt| < π/2
  have hpi : 0 < Real.pi := Real.pi_pos
  have htlt : |Real.pi * t| < Real.pi / 2 := by
    rw [abs_mul, abs_of_pos hpi]
    nlinarith [ht, abs_nonneg t]
  have hcos : 0 < Real.cos (Real.pi * t) := by
    apply Real.cos_pos_of_mem_Ioo
    rw [Set.mem_Ioo]
    constructor
    · linarith [neg_abs_le (Real.pi * t), htlt]
    · linarith [le_abs_self (Real.pi * t), htlt]
  have hsin : Real.sin (Real.pi * t) ^ 2 ≤ 1 := by
    nlinarith [Real.sin_sq_add_cos_sq (Real.pi * t), sq_nonneg (Real.cos (Real.pi * t))]
  -- normSq ≥ 1 - 4θ(1-θ)·sin² ≥ cos² > 0
  have hpos : 0 < Complex.normSq (bernoulliCharFun θ t) := by
    rw [hns]
    have hcos2 : Real.cos (Real.pi * t) ^ 2 = 1 - Real.sin (Real.pi * t) ^ 2 := by
      nlinarith [Real.sin_sq_add_cos_sq (Real.pi * t)]
    nlinarith [mul_pos hcos hcos, hcoef, hcoef0,
      Real.sin_sq_add_cos_sq (Real.pi * t), sq_nonneg (Real.sin (Real.pi*t))]
  intro hzero
  rw [hzero, Complex.normSq_zero] at hpos
  exact lt_irrefl 0 hpos

/-- The summed log of the Bernoulli factors at the
diagonal label `m` expands to `2πi(mq/L) − 2π²m²σ_E²` up to a cubic remainder,
the linear coefficient being pinned to `q/L` by the **mass identity**. -/
lemma sum_logphi_bound (E : Finset ℕ) (θ : ℕ → ℝ) (q L : ℕ) (m : ℤ)
    (hlb : ∀ e ∈ E, 1/3 ≤ θ e) (hub : ∀ e ∈ E, θ e ≤ 2/3)
    (hmass : (∑ e ∈ E, θ e / (e : ℝ)) = (q : ℝ) / (L : ℝ))
    (ht : ∀ e ∈ E, |(m : ℝ) / (e : ℝ)| ≤ 1/10) :
    ‖(∑ e ∈ E, Complex.log (bernoulliCharFun (θ e) ((m:ℝ)/(e:ℝ))))
        - (2*Real.pi*((m:ℝ)*(q:ℝ)/(L:ℝ))*Complex.I
            - 2*Real.pi^2*(m:ℝ)^2*((sigmaE2 E θ : ℝ) : ℂ))‖
      ≤ ∑ e ∈ E, 100000 * |(m:ℝ)/(e:ℝ)|^3 := by
  have hstep := sum_bernoulli_log_taylor E θ (fun e => (m:ℝ)/(e:ℝ)) hlb hub ht
  -- mass identity over ℂ
  have hmassC : (∑ e ∈ E, (θ e : ℂ) / (e : ℂ)) = (q : ℂ) / (L : ℂ) := by
    have hcast : (∑ e ∈ E, (θ e : ℂ) / (e : ℂ))
        = ((∑ e ∈ E, θ e / (e:ℝ) : ℝ) : ℂ) := by push_cast; rfl
    rw [hcast, hmass]; push_cast; ring
  -- σ_E² over ℂ
  have hsigC : ((sigmaE2 E θ : ℝ) : ℂ) = ∑ e ∈ E, (θ e : ℂ) * (1 - (θ e : ℂ)) / (e : ℂ)^2 := by
    unfold sigmaE2
    rw [Complex.ofReal_sum]
    refine Finset.sum_congr rfl (fun e he => ?_)
    push_cast; ring
  -- the key sum identity: ∑ (linImag − quad) = newTGT
  have key : (∑ e ∈ E, (2*(Real.pi:ℂ)*(θ e:ℂ)*((((m:ℝ)/(e:ℝ)):ℝ):ℂ)*Complex.I
                - 2*(Real.pi:ℂ)^2*(θ e:ℂ)*(1-(θ e:ℂ))*((((m:ℝ)/(e:ℝ)):ℝ):ℂ)^2))
            = 2*Real.pi*((m:ℝ)*(q:ℝ)/(L:ℝ))*Complex.I
                - 2*Real.pi^2*(m:ℝ)^2*((sigmaE2 E θ : ℝ) : ℂ) := by
    rw [Finset.sum_sub_distrib]
    congr 1
    · -- linear part: ∑ 2π θe (m/e) I = 2π (mq/L) I
      have hlin : (∑ e ∈ E, 2*(Real.pi:ℂ)*(θ e:ℂ)*((((m:ℝ)/(e:ℝ)):ℝ):ℂ)*Complex.I)
          = 2*(Real.pi:ℂ)*Complex.I*(m:ℂ)*(∑ e ∈ E, (θ e : ℂ)/(e : ℂ)) := by
        rw [Finset.mul_sum]
        refine Finset.sum_congr rfl (fun e he => ?_)
        push_cast; ring
      rw [hlin, hmassC]; push_cast; ring
    · -- quadratic part: ∑ 2π² θe(1-θe)(m/e)² = 2π²m² ∑ θe(1-θe)/e²
      rw [hsigC, Finset.mul_sum]
      refine Finset.sum_congr rfl (fun e he => ?_)
      push_cast; ring
  rw [key] at hstep
  exact hstep

/-- The main-arc term equals the real Gaussian
`exp(−2π²m²σ_E²)` times `exp(δ)`, where `δ` is the cubic Taylor remainder. -/
lemma term_label_eq (E : Finset ℕ) (θ : ℕ → ℝ) (q L : ℕ) (m : ℤ)
    (hlb : ∀ e ∈ E, 1/3 ≤ θ e) (hub : ∀ e ∈ E, θ e ≤ 2/3)
    (ht : ∀ e ∈ E, |(m : ℝ) / (e : ℝ)| ≤ 1/10) :
    term_label E θ q L m
      = ((Real.exp (-(2*Real.pi^2*(m:ℝ)^2*(sigmaE2 E θ))) : ℝ) : ℂ)
          * Complex.exp ((∑ e ∈ E, Complex.log (bernoulliCharFun (θ e) ((m:ℝ)/(e:ℝ))))
              - (2*Real.pi*((m:ℝ)*(q:ℝ)/(L:ℝ))*Complex.I
                  - 2*Real.pi^2*(m:ℝ)^2*((sigmaE2 E θ : ℝ) : ℂ))) := by
  set δ : ℂ := (∑ e ∈ E, Complex.log (bernoulliCharFun (θ e) ((m:ℝ)/(e:ℝ))))
      - (2*Real.pi*((m:ℝ)*(q:ℝ)/(L:ℝ))*Complex.I
          - 2*Real.pi^2*(m:ℝ)^2*((sigmaE2 E θ : ℝ) : ℂ)) with hδ
  have hne : ∀ e ∈ E, bernoulliCharFun (θ e) ((m:ℝ)/(e:ℝ)) ≠ 0 :=
    fun e he => bernoulliCharFun_ne_zero_main (θ e) _ (hlb e he) (hub e he) (ht e he)
  have hprod : (∏ e ∈ E, bernoulliCharFun (θ e) ((m:ℝ)/(e:ℝ)))
      = Complex.exp (∑ e ∈ E, Complex.log (bernoulliCharFun (θ e) ((m:ℝ)/(e:ℝ)))) :=
    prod_eq_exp_sum_log E _ hne
  unfold term_label
  rw [hprod, ← Complex.exp_add, Complex.ofReal_exp, ← Complex.exp_add]
  congr 1
  rw [hδ]; push_cast; ring

/-- When the cubic remainder is small (`≤ 1/10`), the
real part of the main-arc term is at least `0.8` times the Gaussian. -/
lemma term_label_re_lower (E : Finset ℕ) (θ : ℕ → ℝ) (q L : ℕ) (m : ℤ)
    (hlb : ∀ e ∈ E, 1/3 ≤ θ e) (hub : ∀ e ∈ E, θ e ≤ 2/3)
    (hmass : (∑ e ∈ E, θ e / (e : ℝ)) = (q : ℝ) / (L : ℝ))
    (ht : ∀ e ∈ E, |(m : ℝ) / (e : ℝ)| ≤ 1/10)
    (hsmall : (∑ e ∈ E, 100000 * |(m:ℝ)/(e:ℝ)|^3) ≤ 1/10) :
    0.8 * Real.exp (-(2*Real.pi^2*(m:ℝ)^2*(sigmaE2 E θ))) ≤ (term_label E θ q L m).re := by
  rw [term_label_eq E θ q L m hlb hub ht]
  set G : ℝ := Real.exp (-(2*Real.pi^2*(m:ℝ)^2*(sigmaE2 E θ))) with hGdef
  have hGpos : 0 < G := Real.exp_pos _
  set δ : ℂ := (∑ e ∈ E, Complex.log (bernoulliCharFun (θ e) ((m:ℝ)/(e:ℝ))))
      - (2*Real.pi*((m:ℝ)*(q:ℝ)/(L:ℝ))*Complex.I
          - 2*Real.pi^2*(m:ℝ)^2*((sigmaE2 E θ : ℝ) : ℂ)) with hδdef
  -- ‖δ‖ ≤ 1/10
  have hδnorm : ‖δ‖ ≤ 1/10 := by
    rw [hδdef]
    exact le_trans (sum_logphi_bound E θ q L m hlb hub hmass ht) hsmall
  have hδle1 : ‖δ‖ ≤ 1 := by linarith [hδnorm]
  -- (exp δ).re ≥ 0.8
  have hre : (0.8 : ℝ) ≤ (Complex.exp δ).re := by
    linarith [one_sub_two_norm_le_exp_re δ hδle1, hδnorm]
  -- combine
  have hmulre : (((G:ℂ)) * Complex.exp δ).re = G * (Complex.exp δ).re := by
    simp [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im]
  rw [hmulre]
  nlinarith [mul_le_mul_of_nonneg_left hre hGpos.le, hGpos]

/-- The diagonal main sum over the label window
`[-N, N]` has real part `≥ c₃/σ_E` with `c₃ = 0.8·e^{-π²/2}/2`. -/
lemma main_re_lower (E : Finset ℕ) (θ : ℕ → ℝ) (q L : ℕ) (N : ℤ)
    (hne : E.Nonempty) (he0 : ∀ e ∈ E, 0 < e)
    (hlb : ∀ e ∈ E, 1/3 ≤ θ e) (hub : ∀ e ∈ E, θ e ≤ 2/3)
    (hmass : (∑ e ∈ E, θ e / (e : ℝ)) = (q : ℝ) / (L : ℝ))
    (hN : (1:ℝ) / Real.sqrt (sigmaE2 E θ) ≤ (N:ℝ))
    (ht : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ E, |(m : ℝ) / (e : ℝ)| ≤ 1/10)
    (hsmall : ∀ m ∈ Finset.Icc (-N) N, (∑ e ∈ E, 100000 * |(m:ℝ)/(e:ℝ)|^3) ≤ 1/10) :
    0.8 * (Real.exp (-(Real.pi^2/2)) / 2) / Real.sqrt (sigmaE2 E θ)
      ≤ (∑ m ∈ Finset.Icc (-N) N, term_label E θ q L m).re := by
  set σ := Real.sqrt (sigmaE2 E θ) with hσdef
  have hσ2pos : 0 < sigmaE2 E θ := sigmaE2_pos E θ hne he0 hlb hub
  have hσpos : 0 < σ := Real.sqrt_pos.mpr hσ2pos
  have hσsq : σ ^ 2 = sigmaE2 E θ := Real.sq_sqrt hσ2pos.le
  rw [Complex.re_sum]
  calc 0.8 * (Real.exp (-(Real.pi^2/2)) / 2) / σ
      = 0.8 * (Real.exp (-(Real.pi^2/2)) / 2 / σ) := by ring
    _ ≤ 0.8 * (∑ m ∈ Finset.Icc (-N) N, Real.exp (-(2*Real.pi^2*σ^2)*(m:ℝ)^2)) := by
        apply mul_le_mul_of_nonneg_left _ (by norm_num)
        exact main_arc_gaussian_lower σ hσpos N hN
    _ = ∑ m ∈ Finset.Icc (-N) N, 0.8 * Real.exp (-(2*Real.pi^2*σ^2)*(m:ℝ)^2) := by
        rw [Finset.mul_sum]
    _ ≤ ∑ m ∈ Finset.Icc (-N) N, (term_label E θ q L m).re := by
        refine Finset.sum_le_sum (fun m hm => ?_)
        have hgauss : Real.exp (-(2*Real.pi^2*σ^2)*(m:ℝ)^2)
            = Real.exp (-(2*Real.pi^2*(m:ℝ)^2*(sigmaE2 E θ))) := by
          congr 1; rw [hσsq]; ring
        rw [hgauss]
        exact term_label_re_lower E θ q L m hlb hub hmass (ht m hm) (hsmall m hm)

/-- **Main-arc reindexing.**  Given a label map `lbl` that bijects the main-arc
frequency set `SM` onto the label window `[-N, N]` and identifies the Fourier
term with the diagonal label term (the CRT/periodicity facts the construction
supplies), the real part of the main-arc Fourier sum is `≥ c₃/σ_E`. -/
lemma main_sum_re_lower (E : Finset ℕ) (θ : ℕ → ℝ) (q L : ℕ) (N : ℤ) (SM : Finset ℕ)
    (lbl : ℕ → ℤ)
    (hne : E.Nonempty) (he0 : ∀ e ∈ E, 0 < e)
    (hlb : ∀ e ∈ E, 1/3 ≤ θ e) (hub : ∀ e ∈ E, θ e ≤ 2/3)
    (hmass : (∑ e ∈ E, θ e / (e : ℝ)) = (q : ℝ) / (L : ℝ))
    (hN : (1:ℝ) / Real.sqrt (sigmaE2 E θ) ≤ (N:ℝ))
    (htw : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ E, |(m : ℝ) / (e : ℝ)| ≤ 1/10)
    (hsmall : ∀ m ∈ Finset.Icc (-N) N, (∑ e ∈ E, 100000 * |(m:ℝ)/(e:ℝ)|^3) ≤ 1/10)
    (hmaps : ∀ h ∈ SM, lbl h ∈ Finset.Icc (-N) N)
    (hinj : ∀ h₁ ∈ SM, ∀ h₂ ∈ SM, lbl h₁ = lbl h₂ → h₁ = h₂)
    (hsurj : ∀ m ∈ Finset.Icc (-N) N, ∃ h ∈ SM, lbl h = m)
    (hterm : ∀ h ∈ SM, fourierTerm E θ q L h = term_label E θ q L (lbl h)) :
    0.8 * (Real.exp (-(Real.pi^2/2)) / 2) / Real.sqrt (sigmaE2 E θ)
      ≤ (∑ h ∈ SM, fourierTerm E θ q L h).re := by
  have hsum : (∑ h ∈ SM, fourierTerm E θ q L h)
      = ∑ m ∈ Finset.Icc (-N) N, term_label E θ q L m := by
    rw [Finset.sum_congr rfl hterm]
    exact Finset.sum_bij (fun h _ => lbl h) hmaps hinj
      (fun m hm => by obtain ⟨h, hh, he⟩ := hsurj m hm; exact ⟨h, hh, he⟩)
      (fun h _ => rfl)
  rw [hsum]
  exact main_re_lower E θ q L N hne he0 hlb hub hmass hN htw hsmall

end CircleMethod

end
