import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

/-!
# Gaussian integer sums

An elementary one-dimensional Gaussian lattice-sum estimate used by the global
control argument. This module is independent of block systems and arithmetic
bookkeeping.
-/

open Finset BigOperators Classical

noncomputable section

namespace RequestProject

/-! ## Gaussian integer sums -/

/-- The one-dimensional integer Gaussian is summable for every positive
coefficient. -/
lemma summable_int_gaussian (A : ℝ) (hA : 0 < A) :
    Summable (fun m : ℤ => Real.exp (-A * (m : ℝ) ^ 2)) := by
  have hgeom : Summable (fun n : ℕ => Real.exp (-A) ^ n) :=
    summable_geometric_of_lt_one (by positivity)
      (Real.exp_lt_one_iff.mpr (neg_lt_zero.mpr hA))
  have hlinear : ∀ n : ℕ, (n : ℝ) ≤ (n : ℝ) ^ 2 := fun n => by
    exact_mod_cast Nat.le_self_pow (by norm_num) n
  rw [summable_int_iff_summable_nat_and_neg]
  refine ⟨?_, ?_⟩ <;>
  · refine Summable.of_nonneg_of_le (fun n => (Real.exp_pos _).le) (fun n => ?_) hgeom
    rw [← Real.exp_nat_mul]
    refine Real.exp_le_exp.mpr ?_
    push_cast
    nlinarith [hlinear n, mul_le_mul_of_nonneg_left (hlinear n) hA.le]

/-
For `0 < A ≤ 1`,
    `∑_{m ∈ ℤ} exp(-A·m²) ≤ 1 + 6/√A`.

    Proof: the `m = 0` term contributes `1`; by symmetry the rest is
    `2·∑_{m ≥ 1} exp(-A·m²)`.  Split that tail at `1/√A`: for `m ≤ 1/√A` use
    `exp ≤ 1` (at most `1/√A + 1` terms — bounded by `2/√A`), and for
    `m > 1/√A` use `m² ≥ m/√A` so `exp(-A·m²) ≤ exp(-√A·m)`, a geometric tail
    summing to `≤ 1/(√A·(1 - e^{-√A})) ≤ 2/(√A·√A)`… ; collecting gives the
    stated `1 + 6/√A`.
