import Mathlib.Analysis.MeanInequalitiesPow
import RequestProject.Core.FiniteInterval
import RequestProject.LocalEnergy.CrossLabelEnergy
import RequestProject.LocalEnergy.DominantLabel.Definition

/-!
# Energy forced by deviations from a dominant label

A dominant residue label determines centered CRT differences within its class.
Coordinates outside that class must then contribute cross-label energy. This
file turns that mechanism into bounds for the label and the exception set.
-/

open Finset

namespace LocalEnergy

open scoped Classical

/-
**(A3a) Per-exception energy from a close-count bound.**  If at most half of
    the class `C` is `δ`-close to the exception vertex `q` (i.e. `|H_{pq}| ≤ δ·pq`),
    then the cross energy `∑_{p∈C}(H_{pq}/pq)²` is `≥ (|C|/2)·δ²`.  (Mirrors the
    sum-of-squares accounting in `crossLabel_energy_lower_bound`.)

The centered CRT representative lies in `(-pq/2, pq/2]`: equivalently
    `-(pq) < 2·crtRepr ≤ pq` (the strict lower bound is needed for uniqueness).
-/

private lemma exception_energy_lower_bound_of_close_count
    (P : Finset ℕ) [∀ p : P, NeZero p.1] (a : BlockAssignment P)
    (C : Finset P) (q : P) (δ : ℝ) (hδ0 : 0 ≤ δ)
    (hCp : ∀ p ∈ C, Nat.Prime (p:ℕ)) (hqp : Nat.Prime (q:ℕ))
    (hclose : ((C.filter (fun p : P => |(crtRepr (p:ℕ) (q:ℕ) (a p) (a q) : ℝ)|
        ≤ δ * ((p:ℕ) * (q:ℕ)))).card : ℝ) ≤ (C.card:ℝ)/2) :
    (C.card:ℝ)/2 * δ^2 ≤
      ∑ p ∈ C, ((crtRepr (p:ℕ) (q:ℕ) (a p) (a q) : ℝ) / ((p:ℕ) * (q:ℕ)))^2 := by
  -- By definition of $Far$, we know that every element in $Far$ satisfies $|crtRepr| > δ * (p * q)$.
  have h_far : ∀ p ∈ C.filter (fun p => ¬ (|crtRepr p.1 q.1 (a p) (a q)| ≤ δ * (p.1 * q.1))), (crtRepr p.1 q.1 (a p) (a q) / (p.1 * q.1 : ℝ)) ^ 2 ≥ δ ^ 2 := by
    simp_all +decide [ div_pow, le_div_iff₀ ];
    intro p hp hpC h; rw [ le_div_iff₀ ] <;> nlinarith [ show 0 < ( p : ℝ ) * q by exact mul_pos ( Nat.cast_pos.mpr <| Nat.Prime.pos <| hCp p hp hpC ) <| Nat.cast_pos.mpr <| Nat.Prime.pos hqp, abs_mul_abs_self <| ( crtRepr p q ( a ⟨ p, hp ⟩ ) ( a q ) : ℝ ), mul_le_mul_of_nonneg_left h.le hδ0 ] ;
  have h_sum_far : ∑ p ∈ C.filter (fun p => ¬ (|crtRepr p.1 q.1 (a p) (a q)| ≤ δ * (p.1 * q.1))), (crtRepr p.1 q.1 (a p) (a q) / (p.1 * q.1 : ℝ)) ^ 2 ≥ (C.filter (fun p => ¬ (|crtRepr p.1 q.1 (a p) (a q)| ≤ δ * (p.1 * q.1)))).card * δ ^ 2 := by
    simpa using Finset.sum_le_sum h_far;
  refine le_trans ?_ ( h_sum_far.trans <| Finset.sum_le_sum_of_subset_of_nonneg ( Finset.filter_subset _ _ ) fun _ _ _ => sq_nonneg _ );
  rw [ Finset.filter_not, Finset.card_sdiff ] ; norm_num;
  rw [ Finset.inter_eq_left.mpr ( Finset.filter_subset _ _ ) ] ; gcongr ; rw [ Nat.cast_sub ( Finset.card_le_card <| Finset.filter_subset _ _ ) ] ; linarith;

