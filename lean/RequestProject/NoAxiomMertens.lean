import RequestProject.DyadicBlockDef

/-!
# 공리 없는 메르텐스형 하한

`Σ_{p ≤ n} log p / p = log n + O(1)`을 르장드르 공식과 `primorial ≤ 4ⁿ`만으로
증명하고, 지수 블록으로 쪼개 `[2^{k₀}, 2^{3k₀+1})`의 소수 역수 합 하한을 얻는다.
-/

open Finset BigOperators
open scoped Nat

noncomputable section

namespace NoAxiomMertens

/-- `n` 이하 소수의 집합. -/
def P (n : ℕ) : Finset ℕ := (Finset.range (n + 1)).filter Nat.Prime

/-- `Σ_{p ≤ n} log p / p`. -/
def S (n : ℕ) : ℝ := ∑ p ∈ P n, Real.log p / p

lemma mem_P {n p : ℕ} : p ∈ P n ↔ p ≤ n ∧ p.Prime := by
  simp [P]

lemma P_mono {m n : ℕ} (h : m ≤ n) : P m ⊆ P n := by
  intro p hp
  rw [mem_P] at hp ⊢
  exact ⟨hp.1.trans h, hp.2⟩

/-- `log n! = Σ_{p ≤ n} v_p(n!) log p`. -/
lemma log_factorial_eq (n : ℕ) :
    Real.log (n ! : ℕ) = ∑ p ∈ P n, ((n !).factorization p : ℝ) * Real.log p := by
  rw [Real.log_nat_eq_sum_factorization]
  apply Finsupp.sum_of_support_subset
  · intro p hp
    rw [Nat.support_factorization] at hp
    have hpp := Nat.prime_of_mem_primeFactors hp
    have hdvd := Nat.dvd_of_mem_primeFactors hp
    rw [mem_P]
    exact ⟨(Nat.Prime.dvd_factorial hpp).mp hdvd, hpp⟩
  · intro i _
    simp

/-- 르장드르 하한: `⌊n/p⌋ ≤ v_p(n!)`. -/
lemma div_le_factorization {n p : ℕ} (hp : p.Prime) : n / p ≤ (n !).factorization p := by
  have hle : p * (n / p) ≤ n := Nat.mul_div_le n p
  have hdvd : (p * (n / p)) ! ∣ n ! := Nat.factorial_dvd_factorial hle
  have hmono := (Nat.factorization_le_iff_dvd (Nat.factorial_ne_zero _)
    (Nat.factorial_ne_zero _)).mpr hdvd p
  rw [Nat.factorization_factorial_mul hp] at hmono
  omega

/-- 실수형 하한: `n/p − 1 ≤ v_p(n!)`. -/
lemma real_div_sub_one_le {n p : ℕ} (hp : p.Prime) :
    (n : ℝ) / p - 1 ≤ ((n !).factorization p : ℝ) := by
  have hp0 : (0 : ℝ) < p := by exact_mod_cast hp.pos
  have h1 : ((n / p : ℕ) : ℝ) ≤ ((n !).factorization p : ℝ) := by
    exact_mod_cast div_le_factorization hp
  have hmod : n % p < p := Nat.mod_lt _ hp.pos
  have hdm : ((p * (n / p) + n % p : ℕ) : ℝ) = n := by
    rw [Nat.div_add_mod]
  push_cast at hdm
  have hmodR : ((n % p : ℕ) : ℝ) < p := by exact_mod_cast hmod
  have : (n : ℝ) / p < ((n / p : ℕ) : ℝ) + 1 := by
    rw [div_lt_iff₀ hp0]
    nlinarith
  linarith

/-- 실수형 상한: `v_p(n!) ≤ n/(p−1)`. -/
lemma factorization_le_real {n p : ℕ} (hp : p.Prime) :
    ((n !).factorization p : ℝ) ≤ (n : ℝ) / ((p : ℝ) - 1) := by
  have h := Nat.factorization_factorial_le_div_pred hp n
  have h2 : ((n / (p - 1) : ℕ) : ℝ) ≤ (n : ℝ) / ((p - 1 : ℕ) : ℝ) := Nat.cast_div_le
  have hp1 : ((p - 1 : ℕ) : ℝ) = (p : ℝ) - 1 := by
    rw [Nat.cast_sub hp.one_le]; simp
  rw [hp1] at h2
  calc ((n !).factorization p : ℝ) ≤ ((n / (p - 1) : ℕ) : ℝ) := by exact_mod_cast h
    _ ≤ _ := h2

