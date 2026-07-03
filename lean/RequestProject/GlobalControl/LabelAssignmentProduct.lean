import RequestProject.GlobalControl.LevelSetParameters

/-!
# Products of admissible label windows

Admissible label assignments factor over segment starts, and each noninitial
window can be transported to the charge of its predecessor block.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- The number of admissible label assignments factors as the product of the
    per-segment-start window sizes. -/
lemma admLabels_card (BS : BlockSystem) (c2 R : ℝ) (H B : Finset ℕ) :
    (admLabels BS c2 R H B).card
      = ∏ s ∈ RequestProject.segmentStarts BS.k0 BS.K H B, (labelFin BS c2 R s).card := by
  rw [admLabels, Finset.card_image_of_injOn, Finset.card_pi]
  -- the zero-extension map is injective on the pi
  intro ℓ hℓ ℓ' hℓ' heq
  rw [Finset.mem_coe, Finset.mem_pi] at hℓ hℓ'
  funext s hs
  have := congrFun heq s
  simpa [dif_pos hs] using this

/-! ### RequestProject.segmentStarts / labelFin structural helpers -/

/-
Every segment start lies in the block range `[k0, K]`.
-/
lemma segStarts_le (BS : BlockSystem) (H B : Finset ℕ) {s : ℕ}
    (hs : s ∈ RequestProject.segmentStarts BS.k0 BS.K H B) : BS.k0 ≤ s ∧ s ≤ BS.K := by
  exact Finset.mem_Icc.mp ( Finset.mem_sdiff.mp ( Finset.mem_filter.mp hs |>.1 ) |>.1 )

/-
A non-initial segment start has its predecessor in `H ∪ B`.
-/
lemma segStarts_pred_mem (BS : BlockSystem) (H B : Finset ℕ) {s : ℕ}
    (hs : s ∈ RequestProject.segmentStarts BS.k0 BS.K H B) (hne : s ≠ BS.k0) : (s - 1) ∈ H ∨ (s - 1) ∈ B := by
  unfold RequestProject.segmentStarts at hs; aesop;