/-
**(A2) Label range.**  For an `m`-dominant assignment of energy `≤ R`, the
    label satisfies `|m| ≤ (5/(1-ρ))·√R/σ_P`.  In-class pairs have `H_{pq}=m`
    (`crtRepr_eq_of_eq_intCast`), so `R ≥ Q_P ≥ m²·S` with
    `S = ∑_{in-class}1/(pq)²`, and the
    restricted-σ comparison `S ≥ ((1-ρ)²/25)σ_P²`.
-/
set_option maxHeartbeats 1600000 in
lemma dominant_label_bound (X : ℕ) (hX : 16 ≤ X)
    (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (hN : 8 ≤ P.card)
    (ρ : ℝ) (_hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4)
    (a : BlockAssignment P) (m : ℤ) (R : ℝ)
    (hm : |m| ≤ (X:ℤ)^2 / 2)
    (hclass : (1-ρ)*(P.card:ℝ) ≤
        ((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).card:ℝ))
    (hQ : QP P a ≤ R) :
    |(m:ℝ)| ≤ (5/(1-ρ)) * Real.sqrt R / sigmaP P := by
  -- Let $c = \text{card}(\{p \in P \mid a p = m\})$. From $hclass$, we have $(1-\rho)N \le c$.
  set c := (P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))).card
  have hc : (1 - ρ) * (P.card : ℝ) ≤ c := by
    exact hclass;
  -- From $hQ$, we have $R \ge m^2 \cdot S$ where $S = \sum_{pq \in Sset} W pq$.
  have hR_ge_m2S : R ≥ (m : ℝ) ^ 2 * (∑ pq ∈ (orderedPrimePairsA P).filter (fun pq => pq.1 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ))) ∧ pq.2 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))), (1 : ℝ) / ((pq.1.1 : ℝ) * (pq.2.1 : ℝ)) ^ 2) := by
    have hR_ge_m2S : ∀ pq ∈ (orderedPrimePairsA P).filter (fun pq => pq.1 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ))) ∧ pq.2 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))), ((crtRepr pq.1.1 pq.2.1 (a pq.1) (a pq.2) : ℝ) / ((pq.1.1 : ℝ) * (pq.2.1 : ℝ))) ^ 2 = (m : ℝ) ^ 2 * (1 : ℝ) / ((pq.1.1 : ℝ) * (pq.2.1 : ℝ)) ^ 2 := by
      intros pq hpq
      have h_crt : crtRepr pq.1.1 pq.2.1 (a pq.1) (a pq.2) = m := by
        apply crtRepr_eq_of_eq_intCast;
        all_goals norm_num [ orderedPrimePairsA ] at hpq ⊢;
        any_goals tauto;
        · exact hP _ pq.1.2 |>.1;
        · exact hP _ pq.2.2 |>.1;
        · exact ne_of_lt hpq.1;
        · rw [ Int.le_ediv_iff_mul_le ] at hm <;> norm_cast at *;
          norm_num at *;
          nlinarith [ hP _ pq.1.2, hP _ pq.2.2, show ( pq.1 : ℕ ) < pq.2 from hpq.1 ];
      rw [ h_crt ] ; ring;
    have hR_ge_m2S : ∑ pq ∈ (orderedPrimePairsA P).filter (fun pq => pq.1 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ))) ∧ pq.2 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))), ((crtRepr pq.1.1 pq.2.1 (a pq.1) (a pq.2) : ℝ) / ((pq.1.1 : ℝ) * (pq.2.1 : ℝ))) ^ 2 ≤ R := by
      refine' le_trans _ hQ;
      exact Finset.sum_le_sum_of_subset_of_nonneg ( Finset.filter_subset _ _ ) fun _ _ _ => sq_nonneg _;
    rw [ Finset.mul_sum _ _ _ ] ; exact hR_ge_m2S.trans' ( Finset.sum_le_sum fun x hx => by aesop ) ;
  -- We need to show that $S \ge \frac{(1-\rho)^2}{25} \sigma_P^2$.
  have hS_ge_sigmaP2 : (∑ pq ∈ (orderedPrimePairsA P).filter (fun pq => pq.1 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ))) ∧ pq.2 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))), (1 : ℝ) / ((pq.1.1 : ℝ) * (pq.2.1 : ℝ)) ^ 2) ≥ (1 - ρ) ^ 2 / 25 * (sigmaP P) ^ 2 := by
    -- We need to show that $S \ge \frac{c(c-1)}{2} \cdot \frac{1}{16X^4}$.
    have hS_ge_c_c_minus_1_div_16X4 : (∑ pq ∈ (orderedPrimePairsA P).filter (fun pq => pq.1 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ))) ∧ pq.2 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))), (1 : ℝ) / ((pq.1.1 : ℝ) * (pq.2.1 : ℝ)) ^ 2) ≥ (c * (c - 1) / 2 : ℝ) * (1 / (16 * X ^ 4 : ℝ)) := by
      have hS_ge_c_c_minus_1_div_16X4 : (∑ pq ∈ (orderedPrimePairsA P).filter (fun pq => pq.1 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ))) ∧ pq.2 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))), (1 : ℝ) / ((pq.1.1 : ℝ) * (pq.2.1 : ℝ)) ^ 2) ≥ (∑ pq ∈ (orderedPrimePairsA P).filter (fun pq => pq.1 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ))) ∧ pq.2 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))), (1 : ℝ) / (16 * X ^ 4 : ℝ)) := by
        refine Finset.sum_le_sum fun pq hpq => one_div_le_one_div_of_le ?_ ?_ <;> norm_cast <;> norm_num at *;
        · exact pow_pos ( mul_pos ( Nat.cast_pos.mpr ( Nat.Prime.pos ( hP _ pq.1.2 |>.1 ) ) ) ( Nat.cast_pos.mpr ( Nat.Prime.pos ( hP _ pq.2.2 |>.1 ) ) ) ) _;
        · exact le_trans ( Nat.pow_le_pow_left ( Nat.mul_le_mul ( hP _ pq.1.2 |>.2.2 ) ( hP _ pq.2.2 |>.2.2 ) ) 2 ) ( by ring_nf; norm_num );
      have h_card_filter : (Finset.filter (fun pq => pq.1 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ))) ∧ pq.2 ∈ P.attach.filter (fun p => a p = ((m : ℤ) : ZMod (p:ℕ)))) (orderedPrimePairsA P)).card = c * (c - 1) / 2 := by
        have h_card_filter : ∀ (S : Finset P), (Finset.filter (fun pq => pq.1 ∈ S ∧ pq.2 ∈ S ∧ pq.1.1 < pq.2.1) (P.attach ×ˢ P.attach)).card = S.card * (S.card - 1) / 2 := by
          intros S
          have h_card_pairs : Finset.card (Finset.filter (fun pq => pq.1 ∈ S ∧ pq.2 ∈ S ∧ pq.1.1 < pq.2.1) (P.attach ×ˢ P.attach)) = Finset.card (Finset.powersetCard 2 S) := by
            refine' Finset.card_bij ( fun pq hpq => { pq.1, pq.2 } ) _ _ _;
            · grind;
            · simp +contextual [ Finset.Subset.antisymm_iff, Finset.subset_iff ];
              intros; omega;
            · simp +decide [ Finset.mem_powersetCard ];
              intro b hb hb'; rw [ Finset.card_eq_two ] at hb'; obtain ⟨ x, y, hxy ⟩ := hb'; simp_all +decide [ Finset.subset_iff ] ;
              cases lt_or_gt_of_ne ( show x.1 ≠ y.1 from fun h => hxy.1 <| Subtype.ext h ) <;> [ exact ⟨ x.1, x.2, y.1, y.2, ⟨ hb.1, hb.2, by assumption ⟩, by aesop ⟩ ; exact ⟨ y.1, y.2, x.1, x.2, ⟨ hb.2, hb.1, by assumption ⟩, by aesop ⟩ ];
          rw [ h_card_pairs, Finset.card_powersetCard, Nat.choose_two_right ];
        convert h_card_filter ( Finset.filter ( fun p => a p = m ) P.attach ) using 1;
        congr 1 with x ; simp +decide [ orderedPrimePairsA ];
        tauto;
      rcases c with ( _ | _ | c ) <;> norm_num at *;
      · exact Finset.sum_nonneg fun _ _ => by positivity;
      · exact Finset.sum_nonneg fun _ _ => by positivity;
      · convert hS_ge_c_c_minus_1_div_16X4 using 1 ; norm_num [ h_card_filter ] ; ring_nf;
        exact Or.inl ( by rw [ Nat.cast_div ( show 2 ∣ 2 + c * 3 + c ^ 2 from even_iff_two_dvd.mp ( by simp +arith +decide [ parity_simps ] ) ) ( by norm_num ) ] ; push_cast ; ring );
    -- We need to show that $\sigma_P^2 \le \frac{N(N-1)}{2} \cdot \frac{1}{X^4}$.
    have hsigmaP2_le_N_N_minus_1_div_2X4 : (sigmaP P) ^ 2 ≤ (P.card * (P.card - 1) / 2 : ℝ) * (1 / (X ^ 4 : ℝ)) := by
      have hsigmaP2_le_N_N_minus_1_div_2X4 : (sigmaP P) ^ 2 ≤ (∑ pq ∈ orderedPrimePairsA P, (1 : ℝ) / ((pq.1.1 : ℝ) * (pq.2.1 : ℝ)) ^ 2) := by
        unfold sigmaP; norm_num;
        rw [ Real.sq_sqrt ( Finset.sum_nonneg fun _ _ => by positivity ) ];
      refine le_trans hsigmaP2_le_N_N_minus_1_div_2X4 ?_;
      refine' le_trans ( Finset.sum_le_sum fun x hx => one_div_le_one_div_of_le ( by positivity ) <| show ( ( x.1.1 : ℝ ) * x.2.1 ) ^ 2 ≥ X ^ 4 by
                                                                                                      norm_cast;
                                                                                                      rw [ show X ^ 4 = ( X ^ 2 ) ^ 2 by ring ] ; gcongr ; nlinarith only [ hP x.1 x.1.2, hP x.2 x.2.2 ] ; ) _ ; norm_num [ orderedPrimePairsA ];
      rw [ show ( Finset.filter ( fun pq : P × P => pq.1 < pq.2 ) ( P.attach ×ˢ P.attach ) ).card = P.card * ( P.card - 1 ) / 2 from ?_ ];
      · cases P using Finset.induction <;> norm_num [ Nat.dvd_iff_mod_eq_zero, Nat.mod_two_of_bodd ] at *;
        cases k : Finset.card ( insert ‹_› ‹_› ) <;> simp_all +decide [ Nat.dvd_iff_mod_eq_zero, Nat.mod_two_of_bodd ];
      · have h_card : Finset.card (Finset.filter (fun pq : P × P => pq.1 < pq.2) (P.attach ×ˢ P.attach)) = Finset.card (Finset.powersetCard 2 P) := by
          refine' Finset.card_bij ( fun pq hpq => { pq.1.val, pq.2.val } ) _ _ _ <;> simp +decide [ Finset.mem_powersetCard ];
          · grind;
          · simp +contextual [ Finset.Subset.antisymm_iff, Finset.subset_iff ];
            intros; omega;
          · intro b hb hb'; rw [ Finset.card_eq_two ] at hb'; obtain ⟨ x, y, hxy ⟩ := hb'; simp_all +decide [ Finset.subset_iff ] ;
            cases lt_or_gt_of_ne hxy.1 <;> [ exact ⟨ x, hb.1, y, ⟨ hb.2, by linarith ⟩, rfl ⟩ ; exact ⟨ y, hb.2, x, ⟨ hb.1, by linarith ⟩, by rw [ Finset.pair_comm ] ⟩ ];
        rw [ h_card, Finset.card_powersetCard, Nat.choose_two_right ];
    refine le_trans ?_ hS_ge_c_c_minus_1_div_16X4;
    refine le_trans ( mul_le_mul_of_nonneg_left hsigmaP2_le_N_N_minus_1_div_2X4 <| by positivity ) ?_;
    field_simp;
    nlinarith [ show ( P.card : ℝ ) ≥ 8 by norm_cast, mul_le_mul_of_nonneg_left hρ4 <| show ( 0 : ℝ ) ≤ P.card by positivity, mul_le_mul_of_nonneg_left hρ4 <| show ( 0 : ℝ ) ≤ c by positivity, sq_nonneg <| ( P.card : ℝ ) - 1, sq_nonneg <| ( c : ℝ ) - 1 ];
  rw [ div_mul_eq_mul_div, div_div, le_div_iff₀ ];
  · have h_sqrt : (m : ℝ) ^ 2 * ((1 - ρ) ^ 2 / 25 * (sigmaP P) ^ 2) ≤ R := by
      exact le_trans ( mul_le_mul_of_nonneg_left hS_ge_sigmaP2 <| sq_nonneg _ ) hR_ge_m2S;
    have h_sqrt : (|↑m| * ((1 - ρ) * sigmaP P)) ^ 2 ≤ 25 * R := by
      norm_num [ mul_pow ] at * ; linarith;
    nlinarith only [ h_sqrt, Real.sqrt_nonneg R, Real.sq_sqrt ( show 0 ≤ R by exact le_trans ( QP_nonneg P a ) hQ ) ];
  · exact mul_pos ( by linarith ) ( sigmaP_pos_of_two P ( fun p hp => hP p hp |>.1 ) ( by linarith ) )

