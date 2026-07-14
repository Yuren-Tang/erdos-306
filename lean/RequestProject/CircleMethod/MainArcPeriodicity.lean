import RequestProject.Spectral.BernoulliCyclicFourier

open Finset BigOperators

noncomputable section

namespace CircleMethod

/-!
# Main-arc periodicity and frequency labels

The Bernoulli Fourier factors are periodic under integral shifts. Consequently,
a frequency congruent to an integer label modulo the common period has exactly
the corresponding diagonal Fourier term. The final theorem identifies the
bounded label interval with its frequency representatives modulo that period.
-/

/-- The Bernoulli factor is `1`-periodic. -/
lemma bernoulliCharFun_int_add (θ t : ℝ) (n : ℤ) :
    bernoulliCharFun θ (t + (n : ℝ)) = bernoulliCharFun θ t := by
  unfold bernoulliCharFun
  congr 2
  rw [Complex.ofReal_add, Complex.ofReal_intCast,
    show (2 * (Real.pi : ℂ) * ((t : ℂ) + (n : ℂ)) * Complex.I)
        = 2 * (Real.pi : ℂ) * (t : ℂ) * Complex.I +
          (n : ℂ) * (2 * (Real.pi : ℂ) * Complex.I) from by ring,
    Complex.exp_add, Complex.exp_int_mul_two_pi_mul_I, mul_one]

/-- Divisibility of the frequency difference gives equality of the associated
Bernoulli factors. -/
lemma bernoulliCharFun_cong (θ : ℝ) (h : ℕ) (m : ℤ) (e : ℕ) (he : 0 < e)
    (hdvd : (e : ℤ) ∣ ((h : ℤ) - m)) :
    bernoulliCharFun θ ((h : ℝ) / (e : ℝ)) =
      bernoulliCharFun θ ((m : ℝ) / (e : ℝ)) := by
  obtain ⟨k, hk⟩ := hdvd
  have heR : (e : ℝ) ≠ 0 := by exact_mod_cast he.ne'
  have hsplit : (h : ℝ) / (e : ℝ) = (m : ℝ) / (e : ℝ) + (k : ℝ) := by
    have : (h : ℝ) - (m : ℝ) = (e : ℝ) * (k : ℝ) := by exact_mod_cast hk
    field_simp
    linarith [this]
  rw [hsplit, bernoulliCharFun_int_add]

/-- Congruence modulo every edge and the common period identifies a Fourier
frequency term with its integer-label term. -/
lemma fourierTerm_eq_term_label_of_cong
    (E : Finset ℕ) (θ : ℕ → ℝ) (q L : ℕ) (h : ℕ) (m : ℤ)
    (hL : 0 < L) (he0 : ∀ e ∈ E, 0 < e) (heL : ∀ e ∈ E, e ∣ L)
    (hcong : ∀ e ∈ E, (e : ℤ) ∣ ((h : ℤ) - m))
    (hmodL : (L : ℤ) ∣ ((h : ℤ) - m)) :
    fourierTerm E θ q L h = term_label E θ q L m := by
  unfold fourierTerm term_label
  congr 1
  · refine Finset.prod_congr rfl (fun e he => ?_)
    rw [periodizedBernoulliFactor_eq_charFun (θ e) h e L (he0 e he) (heL e he) hL]
    exact bernoulliCharFun_cong (θ e) h m e (he0 e he) (hcong e he)
  · obtain ⟨kk, hkk⟩ := hmodL
    have hLC : (L : ℂ) ≠ 0 := by exact_mod_cast hL.ne'
    have hc : (h : ℂ) - (m : ℂ) = (L : ℂ) * (kk : ℂ) := by exact_mod_cast hkk
    have hm_eq : (m : ℂ) = (h : ℂ) - (L : ℂ) * (kk : ℂ) := by
      linear_combination -hc
    have hphase : -(2 * Real.pi * Complex.I * (h : ℂ) * (q : ℂ) / (L : ℂ))
        = 2 * Real.pi * (-((m : ℝ) * (q : ℝ) / (L : ℝ))) * Complex.I
          + ((-(q : ℤ) * kk : ℤ) : ℂ) * (2 * Real.pi * Complex.I) := by
      push_cast
      rw [hm_eq]
      field_simp
      ring
    rw [hphase, Complex.exp_add, Complex.exp_int_mul_two_pi_mul_I, mul_one]

