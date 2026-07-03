import RequestProject.GlobalControl.ControlEnergy
import RequestProject.GlobalControl.Encoding.AssignmentData
import RequestProject.GlobalControl.LevelSetParameters

/-!
# Finite cover of a global energy level set

Assignments of bounded control energy are covered by fibers indexed by
admissible hot sets, boundary sets, shell vectors, and label assignments.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- The level set injects into the
    union of fibers indexed by admissible `(H,B,v,ℓ)`; hence its cardinality is
    at most the four-fold sum of fiber cardinalities.  Parametrized by the four
    admissibility facts (proved separately) and the cold-class bound. -/
lemma cover_card_le (BS : BlockSystem) (c2 e0 R : ℝ)
    (hadmH : ∀ a : GlobalAssignment BS, Qctrl BS a ≤ R →
        hotSet BS c2 a ∈ admH BS c2 R)
    (hadmB : ∀ a : GlobalAssignment BS, Qctrl BS a ≤ R →
        boundarySet BS c2 a ∈ admB BS e0 R)
    (hadmS : ∀ a : GlobalAssignment BS, Qctrl BS a ≤ R →
        extShell BS a ∈ admShells BS c2 R (hotSet BS c2 a))
    (hlabels : ∀ a : GlobalAssignment BS, Qctrl BS a ≤ R →
        extLabel BS a (hotSet BS c2 a) (boundarySet BS c2 a)
          ∈ admLabels BS c2 R (hotSet BS c2 a) (boundarySet BS c2 a))
    (hcold : ∀ a : GlobalAssignment BS, Qctrl BS a ≤ R →
        ∀ k, BS.k0 ≤ k → k ≤ BS.K → k ∉ hotSet BS c2 a →
        (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
          (classCount BS a k (coldLabel BS a k) : ℝ)) :
    (Finset.univ.filter (fun a : GlobalAssignment BS => Qctrl BS a ≤ R)).card ≤
      ∑ H ∈ admH BS c2 R, ∑ B ∈ admB BS e0 R, ∑ v ∈ admShells BS c2 R H,
        ∑ ℓ ∈ admLabels BS c2 R H B, (fiber BS H B v ℓ).card := by
  have hcover :
      (Finset.univ.filter (fun a : GlobalAssignment BS => Qctrl BS a ≤ R)) ⊆
        (admH BS c2 R).biUnion (fun H =>
          (admB BS e0 R).biUnion (fun B =>
            (admShells BS c2 R H).biUnion (fun v =>
              (admLabels BS c2 R H B).biUnion (fun ℓ => fiber BS H B v ℓ)))) := by
    intro a ha
    rw [Finset.mem_filter] at ha
    obtain ⟨_, hR⟩ := ha
    rw [Finset.mem_biUnion]
    refine ⟨hotSet BS c2 a, hadmH a hR, ?_⟩
    rw [Finset.mem_biUnion]
    refine ⟨boundarySet BS c2 a, hadmB a hR, ?_⟩
    rw [Finset.mem_biUnion]
    refine ⟨extShell BS a, hadmS a hR, ?_⟩
    rw [Finset.mem_biUnion]
    exact ⟨extLabel BS a (hotSet BS c2 a) (boundarySet BS c2 a), hlabels a hR,
      mem_fiber_encode BS c2 R a (hcold a hR)⟩
  calc
    (Finset.univ.filter (fun a : GlobalAssignment BS => Qctrl BS a ≤ R)).card
        ≤ _ := Finset.card_le_card hcover
    _ ≤ ∑ H ∈ admH BS c2 R,
          ((admB BS e0 R).biUnion (fun B =>
            (admShells BS c2 R H).biUnion (fun v =>
              (admLabels BS c2 R H B).biUnion (fun ℓ => fiber BS H B v ℓ)))).card :=
        Finset.card_biUnion_le
    _ ≤ ∑ H ∈ admH BS c2 R, ∑ B ∈ admB BS e0 R,
          ((admShells BS c2 R H).biUnion (fun v =>
            (admLabels BS c2 R H B).biUnion (fun ℓ => fiber BS H B v ℓ))).card :=
        Finset.sum_le_sum (fun _ _ => Finset.card_biUnion_le)
    _ ≤ ∑ H ∈ admH BS c2 R, ∑ B ∈ admB BS e0 R, ∑ v ∈ admShells BS c2 R H,
          ((admLabels BS c2 R H B).biUnion (fun ℓ => fiber BS H B v ℓ)).card :=
        Finset.sum_le_sum (fun _ _ => Finset.sum_le_sum (fun _ _ => Finset.card_biUnion_le))
    _ ≤ ∑ H ∈ admH BS c2 R, ∑ B ∈ admB BS e0 R, ∑ v ∈ admShells BS c2 R H,
          ∑ ℓ ∈ admLabels BS c2 R H B, (fiber BS H B v ℓ).card :=
        Finset.sum_le_sum (fun _ _ => Finset.sum_le_sum (fun _ _ =>
          Finset.sum_le_sum (fun _ _ => Finset.card_biUnion_le)))
end GlobalControl

end