/-
**σ lower bound.**  `σ_P ≥ N/(8X²)` for a dyadic prime block (`N = |P| ≥ 2`).
    Each pair term `1/(pq)² ≥ 1/(16X⁴)` and there are `C(N,2) ≥ N²/4` pairs.
-/
lemma block_deviation_lower_bound (X : ℕ) (hX : 1 ≤ X) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (hN : 2 ≤ P.card) :
    (P.card : ℝ) / (8 * (X:ℝ)^2) ≤ sigmaP P := by
  refine' Real.le_sqrt_of_sq_le _;
  refine' le_trans _ ( Finset.sum_le_sum fun x hx => one_div_le_one_div_of_le _ <| pow_le_pow_left₀ ( by positivity ) ( show ( x.1.1 * x.2.1 : ℝ ) ≤ 4 * X ^ 2 by norm_cast; nlinarith [ hP x.1.1 x.1.2, hP x.2.1 x.2.2 ] ) 2 ) ; norm_num;
  · -- Since $P$ has at least 2 elements, the number of pairs is at least $P.card * (P.card - 1) / 2$.
    have h_pairs : (orderedPrimePairsA P).card ≥ P.card * (P.card - 1) / 2 := by
      have h_pairs : (orderedPrimePairsA P).card = Finset.card (Finset.powersetCard 2 P) := by
        refine' Finset.card_bij ( fun x hx => { x.1.1, x.2.1 } ) _ _ _ <;> simp +decide [ orderedPrimePairsA ];
        · grind;
        · simp +contextual [ Finset.Subset.antisymm_iff, Finset.subset_iff ];
          grind;
        · intro b hb hb'; rw [ Finset.card_eq_two ] at hb'; obtain ⟨ a, b, hab, rfl ⟩ := hb'; cases lt_trichotomy a b <;> aesop;
      simp_all +decide [ Nat.choose_two_right ];
    field_simp;
    norm_cast ; nlinarith [ Nat.div_mul_cancel ( show 2 ∣ #P * ( #P - 1 ) from even_iff_two_dvd.mp ( Nat.even_mul_pred_self _ ) ), Nat.sub_add_cancel ( by linarith : 1 ≤ #P ) ];
  · exact sq_pos_of_pos ( mul_pos ( Nat.cast_pos.mpr ( Nat.Prime.pos ( hP _ x.1.2 |>.1 ) ) ) ( Nat.cast_pos.mpr ( Nat.Prime.pos ( hP _ x.2.2 |>.1 ) ) ) )

/-
**Energy sub-sum.**  For disjoint vertex sets `C, E`, the cross energy between
    them is bounded by the full energy `Q_P` (the cross pairs are a sub-family of
    all ordered pairs; `crtRepr` is symmetric in its two vertices).  Mirrors
    `LocalEnergy.energy_relation`.
-/
private lemma exception_subsum_le_QP (P : Finset ℕ) [∀ p : P, NeZero p.1] (a : BlockAssignment P)
    (C E : Finset P) (hCE : Disjoint C E)
    (hCp : ∀ p ∈ C, Nat.Prime (p:ℕ)) (hEp : ∀ q ∈ E, Nat.Prime (q:ℕ)) :
    ∑ q ∈ E, ∑ p ∈ C, ((crtRepr (p:ℕ) (q:ℕ) (a p) (a q):ℝ)/((p:ℕ)*(q:ℕ)))^2 ≤ QP P a := by
  rw [ ← Finset.sum_product' ];
  refine' le_trans _ ( Finset.sum_le_sum_of_subset_of_nonneg _ _ );
  case refine'_2 => exact Finset.image ( fun pq : P × P => if pq.1.1 < pq.2.1 then pq else ( pq.2, pq.1 ) ) ( E ×ˢ C );
  · rw [ Finset.sum_image ];
    · refine' Finset.sum_le_sum fun x hx => _;
      split_ifs <;> simp_all +decide [ mul_comm ];
      · rw [ if_pos ( by simpa using ‹x.1 < x.2› ) ];
        rw [ crtRepr_symm ];
        · exact hCp _ _ hx.2;
        · exact hEp _ _ hx.1;
        · exact ne_of_gt ‹_›;
      · rw [ if_neg ( by exact not_lt_of_ge ‹_› ) ];
    · intro x hx y hy; simp_all +decide [ Finset.disjoint_left ] ;
      grind +revert;
  · intro x hx; simp_all +decide [orderedPrimePairsA] ;
    rcases hx with ⟨ a, ha, b, hb, ⟨ haE, hbC ⟩, rfl ⟩ ; split_ifs <;> simp_all +decide [ Finset.disjoint_left ] ;
    grind;
  · exact fun _ _ _ => sq_nonneg _


/- **(A3 close) Close-count bound.**  With `δ = N/(128X)`, at most `N/2` primes of
    the class are `δ`-close to an exception vertex `q` (using `crossLabel_close_fiber_bound`). -/
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
private lemma dominant_exception_close_count (X : ℕ) (hX : 16 ≤ X) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (hN : 32 ≤ P.card)
    (ρ : ℝ) (_hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4)
    (a : BlockAssignment P) (m : ℤ)
    (hmsmall : |(m:ℝ)| ≤ (P.card:ℝ) * X / 16)
    (hCcard : (1-ρ)*(P.card:ℝ) ≤
        ((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).card:ℝ))
    (q : P) (hqex : a q ≠ ((m:ℤ):ZMod (q:ℕ))) :
    (((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).filter (fun p : P =>
        |(crtRepr (p:ℕ) (q:ℕ) (a p) (a q):ℝ)| ≤ ((P.card:ℝ)/(128*X)) * ((p:ℕ)*(q:ℕ)))).card : ℝ)
      ≤ ((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).card:ℝ)/2 := by
  have hq2 := hP q.1 q.2
  have hXpos : (0:ℝ) < X := by positivity
  have hXne : (X:ℝ) ≠ 0 := ne_of_gt hXpos
  have hN2X : (P.card:ℝ) ≤ 2*X := by
    exact_mod_cast RequestProject.card_le_upper_bound_of_pos P (2 * X)
      (fun p hp => (hP p hp).1.pos) (fun p hp => (hP p hp).2.2)
  have hBX : |(m:ℝ)| ≤ (X:ℝ)^2/4 := by nlinarith [abs_nonneg (m:ℝ), hN2X, hXpos, hmsmall]
  have hδ0 : (0:ℝ) ≤ (P.card:ℝ)/(128*X) := by positivity
  have hδ4 : (P.card:ℝ)/(128*X) ≤ 1/4 := by rw [div_le_iff₀ (by positivity)]; nlinarith [hN2X, hXpos]
  have hprodX : (P.card:ℝ)/(128*X)*X = (P.card:ℝ)/128 := by
    rw [div_mul_eq_mul_div, mul_comm (128:ℝ) (X:ℝ), ← div_div, mul_div_assoc, div_self hXne, mul_one]
  have hmXdiv : |(m:ℝ)|/X ≤ (P.card:ℝ)/16 := by rw [div_le_iff₀ hXpos]; nlinarith [hmsmall]
  have hClb : (1-ρ)*(P.card:ℝ) ≤ ((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).card:ℝ) :=
    hCcard
  have hN32 : (32:ℝ) ≤ (P.card:ℝ) := by exact_mod_cast hN
  have hfinal : 2 * (2 * (2 * ((P.card:ℝ)/(128*X)) * X + |(m:ℝ)|/X) + 1)
      ≤ ((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).card:ℝ)/2 := by
    nlinarith [hprodX, hmXdiv, hClb, hρ4, hN32, hXpos]
  have hCp : ∀ p ∈ (P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))),
      Nat.Prime (p:ℕ) ∧ X ≤ (p:ℕ) ∧ (p:ℕ) ≤ 2*X := fun p _ => hP p.1 p.2
  have hCa : ∀ p ∈ (P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))),
      a p = ((m:ℤ):ZMod (p:ℕ)) := fun p hp => (Finset.mem_filter.mp hp).2
  have hqa : a q = (((a q).valMinAbs : ℤ) : ZMod (q:ℕ)) := (ZMod.coe_valMinAbs (a q)).symm
  have hqd : ¬ ((q:ℕ):ℤ) ∣ ((a q).valMinAbs - m) := by
    intro hdvd
    apply hqex
    have h0 : (((a q).valMinAbs - m : ℤ) : ZMod (q:ℕ)) = 0 :=
      (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr hdvd
    rw [Int.cast_sub, ZMod.coe_valMinAbs, sub_eq_zero] at h0
    exact h0
  have hfib := crossLabel_close_fiber_bound X P a m ((a q).valMinAbs) (|(m:ℝ)|) (abs_nonneg _) (by omega)
    (P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))) hCp hCa (le_refl _) hBX
    q hq2.1 hq2.2.1 hq2.2.2 hqa hqd ((P.card:ℝ)/(128*X)) hδ0 hδ4
  exact le_trans hfib hfinal