-/
lemma gaussian_int_sum_le (A : ℝ) (hA0 : 0 < A) (hA1 : A ≤ 1) :
    ∑' m : ℤ, Real.exp (-A * (m : ℝ) ^ 2) ≤ 1 + 6 / Real.sqrt A := by
  -- Let s := Real.sqrt A, so 0 < s ≤ 1 and s^2 = A (since 0 < A ≤ 1).
  set s := Real.sqrt A with hs_def
  have hs_pos : 0 < s := by
    exact Real.sqrt_pos.mpr hA0
  have hs_le_one : s ≤ 1 := by
    exact Real.sqrt_le_iff.mpr ⟨ by positivity, by linarith ⟩
  have hs_sq_eq_A : s^2 = A := by
    exact Real.sq_sqrt hA0.le;
  -- The sum over ℤ is 1 + 2 * ∑'_{n≥1} exp(-A*n^2).
  have h_sum_decomp : ∑' m : ℤ, Real.exp (-A * m ^ 2) = 1 + 2 * ∑' n : ℕ, Real.exp (-A * (n + 1) ^ 2) := by
    have h_sum_decomp : ∑' m : ℤ, Real.exp (-A * m ^ 2) = ∑' m : ℕ, Real.exp (-A * m ^ 2) + ∑' m : ℕ, Real.exp (-A * (-(m + 1) : ℤ) ^ 2) := by
      rw [ ← Equiv.tsum_eq ( Equiv.intEquivNat.symm ) ];
      rw [ ← tsum_even_add_odd ] <;> norm_num [ Equiv.intEquivNat ];
      · norm_num [ Equiv.intEquivNatSumNat ];
      · have h_summable : Summable (fun n : ℕ => Real.exp (-A * n ^ 2)) := by
          have := summable_geometric_of_lt_one ( by positivity ) ( Real.exp_lt_one_iff.mpr ( neg_lt_zero.mpr hA0 ) );
          exact this.of_nonneg_of_le ( fun n => by positivity ) fun n => by rw [ ← Real.exp_nat_mul ] ; ring_nf; gcongr ; norm_cast ; nlinarith;
        simpa [Equiv.intEquivNatSumNat] using h_summable;
      · norm_num [ Equiv.intEquivNatSumNat ];
        have := summable_geometric_of_lt_one ( by positivity ) ( Real.exp_lt_one_iff.mpr ( show -A < 0 by linarith ) );
        exact this.of_nonneg_of_le ( fun n => by positivity ) fun n => by rw [ ← Real.exp_nat_mul ] ; ring_nf; gcongr ; nlinarith;
    rw [ h_sum_decomp, Summable.tsum_eq_zero_add ] <;> norm_num ; ring_nf;
    have := summable_geometric_of_lt_one ( by positivity ) ( Real.exp_lt_one_iff.mpr ( neg_lt_zero.mpr hA0 ) );
    exact this.of_nonneg_of_le ( fun n => by positivity ) fun n => by rw [ ← Real.exp_nat_mul ] ; ring_nf; gcongr ; norm_cast ; nlinarith;
  -- For 1 ≤ n ≤ N: exp(-A n^2) ≤ 1; there are ≤ N ≤ 1/s such terms, contributing ≤ 1/s.
  have h_tail_bound : ∑' n : ℕ, Real.exp (-A * (n + 1) ^ 2) ≤ ∑ n ∈ Finset.range (Nat.floor (1 / s)), Real.exp (-A * (n + 1) ^ 2) + ∑' n : ℕ, Real.exp (-s * (n + Nat.floor (1 / s) + 1)) := by
    rw [ ← Summable.sum_add_tsum_nat_add ];
    refine' add_le_add le_rfl ( Summable.tsum_le_tsum _ _ _ );
    · intro i; rw [ ← hs_sq_eq_A ] ; ring_nf; norm_num;
      nlinarith only [ show ( 0 : ℝ ) ≤ s * i by positivity, show ( 0 : ℝ ) ≤ s * ⌊s⁻¹⌋₊ by positivity, show ( 0 : ℝ ) ≤ s ^ 2 * i by positivity, show ( 0 : ℝ ) ≤ s ^ 2 * ⌊s⁻¹⌋₊ by positivity, Nat.lt_floor_add_one ( s⁻¹ ), mul_inv_cancel₀ ( ne_of_gt hs_pos ), hs_pos, hs_le_one ];
    · have h_summable : Summable (fun n : ℕ => Real.exp (-A * n ^ 2)) := by
        have := Real.summable_exp_nat_mul_of_ge ( show -A < 0 by linarith ) ( show ∀ n : ℕ, ( n : ℝ ) ≤ n ^ 2 by intros n; norm_cast; nlinarith );
        convert this using 1;
      exact_mod_cast h_summable.comp_injective ( add_left_injective ( ⌊1 / s⌋₊ + 1 ) );
    · have h_geo_series : Summable (fun n : ℕ => (Real.exp (-s)) ^ (n + Nat.floor (1 / s) + 1)) := by
        exact Summable.comp_injective ( summable_geometric_of_lt_one ( by positivity ) ( by rw [ Real.exp_lt_one_iff ] ; linarith ) ) fun a b h => by simpa using h;
      simpa [← Real.exp_nat_mul, mul_comm] using h_geo_series;
    · have := summable_geometric_of_lt_one ( by positivity ) ( Real.exp_lt_one_iff.mpr ( show -A < 0 by linarith ) );
      exact Summable.of_nonneg_of_le ( fun n => by positivity ) ( fun n => by rw [ ← Real.exp_nat_mul ] ; ring_nf; gcongr ; norm_cast ; nlinarith ) this;
  -- The tail ∑_{n≥1} exp(-s*n) = exp(-s)/(1-exp(-s)) = 1/(exp s - 1) ≤ 1/s (because exp s - 1 ≥ s for all s).
  have h_tail_sum : ∑' n : ℕ, Real.exp (-s * (n + Nat.floor (1 / s) + 1)) ≤ 1 / s := by
    have h_tail_sum : ∑' n : ℕ, Real.exp (-s * (n + Nat.floor (1 / s) + 1)) = Real.exp (-s * (Nat.floor (1 / s) + 1)) / (1 - Real.exp (-s)) := by
      let c := Real.exp (-s * (Nat.floor (1 / s) + 1))
      have h_geo : HasSum (fun n : ℕ => c * Real.exp (-s) ^ n)
          (c * (1 - Real.exp (-s))⁻¹) :=
        HasSum.mul_left c <| hasSum_geometric_of_lt_one (by positivity) <|
          show Real.exp (-s) < 1 from by rw [Real.exp_lt_one_iff]; linarith
      have h_terms : (fun n : ℕ => Real.exp (-s * (n + Nat.floor (1 / s) + 1))) =
          fun n : ℕ => c * Real.exp (-s) ^ n := by
        funext n
        rw [← Real.exp_nat_mul, ← Real.exp_add]
        congr 1
        ring
      rw [h_terms, h_geo.tsum_eq]
      simp only [c, div_eq_mul_inv]
    rw [ h_tail_sum, div_le_div_iff₀ ] <;> norm_num [ Real.exp_neg ];
    · field_simp;
      rw [ mul_comm ];
      gcongr;
      · exact le_mul_of_one_le_right hs_pos.le ( by linarith );
      · linarith [ Real.add_one_le_exp s ];
    · exact inv_lt_one_of_one_lt₀ <| by norm_num; positivity;
    · positivity;
  -- For 1 ≤ n ≤ N: exp(-A n^2) ≤ 1; there are ≤ N ≤ 1/s such terms, contributing ≤ 1/s.
  have h_tail_bound : ∑ n ∈ Finset.range (Nat.floor (1 / s)), Real.exp (-A * (n + 1) ^ 2) ≤ Nat.floor (1 / s) := by
    exact le_trans ( Finset.sum_le_sum fun _ _ => Real.exp_le_one_iff.mpr <| by nlinarith ) <| by norm_num;
  ring_nf at *;
  norm_num [ sub_eq_add_neg, add_comm, add_left_comm, add_assoc ] at * ; nlinarith [ Nat.floor_le ( inv_nonneg.mpr hs_pos.le ), mul_inv_cancel₀ hs_pos.ne' ]

/-- A finite symmetric Gaussian window contains a fixed multiple of the natural
scale `1 / σ`, provided the window reaches that scale. -/
lemma gaussian_interval_sum_lower (σ : ℝ) (hσ : 0 < σ) (N : ℤ) (hN : (1 : ℝ) / σ ≤ (N : ℝ)) :
    Real.exp (-(Real.pi ^ 2 / 2)) / 2 / σ ≤
      ∑ m ∈ Finset.Icc (-N) N, Real.exp (-(2 * Real.pi ^ 2 * σ ^ 2) * (m : ℝ) ^ 2) := by
  set K : ℤ := ⌊1 / (2 * σ)⌋ with hKdef
  have h2σ : (0 : ℝ) < 2 * σ := by positivity
  have hKnn : 0 ≤ K := Int.floor_nonneg.mpr (by positivity)
  have hKle : (K : ℝ) ≤ 1 / (2 * σ) := Int.floor_le _
  have hNR : (0 : ℝ) ≤ (N : ℝ) := le_trans (by positivity) hN
  have hNZ : (0 : ℤ) ≤ N := by exact_mod_cast hNR
  have hKleN : K ≤ N := by
    have h12 : (1 : ℝ) / (2 * σ) ≤ (N : ℝ) := by
      have hh : (1 : ℝ) / (2 * σ) ≤ 1 / σ := by
        rw [div_le_div_iff₀ h2σ hσ]; nlinarith [hσ]
      linarith [hh, hN]
    exact_mod_cast le_trans hKle h12
  have hsub : Finset.Icc (0 : ℤ) K ⊆ Finset.Icc (-N) N :=
    Finset.Icc_subset_Icc (by omega) hKleN
  -- per-term lower bound on the subset
  have hterm : ∀ m ∈ Finset.Icc (0 : ℤ) K,
      Real.exp (-(Real.pi ^ 2 / 2)) ≤ Real.exp (-(2 * Real.pi ^ 2 * σ ^ 2) * (m : ℝ) ^ 2) := by
    intro m hm
    rw [Finset.mem_Icc] at hm
    have hm0 : (0 : ℝ) ≤ (m : ℝ) := by exact_mod_cast hm.1
    have hmK : (m : ℝ) ≤ 1 / (2 * σ) := le_trans (by exact_mod_cast hm.2) hKle
    have hσm : σ * (m : ℝ) ≤ 1 / 2 := by
      have h := mul_le_mul_of_nonneg_left hmK hσ.le
      have he : σ * (1 / (2 * σ)) = 1 / 2 := by field_simp
      linarith [h, he]
    apply Real.exp_le_exp.mpr
    nlinarith [Real.pi_pos, hσm, mul_nonneg hσ.le hm0,
      mul_nonneg (by linarith [hσm] : (0:ℝ) ≤ 1/2 - σ * (m:ℝ))
        (by positivity : (0:ℝ) ≤ 1/2 + σ * (m:ℝ)),
      mul_pos Real.pi_pos Real.pi_pos]
  -- count bound
  have hcard : ((Finset.Icc (0 : ℤ) K).card : ℝ) = (K : ℝ) + 1 := by
    have hc : (Finset.Icc (0 : ℤ) K).card = (K + 1).toNat := by rw [Int.card_Icc]; simp
    rw [hc]
    have : ((K + 1).toNat : ℤ) = K + 1 := Int.toNat_of_nonneg (by omega)
    exact_mod_cast this
  have hk1' : (1 : ℝ) ≤ ((K : ℝ) + 1) * (2 * σ) := by
    have hlt := Int.lt_floor_add_one (1 / (2 * σ))
    rw [← hKdef] at hlt
    rw [div_lt_iff₀ h2σ] at hlt
    linarith [hlt]
  calc Real.exp (-(Real.pi ^ 2 / 2)) / 2 / σ
      ≤ ((K : ℝ) + 1) * Real.exp (-(Real.pi ^ 2 / 2)) := by
        have hexp : (0:ℝ) < Real.exp (-(Real.pi ^ 2 / 2)) := Real.exp_pos _
        rw [div_div, div_le_iff₀ h2σ]
        nlinarith [mul_le_mul_of_nonneg_left hk1' hexp.le, hexp]
    _ = ∑ _m ∈ Finset.Icc (0 : ℤ) K, Real.exp (-(Real.pi ^ 2 / 2)) := by
        rw [Finset.sum_const, nsmul_eq_mul, hcard]
    _ ≤ ∑ m ∈ Finset.Icc (0 : ℤ) K, Real.exp (-(2 * Real.pi ^ 2 * σ ^ 2) * (m : ℝ) ^ 2) :=
        Finset.sum_le_sum hterm
    _ ≤ ∑ m ∈ Finset.Icc (-N) N, Real.exp (-(2 * Real.pi ^ 2 * σ ^ 2) * (m : ℝ) ^ 2) :=
        Finset.sum_le_sum_of_subset_of_nonneg hsub (fun m _ _ => (Real.exp_pos _).le)


end RequestProject

end
