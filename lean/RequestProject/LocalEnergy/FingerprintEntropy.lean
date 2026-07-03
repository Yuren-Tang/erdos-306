import RequestProject.LocalEnergy.FingerprintEnergy

/-!
# Fingerprint entropy

Energy bounds the number of hot coordinates, while analytic entropy estimates bound the number of fingerprints and hot residues.
-/

open Finset

namespace LocalEnergy

open scoped Classical

/-! ## High-energy coordinates and entropy

The combinatorial high-energy-coordinate bound and the real-analytic entropy
inequality complete the counting argument. -/

/-- If the total fingerprint
    energy over `P \ F` is `≤ R`, then the number of hot vertices (those with
    `T ≤ t_q(a_q)`) is at most `R / T`.  Combined with `∑_{q∉F} t_q ≤ Q_P(a) ≤ R`
    this gives `|Hot(a)| ≤ R/T = 7R/G_F`. -/
lemma hot_count_bound (P F : Finset ℕ) (a : (p : ℕ) → ZMod p) (T R : ℝ)
    (hT : 0 < T)
    (hR : ∑ q ∈ P \ F, fingerprintEnergy F a q (a q) ≤ R) :
    (((P \ F).filter (fun q => T ≤ fingerprintEnergy F a q (a q))).card : ℝ) ≤ R / T := by
  rw [le_div_iff₀ hT]
  set Hot := (P \ F).filter (fun q => T ≤ fingerprintEnergy F a q (a q)) with hHotdef
  have h1 : (Hot.card : ℝ) * T ≤ ∑ q ∈ Hot, fingerprintEnergy F a q (a q) := by
    have hc := Finset.card_nsmul_le_sum Hot (fun q => fingerprintEnergy F a q (a q)) T
      (fun q hq => (Finset.mem_filter.mp hq).2)
    simpa [nsmul_eq_mul] using hc
  have h2 : ∑ q ∈ Hot, fingerprintEnergy F a q (a q) ≤ ∑ q ∈ P \ F, fingerprintEnergy F a q (a q) :=
    Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _)
      (fun q _ _ => fingerprintEnergy_nonneg _ _ _ _)
  calc (Hot.card : ℝ) * T ≤ ∑ q ∈ Hot, fingerprintEnergy F a q (a q) := h1
    _ ≤ ∑ q ∈ P \ F, fingerprintEnergy F a q (a q) := h2
    _ ≤ R := hR

/-- Real-analysis bound
    `(2X)^{|F|} · C(|P|,h) · (2X)^h ≤ |P| · e^{εR}` once `R ≥ R_C` and the
    fingerprint/hot sizes obey the window relations below.  Proved in full with
    `Ceps = max ((2²¹·7/ε⁴)^{1/3}) (8/ε)` and `X0 = 3`.

    The window relations encode the fingerprint choice `Fc = ⌈εR/(2 log 2X)⌉`
    (hence both `εR/(2 log 2X) ≤ Fc ≤ εR/(2 log 2X) + 1`; the lower bound is
    essential since `Fc³` controls the hot count `h`), `Fc ≥ 8`, the block size
    `1 ≤ NP = |P| ≤ 2X`, and the high-energy-coordinate bound
    `h ≤ 7R·(2¹¹X²)/Fc³`.