/-- 망원 합: `Σ_{m=2}^{n} log m / (m(m−1)) ≤ 2 − (2 + log n)/n`. -/
lemma sum_log_div_le (n : ℕ) (hn : 1 ≤ n) :
    ∑ m ∈ Finset.Icc 2 n, Real.log m / ((m : ℝ) * ((m : ℝ) - 1))
      ≤ 2 - (2 + Real.log n) / n := by
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ n hn ih =>
    rw [show Finset.Icc 2 (n + 1) = insert (n + 1) (Finset.Icc 2 n) by
      ext x; simp [Finset.mem_Icc]; omega]
    rw [Finset.sum_insert (by simp)]
    have hnR : (1 : ℝ) ≤ n := by exact_mod_cast hn
    have hn0 : (0 : ℝ) < n := by linarith
    push_cast
    have hlog : Real.log ((n : ℝ) + 1) - Real.log n ≤ 1 / n := by
      rw [← Real.log_div (by positivity) (by positivity)]
      have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < ((n : ℝ) + 1) / n by positivity)
      have e : ((n : ℝ) + 1) / n - 1 = 1 / n := by field_simp; ring
      linarith
    have key : Real.log ((n : ℝ) + 1) / (((n : ℝ) + 1) * ((n : ℝ) + 1 - 1))
        ≤ (2 + Real.log n) / n - (2 + Real.log ((n : ℝ) + 1)) / ((n : ℝ) + 1) := by
      have e1 : ((n : ℝ) + 1 - 1) = n := by ring
      rw [e1, div_le_iff₀ (by positivity)]
      have e2 : ((2 + Real.log n) / n - (2 + Real.log ((n : ℝ) + 1)) / ((n : ℝ) + 1))
          * (((n : ℝ) + 1) * n)
          = (2 + Real.log n) * ((n : ℝ) + 1) - (2 + Real.log ((n : ℝ) + 1)) * n := by
        field_simp
      rw [e2]
      have h1n : (1 : ℝ) / n * n = 1 := by field_simp
      nlinarith [mul_le_mul_of_nonneg_right hlog (show (0 : ℝ) ≤ (n : ℝ) + 1 by linarith)]
    linarith

lemma sum_P_log_div_le (n : ℕ) :
    ∑ p ∈ P n, Real.log p / ((p : ℝ) * ((p : ℝ) - 1)) ≤ 2 := by
  rcases Nat.eq_zero_or_pos n with rfl | hn
  · simp [P, Finset.sum_filter, Nat.not_prime_zero]
  calc ∑ p ∈ P n, Real.log p / ((p : ℝ) * ((p : ℝ) - 1))
      ≤ ∑ m ∈ Finset.Icc 2 n, Real.log m / ((m : ℝ) * ((m : ℝ) - 1)) := by
        apply Finset.sum_le_sum_of_subset_of_nonneg
        · intro p hp
          rw [mem_P] at hp
          rw [Finset.mem_Icc]
          exact ⟨hp.2.two_le, hp.1⟩
        · intro m hm _
          rw [Finset.mem_Icc] at hm
          have hm2 : (2 : ℝ) ≤ m := by exact_mod_cast hm.1
          apply div_nonneg (Real.log_nonneg (by linarith))
          nlinarith
    _ ≤ 2 - (2 + Real.log n) / n := sum_log_div_le n hn
    _ ≤ 2 := by
        have : (0 : ℝ) ≤ (2 + Real.log n) / n := by
          apply div_nonneg _ (by positivity)
          have := Real.log_nonneg (show (1 : ℝ) ≤ n by exact_mod_cast hn)
          linarith
        linarith

/-- `θ(n) ≤ n log 4`. -/
lemma theta_le (n : ℕ) : ∑ p ∈ P n, Real.log p ≤ n * Real.log 4 := by
  have h := primorial_le_4_pow n
  have hpos : (0 : ℝ) < ((primorial n : ℕ) : ℝ) := by
    exact_mod_cast primorial_pos n
  have hlog : Real.log ((primorial n : ℕ) : ℝ) ≤ Real.log ((4 ^ n : ℕ) : ℝ) :=
    Real.log_le_log hpos (by exact_mod_cast h)
  have heq : Real.log ((primorial n : ℕ) : ℝ) = ∑ p ∈ P n, Real.log p := by
    unfold primorial P
    push_cast
    rw [Real.log_prod]
    intro p hp
    have := (Finset.mem_filter.mp hp).2.pos
    positivity
  rw [heq] at hlog
  push_cast at hlog
  rwa [Real.log_pow] at hlog

