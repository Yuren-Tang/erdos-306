import Mathlib

/-!
# 체비쇼프 30 논법의 기초 보조 정리 (공리 없음)

`dyadic_prime_density`(상수 1/2)를 초등적으로 얻으려면 `ψ(x) ≥ A x − O(log x)`,
`ψ(x) − ψ(x/6) ≤ A x + O(log x)` (`A = log(2^{1/2}3^{1/3}5^{1/5}/30^{1/30}) ≈ 0.9212`)
가 필요하다. 이 파일은 그 출발점인 두 사실을 담는다.

* `cheb_weight_bounds` : `f(n) = n − ⌊n/2⌋ − ⌊n/3⌋ − ⌊n/5⌋ + ⌊n/30⌋ ∈ {0, 1}`,
  그리고 `1 ≤ n ≤ 5`이면 `f(n) = 1`.
* `log_factorial_eq_sum_vonMangoldt` : `log n! = Σ_{d ≤ n} Λ(d) ⌊n/d⌋`.
-/

open Finset BigOperators
open scoped Nat ArithmeticFunction.vonMangoldt

noncomputable section

namespace NoAxiomChebyshev

/-- 체비쇼프 가중치. -/
def chebWeight (n : ℕ) : ℤ := (n : ℤ) - (n / 2 : ℕ) - (n / 3 : ℕ) - (n / 5 : ℕ) + (n / 30 : ℕ)

lemma cheb_weight_bounds (n : ℕ) : 0 ≤ chebWeight n ∧ chebWeight n ≤ 1 := by
  unfold chebWeight
  omega

lemma cheb_weight_eq_one {n : ℕ} (h1 : 1 ≤ n) (h5 : n ≤ 5) : chebWeight n = 1 := by
  unfold chebWeight
  interval_cases n <;> rfl

