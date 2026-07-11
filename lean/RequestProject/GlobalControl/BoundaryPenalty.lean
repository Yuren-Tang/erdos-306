import RequestProject.GlobalControl.ColdBlockEstimates
import RequestProject.GlobalControl.CrossBlockEnergy
import RequestProject.GlobalControl.EnergyBudget

/-!
# Boundary energy penalty

A change of dominant label between consecutive cold blocks forces a definite
amount of bipartite CRT energy.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- Produces the global cold
    constants and, besides the per-cold-block facts, the boundary penalty floor:
    every mismatch-boundary block contributes bipartite energy `≥ Pifloor`. -/
lemma boundary_penalty_per_k :
    ∃ (c2 e0 X0 : ℝ), 0 < c2 ∧ 0 < e0 ∧ 0 < X0 ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k → ¬ isHot BS c2 a k →
        ((excSet BS a k).card : ℝ) ≤ e0 ∧
        |(coldLabel BS a k : ℝ)| ≤ ((BS.P k).card : ℝ) * ((2:ℝ) ^ k) / 64 ∧
        (∀ p ∈ BS.P k \ excSet BS a k,
          (toPlain BS a p : ZMod p) = ((coldLabel BS a k : ℤ) : ZMod p))) ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k < BS.K → X0 ≤ (2:ℝ) ^ k → k ∈ boundarySet BS c2 a →
        Pifloor BS e0 k ≤ Xen BS a k) := by
  obtain ⟨c2, e0, X0cbf, hc2, he0, hX0cbf, hCBF⟩ := cold_block_facts;
  obtain ⟨X0den, hX0den, hden⟩ := RequestProject.eventually_const_mul_log_le_nat (4*e0 + 26);
  use c2, e0, max X0cbf (max X0den 16); norm_num;
  refine' ⟨ hc2, he0, _, _ ⟩;
  · intro BS a k hk1 hk2 hk3 hk4 hk5 hk6; specialize hCBF BS a k hk1 hk2 hk3 hk6; aesop;
  · intro BS a k hk1 hk2 hk3 hk4 hk5 hk6
    have hblock_card (j : ℕ) (hj0 : BS.k0 ≤ j) (hjK : j ≤ BS.K)
        (hjX : X0den ≤ (2 : ℝ) ^ j) :
        2 * e0 + 13 ≤ ((BS.P j).card : ℝ) := by
      apply BS.card_ge_of_two_mul_log_le j hj0 hjK
      have hj := hden (2 ^ j) (by exact_mod_cast hjX)
      norm_num [Nat.cast_pow] at hj ⊢
      nlinarith
    set Nk := (BS.P k).card
    set Nk1 := (BS.P (k + 1)).card
    set ck := (BS.P k \ excSet BS a k).card
    set ck1 := (BS.P (k + 1) \ excSet BS a (k + 1)).card
    have hNk : 12 ≤ ck := by
      have hNk : Nk ≥ 2 * e0 + 13 := by
        exact hblock_card k hk1 (by linarith) (by linarith)
      have hck : (ck : ℝ) ≥ Nk - e0 := by
        have hck : (ck : ℝ) = Nk - (excSet BS a k).card := by
          exact eq_sub_of_add_eq <| mod_cast Finset.card_sdiff_add_card_eq_card ( excSet_subset BS a k )
        generalize_proofs at *; (
        linarith [ hCBF BS a k hk1 ( by linarith ) hk3 ( by unfold boundarySet at hk6; aesop ) |>.1 ]);
      exact Nat.le_of_lt_succ ( by rw [ ← @Nat.cast_lt ℝ ] ; push_cast; linarith )
    have hm : (32 : ℤ) * |coldLabel BS a k| ≤ (2 ^ k : ℤ) * ck := by
      have hck : (ck : ℝ) ≥ Nk - e0 := by
        have := hCBF BS a k hk1 ( by linarith ) hk3 ( by
          exact Finset.mem_filter.mp hk6 |>.2.1 ) ; norm_num at *;
        convert add_le_add_left this.1 ck using 1 ; ring_nf;
        · rw_mod_cast [ ← Finset.card_union_of_disjoint ( Finset.disjoint_sdiff ), Finset.union_sdiff_of_subset ( excSet_subset BS a k ) ];
        · ring;
      have hck : (Nk : ℝ) ≥ 2 * e0 + 13 := by
        exact hblock_card k hk1 (by linarith) (by linarith)
      have := hCBF BS a k hk1 ( by linarith ) hk3 ( by
        exact Finset.mem_filter.mp hk6 |>.2.1 ) ; norm_num at *;
      rw [ ← @Int.cast_le ℝ ] ; norm_num ; nlinarith [ pow_pos ( zero_lt_two' ℝ ) k ]
    have hm' : (32 : ℤ) * |coldLabel BS a (k + 1)| ≤ (2 ^ (k + 1) : ℤ) * Nk1 := by
      have := hCBF BS a ( k + 1 ) ( by linarith ) ( by linarith ) ( by
        exact le_trans hk3 ( pow_le_pow_right₀ ( by norm_num ) ( Nat.le_succ _ ) ) ) ( by
        unfold boundarySet at hk6; aesop; );
      rw [ ← @Int.cast_le ℝ ] ; push_cast ; nlinarith [ pow_pos ( zero_lt_two' ℝ ) k, pow_succ' ( 2 : ℝ ) k ]
    have hck : (ck : ℝ) ≥ Nk / 2 := by
      have hNk_ge : (Nk : ℝ) ≥ 2 * e0 + 13 := by
        exact hblock_card k hk1 (by linarith) (by linarith)
      have := hCBF BS a k hk1 ( by linarith ) hk3 ( by unfold boundarySet at hk6; aesop ) ; norm_num at * ; linarith [ show ( ck : ℝ ) = Nk - ( excSet BS a k |> Finset.card ) by exact eq_sub_of_add_eq <| mod_cast Finset.card_sdiff_add_card_eq_card <| excSet_subset BS a k ] ;
    have hck1 : (ck1 : ℝ) ≥ Nk1 - e0 := by
      have := hCBF BS a ( k + 1 ) ( by linarith ) ( by linarith ) ( by
        exact le_trans hk3 ( pow_le_pow_right₀ ( by norm_num ) ( Nat.le_succ _ ) ) ) ( by
        exact Finset.mem_filter.mp hk6 |>.2.2.1 );
      simp +zetaDelta at *;
      rw [ Finset.card_sdiff ];
      rw [ Nat.cast_sub ];
      · rw [ Finset.inter_eq_left.mpr ( excSet_subset BS a ( k + 1 ) ) ] ; linarith;
      · exact Finset.card_le_card fun x hx => by aesop;
    have hck2 : (ck : ℝ) ≥ Nk - e0 := by
      have := hCBF BS a k hk1 ( by linarith ) hk3 ( by
        exact Finset.mem_filter.mp hk6 |>.2.1 ) ; norm_num at *;
      have hck2 : (ck : ℝ) = Nk - (excSet BS a k).card := by
        exact eq_sub_of_add_eq <| mod_cast Finset.card_sdiff_add_card_eq_card <| Finset.filter_subset _ _;
      linarith
    have hck3 : (ck1 : ℝ) - 1 ≥ Nk1 - e0 - 1 := by
      linarith
    have hck4 : ((ck1 : ℝ) - 1) * (ck : ℝ) ^ 3 / (2 ^ 13 * (2 ^ k : ℝ) ^ 2) ≤ Xen BS a k := by
      apply consecutive_block_mismatch_energy_lower_bound BS (toPlain BS a) k
        (coldLabel BS a k) (coldLabel BS a (k + 1)) (by
      unfold boundarySet at hk6; aesop;) (excSet BS a k) (excSet BS a (k + 1)) (by
      exact hCBF BS a k hk1 ( by linarith ) hk3 ( by unfold boundarySet at hk6; aesop ) |>.2.2) (by
      have := hCBF BS a ( k + 1 ) ( by linarith ) ( by linarith ) ( by linarith [ pow_le_pow_right₀ ( by norm_num : ( 1 : ℝ ) ≤ 2 ) ( by linarith : k + 1 ≥ k ) ] ) ( by
        unfold boundarySet at hk6; aesop; ) ; aesop;) hNk hm hm'
    exact (by
    refine le_trans ?_ hck4;
    unfold Pifloor; gcongr;
    · exact pow_nonneg (sub_nonneg_of_le <| by
        linarith [hblock_card k hk1 (by linarith) (by linarith)]) _
    · have hcard := hblock_card (k + 1) (by linarith) (by linarith)
          (le_trans hk4 (pow_le_pow_right₀ (by norm_num) (Nat.le_succ _)))
      exact_mod_cast (show (0 : ℝ) ≤ (ck1 : ℝ) - 1 by linarith)
    · have hcard := hblock_card k hk1 (by linarith) (by linarith)
      linarith
    )

end GlobalControl

end
