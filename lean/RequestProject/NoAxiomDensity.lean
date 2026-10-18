import RequestProject.NoAxiomChebyshev
import RequestProject.NoAxiomMertensBlock

/-!
# 공리 없는 dyadic 소수 밀도 (큰 `k`)

체비쇼프 30 조합으로 `θ(2N) − θ(N) ≥ 0.55 N` (`N = 2^k`, `k ≥ 56`)을 얻고
`2^k / (2 log 2^k) ≤ #(dyadicBlock k)`로 바꾼다.
-/

open Finset BigOperators

noncomputable section

namespace NoAxiomChebyshev

/-- `y ≥ 2^56`이면 `√y · log y ≤ y / 4096`. -/
lemma sqrt_mul_log_le (y : ℝ) (hy : (2 : ℝ) ^ 56 ≤ y) :
    Real.sqrt y * Real.log y ≤ y / 4096 := by
  have hy0 : 0 ≤ y := le_trans (by positivity) hy
  set t := y ^ ((1 : ℝ) / 4) with ht
  have ht0 : 0 ≤ t := Real.rpow_nonneg hy0 _
  have hl : Real.log y ≤ y ^ ((1 : ℝ) / 4) / (1 / 4) :=
    Real.log_le_rpow_div hy0 (by norm_num)
  have ht4 : t ^ 4 = y := by
    rw [ht, ← Real.rpow_natCast, ← Real.rpow_mul hy0]; norm_num
  have hsq : Real.sqrt y = t ^ 2 := by
    rw [← ht4, show t ^ 4 = (t ^ 2) ^ 2 by ring, Real.sqrt_sq (by positivity)]
  have hq : (2 : ℝ) ^ 14 ≤ t := by
    have h1 : ((2 : ℝ) ^ 56) ^ ((1 : ℝ) / 4) ≤ t :=
      Real.rpow_le_rpow (by positivity) hy (by norm_num)
    have h2 : ((2 : ℝ) ^ 56) ^ ((1 : ℝ) / 4) = 2 ^ 14 := by
      rw [show ((2 : ℝ) ^ 56) = ((2 : ℝ) ^ 14) ^ (4 : ℕ) by norm_num,
        show ((1 : ℝ) / 4) = ((4 : ℕ) : ℝ)⁻¹ by norm_num,
        Real.pow_rpow_inv_natCast (by positivity) (by norm_num)]
    linarith
  rw [hsq]
  have hl' : Real.log y ≤ 4 * t := by linarith
  have ht2 : 0 ≤ t ^ 2 := by positivity
  have h1 : t ^ 2 * Real.log y ≤ t ^ 2 * (4 * t) := mul_le_mul_of_nonneg_left hl' ht2
  have h3 : t ^ 2 * (4 * t) ≤ y / 4096 := by
    rw [← ht4]
    have : 0 ≤ t ^ 3 := by positivity
    nlinarith
  linarith

/-- `L ≥ 26.17`. -/
lemma L_ge : (26.17 : ℝ) ≤ L := by
  have h2 := Real.log_two_gt_d9
  have h3 := NoAxiomMertens.log_three_gt
  have h5 : Real.log 4 ≤ Real.log 5 := Real.log_le_log (by norm_num) (by norm_num)
  have h4 : Real.log 4 = 2 * Real.log 2 := by
    rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow]; norm_num
  unfold L
  linarith