/-- `log n! = Σ_{d ∈ (0, n]} Λ(d) ⌊n/d⌋`. -/
lemma log_factorial_eq_sum_vonMangoldt (n : ℕ) :
    Real.log (n ! : ℕ) = ∑ d ∈ Finset.Ioc 0 n, Λ d * ((n / d : ℕ) : ℝ) := by
  -- `log n! = Σ_{m ≤ n} log m`
  have hfact : Real.log (n ! : ℕ) = ∑ m ∈ Finset.Ioc 0 n, Real.log m := by
    induction n with
    | zero => simp
    | succ k ih =>
      rw [Nat.factorial_succ, Nat.cast_mul, Real.log_mul (by positivity)
        (by exact_mod_cast (Nat.factorial_pos k).ne'), ih,
        Finset.sum_Ioc_succ_top (Nat.zero_le k), add_comm]
  rw [hfact]
  -- `log m = Σ_{d ∣ m} Λ d`
  have hstep : ∑ m ∈ Finset.Ioc 0 n, Real.log m
      = ∑ m ∈ Finset.Ioc 0 n, ∑ d ∈ Finset.Ioc 0 n, if d ∣ m then Λ d else 0 := by
    apply Finset.sum_congr rfl
    intro m hm
    rw [← ArithmeticFunction.vonMangoldt_sum, ← Finset.sum_filter]
    apply Finset.sum_congr _ (fun _ _ => rfl)
    ext d
    rw [Finset.mem_Ioc] at hm
    simp only [Nat.mem_divisors, Finset.mem_filter, Finset.mem_Ioc]
    constructor
    · rintro ⟨hd, _⟩
      exact ⟨⟨Nat.pos_of_dvd_of_pos hd hm.1, (Nat.le_of_dvd hm.1 hd).trans hm.2⟩, hd⟩
    · rintro ⟨_, hd⟩
      exact ⟨hd, by omega⟩
  rw [hstep, Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro d hd
  rw [← Finset.sum_filter, Finset.sum_const, nsmul_eq_mul, mul_comm]
  congr 2
  rw [← Nat.Ioc_filter_dvd_card_eq_div n d]

/-- `T n = log n!`. -/
def T (n : ℕ) : ℝ := Real.log (n ! : ℕ)

/-- `T(n/j) = Σ_{d ≤ n} Λ(d) ⌊⌊n/d⌋/j⌋`. -/
lemma T_div (n j : ℕ) (hj : 0 < j) :
    T (n / j) = ∑ d ∈ Finset.Ioc 0 n, Λ d * (((n / d) / j : ℕ) : ℝ) := by
  unfold T
  rw [log_factorial_eq_sum_vonMangoldt]
  have hsub : Finset.Ioc 0 (n / j) ⊆ Finset.Ioc 0 n :=
    Finset.Ioc_subset_Ioc_right (Nat.div_le_self n j)
  rw [← Finset.sum_subset hsub]
  · apply Finset.sum_congr rfl
    intro d _
    rw [Nat.div_div_eq_div_mul, Nat.div_div_eq_div_mul, Nat.mul_comm j d]
  · intro d hd hnot
    rw [Finset.mem_Ioc] at hd hnot
    have hlt : n / j < d := by omega
    have : (n / d) / j = 0 := by
      rw [Nat.div_div_eq_div_mul]
      apply Nat.div_eq_of_lt
      have h1 : n < (n / j + 1) * j := by
        have e := Nat.div_add_mod n j
        have hm := Nat.mod_lt n hj
        nlinarith
      calc n < (n / j + 1) * j := h1
        _ ≤ d * j := Nat.mul_le_mul_right j hlt
    rw [this]; simp

/-- 체비쇼프 조합 `C(m) = T(30m) − T(15m) − T(10m) − T(6m) + T(m)`. -/
def C (m : ℕ) : ℝ := T (30 * m) - T (15 * m) - T (10 * m) - T (6 * m) + T m

lemma C_eq (m : ℕ) :
    C m = ∑ d ∈ Finset.Ioc 0 (30 * m), Λ d * ((chebWeight ((30 * m) / d) : ℤ) : ℝ) := by
  have h2 : 15 * m = 30 * m / 2 := by omega
  have h3 : 10 * m = 30 * m / 3 := by omega
  have h5 : 6 * m = 30 * m / 5 := by omega
  have h30 : m = 30 * m / 30 := by omega
  have hT1 : T (30 * m) = ∑ d ∈ Finset.Ioc 0 (30 * m), Λ d * ((((30 * m) / d) / 1 : ℕ) : ℝ) := by
    rw [← T_div _ 1 one_pos, Nat.div_one]
  unfold C
  conv_lhs => rw [h2, h3, h5]
  conv_lhs => arg 2; rw [h30]
  rw [hT1, T_div _ 2 (by norm_num), T_div _ 3 (by norm_num), T_div _ 5 (by norm_num),
    T_div _ 30 (by norm_num), ← Finset.sum_sub_distrib, ← Finset.sum_sub_distrib,
    ← Finset.sum_sub_distrib, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro d _
  unfold chebWeight
  simp only [Int.cast_add, Int.cast_sub, Int.cast_natCast, Nat.div_one]
  ring

lemma vonMangoldt_nonneg' (d : ℕ) : 0 ≤ Λ d := ArithmeticFunction.vonMangoldt_nonneg

/-- `C(m) ≤ ψ(30m)`. -/
lemma C_le_psi (m : ℕ) : C m ≤ Chebyshev.psi ((30 * m : ℕ) : ℝ) := by
  rw [C_eq, Chebyshev.psi, Nat.floor_natCast]
  apply Finset.sum_le_sum
  intro d _
  have h := (cheb_weight_bounds ((30 * m) / d)).2
  have h' : ((chebWeight ((30 * m) / d) : ℤ) : ℝ) ≤ 1 := by exact_mod_cast h
  have := mul_le_mul_of_nonneg_left h' (vonMangoldt_nonneg' d)
  linarith

/-- `ψ(30m) − ψ(5m) ≤ C(m)`. -/
lemma psi_sub_le_C (m : ℕ) :
    Chebyshev.psi ((30 * m : ℕ) : ℝ) - Chebyshev.psi ((5 * m : ℕ) : ℝ) ≤ C m := by
  rw [C_eq, Chebyshev.psi, Chebyshev.psi, Nat.floor_natCast, Nat.floor_natCast]
  have hsub : Finset.Ioc 0 (5 * m) ⊆ Finset.Ioc 0 (30 * m) :=
    Finset.Ioc_subset_Ioc_right (by omega)
  rw [← Finset.sum_sdiff_eq_sub hsub]
  calc ∑ d ∈ Finset.Ioc 0 (30 * m) \ Finset.Ioc 0 (5 * m), Λ d
      = ∑ d ∈ Finset.Ioc 0 (30 * m) \ Finset.Ioc 0 (5 * m),
          Λ d * ((chebWeight ((30 * m) / d) : ℤ) : ℝ) := by
        apply Finset.sum_congr rfl
        intro d hd
        rw [Finset.mem_sdiff, Finset.mem_Ioc, Finset.mem_Ioc] at hd
        have h1 : 1 ≤ (30 * m) / d := (Nat.one_le_div_iff hd.1.1).mpr hd.1.2
        have h5 : (30 * m) / d ≤ 5 := by
          rw [Nat.div_le_iff_le_mul_add_pred hd.1.1]
          omega
        rw [cheb_weight_eq_one h1 h5]
        simp
    _ ≤ ∑ d ∈ Finset.Ioc 0 (30 * m), Λ d * ((chebWeight ((30 * m) / d) : ℤ) : ℝ) := by
        apply Finset.sum_le_sum_of_subset_of_nonneg Finset.sdiff_subset
        intro d _ _
        have h := (cheb_weight_bounds ((30 * m) / d)).1
        have h' : (0 : ℝ) ≤ ((chebWeight ((30 * m) / d) : ℤ) : ℝ) := by exact_mod_cast h
        exact mul_nonneg (vonMangoldt_nonneg' d) h'

/-- 스털링 하한: `n log n − n ≤ T n`. -/
lemma T_ge (n : ℕ) : (n : ℝ) * Real.log n - n ≤ T n := by
  rcases Nat.eq_zero_or_pos n with rfl | hn
  · simp [T]
  have hst := Stirling.le_log_factorial_stirling (n := n) hn.ne'
  have h1 := Real.log_nonneg (show (1 : ℝ) ≤ n by exact_mod_cast hn)
  have h2 := Real.log_nonneg (show (1 : ℝ) ≤ 2 * Real.pi by nlinarith [Real.pi_gt_three])
  unfold T
  linarith

/-- 스털링 상한: `T n ≤ n log n − n + ½ log n + 1`. -/
lemma T_le (n : ℕ) (hn : 1 ≤ n) :
    T n ≤ (n : ℝ) * Real.log n - n + Real.log n / 2 + 1 := by
  have hanti : Stirling.stirlingSeq n ≤ Stirling.stirlingSeq 1 := by
    obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    exact Stirling.stirlingSeq'_antitone (Nat.zero_le k)
  have hpos : 0 < Stirling.stirlingSeq n := by
    obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    exact Stirling.stirlingSeq'_pos k
  have hlog := Real.log_le_log hpos hanti
  rw [Stirling.stirlingSeq_one, Stirling.log_stirlingSeq_formula,
    Real.log_div (Real.exp_pos 1).ne' (by positivity), Real.log_exp,
    Real.log_sqrt (by norm_num)] at hlog
  have hn0 : (0 : ℝ) < n := by exact_mod_cast hn
  rw [Real.log_mul (by norm_num) hn0.ne', Real.log_div hn0.ne' (Real.exp_pos 1).ne',
    Real.log_exp] at hlog
  unfold T
  nlinarith

/-- `L = 14 log 2 + 9 log 3 + 5 log 5 = 30A`. -/
def L : ℝ := 14 * Real.log 2 + 9 * Real.log 3 + 5 * Real.log 5

lemma log_mul_nat (k m : ℕ) (hk : 0 < k) (hm : 0 < m) :
    Real.log (((k * m : ℕ) : ℝ)) = Real.log k + Real.log m := by
  push_cast
  exact Real.log_mul (by positivity) (by positivity)

lemma small_logs : Real.log 2 ≤ 1 ∧ Real.log 3 ≤ 2 ∧ Real.log 5 ≤ 4 ∧
    0 ≤ Real.log 2 ∧ 0 ≤ Real.log 3 ∧ 0 ≤ Real.log 5 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < 2 by norm_num); linarith
  · have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < 3 by norm_num); linarith
  · have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < 5 by norm_num); linarith
  all_goals exact Real.log_nonneg (by norm_num)

