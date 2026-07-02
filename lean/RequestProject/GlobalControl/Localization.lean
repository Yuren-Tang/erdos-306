import RequestProject.GlobalControl.ColdBlockCollapse
import RequestProject.GlobalControl.DiagonalControlEnergy
import RequestProject.GlobalControl.ForcingFloorComparison

/-!
# Global localization dichotomy

An assignment outside the main arc either lies above the global control floor or is globally diagonal with exact quadratic energy.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## Main theorem -/

/-
An off-main-arc assignment is
either above the global energy floor, or lies in the diagonal sector.
-/
theorem localization_dichotomy :
    ∃ (k0loc : ℕ) (c2 e0 : ℝ), 0 < c2 ∧ 0 < e0 ∧
      ∀ (BS : BlockSystem), k0loc ≤ BS.k0 → admissibleGlobalRange BS →
      ∀ (C : ℝ), 1 ≤ C →
      ∀ a : GlobalAssignment BS, a ∉ mainArc BS C →
        globalControlFloor BS c2 e0 ≤ Qctrl BS a ∨ diagSector BS C a := by
  obtain ⟨c2, e0, X0, hc2, he0, hX0, hcf, hbd, hnoexc⟩ := GlobalControl.cold_no_exceptions;
  obtain ⟨kRwPi, hkRwPi4, hRwPi⟩ := GlobalControl.Rw_le_Pifloor c2 e0 hc2 he0;
  obtain ⟨N, hN⟩ : ∃ N : ℕ, X0 < 2 ^ N := by
    exact pow_unbounded_of_one_lt X0 one_lt_two;
  refine' ⟨ Max.max ( Max.max 4 kRwPi ) N, c2, e0, hc2, he0, fun BS hk0 hadm C hC a ha => _ ⟩;
  by_cases hH : (hotSet BS c2 a).Nonempty;
  · obtain ⟨ k, hk ⟩ := hH;
    refine' Or.inl ( le_trans _ ( blockEnergy_le_Qctrl BS a k _ ) );
    · refine' le_trans ( min_le_left _ _ ) _;
      refine' le_trans _ ( Finset.mem_filter.mp hk |>.2 );
      exact Rw_mono c2 hc2 ( by linarith [ Finset.mem_Icc.mp ( Finset.mem_filter.mp hk |>.1 ), le_max_left ( max 4 kRwPi ) N, le_max_right ( max 4 kRwPi ) N, le_max_left 4 kRwPi, le_max_right 4 kRwPi ] ) ( by linarith [ Finset.mem_Icc.mp ( Finset.mem_filter.mp hk |>.1 ), le_max_left ( max 4 kRwPi ) N, le_max_right ( max 4 kRwPi ) N, le_max_left 4 kRwPi, le_max_right 4 kRwPi ] );
    · exact Finset.mem_filter.mp hk |>.1;
  · by_cases hB : (boundarySet BS c2 a).Nonempty;
    · obtain ⟨ k, hk ⟩ := hB;
      refine' Or.inl ( le_trans _ ( le_trans ( hRwPi BS ( by linarith [ le_max_left ( max 4 kRwPi ) N, le_max_right ( max 4 kRwPi ) N, le_max_left 4 kRwPi, le_max_right 4 kRwPi ] ) hadm k ( by
        exact Finset.mem_Ico.mp ( Finset.mem_filter.mp hk |>.1 ) |>.1 ) ( by
        exact Finset.mem_Ico.mp ( Finset.mem_filter.mp hk |>.1 ) |>.2 ) ) ( le_trans ( hbd BS a k ( by
        exact Finset.mem_Ico.mp ( Finset.mem_filter.mp hk |>.1 ) |>.1 ) ( by
        exact Finset.mem_Ico.mp ( Finset.mem_filter.mp hk |>.1 ) |>.2 ) ( by
        exact le_trans hN.le ( pow_le_pow_right₀ ( by norm_num ) ( by linarith [ Finset.mem_Ico.mp ( Finset.mem_filter.mp hk |>.1 ), le_max_right ( max 4 kRwPi ) N, le_max_right 4 kRwPi, le_max_left ( max 4 kRwPi ) N, le_max_left 4 kRwPi, le_max_right ( max 4 kRwPi ) N, le_max_right 4 kRwPi, hk0 ] ) ) ) hk ) ( Xen_le_Qctrl BS a k ( by
        exact Finset.mem_filter.mp hk |>.1 ) ) ) ) );
      exact min_le_left _ _;
    · refine Or.inr ⟨ coldLabel BS a BS.k0, ?_, ?_, ?_ ⟩;
      · intro p
        obtain ⟨k, hk0k, hkK, hpk⟩ : ∃ k, BS.k0 ≤ k ∧ k ≤ BS.K ∧ p.val ∈ BS.P k := by
          exact Exists.elim ( Finset.mem_biUnion.mp p.2 ) fun k hk => ⟨ k, by aesop ⟩;
        have hcold : coldLabel BS a k = coldLabel BS a BS.k0 := by
          convert coldLabel_eq_segStart BS c2 a k hk0k hkK _ using 1;
          · rw [ show RequestProject.segmentStart BS.k0 ( hotSet BS c2 a ) ( boundarySet BS c2 a ) k = BS.k0 from ?_ ];
            rw [ show hotSet BS c2 a = ∅ from Finset.not_nonempty_iff_eq_empty.mp hH, show boundarySet BS c2 a = ∅ from Finset.not_nonempty_iff_eq_empty.mp hB ] ; exact RequestProject.segmentStart_empty BS.k0 k;
          · exact fun h => hH ⟨ k, h ⟩;
        have := hcf BS a k hk0k hkK ( by linarith [ pow_le_pow_right₀ ( by norm_num : ( 1 : ℝ ) ≤ 2 ) ( show k ≥ N by linarith [ Nat.le_max_right ( max 4 kRwPi ) N ] ) ] ) ( by
                                                                                                          exact fun h => hH ⟨ k, Finset.mem_filter.mpr ⟨ Finset.mem_Icc.mpr ⟨ hk0k, hkK ⟩, h ⟩ ⟩ );
        convert this.2.2 p.val ( Finset.mem_sdiff.mpr ⟨ hpk, ?_ ⟩ ) using 1;
        · unfold toPlain; aesop;
        · rw [ hcold ];
        · exact fun h => by have := hnoexc BS a k hk0k hkK ( by
            exact le_trans hN.le ( pow_le_pow_right₀ ( by norm_num ) ( by linarith [ Nat.le_max_right ( max 4 kRwPi ) N ] ) ) ) ( by
            exact fun h => hH ⟨ k, Finset.mem_filter.mpr ⟨ Finset.mem_Icc.mpr ⟨ hk0k, hkK ⟩, h ⟩ ⟩ ) ; exact Finset.notMem_empty _ ( this ▸ h ) ;
      · contrapose! ha;
        refine' ⟨ coldLabel BS a BS.k0, ha, _ ⟩;
        intro p
        obtain ⟨k, hk0k, hkK, hpk⟩ : ∃ k, BS.k0 ≤ k ∧ k ≤ BS.K ∧ p.val ∈ BS.P k := by
          have := Finset.mem_biUnion.mp p.2; aesop;
        have hck : ¬ isHot BS c2 a k := by
          exact fun h => hH ⟨ k, Finset.mem_filter.mpr ⟨ Finset.mem_Icc.mpr ⟨ hk0k, hkK ⟩, h ⟩ ⟩;
        have hck : toPlain BS a p = coldLabel BS a k := by
          apply (hcf BS a k hk0k hkK (by
          exact le_trans hN.le ( pow_le_pow_right₀ ( by norm_num ) ( by linarith [ Nat.le_max_right ( max 4 kRwPi ) N ] ) )) hck).right.right p (by
          simp [hnoexc BS a k hk0k hkK (by
          exact le_trans hN.le ( pow_le_pow_right₀ ( by norm_num ) ( by linarith [ Nat.le_max_right ( max 4 kRwPi ) N ] ) )) hck];
          exact hpk);
        have hck : coldLabel BS a k = coldLabel BS a BS.k0 := by
          convert coldLabel_eq_segStart BS c2 a k hk0k hkK _ using 1;
          · rw [ show RequestProject.segmentStart BS.k0 ( hotSet BS c2 a ) ( boundarySet BS c2 a ) k = BS.k0 from ?_ ];
            rw [ show hotSet BS c2 a = ∅ from Finset.not_nonempty_iff_eq_empty.mp hH, show boundarySet BS c2 a = ∅ from Finset.not_nonempty_iff_eq_empty.mp hB ] ; exact RequestProject.segmentStart_empty BS.k0 k;
          · exact fun h => hH ⟨ k, h ⟩;
        unfold toPlain at *; aesop;
      · apply diagonal_Qctrl;
        · intro p
          obtain ⟨k, hk0k, hkK, hpk⟩ : ∃ k, BS.k0 ≤ k ∧ k ≤ BS.K ∧ p.val ∈ BS.P k := by
            exact Exists.elim ( Finset.mem_biUnion.mp p.2 ) fun k hk => ⟨ k, by aesop ⟩;
          have hck : ¬ isHot BS c2 a k := by
            exact fun h => hH ⟨ k, Finset.mem_filter.mpr ⟨ Finset.mem_Icc.mpr ⟨ hk0k, hkK ⟩, h ⟩ ⟩;
          have hck : coldLabel BS a k = coldLabel BS a BS.k0 := by
            convert coldLabel_eq_segStart BS c2 a k hk0k hkK _ using 1;
            · rw [ show RequestProject.segmentStart BS.k0 ( hotSet BS c2 a ) ( boundarySet BS c2 a ) k = BS.k0 from ?_ ];
              rw [ show hotSet BS c2 a = ∅ from Finset.not_nonempty_iff_eq_empty.mp hH, show boundarySet BS c2 a = ∅ from Finset.not_nonempty_iff_eq_empty.mp hB ] ; exact RequestProject.segmentStart_empty BS.k0 k;
            · exact fun h => hH ⟨ k, h ⟩;
          have := hcf BS a k hk0k hkK ( by
            exact le_trans hN.le ( pow_le_pow_right₀ ( by norm_num ) ( by linarith [ Nat.le_max_right ( max 4 kRwPi ) N ] ) ) ) ‹_›;
          convert this.2.2 p.val ( Finset.mem_sdiff.mpr ⟨ hpk, by
            exact fun h => by have := hnoexc BS a k hk0k hkK ( by
              exact le_trans ( le_of_lt hN ) ( pow_le_pow_right₀ ( by norm_num ) ( by linarith [ Nat.le_max_right ( max 4 kRwPi ) N ] ) ) ) ‹_›; simp_all +decide [ Finset.ext_iff ] ; ⟩ ) using 1;
          · unfold toPlain; aesop;
          · rw [ hck ];
        · intro pq hpq
          have h_label_bound : |(coldLabel BS a BS.k0 : ℝ)| ≤ (2 : ℝ) ^ (2 * BS.k0) / 64 := by
            have h_label_bound : |(coldLabel BS a BS.k0 : ℝ)| ≤ ((BS.P BS.k0).card : ℝ) * (2 : ℝ) ^ BS.k0 / 64 := by
              apply (hcf BS a BS.k0 (by linarith) (by linarith [BS.hk]) (by
              exact le_trans hN.le ( pow_le_pow_right₀ ( by norm_num ) ( by linarith [ Nat.le_max_right ( max 4 kRwPi ) N ] ) )) (by
              exact fun h => hH ⟨ BS.k0, Finset.mem_filter.mpr ⟨ Finset.mem_Icc.mpr ⟨ by linarith, by linarith [ BS.hk ] ⟩, h ⟩ ⟩)).right.left;
            refine le_trans h_label_bound ?_;
            rw [ pow_mul' ];
            rw [ sq ];
            rw [ mul_comm ] ; gcongr;
            exact_mod_cast GlobalControl.block_card_le BS BS.k0;
          have h_prod_bound : (2 : ℝ) ^ (2 * BS.k0) < (pq.1 : ℝ) * (pq.2 : ℝ) := by
            exact_mod_cast ctrlPairs_prod_lower BS ( by linarith [ le_max_left ( max 4 kRwPi ) N, le_max_right ( max 4 kRwPi ) N, le_max_left 4 kRwPi, le_max_right 4 kRwPi ] ) hpq;
          rw [ ← @Int.cast_lt ℝ ] ; push_cast ; linarith [ abs_nonneg ( coldLabel BS a BS.k0 : ℝ ) ]

end GlobalControl

end
