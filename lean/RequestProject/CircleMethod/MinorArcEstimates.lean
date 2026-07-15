import RequestProject.CircleMethod.MinorArcDecomposition
import RequestProject.CircleMethod.QuadraticEnergy
import RequestProject.CircleMethod.MinorArcFiberTail
import RequestProject.CircleMethod.ResidueOffsetDamping

open Finset BigOperators Classical Real

noncomputable section

namespace CircleMethod

open GlobalControl

/-!
# Minor-arc estimate interface

`CircleMethod/MinorArcDecomposition.lean` proves the *pure finite-sum splitter*
`sum_le_of_minor_split_bounds`: if `Sm ⊆ Sblock ∪ Sextra` and the two
disjointized parts (`blockMinorPart`, `extraMinorPart`) are bounded by `A` and
`B`, then the full minor sum over `Sm` is bounded by `A + B`.

This leaf connects the two *real analytic estimates* to that splitter:

* `block_part_bound` instantiates the fiber-tail minor-energy estimate
  `minor_energy_sum_le_fiber_tail` on the block part, producing a bound for
  `∑_{blockMinorPart} exp(-c · quadraticEnergy)`;
* `extra_part_bound` sums the residue-offset sibling damping factor
  `bernoulliCharFun_norm_le_of_residue_offset` over the extra part, producing a bound for
  `∑_{extraMinorPart} ‖bernoulliCharFun θ (h/(r·s))‖`.
-/

/-- **Block-part bound.**  The fiber-tail minor-energy estimate
`minor_energy_sum_le_fiber_tail`, specialized so its summing index set is the
disjointized block-minor part `blockMinorPart Sm Sblock`.  All hypotheses are
stated over the block part, so the conclusion is a bound directly on
`∑_{blockMinorPart} exp(-c · quadraticEnergy)`. -/
theorem block_part_bound
    (BS : BlockSystem) (E : Finset ℕ) (c C K : ℝ) (Sm Sblock : Finset ℕ)
    (Qextra : ℕ → ℝ) (hc : 0 ≤ c)
    (hQE : ∀ h ∈ blockMinorPart Sm Sblock,
      Qctrl BS (fun p => ((h : ZMod p.1))) + Qextra h ≤ quadraticEnergy E h)
    (hnotmain : ∀ h ∈ blockMinorPart Sm Sblock,
      (fun p => ((h : ZMod p.1)) : GlobalAssignment BS) ∉ mainArc BS C)
    (hfiber : ∀ a : GlobalAssignment BS,
      ∑ h ∈ (blockMinorPart Sm Sblock).filter
        (fun h => (fun p => ((h : ZMod p.1)) : GlobalAssignment BS) = a),
        Real.exp (-c * Qextra h) ≤ K) :
    ∑ h ∈ blockMinorPart Sm Sblock, Real.exp (-c * quadraticEnergy E h)
      ≤ K * ∑' a : {a : GlobalAssignment BS // a ∉ mainArc BS C},
          Real.exp (-c * Qctrl BS a.1) :=
  minor_energy_sum_le_fiber_tail BS E c C K (blockMinorPart Sm Sblock) Qextra
    hc hQE hnotmain hfiber

/-- **Extra-part bound.**  Sum the per-gadget sibling damping factor
`bernoulliCharFun_norm_le_of_residue_offset` over the disjointized extra-minor part
`extraMinorPart Sm Sblock Sextra`.  Each frequency carries its own gadget data
`(rfun x, sfun x, θ x, mfun x)` satisfying the sibling hypotheses, and `D` is a
uniform upper bound on the per-gadget damping `√(1 − (8/9)/r²)`.  The result is a
bound on `∑_{extraMinorPart} ‖bernoulliCharFun θ (h/(r·s))‖` by
`card · D`. -/
theorem extra_part_bound
    (Sm Sblock Sextra : Finset ℕ)
    (rfun sfun : ℕ → ℕ) (θ : ℕ → ℝ) (mfun : ℕ → ℤ) (D : ℝ)
    (hr : ∀ x ∈ extraMinorPart Sm Sblock Sextra, Nat.Prime (rfun x))
    (hs : ∀ x ∈ extraMinorPart Sm Sblock Sextra, Nat.Prime (sfun x))
    (hrs : ∀ x ∈ extraMinorPart Sm Sblock Sextra, rfun x ≠ sfun x)
    (hθlb : ∀ x ∈ extraMinorPart Sm Sblock Sextra, 1 / 3 ≤ θ x)
    (hθub : ∀ x ∈ extraMinorPart Sm Sblock Sextra, θ x ≤ 2 / 3)
    (hm_s : ∀ x ∈ extraMinorPart Sm Sblock Sextra,
      (x : ZMod (sfun x)) = (mfun x : ZMod (sfun x)))
    (hm_r : ∀ x ∈ extraMinorPart Sm Sblock Sextra,
      (x : ZMod (rfun x)) ≠ (mfun x : ZMod (rfun x)))
    (hm_small : ∀ x ∈ extraMinorPart Sm Sblock Sextra,
      2 * |mfun x| < (sfun x : ℤ))
    (hD : ∀ x ∈ extraMinorPart Sm Sblock Sextra,
      Real.sqrt (1 - (8 / 9) / (rfun x : ℝ) ^ 2) ≤ D) :
    ∑ x ∈ extraMinorPart Sm Sblock Sextra,
        ‖bernoulliCharFun (θ x) ((x : ℝ) / ((rfun x : ℝ) * (sfun x : ℝ)))‖
      ≤ (extraMinorPart Sm Sblock Sextra).card • D := by
  classical
  calc ∑ x ∈ extraMinorPart Sm Sblock Sextra,
          ‖bernoulliCharFun (θ x) ((x : ℝ) / ((rfun x : ℝ) * (sfun x : ℝ)))‖
      ≤ ∑ _x ∈ extraMinorPart Sm Sblock Sextra, D := by
        refine Finset.sum_le_sum (fun x hx => ?_)
        exact le_trans
          (bernoulliCharFun_norm_le_of_residue_offset
            (rfun x) (sfun x) (hr x hx) (hs x hx) (hrs x hx)
            (θ x) (hθlb x hx) (hθub x hx) x (mfun x) (hm_s x hx) (hm_r x hx)
            (hm_small x hx))
          (hD x hx)
    _ = (extraMinorPart Sm Sblock Sextra).card • D := by
        rw [Finset.sum_const]

end CircleMethod

end