-/
lemma entropy_inequality (eps : ℝ) (hε0 : 0 < eps) (hε1 : eps < 1) :
    ∃ (Ceps X0 : ℝ), 0 < Ceps ∧ 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X → ∀ (NP Fc h : ℕ) (R : ℝ),
        Ceps * (X : ℝ) ^ ((2 : ℝ) / 3) * (Real.log X) ^ ((4 : ℝ) / 3) ≤ R →
        1 ≤ NP → NP ≤ 2 * X → 8 ≤ Fc →
        eps * R / (2 * Real.log (2 * X)) ≤ (Fc : ℝ) →
        (Fc : ℝ) ≤ eps * R / (2 * Real.log (2 * X)) + 1 →
        (h : ℝ) ≤ 7 * R * (2 ^ 11 * (X : ℝ) ^ 2) / (Fc : ℝ) ^ 3 →
        (2 * (X : ℝ)) ^ Fc * (Nat.choose NP h : ℝ) * (2 * (X : ℝ)) ^ h
          ≤ (NP : ℝ) * Real.exp (eps * R) := by
  -- Choose X0 := 3 and Ceps := max ((2^21 * 7 / eps^4) ^ ((1:ℝ)/3)) (8/eps).
  use max ((2^21 * 7 / eps^4) ^ ((1:ℝ)/3)) (8/eps), 3;
  refine' ⟨ by positivity, by positivity, fun X hX NP Fc h R hR hNP hNP' hFc hFc' hFc'' hh => _ ⟩;
  -- Now use the provided inequalities to bound the terms.
  have h_bound : (Fc : ℝ) * Real.log (2 * X) + 2 * h * Real.log (2 * X) ≤ eps * R := by
    -- Use the provided inequalities to bound the terms.
    have h_bound : (Fc : ℝ) * Real.log (2 * X) ≤ eps * R / 2 + Real.log (2 * X) := by
      rw [ div_add_one, le_div_iff₀ ] at hFc'' <;> nlinarith [ Real.log_pos ( show ( 2 * X : ℝ ) > 1 by linarith ) ]
    have h_bound' : 2 * h * Real.log (2 * X) ≤ 7 * 2^15 * X^2 * (Real.log (2 * X))^4 / (eps^3 * R^2) := by
      have h_bound' : (h : ℝ) ≤ 7 * R * (2^11 * X^2) / (eps^3 * R^3 / (8 * (Real.log (2 * X))^3)) := by
        have h_bound' : (Fc : ℝ) ^ 3 ≥ (eps * R / (2 * Real.log (2 * X))) ^ 3 := by
          exact pow_le_pow_left₀ ( div_nonneg ( mul_nonneg hε0.le ( show 0 ≤ R by exact le_trans ( by positivity ) hR ) ) ( mul_nonneg zero_le_two ( Real.log_nonneg ( by norm_cast; linarith ) ) ) ) hFc' 3;
        refine le_trans hh ?_;
        gcongr;
        · exact mul_nonneg ( mul_nonneg ( by norm_num ) ( le_trans ( by positivity ) hR ) ) ( by positivity );
        · refine' div_pos ( mul_pos ( pow_pos hε0 3 ) ( pow_pos _ 3 ) ) ( mul_pos ( by norm_num ) ( pow_pos ( Real.log_pos ( by linarith ) ) 3 ) );
          exact lt_of_lt_of_le ( by exact mul_pos ( mul_pos ( lt_max_of_lt_left ( by positivity ) ) ( by positivity ) ) ( by exact Real.rpow_pos_of_pos ( Real.log_pos ( by linarith ) ) _ ) ) hR;
        · convert h_bound'.le using 1
          all_goals first | rfl | ring_nf
      convert mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_left h_bound' zero_le_two)
        (Real.log_nonneg <| show (2 * X : ℝ) ≥ 1 by linarith) using 1
      all_goals first | rfl | ring_nf
      grind;
    -- Use the provided inequalities to bound the terms further.
    have h_bound'' : R^3 ≥ 2^21 * 7 * X^2 * (Real.log X)^4 / eps^4 := by
      have h_bound'' : R^3 ≥ ((2^21 * 7 / eps^4) ^ ((1:ℝ)/3) * X^(2/3 : ℝ) * (Real.log X)^(4/3 : ℝ))^3 := by
        gcongr;
        exact le_trans ( mul_le_mul_of_nonneg_right ( mul_le_mul_of_nonneg_right ( le_max_left _ _ ) ( by positivity ) ) ( by exact Real.rpow_nonneg ( Real.log_nonneg ( by norm_cast; linarith ) ) _ ) ) hR;
      convert h_bound'' using 1 ; ring_nf;
      repeat rw [ ← Real.rpow_natCast ] ; repeat rw [ ← Real.rpow_mul ( by positivity ) ] ; norm_num ; ring_nf;
    have h_bound''' : Real.log (2 * X) ≤ 2 * Real.log X := by
      rw [ ← Real.log_rpow, Real.log_le_log_iff ] <;> norm_cast <;> nlinarith only [ hX, show X ≥ 3 by exact_mod_cast hX ];
    have h_bound'''' : 7 * 2^15 * X^2 * (Real.log (2 * X))^4 / (eps^3 * R^2) ≤ eps * R / 4 := by
      rw [ div_le_iff₀ ];
      · have h_bound'''' : 7 * 2^15 * X^2 * (2 * Real.log X)^4 ≤ eps^4 * R^3 / 4 := by
          rw [ ge_iff_le, div_le_iff₀ ] at h_bound'' <;> first | positivity | linarith;
        exact le_trans ( mul_le_mul_of_nonneg_left ( pow_le_pow_left₀ ( Real.log_nonneg ( by linarith ) ) h_bound''' 4 ) ( by positivity ) ) ( by linarith );
      · exact mul_pos ( pow_pos hε0 3 ) ( sq_pos_of_pos ( lt_of_lt_of_le ( by exact mul_pos ( mul_pos ( lt_max_of_lt_left ( by positivity ) ) ( by positivity ) ) ( Real.rpow_pos_of_pos ( Real.log_pos ( by norm_cast at *; linarith ) ) _ ) ) hR ) );
    have h_bound''''' : R ≥ 8 * Real.log X / eps := by
      refine le_trans ?_ hR;
      refine le_trans ?_ ( mul_le_mul_of_nonneg_right ( mul_le_mul_of_nonneg_right ( le_max_right _ _ ) <| by positivity ) <| by exact Real.rpow_nonneg ( Real.log_nonneg <| by linarith ) _ );
      rw [ div_mul_eq_mul_div, div_mul_eq_mul_div, div_le_div_iff_of_pos_right ] <;> try positivity;
      rw [ mul_assoc ];
      gcongr;
      refine' le_trans _ ( mul_le_mul_of_nonneg_left ( Real.rpow_le_rpow_of_exponent_le ( Real.le_log_iff_exp_le ( by positivity ) |>.2 <| by exact Real.exp_one_lt_d9.le.trans <| by norm_num; linarith ) <| show ( 4 : ℝ ) / 3 ≥ 1 by norm_num ) <| by positivity ) ; norm_num;
      exact le_mul_of_one_le_left ( Real.log_nonneg ( by linarith ) ) ( Real.one_le_rpow ( by linarith ) ( by norm_num ) );
    rw [ ge_iff_le, div_le_iff₀ ] at h_bound''''' <;> nlinarith [ Real.log_pos ( show ( X : ℝ ) > 1 by linarith ) ];
  -- Use the provided inequalities to bound the terms.
  have h_bound : (Nat.choose NP h : ℝ) ≤ NP ^ h := by
    exact_mod_cast Nat.choose_le_pow _ _;
  refine le_trans ( mul_le_mul_of_nonneg_right ( mul_le_mul_of_nonneg_left h_bound <| by positivity ) <| by positivity ) ?_;
  refine' le_trans _ ( mul_le_mul_of_nonneg_left ( Real.exp_le_exp.mpr ( show eps * R ≥ Fc * Real.log ( 2 * X ) + h * Real.log ( 2 * X ) + h * Real.log NP by
                                                                          nlinarith [ Real.log_nonneg ( show ( NP : ℝ ) ≥ 1 by norm_cast ), Real.log_le_log ( by positivity ) ( show ( NP : ℝ ) ≤ 2 * X by norm_cast ) ] ) ) ( by positivity ) );
  rw [ Real.exp_add, Real.exp_add, Real.exp_nat_mul, Real.exp_log ( by positivity ), Real.exp_nat_mul, Real.exp_log ( by positivity ), Real.exp_nat_mul, Real.exp_log ( by positivity ) ] ; ring_nf ; norm_num;
  exact mul_le_mul_of_nonneg_right ( le_mul_of_one_le_right ( by positivity ) ( by norm_cast ) ) ( by positivity )