/-- 체비쇼프 θ 차이 하한: `θ(2N) − θ(N) ≥ 0.64 N − 126 − 2.5 log(2N) − 4 √(2N) log(2N)`. -/
lemma theta_diff_ge (N : ℕ) (hN : 60 ≤ N) :
    (0.64 : ℝ) * N - 126 - 5 / 2 * Real.log (2 * N) - 4 * (Real.sqrt (2 * N) * Real.log (2 * N))
      ≤ Chebyshev.theta (2 * N) - Chebyshev.theta N := by
  set m1 := 2 * N / 30 with hm1
  set m2 := N / 30 + 1 with hm2
  have hm1pos : 1 ≤ m1 := by omega
  have hm2pos : 1 ≤ m2 := by omega
  have hNR : (60 : ℝ) ≤ N := by exact_mod_cast hN
  set Y := Real.log (2 * (N : ℝ)) with hY
  set Z := Real.sqrt (2 * (N : ℝ)) with hZ
  have hY1 : 1 ≤ Y := by
    rw [hY, Real.le_log_iff_exp_le (by positivity)]
    have := Real.exp_one_lt_d9; linarith
  have hZ1 : 1 ≤ Z := by
    rw [hZ, Real.le_sqrt (by norm_num) (by positivity)]; linarith
  -- 아래쪽: `ψ(2N) ≥ L m1 − 1.5 log m1 − 10`
  have hpsi2 : Chebyshev.psi ((30 * m1 : ℕ) : ℝ) ≤ Chebyshev.psi (2 * N) := by
    apply Chebyshev.psi_mono
    have : 30 * m1 ≤ 2 * N := by omega
    have : ((30 * m1 : ℕ) : ℝ) ≤ ((2 * N : ℕ) : ℝ) := by exact_mod_cast this
    simpa using this
  have hC1 := C_ge m1 hm1pos
  have hC1' := C_le_psi m1
  have hlogm1 : Real.log m1 ≤ Y := by
    apply Real.log_le_log (by exact_mod_cast hm1pos)
    have : m1 ≤ 2 * N := by omega
    have : ((m1 : ℕ) : ℝ) ≤ ((2 * N : ℕ) : ℝ) := by exact_mod_cast this
    simpa using this
  -- 위쪽: `ψ(N) ≤ C(m2) + ψ(5 m2)`
  have hpsi1 : Chebyshev.psi N ≤ Chebyshev.psi ((30 * m2 : ℕ) : ℝ) := by
    apply Chebyshev.psi_mono
    have : N ≤ 30 * m2 := by omega
    exact_mod_cast this
  have hC2 := psi_sub_le_C m2
  have hC2' := C_le m2 hm2pos
  have hlogm2 : Real.log m2 ≤ Y := by
    apply Real.log_le_log (by exact_mod_cast hm2pos)
    have : m2 ≤ 2 * N := by omega
    have : ((m2 : ℕ) : ℝ) ≤ ((2 * N : ℕ) : ℝ) := by exact_mod_cast this
    simpa using this
  have h5m2 : ((5 * m2 : ℕ) : ℝ) ≤ 2 * (N : ℝ) := by
    have : 5 * m2 ≤ 2 * N := by omega
    have : ((5 * m2 : ℕ) : ℝ) ≤ ((2 * N : ℕ) : ℝ) := by exact_mod_cast this
    simpa using this
  have h5m2one : (1 : ℝ) ≤ ((5 * m2 : ℕ) : ℝ) := by
    have : 1 ≤ 5 * m2 := by omega
    exact_mod_cast this
  have hpsi5 := Chebyshev.psi_le h5m2one
  have hsq5 : Real.sqrt ((5 * m2 : ℕ) : ℝ) ≤ Z := Real.sqrt_le_sqrt h5m2
  have hlog5 : Real.log ((5 * m2 : ℕ) : ℝ) ≤ Y := Real.log_le_log (by linarith) h5m2
  have hlog5nn : 0 ≤ Real.log ((5 * m2 : ℕ) : ℝ) := Real.log_nonneg h5m2one
  have hsq5nn : 0 ≤ Real.sqrt ((5 * m2 : ℕ) : ℝ) := Real.sqrt_nonneg _
  have herr5 : Real.sqrt ((5 * m2 : ℕ) : ℝ) * Real.log ((5 * m2 : ℕ) : ℝ) ≤ Z * Y :=
    mul_le_mul hsq5 hlog5 hlog5nn (by linarith)
  -- ψ ↔ θ
  have hth2 : Chebyshev.psi (2 * N) - Chebyshev.theta (2 * N) ≤ 2 * Z * Y := by
    have := Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log (x := 2 * (N : ℝ)) (by linarith)
    have := (abs_le.mp this).2
    rw [hZ, hY]; linarith
  have hth1 : Chebyshev.theta N ≤ Chebyshev.psi N := Chebyshev.theta_le_psi _
  -- 정수 근사
  have hm1R : 2 * (N : ℝ) - 29 ≤ 30 * (m1 : ℝ) := by
    have : 2 * N ≤ 30 * m1 + 29 := by omega
    have : ((2 * N : ℕ) : ℝ) ≤ ((30 * m1 + 29 : ℕ) : ℝ) := by exact_mod_cast this
    push_cast at this; linarith
  have hm2R : 30 * (m2 : ℝ) ≤ (N : ℝ) + 30 := by
    have : 30 * m2 ≤ N + 30 := by omega
    have : ((30 * m2 : ℕ) : ℝ) ≤ ((N + 30 : ℕ) : ℝ) := by exact_mod_cast this
    push_cast at this; linarith
  have hL := L_ge
  have hs := small_logs
  have hLle : L ≤ 52 := by unfold L; linarith [hs.1, hs.2.1, hs.2.2.1]
  have hl2 := Real.log_two_lt_d9
  have h4 : Real.log 4 = 2 * Real.log 2 := by
    rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow]; norm_num
  push_cast at hC1' hpsi2 hpsi1 hC2 hpsi5
  -- `L (m1 − m2) ≥ L (N − 59)/30`
  have hLm : L * ((N : ℝ) - 59) / 30 ≤ L * (m1 : ℝ) - L * (m2 : ℝ) := by
    have : ((N : ℝ) - 59) / 30 ≤ (m1 : ℝ) - (m2 : ℝ) := by linarith
    have := mul_le_mul_of_nonneg_left this (by linarith : (0 : ℝ) ≤ L)
    linarith
  have hLN : (26.17 : ℝ) * N ≤ L * N := mul_le_mul_of_nonneg_right hL (by linarith)
  have hlog4m2 : Real.log 4 * (5 * (m2 : ℝ)) ≤ Real.log 4 * (((N : ℝ) + 30) / 6) := by
    apply mul_le_mul_of_nonneg_left (by linarith)
    rw [h4]; linarith [Real.log_two_gt_d9]
  rw [h4] at hlog4m2 hpsi5
  push_cast at herr5
  have hl2N : Real.log 2 * (N : ℝ) ≤ 0.6931471808 * N :=
    mul_le_mul_of_nonneg_right hl2.le (by linarith)
  linarith

