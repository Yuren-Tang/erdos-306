import RequestProject.LocalEnergy.FingerprintEnergy

/-!
# Fingerprint decoding

Agreement on the fingerprint, hot coordinates, and their residues determines the entire assignment.
-/

open Finset

namespace LocalEnergy

open scoped Classical

/-! ## Decoding from the fingerprint and high-energy coordinates

The map `a ↦ (a|_F, Hot(a), residues on Hot)` is injective on the level set:
cold vertices (those `q ∉ F` with `t_q(a_q) < T`) are decoded uniquely via
`cold_residue_unique`, since `t_q(·)` is a function of `a|_F` alone. -/

/-- `fingerprintEnergy F a q w` depends only on the values of `a` on `F`. -/
lemma fingerprintEnergy_congr (F : Finset ℕ) (a b : (p : ℕ) → ZMod p) (q : ℕ)
    (w : ZMod q) (h : ∀ p ∈ F, a p = b p) :
    fingerprintEnergy F a q w = fingerprintEnergy F b q w := by
  unfold fingerprintEnergy fingerprintEnergyTerm
  refine Finset.sum_congr rfl (fun p hp => ?_)
  rw [h p hp]

/-- Suppose two assignments `a, b` agree on
    the fingerprint `F`, have the *same* hot set `Hot = {q ∈ P\F : T ≤ t_q(a_q)}`,
    and agree on that hot set.  Then they agree on all of `P \ F`: every cold
    vertex `q` (with `t_q(a_q) < T`) has `a q` recovered as the unique residue
    with `t_q(·) < T`, a function of `a|_F` alone. -/
lemma assignment_eq_on_compl_of_fingerprint_hot_data
    (P F : Finset ℕ) (T : ℝ)
    (a b : (p : ℕ) → ZMod p)
    (hab : ∀ p ∈ F, a p = b p)
    (hHot : (P \ F).filter (fun q => T ≤ fingerprintEnergy F a q (a q)) =
      (P \ F).filter (fun q => T ≤ fingerprintEnergy F b q (b q)))
    (hres : ∀ q ∈ (P \ F).filter
      (fun q => T ≤ fingerprintEnergy F a q (a q)), a q = b q)
    (hunique : ∀ q ∈ P \ F, ∀ w w' : ZMod q,
      fingerprintEnergy F a q w < T → fingerprintEnergy F a q w' < T →
        w = w') :
    ∀ q ∈ P \ F, a q = b q := by
  intro q hq
  have hcongr : ∀ w : ZMod q,
      fingerprintEnergy F a q w = fingerprintEnergy F b q w :=
    fun w => fingerprintEnergy_congr F a b q w hab
  by_cases hhot : T ≤ fingerprintEnergy F a q (a q)
  · exact hres q (Finset.mem_filter.mpr ⟨hq, hhot⟩)
  · push Not at hhot
    have hnotHotB : q ∉ (P \ F).filter
        (fun q => T ≤ fingerprintEnergy F b q (b q)) := by
      rw [← hHot]
      exact fun hmem => hhot.not_ge (Finset.mem_filter.mp hmem).2
    have hcoldB : fingerprintEnergy F b q (b q) < T := by
      by_contra hc
      push Not at hc
      exact hnotHotB (Finset.mem_filter.mpr ⟨hq, hc⟩)
    apply hunique q hq (a q) (b q) hhot
    rw [hcongr (b q)]
    exact hcoldB

/-- The reciprocal-dispersion threshold supplies the uniqueness hypothesis
needed by `assignment_eq_on_compl_of_fingerprint_hot_data`. -/
lemma cold_assignment_decoding_injective (X : ℕ) (hX : 1 ≤ X) (P F : Finset ℕ)
    (hF : ∀ p ∈ F, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X) (hFcard : 208 ≤ F.card)
    (hPF : ∀ q ∈ P \ F, Nat.Prime q ∧ X ≤ q ∧ q ≤ 2 * X)
    (T : ℝ) (hT : T = reciprocalPhaseEnergyScale X F / 7)
    (a b : (p : ℕ) → ZMod p)
    (hab : ∀ p ∈ F, a p = b p)
    (hHot : (P \ F).filter (fun q => T ≤ fingerprintEnergy F a q (a q))
              = (P \ F).filter (fun q => T ≤ fingerprintEnergy F b q (b q)))
    (hres : ∀ q ∈ (P \ F).filter (fun q => T ≤ fingerprintEnergy F a q (a q)), a q = b q) :
    ∀ q ∈ P \ F, a q = b q := by
  apply assignment_eq_on_compl_of_fingerprint_hot_data P F T a b hab hHot hres
  intro q hq w w' hw hw'
  obtain ⟨hqprime, _hqX, hq2X⟩ := hPF q hq
  have hqF : q ∉ F := (Finset.mem_sdiff.mp hq).2
  apply cold_residue_unique X hX F hF hFcard a q hqprime hqF hq2X w w'
  · simpa [hT] using hw
  · simpa [hT] using hw'

end LocalEnergy
