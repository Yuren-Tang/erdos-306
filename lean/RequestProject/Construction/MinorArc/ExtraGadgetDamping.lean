import RequestProject.CircleMethod.MinorArcCover
import RequestProject.Construction.Edges
import RequestProject.ExtraMinorDamping
import RequestProject.CircleMethod.MainArcPeriodicity

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# Multi-gadget Fourier damping

Given a fixed denominator prime `r` and a
chosen set of block-side gadget primes `G`, how much does multiplying in
their Fourier factors damp the Bernoulli summand? Two answers of
increasing strength: a plain product bound (`fourierNormWeight_le_prod_norm_of_subset`
instantiated at the gadget edges) and, when the gadget primes also witness a
label mismatch, a genuine `< 1` per-factor decay
(`gadget_charFun_damp`) raised to the gadget count.

This estimate does not choose the gadgets or the denominator prime; that is
`Construction.MinorArc.ExtraSiblingChoice`, a separate mechanism (choosing witnesses
vs. bounding the damping once witnesses are fixed).

-/

/-- The selected gadget edge set for a fixed denominator prime `r` and a set of
block-side primes `G`. -/
def multiGadgetEdges (r : ℕ) (G : Finset ℕ) : Finset ℕ :=
  G.image fun s => r * s

/-- Multiplication by a positive `r` is injective on natural numbers. -/
lemma mul_left_injective_nat {r : ℕ} (hr : 0 < r) :
    Function.Injective fun s : ℕ => r * s := by
  intro s t h
  exact Nat.eq_of_mul_eq_mul_left hr h

/-- Cardinality of the selected gadget edge set. -/
lemma card_multiGadgetEdges (r : ℕ) (G : Finset ℕ) (hr : 0 < r) :
    (multiGadgetEdges r G).card = G.card := by
  unfold multiGadgetEdges
  exact Finset.card_image_of_injective G (mul_left_injective_nat hr)

/-- The full Fourier summand is bounded by the product of the selected gadget
factors: the multi-factor instance of
`fourierNormWeight_le_prod_norm_of_subset` with `S = multiGadgetEdges r G`. -/
lemma fourierNormWeight_le_multi_gadget_product
    (E : Finset ℕ) (theta : ℕ → ℝ) (b L h r : ℕ) (G : Finset ℕ)
    (hrpos : 0 < r)
    (hGmem : multiGadgetEdges r G ⊆ E)
    (hθ0 : ∀ e ∈ E, 0 ≤ theta e)
    (hθ1 : ∀ e ∈ E, theta e ≤ 1)
    (heL : ∀ e ∈ E, e ∣ L)
    (hepos : ∀ e ∈ E, 0 < e)
    (hL : 0 < L) :
    fourierNormWeight E theta b L h
      ≤ ∏ s ∈ G,
          ‖bernoulliCharFun (theta (r * s))
            ((h : ℝ) / ((r : ℝ) * (s : ℝ)))‖ := by
  classical
  refine le_trans
    (fourierNormWeight_le_prod_norm_of_subset E theta b L h
      (multiGadgetEdges r G) hGmem hθ0 hθ1 heL hepos hL) ?_
  unfold multiGadgetEdges
  rw [Finset.prod_image]
  · simp [Nat.cast_mul]
  · intro s hs t ht hst
    exact Nat.eq_of_mul_eq_mul_left hrpos hst

/-- Multi-gadget pointwise damping for one frequency. -/
lemma fourierNormWeight_le_multi_gadget_damp
    (E : Finset ℕ) (theta : ℕ → ℝ) (b L h r : ℕ) (m : ℤ) (G : Finset ℕ)
    (hr : Nat.Prime r)
    (hs : ∀ s ∈ G, Nat.Prime s)
    (hrs : ∀ s ∈ G, r ≠ s)
    (hGmem : multiGadgetEdges r G ⊆ E)
    (hθlb : ∀ s ∈ G, 1 / 3 ≤ theta (r * s))
    (hθub : ∀ s ∈ G, theta (r * s) ≤ 2 / 3)
    (hm_s : ∀ s ∈ G, (h : ZMod s) = (m : ZMod s))
    (hm_r : (h : ZMod r) ≠ (m : ZMod r))
    (hm_small : ∀ s ∈ G, 2 * |m| < (s : ℤ))
    (hθ0 : ∀ e ∈ E, 0 ≤ theta e)
    (hθ1 : ∀ e ∈ E, theta e ≤ 1)
    (heL : ∀ e ∈ E, e ∣ L)
    (hepos : ∀ e ∈ E, 0 < e)
    (hL : 0 < L) :
    fourierNormWeight E theta b L h
      ≤ (Real.sqrt (1 - (8 / 9) / (r : ℝ) ^ 2)) ^ G.card := by
  classical
  refine le_trans
    (fourierNormWeight_le_multi_gadget_product E theta b L h r G
      hr.pos hGmem hθ0 hθ1 heL hepos hL) ?_
  have hprod :
      ∏ s ∈ G,
          ‖bernoulliCharFun (theta (r * s))
            ((h : ℝ) / ((r : ℝ) * (s : ℝ)))‖
        ≤ ∏ _s ∈ G, Real.sqrt (1 - (8 / 9) / (r : ℝ) ^ 2) := by
    refine Finset.prod_le_prod (fun s _ => norm_nonneg _) ?_
    intro s hsG
    exact gadget_charFun_damp r s hr (hs s hsG) (hrs s hsG)
      (theta (r * s)) (hθlb s hsG) (hθub s hsG) h m
      (hm_s s hsG) hm_r (hm_small s hsG)
  simpa using hprod

/-- Multi-gadget extra-minor data after the pointwise product damping has been
proved.  The field `Gset h` is the finite set of block-side gadget primes used
for frequency `h`, while `damp h` is the per-frequency damping base. -/
structure ExtraMinorMultiGadgetBound
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (Bextra : ℝ) where
  rfun : ℕ → ℕ
  Gset : ℕ → Finset ℕ
  mfun : ℕ → ℤ
  damp : ℕ → ℝ
  hRmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, rfun h ∈ D.R
  hSmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Gset h ⊆ D.S
  hm_s : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
    (h : ZMod s) = (mfun h : ZMod s)
  hm_r : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    (h : ZMod (rfun h)) ≠ (mfun h : ZMod (rfun h))
  hm_small : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
    2 * |mfun h| < (s : ℤ)
  hfactorMulti : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    fourierNormWeight D.E W.theta (D.L / b) D.L h ≤ damp h ^ (Gset h).card
  hbudget :
    ∑ h ∈ extraMinorPart MA.Sm Sblock Sextra, damp h ^ (Gset h).card ≤ Bextra

/-- Multi-gadget extra data gives the extra-minor norm-sum budget. -/
theorem extraMinor_budget_of_multiGadgetBound
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ) (Bextra : ℝ)
    (X : ExtraMinorMultiGadgetBound D W N MA Sblock Sextra Bextra) :
    ∑ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      fourierNormWeight D.E W.theta (D.L / b) D.L h ≤ Bextra := by
  exact le_trans (Finset.sum_le_sum X.hfactorMulti) X.hbudget

end CircleMethod

end
