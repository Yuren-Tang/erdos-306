import RequestProject.GlobalControl.BlockRestriction
import RequestProject.GlobalControl.ControlEnergy

/-!
# Dyadic bounds for the global control deviation

Dyadic window cardinality bounds control the internal and consecutive
bipartite reciprocal-square sums, yielding uniform and geometric estimates.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-
Each block has at most `2^k` primes (the window `[2^k, 2^{k+1})` has that
    length).
-/
lemma block_card_le (BS : BlockSystem) (k : ℕ) : (BS.P k).card ≤ 2 ^ k := by
  convert Set.ncard_le_ncard ( show ( BS.P k : Set ℕ ) ⊆ Set.Icc ( 2 ^ k ) ( 2 ^ ( k + 1 ) - 1 ) from fun p hp => ?_ ) using 1;
  · rw [ Set.ncard_coe_finset ];
  · norm_num [ Set.ncard_eq_toFinset_card' ];
    grind;
  · grind +suggestions

/-- The global control deviation is at most one once `k₀ ≥ 2`. -/
lemma sigmaCtrl_le_one (BS : BlockSystem) (hk0 : 2 ≤ BS.k0) :
    sigmaCtrl BS ≤ 1 := by
  -- We bound the sum inside the square root by considering the contributions from the internal and bipartite pairs separately.
  have h_sum_bound : ∑ pq ∈ ctrlPairs BS, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤ ∑ k ∈ Finset.Icc BS.k0 BS.K, ((1 / 4 : ℝ) ^ k) + ∑ k ∈ Finset.Ico BS.k0 BS.K, ((1 / 4 : ℝ) ^ k * (1 / 2)) := by
    have h_sum_bound : ∀ k ∈ Finset.Icc BS.k0 BS.K, ∑ pq ∈ internalPairs BS k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤ (1 / 4 : ℝ) ^ k := by
      intro k hk
      have h_card : (internalPairs BS k).card ≤ (BS.P k).card ^ 2 := by
        exact le_trans ( Finset.card_filter_le _ _ ) ( by norm_num [ sq ] )
      have h_bound : ∀ pq ∈ internalPairs BS k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤ (1 / 4 : ℝ) ^ k / (BS.P k).card ^ 2 := by
        intro pq hpq
        have h_bound : (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤ (1 / 4 : ℝ) ^ k / (2 ^ k) ^ 2 := by
          have h_bound : (pq.1 : ℝ) ≥ 2 ^ k ∧ (pq.2 : ℝ) ≥ 2 ^ k := by
            exact ⟨ mod_cast BS.hwindow k pq.1 ( Finset.mem_filter.mp hpq |>.1 |> Finset.mem_product.mp |>.1 ) |>.1, mod_cast BS.hwindow k pq.2 ( Finset.mem_filter.mp hpq |>.1 |> Finset.mem_product.mp |>.2 ) |>.1 ⟩;
          rw [ div_pow, div_div, div_le_div_iff₀ ] <;> norm_cast <;> norm_num [ pow_mul' ] at *;
          · rw [ show ( 4 : ℕ ) ^ k = ( 2 ^ k ) ^ 2 by rw [ pow_right_comm ] ; norm_num ] ; nlinarith [ Nat.mul_le_mul ( show pq.1 ≥ 2 ^ k from mod_cast h_bound.1 ) ( show pq.2 ≥ 2 ^ k from mod_cast h_bound.2 ) ] ;
          · exact pow_pos ( mul_pos ( Nat.cast_pos.mp ( lt_of_lt_of_le ( by positivity ) h_bound.1 ) ) ( Nat.cast_pos.mp ( lt_of_lt_of_le ( by positivity ) h_bound.2 ) ) ) _;
        refine le_trans h_bound ?_;
        gcongr;
        · exact sq_pos_of_pos <| Nat.cast_pos.mpr <| Finset.card_pos.mpr <| by obtain ⟨ p, hp ⟩ := Finset.nonempty_of_ne_empty ( by aesop_cat : BS.P k ≠ ∅ ) ; exact ⟨ p, hp ⟩ ;
        · exact_mod_cast block_card_le BS k
      have h_sum_bound : ∑ pq ∈ internalPairs BS k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤ (1 / 4 : ℝ) ^ k := by
        refine' le_trans ( Finset.sum_le_sum h_bound ) _;
        norm_num [ div_eq_mul_inv ] at *;
        rw [ mul_left_comm ];
        exact mul_le_of_le_one_right ( by positivity ) ( div_le_one_of_le₀ ( mod_cast h_card ) ( by positivity ) )
      exact h_sum_bound;
    have h_sum_bound_bipartite : ∀ k ∈ Finset.Ico BS.k0 BS.K, ∑ pq ∈ bipartitePairs BS k, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤ (1 / 4 : ℝ) ^ k * (1 / 2) := by
      intros k hk
      have h_card_bipartite : (bipartitePairs BS k).card ≤ 2 ^ k * 2 ^ (k + 1) := by
        exact le_trans ( Finset.card_product _ _ |> le_of_eq ) ( mul_le_mul' ( block_card_le BS k ) ( block_card_le BS ( k + 1 ) ) );
      change (BS.P k ×ˢ BS.P (k + 1)).card ≤ 2 ^ k * 2 ^ (k + 1) at h_card_bipartite
      have h_sum_bipartite : ∑ pq ∈ (BS.P k ×ˢ BS.P (k + 1)), (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤ (2 ^ k * 2 ^ (k + 1)) * (1 / ((2 ^ k : ℝ) * (2 ^ (k + 1) : ℝ)) ^ 2) := by
        have h_term : ∀ x ∈ BS.P k ×ˢ BS.P (k + 1),
            (1 : ℝ) / ((x.1 : ℝ) * x.2) ^ 2 ≤
              1 / ((2 ^ k : ℝ) * (2 ^ (k + 1) : ℝ)) ^ 2 := by
          intro x hx
          exact one_div_le_one_div_of_le (by positivity) <|
            pow_le_pow_left₀ (by positivity)
              (mul_le_mul
                (show (x.1 : ℝ) ≥ 2 ^ k by
                  exact_mod_cast BS.hwindow k x.1 (Finset.mem_product.mp hx).1 |>.1)
                (show (x.2 : ℝ) ≥ 2 ^ (k + 1) by
                  exact_mod_cast BS.hwindow (k + 1) x.2 (Finset.mem_product.mp hx).2 |>.1)
                (by positivity) (by positivity)) 2
        calc
          ∑ pq ∈ (BS.P k ×ˢ BS.P (k + 1)),
              (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤
              ∑ _ ∈ (BS.P k ×ˢ BS.P (k + 1)),
                (1 : ℝ) / ((2 ^ k : ℝ) * (2 ^ (k + 1) : ℝ)) ^ 2 :=
            Finset.sum_le_sum h_term
          _ =
                ((BS.P k ×ˢ BS.P (k + 1)).card : ℝ) *
                  (1 / ((2 ^ k : ℝ) * (2 ^ (k + 1) : ℝ)) ^ 2) := by simp
          _ ≤ (2 ^ k * 2 ^ (k + 1) : ℝ) *
                  (1 / ((2 ^ k : ℝ) * (2 ^ (k + 1) : ℝ)) ^ 2) :=
            mul_le_mul_of_nonneg_right (by exact_mod_cast h_card_bipartite) (by positivity)
      have h_algebra :
          (2 ^ k * 2 ^ (k + 1) : ℝ) *
              (1 / ((2 ^ k : ℝ) * (2 ^ (k + 1) : ℝ)) ^ 2) =
            (1 / 4 : ℝ) ^ k * (1 / 2) := by
        rw [show (4 : ℝ) = 2 * 2 by norm_num, mul_pow, pow_succ]
        field_simp
        have h_power : ((2 : ℝ) ^ 2) ^ k = ((2 : ℝ) ^ k) ^ 2 := by
          rw [← pow_mul, ← pow_mul, mul_comm]
        rw [div_pow, one_pow, h_power]
        field_simp
      simpa only [bipartitePairs, add_comm] using h_sum_bipartite.trans_eq h_algebra
    refine' le_trans _ ( add_le_add ( Finset.sum_le_sum h_sum_bound ) ( Finset.sum_le_sum h_sum_bound_bipartite ) );
    rw [ ← Finset.sum_biUnion, ← Finset.sum_biUnion ];
    · rw [ ← Finset.sum_union_inter ];
      exact le_add_of_le_of_nonneg ( Finset.sum_le_sum_of_subset_of_nonneg ( by aesop_cat ) fun _ _ _ => by positivity ) ( Finset.sum_nonneg fun _ _ => by positivity );
    · intros k hk l hl hkl; simp_all +decide [ Finset.disjoint_left, bipartitePairs ] ;
      intro a b ha hb ha' hb'; have := blocks_disjoint BS ( show k ≠ l by tauto ) ; simp_all +decide [ Finset.disjoint_left ] ;
    · intros k hk l hl hkl; simp_all +decide [ Finset.disjoint_left, internalPairs ] ;
      exact fun a b ha hb hab ha' hb' => hkl <| by have := blocks_disjoint BS ( show k ≠ l from hkl ) ; exact False.elim <| Finset.disjoint_left.mp this ha ha';
  refine Real.sqrt_le_iff.mpr ?_;
  -- Evaluate the geometric series sum.
  have h_geo_sum : ∑ k ∈ Finset.Icc BS.k0 BS.K, (1 / 4 : ℝ) ^ k ≤ (4 / 3) * (1 / 4) ^ BS.k0 := by
    erw [ geom_sum_Ico ] <;> ring_nf <;> norm_num;
    linarith [ BS.hk ];
  norm_num [ ← Finset.sum_mul _ _ _ ] at *;
  linarith [ pow_le_pow_of_le_one ( by norm_num : ( 0 : ℝ ) ≤ 1 / 4 ) ( by norm_num ) hk0, show ( ∑ x ∈ Ico BS.k0 BS.K, ( 1 / 4 : ℝ ) ^ x ) ≤ ( 4 / 3 ) * ( 1 / 4 ) ^ BS.k0 by exact le_trans ( Finset.sum_le_sum_of_subset_of_nonneg ( Finset.subset_iff.mpr fun x hx => Finset.mem_Icc.mpr ⟨ Finset.mem_Ico.mp hx |>.1, Finset.mem_Ico.mp hx |>.2.le ⟩ ) fun _ _ _ => by positivity ) h_geo_sum ]

/-- The global control deviation is bounded by `4·2^{-k₀}`. -/
lemma sigmaCtrl_le_geom (BS : BlockSystem) (_hk0 : 2 ≤ BS.k0) :
    sigmaCtrl BS ≤ 4 / 2 ^ BS.k0 := by
  refine Real.sqrt_le_iff.mpr ⟨ by positivity, ?_ ⟩;
  -- Bound S exactly as in sigmaCtrl_le_one: split ctrlPairs into internal and bipartite biUnions (disjoint), each block internal sum ≤ (1/4)^k and bipartite sum ≤ (1/4)^k*(1/2).
  have h_split : ∑ pq ∈ ctrlPairs BS, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 ≤ ∑ k ∈ Finset.Icc BS.k0 BS.K, (1 / 4 : ℝ) ^ k + ∑ k ∈ Finset.Ico BS.k0 BS.K, (1 / 4 : ℝ) ^ k * (1 / 2) := by
    rw [ ctrlPairs, Finset.sum_union ];
    · refine' add_le_add _ _;
      · rw [ Finset.sum_biUnion ];
        · refine' Finset.sum_le_sum fun k hk => _;
          refine' le_trans ( Finset.sum_le_sum fun pq hpq => one_div_le_one_div_of_le _ <| pow_le_pow_left₀ ( by positivity ) ( mul_le_mul ( show ( pq.1 : ℝ ) ≥ 2 ^ k by exact_mod_cast BS.hwindow k pq.1 ( Finset.mem_filter.mp hpq |>.1 |> Finset.mem_product.mp |>.1 ) |>.1 ) ( show ( pq.2 : ℝ ) ≥ 2 ^ k by exact_mod_cast BS.hwindow k pq.2 ( Finset.mem_filter.mp hpq |>.1 |> Finset.mem_product.mp |>.2 ) |>.1 ) ( by positivity ) ( by positivity ) ) 2 ) _ <;> norm_num;
          -- The cardinality of the internal pairs is at most (P k).card * (P k).card.
          have h_card_internal : (internalPairs BS k).card ≤ (BS.P k).card * (BS.P k).card := by
            exact le_trans ( Finset.card_filter_le _ _ ) ( by norm_num );
          rw [ ← div_eq_mul_inv, div_le_iff₀ ] <;> norm_num [ pow_mul' ];
          norm_num [ sq, ← mul_pow ];
          exact_mod_cast by nlinarith [ block_card_le BS k, show ( 4 : ℕ ) ^ k = ( 2 ^ k ) ^ 2 by rw [ pow_right_comm ] ; norm_num ] ;
        · intros k hk l hl hkl; simp_all +decide [ Finset.disjoint_left, internalPairs ] ;
          exact fun a b ha hb hab ha' hb' => Finset.disjoint_left.mp ( blocks_disjoint BS hkl ) ha ha';
      · rw [ Finset.sum_biUnion ];
        · refine' Finset.sum_le_sum fun k hk => _;
          refine' le_trans ( Finset.sum_le_sum fun x hx => one_div_le_one_div_of_le ( by positivity ) <| pow_le_pow_left₀ ( by positivity ) ( mul_le_mul ( show ( x.1 : ℝ ) ≥ 2 ^ k by exact_mod_cast BS.hwindow k x.1 ( Finset.mem_product.mp hx |>.1 ) |>.1 ) ( show ( x.2 : ℝ ) ≥ 2 ^ ( k + 1 ) by exact_mod_cast BS.hwindow ( k + 1 ) x.2 ( Finset.mem_product.mp hx |>.2 ) |>.1 ) ( by positivity ) ( by positivity ) ) 2 ) _ ; norm_num [ pow_add, pow_mul ];
          unfold bipartitePairs; norm_num [ pow_mul', mul_pow ] ; ring_nf; norm_num;
          refine' le_trans ( mul_le_mul_of_nonneg_right ( mul_le_mul_of_nonneg_right ( mul_le_mul ( Nat.cast_le.mpr ( block_card_le BS k ) ) ( Nat.cast_le.mpr ( block_card_le BS ( 1 + k ) ) ) ( by positivity ) ( by positivity ) ) ( by positivity ) ) ( by positivity ) ) _ ; ring_nf ; norm_num;
          norm_num [ pow_mul', ← mul_pow ] ; ring_nf ; norm_num;
          norm_num [ pow_mul', ← mul_pow ];
        · intros k hk l hl hkl; simp_all +decide [ Finset.disjoint_left, bipartitePairs ] ;
          intro a b ha hb ha' hb'; have := BS.hwindow k a ha; have := BS.hwindow ( k + 1 ) b hb; have := BS.hwindow l a ha'; have := BS.hwindow ( l + 1 ) b hb';
          cases lt_or_gt_of_ne hkl <;> simp_all +decide [ pow_succ' ];
          · -- Since $k < l$, we have $2^l \geq 2^{k+1}$.
            have h_exp : 2 ^ l ≥ 2 ^ (k + 1) := by
              exact pow_le_pow_right₀ ( by decide ) ( by linarith );
            grind;
          · -- Since $l < k$, we have $2^l \leq 2^{k-1}$.
            have h_exp : 2 ^ l ≤ 2 ^ (k - 1) := by
              exact pow_le_pow_right₀ ( by decide ) ( Nat.le_pred_of_lt ‹_› );
            cases k <;> simp_all +decide [ pow_succ' ] ; linarith;
    · simp +decide [ Finset.disjoint_left, internalPairs, bipartitePairs ];
      intro a b x hx₁ hx₂ ha hb hab y hy₁ hy₂ ha' hb'; have := BS.hwindow x a ha; have := BS.hwindow x b hb; have := BS.hwindow ( y + 1 ) a; have := BS.hwindow ( y + 1 ) b; simp_all +decide [ Nat.pow_succ' ] ;
      by_cases hxy : x = y + 1;
      · have := BS.hwindow y a ha'; have := BS.hwindow y b; simp_all +decide [ Nat.pow_succ' ] ;
        grind;
      · have := blocks_disjoint BS ( show x ≠ y by rintro rfl; exact hxy <| by linarith ) ; simp_all +decide [ Finset.disjoint_left ] ;
  refine le_trans h_split ?_;
  erw [ Finset.sum_Ico_eq_sum_range, Finset.sum_Ico_eq_sum_range ] ; norm_num [ pow_mul', ← mul_pow ] ; ring_nf ; norm_num;
  norm_num [ pow_mul', ← Finset.mul_sum _ _ _, ← Finset.sum_mul, geom_sum_eq ] ; ring_nf ; norm_num;
  exact le_add_of_le_of_nonneg ( le_add_of_le_of_nonneg ( mul_le_mul_of_nonneg_left ( by norm_num ) ( by positivity ) ) ( by positivity ) ) ( by positivity )end GlobalControl

end

