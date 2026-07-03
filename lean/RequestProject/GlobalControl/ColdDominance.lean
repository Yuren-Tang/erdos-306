import RequestProject.GlobalControl.LabelAdmissibility
import RequestProject.GlobalControl.LabelAssignmentProduct

/-!
# Cold dominance and admissible labels

Local nondominant-energy forcing is transferred to every cold block. The
resulting uniform constants provide boundary penalties, dominant labels, and
admissible label data for the global encoding.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ### Cold dominance and label admissibility -/

/-- **Cold-regime dominance for arbitrary block assignments.**
    At parameter `c2`, eventually every block-assignment of cold energy
    (`< Rw c2 k`) admits a dominant `(1/4)`-label.  This is
    `nondominant_energy_lower_bound` re-routed to `BlockSystem` blocks; it holds
    only for `c2` at most Theorem-B's intrinsic constant, so it is carried as a
    hypothesis through the cold-count chain. -/
def ColdDominance (c2 : ℝ) : Prop :=
  ∃ X1 : ℝ, 0 < X1 ∧ ∀ (BS : BlockSystem) (k : ℕ),
    BS.k0 ≤ k → k ≤ BS.K → X1 ≤ (2:ℝ) ^ k →
    ∀ (b : BlockAssignment (BS.P k)) (Rb : ℝ),
      QP (BS.P k) b ≤ Rb → Rb < Rw c2 k →
      LocalEnergy.HasDominantLabel ((2:ℕ) ^ k) (BS.P k) b (1/4)

/-- `Rw` is monotone in the constant `c2`. -/
private lemma Rw_mono_c2 {c2 c2' : ℝ} (hc : c2 ≤ c2') (_hc0 : 0 ≤ c2) (k : ℕ) :
    Rw c2 k ≤ Rw c2' k := by
  have hden : 0 ≤ (Real.log (2 ^ k)) ^ 3 := by
    have h := Real.log_nonneg (show (1:ℝ) ≤ 2 ^ k from one_le_pow₀ (by norm_num))
    positivity
  unfold Rw
  rcases hden.lt_or_eq with hd | hd
  · gcongr
  · rw [← hd]; simp

/-- Coldness only strengthens as `c2` shrinks: `¬ isHot` at the smaller constant
    implies `¬ isHot` at the larger one. -/
private lemma not_isHot_mono_cold {c2 c2' : ℝ} (hc : c2 ≤ c2') (hc0 : 0 ≤ c2)
    (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ) :
    ¬ isHot BS c2 a k → ¬ isHot BS c2' a k := by
  intro h hHot
  exact h (le_trans (Rw_mono_c2 hc hc0 k) hHot)

/-- The boundary set grows with `c2`. -/
private lemma boundarySet_mono {c2 c2' : ℝ} (hc : c2 ≤ c2') (hc0 : 0 ≤ c2)
    (BS : BlockSystem) (a : GlobalAssignment BS) :
    boundarySet BS c2 a ⊆ boundarySet BS c2' a := by
  intro k hk
  rw [boundarySet, Finset.mem_filter] at hk ⊢
  exact ⟨hk.1, not_isHot_mono_cold hc hc0 BS a k hk.2.1,
    not_isHot_mono_cold hc hc0 BS a (k+1) hk.2.2.1, hk.2.2.2⟩

/-
**Two-prime label rigidity.**  Two integer labels agreeing modulo at least
    two distinct primes from a window `[X, 2X]`, and differing by less than `X²`,
    must be equal.