/-- Since every edge divides the period, one congruence modulo the period
suffices for the Fourier term identity. -/
lemma fourierTerm_eq_term_label_of_modL
    (E : Finset ℕ) (θ : ℕ → ℝ) (q L : ℕ) (h : ℕ) (m : ℤ)
    (hL : 0 < L) (he0 : ∀ e ∈ E, 0 < e) (heL : ∀ e ∈ E, e ∣ L)
    (hmodL : (L : ℤ) ∣ ((h : ℤ) - m)) :
    fourierTerm E θ q L h = term_label E θ q L m :=
  fourierTerm_eq_term_label_of_cong E θ q L h m hL he0 heL
    (fun e he => dvd_trans (Int.natCast_dvd_natCast.mpr (heL e he)) hmodL) hmodL

/-- If `L ≥ 2N+1`, bounded integer labels correspond bijectively to their
frequency representatives modulo `L`. -/
lemma exists_mainArc_bijection (L : ℕ) (N : ℤ) (hN : 0 ≤ N) (hNL : 2 * N + 1 ≤ (L : ℤ)) :
    ∃ (SM : Finset ℕ) (lbl : ℕ → ℤ),
      SM ⊆ Finset.range L ∧
      (∀ h ∈ SM, lbl h ∈ Finset.Icc (-N) N) ∧
      (∀ h₁ ∈ SM, ∀ h₂ ∈ SM, lbl h₁ = lbl h₂ → h₁ = h₂) ∧
      (∀ m ∈ Finset.Icc (-N) N, ∃ h ∈ SM, lbl h = m) ∧
      (∀ h ∈ SM, (L : ℤ) ∣ ((h : ℤ) - lbl h)) := by
  classical
  have hLZ : (0 : ℤ) < (L : ℤ) := by linarith
  have key : ∀ m : ℤ, -N ≤ m → m ≤ N →
      (m % (L : ℤ)).toNat < L ∧
      (if 2 * ((m % (L : ℤ)).toNat : ℤ) < (L : ℤ) then
          ((m % (L : ℤ)).toNat : ℤ)
        else ((m % (L : ℤ)).toNat : ℤ) - (L : ℤ)) = m ∧
      (L : ℤ) ∣ (((m % (L : ℤ)).toNat : ℤ) - m) := by
    intro m hm1 hm2
    have he1 : 0 ≤ m % (L : ℤ) := Int.emod_nonneg m hLZ.ne'
    have he2 : m % (L : ℤ) < (L : ℤ) := Int.emod_lt_of_pos m hLZ
    have hfZ : ((m % (L : ℤ)).toNat : ℤ) = m % (L : ℤ) := Int.toNat_of_nonneg he1
    refine ⟨?_, ?_, ?_⟩
    · have : ((m % (L : ℤ)).toNat : ℤ) < (L : ℤ) := by rw [hfZ]; exact he2
      exact_mod_cast this
    · rw [hfZ]
      by_cases hm0 : 0 ≤ m
      · have hmm : m % (L : ℤ) = m := Int.emod_eq_of_lt hm0 (by linarith)
        rw [hmm, if_pos (by linarith)]
      · have hm0' : m < 0 := not_le.mp hm0
        have hmm : m % (L : ℤ) = m + (L : ℤ) := by
          rw [← Int.add_emod_right m (L : ℤ), Int.emod_eq_of_lt (by linarith) (by linarith)]
        rw [hmm, if_neg (by linarith)]
        ring
    · rw [hfZ]
      exact ⟨-(m / (L : ℤ)), by linear_combination Int.mul_ediv_add_emod m (L : ℤ)⟩
  refine ⟨(Finset.Icc (-N) N).image (fun m => (m % (L : ℤ)).toNat),
    fun h => if 2 * (h : ℤ) < (L : ℤ) then (h : ℤ) else (h : ℤ) - (L : ℤ),
    ?_, ?_, ?_, ?_, ?_⟩
  · intro h hh
    rw [Finset.mem_image] at hh
    obtain ⟨m, hm, rfl⟩ := hh
    rw [Finset.mem_Icc] at hm
    exact Finset.mem_range.mpr (key m hm.1 hm.2).1
  · intro h hh
    rw [Finset.mem_image] at hh
    obtain ⟨m, hm, rfl⟩ := hh
    rw [Finset.mem_Icc] at hm ⊢
    simp only []
    rw [(key m hm.1 hm.2).2.1]
    exact hm
  · intro h1 hh1 h2 hh2 heq
    rw [Finset.mem_image] at hh1 hh2
    obtain ⟨m1, hm1, rfl⟩ := hh1
    obtain ⟨m2, hm2, rfl⟩ := hh2
    rw [Finset.mem_Icc] at hm1 hm2
    have e1 := (key m1 hm1.1 hm1.2).2.1
    have e2 := (key m2 hm2.1 hm2.2).2.1
    have hm12 : m1 = m2 := e1.symm.trans (heq.trans e2)
    rw [hm12]
  · intro m hm
    rw [Finset.mem_Icc] at hm
    exact ⟨(m % (L : ℤ)).toNat,
      Finset.mem_image_of_mem _ (Finset.mem_Icc.mpr hm), (key m hm.1 hm.2).2.1⟩
  · intro h hh
    rw [Finset.mem_image] at hh
    obtain ⟨m, hm, rfl⟩ := hh
    rw [Finset.mem_Icc] at hm
    simp only []
    rw [(key m hm.1 hm.2).2.1]
    exact (key m hm.1 hm.2).2.2

