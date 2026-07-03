import RequestProject.GlobalControl.Encoding.Fibers
import RequestProject.GlobalControl.LevelSetParameters

/-!
# Assignment data for the finite encoder

A global assignment determines zero-extended shell and dominant-label data,
and belongs to the encoding fiber indexed by those invariants.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## Encoder membership -/

/-- The segment start of a cold block in `[k₀,K]` is itself a segment start. -/
lemma segStart_mem (BS : BlockSystem) (H B : Finset ℕ) :
    ∀ (k : ℕ), BS.k0 ≤ k → k ≤ BS.K → k ∉ H →
      RequestProject.segmentStart BS.k0 H B k ∈ RequestProject.segmentStarts BS.k0 BS.K H B := by
  intro k
  induction k using Nat.strong_induction_on with
  | _ k ih =>
    intro hk1 hk2 hkH
    rw [RequestProject.segmentStart]
    by_cases hle : k ≤ BS.k0
    · -- then k = k0
      have hk0 : k = BS.k0 := le_antisymm hle hk1
      simp only [hle, if_true]
      rw [RequestProject.segmentStarts, Finset.mem_filter, Finset.mem_sdiff, Finset.mem_Icc]
      refine ⟨⟨⟨le_rfl, ?_⟩, ?_⟩, Or.inl rfl⟩
      · exact le_trans hk1 hk2 |>.trans_eq rfl |>.trans (by omega) |>.trans_eq rfl
      · intro hk0H; exact hkH (hk0 ▸ hk0H)
    · push Not at hle
      by_cases hb : (k - 1) ∈ H ∨ (k - 1) ∈ B
      · simp only [Nat.not_le.mpr hle, if_false, hb, if_true]
        rw [RequestProject.segmentStarts, Finset.mem_filter, Finset.mem_sdiff, Finset.mem_Icc]
        exact ⟨⟨⟨hk1, hk2⟩, hkH⟩, Or.inr hb⟩
      · simp only [Nat.not_le.mpr hle, if_false, hb, if_false]
        exact ih (k - 1) (by omega) (by omega) (by omega)
          (fun h => hb (Or.inl h))

/-- Zero-extension of the shell data outside `[k₀,K]`, matching the
    image form of `admShells`. -/
def extShell (BS : BlockSystem) (a : GlobalAssignment BS) : ℕ → ℕ :=
  fun k => if k ∈ Finset.Icc BS.k0 BS.K then shellVec BS a k else 0

/-- Zero-extension of the label data outside `RequestProject.segmentStarts H B`, matching the
    image form of `admLabels`. -/
def extLabel (BS : BlockSystem) (a : GlobalAssignment BS) (H B : Finset ℕ) : ℕ → ℤ :=
  fun k => if k ∈ RequestProject.segmentStarts BS.k0 BS.K H B then coldLabel BS a k else 0

/-- The encoder lands `a` in the fiber of its own zero-extended invariants.
    The cold-class lower bound is supplied as a hypothesis (discharged from the
    cold-block facts). -/
lemma mem_fiber_encode (BS : BlockSystem) (c2 _R : ℝ) (a : GlobalAssignment BS)
    (hcold : ∀ k, BS.k0 ≤ k → k ≤ BS.K → k ∉ hotSet BS c2 a →
      (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
        (classCount BS a k (coldLabel BS a k) : ℝ)) :
    a ∈ fiber BS (hotSet BS c2 a) (boundarySet BS c2 a)
        (extShell BS a) (extLabel BS a (hotSet BS c2 a) (boundarySet BS c2 a)) := by
  rw [fiber, Finset.mem_filter]
  refine ⟨Finset.mem_univ _, ?_⟩
  intro k hk
  have hkmem := hk
  rw [Finset.mem_Icc] at hk
  refine ⟨?_, ?_⟩
  · -- energy shell: blockEnergy ≤ extShell + 1 = ⌊blockEnergy⌋ + 1
    rw [extShell, if_pos hkmem, shellVec]
    exact le_of_lt (Nat.lt_floor_add_one _)
  · intro hkH
    have hcoldk : k ∉ hotSet BS c2 a := hkH
    -- the fiber evaluates extLabel at the segment start, which lies in RequestProject.segmentStarts
    have hsmem := segStart_mem BS (hotSet BS c2 a) (boundarySet BS c2 a) k hk.1 hk.2 hkH
    rw [extLabel, if_pos hsmem]
    have heq := coldLabel_eq_segStart BS c2 a k hk.1 hk.2 hcoldk
    rw [classCount, ← heq]
    exact hcold k hk.1 hk.2 hcoldk

end GlobalControl

end