lemma label_product_le (BS : BlockSystem) (c2 e0 eps R : ℝ) (H B : Finset ℕ)
    (heps : 0 ≤ eps)
    (hRwnn : ∀ j ∈ H, 0 ≤ Rw c2 j)
    (hPinn : ∀ j ∈ B, 0 ≤ Pifloor BS e0 j)
    (hcharge : ∀ s ∈ RequestProject.segmentStarts BS.k0 BS.K H B, s ≠ BS.k0 →
        ((labelFin BS c2 R s).card : ℝ) ≤
          (if s - 1 ∈ H then Real.exp (eps * Rw c2 (s - 1))
           else Real.exp (eps * Pifloor BS e0 (s - 1)))) :
    (∏ s ∈ RequestProject.segmentStarts BS.k0 BS.K H B, ((labelFin BS c2 R s).card : ℝ))
      ≤ ((labelFin BS c2 R BS.k0).card : ℝ)
          * (∏ j ∈ H, Real.exp (eps * Rw c2 j))
          * (∏ j ∈ B, Real.exp (eps * Pifloor BS e0 j)) := by
  have h_erase : (∏ s ∈ (RequestProject.segmentStarts BS.k0 BS.K H B).erase BS.k0, (labelFin BS c2 R s).card : ℝ) ≤ (∏ j ∈ H, Real.exp (eps * Rw c2 j)) * (∏ j ∈ B, Real.exp (eps * Pifloor BS e0 j)) := by
    refine' le_trans ( Finset.prod_le_prod ( fun _ _ => Nat.cast_nonneg _ ) fun s hs => hcharge s _ _ ) _;
    · exact Finset.mem_of_mem_erase hs;
    · exact Finset.ne_of_mem_erase hs;
    · have h_split : (∏ s ∈ (RequestProject.segmentStarts BS.k0 BS.K H B).erase BS.k0, (if s - 1 ∈ H then Real.exp (eps * Rw c2 (s - 1)) else Real.exp (eps * Pifloor BS e0 (s - 1)))) = (∏ j ∈ (H ∪ B) ∩ Finset.image (fun s => s - 1) ((RequestProject.segmentStarts BS.k0 BS.K H B).erase BS.k0), if j ∈ H then Real.exp (eps * Rw c2 j) else Real.exp (eps * Pifloor BS e0 j)) := by
        refine' Finset.prod_bij ( fun s hs => s - 1 ) _ _ _ _ <;> simp_all +decide;
        · exact fun a ha₁ ha₂ => ⟨ segStarts_pred_mem BS H B ha₂ ha₁, a, ⟨ ha₁, ha₂ ⟩, rfl ⟩;
        · intro a₁ ha₁ ha₂ a₂ ha₃ ha₄ h; rw [ tsub_left_inj ] at h <;> linarith [ segStarts_le BS H B ha₂, segStarts_le BS H B ha₄, BS.hk0 ] ;
      rw [ h_split, ← Finset.prod_inter_mul_prod_sdiff ];
      refine' mul_le_mul _ _ _ _;
      any_goals exact H;
      · rw [ ← Finset.prod_inter_mul_prod_sdiff H ( ( H ∪ B ) ∩ image ( fun s => s - 1 ) ( ( RequestProject.segmentStarts BS.k0 BS.K H B ).erase BS.k0 ) ∩ H ) ];
        simp +decide [ Finset.inter_comm ];
        exact le_trans ( by rw [ Finset.prod_congr rfl fun x hx => if_pos <| Finset.mem_of_mem_inter_left hx ] ) ( le_mul_of_one_le_right ( Finset.prod_nonneg fun _ _ => Real.exp_nonneg _ ) <| le_trans ( by norm_num ) <| Finset.prod_le_prod ( fun _ _ => by positivity ) fun _ _ => Real.one_le_exp <| mul_nonneg heps <| hRwnn _ <| Finset.mem_sdiff.mp ‹_› |>.1 );
      · rw [ ← Finset.prod_sdiff <| show ( ( H ∪ B ) ∩ image ( fun s => s - 1 ) ( ( RequestProject.segmentStarts BS.k0 BS.K H B ).erase BS.k0 ) ) \ H ⊆ B from ?_ ];
        · rw [ Finset.prod_congr rfl fun x hx => if_neg <| by aesop ];
          exact le_mul_of_one_le_left ( Finset.prod_nonneg fun _ _ => Real.exp_nonneg _ ) ( by exact le_trans ( by norm_num ) ( Finset.prod_le_prod ( fun _ _ => by positivity ) fun _ _ => Real.one_le_exp ( mul_nonneg heps ( hPinn _ ( by aesop ) ) ) ) );
        · grind;
      · exact Finset.prod_nonneg fun x hx => by split_ifs <;> positivity;
      · exact Finset.prod_nonneg fun _ _ => Real.exp_nonneg _;
  by_cases h : BS.k0 ∈ RequestProject.segmentStarts BS.k0 BS.K H B <;> simp_all +decide [ mul_assoc ];
  · rw [ ← Finset.mul_prod_erase _ _ h ] ; exact mul_le_mul_of_nonneg_left h_erase <| Nat.cast_nonneg _;
  · exact le_trans h_erase ( le_mul_of_one_le_left ( mul_nonneg ( Finset.prod_nonneg fun _ _ => Real.exp_nonneg _ ) ( Finset.prod_nonneg fun _ _ => Real.exp_nonneg _ ) ) ( mod_cast Finset.card_pos.mpr ⟨ 0, by
      unfold labelFin; simp +decide [ L0 ] ;
      exact Int.ceil_nonneg ( div_nonneg ( mul_nonneg ( by norm_num ) ( Real.sqrt_nonneg _ ) ) ( sigmaP_nonneg _ ) ) ⟩ ) )
end GlobalControl

end