/-- `θ(2·2ᵏ) − θ(2ᵏ) ≤ #(dyadicBlock k) · log(2·2ᵏ)`. -/
lemma theta_diff_le_card (k : ℕ) (hk : 1 ≤ k) :
    Chebyshev.theta (2 * ((2 ^ k : ℕ) : ℝ)) - Chebyshev.theta ((2 ^ k : ℕ) : ℝ)
      ≤ ((GlobalControl.dyadicBlock k).card : ℝ) * Real.log (2 * ((2 ^ k : ℕ) : ℝ)) := by
  set N := 2 ^ k with hNdef
  have hN2 : 2 ≤ N := by
    have := Nat.pow_le_pow_right (show 0 < 2 by norm_num) hk; simpa [hNdef] using this
  have e2 : (2 * (N : ℝ)) = ((2 * N : ℕ) : ℝ) := by push_cast; ring
  rw [e2]
  unfold Chebyshev.theta
  rw [Nat.floor_natCast, Nat.floor_natCast]
  have hsub : (Finset.Ioc 0 N).filter Nat.Prime ⊆ (Finset.Ioc 0 (2 * N)).filter Nat.Prime :=
    Finset.filter_subset_filter _ (Finset.Ioc_subset_Ioc_right (by omega))
  rw [← Finset.sum_sdiff_eq_sub hsub]
  have hsub2 : (Finset.Ioc 0 (2 * N)).filter Nat.Prime \ (Finset.Ioc 0 N).filter Nat.Prime
      ⊆ GlobalControl.dyadicBlock k := by
    intro p hp
    simp only [Finset.mem_sdiff, Finset.mem_filter, Finset.mem_Ioc, not_and] at hp
    obtain ⟨⟨⟨hp0, hp2⟩, hpp⟩, hnot⟩ := hp
    have hgt : N < p := by
      by_contra h
      exact hnot ⟨hp0, not_lt.mp h⟩ hpp
    have hne : p ≠ 2 * N := by
      rintro rfl
      have := (Nat.Prime.eq_one_or_self_of_dvd hpp 2 (dvd_mul_right 2 N))
      omega
    simp only [GlobalControl.dyadicBlock, Finset.mem_filter, Finset.mem_Ico]
    refine ⟨⟨by omega, ?_⟩, hpp⟩
    rw [pow_succ]; omega
  calc ∑ p ∈ (Finset.Ioc 0 (2 * N)).filter Nat.Prime \ (Finset.Ioc 0 N).filter Nat.Prime,
        Real.log p
      ≤ ∑ p ∈ GlobalControl.dyadicBlock k, Real.log p := by
        apply Finset.sum_le_sum_of_subset_of_nonneg hsub2
        intro p hp _
        have := (Finset.mem_filter.mp hp).2
        exact Real.log_nonneg (by exact_mod_cast this.one_le)
    _ ≤ (GlobalControl.dyadicBlock k).card • Real.log ((2 * N : ℕ) : ℝ) := by
        apply Finset.sum_le_card_nsmul
        intro p hp
        have hp' := Finset.mem_filter.mp hp
        rw [Finset.mem_Ico] at hp'
        apply Real.log_le_log (by exact_mod_cast hp'.2.pos)
        have : p ≤ 2 * N := by rw [hNdef, ← pow_succ']; exact hp'.1.2.le
        exact_mod_cast this
    _ = _ := by rw [nsmul_eq_mul]

end NoAxiomChebyshev

namespace GlobalControl

/-- **공리 없는 dyadic 소수 밀도** (`k ≥ 56`). -/
theorem dyadic_prime_density_noAxiom (k : ℕ) (hk : 56 ≤ k) :
    (2 ^ k : ℝ) / (2 * Real.log (2 ^ k)) ≤ ((dyadicBlock k).card : ℝ) := by
  set N := 2 ^ k with hNdef
  have hNcast : ((N : ℕ) : ℝ) = (2 : ℝ) ^ k := by rw [hNdef]; push_cast; ring
  have hN56 : (2 : ℝ) ^ 56 ≤ (N : ℝ) := by
    rw [hNcast]; exact pow_le_pow_right₀ (by norm_num) hk
  have hN60 : 60 ≤ N := by
    have : (60 : ℝ) ≤ (N : ℝ) := le_trans (by norm_num) hN56
    exact_mod_cast this
  have hdiff := NoAxiomChebyshev.theta_diff_ge N hN60
  have hcard := NoAxiomChebyshev.theta_diff_le_card k (by omega)
  rw [← hNdef] at hcard
  have hy : (2 : ℝ) ^ 56 ≤ 2 * (N : ℝ) := by linarith
  have hZY := NoAxiomChebyshev.sqrt_mul_log_le (2 * (N : ℝ)) hy
  have hY1 : 0 ≤ Real.log (2 * (N : ℝ)) := Real.log_nonneg (by linarith)
  have hZ1 : 1 ≤ Real.sqrt (2 * (N : ℝ)) := by
    rw [Real.le_sqrt (by norm_num) (by positivity)]; linarith
  have hYZ : Real.log (2 * (N : ℝ)) ≤ Real.sqrt (2 * (N : ℝ)) * Real.log (2 * (N : ℝ)) := by
    nlinarith
  -- `0.6 N ≤ card · log(2N)`
  have hmain : (0.6 : ℝ) * N ≤ ((dyadicBlock k).card : ℝ) * Real.log (2 * (N : ℝ)) := by
    linarith
  have hl2 : 0 < Real.log 2 := Real.log_pos (by norm_num)
  have hlog2N : Real.log (2 * (N : ℝ)) = ((k : ℝ) + 1) * Real.log 2 := by
    rw [hNcast, ← pow_succ', Real.log_pow]; push_cast; ring
  have hlogN : Real.log ((2 : ℝ) ^ k) = (k : ℝ) * Real.log 2 := by rw [Real.log_pow]
  rw [hlog2N] at hmain
  rw [← hNcast, hNcast, hlogN, ← hNcast]
  have hkR : (56 : ℝ) ≤ k := by exact_mod_cast hk
  have hcnn : (0 : ℝ) ≤ ((dyadicBlock k).card : ℝ) := Nat.cast_nonneg _
  rw [div_le_iff₀ (by positivity)]
  have hprod : 0 ≤ (2 * (k : ℝ) - 5 / 3 * ((k : ℝ) + 1)) *
      (((dyadicBlock k).card : ℝ) * Real.log 2) := by
    apply mul_nonneg (by linarith) (mul_nonneg hcnn hl2.le)
  nlinarith

end GlobalControl

end