/-- The finite main-arc data: a partition of the cyclic frequencies together
with a bijective integer labeling of the main frequencies and the resulting
Fourier-term identity. -/
structure MainArcFields (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ) (N : ℤ) where
  SM : Finset ℕ
  Sm : Finset ℕ
  lbl : ℕ → ℤ
  hpart : Finset.range L = SM ∪ Sm
  hdisj : Disjoint SM Sm
  hmaps : ∀ h ∈ SM, lbl h ∈ Finset.Icc (-N) N
  hinj : ∀ h₁ ∈ SM, ∀ h₂ ∈ SM, lbl h₁ = lbl h₂ → h₁ = h₂
  hsurj : ∀ m ∈ Finset.Icc (-N) N, ∃ h ∈ SM, lbl h = m
  hmod : ∀ h ∈ SM, (L : ℤ) ∣ ((h : ℤ) - lbl h)
  hterm : ∀ h ∈ SM, fourierTerm E theta q L h = term_label E theta q L (lbl h)

/-- Package the canonical bounded-label bijection; the minor arc is the
complement of the main frequencies inside `Finset.range L`. -/
lemma exists_mainArcFields
    (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ) (N : ℤ)
    (hL : 0 < L)
    (he0 : ∀ e ∈ E, 0 < e) (heL : ∀ e ∈ E, e ∣ L)
    (hN : 0 ≤ N) (hNL : 2 * N + 1 ≤ (L : ℤ)) :
    Nonempty (MainArcFields E theta q L N) := by
  classical
  obtain ⟨SM, lbl, hsub, hmaps, hinj, hsurj, hmod⟩ :=
    exists_mainArc_bijection L N hN hNL
  refine ⟨{
    SM := SM
    Sm := Finset.range L \ SM
    lbl := lbl
    hpart := ?_
    hdisj := ?_
    hmaps := hmaps
    hinj := hinj
    hsurj := hsurj
    hmod := hmod
    hterm := ?_
  }⟩
  · exact (Finset.union_sdiff_of_subset hsub).symm
  · exact Finset.sdiff_disjoint.symm
  · intro h hh
    exact fourierTerm_eq_term_label_of_modL E theta q L h (lbl h)
      hL he0 heL (hmod h hh)

end CircleMethod

end
