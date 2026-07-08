import Mathlib.Analysis.Complex.Basic

/-!
# Subset domination for finite products of contractions

If every factor of a finite complex product has modulus at most one, the
modulus of the whole product is dominated by the product over *any* subset of
the factors of any pointwise bounds valid there: the remaining factors can
simply be discarded.

This single mechanism drives all three product estimates in the circle-method
construction: full-product decay (bound every factor, `S = E`), single-factor
control (keep one factor, `S = {e₀}`), and multi-gadget damping (keep the
gadget factors, constant bound). See `docs/construction-redesign.md`, node P2.
-/

open Finset BigOperators

namespace RequestProject

/-- **Subset domination.** For a finite product of complex factors of modulus
at most one, discard all factors outside `S` and bound the rest pointwise. -/
lemma norm_prod_le_prod_of_subset {α : Type*} [DecidableEq α]
    (E S : Finset α) (F : α → ℂ) (g : α → ℝ)
    (hSE : S ⊆ E)
    (hF1 : ∀ e ∈ E, ‖F e‖ ≤ 1)
    (hFg : ∀ e ∈ S, ‖F e‖ ≤ g e) :
    ‖∏ e ∈ E, F e‖ ≤ ∏ e ∈ S, g e := by
  rw [norm_prod, ← Finset.prod_sdiff hSE]
  calc (∏ e ∈ E \ S, ‖F e‖) * ∏ e ∈ S, ‖F e‖
      ≤ 1 * ∏ e ∈ S, g e := by
        refine mul_le_mul ?_ ?_ ?_ zero_le_one
        · exact Finset.prod_le_one (fun e _ => norm_nonneg _)
            (fun e he => hF1 e (Finset.mem_sdiff.mp he).1)
        · exact Finset.prod_le_prod (fun e _ => norm_nonneg _) hFg
        · exact Finset.prod_nonneg (fun e _ => norm_nonneg _)
    _ = ∏ e ∈ S, g e := one_mul _

/-- Constant-bound corollary: `‖∏_E F‖ ≤ D ^ |S|` when the kept factors are
uniformly bounded by `D ≥ 0`. -/
lemma norm_prod_le_pow_of_subset {α : Type*} [DecidableEq α]
    (E S : Finset α) (F : α → ℂ) (D : ℝ)
    (hSE : S ⊆ E)
    (hF1 : ∀ e ∈ E, ‖F e‖ ≤ 1)
    (hD0 : 0 ≤ D)
    (hFD : ∀ e ∈ S, ‖F e‖ ≤ D) :
    ‖∏ e ∈ E, F e‖ ≤ D ^ S.card := by
  simpa using norm_prod_le_prod_of_subset E S F (fun _ => D) hSE hF1 hFD

end RequestProject
