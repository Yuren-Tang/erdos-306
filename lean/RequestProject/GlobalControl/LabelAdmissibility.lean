import RequestProject.GlobalControl.BoundaryPenalty
import RequestProject.GlobalControl.LevelSetCover

/-!
# Admissibility of dominant labels

Energy bounds place every cold dominant label in its finite label window, so
the zero-extended label assignment belongs to the encoder's label space.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## Label-range admissibility -/

/-- Core label bound: a cold block's dominant label has size
    `≤ (20/3)·√(blockEnergy)/σ`, via `theoremA_label_range`. -/
lemma coldLabel_abs_bound (BS : BlockSystem) (a : GlobalAssignment BS) (s : ℕ)
    (hX16 : 16 ≤ (2:ℕ) ^ s) (hN8 : 8 ≤ (BS.P s).card)
    (hdomk : LocalEnergy.HasDominantLabel (2 ^ s) (BS.P s) (restrict BS a s) (1/4)) :
    |(coldLabel BS a s : ℝ)| ≤
      (20/3) * Real.sqrt (blockEnergy BS a s) / sigmaP (BS.P s) := by
  obtain ⟨m, hmsize, hmclass⟩ := hdomk
  have hex : ∃ m : ℤ, |m| ≤ ((2:ℤ) ^ s) ^ 2 / 2 ∧
      (1 - (1/4 : ℝ)) * ((BS.P s).card : ℝ) ≤
        (((BS.P s).attach.filter
          (fun p => restrict BS a s p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ) := by
    refine ⟨m, ?_, hmclass⟩
    have hcast : ((2:ℤ) ^ s) ^ 2 = ((2 ^ s : ℕ) : ℤ) ^ 2 := by push_cast; ring
    rw [hcast]; exact hmsize
  obtain ⟨hsize, hclass⟩ := coldLabel_spec BS a s hex
  have hP : ∀ p ∈ BS.P s, Nat.Prime p ∧ 2 ^ s ≤ p ∧ p ≤ 2 * 2 ^ s := by
    intro p hp
    refine ⟨BS.hprime s p hp, (BS.hwindow s p hp).1, ?_⟩
    have := (BS.hwindow s p hp).2
    have h2 : (2:ℕ) ^ (s + 1) = 2 * 2 ^ s := by ring
    omega
  have hbound := LocalEnergy.dominant_label_bound (2 ^ s) hX16 (BS.P s) hP hN8 (1/4)
    (by norm_num) (by norm_num) (restrict BS a s) (coldLabel BS a s)
    (blockEnergy BS a s) hsize hclass (le_of_eq rfl)
  rw [show (5 / (1 - (1/4:ℝ))) = 20/3 by norm_num] at hbound
  exact hbound

/-- A cold segment-start's dominant label lies in its `labelFin` window. -/
lemma coldLabel_mem_labelFin (BS : BlockSystem) (c2 R : ℝ) (a : GlobalAssignment BS)
    (s : ℕ) (hs1 : BS.k0 ≤ s) (hs2 : s ≤ BS.K) (_hR0 : 0 ≤ R) (hc2 : 0 ≤ c2)
    (hX16 : 16 ≤ (2:ℕ) ^ s) (hN8 : 8 ≤ (BS.P s).card) (hslog : 1 ≤ Real.log (2 ^ s))
    (hdomk : LocalEnergy.HasDominantLabel (2 ^ s) (BS.P s) (restrict BS a s) (1/4))
    (hcold : ¬ isHot BS c2 a s) (hbR : blockEnergy BS a s ≤ R)
    (hσpos : 0 < sigmaP (BS.P s)) :
    coldLabel BS a s ∈ labelFin BS c2 R s := by
  have habs := coldLabel_abs_bound BS a s hX16 hN8 hdomk
  have hbE0 : 0 ≤ blockEnergy BS a s := by rw [blockEnergy]; exact QP_nonneg _ _
  rw [labelFin]
  split_ifs with hsk0
  · -- initial segment: the √R/σ window
    subst hsk0
    have hnum : (20/3) * Real.sqrt (blockEnergy BS a BS.k0) ≤ 7 * Real.sqrt R := by
      have hsqrt : Real.sqrt (blockEnergy BS a BS.k0) ≤ Real.sqrt R := Real.sqrt_le_sqrt hbR
      nlinarith [Real.sqrt_nonneg (blockEnergy BS a BS.k0), Real.sqrt_nonneg R, hsqrt]
    have hdiv : (20/3) * Real.sqrt (blockEnergy BS a BS.k0) / sigmaP (BS.P BS.k0)
        ≤ 7 * Real.sqrt R / sigmaP (BS.P BS.k0) := by
      rw [div_eq_mul_one_div, div_eq_mul_one_div (7 * Real.sqrt R)]
      exact mul_le_mul_of_nonneg_right hnum (by positivity)
    have hkey : |(coldLabel BS a BS.k0 : ℝ)| ≤ (L0 BS R : ℝ) :=
      le_trans habs (le_trans hdiv (Int.le_ceil _))
    rw [Finset.mem_Icc]
    have hle : |coldLabel BS a BS.k0| ≤ L0 BS R := by exact_mod_cast hkey
    exact abs_le.mp hle
  · -- later segment: the labelBound window
    have hbE_Rw : blockEnergy BS a s ≤ Rw c2 s := by
      rw [isHot, not_le] at hcold; exact le_of_lt hcold
    have hlogpos : 0 < Real.log (2 ^ s) := lt_of_lt_of_le one_pos hslog
    have hcube : (1:ℝ) ≤ (Real.log (2 ^ s)) ^ 3 := one_le_pow₀ hslog
    have hRw_le : Rw c2 s ≤ c2 * (2:ℝ) ^ s := by
      rw [Rw, div_le_iff₀ (by positivity)]
      have hb : (0:ℝ) ≤ c2 * (2:ℝ) ^ s := mul_nonneg hc2 (by positivity)
      nlinarith [mul_nonneg hb (by linarith [hcube] : (0:ℝ) ≤ (Real.log (2 ^ s)) ^ 3 - 1)]
    have hsqrt_le : Real.sqrt (blockEnergy BS a s) ≤ Real.sqrt (c2 * (2:ℝ) ^ s) :=
      Real.sqrt_le_sqrt (le_trans hbE_Rw hRw_le)
    have hinv := block_deviation_reciprocal_bound BS s hs1 hs2
    have hinv0 : 0 ≤ 1 / sigmaP (BS.P s) := by positivity
    have hkey : |(coldLabel BS a s : ℝ)| ≤ (labelBound c2 s : ℝ) := by
      refine le_trans habs ?_
      have hstep : (20/3) * Real.sqrt (blockEnergy BS a s) / sigmaP (BS.P s)
          ≤ (20/3) * Real.sqrt (c2 * (2:ℝ) ^ s) * (16 * (2:ℝ) ^ s * Real.log (2 ^ s)) := by
        rw [div_eq_mul_one_div]
        calc (20/3 * Real.sqrt (blockEnergy BS a s)) * (1 / sigmaP (BS.P s))
            ≤ (20/3 * Real.sqrt (c2 * (2:ℝ) ^ s)) *
                (16 * (2:ℝ) ^ s * Real.log (2 ^ s)) := by
              apply mul_le_mul ?_ hinv hinv0 (by positivity)
              exact mul_le_mul_of_nonneg_left hsqrt_le (by norm_num)
          _ = (20/3) * Real.sqrt (c2 * (2:ℝ) ^ s) *
                (16 * (2:ℝ) ^ s * Real.log (2 ^ s)) := by ring
      exact le_trans hstep (Int.le_ceil _)
    rw [Finset.mem_Icc]
    have : |coldLabel BS a s| ≤ labelBound c2 s := by exact_mod_cast hkey
    exact abs_le.mp this

/-- The zero-extended cold labels lie in
    `admLabels`, given membership of each segment-start label in its window. -/
lemma extLabel_mem_admLabels (BS : BlockSystem) (c2 R : ℝ) (a : GlobalAssignment BS)
    (hmem : ∀ s ∈ RequestProject.segmentStarts BS.k0 BS.K (hotSet BS c2 a) (boundarySet BS c2 a),
        coldLabel BS a s ∈ labelFin BS c2 R s) :
    extLabel BS a (hotSet BS c2 a) (boundarySet BS c2 a)
      ∈ admLabels BS c2 R (hotSet BS c2 a) (boundarySet BS c2 a) := by
  rw [admLabels, Finset.mem_image]
  refine ⟨fun s _ => coldLabel BS a s, ?_, ?_⟩
  · rw [Finset.mem_pi]; intro s hs; exact hmem s hs
  · funext k
    by_cases hk : k ∈ RequestProject.segmentStarts BS.k0 BS.K (hotSet BS c2 a) (boundarySet BS c2 a) <;>
      simp [extLabel, hk]
end GlobalControl

end
