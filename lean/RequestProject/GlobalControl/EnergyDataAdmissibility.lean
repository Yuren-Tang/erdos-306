import RequestProject.GlobalControl.BoundaryPenalty
import RequestProject.GlobalControl.LevelSetCover

/-!
# Admissibility of encoded energy data

The hot set, boundary set, shell vector, and cold residue classes attached to a
low-energy assignment satisfy the finite energy constraints of the encoder.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- The hot set is admissible (its forcing floors sum to `≤ R`). -/
lemma hotSet_mem_admH (BS : BlockSystem) (c2 : ℝ) (a : GlobalAssignment BS) (R : ℝ)
    (hR : Qctrl BS a ≤ R) : hotSet BS c2 a ∈ admH BS c2 R := by
  rw [admH, Finset.mem_filter, Finset.mem_powerset]
  refine ⟨?_, sum_Rw_hot_le BS c2 a R hR⟩
  rw [hotSet]; exact Finset.filter_subset _ _

/-- The boundary set is admissible (its Peierls penalties sum to `≤ R`), given
    the per-`k` penalty bound from `boundary_penalty_per_k`. -/
lemma boundarySet_mem_admB (BS : BlockSystem) (c2 e0 X0 R : ℝ)
    (a : GlobalAssignment BS) (hX0 : X0 ≤ (2:ℝ) ^ BS.k0)
    (hpen : ∀ k, BS.k0 ≤ k → k < BS.K → X0 ≤ (2:ℝ) ^ k →
        k ∈ boundarySet BS c2 a → Pifloor BS e0 k ≤ Xen BS a k)
    (hR : Qctrl BS a ≤ R) : boundarySet BS c2 a ∈ admB BS e0 R := by
  have hsub : boundarySet BS c2 a ⊆ Finset.Ico BS.k0 BS.K := by
    rw [boundarySet]; exact Finset.filter_subset _ _
  rw [admB, Finset.mem_filter, Finset.mem_powerset]
  refine ⟨hsub, ?_⟩
  calc ∑ k ∈ boundarySet BS c2 a, Pifloor BS e0 k
      ≤ ∑ k ∈ boundarySet BS c2 a, Xen BS a k := by
        refine Finset.sum_le_sum (fun k hk => ?_)
        have hkIco := Finset.mem_Ico.mp (hsub hk)
        have hkX : X0 ≤ (2:ℝ) ^ k :=
          le_trans hX0 (pow_le_pow_right₀ (by norm_num) hkIco.1)
        exact hpen k hkIco.1 hkIco.2 hkX hk
    _ ≤ ∑ k ∈ Finset.Ico BS.k0 BS.K, Xen BS a k :=
        Finset.sum_le_sum_of_subset_of_nonneg hsub
          (fun k _ _ => Finset.sum_nonneg (fun _ _ => sq_nonneg _))
    _ ≤ R := sum_bipartite_le BS a R hR

/-- The zero-extended shell data is admissible. -/
lemma extShell_mem_admShells (BS : BlockSystem) (c2 R : ℝ) (a : GlobalAssignment BS)
    (hR0 : 0 ≤ R) (hR : Qctrl BS a ≤ R) :
    extShell BS a ∈ admShells BS c2 R (hotSet BS c2 a) := by
  rw [admShells, Finset.mem_filter]
  refine ⟨?_, ?_, ?_⟩
  · -- extShell ∈ shellCarrier
    rw [shellCarrier, Finset.mem_image]
    refine ⟨fun k _ => shellVec BS a k, ?_, ?_⟩
    · rw [Finset.mem_pi]
      intro k hk
      rw [Finset.mem_range]
      exact Nat.lt_succ_of_le (shellVec_le_floorR BS a R hR0 hR k hk)
    · funext k
      by_cases hk : k ∈ Finset.Icc BS.k0 BS.K <;> simp [extShell, hk]
  · -- shell mass ≤ R
    have hcongr : ∑ k ∈ Finset.Icc BS.k0 BS.K, ((extShell BS a k : ℕ) : ℝ)
         = ∑ k ∈ Finset.Icc BS.k0 BS.K, ((shellVec BS a k : ℕ) : ℝ) :=
      Finset.sum_congr rfl (fun k hk => by
        rw [show extShell BS a k = shellVec BS a k from by rw [extShell, if_pos hk]])
    rw [hcongr]; exact sum_shellVec_le BS a R hR
  · -- hot-consistency
    intro k hk hkH
    rw [show extShell BS a k = shellVec BS a k from by rw [extShell, if_pos hk]]
    have hisHot : isHot BS c2 a k := (Finset.mem_filter.mp hkH).2
    rw [isHot] at hisHot
    rw [shellVec]
    have hfloor : blockEnergy BS a k < (⌊blockEnergy BS a k⌋₊ : ℝ) + 1 :=
      Nat.lt_floor_add_one _
    linarith

/-- The cold-class lower bound (hypothesis `hcold` of `cover_card_le`), derived
    from the cold-block dominance (`cold_isDominant`) via `coldLabel_spec`. -/
lemma cold_class_of_isDominant (BS : BlockSystem) (c2 : ℝ) (a : GlobalAssignment BS)
    (hdom : ∀ k, BS.k0 ≤ k → k ≤ BS.K → k ∉ hotSet BS c2 a →
        LocalEnergy.HasDominantLabel (2 ^ k) (BS.P k) (restrict BS a k) (1/4)) :
    ∀ k, BS.k0 ≤ k → k ≤ BS.K → k ∉ hotSet BS c2 a →
      (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
        (classCount BS a k (coldLabel BS a k) : ℝ) := by
  intro k hk1 hk2 hkc
  obtain ⟨m, hmsize, hmclass⟩ := hdom k hk1 hk2 hkc
  have hex : ∃ m : ℤ, |m| ≤ ((2:ℤ) ^ k) ^ 2 / 2 ∧
      (1 - (1/4 : ℝ)) * ((BS.P k).card : ℝ) ≤
        (((BS.P k).attach.filter
          (fun p => restrict BS a k p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) := by
    refine ⟨m, ?_, hmclass⟩
    have hcast : ((2:ℤ) ^ k) ^ 2 = ((2 ^ k : ℕ) : ℤ) ^ 2 := by push_cast; ring
    rw [hcast]; exact hmsize
  have hspec := (coldLabel_spec BS a k hex).2
  rw [classCount]; exact hspec

end GlobalControl

end

