import RequestProject.Construction.Edges

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# Control and gadget scale data
-/

/-- Component data stable under replacing only `D.Q`. -/
structure ControlGadgetScaleData
    {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b) (N : ℤ) (ρ : ℝ) where
  hρ : 0 ≤ ρ
  hctrlScale : (N : ℝ) ≤ ρ * ((2 ^ D.BS.k0 * 2 ^ D.BS.k0 : ℕ) : ℝ)
  hctrlAvoid : ∀ e ∈ ctrlEdges D.BS, e ∉ T
  r0 : ℕ
  s0 : ℕ
  hgadgetScale : (N : ℝ) ≤ ρ * ((r0 * s0 : ℕ) : ℝ)
  hRlow : ∀ r ∈ D.R, r0 ≤ r
  hSlow : ∀ s ∈ D.S, s0 ≤ s
  hRprime : ∀ r ∈ D.R, Nat.Prime r
  hSprime : ∀ s ∈ D.S, Nat.Prime s
  hlt : ∀ r ∈ D.R, ∀ s ∈ D.S, r < s
  hgadgetAvoid : ∀ e ∈ gadgetEdges D.R D.S, e ∉ T
  hRdvd : ∀ r ∈ D.R, r ∣ b
  hSblock : D.S ⊆ blockSupport D.BS

end CircleMethod

end