/-- 메르텐스 상한: `S(n) ≤ log n + log 4`. -/
lemma S_le (n : ℕ) (hn : 1 ≤ n) : S n ≤ Real.log n + Real.log 4 := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hlf : Real.log (n ! : ℕ) ≤ n * Real.log n := by
    have h := Nat.factorial_le_pow n
    have h1 : Real.log (n ! : ℕ) ≤ Real.log ((n ^ n : ℕ) : ℝ) :=
      Real.log_le_log (by exact_mod_cast Nat.factorial_pos n) (by exact_mod_cast h)
    push_cast at h1
    rwa [Real.log_pow] at h1
  have hlow : n * S n - ∑ p ∈ P n, Real.log p ≤ Real.log (n ! : ℕ) := by
    rw [log_factorial_eq, S, Finset.mul_sum, ← Finset.sum_sub_distrib]
    apply Finset.sum_le_sum
    intro p hp
    have hpp := (mem_P.mp hp).2
    have hp0 : (0 : ℝ) < p := by exact_mod_cast hpp.pos
    have hlp : 0 ≤ Real.log p := Real.log_nonneg (by exact_mod_cast hpp.one_le)
    have := mul_le_mul_of_nonneg_right (real_div_sub_one_le (n := n) hpp) hlp
    have e : (n : ℝ) * (Real.log p / p) - Real.log p = ((n : ℝ) / p - 1) * Real.log p := by
      field_simp
    linarith
  have hθ := theta_le n
  have : n * S n ≤ n * (Real.log n + Real.log 4) := by nlinarith
  exact le_of_mul_le_mul_left this hnR

/-- 메르텐스 하한: `log n − 3 ≤ S(n)`. -/
lemma le_S (n : ℕ) (hn : 1 ≤ n) : Real.log n - 3 ≤ S n := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hst := Stirling.le_log_factorial_stirling (n := n) (by omega)
  have hextra : 0 ≤ Real.log n / 2 + Real.log (2 * Real.pi) / 2 := by
    have h1 := Real.log_nonneg (show (1 : ℝ) ≤ n by exact_mod_cast hn)
    have h2 := Real.log_nonneg (show (1 : ℝ) ≤ 2 * Real.pi by
      nlinarith [Real.pi_gt_three])
    linarith
  have hup : Real.log (n ! : ℕ) ≤ n * S n + n * 2 := by
    rw [log_factorial_eq, S, Finset.mul_sum]
    have h2 := sum_P_log_div_le n
    have h2' : ∑ p ∈ P n, (n : ℝ) * (Real.log p / ((p : ℝ) * ((p : ℝ) - 1))) ≤ n * 2 := by
      rw [← Finset.mul_sum]; exact mul_le_mul_of_nonneg_left h2 hnR.le
    have : ∑ p ∈ P n, ((n !).factorization p : ℝ) * Real.log p
        ≤ ∑ p ∈ P n, ((n : ℝ) * (Real.log p / p)
            + (n : ℝ) * (Real.log p / ((p : ℝ) * ((p : ℝ) - 1)))) := by
      apply Finset.sum_le_sum
      intro p hp
      have hpp := (mem_P.mp hp).2
      have hp2 : (2 : ℝ) ≤ p := by exact_mod_cast hpp.two_le
      have hlp : 0 ≤ Real.log p := Real.log_nonneg (by linarith)
      have := mul_le_mul_of_nonneg_right (factorization_le_real (n := n) hpp) hlp
      have e : (n : ℝ) / ((p : ℝ) - 1) * Real.log p
          = (n : ℝ) * (Real.log p / p) + (n : ℝ) * (Real.log p / ((p : ℝ) * ((p : ℝ) - 1))) := by
        have : (p : ℝ) - 1 ≠ 0 := by linarith
        have : (p : ℝ) ≠ 0 := by linarith
        field_simp
        ring
      linarith
    rw [Finset.sum_add_distrib] at this
    linarith
  have : n * (Real.log n - 3) ≤ n * S n := by
    push_cast at hst
    nlinarith
  exact le_of_mul_le_mul_left this hnR

end NoAxiomMertens

end
