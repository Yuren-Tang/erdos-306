/-
# Reciprocal sums over a common period

This file records the arithmetic passage between reciprocal sums and their
integerized representatives modulo a common period.  In particular,
`period_dvd_sub_iff_reciprocal_sum_eq` identifies congruence with equality when both sides lie in
the fundamental interval and hence no modular wraparound is possible.
-/
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Algebra.Order.Ring.Star
import Mathlib.Analysis.Normed.Field.Lemmas
import Mathlib.Data.Int.Star

open scoped BigOperators Classical
open Finset

noncomputable section

namespace ReciprocalPeriod

/-! ## Fourier identity — the indicator core

Under the no-wraparound hypothesis `∑_{e∈E} L/e < L`, a target integer
`q < L` is detected exactly: the divisibility
`L ∣ (∑_{e∈S} L/e − q)` is equivalent to the reciprocal identity
`∑_{e∈S} 1/e = q/L`.  The eventual Egyptian-fraction target is the explicit
specialization `q = L / b`, not part of this Fourier mechanism itself. -/

/-- For `e ∣ L` and `0 < e`, the reciprocal `1/e` equals `(L/e)/L` in `ℚ`. -/
lemma one_div_eq_period_div (e L : ℕ) (he : 0 < e) (hL : 0 < L) (hdvd : e ∣ L) :
    (1 : ℚ) / (e : ℚ) = ((L / e : ℕ) : ℚ) / (L : ℚ) := by
  have hmul : (e : ℕ) * (L / e) = L := Nat.mul_div_cancel' hdvd
  rw [div_eq_div_iff (by exact_mod_cast he.ne' : (e:ℚ) ≠ 0)
    (by exact_mod_cast hL.ne' : (L:ℚ) ≠ 0), one_mul]
  rw [mul_comm]
  exact_mod_cast hmul.symm

/-- The unit-fraction target as the integerized Fourier target `q = L / b`.
This is the sole arithmetic specialization needed when the general circle
method is applied to Egyptian fractions. -/
lemma one_div_eq_period_div_real (b L : ℕ) (hb : 0 < b) (hL : 0 < L)
    (hbL : b ∣ L) :
    (1 : ℝ) / (b : ℝ) = ((L / b : ℕ) : ℝ) / (L : ℝ) := by
  have hmul : b * (L / b) = L := Nat.mul_div_cancel' hbL
  rw [div_eq_div_iff (by exact_mod_cast hb.ne' : (b : ℝ) ≠ 0)
    (by exact_mod_cast hL.ne' : (L : ℝ) ≠ 0), one_mul, mul_comm]
  exact_mod_cast hmul.symm

/-- **No-wraparound Fourier indicator.**  A subset of an `L`-divisor set has
reciprocal mass `q / L` precisely when its integerized mass is congruent to
`q` modulo `L`; the strict total-mass bound excludes all nonzero wraps. -/
lemma period_dvd_sub_iff_reciprocal_sum_eq
    (E : Finset ℕ) (q L : ℕ) (hq : q < L) (hL : 0 < L)
    (heL : ∀ e ∈ E, e ∣ L) (he0 : ∀ e ∈ E, 0 < e)
    (hbound : (∑ e ∈ E, (L / e : ℕ)) < L)
    (S : Finset ℕ) (hS : S ⊆ E) :
    ((L : ℤ) ∣ ((∑ e ∈ S, ((L / e : ℕ) : ℤ)) - (q : ℤ)))
      ↔ (∑ e ∈ S, (1 : ℚ) / (e : ℚ)) = (q : ℚ) / (L : ℚ) := by
  set mS := ∑ e ∈ S, (L / e : ℕ) with hmSdef
  have hsumcast : (∑ e ∈ S, ((L / e : ℕ) : ℤ)) = (mS : ℤ) := by
    rw [hmSdef, Nat.cast_sum]
  rw [hsumcast]
  have hmS_lt : mS < L := lt_of_le_of_lt (Finset.sum_le_sum_of_subset hS) hbound
  -- divisibility ↔ equality of two representatives in `[0,L)`
  have hdiv_iff : ((L : ℤ) ∣ ((mS : ℤ) - (q : ℤ))) ↔ mS = q := by
    constructor
    · intro h
      obtain ⟨k, hk⟩ := h
      have hkabs : |(mS : ℤ) - (q : ℤ)| < (L : ℤ) := by
        have h1 : (mS : ℤ) < L := by exact_mod_cast hmS_lt
        have h2 : (q : ℤ) < L := by exact_mod_cast hq
        have h3 : (0 : ℤ) ≤ mS := Int.natCast_nonneg _
        have h4 : (0 : ℤ) ≤ q := Int.natCast_nonneg _
        rw [abs_lt]; omega
      rw [hk, abs_mul] at hkabs
      have hLpos : (0 : ℤ) < L := by exact_mod_cast hL
      have hk0 : k = 0 := by
        rcases eq_or_ne k 0 with h | h
        · exact h
        · exfalso
          have hLabs : |(L : ℤ)| = L := abs_of_pos hLpos
          rw [hLabs] at hkabs
          have hk1 : (1 : ℤ) ≤ |k| := Int.one_le_abs h
          nlinarith [mul_le_mul_of_nonneg_left hk1 hLpos.le, hkabs]
      rw [hk0, mul_zero, sub_eq_zero] at hk
      exact_mod_cast hk
    · intro h; rw [h, sub_self]; exact dvd_zero _
  rw [hdiv_iff]
  -- ℚ bridge
  have hqS : (∑ e ∈ S, (1 : ℚ) / (e : ℚ)) = (mS : ℚ) / (L : ℚ) := by
    rw [hmSdef]; push_cast [Finset.sum_div]
    exact Finset.sum_congr rfl (fun e he =>
      one_div_eq_period_div e L (he0 e (hS he)) hL (heL e (hS he)))
  have hLne : (L : ℚ) ≠ 0 := by exact_mod_cast hL.ne'
  rw [hqS, div_eq_div_iff hLne hLne]
  constructor
  · intro h; rw [h]
  · intro h; exact_mod_cast mul_right_cancel₀ hLne h

end ReciprocalPeriod

end