/-- Pure-real arithmetic backing the per-exception energy bound. -/
private lemma dominant_exception_energy_arithmetic (N X ρ c : ℝ) (hX : 0 < X) (hN : 0 < N) (hc : (1-ρ)*N ≤ c) :
    (1-ρ)*N^3/(2^15*X^2) ≤ c/2 * (N/(128*X))^2 := by
  rw [div_pow, div_le_iff₀ (by positivity)]
  have key : c/2 * (N^2/(128*X)^2) * (2^15*X^2) = c*N^2 := by field_simp; ring
  rw [key]
  nlinarith [hc, sq_nonneg N, hN]

/- **(A3) Per-exception energy.**  For a fixed label `m` with `|m| ≤ N·X/16`, every
    exception vertex `q` (`a q ≠ m mod q`) carries cross-energy over the class `C`
    at least `E₁ = (1-ρ)N³/2¹⁵X²`.  Via `crossLabel_close_fiber_bound` (close-count `≤ N/4`) and
    `exception_energy_lower_bound_of_close_count` with `δ = N/(128X)`. -/
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
private lemma dominant_exception_energy_lower_bound (X : ℕ) (hX : 16 ≤ X) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (hN : 32 ≤ P.card)
    (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4)
    (a : BlockAssignment P) (m : ℤ)
    (hmsmall : |(m:ℝ)| ≤ (P.card:ℝ) * X / 16)
    (hCcard : (1-ρ)*(P.card:ℝ) ≤
        ((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).card:ℝ))
    (q : P) (hqex : a q ≠ ((m:ℤ):ZMod (q:ℕ))) :
    (1-ρ)*(P.card:ℝ)^3/(2^15*(X:ℝ)^2) ≤
      ∑ p ∈ P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ))),
        ((crtRepr (p:ℕ) (q:ℕ) (a p) (a q):ℝ)/((p:ℕ)*(q:ℕ)))^2 := by
  have hXpos : (0:ℝ) < X := by positivity
  have hNpos : (0:ℝ) < (P.card:ℝ) := by
    have h32 : (32:ℝ) ≤ P.card := by exact_mod_cast hN
    linarith
  have hclose := dominant_exception_close_count X hX P hP hN ρ hρ hρ4 a m hmsmall hCcard q hqex
  have hEC := exception_energy_lower_bound_of_close_count P a (P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))) q
    ((P.card:ℝ)/(128*X)) (by positivity) (fun p _ => (hP p.1 p.2).1) (hP q.1 q.2).1 hclose
  exact le_trans (dominant_exception_energy_arithmetic (P.card:ℝ) X ρ _ hXpos hNpos hCcard) hEC

