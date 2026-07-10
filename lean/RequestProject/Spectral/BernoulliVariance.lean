import RequestProject.Spectral.BernoulliSum

/-!
# Positivity of the Bernoulli variance

Elementary sign properties of `sigmaE2`, separated from the Fourier data so
modules that only mention the variance do not elaborate these proofs.
-/

open Finset BigOperators

noncomputable section

namespace CircleMethod

lemma sigmaE2_nonneg (E : Finset ℕ) (θ : ℕ → ℝ)
    (hlb : ∀ e ∈ E, 1 / 3 ≤ θ e) (hub : ∀ e ∈ E, θ e ≤ 2 / 3) :
    0 ≤ sigmaE2 E θ := by
  unfold sigmaE2
  refine Finset.sum_nonneg (fun e he => ?_)
  have h1 := hlb e he
  have h2 := hub e he
  have : 0 ≤ θ e * (1 - θ e) := by nlinarith
  positivity

/-- The variance is positive for a nonempty set of positive denominators and
weights in `[1/3, 2/3]`. -/
lemma sigmaE2_pos (E : Finset ℕ) (θ : ℕ → ℝ) (hne : E.Nonempty)
    (he0 : ∀ e ∈ E, 0 < e)
    (hlb : ∀ e ∈ E, 1 / 3 ≤ θ e) (hub : ∀ e ∈ E, θ e ≤ 2 / 3) :
    0 < sigmaE2 E θ := by
  obtain ⟨e0, he0'⟩ := hne
  unfold sigmaE2
  apply Finset.sum_pos'
  · intro e he
    have h1 := hlb e he
    have h2 := hub e he
    have : 0 ≤ θ e * (1 - θ e) := by nlinarith
    positivity
  · refine ⟨e0, he0', ?_⟩
    have h1 := hlb e0 he0'
    have h2 := hub e0 he0'
    have hθ : 0 < θ e0 * (1 - θ e0) := by nlinarith
    have hepos : 0 < (e0 : ℝ) := by exact_mod_cast he0 e0 he0'
    positivity

end CircleMethod

end
