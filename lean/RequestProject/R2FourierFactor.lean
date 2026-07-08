import RequestProject.R2ExtraMinorLane

open Finset BigOperators

noncomputable section

namespace CircleMethod

/-!
# Single-factor control for the R2 extra lane

The extra-minor lane asks for a bridge from the full Fourier summand norm to one
chosen gadget Bernoulli factor.  This is the singleton instance of the master
estimate `fourierNormWeight_le_prod_norm_of_subset`.
-/

/-- The full Fourier summand norm is controlled by any Bernoulli factor whose
edge lies in `E`. -/
lemma fourierNormWeight_le_factor_of_mem
    (E : Finset ℕ) (theta : ℕ → ℝ) (b L h e0 : ℕ)
    (he0mem : e0 ∈ E)
    (hθ0 : ∀ e ∈ E, 0 ≤ theta e)
    (hθ1 : ∀ e ∈ E, theta e ≤ 1)
    (heL : ∀ e ∈ E, e ∣ L)
    (hepos : ∀ e ∈ E, 0 < e)
    (hL : 0 < L) :
    fourierNormWeight E theta b L h
      ≤ ‖bernoulliCharFun (theta e0) ((h : ℝ) / (e0 : ℝ))‖ := by
  simpa using fourierNormWeight_le_prod_norm_of_subset E theta b L h {e0}
    (Finset.singleton_subset_iff.mpr he0mem) hθ0 hθ1 heL hepos hL

/-- Concrete `hfactor` for the extra lane, using the selected gadget edge
`rfun h * sfun h`. -/
lemma r2_extra_hfactor_of_gadget_mem
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D)
    (N : ℤ) (MA : MainArcFields D.E W.theta b D.L N)
    (Sblock Sextra : Finset ℕ)
    (rfun sfun : ℕ → ℕ)
    (heL : ∀ e ∈ D.E, e ∣ D.L)
    (hepos : ∀ e ∈ D.E, 0 < e)
    (hL : 0 < D.L)
    (hmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      rfun h * sfun h ∈ D.E) :
    ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      fourierNormWeight D.E W.theta b D.L h
        ≤ ‖bernoulliCharFun (W.theta (rfun h * sfun h))
            ((h : ℝ) / ((rfun h : ℝ) * (sfun h : ℝ)))‖ := by
  intro h hh
  have hfactor := fourierNormWeight_le_factor_of_mem D.E W.theta b D.L h
    (rfun h * sfun h) (hmem h hh)
    (fun e he => by
      have hle := W.hlb e he
      norm_num at hle ⊢
      linarith)
    (fun e he => by
      have hle := W.hub e he
      norm_num at hle ⊢
      linarith)
    heL hepos hL
  simpa [Nat.cast_mul] using hfactor

/-- Extra-minor data after the single-factor bridge has been discharged.

Compared with `R2ExtraMinorWitnessData`, this record replaces the opaque
`hfactor` field by the concrete membership condition
`rfun h * sfun h ∈ D.E`; `r2_extraMinorWitnessData_of_gadgetMemData` below fills
the old `hfactor` automatically. -/
structure R2ExtraMinorGadgetMemData
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (MA : MainArcFields D.E W.theta b D.L N)
    (Sblock Sextra : Finset ℕ)
    (Bextra : ℝ) where
  rfun : ℕ → ℕ
  sfun : ℕ → ℕ
  mfun : ℕ → ℤ
  Dmp : ℝ
  hr : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Nat.Prime (rfun h)
  hs : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Nat.Prime (sfun h)
  hrs : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, rfun h ≠ sfun h
  hmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, rfun h * sfun h ∈ D.E
  hθlb : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, 1 / 3 ≤ W.theta (rfun h * sfun h)
  hθub : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, W.theta (rfun h * sfun h) ≤ 2 / 3
  hm_s : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    (h : ZMod (sfun h)) = (mfun h : ZMod (sfun h))
  hm_r : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    (h : ZMod (rfun h)) ≠ (mfun h : ZMod (rfun h))
  hm_small : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    2 * |mfun h| < (sfun h : ℤ)
  hDmp : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    Real.sqrt (1 - (8 / 9) / (rfun h : ℝ) ^ 2) ≤ Dmp
  hbudget : ((extraMinorPart MA.Sm Sblock Sextra).card : ℝ) * Dmp ≤ Bextra

/-- Convert gadget-membership extra data into the older witness record by
filling the single-factor bridge automatically. -/
def r2_extraMinorWitnessData_of_gadgetMemData
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (MA : MainArcFields D.E W.theta b D.L N)
    (Sblock Sextra : Finset ℕ)
    (Bextra : ℝ)
    (heL : ∀ e ∈ D.E, e ∣ D.L)
    (hepos : ∀ e ∈ D.E, 0 < e)
    (hL : 0 < D.L)
    (X : R2ExtraMinorGadgetMemData D W N MA Sblock Sextra Bextra) :
    R2ExtraMinorWitnessData D W N MA Sblock Sextra Bextra where
  rfun := X.rfun
  sfun := X.sfun
  thetaExtra := fun h => W.theta (X.rfun h * X.sfun h)
  mfun := X.mfun
  Dmp := X.Dmp
  hr := X.hr
  hs := X.hs
  hrs := X.hrs
  hθlb := X.hθlb
  hθub := X.hθub
  hm_s := X.hm_s
  hm_r := X.hm_r
  hm_small := X.hm_small
  hDmp := X.hDmp
  hfactor := r2_extra_hfactor_of_gadget_mem D W N MA Sblock Sextra
    X.rfun X.sfun heL hepos hL X.hmem
  hbudget := X.hbudget

/-- The gadget-membership extra data directly yields the extra-minor budget. -/
theorem r2_extra_minor_budget_of_gadgetMemData
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (MA : MainArcFields D.E W.theta b D.L N)
    (Sblock Sextra : Finset ℕ)
    (Bextra : ℝ)
    (heL : ∀ e ∈ D.E, e ∣ D.L)
    (hepos : ∀ e ∈ D.E, 0 < e)
    (hL : 0 < D.L)
    (X : R2ExtraMinorGadgetMemData D W N MA Sblock Sextra Bextra) :
    ∑ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      fourierNormWeight D.E W.theta b D.L h ≤ Bextra :=
  r2_extra_minor_budget_of_witnessData D W N MA Sblock Sextra Bextra
    (r2_extraMinorWitnessData_of_gadgetMemData D W N MA Sblock Sextra Bextra
      heL hepos hL X)

end CircleMethod

end