/- **(A3+sub-sum) Exception count bound.**  An `m`-dominant assignment of energy
    `≤ R` (label small, `|m| ≤ NX/16`) has at most `2¹⁵RX²/((1-ρ)N³)` exceptions:
    each exception carries energy `≥ E₁` (`dominant_exception_energy_lower_bound`) and these
    cross-energies sum to `≤ Q_P ≤ R` (`exception_subsum_le_QP`). -/
set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
lemma dominant_exception_count_bound (X : ℕ) (hX : 16 ≤ X) (P : Finset ℕ) [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2*X) (hN : 32 ≤ P.card)
    (ρ : ℝ) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1/4)
    (a : BlockAssignment P) (m : ℤ) (R : ℝ) (_hR1 : 1 ≤ R) (hQ : QP P a ≤ R)
    (hmsmall : |(m:ℝ)| ≤ (P.card:ℝ) * X / 16)
    (hCcard : (1-ρ)*(P.card:ℝ) ≤
        ((P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ)))).card:ℝ)) :
    ((P.attach.filter (fun q => a q ≠ ((m:ℤ):ZMod (q:ℕ)))).card : ℝ)
      ≤ 2^15 * R * (X:ℝ)^2 / ((1-ρ)*(P.card:ℝ)^3) := by
  have hXpos : (0:ℝ) < X := by positivity
  have hNpos : (0:ℝ) < (P.card:ℝ) := by
    have h32 : (32:ℝ) ≤ P.card := by exact_mod_cast hN
    linarith
  have hρ1 : (0:ℝ) < 1 - ρ := by linarith
  set E := P.attach.filter (fun q => a q ≠ ((m:ℤ):ZMod (q:ℕ))) with hEdef
  set C := P.attach.filter (fun p => a p = ((m:ℤ):ZMod (p:ℕ))) with hCdef
  set E1 := (1-ρ)*(P.card:ℝ)^3/(2^15*(X:ℝ)^2) with hE1def
  have hE1pos : 0 < E1 := by rw [hE1def]; positivity
  have hper : ∀ q ∈ E, E1 ≤ ∑ p ∈ C, ((crtRepr (p:ℕ) (q:ℕ) (a p) (a q):ℝ)/((p:ℕ)*(q:ℕ)))^2 := by
    intro q hq
    exact dominant_exception_energy_lower_bound X hX P hP hN ρ hρ hρ4 a m hmsmall hCcard q (Finset.mem_filter.mp hq).2
  have hsum : (E.card:ℝ) * E1 ≤ ∑ q ∈ E, ∑ p ∈ C, ((crtRepr (p:ℕ) (q:ℕ) (a p) (a q):ℝ)/((p:ℕ)*(q:ℕ)))^2 := by
    have : (E.card:ℝ) * E1 = ∑ _q ∈ E, E1 := by rw [Finset.sum_const, nsmul_eq_mul]
    rw [this]; exact Finset.sum_le_sum hper
  have hdisj : Disjoint C E := by
    rw [Finset.disjoint_left]
    intro p hpC hpE
    exact (Finset.mem_filter.mp hpE).2 (Finset.mem_filter.mp hpC).2
  have hsub := exception_subsum_le_QP P a C E hdisj
    (fun p _ => (hP p.1 p.2).1) (fun q _ => (hP q.1 q.2).1)
  have hfin : (E.card:ℝ) * E1 ≤ R := le_trans hsum (le_trans hsub hQ)
  rw [hE1def] at hfin
  have hE1pos2 : 0 < (1-ρ)*(P.card:ℝ)^3/(2^15*(X:ℝ)^2) := by positivity
  have h1 : (E.card:ℝ) ≤ R/((1-ρ)*(P.card:ℝ)^3/(2^15*(X:ℝ)^2)) := by
    rw [le_div_iff₀ hE1pos2]; linarith [hfin]
  calc (E.card:ℝ) ≤ R/((1-ρ)*(P.card:ℝ)^3/(2^15*(X:ℝ)^2)) := h1
    _ = 2^15*R*(X:ℝ)^2/((1-ρ)*(P.card:ℝ)^3) := by rw [div_div_eq_mul_div]; ring_nf

end LocalEnergy
