import RequestProject.GlobalControl.Encoding.Fibers

/-!
# Product bound for encoded fibers

A blockwise counting estimate multiplies to a cardinality bound for the
corresponding global encoding fiber.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- Per-fiber product bound: given the per-block count bound (from
    `hot_block_count`/`fixed_label_block_count`), a fiber's cardinality is at most the product of
    `exp(2ε(v k+1))` over the blocks. -/
lemma fiber_prod_bound (BS : BlockSystem) (H B : Finset ℕ) (v : ℕ → ℕ) (ℓ : ℕ → ℤ)
    (eps : ℝ)
    (hcnt : ∀ k ∈ Finset.Icc BS.k0 BS.K,
        ((Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
            QP (BS.P k) b ≤ (v k : ℝ) + 1 ∧
            (k ∉ H → (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
              (((BS.P k).attach.filter
                (fun p => b p = ((ℓ (RequestProject.segmentStart BS.k0 H B k) : ℤ) : ZMod (p : ℕ)))).card : ℝ)))).card : ℝ)
          ≤ Real.exp (2 * eps * ((v k : ℝ) + 1))) :
    ((fiber BS H B v ℓ).card : ℝ) ≤
      ∏ k ∈ Finset.Icc BS.k0 BS.K, Real.exp (2 * eps * ((v k : ℝ) + 1)) := by
  have h1 := fiber_card_le BS H B v ℓ
  calc ((fiber BS H B v ℓ).card : ℝ)
      ≤ ((∏ k ∈ Finset.Icc BS.k0 BS.K,
          (Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
            QP (BS.P k) b ≤ (v k : ℝ) + 1 ∧
            (k ∉ H → (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
              (((BS.P k).attach.filter
                (fun p => b p = ((ℓ (RequestProject.segmentStart BS.k0 H B k) : ℤ) : ZMod (p : ℕ)))).card : ℝ)))).card : ℕ) : ℝ) := by
        exact_mod_cast h1
    _ = ∏ k ∈ Finset.Icc BS.k0 BS.K,
          ((Finset.univ.filter (fun b : BlockAssignment (BS.P k) =>
            QP (BS.P k) b ≤ (v k : ℝ) + 1 ∧
            (k ∉ H → (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
              (((BS.P k).attach.filter
                (fun p => b p = ((ℓ (RequestProject.segmentStart BS.k0 H B k) : ℤ) : ZMod (p : ℕ)))).card : ℝ)))).card : ℝ) := by
        push_cast; rfl
    _ ≤ ∏ k ∈ Finset.Icc BS.k0 BS.K, Real.exp (2 * eps * ((v k : ℝ) + 1)) :=
        Finset.prod_le_prod (fun k _ => by positivity) hcnt

end GlobalControl

end

