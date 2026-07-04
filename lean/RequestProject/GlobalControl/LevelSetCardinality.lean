import RequestProject.GlobalControl.EnergyDataAdmissibility
import RequestProject.GlobalControl.LabelAdmissibility
import RequestProject.GlobalControl.LevelSetCover

/-!
# Cardinality of global energy level sets

The finite encoding cover turns admissibility of its coordinates and an
aggregate fiber estimate into a cardinality bound for a global energy level
set.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- An admissible finite encoding bounds a global energy level set by the sum
of its fiber cardinalities. -/
lemma global_levelset_card_le_of_encoded_fiber_sum
    (BS : BlockSystem) (eps c2 e0 X0 R A : ℝ)
    (hR0 : 0 ≤ R)
    (hX0 : X0 ≤ (2:ℝ) ^ BS.k0)
    (hpen : ∀ a : GlobalAssignment BS, Qctrl BS a ≤ R →
        ∀ k, BS.k0 ≤ k → k < BS.K → X0 ≤ (2:ℝ) ^ k →
        k ∈ boundarySet BS c2 a → Pifloor BS e0 k ≤ Xen BS a k)
    (hdom : ∀ a : GlobalAssignment BS, Qctrl BS a ≤ R →
        ∀ k, BS.k0 ≤ k → k ≤ BS.K → k ∉ hotSet BS c2 a →
        LocalEnergy.HasDominantLabel (2 ^ k) (BS.P k) (restrict BS a k) (1/4))
    (hlabels : ∀ a : GlobalAssignment BS, Qctrl BS a ≤ R →
        extLabel BS a (hotSet BS c2 a) (boundarySet BS c2 a)
          ∈ admLabels BS c2 R (hotSet BS c2 a) (boundarySet BS c2 a))
    (hsum : (∑ H ∈ admH BS c2 R, ∑ B ∈ admB BS e0 R, ∑ v ∈ admShells BS c2 R H,
        ∑ ℓ ∈ admLabels BS c2 R H B, (fiber BS H B v ℓ).card : ℝ) ≤
        Real.exp (A * (numBlocks BS : ℝ)) *
          Real.exp (8 * eps * R) * (1 + Real.sqrt R / sigmaCtrl BS)) :
    (Set.ncard {a : GlobalAssignment BS | Qctrl BS a ≤ R} : ℝ) ≤
      Real.exp (A * (numBlocks BS : ℝ)) *
        Real.exp (8 * eps * R) * (1 + Real.sqrt R / sigmaCtrl BS) := by
  have hbridge : ({a : GlobalAssignment BS | Qctrl BS a ≤ R}).ncard
      = (Finset.univ.filter (fun a : GlobalAssignment BS => Qctrl BS a ≤ R)).card := by
    rw [Set.ncard_eq_toFinset_card', Set.toFinset_setOf]
  have hcov := cover_card_le BS c2 e0 R
    (fun a ha => hotSet_mem_admH BS c2 a R ha)
    (fun a ha => boundarySet_mem_admB BS c2 e0 X0 R a hX0 (hpen a ha) ha)
    (fun a ha => extShell_mem_admShells BS c2 R a hR0 ha)
    hlabels
    (fun a ha => cold_class_of_isDominant BS c2 a (hdom a ha))
  calc (Set.ncard {a : GlobalAssignment BS | Qctrl BS a ≤ R} : ℝ)
      = ((Finset.univ.filter (fun a : GlobalAssignment BS => Qctrl BS a ≤ R)).card : ℝ) := by
        rw [hbridge]
    _ ≤ (∑ H ∈ admH BS c2 R, ∑ B ∈ admB BS e0 R, ∑ v ∈ admShells BS c2 R H,
          ∑ ℓ ∈ admLabels BS c2 R H B, (fiber BS H B v ℓ).card : ℝ) := by exact_mod_cast hcov
    _ ≤ _ := hsum

end GlobalControl

end
