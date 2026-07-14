import RequestProject.GlobalControl.ControlEnergy
import Mathlib.Analysis.Normed.Group.AddCircle

open Finset BigOperators Classical Real GlobalControl

noncomputable section

namespace CircleMethod

/-! # Frequency representation of the control energy

The nearest-integer distance `‖h/(pq)‖` equals
`|crtRepr(h mod p, h mod q)|/(pq)`. Summing this identity over the control
pairs identifies their circle energy with `Qctrl`.
-/

/-- If an integer `t` is within `1/2` of `x`, then `‖x‖ = |x - t|`. -/
lemma unitCircleNorm_eq_of_int (x : ℝ) (t : ℤ) (hx : |x - (t : ℝ)| ≤ 1 / 2) :
    (norm ∘ ((↑) : ℝ → UnitAddCircle)) x = |x - (t : ℝ)| := by
  rw [Function.comp_apply, UnitAddCircle.norm_eq]
  rcases eq_or_ne (round x) t with heq | hne
  · rw [heq]
  · -- round x ≠ t : both are within 1/2 of x, so x is equidistant and both = 1/2
    have ha : |x - (round x : ℝ)| ≤ 1 / 2 := abs_sub_round x
    have hge : (1 : ℝ) ≤ |((round x : ℝ)) - (t : ℝ)| := by
      have hz : ((round x - t : ℤ)) ≠ 0 := sub_ne_zero.mpr hne
      have h1 : (1 : ℤ) ≤ |round x - t| := Int.one_le_abs hz
      calc (1 : ℝ) ≤ |((round x - t : ℤ) : ℝ)| := by exact_mod_cast h1
        _ = |((round x : ℝ)) - (t : ℝ)| := by push_cast; ring_nf
    have htri : |((round x : ℝ)) - (t : ℝ)| ≤ |x - (round x : ℝ)| + |x - (t : ℝ)| := by
      have hh := abs_sub_le (round x : ℝ) x (t : ℝ)
      rw [abs_sub_comm (round x : ℝ) x] at hh
      linarith [hh]
    -- 1 ≤ a + b ≤ 1, a,b ≤ 1/2 ⟹ a = b = 1/2
    linarith [ha, hx, hge, htri]

/-- **CRT representation of circle distance.**  For distinct primes `p, q`,
`‖h/(pq)‖ = |crtRepr p q (h mod p) (h mod q)| / (pq)`. -/
lemma unitCircleNorm_eq_crtRepr_div (p q : ℕ) (hp : Nat.Prime p) (hq : Nat.Prime q)
    (hpq : p ≠ q) (h : ℕ) :
    (norm ∘ ((↑) : ℝ → UnitAddCircle)) ((h : ℝ) / ((p : ℝ) * (q : ℝ)))
      = |(crtRepr p q (h : ZMod p) (h : ZMod q) : ℝ)| / ((p : ℝ) * (q : ℝ)) := by
  have hcop : Nat.Coprime p q := (Nat.coprime_primes hp hq).mpr hpq
  have hp0 : 0 < p := hp.pos
  have hq0 : 0 < q := hq.pos
  have hpR : (0 : ℝ) < (p : ℝ) := by exact_mod_cast hp0
  have hqR : (0 : ℝ) < (q : ℝ) := by exact_mod_cast hq0
  set m : ℤ := crtRepr p q (h : ZMod p) (h : ZMod q) with hm
  -- p ∣ (h - m) and q ∣ (h - m)
  have hdvdp : (p : ℤ) ∣ ((h : ℤ) - m) := by
    rw [← ZMod.intCast_zmod_eq_zero_iff_dvd]
    have hcl : (m : ZMod p) = (h : ZMod p) := crtRepr_congr_left p q _ _ hcop
    push_cast [hcl]
    rw [sub_eq_zero]
  have hdvdq : (q : ℤ) ∣ ((h : ℤ) - m) := by
    rw [← ZMod.intCast_zmod_eq_zero_iff_dvd]
    have hcr : (m : ZMod q) = (h : ZMod q) := crtRepr_congr_right p q _ _ hcop
    push_cast [hcr]
    rw [sub_eq_zero]
  have hcopZ : IsCoprime (p : ℤ) (q : ℤ) := by
    rw [Int.isCoprime_iff_gcd_eq_one]; exact_mod_cast hcop
  have hdvd : ((p : ℤ) * q) ∣ ((h : ℤ) - m) := hcopZ.mul_dvd hdvdp hdvdq
  obtain ⟨t, ht⟩ := hdvd
  -- x - t = m / (pq), and |m| ≤ pq/2, so |x - t| ≤ 1/2
  have hpqR : (0 : ℝ) < (p : ℝ) * (q : ℝ) := by positivity
  have hxt : (h : ℝ) / ((p : ℝ) * q) - (t : ℝ) = (m : ℝ) / ((p : ℝ) * q) := by
    have : (h : ℝ) - (m : ℝ) = ((p : ℝ) * q) * (t : ℝ) := by exact_mod_cast ht
    field_simp
    linarith [this]
  have hmle : |(m : ℝ)| ≤ ((p : ℝ) * q) / 2 := by
    have hint : |m| ≤ ((p * q : ℕ) : ℤ) / 2 := crtRepr_abs_le p q _ _ hcop hp0 hq0
    have h2 : 2 * |m| ≤ ((p * q : ℕ) : ℤ) := by
      set a := |m| with ha
      omega
    have h2R : 2 * |(m : ℝ)| ≤ (p : ℝ) * q := by
      rw [← Int.cast_abs]
      calc 2 * ((|m| : ℤ) : ℝ) = ((2 * |m| : ℤ) : ℝ) := by push_cast; ring
        _ ≤ (((p * q : ℕ) : ℤ) : ℝ) := by exact_mod_cast h2
        _ = (p : ℝ) * q := by push_cast; ring
    linarith [h2R]
  have habs : |(h : ℝ) / ((p : ℝ) * q) - (t : ℝ)| ≤ 1 / 2 := by
    rw [hxt, abs_div, abs_of_pos hpqR]
    rw [div_le_iff₀ hpqR]
    linarith [hmle]
  rw [unitCircleNorm_eq_of_int _ t habs, hxt, abs_div, abs_of_pos hpqR]

