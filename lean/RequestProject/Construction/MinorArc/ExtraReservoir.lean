import RequestProject.Construction.MinorArc.ExtraGadgetDamping

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# The multi-gadget reservoir

Once a denominator prime and gadget set have
been chosen for every extra-minor frequency (`Construction.MinorArc.ExtraSiblingChoice`),
how are those per-frequency choices packaged into one object, and how is the
per-frequency damping budget (`Construction.MinorArc.ExtraGadgetDamping`) discharged
into a single finite sum bound? A generic reservoir record
(`MultiGadgetReservoir`), its conversion into the abstract bound data from
`ExtraGadgetDamping`, and a division-free "prepared choice" bridge for the
common case where the choices satisfy a uniform pointwise damping bound.

This module is independent of *how* the per-frequency choices are
produced (CRT sibling selection is `Construction.MinorArc.ExtraSiblingChoice`) — it
only consumes raw choice data and produces the aggregate object.

-/

/-- Finite reservoir data sufficient to build the existing abstract
`ExtraMinorMultiGadgetBound`. -/
structure MultiGadgetReservoir
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b)
    (W : R2ConcreteData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (Bextra : ℝ) where
  rfun : ℕ → ℕ
  Gset : ℕ → Finset ℕ
  mfun : ℕ → ℤ
  hRmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, rfun h ∈ D.R
  hSmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Gset h ⊆ D.S
  hGmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    multiGadgetEdges (rfun h) (Gset h) ⊆ D.E
  hm_s : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
    (h : ZMod s) = (mfun h : ZMod s)
  hm_r : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    (h : ZMod (rfun h)) ≠ (mfun h : ZMod (rfun h))
  hm_small : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
    2 * |mfun h| < (s : ℤ)
  htheta_lb : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
    1 / 3 ≤ W.theta ((rfun h) * s)
  htheta_ub : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
    W.theta ((rfun h) * s) ≤ 2 / 3
  hbudget :
    ∑ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      (Real.sqrt (1 - (8 / 9) / ((rfun h : ℝ) ^ 2))) ^ (Gset h).card
        ≤ Bextra

/-- Division-free finite budget wrapper. -/
theorem sum_pow_le_of_pointwise_le_division_free
    {A : Finset ℕ} {d : ℕ → ℝ} {G : ℕ → Finset ℕ} {C B : ℝ}
    (hcard : (A.card : ℝ) * C ≤ B)
    (hpt : ∀ h ∈ A, d h ^ (G h).card ≤ C) :
    ∑ h ∈ A, d h ^ (G h).card ≤ B := by
  exact le_trans ( Finset.sum_le_sum hpt ) ( by simpa )

/-- Convert a concrete reservoir into the already-existing abstract multi-gadget
extra-minor bound data.  The key proof field is obtained from
`fourierNormWeight_le_multi_gadget_damp`. -/
def multiGadgetBoundData_of_reservoir
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ) (Bextra : ℝ)
    (X : MultiGadgetReservoir D W N MA Sblock Sextra Bextra)
    (hRprime : ∀ r ∈ D.R, Nat.Prime r)
    (hSprime : ∀ s ∈ D.S, Nat.Prime s)
    (hlt : ∀ r ∈ D.R, ∀ s ∈ D.S, r < s)
    (hθ0 : ∀ e ∈ D.E, 0 ≤ W.theta e)
    (hθ1 : ∀ e ∈ D.E, W.theta e ≤ 1)
    (heL : ∀ e ∈ D.E, e ∣ D.L)
    (hepos : ∀ e ∈ D.E, 0 < e)
    (hL : 0 < D.L) :
    ExtraMinorMultiGadgetBound D W N MA Sblock Sextra Bextra :=
  { rfun := X.rfun
    Gset := X.Gset
    mfun := X.mfun
    damp := fun h => Real.sqrt (1 - (8 / 9) / ((X.rfun h : ℝ) ^ 2))
    hRmem := X.hRmem
    hSmem := X.hSmem
    hm_s := X.hm_s
    hm_r := X.hm_r
    hm_small := X.hm_small
    hfactorMulti := fun h hh =>
      fourierNormWeight_le_multi_gadget_damp D.E W.theta (D.L / b) D.L h (X.rfun h)
        (X.mfun h) (X.Gset h) (hRprime _ (X.hRmem h hh))
        (fun s hs => hSprime s (X.hSmem h hh hs))
        (fun s hs => ne_of_lt (hlt _ (X.hRmem h hh) s (X.hSmem h hh hs)))
        (X.hGmem h hh) (X.htheta_lb h hh) (X.htheta_ub h hh) (X.hm_s h hh)
        (X.hm_r h hh) (X.hm_small h hh) hθ0 hθ1 heL hepos hL
    hbudget := X.hbudget }

/-- Prepared per-frequency data for the multi-gadget extra-minor reservoir.