-/
lemma two_prime_label_eq (X : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X)
    (m₁ m₂ : ℤ) (S : Finset { x // x ∈ P }) (hScard : 2 ≤ S.card)
    (hagree : ∀ p ∈ S, (m₁ : ZMod (p:ℕ)) = (m₂ : ZMod (p:ℕ)))
    (hbound : |m₁ - m₂| < (X:ℤ)^2) :
    m₁ = m₂ := by
  obtain ⟨ p₁, hp₁, p₂, hp₂, hne ⟩ := Finset.one_lt_card.mp hScard; have := hagree p₁ hp₁; have := hagree p₂ hp₂; simp_all +decide [ ZMod.intCast_eq_intCast_iff ] ;
  -- Since $p₁$ and $p₂$ are distinct primes, their product $p₁ * p₂$ divides $m₁ - m₂$.
  have h_div : (p₁.val * p₂.val : ℤ) ∣ (m₁ - m₂) := by
    convert Int.coe_lcm_dvd ( Int.modEq_iff_dvd.mp ( hagree p₁.1 p₁.2 hp₁ |> Int.ModEq.symm ) ) ( Int.modEq_iff_dvd.mp ( hagree p₂.1 p₂.2 hp₂ |> Int.ModEq.symm ) ) using 1 ; norm_cast;
    exact Eq.symm ( Nat.Coprime.lcm_eq_mul <| by have := Nat.coprime_primes ( hP _ p₁.2 |>.1 ) ( hP _ p₂.2 |>.1 ) ; aesop );
  -- Since $p₁$ and $p₂$ are distinct primes, their product $p₁ * p₂$ is at least $X^2$.
  have h_prod_ge_X2 : (p₁.val * p₂.val : ℤ) ≥ X^2 := by
    exact_mod_cast by nlinarith only [ hP p₁ p₁.2, hP p₂ p₂.2 ] ;
  exact Classical.not_not.1 fun h => by have := Int.le_of_dvd ( abs_pos.2 ( sub_ne_zero_of_ne h ) ) ( by simpa using h_div ) ; linarith [ abs_lt.mp hbound ] ;

/-
**Master cold constants.**  A single triple `(c2,e0,X0)` providing both the
    block-dominance (`HasDominantLabel`) used to read off cold labels and the boundary
    penalty floor.  Both are obtained from `boundary_penalty_per_k` (whose cold
    facts already expose, for the same `c2`, the residue agreement that yields
    dominance for `X0` large).
-/
private lemma exists_cold_control_parameters_aux :
    ∃ (c2 e0 X0 : ℝ), 0 < c2 ∧ 0 < e0 ∧ 0 < X0 ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k → ¬ isHot BS c2 a k →
        LocalEnergy.HasDominantLabel (2 ^ k) (BS.P k) (restrict BS a k) (1/4)) ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k < BS.K → X0 ≤ (2:ℝ) ^ k → k ∈ boundarySet BS c2 a →
        Pifloor BS e0 k ≤ Xen BS a k) := by
  obtain ⟨ c2, e0, X0, hc2, he0, hX0, h ⟩ := boundary_penalty_per_k;
  obtain ⟨X0thr, hX0thr⟩ : ∃ X0thr : ℕ, ∀ X : ℕ, X0thr ≤ X → 16 * e0 * Real.log X ≤ X := by
    have := RequestProject.eventually_const_mul_log_le_nat ( 16 * e0 );
    exact ⟨ ⌈this.choose⌉₊, fun X hX => this.choose_spec.2 X <| Nat.le_of_ceil_le hX ⟩;
  refine' ⟨ c2, e0, Max.max X0 ( Max.max 16 X0thr ), hc2, he0, _, _, _ ⟩ <;> norm_num;
  · intro BS a k hk1 hk2 hk3 hk4 hk5 hk6
    obtain ⟨h_card, h_abs, h_res⟩ := h.left BS a k hk1 hk2 hk3 hk6
    have h_class_count : (classCount BS a k (coldLabel BS a k) : ℝ) ≥ (3 / 4 : ℝ) * (BS.P k).card := by
      have h_class_count : (classCount BS a k (coldLabel BS a k) : ℝ) ≥ (BS.P k).card - (excSet BS a k).card := by
        have h_class_count : (classCount BS a k (coldLabel BS a k) : ℝ) ≥ (BS.P k \ excSet BS a k).card := by
          rw [ conform_card_eq BS a k ( Finset.mem_Icc.mpr ⟨ hk1, hk2 ⟩ ) ];
        rw [ Finset.card_sdiff ] at h_class_count;
        rw [ Nat.cast_sub ] at h_class_count;
        · exact le_trans ( sub_le_sub_left ( Nat.cast_le.mpr <| Finset.card_mono <| Finset.inter_subset_left ) _ ) h_class_count;
        · exact Finset.card_le_card fun x hx => by aesop;
      have h_card_bound : (BS.P k).card ≥ (2 ^ k : ℝ) / (2 * Real.log (2 ^ k)) := by
        exact BS.hdensity k hk1 hk2;
      have := hX0thr ( 2 ^ k ) ( by exact_mod_cast hk5 ) ; norm_num at *;
      rw [ div_le_iff₀ ] at h_card_bound <;> nlinarith [ show ( k : ℝ ) * Real.log 2 > 0 by exact mul_pos ( Nat.cast_pos.mpr ( Nat.pos_of_ne_zero ( by rintro rfl; norm_num at hk4 ) ) ) ( Real.log_pos one_lt_two ) ]
    exact (by
    refine' ⟨ coldLabel BS a k, _, _ ⟩;
    · rw [ le_div_iff₀ ] at * <;> norm_cast at *;
      have h_card_le : (BS.P k).card ≤ 2 ^ k := by
        have h_card_le : (BS.P k).card ≤ Finset.card (Finset.Ico (2 ^ k) (2 ^ (k + 1))) := by
          exact Finset.card_le_card fun x hx => Finset.mem_Ico.mpr <| BS.hwindow k x hx;
        exact h_card_le.trans ( by norm_num [ pow_succ' ] ; linarith );
      rw [ Nat.le_iff_lt_or_eq ] at h_card_le ; norm_num at *;
      cases h_card_le <;> nlinarith [ Nat.div_add_mod ( ( 2 ^ k ) ^ 2 ) 2, Nat.mod_lt ( ( 2 ^ k ) ^ 2 ) two_pos ];
    · norm_num
      simpa only [classCount] using h_class_count.le);
  · exact fun BS a k hk₁ hk₂ hk₃ hk₄ hk₅ hk₆ => h.2 BS a k hk₁ hk₂ hk₃ hk₆

/-
**Master cold constants** (with arbitrary-block-assignment cold dominance).
    Strengthens `exists_cold_control_parameters_aux` by shrinking `c2` to also lie below
    Theorem-B's intrinsic constant, exposing `ColdDominance c2` in addition to
    the block dominance for restrictions and the boundary penalty floor.
-/
lemma exists_cold_control_parameters :
    ∃ (c2 e0 X0 : ℝ), 0 < c2 ∧ 0 < e0 ∧ 0 < X0 ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k → ¬ isHot BS c2 a k →
        LocalEnergy.HasDominantLabel (2 ^ k) (BS.P k) (restrict BS a k) (1/4)) ∧
      (∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k < BS.K → X0 ≤ (2:ℝ) ^ k → k ∈ boundarySet BS c2 a →
        Pifloor BS e0 k ≤ Xen BS a k) ∧
      ColdDominance c2 := by
  obtain ⟨c2P, e0, X0P, hc2P, he0, hX0P, hdomR, hpen⟩ :=
    GlobalControl.exists_cold_control_parameters_aux
  obtain ⟨c2B, X0B, hc2B, hX0B, HB⟩ := LocalEnergy.nondominant_energy_lower_bound (1/4) (by norm_num) (by norm_num);
  refine' ⟨ Min.min c2P c2B, e0, Max.max X0P ( Max.max X0B 1 ), _, _, _, _, _, _ ⟩ <;> norm_num [ hc2P, he0, hX0P, hc2B, hX0B ];
  · intro BS a k hk1 hk2 hX0P hX0B h1 hnh;
    apply hdomR BS a k hk1 hk2 hX0P;
    exact not_isHot_mono_cold ( min_le_left _ _ ) ( le_of_lt ( lt_min hc2P hc2B ) ) BS a k hnh;
  · intro BS a k hk1 hk2 hX0P hX0B h1 hk; exact hpen BS a k hk1 hk2 hX0P ( boundarySet_mono ( min_le_left _ _ ) ( le_of_lt ( lt_min hc2P hc2B ) ) BS a hk ) ;
  · refine' ⟨ Max.max X0B 1, by positivity, _ ⟩;
    intro BS k hk1 hk2 hk3 b Rb hQ hRb;
    contrapose! HB;
    refine' ⟨ 2 ^ k, _, BS.P k, _, _, _, b, Rb, hQ, HB, _ ⟩ <;> norm_num at *;
    · linarith;
    · exact fun p hp => ⟨ Nat.Prime.ne_zero ( BS.hprime k p hp ) ⟩;
    · exact fun p hp => ⟨ BS.hprime k p hp, by linarith [ BS.hwindow k p hp ], by linarith [ BS.hwindow k p hp, pow_succ' ( 2 : ℕ ) k ] ⟩;
    · convert BS.hdensity k hk1 hk2 using 1 ; norm_num [ Real.log_pow ];
    · refine lt_of_lt_of_le hRb ?_
      calc
        Rw (min c2P c2B) k ≤ Rw c2B k :=
          Rw_mono_c2 (min_le_right c2P c2B) (le_of_lt (lt_min hc2P hc2B)) k
        _ = c2B * 2 ^ k / ((k : ℝ) * Real.log 2) ^ 3 := by
          rw [Rw, Real.log_pow]

/-
**Label admissibility.**  For `k0` past a uniform threshold, the
    zero-extended cold labels of any sub-`R` assignment lie in `admLabels`.
    This routes `coldLabel_mem_labelFin` (using the dominant-label conclusion
    of `exists_cold_control_parameters`)
    through every segment start.
-/
lemma cold_labels_admissible (c2 X0 : ℝ) (hc2 : 0 < c2)
    (hdom : ∀ (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ),
        BS.k0 ≤ k → k ≤ BS.K → X0 ≤ (2:ℝ) ^ k → ¬ isHot BS c2 a k →
        LocalEnergy.HasDominantLabel (2 ^ k) (BS.P k) (restrict BS a k) (1/4)) :
    ∃ k0min : ℕ, ∀ (BS : BlockSystem), k0min ≤ BS.k0 → X0 ≤ (2:ℝ) ^ BS.k0 →
      ∀ (a : GlobalAssignment BS) (R : ℝ), 0 ≤ R → Qctrl BS a ≤ R →
        extLabel BS a (hotSet BS c2 a) (boundarySet BS c2 a)
          ∈ admLabels BS c2 R (hotSet BS c2 a) (boundarySet BS c2 a) := by
  -- Choose k0min such that for all s ≥ k0min, 16 ≤ 2^s, 8 ≤ (BS.P s).card, and 1 ≤ Real.log (2^s).
  obtain ⟨k0min, hk0min⟩ : ∃ k0min : ℕ, ∀ s : ℕ, k0min ≤ s →
      16 ≤ (2:ℕ) ^ s ∧ 8 ≤ (2 ^ s / (2 * Real.log (2 ^ s))) := by
        refine' ⟨ 16, fun s hs => ⟨ _, _ ⟩ ⟩;
        · exact le_trans ( by norm_num ) ( pow_le_pow_right₀ ( by norm_num ) hs );
        · rw [ le_div_iff₀ ( by exact mul_pos zero_lt_two ( Real.log_pos ( one_lt_pow₀ one_lt_two ( by linarith ) ) ) ) ];
          induction hs <;> norm_num [ pow_succ' ] at *;
          · rw [ show ( 65536 : ℝ ) = 2 ^ 16 by norm_num, Real.log_pow ] ; norm_num ; linarith [ Real.log_le_sub_one_of_pos zero_lt_two ];
          · rw [ Real.log_mul ( by positivity ) ( by positivity ), Real.log_pow ];
            nlinarith [ Real.log_le_sub_one_of_pos zero_lt_two, Real.log_pos one_lt_two, ( by norm_cast : ( 16 : ℝ ) ≤ ↑‹ℕ› ), pow_le_pow_right₀ ( by norm_num : ( 1 : ℝ ) ≤ 2 ) ‹16 ≤ _› ];
  use k0min;
  intro BS hBS hX0 a R hR0 hR1;
  apply extLabel_mem_admLabels;
  intro s hs
  have hs1 : BS.k0 ≤ s := by
    exact segStarts_le BS _ _ hs |>.1
  have hs2 : s ≤ BS.K := by
    exact segStarts_le BS _ _ hs |>.2
  have hslog : 1 ≤ Real.log (2 ^ s) := by
    rw [ Real.le_log_iff_exp_le ( by positivity ) ];
    exact le_trans ( Real.exp_one_lt_d9.le ) ( by norm_num; linarith [ show ( 2 : ℝ ) ^ s ≥ 16 by exact_mod_cast hk0min s ( by linarith ) |>.1 ] )
  have hN8 : 8 ≤ (BS.P s).card := by
    have := BS.hdensity s ( by linarith ) ( by linarith );
    exact_mod_cast this.trans' ( hk0min s ( by linarith ) |>.2 )
  have hσpos : 0 < sigmaP (BS.P s) := by
    apply sigmaP_pos_of_two;
    · exact fun p hp => BS.hprime s p hp;
    · linarith
  have hbR : blockEnergy BS a s ≤ R := by
    exact le_trans ( Finset.single_le_sum ( fun k _ => QP_nonneg ( BS.P k ) ( restrict BS a k ) ) ( Finset.mem_Icc.mpr ⟨ hs1, hs2 ⟩ ) ) ( sum_blockEnergy_le BS a R hR1 )
  have hcold : ¬ isHot BS c2 a s := by
    have := Finset.mem_filter.mp hs; simp_all +decide [ Finset.mem_sdiff ] ;
    exact fun h => this.1 <| Finset.mem_filter.mpr ⟨ Finset.mem_Icc.mpr ⟨ hs1, hs2 ⟩, h ⟩
  have hdomk : LocalEnergy.HasDominantLabel (2 ^ s) (BS.P s) (restrict BS a s) (1 / 4) := by
    exact hdom BS a s hs1 hs2 ( by exact le_trans hX0 ( pow_le_pow_right₀ ( by norm_num ) hs1 ) ) hcold;
  apply coldLabel_mem_labelFin BS c2 R a s hs1 hs2 hR0 hc2.le (hk0min s (by linarith)).left hN8 hslog hdomk hcold hbR hσpos

end GlobalControl

end
