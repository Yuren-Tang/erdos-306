import Mathlib.Analysis.CStarAlgebra.Classes
import Mathlib.Analysis.Complex.Exponential

open scoped BigOperators
open scoped Real
open scoped Nat
open scoped Classical
open scoped Pointwise

set_option autoImplicit false

open Finset

/-- A disjoint low/high-frequency decomposition has positive total real part
when the low-frequency contribution strictly dominates the high-frequency
loss. -/
lemma spectralSum_re_pos_of_partition_gap
    {Ω : Type*} [Fintype Ω] [DecidableEq Ω]
    (F : Ω → ℂ) (L H : Finset Ω) (M R : ℝ)
    (hdisj : Disjoint L H) (hcover : L ∪ H = Finset.univ)
    (hmain : M ≤ (∑ ω ∈ L, F ω).re)
    (hminor : -R ≤ (∑ ω ∈ H, F ω).re)
    (hgap : R < M) :
    0 < (∑ ω, F ω).re := by
  rw [← hcover, Finset.sum_union hdisj, Complex.add_re]
  linarith

/-- A finite product weight turns a sum of factorized functions into the
product of their one-coordinate weighted sums.  The additional factor `c ω`
is independent of the product coordinate. -/
lemma sum_product_weight_mul_sum_product
    {J Ω : Type*} [Fintype J] [DecidableEq J] [Fintype Ω]
    {A : J → Type*} [∀ j, Fintype (A j)]
    (w : (j : J) → A j → ℂ)
    (z : (j : J) → Ω → A j → ℂ)
    (c : Ω → ℂ) :
    ∑ a : ∀ j, A j, (∏ j, w j (a j)) * (∑ ω, (∏ j, z j ω (a j)) * c ω) =
      ∑ ω, (∏ j, ∑ a : A j, w j a * z j ω a) * c ω := by
  simp +decide only [prod_sum, sum_mul]
  rw [Finset.sum_comm]
  refine' Finset.sum_bij (fun a _ => fun j _ => a j) _ _ _ _ <;> simp +decide
  · simp +decide [funext_iff]
  · exact fun b => ⟨fun j => b j (Finset.mem_univ j), rfl⟩
  · simp +decide [Finset.prod_mul_distrib, Finset.mul_sum _ _ _, mul_assoc]

/-- Coordinatewise exponential decay bounds the possible negative real part
of the total contribution from a finite set of frequencies. -/
lemma neg_le_spectralSum_re_of_exponential_bounds
    {J Ω X : Type*} [Fintype J] [Fintype Ω]
    (b : J → Ω → ℂ) (k : Ω → X → ℂ) (t : X)
    (F : Ω → ℂ) (H : Finset Ω)
    (Δ : Ω → J → ℝ) (C : Ω → ℝ) (R : ℝ)
    (hF_def : ∀ ω, F ω = (∏ j, b j ω) * (starRingEnd ℂ) (k ω t))
    (hb : ∀ ω ∈ H, ∀ j, ‖b j ω‖ ≤ Real.exp (-(Δ ω j)))
    (hk : ∀ ω ∈ H, ‖k ω t‖ ≤ C ω)
    (hR : (∑ ω ∈ H, C ω * Real.exp (-(∑ j, Δ ω j))) ≤ R) :
    -R ≤ (∑ ω ∈ H, F ω).re := by
  have hterm : ∀ ω ∈ H, ‖F ω‖ ≤ C ω * Real.exp (-∑ j, Δ ω j) := by
    intro ω hω
    rw [hF_def]
    simp +decide [mul_comm, Real.exp_neg, Real.exp_sum]
    exact mul_le_mul (hk ω hω)
      (by
        rw [← Finset.prod_inv_distrib]
        exact Finset.prod_le_prod (fun _ _ => norm_nonneg _) fun _ _ => by
          simpa [Real.exp_neg] using hb ω hω _)
      (Finset.prod_nonneg fun _ _ => norm_nonneg _)
      (by linarith [norm_nonneg (k ω t), hk ω hω])
  exact neg_le_of_abs_le (le_trans (Complex.abs_re_le_norm _)
    (le_trans (norm_sum_le _ _) (le_trans (Finset.sum_le_sum hterm) hR)))

/-
**Finite spectral probabilistic existence principle.**

