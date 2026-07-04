import RequestProject.GlobalControl.ControlVarianceBounds

/-!
# Positivity of the global control variance

The density assumptions make consecutive prime blocks nonempty. Hence the
control graph contains a bipartite pair and its reciprocal-square variance is
strictly positive.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

private lemma two_le_two_pow {k : ℕ} (hk : 1 ≤ k) : (2 : ℝ) ≤ (2 : ℝ) ^ k := by
  calc
    (2 : ℝ) = (2 : ℝ) ^ 1 := (pow_one 2).symm
    _ ≤ (2 : ℝ) ^ k := pow_le_pow_right₀ (by norm_num) hk

/-- A block in the density range is nonempty. -/
private lemma block_nonempty (BS : BlockSystem) {k : ℕ} (hk1 : BS.k0 ≤ k)
    (hk2 : k ≤ BS.K) : (BS.P k).Nonempty := by
  rw [← Finset.card_pos]
  have hk : 1 ≤ k := le_trans BS.hk0 hk1
  have hlog : 0 < Real.log ((2 : ℝ) ^ k) :=
    Real.log_pos (lt_of_lt_of_le (by norm_num) (two_le_two_pow hk))
  have hpos : (0 : ℝ) < (2 : ℝ) ^ k / (2 * Real.log ((2 : ℝ) ^ k)) := by
    positivity
  have hd := BS.hdensity k hk1 hk2
  have : (0 : ℝ) < ((BS.P k).card : ℝ) := lt_of_lt_of_le hpos hd
  exact_mod_cast this

/-- An admissible block range contains a bipartite control pair, so its global
control variance is positive. -/
lemma sigmaCtrl_pos_of_admissible_range (BS : BlockSystem)
    (hadm : admissibleGlobalRange BS) : 0 < sigmaCtrl BS := by
  obtain ⟨hrange, _⟩ := hadm
  have hk0 := BS.hk0
  have hKge : BS.k0 + 1 ≤ BS.K := by omega
  obtain ⟨p, hp⟩ := block_nonempty BS le_rfl (by omega)
  obtain ⟨q, hq⟩ := block_nonempty BS (by omega) hKge
  apply sigmaCtrl_pos_of_ctrlPairs_nonempty
  refine ⟨(p, q), Finset.mem_union_right _ ?_⟩
  rw [Finset.mem_biUnion]
  exact ⟨BS.k0, Finset.mem_Ico.mpr ⟨le_rfl, by omega⟩,
    Finset.mem_product.mpr ⟨hp, hq⟩⟩

end GlobalControl

end
