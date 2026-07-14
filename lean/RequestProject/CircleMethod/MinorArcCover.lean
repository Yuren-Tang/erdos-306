import RequestProject.Core.FiniteProducts
import RequestProject.CircleMethod.MinorArcDecomposition
import RequestProject.Spectral.BernoulliCyclicFourier

open Finset BigOperators

noncomputable section

namespace CircleMethod

/-!
# Fourier minor-arc covers

The general finite-sum split over a disjointized two-set cover lives in
`CircleMethod.MinorArcDecomposition` (`sum_le_of_minor_split_bounds`). This file instantiates it
for the quantity the spectral-existence step actually consumes: the summed
norms of the Fourier terms over the minor frequencies, split into a
block-estimate part and an extra-estimate part.

It also proves the **master per-frequency estimate**
`fourierNormWeight_le_prod_norm_of_subset`: since every Bernoulli factor is a
contraction, the Fourier-term norm is dominated by the product of the factor
norms over *any* chosen subset of edges (`norm_prod_le_prod_of_subset`).  The
single-factor control used by the extra lane and the multi-gadget damping are
one-line instances (see `docs/construction-redesign.md`, nodes P2/B2).
-/

/-- A two-family cover of a finite set of minor frequencies. -/
structure MinorArcCover (Sm : Finset ℕ) where
  Sblock : Finset ℕ
  Sextra : Finset ℕ
  hcover : Sm ⊆ Sblock ∪ Sextra

/-- The norm of the Fourier summand at one frequency. -/
def fourierNormWeight (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ) (h : ℕ) : ℝ :=
  ‖fourierTerm E theta q L h‖

/-- **Master per-frequency estimate.**  The Fourier-term norm at any frequency
is dominated by the product, over any chosen subset `S` of the edges, of the
Bernoulli factor norms: the target phase has modulus one, every factor is a
contraction, and factors outside `S` are discarded. -/
lemma fourierNormWeight_le_prod_norm_of_subset
    (E : Finset ℕ) (theta : ℕ → ℝ) (q L h : ℕ) (S : Finset ℕ)
    (hSE : S ⊆ E)
    (hθ0 : ∀ e ∈ E, 0 ≤ theta e)
    (hθ1 : ∀ e ∈ E, theta e ≤ 1)
    (heL : ∀ e ∈ E, e ∣ L)
    (hepos : ∀ e ∈ E, 0 < e)
    (hL : 0 < L) :
    fourierNormWeight E theta q L h
      ≤ ∏ e ∈ S, ‖bernoulliCharFun (theta e) ((h : ℝ) / (e : ℝ))‖ := by
  unfold fourierNormWeight fourierTerm
  rw [norm_mul]
  have hphase :
      ‖Complex.exp
        (-(2 * Real.pi * Complex.I * (h : ℂ) * (q : ℂ) / (L : ℂ)))‖ = 1 := by
    rw [Complex.norm_exp]
    have hre :
        (-(2 * Real.pi * Complex.I * (h : ℂ) * (q : ℂ) / (L : ℂ))).re = 0 := by
      simp [Complex.div_re, Complex.mul_re, Complex.mul_im, Complex.I_re, Complex.I_im]
    rw [hre, Real.exp_zero]
  rw [hphase, mul_one]
  have hfac : ∀ e ∈ E,
      ((theta e : ℂ) *
          Complex.exp (2 * Real.pi * Complex.I * (h : ℂ) * ((L / e : ℕ) : ℂ) / (L : ℂ))
        + (1 - theta e))
      = bernoulliCharFun (theta e) ((h : ℝ) / (e : ℝ)) :=
    fun e he => periodizedBernoulliFactor_eq_charFun
      (theta e) h e L (hepos e he) (heL e he) hL
  rw [Finset.prod_congr rfl hfac]
  exact RequestProject.norm_prod_le_prod_of_subset E S _ _ hSE
    (fun e he => bernoulliCharFun_norm_le_one (theta e) _ (hθ0 e he) (hθ1 e he))
    (fun e _ => le_rfl)

/-- Summed-norm minor-arc bound `∑_{h∈Sm} ‖fourierTerm h‖ ≤ Bm` from block/extra
norm estimates and an additive budget.  This is the form consumed by the
spectral-selection step (`exists_subset_sum_eq_of_fourier_gap`), which needs the
sum of norms rather than the norm of the sum. -/
theorem hminorSum_of_block_extra_norm_bounds
    (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ)
    (Sm : Finset ℕ) (C : MinorArcCover Sm)
    (Bblock Bextra Bm : ℝ)
    (hblock :
      ∑ h ∈ blockMinorPart Sm C.Sblock,
        fourierNormWeight E theta q L h ≤ Bblock)
    (hextra :
      ∑ h ∈ extraMinorPart Sm C.Sblock C.Sextra,
        fourierNormWeight E theta q L h ≤ Bextra)
    (hbudget : Bblock + Bextra ≤ Bm) :
    (∑ h ∈ Sm, ‖fourierTerm E theta q L h‖) ≤ Bm :=
  le_trans
    (sum_le_of_minor_split_bounds Sm C.Sblock C.Sextra
      (fourierNormWeight E theta q L) C.hcover hblock hextra)
    hbudget

end CircleMethod

end