Let `J` and `Ω` be finite sets.  For each `j ∈ J` let `A j` be a finite set carrying a
weight `p j`, let `t ∈ X`, and let `S : (∏ j, A j) → X` be a "generated object".  Suppose
that for spectral functions `k ω : X → ℂ` the indicator of `S a = t` admits the spectral
representation
`1_{S a = t} = (1/N) ∑_ω k ω (S a) * conj (k ω t)`,
that `k ω` factorises through local functions `x j : A j → X` as
`k ω (S a) = ∏_j k ω (x j (a j))`,
and that the local spectral factors are `b j ω = ∑_{a_j} p j a_j * k ω (x j a_j)`.
Set `F ω = (∏_j b j ω) * conj (k ω t)` and split `Ω = L ⊔ H`.  If
`Re ∑_{ω ∈ L} F ω ≥ M`, while on `H` we have `‖b j ω‖ ≤ exp (-Δ ω j)`, `‖k ω t‖ ≤ C ω`
and `∑_{ω ∈ H} C ω · exp (-∑_j Δ ω j) ≤ R`, then `M > R` forces the existence of some
`a` with `S a = t`.

Remark.  The statement only uses `p j` as a family of complex weights; the fact that the
`p j` are genuine probability weights (nonnegative and summing to `1`) is **not** needed for
this existence conclusion, so those hypotheses are omitted.
-/
set_option maxHeartbeats 500000 in
theorem exists_eq_of_spectral_gap
    {J Ω X : Type*} [Fintype J] [DecidableEq J] [Fintype Ω] [DecidableEq X]
    {A : J → Type*} [∀ j, Fintype (A j)]
    (p : (j : J) → A j → ℝ)
    (t : X)
    (S : ((j : J) → A j) → X)
    (N : ℝ) (hN : 0 < N)
    (k : Ω → X → ℂ)
    (hspec : ∀ a : (j : J) → A j,
      (if S a = t then (1 : ℂ) else 0)
        = (1 / (N : ℂ)) * ∑ ω, k ω (S a) * (starRingEnd ℂ) (k ω t))
    (x : (j : J) → A j → X)
    (b : J → Ω → ℂ)
    (hb_def : ∀ j ω, b j ω = ∑ a, (p j a : ℂ) * k ω (x j a))
    (hfact : ∀ (a : (j : J) → A j) (ω : Ω), k ω (S a) = ∏ j, k ω (x j (a j)))
    (F : Ω → ℂ)
    (hF_def : ∀ ω, F ω = (∏ j, b j ω) * (starRingEnd ℂ) (k ω t))
    (L H : Finset Ω) (hdisj : Disjoint L H) (hcover : L ∪ H = Finset.univ)
    (M R : ℝ)
    (hM : M ≤ (∑ ω ∈ L, F ω).re)
    (Δ : Ω → J → ℝ) (C : Ω → ℝ)
    (hb : ∀ ω ∈ H, ∀ j, ‖b j ω‖ ≤ Real.exp (-(Δ ω j)))
    (hk : ∀ ω ∈ H, ‖k ω t‖ ≤ C ω)
    (hR : (∑ ω ∈ H, C ω * Real.exp (-(∑ j, Δ ω j))) ≤ R)
    (hMR : R < M) :
    ∃ a : (j : J) → A j, S a = t := by
  by_contra h_contra;
  -- Applying the hypothesis `hspec` to each `a`, we get that the sum over `ω` of `k ω (S a) * conj (k ω t)` is zero.
  have h_sum_zero : ∑ ω, F ω = 0 := by
    have h_sum_zero : ∑ a : ∀ j, A j, (∏ j, (p j (a j) : ℂ)) * (∑ ω, (∏ j, k ω (x j (a j))) * (starRingEnd ℂ) (k ω t)) = 0 := by
      refine' Finset.sum_eq_zero fun a ha => _;
      specialize hspec a; simp_all +decide [ ne_of_gt hN ] ;
    have h_fubini := sum_product_weight_mul_sum_product
      (fun j a => (p j a : ℂ))
      (fun j ω a => k ω (x j a))
      (fun ω => (starRingEnd ℂ) (k ω t))
    have h_factorized_zero := h_fubini.symm.trans h_sum_zero
    simpa only [← hb_def, ← hF_def] using h_factorized_zero
  have hminor := neg_le_spectralSum_re_of_exponential_bounds
    b k t F H Δ C R hF_def hb hk hR
  have hpos := spectralSum_re_pos_of_partition_gap
    F L H M R hdisj hcover hM hminor hMR
  rw [h_sum_zero] at hpos
  norm_num at hpos
