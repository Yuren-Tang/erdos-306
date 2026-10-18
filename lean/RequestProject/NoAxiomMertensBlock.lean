import RequestProject.NoAxiomMertens

/-!
# 공리 없는 `dyadic_mertens_cumulative`

`[2^{k₀}, 2^{3k₀+1})`을 지수 폭 `h = 10000`인 블록으로 나누고, 블록마다
메르텐스 상·하한을 적용한 뒤 `log`로 망원 합을 만든다.
-/

open Finset BigOperators

noncomputable section

namespace NoAxiomMertens

/-- `Σ_{p ≤ 2^m} 1/p`. -/
def F (m : ℕ) : ℝ := ∑ p ∈ P (2 ^ m), (1 : ℝ) / p

lemma log_two_gt : (0.6 : ℝ) < Real.log 2 := by
  have := Real.log_two_gt_d9; linarith

/-- 한 블록의 하한: `F b − F a ≥ (b − a − 7)/b`. -/
lemma F_sub_ge (a b : ℕ) (ha : 1 ≤ a) (hab : a ≤ b) :
    ((b : ℝ) - a - 7) / b ≤ F b - F a := by
  have hb : 1 ≤ b := ha.trans hab
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  have hl2 := log_two_gt
  have hsub : P (2 ^ a) ⊆ P (2 ^ b) := P_mono (Nat.pow_le_pow_right (by norm_num) hab)
  have hFdiff : F b - F a = ∑ p ∈ P (2 ^ b) \ P (2 ^ a), (1 : ℝ) / p := by
    unfold F; rw [Finset.sum_sdiff_eq_sub hsub]
  have hSdiff : S (2 ^ b) - S (2 ^ a) = ∑ p ∈ P (2 ^ b) \ P (2 ^ a), Real.log p / p := by
    unfold S; rw [Finset.sum_sdiff_eq_sub hsub]
  -- 각 항: `log p / p ≤ (b log 2) · (1/p)`.
  have hterm : ∑ p ∈ P (2 ^ b) \ P (2 ^ a), Real.log p / p
      ≤ (b * Real.log 2) * ∑ p ∈ P (2 ^ b) \ P (2 ^ a), (1 : ℝ) / p := by
    rw [Finset.mul_sum]
    apply Finset.sum_le_sum
    intro p hp
    have hp' := (mem_P.mp (Finset.mem_sdiff.mp hp).1)
    have hp0 : (0 : ℝ) < p := by exact_mod_cast hp'.2.pos
    have hle : (p : ℝ) ≤ (2 : ℝ) ^ b := by exact_mod_cast hp'.1
    have hlog : Real.log p ≤ b * Real.log 2 := by
      have := Real.log_le_log hp0 hle
      rwa [Real.log_pow] at this
    rw [div_eq_mul_one_div (Real.log p)]
    exact mul_le_mul_of_nonneg_right hlog (by positivity)
  have hSb := le_S (2 ^ b) (Nat.one_le_two_pow)
  have hSa := S_le (2 ^ a) (Nat.one_le_two_pow)
  push_cast at hSb hSa
  rw [Real.log_pow] at hSb hSa
  have hl4 : Real.log 4 = 2 * Real.log 2 := by
    rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow]; norm_num
  rw [hl4] at hSa
  have haR : (1 : ℝ) ≤ a := by exact_mod_cast ha
  have habR : (a : ℝ) ≤ b := by exact_mod_cast hab
  -- `(b − a − 2) log 2 − 3 ≤ (b log 2) · (F b − F a)`.
  have hmain : ((b : ℝ) - a - 2) * Real.log 2 - 3 ≤ (b * Real.log 2) * (F b - F a) := by
    rw [hFdiff]; nlinarith
  rw [div_le_iff₀ hbR]
  -- `(b − a − 7) log 2 ≤ (b−a−2) log 2 − 3` 이므로 `log 2`로 나눈다.
  have h3 : ((b : ℝ) - a - 7) * Real.log 2 ≤ ((b : ℝ) - a - 2) * Real.log 2 - 3 := by
    nlinarith
  have hl : 0 < Real.log 2 := by linarith
  have := h3.trans hmain
  nlinarith

/-- `log(B + h) − log B ≤ h/B`. -/
lemma log_add_sub_le (B h : ℝ) (hB : 0 < B) (hh : 0 ≤ h) :
    Real.log (B + h) - Real.log B ≤ h / B := by
  rw [← Real.log_div (by positivity) hB.ne']
  have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < (B + h) / B by positivity)
  have e : (B + h) / B - 1 = h / B := by field_simp; ring
  linarith

