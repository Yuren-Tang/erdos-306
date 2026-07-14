import RequestProject.Core.ShortIntervalCongruence
import Lean.Elab.Tactic.Grind
import Mathlib.Data.Int.Interval
import Mathlib.RingTheory.Int.Basic

/-!
# Linear congruences in a short interval

For a prime modulus `q`, a nonzero residue `w`, and `X ≤ q`, fixing `u` leaves
at most two solutions `p ∈ [X, 2X]` to `u p ≡ w (mod q)`. Summing over a
symmetric interval of possible `u` gives the corresponding pair count.
-/

open Finset

namespace RequestProject

/-- Bounded pairs `(u,p)` satisfying the linear congruence
`u p ≡ w (mod q)`. -/
noncomputable def boundedLinearCongruencePairs
    (X q U : ℕ) (w : ℤ) : Finset (ℤ × ℕ) :=
  ((Finset.Icc (-(U : ℤ)) U) ×ˢ (Finset.Icc X (2 * X))).filter
    fun up => (q : ℤ) ∣ up.1 * up.2 - w

/-- For fixed `u`, a nonzero residue modulo a prime determines at most two
representatives in `[X,2X]`. -/
lemma linearCongruence_fiber_card_le_two
    (X q : ℕ) (hq : q.Prime) (hXq : X ≤ q) (w : ℤ)
    (hw : ¬ (q : ℤ) ∣ w) (u : ℤ) :
    ((Finset.Icc X (2 * X)).filter
      (fun p : ℕ => (q : ℤ) ∣ u * (p : ℤ) - w)).card ≤ 2 := by
  apply card_le_two_of_dvd_sub_of_mem_Icc X (2 * X) q
  · omega
  · intro p hp
    exact (Finset.mem_filter.mp hp).1
  · intro p hp p' hp'
    have hpdata := (Finset.mem_filter.mp hp).2
    have hpdata' := (Finset.mem_filter.mp hp').2
    have hu : ¬ (q : ℤ) ∣ u := by
      intro hqu
      apply hw
      exact by simpa using dvd_sub (hqu.mul_right p) hpdata
    have hmul : (q : ℤ) ∣ u * ((p : ℤ) - p') := by
      rw [show u * ((p : ℤ) - p') = (u * p - w) - (u * p' - w) by ring]
      exact dvd_sub hpdata hpdata'
    exact (Int.Prime.dvd_mul' hq hmul).resolve_left hu

/-- The bounded solution set has cardinality at most `2(2U+1)`. -/
theorem boundedLinearCongruencePairs_card_le
    (X q U : ℕ) (hq : q.Prime) (hXq : X ≤ q)
    (w : ℤ) (hw : ¬ (q : ℤ) ∣ w) :
    (boundedLinearCongruencePairs X q U w).card ≤ 2 * (2 * U + 1) := by
  have key : ∀ u ∈ Finset.Icc (-(U : ℤ)) U,
      (Finset.filter (fun up => up.1 = u)
        (boundedLinearCongruencePairs X q U w)).card ≤ 2 := by
    intro u _hu
    have h_bij :
        Finset.filter (fun up => up.1 = u)
            (boundedLinearCongruencePairs X q U w) ⊆
          Finset.image (fun p : ℕ => (u, p))
            (Finset.filter (fun p => (q : ℤ) ∣ u * (p : ℤ) - w)
              (Finset.Icc X (2 * X))) := by
      grind +locals
    refine le_trans (Finset.card_le_card h_bij) ?_
    rw [Finset.card_image_of_injective _ fun x y hxy => by injection hxy]
    exact linearCongruence_fiber_card_le_two X q hq hXq w hw u
  convert Finset.sum_le_sum key using 1
  · rfl
  · rw [← Finset.card_eq_sum_card_fiberwise]
    exact fun x hx => Finset.mem_Icc.mpr <| Finset.mem_Icc.mp <|
      Finset.mem_product.mp (Finset.mem_filter.mp hx).1 |>.1
  · norm_num [two_mul, add_assoc]
    grind

end RequestProject
