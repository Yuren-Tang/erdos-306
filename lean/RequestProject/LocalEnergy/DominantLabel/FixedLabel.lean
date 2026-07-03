import RequestProject.LocalEnergy.DominantLabel.Encoding

/-!
# Fixed dominant labels

A sufficiently small integer label is uniquely determined by its large residue
class. For a prescribed label, exception energy and entropy then bound the
whole low-energy fiber.
-/

open Finset

namespace LocalEnergy

open scoped Classical

/-
Two integer labels
    `m, m'`, each agreeing with `a` on a `(1-ρ)`-fraction of the primes of a
    block `P ⊆ [X, 2X]` (with `|m|,|m'| ≤ X²/2`), must coincide.  Two-prime
    argument: the two label classes intersect in `≥ |P|/2 ≥ 2` primes; any two
    distinct such primes `p, q` divide `m - m'`, so `pq ∣ m - m'`; but
    `pq ≥ X(X+1) > X² ≥ |m - m'|`, forcing `m = m'`.
-/
lemma dominant_label_unique (X : ℕ) (hX : 4 ≤ X) (P : Finset ℕ)
    [∀ p : P, NeZero p.1]
    (hP : ∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X) (hN : 4 ≤ P.card)
    (ρ : ℝ) (_hρ : 0 < ρ) (hρ4 : ρ ≤ 1 / 4)
    (a : BlockAssignment P) (m m' : ℤ)
    (hm : |m| ≤ (X : ℤ) ^ 2 / 2) (hm' : |m'| ≤ (X : ℤ) ^ 2 / 2)
    (hclass : (1 - ρ) * (P.card : ℝ) ≤ ((P.attach.filter
        (fun p => a p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ))
    (hclass' : (1 - ρ) * (P.card : ℝ) ≤ ((P.attach.filter
        (fun p => a p = ((m' : ℤ) : ZMod (p : ℕ)))).card : ℝ)) :
    m = m' := by
  -- By Lemma L1u, the intersection of these two subsets has at least two elements.
  have h_inter : ∃ p q : P, p.1 ≠ q.1 ∧ a p = (m : ZMod p.1) ∧ a p = (m' : ZMod p.1) ∧ a q = (m : ZMod q.1) ∧ a q = (m' : ZMod q.1) := by
    have h_inter : (Finset.filter (fun p : P => a p = (m : ZMod p.1)) (Finset.univ : Finset P)).card + (Finset.filter (fun p : P => a p = (m' : ZMod p.1)) (Finset.univ : Finset P)).card ≥ (3 / 2 : ℝ) * P.card := by
      norm_num [ Finset.filter_attach ] at * ; nlinarith [ ( by norm_cast : ( 4 :ℝ ) ≤ P.card ) ] ;
    have h_inter : (Finset.filter (fun p : P => a p = (m : ZMod p.1)) (Finset.univ : Finset P) ∩ Finset.filter (fun p : P => a p = (m' : ZMod p.1)) (Finset.univ : Finset P)).card ≥ 2 := by
      have h_inter : Finset.card (Finset.filter (fun p : P => a p = (m : ZMod p.1)) Finset.univ ∩ Finset.filter (fun p : P => a p = (m' : ZMod p.1)) Finset.univ) ≥ Finset.card (Finset.filter (fun p : P => a p = (m : ZMod p.1)) Finset.univ) + Finset.card (Finset.filter (fun p : P => a p = (m' : ZMod p.1)) Finset.univ) - P.card := by
        rw [ ← Finset.card_union_add_card_inter ];
        exact Nat.sub_le_of_le_add <| by linarith [ show Finset.card ( Finset.filter ( fun p : P => a p = ( m : ZMod p.1 ) ) Finset.univ ∪ Finset.filter ( fun p : P => a p = ( m' : ZMod p.1 ) ) Finset.univ ) ≤ P.card from le_trans ( Finset.card_le_univ _ ) ( by simp ) ] ;
      exact le_trans ( Nat.le_sub_of_add_le ( by rw [ ← @Nat.cast_le ℝ ] ; push_cast; linarith [ show ( P.card : ℝ ) ≥ 4 by norm_cast ] ) ) h_inter;
    obtain ⟨ p, hp, q, hq, hpq ⟩ := Finset.one_lt_card.mp h_inter; use p, q; aesop;
  obtain ⟨ p, q, hpq, hp, hp', hq, hq' ⟩ := h_inter; have := hP p p.2; have := hP q q.2; simp_all +decide [ ZMod.intCast_eq_intCast_iff' ] ;
  -- Since $p$ and $q$ are distinct primes, their product $pq$ divides $m - m'$.
  have h_div : (p.1 * q.1 : ℤ) ∣ (m - m') := by
    convert Int.coe_lcm_dvd ( Int.modEq_iff_dvd.mp hp ) ( Int.modEq_iff_dvd.mp hq ) using 1;
    exact_mod_cast Eq.symm ( Nat.Coprime.lcm_eq_mul <| by have := Nat.coprime_primes ( hP p p.2 |>.1 ) ( hP q q.2 |>.1 ) ; aesop );
  -- Since $p$ and $q$ are distinct primes, their product $pq$ is greater than $X^2$.
  have h_prod_gt_X2 : (p.1 * q.1 : ℤ) > X^2 := by
    by_cases hpq_eq : p.1 = q.1;
    · exact False.elim <| hpq <| Subtype.ext hpq_eq;
    · cases lt_or_gt_of_ne hpq_eq <;> nlinarith [ hP p p.2, hP q q.2 ];
  contrapose! h_prod_gt_X2;
  exact Int.le_of_dvd ( abs_pos.mpr ( sub_ne_zero.mpr h_prod_gt_X2 ) ) ( by simpa using h_div ) |> le_trans <| by cases abs_cases ( m - m' ) <;> cases abs_cases m <;> cases abs_cases m' <;> linarith [ Int.mul_ediv_add_emod ( X^2 ) 2, Int.emod_nonneg ( X^2 ) two_ne_zero, Int.emod_lt_of_pos ( X^2 ) two_pos ] ;

/-
For a fixed label `m`
    of size `|m| ≤ N·X/16`, the number of assignments with `QP ≤ R` whose
    `m`-class covers `≥ (1-ρ)N` primes is `≤ exp(εR)`.  This is the `hfibcard`
    block of `dominant_level_set_bound`, with the label-size bound taken as a
    hypothesis.
-/
lemma fixed_label_level_set_bound (eps ρ : ℝ) (hε : 0 < eps) (hρ : 0 < ρ) (hρ4 : ρ ≤ 1 / 4) :
    ∃ X0 : ℝ, 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X →
        ∀ (P : Finset ℕ) [∀ p : P, NeZero p.1],
          (∀ p ∈ P, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X) →
          (X : ℝ) / (2 * Real.log X) ≤ P.card →
          ∀ (m : ℤ), |(m : ℝ)| ≤ (P.card : ℝ) * (X : ℝ) / 16 →
          ∀ (R : ℝ), 1 ≤ R →
            ((Finset.univ.filter (fun a : BlockAssignment P =>
                QP P a ≤ R ∧
                (1 - ρ) * (P.card : ℝ) ≤ ((P.attach.filter
                  (fun p => a p = ((m : ℤ) : ZMod (p : ℕ)))).card : ℝ))).card : ℝ)
              ≤ Real.exp (eps * R) := by
  revert eps ρ hε hρ hρ4;
  intro eps ρ hε hρ hρ4
  obtain ⟨X0e, hX0e, Hent⟩ := dominant_encoding_entropy_bound eps ρ hε hρ hρ4
  obtain ⟨X0c, hX0c, Hlog⟩ := RequestProject.eventually_const_mul_log_le_nat 64
  use max (max X0e X0c) 16;
  refine' ⟨ by positivity, fun X hX P _hP hN m hmabs R hR => _ ⟩;
  intro hR1
  set N := P.card
  have hN32 : 32 ≤ N := by
    have hN32 : 32 ≤ X / (2 * Real.log X) := by
      rw [ le_div_iff₀ ] <;> nlinarith [ Hlog X ( by linarith [ le_max_left ( max X0e X0c ) 16, le_max_right ( max X0e X0c ) 16, le_max_left X0e X0c, le_max_right X0e X0c ] ), Real.log_pos ( show ( X : ℝ ) > 1 by linarith [ le_max_left ( max X0e X0c ) 16, le_max_right ( max X0e X0c ) 16, le_max_left X0e X0c, le_max_right X0e X0c ] ) ];
    exact_mod_cast hN32.trans m
  have hN2X : N ≤ 2 * X := by
    convert RequestProject.card_le_upper_bound_of_pos P (2 * X)
      (fun p hp => (hN p hp).1.pos) (fun p hp => (hN p hp).2.2) using 1
  set Hr := 2^15 * hR * (X:ℝ)^2 / ((1-ρ)*(N:ℝ)^3) with hHr_def
  have hHr0 : 0 ≤ Hr := by
    exact div_nonneg ( mul_nonneg ( mul_nonneg ( by norm_num ) ( by positivity ) ) ( sq_nonneg _ ) ) ( mul_nonneg ( by linarith ) ( pow_nonneg ( Nat.cast_nonneg _ ) _ ) )
  set h_floor := Nat.floor Hr with h_floor_def
  have h_floor_le_Hr : (h_floor : ℝ) ≤ Hr := by
    exact Nat.floor_le hHr0
  have h_filter_subset : Finset.filter (fun a => QP P a ≤ hR ∧ (1 - ρ) * (N : ℝ) ≤ ((P.attach.filter (fun p => a p = ((hmabs : ℤ) : ZMod (p : ℕ)))).card : ℝ)) Finset.univ ⊆ Finset.filter (fun a => (P.attach.filter (fun q => a q ≠ ((hmabs : ℤ) : ZMod (q : ℕ)))).card ≤ h_floor) Finset.univ := by
    intro a ha
    simp [h_floor_def] at *;
    have := dominant_exception_count_bound X ( by linarith ) P hN ( by linarith ) ρ hρ ( by linarith ) a hmabs hR hR1 ha.1 R ha.2; norm_num at *;
    exact Nat.le_floor <| by aesop;
  refine' le_trans _ ( Hent X N h_floor hR _ _ _ _ _ _ );
  any_goals assumption;
  · refine' le_trans _ ( dominant_assignment_encoding_bound X ( by linarith [ show X ≥ 16 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ) P ( fun p hp => hN p hp ) hmabs h_floor );
    exact_mod_cast Finset.card_le_card h_filter_subset;
  · exact le_trans ( le_max_of_le_left ( le_max_left _ _ ) ) hX;
  · linarith

end LocalEnergy
