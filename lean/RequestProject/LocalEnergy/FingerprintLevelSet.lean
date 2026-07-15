import RequestProject.LocalEnergy.FingerprintDecoding
import RequestProject.LocalEnergy.FingerprintEntropy
import RequestProject.LocalEnergy.BlockEnergyBounds
import RequestProject.Core.FiniteInterval
import RequestProject.Core.FiniteSums

/-!
# Fingerprint level-set bound

The decoding injection and entropy estimates combine into the high-energy single-block level-set estimate.
-/

open Finset

namespace LocalEnergy

open scoped Classical

/-! ## Level-set bound

This section assembles `fingerprint_levelSet_bound` from
of this file (`cold_residue_unique`, `cold_assignment_decoding_injective`, `hot_count_bound`,
`entropy_inequality`) together with the deterministic dispersion engine of
`LocalEnergy.ReciprocalDispersion`.  The `BlockAssignment`-level objects (`QP`,
`BlockAssignment`) are exposed by `LocalEnergy.BlockEnergy`; the fingerprint machinery uses
total functions `(p : ℕ) → ZMod p`, so we bridge via `extendAssign`. -/

/-- Extend a block assignment `a : BlockAssignment P` to a total residue
    function `(p : ℕ) → ZMod p`, set to `0` outside `P`.  This is the bridge
    between the finite CRT objects (`QP`, level sets) and the fingerprint
    energy `fingerprintEnergy` of this file. -/
noncomputable def extendAssign (P : Finset ℕ) (a : BlockAssignment P) :
    (p : ℕ) → ZMod p :=
  fun p => if h : p ∈ P then a ⟨p, h⟩ else 0

private lemma extendAssign_mem (P : Finset ℕ) (a : BlockAssignment P) {p : ℕ}
    (hp : p ∈ P) : extendAssign P a p = a ⟨p, hp⟩ := by
  simp [extendAssign, hp]

/-- Two block assignments with equal extensions are equal. -/
private lemma extendAssign_injective (P : Finset ℕ) :
    Function.Injective (extendAssign P) := by
  intro a b h
  funext p
  obtain ⟨p, hp⟩ := p
  simpa [extendAssign_mem P a hp, extendAssign_mem P b hp] using congrFun h p

/-
**Lower subset existence.**  Any `k ≤ |P|` elements can be chosen as the `k`
    smallest elements of `P`: there is `F ⊆ P` with `|F| = k` such that every
    element of `F` is strictly below every element of `P \ F`.  This is the
    fingerprint-selection step (`F` = the `k` smallest primes of `P`).
-/
private lemma exists_lower_subset (P : Finset ℕ) (k : ℕ) (hk : k ≤ P.card) :
    ∃ F ⊆ P, F.card = k ∧ ∀ p ∈ F, ∀ q ∈ P \ F, p < q := by
  induction k generalizing P with
  | zero =>
    exact ⟨ ∅, by norm_num ⟩
  | succ k ih =>
    -- Let $m$ be the smallest element in $P$.
    obtain ⟨m, hm⟩ : ∃ m ∈ P, ∀ p ∈ P, p ≥ m := by
      exact ⟨ Nat.find <| Finset.card_pos.mp <| pos_of_gt hk, Nat.find_spec <| Finset.card_pos.mp <| pos_of_gt hk, fun p hp => Nat.find_min' _ hp ⟩;
    obtain ⟨ F, hF₁, hF₂, hF₃ ⟩ := ih ( P.erase m ) ( by simpa [ Finset.card_erase_of_mem hm.1 ] using by omega ) ; use Insert.insert m F; simp_all +decide [ Finset.subset_iff ] ;
    exact ⟨ by rw [ Finset.card_insert_of_notMem ( fun h => hF₁ h |>.1 rfl ), hF₂ ], fun q hq hq' hq'' => lt_of_le_of_ne ( hm.2 q hq ) ( Ne.symm hq' ) ⟩

/-
**Energy relation** (`30 §1`).  The vertex–fingerprint energies over the
    complement of the fingerprint sum to at most the full CRT energy:
    `∑_{q ∈ P∖F} t_q(a_q) ≤ Q_P(a)`.  The pairs `{(p,q) : p ∈ F, q ∈ P∖F}` are
    distinct ordered pairs of `P` (each `p < q` since `F` is a lower set), hence a
    sub-family of the pairs summed in `Q_P`; all terms are `≥ 0`.