This record deliberately contains only the choices and the arithmetic/budget
facts that do not follow automatically from `D` and `W`.  The theorem below
fills edge membership and theta bounds from `D.gadgetEdges_subset_E` and
`W.hlb`/`W.hub`. -/
structure PreparedExtraReservoir
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b)
    (W : R2ConcreteData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (Bextra : ℝ) where
  rfun : ℕ → ℕ
  Gset : ℕ → Finset ℕ
  mfun : ℕ → ℤ
  hRmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, rfun h ∈ D.R
  hSmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Gset h ⊆ D.S
  hm_s : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
    (h : ZMod s) = (mfun h : ZMod s)
  hm_r : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    (h : ZMod (rfun h)) ≠ (mfun h : ZMod (rfun h))
  hm_small : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
    2 * |mfun h| < (s : ℤ)
  hbudget :
    ∑ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      (Real.sqrt (1 - (8 / 9) / ((rfun h : ℝ) ^ 2))) ^ (Gset h).card
        ≤ Bextra

/-- Prepared per-frequency data gives the concrete multi-gadget reservoir. -/
def multiGadgetReservoir_of_prepared
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b)
    (W : R2ConcreteData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (Bextra : ℝ)
    (X : PreparedExtraReservoir D W N MA Sblock Sextra Bextra) :
    MultiGadgetReservoir D W N MA Sblock Sextra Bextra := by
  have hedge : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ X.Gset h,
      (X.rfun h) * s ∈ D.E := by
    intro h hh s hs
    exact D.gadgetEdges_subset_E
      (mem_gadgetEdges.mpr ⟨X.rfun h, X.hRmem h hh, s, X.hSmem h hh hs, rfl⟩)
  exact
    { rfun := X.rfun
      Gset := X.Gset
      mfun := X.mfun
      hRmem := X.hRmem
      hSmem := X.hSmem
      hm_s := X.hm_s
      hm_r := X.hm_r
      hm_small := X.hm_small
      hbudget := X.hbudget
      hGmem := by
        intro h hh e he
        rw [multiGadgetEdges, Finset.mem_image] at he
        obtain ⟨s, hsG, rfl⟩ := he
        exact hedge h hh s hsG
      htheta_lb := fun h hh s hs => W.hlb _ (hedge h hh s hs)
      htheta_ub := fun h hh s hs => W.hub _ (hedge h hh s hs) }

/-- Division-free constructor for the `hbudget` field of
`PreparedExtraReservoir`.

This is useful when the selected gadget sets have been made uniformly large
enough that every damped power is at most `C`. -/
theorem extraPreparedReservoirBudget_of_pointwise_bound
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b)
    (W : R2ConcreteData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (rfun : ℕ → ℕ) (Gset : ℕ → Finset ℕ)
    (C Bextra : ℝ)
    (hcard :
      ((extraMinorPart MA.Sm Sblock Sextra).card : ℝ) * C ≤ Bextra)
    (hpt : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      (Real.sqrt (1 - (8 / 9) / ((rfun h : ℝ) ^ 2))) ^ (Gset h).card ≤ C) :
    ∑ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      (Real.sqrt (1 - (8 / 9) / ((rfun h : ℝ) ^ 2))) ^ (Gset h).card
        ≤ Bextra :=
  sum_pow_le_of_pointwise_le_division_free hcard hpt

/-- Uniform-budget constructor for `PreparedExtraReservoir`.

Given the per-frequency choices together with the CRT sibling congruences and
small-label bounds, plus a *uniform* pointwise damping bound `C` and the linear
budget inequality `extraPart.card * C ≤ Bextra`, we obtain the prepared choice
record.  The finite budget field is discharged by
`extraPreparedReservoirBudget_of_pointwise_bound`. -/
def preparedChoice_of_pointwise_budget
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b)
    (W : R2ConcreteData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (C Bextra : ℝ)
    (rfun : ℕ → ℕ) (Gset : ℕ → Finset ℕ) (mfun : ℕ → ℤ)
    (hRmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, rfun h ∈ D.R)
    (hSmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Gset h ⊆ D.S)
    (hm_s : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
      (h : ZMod s) = (mfun h : ZMod s))
    (hm_r : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      (h : ZMod (rfun h)) ≠ (mfun h : ZMod (rfun h)))
    (hm_small : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
      2 * |mfun h| < (s : ℤ))
    (hcard :
      ((extraMinorPart MA.Sm Sblock Sextra).card : ℝ) * C ≤ Bextra)
    (hpt : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      (Real.sqrt (1 - (8 / 9) / ((rfun h : ℝ) ^ 2))) ^ (Gset h).card ≤ C) :
    PreparedExtraReservoir D W N MA Sblock Sextra Bextra :=
  { rfun := rfun
    Gset := Gset
    mfun := mfun
    hRmem := hRmem
    hSmem := hSmem
    hm_s := hm_s
    hm_r := hm_r
    hm_small := hm_small
    hbudget :=
      extraPreparedReservoirBudget_of_pointwise_bound
        D W N MA Sblock Sextra rfun Gset C Bextra hcard hpt }

end CircleMethod

end