/-- 블록 사슬: `F(k₀ + Mh) − F(k₀) ≥ (9993/10000)(log(k₀+(M+1)h) − log(k₀+h))`. -/
lemma chain (k0 M : ℕ) (hk0 : 1 ≤ k0) :
    (9993 / 10000 : ℝ) * (Real.log ((k0 : ℝ) + (M + 1) * 10000) - Real.log ((k0 : ℝ) + 10000))
      ≤ F (k0 + M * 10000) - F k0 := by
  have hk0R : (1 : ℝ) ≤ k0 := by exact_mod_cast hk0
  have htel : F (k0 + M * 10000) - F k0
      = ∑ i ∈ Finset.range M, (F (k0 + (i + 1) * 10000) - F (k0 + i * 10000)) := by
    rw [Finset.sum_range_sub (fun i => F (k0 + i * 10000))]
    simp
  have hltel : Real.log ((k0 : ℝ) + (M + 1) * 10000) - Real.log ((k0 : ℝ) + 10000)
      = ∑ i ∈ Finset.range M, (Real.log ((k0 : ℝ) + ((i : ℝ) + 2) * 10000)
          - Real.log ((k0 : ℝ) + ((i : ℝ) + 1) * 10000)) := by
    have hcongr : ∑ i ∈ Finset.range M, (Real.log ((k0 : ℝ) + ((i : ℝ) + 2) * 10000)
          - Real.log ((k0 : ℝ) + ((i : ℝ) + 1) * 10000))
        = ∑ i ∈ Finset.range M,
            ((fun j : ℕ => Real.log ((k0 : ℝ) + ((j : ℝ) + 1) * 10000)) (i + 1)
              - (fun j : ℕ => Real.log ((k0 : ℝ) + ((j : ℝ) + 1) * 10000)) i) := by
      apply Finset.sum_congr rfl
      intro i _
      push_cast
      ring_nf
    rw [hcongr, Finset.sum_range_sub (fun j : ℕ => Real.log ((k0 : ℝ) + ((j : ℝ) + 1) * 10000))]
    push_cast
    ring_nf
  rw [htel, hltel, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro i _
  have hiR : (0 : ℝ) ≤ i := by exact_mod_cast Nat.zero_le i
  have hblk := F_sub_ge (k0 + i * 10000) (k0 + (i + 1) * 10000) (by omega) (by nlinarith)
  push_cast at hblk
  have hB : (0 : ℝ) < (k0 : ℝ) + ((i : ℝ) + 1) * 10000 := by positivity
  have hlog := log_add_sub_le ((k0 : ℝ) + ((i : ℝ) + 1) * 10000) 10000 hB (by norm_num)
  have e1 : (k0 : ℝ) + ((i : ℝ) + 1) * 10000 + 10000 = (k0 : ℝ) + ((i : ℝ) + 2) * 10000 := by ring
  rw [e1] at hlog
  have e2 : ((k0 : ℝ) + ((i : ℝ) + 1) * 10000 - ((k0 : ℝ) + (i : ℝ) * 10000) - 7)
      / ((k0 : ℝ) + ((i : ℝ) + 1) * 10000)
      = (9993 / 10000 : ℝ) * (10000 / ((k0 : ℝ) + ((i : ℝ) + 1) * 10000)) := by
    field_simp; ring
  rw [e2] at hblk
  have := mul_le_mul_of_nonneg_left hlog (show (0 : ℝ) ≤ 9993 / 10000 by norm_num)
  linarith

/-- `1.06 < log 3`. -/
lemma log_three_gt : (1.06 : ℝ) < Real.log 3 := by
  refine (Real.lt_log_iff_exp_lt (by norm_num)).mpr ?_
  have hb : (0.94 : ℝ) ≤ Real.exp (-0.06) := by
    have h := Real.add_one_le_exp (-0.06 : ℝ); linarith
  have hpos06 : (0 : ℝ) < Real.exp 0.06 := Real.exp_pos _
  rw [Real.exp_neg] at hb
  have h06m : (0.94 : ℝ) * Real.exp 0.06 ≤ 1 := by
    have := mul_le_mul_of_nonneg_right hb (le_of_lt hpos06)
    rwa [inv_mul_cancel₀ (ne_of_gt hpos06)] at this
  have he1 : Real.exp 1 < 2.7182818286 := Real.exp_one_lt_d9
  have hsplit : Real.exp (1.06 : ℝ) = Real.exp 1 * Real.exp 0.06 := by
    rw [← Real.exp_add]; norm_num
  rw [hsplit]
  nlinarith [he1, h06m, hpos06]

/-- 큰 `k₀`에서 `F(k₀ + Mh) − F(k₀) ≥ 21/20` (`M = 2k₀/h`). -/
lemma F_block_ge (k0 : ℕ) (hk0 : 10 ^ 7 ≤ k0) :
    (21 : ℝ) / 20 ≤ F (k0 + (2 * k0 / 10000) * 10000) - F k0 := by
  set M := 2 * k0 / 10000 with hM
  have hc := chain k0 M (by omega)
  have hk0R : (10 ^ 7 : ℝ) ≤ k0 := by exact_mod_cast hk0
  have hk0p : (0 : ℝ) < k0 := by linarith
  have hMn : 3 * k0 ≤ k0 + (M + 1) * 10000 := by omega
  have hMR : (3 : ℝ) * k0 ≤ (k0 : ℝ) + ((M : ℝ) + 1) * 10000 := by exact_mod_cast hMn
  have hlog1 : Real.log (3 * (k0 : ℝ)) ≤ Real.log ((k0 : ℝ) + ((M : ℝ) + 1) * 10000) :=
    Real.log_le_log (by positivity) hMR
  rw [Real.log_mul (by norm_num) hk0p.ne'] at hlog1
  have hlog2 := log_add_sub_le (k0 : ℝ) 10000 hk0p (by norm_num)
  have hsmall : (10000 : ℝ) / k0 ≤ 1 / 1000 := by
    rw [div_le_iff₀ hk0p]; linarith
  have h3 := log_three_gt
  have hdiff : (1.059 : ℝ) ≤
      Real.log ((k0 : ℝ) + ((M : ℝ) + 1) * 10000) - Real.log ((k0 : ℝ) + 10000) := by
    linarith
  linarith

end NoAxiomMertens

namespace GlobalControl

/-- **공리 없는 dyadic Mertens 누적 하한.** -/
theorem dyadic_mertens_cumulative_noAxiom :
    ∃ k1 : ℕ, 5 ≤ k1 ∧ ∀ k0 : ℕ, k1 ≤ k0 →
      (21 : ℝ) / 20 ≤
        ∑ p ∈ (Finset.Icc k0 (3 * k0)).biUnion dyadicBlock, (1 : ℝ) / (p : ℝ) := by
  refine ⟨10 ^ 7, by norm_num, fun k0 hk0 => ?_⟩
  set M := 2 * k0 / 10000 with hM
  have hF := NoAxiomMertens.F_block_ge k0 hk0
  have hsub : NoAxiomMertens.P (2 ^ k0) ⊆ NoAxiomMertens.P (2 ^ (k0 + M * 10000)) :=
    NoAxiomMertens.P_mono (Nat.pow_le_pow_right (by norm_num) (by omega))
  have hFdiff : NoAxiomMertens.F (k0 + M * 10000) - NoAxiomMertens.F k0
      = ∑ p ∈ NoAxiomMertens.P (2 ^ (k0 + M * 10000)) \ NoAxiomMertens.P (2 ^ k0),
          (1 : ℝ) / p := by
    unfold NoAxiomMertens.F; rw [Finset.sum_sdiff_eq_sub hsub]
  rw [hFdiff] at hF
  refine hF.trans (Finset.sum_le_sum_of_subset_of_nonneg ?_ (fun _ _ _ => by positivity))
  intro p hp
  rw [Finset.mem_sdiff, NoAxiomMertens.mem_P, NoAxiomMertens.mem_P] at hp
  obtain ⟨⟨hple, hpp⟩, hnot⟩ := hp
  have hgt : 2 ^ k0 < p := by
    by_contra h
    exact hnot ⟨not_lt.mp h, hpp⟩
  have hp0 : p ≠ 0 := hpp.pos.ne'
  have hkle : 2 ^ Nat.log 2 p ≤ p := Nat.pow_log_le_self 2 hp0
  have hklt : p < 2 ^ (Nat.log 2 p + 1) := Nat.lt_pow_succ_log_self (by norm_num) p
  have hMle : k0 + M * 10000 ≤ 3 * k0 := by omega
  simp only [Finset.mem_biUnion, Finset.mem_Icc, dyadicBlock, Finset.mem_filter,
    Finset.mem_Ico]
  refine ⟨Nat.log 2 p, ⟨?_, ?_⟩, ⟨hkle, hklt⟩, hpp⟩
  · by_contra hc
    push_neg at hc
    have : p < 2 ^ k0 := lt_of_lt_of_le hklt (Nat.pow_le_pow_right (by norm_num) (by omega))
    omega
  · by_contra hc
    push_neg at hc
    have h1 : 2 ^ (3 * k0 + 1) ≤ p :=
      le_trans (Nat.pow_le_pow_right (by norm_num) (by omega)) hkle
    have h2 : p ≤ 2 ^ (3 * k0) := hple.trans (Nat.pow_le_pow_right (by norm_num) hMle)
    have h3 : 2 ^ (3 * k0) < 2 ^ (3 * k0 + 1) := Nat.pow_lt_pow_right (by norm_num) (by omega)
    omega

end GlobalControl

end
