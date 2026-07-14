import RequestProject.GlobalControl.BlockRestriction
import RequestProject.GlobalControl.ControlEnergy

/-!
# Decomposition of global control energy

The global quadratic control energy is the sum of internal block energies and
bipartite energies between consecutive blocks.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- Internal block energy is the control-energy sum over internal pairs. -/
lemma QP_restrict_eq_internal (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ) :
    QP (BS.P k) (restrict BS a k)
      = ∑ pq ∈ internalPairs BS k,
          ((Hglob (toPlain BS a) pq.1 pq.2 : ℝ) / ((pq.1 : ℝ) * pq.2)) ^ 2 := by
  refine' Finset.sum_bij ( fun pq hpq => ( pq.1.1, pq.2.1 ) ) _ _ _ _ <;> simp +decide;
  · unfold increasingPairs internalPairs; aesop;
  · aesop;
  · unfold internalPairs increasingPairs; aesop;
  · unfold restrict toPlain Hglob; aesop;

/-- Internal block energies together with consecutive bipartite energies form
a sub-sum of the global control energy. -/
lemma energy_splits (BS : BlockSystem) (a : GlobalAssignment BS) :
    (∑ k ∈ Finset.Icc BS.k0 BS.K, QP (BS.P k) (restrict BS a k))
      + (∑ k ∈ Finset.Ico BS.k0 BS.K,
          ∑ pq ∈ bipartitePairs BS k,
            ((Hglob (toPlain BS a) pq.1 pq.2 : ℝ) / ((pq.1 : ℝ) * pq.2)) ^ 2)
      ≤ Qctrl BS a := by
  -- By definition of ctrlPairs, we can split the sum into the internal pairs and the bipartite pairs.
  have h_split : ctrlPairs BS = (Finset.Icc BS.k0 BS.K).biUnion (internalPairs BS) ∪ (Finset.Ico BS.k0 BS.K).biUnion (bipartitePairs BS) := by
    rfl;
  -- By definition of ctrlPairs, we can split the sum into the internal pairs and the bipartite pairs. Since these sets are disjoint, we can apply the Finset.sum_union lemma.
  have h_disjoint : Disjoint ((Finset.Icc BS.k0 BS.K).biUnion (internalPairs BS)) ((Finset.Ico BS.k0 BS.K).biUnion (bipartitePairs BS)) := by
    simp +contextual [ Finset.disjoint_left, internalPairs, bipartitePairs ];
    intro a b x hx₁ hx₂ ha hb hab y hy₁ hy₂ ha' hb'; have := BS.hwindow x a ha; have := BS.hwindow x b hb; have := BS.hwindow y a ha'; have := BS.hwindow ( y + 1 ) b hb'; simp_all +decide [ Nat.pow_succ' ] ;
    by_cases hxy : x ≤ y;
    · linarith [ pow_le_pow_right₀ ( by decide : 1 ≤ 2 ) hxy ];
    · -- Since $x > y$, we have $2^x \geq 2^{y+1}$.
      have h_exp : 2 ^ x ≥ 2 ^ (y + 1) := by
        exact pow_le_pow_right₀ ( by decide ) ( by linarith );
      grind;
  rw [ show Qctrl BS a = ∑ pq ∈ ctrlPairs BS, ( ( Hglob ( toPlain BS a ) pq.1 pq.2 : ℝ ) / ( pq.1 * pq.2 ) ) ^ 2 from rfl, h_split, Finset.sum_union h_disjoint ];
  rw [ Finset.sum_biUnion, Finset.sum_biUnion ];
  · exact add_le_add ( Finset.sum_le_sum fun _ _ => by rw [ QP_restrict_eq_internal ] ) le_rfl;
  · intros k hk l hl hkl;
    simp +decide [ Finset.disjoint_left, bipartitePairs ];
    intro a b ha hb ha' hb'; have := blocks_disjoint BS ( show k ≠ l by aesop ) ; simp_all +decide [ Finset.disjoint_left ] ;
  · intros k hk l hl hkl; simp_all +decide [ Finset.disjoint_left, internalPairs ] ;
    exact fun a b ha hb hab ha' hb' => hkl <| by have := blocks_disjoint BS ( show k ≠ l from hkl ) ; exact False.elim <| Finset.disjoint_left.mp this ha ha';

end GlobalControl

end