-/
lemma energy_relation (P F : Finset ℕ) [∀ p : P, NeZero p.1]
    (hFP : F ⊆ P) (hFmin : ∀ p ∈ F, ∀ q ∈ P \ F, p < q)
    (a : BlockAssignment P) :
    ∑ q ∈ P \ F, fingerprintEnergy F (extendAssign P a) q (extendAssign P a q) ≤ QP P a := by
  refine' le_trans _ ( Finset.sum_le_sum_of_subset_of_nonneg _ _ );
  case refine'_2 => exact Finset.image ( fun pq : { p : P // p.1 ∈ F } × { q : P // q.1 ∈ P \ F } => ( ⟨ pq.1.1, by simp ⟩, ⟨ pq.2.1, by simp ⟩ ) ) ( Finset.univ );
  · rw [ Finset.sum_image ];
    · simp +decide [ fingerprintEnergy, extendAssign ];
      convert rfl.le using 1;
      rw [ Finset.sum_sigma' ];
      refine' Finset.sum_bij ( fun x hx => ⟨ x.2, x.1 ⟩ ) _ _ _ _ <;> simp +decide [ fingerprintEnergyTerm ];
      · tauto;
      · aesop;
      · grind;
      · unfold extendAssign; aesop;
    · intro x hx y hy; aesop;
  · simp +decide [ Finset.subset_iff, increasingPairs ];
    aesop;
  · exact fun _ _ _ => sq_nonneg _

/-
**Decoding cardinality bound.**
    The level set `{a : Q_P(a) ≤ R}` injects (via `cold_assignment_decoding_injective`) into
    `{a|_F} × {(S, residues) : S ⊆ P∖F, |S| ≤ h_max}`, whose cardinality is
    `≤ (2X)^{|F|} · (h_max+1) · C(|P|, h_max) · (2X)^{h_max}`.

    This bundles the decoding injection (`cold_assignment_decoding_injective`),
    the high-energy-coordinate bound (`hot_count_bound`, via `energy_relation`), and
    the sub-set/residue counting `∑_{k ≤ h_max} C(|P∖F|,k)(2X)^k ≤
    (h_max+1)·C(|P|,h_max)(2X)^{h_max}`.
-/
private lemma decoding_card_bound
    (X : ℕ) (hX : 1 ≤ X) (P F : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X)
    (hFP : F ⊆ P) (hFcard : 208 ≤ F.card)
    (hFmin : ∀ p ∈ F, ∀ q ∈ P \ F, p < q)
    (T R : ℝ) (hT : T = reciprocalPhaseEnergyScale X F / 7) (hT0 : 0 < T)
    (hmax : ℕ) (hhmax : R / T < (hmax : ℝ) + 1) (hmaxP : hmax ≤ P.card) :
    ((Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)).card : ℝ)
      ≤ (2 * (X : ℝ)) ^ F.card * ((hmax : ℝ) + 1)
          * (Nat.choose P.card hmax) * (2 * (X : ℝ)) ^ hmax := by
  have h_card_bound : ∀ a : BlockAssignment P, QP P a ≤ R → (Finset.filter (fun q => T ≤ fingerprintEnergy F (extendAssign P a) q (extendAssign P a q)) (P \ F)).card ≤ hmax := by
    intro a ha
    have h_card : (Finset.filter (fun q => T ≤ fingerprintEnergy F (extendAssign P a) q (extendAssign P a q)) (P \ F)).card ≤ R / T := by
      apply hot_count_bound P F (extendAssign P a) T R hT0 (by
      exact le_trans ( energy_relation P F hFP hFmin a ) ha);
    exact Nat.le_of_lt_succ ( by rw [ ← @Nat.cast_lt ℝ ] ; push_cast; linarith );
  have h_card_bound : ∀ S : Finset ℕ, S ⊆ P \ F → S.card ≤ hmax → (Finset.filter (fun a : BlockAssignment P => Finset.filter (fun q => T ≤ fingerprintEnergy F (extendAssign P a) q (extendAssign P a q)) (P \ F) = S) (Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R))).card ≤ (∏ p ∈ F, p) * (∏ q ∈ S, q) := by
    intros S hS_sub hS_card
    have h_card_bound : ∀ a b : BlockAssignment P, QP P a ≤ R → QP P b ≤ R → Finset.filter (fun q => T ≤ fingerprintEnergy F (extendAssign P a) q (extendAssign P a q)) (P \ F) = S → Finset.filter (fun q => T ≤ fingerprintEnergy F (extendAssign P b) q (extendAssign P b q)) (P \ F) = S → (∀ p ∈ F, extendAssign P a p = extendAssign P b p) → (∀ q ∈ S, extendAssign P a q = extendAssign P b q) → a = b := by
      intros a b ha hb hS_a hS_b hF_eq hS_eq;
      have := @cold_assignment_decoding_injective X hX P F ( fun p hp => hP p ( hFP hp ) ) hFcard ( fun q hq => hP q ( Finset.mem_sdiff.mp hq |>.1 ) ) T hT ( extendAssign P a ) ( extendAssign P b ) ?_ ?_ ?_ <;> simp_all +decide [ Finset.ext_iff ];
      ext ⟨ p, hp ⟩ ; by_cases hpF : p ∈ F <;> simp_all +decide [ extendAssign ] ;
      simpa [ hp ] using hF_eq p hpF;
    have h_card_bound : (Finset.image (fun a : BlockAssignment P => (fun p : F => a ⟨p.1, hFP p.2⟩, fun q : S => a ⟨q.1, Finset.mem_sdiff.mp (hS_sub q.2) |>.1⟩)) (Finset.filter (fun a : BlockAssignment P => Finset.filter (fun q => T ≤ fingerprintEnergy F (extendAssign P a) q (extendAssign P a q)) (P \ F) = S) (Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)))).card ≤ (∏ p ∈ F, p) * (∏ q ∈ S, q) := by
      refine' le_trans ( Finset.card_le_univ _ ) _;
      simp +decide [ Fintype.card_pi ];
      congr! 1; all_goals conv_rhs => rw [ ← Finset.prod_attach ] ;
    rwa [ Finset.card_image_of_injOn ] at h_card_bound;
    intros a ha b hb hab;
    apply_assumption;
    grind +qlia;
    · grind +splitImp;
    · grind;
    · grind;
    · simp +zetaDelta at *;
      simp +decide [ funext_iff, extendAssign ] at hab ⊢;
      exact fun p hp => by simpa [ hFP hp ] using hab.1 p hp;
    · simp_all +decide [ funext_iff ];
      exact fun q hq => by rw [ extendAssign_mem P a ( Finset.mem_sdiff.mp ( hS_sub hq ) |>.1 ), extendAssign_mem P b ( Finset.mem_sdiff.mp ( hS_sub hq ) |>.1 ), hab.2 q hq ] ;
  have h_card_bound : (Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)).card ≤ (∏ p ∈ F, p) * (∑ S ∈ Finset.powerset (P \ F), if S.card ≤ hmax then (∏ q ∈ S, q) else 0) := by
    have h_card_bound : (Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)).card ≤ ∑ S ∈ Finset.powerset (P \ F), (Finset.filter (fun a : BlockAssignment P => Finset.filter (fun q => T ≤ fingerprintEnergy F (extendAssign P a) q (extendAssign P a q)) (P \ F) = S) (Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R))).card := by
      rw [ ← Finset.card_eq_sum_card_fiberwise ];
      exact fun x hx => Finset.mem_powerset.mpr <| Finset.filter_subset _ _;
    rw [ Finset.mul_sum _ _ _ ];
    refine le_trans h_card_bound <| Finset.sum_le_sum fun S hS => ?_;
    split_ifs <;> simp_all +decide [ Finset.subset_iff ];
    grind;
  have h_card_bound : (∑ S ∈ Finset.powerset (P \ F), if S.card ≤ hmax then (∏ q ∈ S, q) else 0) ≤ (∑ k ∈ Finset.range (hmax + 1), (Nat.choose (P.card) k) * (2 * X) ^ k) := by
    exact RequestProject.weightedPowersetSum_le_binomial (P \ F) id
      (2 * X) P.card hmax (Finset.card_le_card Finset.sdiff_subset)
      (fun q hq => (hP q (Finset.mem_sdiff.mp hq).1).2.2)
  have h_card_bound : (∑ k ∈ Finset.range (hmax + 1), (Nat.choose (P.card) k) * (2 * X) ^ k) ≤ (hmax + 1) * (Nat.choose (P.card) hmax) * (2 * X) ^ hmax := by
    apply RequestProject.truncatedBinomialSum_le_last P.card (2 * X) hmax hmaxP
    exact le_trans (Finset.card_le_card (show P ⊆ Finset.Icc X (2 * X) from
      fun p hp => Finset.mem_Icc.mpr ⟨(hP p hp).2.1, (hP p hp).2.2⟩))
      (by simpa using hX)
  have h_card_bound : (∏ p ∈ F, p) ≤ (2 * X) ^ F.card := by
    exact le_trans ( Finset.prod_le_prod' fun p hp => hP p ( hFP hp ) |>.2.2 ) ( by norm_num );
  norm_cast;
  nlinarith [ Nat.zero_le ( ∏ p ∈ F, p ), Nat.zero_le ( ∑ S ∈ Finset.powerset ( P \ F ), if #S ≤ hmax then ∏ q ∈ S, q else 0 ) ]

/-
Auxiliary (trivial-case log trick): if `(2X)^N` exceeds `N·e^{εR}` then
    `εR < N·log(2X)`.
-/
private lemma exp_card_trick (NP X : ℕ) (eps R : ℝ) (hNP : 1 ≤ NP) (hX : 1 < X)
    (h : ¬ (2 * (X : ℝ)) ^ NP ≤ (NP : ℝ) * Real.exp (eps * R)) :
    eps * R < (NP : ℝ) * Real.log (2 * X) := by
  contrapose! h;
  refine' le_trans _ ( mul_le_mul_of_nonneg_left ( Real.exp_le_exp.mpr h ) ( Nat.cast_nonneg _ ) );
  rw [ ← Real.rpow_natCast, Real.rpow_def_of_pos ( by positivity ), mul_comm ];
  exact le_mul_of_one_le_left ( Real.exp_nonneg _ ) ( mod_cast hNP )

/-
Auxiliary: the chosen `Ceps` satisfies the cube lower bound used for the
    fingerprint/hot thresholds.
-/
private lemma cube_rpow_ge (eps : ℝ) (hε0 : 0 < eps) :
    (7 : ℝ) * 2 ^ 21 ≤ eps ^ 4 * (((7 * 2 ^ 21 / eps ^ 4) ^ ((1 : ℝ) / 3) + 1)) ^ 3 := by
  -- Let $a = \frac{7 \cdot 2^{21}}{\epsilon^4}$.
  set a : ℝ := 7 * 2 ^ 21 / eps ^ 4;
  -- Then $((a^{1/3} + 1))^3 \geq (a^{1/3})^3 = a$.
  have h_cube : ((a ^ (1 / 3 : ℝ) + 1) ^ 3 : ℝ) ≥ a := by
    exact le_trans ( by rw [ ← Real.rpow_natCast, ← Real.rpow_mul ( by positivity ) ] ; norm_num ) ( pow_le_pow_left₀ ( by positivity ) ( le_add_of_nonneg_right zero_le_one ) _ );
  rw [ ge_iff_le, div_le_iff₀ ] at h_cube <;> first | positivity | linarith;

/-
Auxiliary (fingerprint size lower bound).  For `X` past the explicit
    threshold, `εR/(4 log 2X) ≥ 208`, so the fingerprint `⌈εR/(4 log 2X)⌉ ≥ 208`.
-/
private lemma Fc_ge_helper (eps Ceps : ℝ) (hε0 : 0 < eps) (hCeps : 0 < Ceps)
    (X : ℕ) (hX3 : 3 ≤ X)
    (hXbig : (1664 / (eps * Ceps)) ^ ((3 : ℝ) / 2) ≤ X)
    (R : ℝ) (hR : Ceps * (X : ℝ) ^ ((2:ℝ)/3) * (Real.log X) ^ ((4:ℝ)/3) ≤ R) :
    (208 : ℝ) ≤ eps / 2 * R / (2 * Real.log (2 * X)) := by
  -- By simplifying, we can see that the inequality holds.
  have h_simplified : 208 ≤ (eps * Ceps / 8) * (X : ℝ) ^ (2 / 3 : ℝ) * (Real.log X) ^ (1 / 3 : ℝ) := by
    refine' le_trans _ ( mul_le_mul_of_nonneg_left ( Real.one_le_rpow ( Real.le_log_iff_exp_le ( by positivity ) |>.2 _ ) ( by positivity ) ) ( by positivity ) );
    · have h_exp : (X : ℝ) ^ (2 / 3 : ℝ) ≥ (1664 / (eps * Ceps)) := by
        exact le_trans ( by rw [ ← Real.rpow_mul ( by positivity ) ] ; norm_num ) ( Real.rpow_le_rpow ( by positivity ) hXbig ( by positivity ) )
      generalize_proofs at *; (
      rw [ ge_iff_le, div_le_iff₀ ] at h_exp <;> first | positivity | linarith;);
    · exact le_trans ( Real.exp_one_lt_d9.le ) ( by norm_num; linarith [ show ( X : ℝ ) ≥ 3 by norm_cast ] );
  rw [ le_div_iff₀ ( mul_pos zero_lt_two ( Real.log_pos ( by norm_cast; linarith ) ) ) ];
  rw [ Real.log_mul ( by positivity ) ( by positivity ) ];
  rw [ show ( 4 / 3 : ℝ ) = 1 + 1 / 3 by norm_num, Real.rpow_add ] at hR <;> norm_num at *;
  · nlinarith [ Real.log_pos one_lt_two, Real.log_le_log ( by positivity ) ( by norm_cast; linarith : ( X : ℝ ) ≥ 2 ), mul_le_mul_of_nonneg_left ( Real.log_le_log ( by positivity ) ( by norm_cast; linarith : ( X : ℝ ) ≥ 2 ) ) hε0.le ];
  · exact Real.log_pos <| by norm_cast; linarith;

/-
Auxiliary (hot-count upper bound).  `R/T ≤ εR/log 2X`, where
    `T = Fc³/(2¹¹X²)/7` and `Fc ≥ εR/(4 log 2X)`, given the cube bound on `Ceps`.
-/
private lemma hmax_bound_helper (eps Ceps : ℝ) (hε0 : 0 < eps)
    (hcube : (7 : ℝ) * 2 ^ 21 ≤ eps ^ 4 * Ceps ^ 3)
    (X : ℕ) (hX3 : 3 ≤ X) (R : ℝ)
    (hR : Ceps * (X : ℝ) ^ ((2:ℝ)/3) * (Real.log X) ^ ((4:ℝ)/3) ≤ R)
    (Fc : ℕ) (hFc : eps / 2 * R / (2 * Real.log (2 * X)) ≤ (Fc : ℝ)) :
    R / ((Fc : ℝ) ^ 3 / (2 ^ 11 * (X : ℝ) ^ 2) / 7) ≤ eps * R / Real.log (2 * X) := by
  -- Using the bound from `Fc_ge_helper`, we know that `Fc ≥ (eps * R) / (4 * Real.log (2 * X))`.
  have hFc_bound : (Fc : ℝ) ≥ (eps * R) / (4 * Real.log (2 * X)) := by
    convert hFc.ge using 1 ; ring;
  by_cases hR_pos : 0 < R;
  · have hR_bound : R ^ 3 ≥ Ceps ^ 3 * (X : ℝ) ^ 2 * (Real.log X) ^ 4 := by
      have hR_bound : R ^ 3 ≥ (Ceps * (X : ℝ) ^ (2 / 3 : ℝ) * (Real.log X) ^ (4 / 3 : ℝ)) ^ 3 := by
        gcongr;
        by_cases hCeps_pos : 0 < Ceps;
        · exact mul_nonneg ( mul_nonneg hCeps_pos.le ( Real.rpow_nonneg ( Nat.cast_nonneg _ ) _ ) ) ( Real.rpow_nonneg ( Real.log_nonneg ( Nat.one_le_cast.mpr ( by linarith ) ) ) _ );
        · nlinarith [ pow_pos hε0 4, pow_nonneg ( neg_nonneg.mpr ( le_of_not_gt hCeps_pos ) ) 3 ];
      convert hR_bound using 1 ; ring_nf;
      norm_num only [ ← Real.rpow_natCast, ← Real.rpow_mul ( Nat.cast_nonneg _ ), ← Real.rpow_mul ( Real.log_nonneg ( Nat.one_le_cast.mpr ( by linarith ) ) ) ];
    have hL_bound : (Real.log (2 * X)) ^ 4 ≤ 16 * (Real.log X) ^ 4 := by
      have hL_bound : Real.log (2 * X) ≤ 2 * Real.log X := by
        rw [ ← Real.log_rpow, Real.log_le_log_iff ] <;> norm_cast <;> nlinarith [ Nat.pow_le_pow_left hX3 2 ];
      exact le_trans ( pow_le_pow_left₀ ( Real.log_nonneg ( by norm_cast; linarith ) ) hL_bound 4 ) ( by ring_nf; norm_num );
    have h_final_bound : 7 * 2 ^ 17 * (X : ℝ) ^ 2 * (Real.log (2 * X)) ^ 4 ≤ eps ^ 4 * R ^ 3 := by
      refine le_trans ?_ ( mul_le_mul_of_nonneg_left hR_bound <| by positivity );
      nlinarith [ show 0 < ( X : ℝ ) ^ 2 * Real.log X ^ 4 by exact mul_pos ( by positivity ) ( by exact pow_pos ( Real.log_pos ( by norm_cast; linarith ) ) _ ) ];
    rw [ div_div, div_le_div_iff₀ ];
    · rw [ mul_div, le_div_iff₀ ] <;> try positivity;
      have h_final_bound : (Fc : ℝ) ^ 3 ≥ (eps * R / (4 * Real.log (2 * X))) ^ 3 := by
        exact pow_le_pow_left₀ ( div_nonneg ( mul_nonneg hε0.le hR_pos.le ) ( mul_nonneg zero_le_four ( Real.log_nonneg ( by norm_cast; linarith ) ) ) ) hFc_bound 3;
      refine le_trans ?_ ( mul_le_mul_of_nonneg_left h_final_bound <| by positivity );
      field_simp;
      rw [ le_div_iff₀ ( pow_pos ( Real.log_pos ( by norm_cast; linarith ) ) _ ) ] ; nlinarith [ Real.log_pos ( by norm_cast; linarith : ( 1 :ℝ ) < 2 * X ) ];
    · rcases Fc with ( _ | Fc ) <;> norm_num at *;
      · exact not_le_of_gt ( div_pos ( mul_pos ( half_pos hε0 ) hR_pos ) ( mul_pos zero_lt_two ( Real.log_pos ( by norm_cast; linarith ) ) ) ) hFc;
      · positivity;
    · exact Real.log_pos ( by norm_cast; linarith );
  · contrapose! hR;
    exact lt_of_le_of_lt ( le_of_not_gt hR_pos ) ( mul_pos ( mul_pos ( show 0 < Ceps by exact lt_of_not_ge fun h => by nlinarith [ pow_pos hε0 4, pow_nonneg ( neg_nonneg.mpr h ) 3 ] ) ( by positivity ) ) ( by exact Real.rpow_pos_of_pos ( Real.log_pos ( by norm_cast; linarith ) ) _ ) )

/-- For every `ε ∈ (0,1)` there are `Cε, X₀` such that
    for `X ≥ X₀`, any **nonempty** prime block `P ⊆ [X,2X]`, and any
    `R ≥ R_C := Cε · X^{2/3} · (log X)^{4/3}`, the full level set satisfies
    `#{a : Q_P(a) ≤ R} ≤ N · exp(ε R)` (`N = |P|`).

    The hypothesis `1 ≤ P.card` (i.e. `P` nonempty) is necessary:
    for `P = ∅` the block has exactly one (empty) assignment with `Q_P = 0 ≤ R`,
    so the count is `1`, while the right-hand side `N · e^{εR} = 0 · e^{εR} = 0`.
    The paper tacitly works with substantial blocks (`N ≥ X/(2 log X) ≥ 2` in the
    Irving-good regime), so requiring `P` nonempty is faithful and minimal. -/
theorem fingerprint_levelSet_bound
    (eps : ℝ) (hε0 : 0 < eps) (hε1 : eps < 1) :
    ∃ (Ceps X0 : ℝ), 0 < Ceps ∧ 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X →
        ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1]
          (_hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (_hPne : 1 ≤ P.card)
          (R : ℝ), Ceps * (X:ℝ)^((2:ℝ)/3) * (Real.log X)^((4:ℝ)/3) ≤ R →
            ((Finset.univ.filter (fun a : BlockAssignment P => QP P a ≤ R)).card : ℝ)
              ≤ (P.card : ℝ) * Real.exp (eps * R) := by
  obtain ⟨ C2, X02, hC2, hX02, Hent2 ⟩ := entropy_inequality2 ( eps / 2 ) ( by linarith ) ( by linarith );
  refine' ⟨ Max.max C2 ( ( 7 * 2 ^ 21 / eps ^ 4 ) ^ ( 1 / 3 : ℝ ) + 1 ), Max.max X02 ( Max.max 3 ( ( 1664 / ( eps * Max.max C2 ( ( 7 * 2 ^ 21 / eps ^ 4 ) ^ ( 1 / 3 : ℝ ) + 1 ) ) ) ^ ( 3 / 2 : ℝ ) ) ), _, _, _ ⟩;
  · positivity;
  · positivity;
  · intro X hX P _ hP hPne R hR;
    by_cases htriv : (2 * (X : ℝ)) ^ P.card ≤ (P.card : ℝ) * Real.exp (eps * R);
    · refine' le_trans _ htriv;
      convert levelset_card_le_pow X P (fun p hp => (hP p hp).2.2) R using 1;
    · obtain ⟨Fc, hFc⟩ : ∃ Fc : ℕ, 208 ≤ Fc ∧ eps / 2 * R / (2 * Real.log (2 * X)) ≤ Fc ∧ Fc ≤ eps / 2 * R / (2 * Real.log (2 * X)) + 1 ∧ Fc ≤ P.card := by
        refine' ⟨ Nat.ceil ( eps / 2 * R / ( 2 * Real.log ( 2 * X ) ) ), _, _, _, _ ⟩;
        · have := Fc_ge_helper eps ( Max.max C2 ( ( 7 * 2 ^ 21 / eps ^ 4 ) ^ ( 1 / 3 : ℝ ) + 1 ) ) hε0 ( by positivity ) X ( by
            exact_mod_cast le_trans ( le_max_left _ _ ) ( le_trans ( le_max_right _ _ ) hX ) ) ( by
            exact le_trans ( le_max_of_le_right ( le_max_right _ _ ) ) hX ) R ( by
            exact hR );
          exact Nat.le_of_lt_succ ( by rw [ ← @Nat.cast_lt ℝ ] ; push_cast; linarith [ Nat.le_ceil ( eps / 2 * R / ( 2 * Real.log ( 2 * X ) ) ) ] );
        · exact Nat.le_ceil _;
        · exact Nat.ceil_lt_add_one ( div_nonneg ( mul_nonneg ( by positivity ) ( by exact le_trans ( by positivity ) hR ) ) ( mul_nonneg zero_le_two ( Real.log_nonneg ( by norm_cast; linarith [ show X ≥ 1 by exact Nat.one_le_iff_ne_zero.mpr ( by rintro rfl; norm_num at * ) ] ) ) ) ) |> le_of_lt;
        · have h_ceil_le_P : eps * R < P.card * Real.log (2 * X) := by
            apply exp_card_trick P.card X eps R hPne (by
            norm_num +zetaDelta at *;
            linarith) htriv;
          exact Nat.ceil_le.mpr ( by rw [ div_le_iff₀ ] <;> nlinarith [ Real.log_pos ( show ( 2 * X : ℝ ) > 1 by norm_cast; linarith [ show X > 0 from Nat.cast_pos.mp ( lt_of_lt_of_le ( by positivity ) hX ) ] ) ] );
      obtain ⟨F, hFP, hFcard, hFmin⟩ : ∃ F ⊆ P, F.card = Fc ∧ ∀ p ∈ F, ∀ q ∈ P \ F, p < q := exists_lower_subset P Fc (by
      linarith);
      obtain ⟨hmax, hhmax⟩ : ∃ hmax : ℕ, R / ((Fc : ℝ) ^ 3 / (2 ^ 11 * (X : ℝ) ^ 2) / 7) < (hmax : ℝ) + 1 ∧ hmax ≤ P.card ∧ (hmax : ℝ) ≤ 7 * R * (2 ^ 11 * (X : ℝ) ^ 2) / (Fc : ℝ) ^ 3 := by
        refine' ⟨ Nat.floor ( R / ( ( Fc : ℝ ) ^ 3 / ( 2 ^ 11 * X ^ 2 ) / 7 ) ), _, _, _ ⟩;
        · exact Nat.lt_floor_add_one _;
        · refine' Nat.floor_le_of_le _;
          rw [ div_div_eq_mul_div, div_le_iff₀ ];
          · have := hmax_bound_helper eps ( Max.max C2 ( ( 7 * 2 ^ 21 / eps ^ 4 ) ^ ( 1 / 3 : ℝ ) + 1 ) ) hε0 ( by
              exact le_trans ( cube_rpow_ge eps hε0 ) ( mul_le_mul_of_nonneg_left ( pow_le_pow_left₀ ( by positivity ) ( le_max_right _ _ ) _ ) ( by positivity ) ) ) X ( by
              exact_mod_cast le_trans ( le_max_of_le_right ( le_max_left _ _ ) ) hX ) R hR Fc ( by
              lia );
            rw [ div_div_eq_mul_div, div_le_iff₀ ] at this;
            · refine' le_trans this _;
              gcongr;
              rw [ div_le_iff₀ ( Real.log_pos <| by norm_cast; linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_of_le_right <| le_max_left _ _ ) hX ] ) ];
              have := exp_card_trick P.card X eps R ( by linarith ) ( by linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_of_le_right <| le_max_left _ _ ) hX ] ) htriv;
              linarith;
            · exact div_pos ( pow_pos ( Nat.cast_pos.mpr ( by linarith ) ) _ ) ( mul_pos ( by norm_num ) ( sq_pos_of_pos ( Nat.cast_pos.mpr ( by linarith [ show X > 0 from Nat.cast_pos.mp ( lt_of_lt_of_le ( by positivity ) hX ) ] ) ) ) );
          · exact div_pos ( pow_pos ( Nat.cast_pos.mpr ( by linarith ) ) _ ) ( mul_pos ( by norm_num ) ( sq_pos_of_pos ( Nat.cast_pos.mpr ( by linarith [ show X > 0 from Nat.cast_pos.mp ( lt_of_lt_of_le ( by positivity ) hX ) ] ) ) ) );
        · have hratio_nonneg :
              0 ≤ R / ((Fc : ℝ) ^ 3 / (2 ^ 11 * (X : ℝ) ^ 2) / 7) := by
            have hR_nonneg : 0 ≤ R := le_trans (by positivity) hR
            have hFc_pos : 0 < (Fc : ℝ) := by
              exact_mod_cast lt_of_lt_of_le (by norm_num : 0 < 208) hFc.1
            exact div_nonneg hR_nonneg (by positivity)
          calc
            (Nat.floor (R / ((Fc : ℝ) ^ 3 /
                (2 ^ 11 * (X : ℝ) ^ 2) / 7)) : ℝ)
                ≤ R / ((Fc : ℝ) ^ 3 /
                    (2 ^ 11 * (X : ℝ) ^ 2) / 7) := Nat.floor_le hratio_nonneg
            _ = 7 * R * (2 ^ 11 * (X : ℝ) ^ 2) / (Fc : ℝ) ^ 3 := by
              field_simp
      refine le_trans ( decoding_card_bound X ( by
        exact Nat.one_le_iff_ne_zero.mpr ( by rintro rfl; norm_num at * ) ) P F ( by
        exact hP ) hFP ( by
        grind +splitIndPred ) hFmin ( ( Fc : ℝ ) ^ 3 / ( 2 ^ 11 * ( X : ℝ ) ^ 2 ) / 7 ) R ( by
        simp [reciprocalPhaseEnergyScale, hFcard] ) ( by
        exact div_pos ( div_pos ( pow_pos ( Nat.cast_pos.mpr ( by linarith ) ) _ ) ( mul_pos ( by norm_num ) ( sq_pos_of_pos ( Nat.cast_pos.mpr ( by linarith [ show X > 0 from Nat.cast_pos.mp ( lt_of_lt_of_le ( by positivity ) hX ) ] ) ) ) ) ) ( by norm_num ) ) hmax ( by
        linarith ) ( by
        grind ) ) ?_;
      have hent := Hent2 X (by
        exact le_trans (le_max_left _ _) hX) P.card Fc hmax R (by
        exact le_trans
          (mul_le_mul_of_nonneg_right
            (mul_le_mul_of_nonneg_right (le_max_left _ _) (by positivity))
            (by positivity)) hR) (by
        linarith) (RequestProject.card_le_upper_bound_of_pos P (2 * X)
          (fun p hp => (hP p hp).1.pos) (fun p hp => (hP p hp).2.2)) (by
        linarith) (by
        linarith) (by
        linarith) hhmax.2.2
      rw [hFcard]
      refine hent.trans_eq ?_
      congr 2
      ring

end LocalEnergy
