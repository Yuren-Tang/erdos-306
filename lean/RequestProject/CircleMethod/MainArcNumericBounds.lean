import RequestProject.CircleMethodMainArc
import RequestProject.Spectral.BernoulliSum

open Finset BigOperators

noncomputable section

namespace CircleMethod

/-!
# Main-arc numeric bounds

This leaf collects abstract, reusable helper lemmas for the large-window
main-arc fields `hN`, `htw`, and `hsmall` of `ArcConstruction`.  They are
deliberately independent of the concrete parameter choices and of the final
`exists_arcConstruction` assembly.
-/

/-- The main-window scale is nonnegative.  Since `1 / Real.sqrt _ ≥ 0`
unconditionally (`Real.sqrt _ ≥ 0`), the scale hypothesis `1/√σ² ≤ N` forces
`0 ≤ N`. -/
lemma mainArc_N_nonneg_of_inv_sqrt_le
    (E : Finset ℕ) (theta : ℕ → ℝ) (N : ℤ)
    (hN : (1 : ℝ) / Real.sqrt (sigmaE2 E theta) ≤ (N : ℝ)) :
    0 ≤ N := by
  have h0 : (0 : ℝ) ≤ 1 / Real.sqrt (sigmaE2 E theta) := by positivity
  have hNr : (0 : ℝ) ≤ (N : ℝ) := le_trans h0 hN
  exact_mod_cast hNr

/-- `htw` from a uniform edge lower bound: if every edge `e ∈ E` satisfies
`10 * N ≤ e`, then for every label `m ∈ [-N, N]` and every edge,
`|m / e| ≤ 1/10`. -/
lemma htw_of_window_edge_lower
    (E : Finset ℕ) (N : ℤ)
    (_hNnonneg : 0 ≤ N)
    (he0 : ∀ e ∈ E, 0 < e)
    (hedge : ∀ e ∈ E, (10 : ℝ) * (N : ℝ) ≤ (e : ℝ)) :
    ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ E,
      |(m : ℝ) / (e : ℝ)| ≤ 1 / 10 := by
  intro m hm e he
  rw [Finset.mem_Icc] at hm
  have hepos : (0 : ℝ) < (e : ℝ) := by exact_mod_cast he0 e he
  have hedge' : (10 : ℝ) * (N : ℝ) ≤ (e : ℝ) := hedge e he
  have hl : -(N : ℝ) ≤ (m : ℝ) := by exact_mod_cast hm.1
  have hr : (m : ℝ) ≤ (N : ℝ) := by exact_mod_cast hm.2
  have hmle : |(m : ℝ)| ≤ (N : ℝ) := abs_le.mpr ⟨hl, hr⟩
  rw [abs_div, abs_of_pos hepos, div_le_iff₀ hepos]
  linarith [hmle, hedge']

/-- Trivial pass-through giving the final assembly a stable name for `hsmall`. -/
lemma hsmall_of_cubic_sum_bound
    (E : Finset ℕ) (N : ℤ)
    (hbound : ∀ m ∈ Finset.Icc (-N) N,
      (∑ e ∈ E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤
        bernoulliMainTermRemainderBudget) :
    ∀ m ∈ Finset.Icc (-N) N,
      (∑ e ∈ E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤
        bernoulliMainTermRemainderBudget :=
  hbound

/-- `hsmall` from a uniform ratio bound and a cardinality/cubic-load bound. -/
lemma hsmall_of_uniform_ratio_bound
    (E : Finset ℕ) (N : ℤ) (ρ : ℝ)
    (_hρnonneg : 0 ≤ ρ)
    (hratio : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ E,
      |(m : ℝ) / (e : ℝ)| ≤ ρ)
    (hcard : (E.card : ℝ) * bernoulliTaylorRemainderConstant * ρ ^ 3 ≤
      bernoulliMainTermRemainderBudget) :
    ∀ m ∈ Finset.Icc (-N) N,
      (∑ e ∈ E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤
        bernoulliMainTermRemainderBudget := by
  intro m hm
  have hsum :
      (∑ e ∈ E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3)
        ≤ ∑ _e ∈ E, bernoulliTaylorRemainderConstant * ρ ^ 3 := by
    apply Finset.sum_le_sum
    intro e he
    have hr := hratio m hm e he
    have hab : |(m : ℝ) / (e : ℝ)| ≤ ρ := hr
    have hC := bernoulliTaylorRemainderConstant_nonneg
    gcongr
  have hconst :
      (∑ _e ∈ E, bernoulliTaylorRemainderConstant * ρ ^ 3) =
        (E.card : ℝ) * bernoulliTaylorRemainderConstant * ρ ^ 3 := by
    rw [Finset.sum_const, nsmul_eq_mul]; ring
  rw [hconst] at hsum
  exact le_trans hsum hcard

/-- Packaged numeric/main-arc fields for the `ArcConstruction` record. -/
structure MainArcNumericBounds (E : Finset ℕ) (theta : ℕ → ℝ) (N : ℤ) where
  hN : (1 : ℝ) / Real.sqrt (sigmaE2 E theta) ≤ (N : ℝ)
  hNnonneg : 0 ≤ N
  htw : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ E,
    |(m : ℝ) / (e : ℝ)| ≤ bernoulliTaylorRadius
  hsmall : ∀ m ∈ Finset.Icc (-N) N,
    (∑ e ∈ E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤
      bernoulliMainTermRemainderBudget

/-- Constructor for `MainArcNumericBounds` from the scale hypothesis, a uniform
edge lower bound, a uniform ratio bound, and a cubic-load cardinality bound. -/
def mainArcNumericBounds_of
    (E : Finset ℕ) (theta : ℕ → ℝ) (N : ℤ) (ρ : ℝ)
    (hN : (1 : ℝ) / Real.sqrt (sigmaE2 E theta) ≤ (N : ℝ))
    (he0 : ∀ e ∈ E, 0 < e)
    (hedge : ∀ e ∈ E, (10 : ℝ) * (N : ℝ) ≤ (e : ℝ))
    (hρnonneg : 0 ≤ ρ)
    (hratio : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ E,
      |(m : ℝ) / (e : ℝ)| ≤ ρ)
    (hcard : (E.card : ℝ) * bernoulliTaylorRemainderConstant * ρ ^ 3 ≤
      bernoulliMainTermRemainderBudget) :
    MainArcNumericBounds E theta N where
  hN := hN
  hNnonneg := mainArc_N_nonneg_of_inv_sqrt_le E theta N hN
  htw := htw_of_window_edge_lower E N
    (mainArc_N_nonneg_of_inv_sqrt_le E theta N hN) he0 hedge
  hsmall := hsmall_of_uniform_ratio_bound E N ρ hρnonneg hratio hcard

end CircleMethod