lemma logs_split :
    Real.log 30 = Real.log 2 + Real.log 3 + Real.log 5 ∧
    Real.log 15 = Real.log 3 + Real.log 5 ∧
    Real.log 10 = Real.log 2 + Real.log 5 ∧
    Real.log 6 = Real.log 2 + Real.log 3 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · rw [show (30 : ℝ) = 2 * 3 * 5 by norm_num, Real.log_mul (by norm_num) (by norm_num),
      Real.log_mul (by norm_num) (by norm_num)]
  · rw [show (15 : ℝ) = 3 * 5 by norm_num, Real.log_mul (by norm_num) (by norm_num)]
  · rw [show (10 : ℝ) = 2 * 5 by norm_num, Real.log_mul (by norm_num) (by norm_num)]
  · rw [show (6 : ℝ) = 2 * 3 by norm_num, Real.log_mul (by norm_num) (by norm_num)]

/-- `C(m) ≥ L m − (3/2) log m − 10`. -/
lemma C_ge (m : ℕ) (hm : 1 ≤ m) : L * m - 3 / 2 * Real.log m - 10 ≤ C m := by
  have hm0 : 0 < m := hm
  have a30 := T_ge (30 * m)
  have a15 := T_le (15 * m) (by omega)
  have a10 := T_le (10 * m) (by omega)
  have a6 := T_le (6 * m) (by omega)
  have a1 := T_ge m
  rw [log_mul_nat 30 m (by norm_num) hm0] at a30
  rw [log_mul_nat 15 m (by norm_num) hm0] at a15
  rw [log_mul_nat 10 m (by norm_num) hm0] at a10
  rw [log_mul_nat 6 m (by norm_num) hm0] at a6
  obtain ⟨e30, e15, e10, e6⟩ := logs_split
  push_cast at a30 a15 a10 a6
  rw [e30] at a30; rw [e15] at a15; rw [e10] at a10; rw [e6] at a6
  have hs := small_logs
  unfold C L
  nlinarith [hs.1, hs.2.1, hs.2.2.1]

/-- `C(m) ≤ L m + log m + 6`. -/
lemma C_le (m : ℕ) (hm : 1 ≤ m) : C m ≤ L * m + Real.log m + 6 := by
  have hm0 : 0 < m := hm
  have a30 := T_le (30 * m) (by omega)
  have a15 := T_ge (15 * m)
  have a10 := T_ge (10 * m)
  have a6 := T_ge (6 * m)
  have a1 := T_le m hm
  rw [log_mul_nat 30 m (by norm_num) hm0] at a30
  rw [log_mul_nat 15 m (by norm_num) hm0] at a15
  rw [log_mul_nat 10 m (by norm_num) hm0] at a10
  rw [log_mul_nat 6 m (by norm_num) hm0] at a6
  obtain ⟨e30, e15, e10, e6⟩ := logs_split
  push_cast at a30 a15 a10 a6
  rw [e30] at a30; rw [e15] at a15; rw [e10] at a10; rw [e6] at a6
  have hs := small_logs
  unfold C L
  nlinarith [hs.1, hs.2.1, hs.2.2.1]

end NoAxiomChebyshev

end
