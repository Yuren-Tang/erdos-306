/-
  BernoulliCharacteristic.lean

  Characteristic-function estimates for Bernoulli random variables.

  Core facts:
  1. The characteristic function of a Bernoulli(θ) variable at frequency t is
     φ(t) = 1 - θ + θ · exp(2πit) = 1 - θ(1 - exp(2πit)).
  2. |φ(t)|² = 1 - 4θ(1-θ)sin²(πt).
  3. For θ ∈ [θ₀, 1-θ₀], |φ(t)| ≤ exp(-c·‖t‖²) where ‖t‖ = min_{n∈ℤ}|t-n|.
  4. Products of these factors inherit exponential decay.
-/
import Mathlib.Algebra.Order.Star.Real
import Mathlib.Analysis.CStarAlgebra.Classes
import Mathlib.Analysis.SpecialFunctions.Pow.Real

open Real BigOperators Complex

noncomputable section

/-! ## 1. Bernoulli characteristic function -/

/-- The characteristic function of a Bernoulli(θ) variable at frequency t:
    φ_θ(t) = (1 - θ) + θ · exp(2πit). -/
def bernoulliCharFun (θ t : ℝ) : ℂ :=
  (1 - θ : ℝ) + θ * Complex.exp (2 * Real.pi * t * Complex.I)

/-
|φ_θ(t)|² = 1 - 4θ(1-θ)sin²(πt).
-/
theorem bernoulliCharFun_normSq (θ t : ℝ) :
    Complex.normSq (bernoulliCharFun θ t) =
    1 - 4 * θ * (1 - θ) * Real.sin (Real.pi * t) ^ 2 := by
  unfold bernoulliCharFun; norm_num [ Complex.normSq, Complex.exp_re, Complex.exp_im ] ; ring_nf;
  rw [ Real.sin_sq, Real.cos_sq ] ; ring_nf;
  rw [ Real.sin_sq, Real.cos_sq ] ; ring_nf

/-
For θ ∈ [θ₀, 1-θ₀] with 0 < θ₀ ≤ 1/2, the Bernoulli characteristic
    function satisfies |φ_θ(t)|² ≤ 1 - c·sin²(πt) with c = 4θ₀(1-θ₀).
-/
theorem bernoulliCharFun_normSq_le (θ₀ θ t : ℝ)
    (hθ₀ : 0 < θ₀) (hθ₀' : θ₀ ≤ 1/2) (hθ : θ₀ ≤ θ) (hθ' : θ ≤ 1 - θ₀) :
    Complex.normSq (bernoulliCharFun θ t) ≤
    1 - 4 * θ₀ * (1 - θ₀) * Real.sin (Real.pi * t) ^ 2 := by
  rw [ bernoulliCharFun_normSq ];
  exact sub_le_sub_left ( mul_le_mul_of_nonneg_right ( by nlinarith ) ( sq_nonneg _ ) ) _

/-- The Bernoulli characteristic function is a contraction: `‖φ_θ(t)‖ ≤ 1` for
`θ ∈ [0,1]`.  This is what lets product estimates discard factors at will
(`RequestProject.norm_prod_le_prod_of_subset`). -/
lemma bernoulliCharFun_norm_le_one (θ t : ℝ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) :
    ‖bernoulliCharFun θ t‖ ≤ 1 := by
  have hsq : ‖bernoulliCharFun θ t‖ ^ 2 ≤ 1 := by
    rw [← Complex.normSq_eq_norm_sq, bernoulliCharFun_normSq]
    have h1θ : 0 ≤ 1 - θ := by linarith
    have hnonneg :
        0 ≤ 4 * θ * (1 - θ) * Real.sin (Real.pi * t) ^ 2 := by positivity
    nlinarith
  nlinarith [sq_nonneg (‖bernoulliCharFun θ t‖ - 1)]

/-! ## Product decay -/

/-
For independent Bernoulli(θ_e) variables with θ_e ∈ [θ₀, 1-θ₀],
    the product of characteristic functions satisfies
    |∏_e φ_{θ_e}(h/e)| ≤ exp(-c · Q_E(h))
    where c depends only on θ₀.

    This is the fundamental Fourier decay estimate used in the minor arc bound.
-/
theorem product_charFun_bound (θ₀ : ℝ) (hθ₀ : 0 < θ₀) (hθ₀' : θ₀ ≤ 1/2)
    (E : Finset ℕ) (θ : ℕ → ℝ)
    (hθ_lb : ∀ e ∈ E, θ₀ ≤ θ e) (hθ_ub : ∀ e ∈ E, θ e ≤ 1 - θ₀)
    (h : ℕ) :
    ‖∏ e ∈ E, bernoulliCharFun (θ e) (h / (e : ℝ))‖ ≤
    Real.exp (- (2 * θ₀ * (1 - θ₀)) *
      ∑ e ∈ E, Real.sin (Real.pi * (h : ℝ) / (e : ℝ)) ^ 2) := by
  -- Applying the bound from `bernoulliCharFun_normSq_le` to each term in the product.
  have h_prod_bound : ∀ e ∈ E, ‖bernoulliCharFun (θ e) (h / e)‖ ≤ Real.exp (-2 * θ₀ * (1 - θ₀) * (Real.sin (Real.pi * h / e)) ^ 2) := by
    intro e he
    have h_char_bound : ‖bernoulliCharFun (θ e) (h / e)‖^2 ≤ 1 - 4 * θ₀ * (1 - θ₀) * (Real.sin (Real.pi * h / e)) ^ 2 := by
      convert bernoulliCharFun_normSq_le θ₀ ( θ e ) ( h / e ) hθ₀ hθ₀' ( hθ_lb e he ) ( hθ_ub e he ) using 1 ; ring_nf;
      · rw [ Complex.normSq_eq_norm_sq ];
      · ring_nf;
    -- Applying the inequality $1 - x \leq e^{-x}$ with $x = 4θ₀(1-θ₀)sin²(πh/e)$.
    have h_exp_bound : 1 - 4 * θ₀ * (1 - θ₀) * (Real.sin (Real.pi * h / e)) ^ 2 ≤ Real.exp (-4 * θ₀ * (1 - θ₀) * (Real.sin (Real.pi * h / e)) ^ 2) := by
      exact le_trans ( by ring_nf; norm_num ) ( Real.add_one_le_exp _ );
    convert Real.le_sqrt_of_sq_le ( h_char_bound.trans h_exp_bound ) using 1 ; rw [ Real.sqrt_eq_rpow, ← Real.exp_mul ] ; ring_nf;
  calc
    ‖∏ e ∈ E, bernoulliCharFun (θ e) (h / (e : ℝ))‖ =
        ∏ e ∈ E, ‖bernoulliCharFun (θ e) (h / (e : ℝ))‖ := by
          rw [norm_prod]
    _ ≤ ∏ e ∈ E,
        Real.exp (-2 * θ₀ * (1 - θ₀) * Real.sin (Real.pi * h / e) ^ 2) :=
      Finset.prod_le_prod (fun _ _ => norm_nonneg _) h_prod_bound
    _ = Real.exp (- (2 * θ₀ * (1 - θ₀)) *
        ∑ e ∈ E, Real.sin (Real.pi * (h : ℝ) / (e : ℝ)) ^ 2) := by
      rw [← Real.exp_sum]
      congr 1
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro e _
      ring

end
