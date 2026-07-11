import RequestProject.GlobalControl.BoundaryCharge
import RequestProject.GlobalControl.LabelAssignmentProduct
import RequestProject.GlobalControl.SubsetCharge

/-!
# Aggregation of level-set charges

Hot-block and boundary charges are summed over admissible subsets, while the
initial and subsequent dominant-label windows are absorbed into their
corresponding energy charges.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-
Charge sum over admissible hot sets: `∑_H ∏_{j∈H} exp(ε·Rw j) ≤ exp(2εR)·exp(nB)`.
    `admH` is exactly the `Icc`-powerset filtered by `∑ Rw ≤ R`, so this is a
    direct instance of `sum_subset_charge_le` (with `Rw ≥ 0`).
-/
lemma hot_set_charge_sum_bound
    (eps c2 R : ℝ) (heps : 0 < eps) (hc2 : 0 < c2) (BS : BlockSystem) :
    (∑ H ∈ admH BS c2 R, ∏ j ∈ H, Real.exp (eps * Rw c2 j))
      ≤ Real.exp (2 * eps * R) * Real.exp (numBlocks BS) := by
  simpa only [admH] using
    sum_subset_charge_le BS (fun j => Rw c2 j) R eps heps
      (fun j _ => div_nonneg (mul_nonneg hc2.le (pow_nonneg zero_le_two _))
        (pow_nonneg (Real.log_nonneg (one_le_pow₀ one_le_two)) _))

/-
Charge sum over admissible boundary sets: `∑_B ∏_{j∈B} exp(ε·Pifloor j) ≤
    exp(2εR)·exp(nB)`.  `admB` ranges over `Ico`-powersets, so we apply
    `sum_subset_charge_le` to the truncated weight `(if j < K then Pifloor j else 0)`
    (nonnegative on `Icc` by `Pifloor_nonneg`), using `admB ⊆` the `Icc` filter.
-/
lemma boundary_set_charge_sum_bound
    (eps e0 : ℝ) (heps : 0 < eps) (he0 : 0 < e0) :
    ∃ k0min : ℕ, ∀ (BS : BlockSystem), k0min ≤ BS.k0 → ∀ R : ℝ,
      (∑ B ∈ admB BS e0 R, ∏ j ∈ B, Real.exp (eps * Pifloor BS e0 j))
        ≤ Real.exp (2 * eps * R) * Real.exp (numBlocks BS) := by
  -- Apply `Pifloor_nonneg` to find `kP` such that for all `j ≥ kP`, `Pifloor BS e0 j ≥ 0`.
  obtain ⟨kP, hkP⟩ : ∃ kP : ℕ, ∀ (BS : BlockSystem) (j : ℕ), kP ≤ j → BS.k0 ≤ j → j < BS.K → 0 ≤ Pifloor BS e0 j :=
    Pifloor_nonneg e0 he0
  use kP; intros BS hBS R; simp_all +decide [ admB ] ;
  refine' le_trans _ ( GlobalControl.sum_subset_charge_le BS ( fun j => if j < BS.K then Pifloor BS e0 j else 0 ) R eps heps _ );
  · refine' le_trans _ ( Finset.sum_le_sum_of_subset_of_nonneg _ _ );
    rotate_left;
    exact Finset.image ( fun B => B ) ( Finset.filter ( fun B => ∑ j ∈ B, Pifloor BS e0 j ≤ R ) ( Finset.powerset ( Finset.Ico BS.k0 BS.K ) ) );
    · simp +contextual [ Finset.subset_iff ];
      exact fun x hx₁ hx₂ y hy => le_of_lt ( hx₁ hy |>.2 );
    · exact fun _ _ _ => Finset.prod_nonneg fun _ _ => Real.exp_nonneg _;
    · simp +zetaDelta at *;
      exact Finset.sum_le_sum fun x hx => Finset.prod_le_prod ( fun _ _ => Real.exp_nonneg _ ) fun y hy => by rw [ if_pos ( by linarith [ Finset.mem_Ico.mp ( Finset.mem_powerset.mp ( Finset.mem_filter.mp hx |>.1 ) hy ) ] ) ] ;
  · grind