/-- Endpoints of a control pair are distinct primes. -/
lemma controlPairs_distinct_primes (BS : BlockSystem) {pq : ℕ × ℕ}
    (hpq : pq ∈ ctrlPairs BS) :
    Nat.Prime pq.1 ∧ Nat.Prime pq.2 ∧ pq.1 ≠ pq.2 := by
  have hmem := ctrlPairs_mem_blockSupport BS hpq
  refine ⟨blockSupport_prime BS hmem.1, blockSupport_prime BS hmem.2, ?_⟩
  simp only [ctrlPairs, Finset.mem_union, Finset.mem_biUnion, internalPairs,
    bipartitePairs, Finset.mem_filter, Finset.mem_product, Finset.mem_Icc,
    Finset.mem_Ico] at hpq
  rcases hpq with ⟨k, _, ⟨_, _⟩, hlt⟩ | ⟨k, _, hp1, hp2⟩
  · exact Nat.ne_of_lt hlt
  · -- bipartite: pq.1 < 2^(k+1) ≤ pq.2
    have h1 := (BS.hwindow k pq.1 hp1).2
    have h2 := (BS.hwindow (k + 1) pq.2 hp2).1
    exact Nat.ne_of_lt (lt_of_lt_of_le h1 h2)

/-- **Control energy of the frequency-induced assignment** equals the nearest-integer
energy sum. With `a(h)_p = h mod p`,
`Qctrl BS a(h) = ∑_{pq ∈ ctrlPairs BS} ‖h/(pq)‖²`. -/
lemma controlEnergy_frequency_eq (BS : BlockSystem) (h : ℕ) :
    Qctrl BS (fun p => ((h : ZMod p.1))) =
      ∑ pq ∈ ctrlPairs BS, ((norm ∘ ((↑) : ℝ → UnitAddCircle)) ((h : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)))) ^ 2 := by
  unfold Qctrl
  refine Finset.sum_congr rfl (fun pq hpq => ?_)
  obtain ⟨hp1, hp2, hne⟩ := controlPairs_distinct_primes BS hpq
  have hmem := ctrlPairs_mem_blockSupport BS hpq
  -- toPlain of the frequency assignment is h mod p on the support
  have htp1 : toPlain BS (fun p => ((h : ZMod p.1))) pq.1 = (h : ZMod pq.1) := by
    simp only [toPlain, dif_pos hmem.1]
  have htp2 : toPlain BS (fun p => ((h : ZMod p.1))) pq.2 = (h : ZMod pq.2) := by
    simp only [toPlain, dif_pos hmem.2]
  have hHglob : Hglob (toPlain BS (fun p => ((h : ZMod p.1)))) pq.1 pq.2
      = crtRepr pq.1 pq.2 (h : ZMod pq.1) (h : ZMod pq.2) := by
    unfold Hglob; rw [htp1, htp2]
  rw [hHglob]
  -- ‖h/(pq)‖ = |crtRepr|/(pq), so the squared norms agree.
  have hbridge := unitCircleNorm_eq_crtRepr_div pq.1 pq.2 hp1 hp2 hne h
  rw [hbridge, div_pow, div_pow, sq_abs]

end CircleMethod

end
