import RequestProject.GlobalControl.LocalizationData

/-!
# Diagonal control energy

Small centered CRT representatives identify a global diagonal label and give its exact quadratic control energy.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## CRT centered-rep equals the label when the label is small -/

/-
If `ap ≡ m (mod p)`,
`aq ≡ m (mod q)`, and `2·|m| < p·q`, then the centered CRT representative
`crtRepr p q ap aq` equals `m`.
-/
private lemma crtRepr_eq_label_of_small (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (m : ℤ) (ap : ZMod p) (aq : ZMod q)
    (hap : ap = (m : ZMod p)) (haq : aq = (m : ZMod q))
    (hsmall : 2 * |m| < (p : ℤ) * (q : ℤ)) :
    crtRepr p q ap aq = m := by
  grind +suggestions

/-! ## Control-pair size facts -/

/-
Endpoints of a control pair are distinct.
-/
private lemma ctrlPairs_ne (BS : BlockSystem) {pq : ℕ × ℕ} (h : pq ∈ ctrlPairs BS) :
    pq.1 ≠ pq.2 := by
  contrapose! h; simp_all +decide [ ctrlPairs, internalPairs, bipartitePairs ] ;
  intro x hx₁ hx₂ hx₃ hx₄; have := blocks_disjoint BS ( show x ≠ x + 1 from by linarith ) ; simp_all +decide [ Finset.disjoint_left ] ;

/-
For `2 ≤ k0`, every control pair has product strictly larger than
`2^(2·k0)`.
-/
lemma ctrlPairs_prod_lower (BS : BlockSystem) (hk0 : 2 ≤ BS.k0) {pq : ℕ × ℕ}
    (h : pq ∈ ctrlPairs BS) :
    (2 : ℝ) ^ (2 * BS.k0) < (pq.1 : ℝ) * (pq.2 : ℝ) := by
  -- Both endpoints are prime and ≥ 2^k0, hence strictly > 2^k0.
  have h1 : 2 ^ BS.k0 < pq.1 := by
    obtain ⟨k, hk⟩ : ∃ k, pq.1 ∈ BS.P k ∧ BS.k0 ≤ k ∧ k ≤ BS.K := by
      obtain ⟨k, hk⟩ : ∃ k, pq.1 ∈ BS.P k ∧ k ∈ Finset.Icc BS.k0 BS.K := by
        have h_mem : pq.1 ∈ blockSupport BS := by
          exact ctrlPairs_mem_blockSupport BS h |>.1
        unfold blockSupport at h_mem; aesop;
      aesop;
    have := BS.hwindow k pq.1 hk.1;
    by_cases h_eq : pq.1 = 2 ^ BS.k0;
    · have := BS.hprime k pq.1 hk.1; simp_all +decide [ Nat.prime_iff ] ;
    · exact lt_of_le_of_ne ( Nat.le_trans ( pow_le_pow_right₀ ( by decide ) hk.2.1 ) this.1 ) ( Ne.symm h_eq )
  have h2 : 2 ^ BS.k0 < pq.2 := by
    cases' Finset.mem_union.mp ( show pq ∈ ( Finset.biUnion ( Finset.Icc BS.k0 BS.K ) ( internalPairs BS ) ) ∪ ( Finset.biUnion ( Finset.Ico BS.k0 BS.K ) ( bipartitePairs BS ) ) from h );
    · simp_all +decide [ Finset.mem_biUnion, internalPairs ];
      grind;
    · simp_all +decide [ bipartitePairs ];
      obtain ⟨ k, hk, hk₁, hk₂ ⟩ := ‹_›; have := BS.hwindow ( k + 1 ) pq.2 hk₂; simp_all +decide [ pow_succ' ] ;
      linarith [ pow_le_pow_right₀ ( by decide : 1 ≤ 2 ) hk.1 ];
  norm_cast; rw [ pow_mul' ] ; nlinarith [ pow_pos ( zero_lt_two' ℕ ) BS.k0 ] ;

/-! ## the diagonal energy identity -/

/-
If `a` is globally diagonal with label `m` and
`2·|m| < p·q` for every control pair, then `Qctrl a = m²·σ²`.
-/
lemma diagonal_Qctrl (BS : BlockSystem) (a : GlobalAssignment BS) (m : ℤ)
    (hdiag : ∀ p : {p : ℕ // p ∈ blockSupport BS}, (a p : ZMod p.1) = (m : ZMod p.1))
    (hsmall : ∀ pq ∈ ctrlPairs BS, 2 * |m| < (pq.1 : ℤ) * (pq.2 : ℤ)) :
    Qctrl BS a = (m : ℝ) ^ 2 * (sigmaCtrl BS) ^ 2 := by
  rw [Qctrl, sigmaCtrl, Real.sq_sqrt (Finset.sum_nonneg fun _ _ => by positivity),
    Finset.mul_sum]
  refine Finset.sum_congr rfl fun pq hpq => ?_
  rw [Hglob, crtRepr_eq_label_of_small pq.1 pq.2
    (blockSupport_prime BS (ctrlPairs_mem_blockSupport BS hpq).1)
    (blockSupport_prime BS (ctrlPairs_mem_blockSupport BS hpq).2)
    (ctrlPairs_ne BS hpq) m]
  · ring
  · exact (if_pos (ctrlPairs_mem_blockSupport BS hpq).1).trans
      (hdiag ⟨pq.1, (ctrlPairs_mem_blockSupport BS hpq).1⟩)
  · simpa only [toPlain, dif_pos (ctrlPairs_mem_blockSupport BS hpq).2] using
      hdiag ⟨pq.2, (ctrlPairs_mem_blockSupport BS hpq).2⟩
  · exact hsmall pq hpq

end GlobalControl

end