/-
The initial label window cardinality is bounded by `3 + 14·√R/σ_{k0}`.
    `labelFin` at `k0` is `Icc (-(L0)) (L0)` with `L0 = ⌈7√R/σ_{k0}⌉ ≥ 0`, so its
    card is `2·L0 + 1 ≤ 2(7√R/σ_{k0} + 1) + 1`.
-/
lemma initial_label_window_card_bound
    (BS : BlockSystem) (c2 R : ℝ) (_hR0 : 0 ≤ R) :
    ((labelFin BS c2 R BS.k0).card : ℝ) ≤ 3 + 14 * Real.sqrt R / sigmaP (BS.P BS.k0) := by
  -- Let `σ := sigmaP (BS.P BS.k0) ≥ 0` and `x := 7 * Real.sqrt R / σ ≥ 0`.
  set σ := sigmaP (BS.P BS.k0)
  have hσ0 : 0 ≤ σ := sigmaP_nonneg _
  set x := 7 * Real.sqrt R / σ
  have hx0 : 0 ≤ x := by
    positivity;
  --Card of an integer `Finset.Icc a b` is `(b - a + 1).toNat`; here `Finset.Icc (-(L0)) (L0)` has card `(L0 - (-(L0)) + 1).toNat = (2*L0 + 1).toNat`.
  have hlabels_card : ((labelFin BS c2 R BS.k0).card : ℝ) = 2 * Int.ceil x + 1 := by
    unfold labelFin; norm_num;
    rw [ show L0 BS R = ⌈x⌉ from rfl ] ; ring_nf;
    norm_cast;
    rw [ Int.toNat_of_nonneg ( by positivity ) ];
  convert hlabels_card.le.trans _ using 1 ; ring_nf;
  convert add_le_add_left ( mul_le_mul_of_nonneg_right ( Int.ceil_lt_add_one x |> le_of_lt ) zero_le_two ) 1 using 1 ; ring;
  ring!

/-
The per-segment-start label charge used by `label_product_le`:
    every non-initial window `|labelFin s|` is bounded by the predecessor's
    Peierls charge, via `labelBound_charge_hot` / `labelBound_charge_boundary`.
-/
lemma segment_label_charge_bound
    (eps c2 e0 : ℝ) (heps : 0 < eps) (hc2 : 0 < c2) (he0 : 0 < e0) :
    ∃ k0min : ℕ, ∀ (BS : BlockSystem), k0min ≤ BS.k0 → ∀ (R : ℝ) (H B : Finset ℕ),
      ∀ s ∈ RequestProject.segmentStarts BS.k0 BS.K H B, s ≠ BS.k0 →
        ((labelFin BS c2 R s).card : ℝ) ≤
          (if s - 1 ∈ H then Real.exp (eps * Rw c2 (s - 1))
           else Real.exp (eps * Pifloor BS e0 (s - 1))) := by
  obtain ⟨k1, hk1⟩ := GlobalControl.labelBound_charge_hot c2 eps heps hc2
  obtain ⟨k2, hk2⟩ := GlobalControl.labelBound_charge_boundary c2 e0 eps heps hc2 he0
  use max k1 k2;
  intros BS hBS R H B s hs hs_ne_K0
  have hs_bounds : BS.k0 ≤ s ∧ s ≤ BS.K := segStarts_le BS H B hs
  have hs_gt_k0 : BS.k0 + 1 ≤ s := by
    exact Nat.succ_le_of_lt ( lt_of_le_of_ne hs_bounds.1 hs_ne_K0.symm )
  have hs_card : ((labelFin BS c2 R s).card : ℝ) = 2 * (labelBound c2 s : ℝ) + 1 := by
    unfold labelFin; simp +decide [ hs_ne_K0 ] ;
    rw_mod_cast [ Int.toNat_of_nonneg ] ; ring;
    unfold labelBound; norm_num; positivity;
  grind
end GlobalControl

end