/-
**Entropy inequality with the hot-count polynomial factor absorbed.**
    Strengthening of `entropy_inequality` that carries the extra `(h+1)` factor
    coming from summing over hot-set sizes `0 ≤ k ≤ h` (`∑_{k≤h} C(NP,k)(2X)^k ≤
    (h+1)·C(NP,h)(2X)^h`).  Obtained from `entropy_inequality` applied to `eps`
    (same window) and the bound `(h+1) ≤ exp(eps·R)` (since `h ≤ R/T` is
    polynomial in `X, R` while `R ≥ R_C` makes `exp(eps R)` dominate); the price
    is the doubled exponent `exp(2 eps R)`.
-/
lemma entropy_inequality2 (eps : ℝ) (hε0 : 0 < eps) (hε1 : eps < 1) :
    ∃ (Ceps X0 : ℝ), 0 < Ceps ∧ 0 < X0 ∧
      ∀ (X : ℕ), X0 ≤ X → ∀ (NP Fc h : ℕ) (R : ℝ),
        Ceps * (X : ℝ) ^ ((2 : ℝ) / 3) * (Real.log X) ^ ((4 : ℝ) / 3) ≤ R →
        1 ≤ NP → NP ≤ 2 * X → 8 ≤ Fc →
        eps * R / (2 * Real.log (2 * X)) ≤ (Fc : ℝ) →
        (Fc : ℝ) ≤ eps * R / (2 * Real.log (2 * X)) + 1 →
        (h : ℝ) ≤ 7 * R * (2 ^ 11 * (X : ℝ) ^ 2) / (Fc : ℝ) ^ 3 →
        (2 * (X : ℝ)) ^ Fc * ((h : ℝ) + 1) * (Nat.choose NP h : ℝ) * (2 * (X : ℝ)) ^ h
          ≤ (NP : ℝ) * Real.exp (2 * eps * R) := by
  obtain ⟨C2, X02, hC2, hX02, Hent⟩ := entropy_inequality eps hε0 hε1
  use max C2 ((2^21 * 7 / eps^4) ^ ((1:ℝ)/3) + 1), max X02 3;
  refine' ⟨ by positivity, by positivity, fun X hX NP Fc h R hR hNP hNP' hFc hFc' hFc'' hh => _ ⟩;
  -- Now show `(h:ℝ)+1 ≤ exp(eps*R)` (★).
  have h_exp : (h : ℝ) + 1 ≤ Real.exp (eps * R) := by
    -- By `Real.add_one_le_exp`, `exp(eps R) ≥ eps*R + 1`. So it suffices `2^17*7*X^2*L^3/(eps^3 R^2) ≤ eps*R`, i.e. `2^17*7*X^2*L^3 ≤ eps^4 * R^3`.
    have h_suff : 2^17 * 7 * (X : ℝ)^2 * (Real.log (2 * X))^3 ≤ eps^4 * R^3 := by
      -- Using `L ≤ 2 log X` (so `L^3 ≤ 8 (log X)^3`) and `R ≥ Ceps*X^(2/3)(log X)^(4/3)` (so `R^3 ≥ Ceps^3 X^2 (log X)^4`), it suffices `2^17*7*8 X^2 (log X)^3 ≤ eps^4 Ceps^3 X^2 (log X)^4`, i.e. `2^20*7 ≤ eps^4 Ceps^3 (log X)`.
      have h_suff' : 2^20 * 7 ≤ eps^4 * (max C2 ((2^21 * 7 / eps^4) ^ ((1:ℝ)/3) + 1))^3 * Real.log X := by
        have h_suff' : eps^4 * (max C2 ((2^21 * 7 / eps^4) ^ ((1:ℝ)/3) + 1))^3 ≥ 2^21 * 7 := by
          have h_suff' : eps^4 * ((2^21 * 7 / eps^4) ^ ((1:ℝ)/3) + 1)^3 ≥ 2^21 * 7 := by
            ring_nf;
            rw [ ← Real.rpow_natCast _ 3, ← Real.rpow_mul ( by positivity ) ] ; norm_num ; ring_nf ; norm_num [ hε0.ne' ];
            exact le_add_of_le_of_nonneg ( le_add_of_le_of_nonneg ( by linarith [ pow_pos hε0 4 ] ) ( by positivity ) ) ( by positivity );
          exact h_suff'.trans ( mul_le_mul_of_nonneg_left ( pow_le_pow_left₀ ( by positivity ) ( le_max_right _ _ ) _ ) ( by positivity ) );
        have h_log_X : Real.log X ≥ 1 / 2 := by
          exact le_trans ( Real.log_two_gt_d9.le.trans' <| by norm_num ) ( Real.log_le_log ( by norm_num ) <| Nat.cast_le.mpr <| show X ≥ 2 by linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] );
        nlinarith;
      -- Using `L ≤ 2 log X` (so `L^3 ≤ 8 (log X)^3`) and `R ≥ Ceps*X^(2/3)(log X)^(4/3)` (so `R^3 ≥ Ceps^3 X^2 (log X)^4`), we get:
      have h_bound : (Real.log (2 * X))^3 ≤ 8 * (Real.log X)^3 := by
        rw [ Real.log_mul ( by positivity ) ( by norm_cast; linarith [ show X > 0 from Nat.pos_of_ne_zero ( by rintro rfl; norm_num at * ) ] ) ];
        nlinarith only [ sq_nonneg ( Real.log 2 - Real.log X ), sq_nonneg ( Real.log 2 + Real.log X ), Real.log_pos one_lt_two, Real.log_le_log ( by positivity ) ( show ( X : ℝ ) ≥ 2 by norm_cast; linarith [ show X ≥ 2 by linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ] ) ]
      have h_bound_R : R^3 ≥ (max C2 ((2^21 * 7 / eps^4) ^ ((1:ℝ)/3) + 1))^3 * (X : ℝ)^2 * (Real.log X)^4 := by
        refine' le_trans _ ( pow_le_pow_left₀ _ hR 3 );
        · ring_nf;
          norm_num only [ ← Real.rpow_natCast, ← Real.rpow_mul ( Nat.cast_nonneg _ ), ← Real.rpow_mul ( Real.log_nonneg ( Nat.one_le_cast.mpr ( by linarith [ show X ≥ 1 by linarith [ show X ≥ 1 by exact Nat.one_le_iff_ne_zero.mpr ( by rintro rfl; norm_num at * ) ] ] ) : 1 ≤ ( X : ℝ ) ) ) ];
          norm_cast;
        · exact mul_nonneg ( mul_nonneg ( le_max_of_le_left hC2.le ) ( by positivity ) ) ( Real.rpow_nonneg ( Real.log_nonneg ( by norm_cast; linarith [ show X ≥ 1 by linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ] ) ) _ );
      refine le_trans ?_ ( mul_le_mul_of_nonneg_left h_bound_R <| by positivity );
      refine le_trans ( mul_le_mul_of_nonneg_left h_bound <| by positivity ) ?_;
      convert mul_le_mul_of_nonneg_right h_suff' ( show 0 ≤ ( X : ℝ ) ^ 2 * Real.log X ^ 3 by positivity ) using 1 <;> ring;
    -- Using the window, `Fc ≥ eps*R/(2*L)`, so `Fc^3 ≥ (eps*R/(2L))^3`, hence `h ≤ 7*R*(2^11*X^2)/Fc^3 ≤ 7*R*2^11*X^2 / (eps*R/(2L))^3 = 2^17*7 * X^2 * L^3 / (eps^3 * R^2)`.
    have h_h_bound : (h : ℝ) ≤ 2^17 * 7 * (X : ℝ)^2 * (Real.log (2 * X))^3 / (eps^3 * R^2) := by
      have h_h_bound : (Fc : ℝ)^3 ≥ (eps * R / (2 * Real.log (2 * X)))^3 := by
        gcongr;
        exact div_nonneg ( mul_nonneg hε0.le ( le_trans ( by positivity ) hR ) ) ( mul_nonneg zero_le_two ( Real.log_nonneg ( by norm_cast; linarith [ show X ≥ 1 by linarith [ show X ≥ 1 by linarith [ show X ≥ 1 by exact Nat.one_le_iff_ne_zero.mpr ( by rintro rfl; norm_num at * ) ] ] ] ) ) );
      refine le_trans hh ?_;
      rw [ div_le_div_iff₀ ];
      · refine le_trans ?_ ( mul_le_mul_of_nonneg_left h_h_bound ?_ );
        · ring_nf;
          norm_num [ show Real.log ( X * 2 ) ≠ 0 by exact ne_of_gt <| Real.log_pos <| by norm_cast; linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ];
          exact mul_le_mul_of_nonneg_left ( by norm_num ) ( by exact mul_nonneg ( mul_nonneg ( pow_nonneg ( show 0 ≤ R by exact le_trans ( by positivity ) hR ) _ ) ( sq_nonneg _ ) ) ( pow_nonneg hε0.le _ ) );
        · exact mul_nonneg ( mul_nonneg ( mul_nonneg ( by norm_num ) ( by norm_num ) ) ( sq_nonneg _ ) ) ( pow_nonneg ( Real.log_nonneg ( by norm_cast; linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ) ) _ );
      · positivity;
      · exact mul_pos ( pow_pos hε0 3 ) ( sq_pos_of_pos ( lt_of_lt_of_le ( by exact mul_pos ( mul_pos ( lt_max_of_lt_left hC2 ) ( Real.rpow_pos_of_pos ( Nat.cast_pos.mpr ( by linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ) ) _ ) ) ( Real.rpow_pos_of_pos ( Real.log_pos ( Nat.one_lt_cast.mpr ( by linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ) ) ) _ ) ) hR ) );
    -- Using the window, `Fc ≥ eps*R/(2*L)`, so `Fc^3 ≥ (eps*R/(2L))^3`, hence `h ≤ 7*R*(2^11*X^2)/Fc^3 ≤ 7*R*2^11*X^2 / (eps*R/(2L))^3 = 2^17*7 * X^2 * L^3 / (eps^3 * R^2)`. Therefore, `h + 1 ≤ eps * R + 1`.
    have h_h_bound : (h : ℝ) ≤ eps * R := by
      refine le_trans h_h_bound ?_;
      rw [ div_le_iff₀ ];
      · linarith;
      · refine' mul_pos ( pow_pos hε0 3 ) ( sq_pos_of_pos _ );
        exact lt_of_lt_of_le ( by exact mul_pos ( mul_pos ( lt_max_of_lt_left hC2 ) ( Real.rpow_pos_of_pos ( Nat.cast_pos.mpr ( by linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ) ) _ ) ) ( Real.rpow_pos_of_pos ( Real.log_pos ( Nat.one_lt_cast.mpr ( by linarith [ show X ≥ 3 by exact_mod_cast le_trans ( le_max_right _ _ ) hX ] ) ) ) _ ) ) hR;
    linarith [ Real.add_one_le_exp ( eps * R ) ];
  have hR_C2 : C2 * (X : ℝ) ^ ((2 : ℝ) / 3) *
      (Real.log X) ^ ((4 : ℝ) / 3) ≤ R := by
    exact le_trans
      (mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_right (le_max_left C2 _) (by positivity))
        (Real.rpow_nonneg (Real.log_nonneg (by
          norm_cast
          linarith [show X ≥ 3 by exact_mod_cast le_trans (le_max_right X02 3) hX])) _))
      hR
  have hmul := mul_le_mul h_exp
    (Hent X (le_trans (le_max_left _ _) hX) NP Fc h R hR_C2
      hNP hNP' hFc hFc' hFc'' hh)
    (by positivity) (by positivity)
  calc
    (2 * (X : ℝ)) ^ Fc * ((h : ℝ) + 1) * (Nat.choose NP h : ℝ) *
        (2 * (X : ℝ)) ^ h =
      ((h : ℝ) + 1) *
        ((2 * (X : ℝ)) ^ Fc * (Nat.choose NP h : ℝ) *
          (2 * (X : ℝ)) ^ h) := by ring
    _ ≤ Real.exp (eps * R) * ((NP : ℝ) * Real.exp (eps * R)) := hmul
    _ = (NP : ℝ) * Real.exp (2 * eps * R) := by
      rw [show 2 * eps * R = (2 : ℕ) * (eps * R) by ring, Real.exp_nat_mul]
      ring

end LocalEnergy

