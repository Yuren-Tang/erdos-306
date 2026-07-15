import RequestProject.Core.CoprimeResidueFibers
import RequestProject.GlobalControl.BlockSystem

/-!
# Frequency fibers over a block support

The primes supporting a block system are pairwise coprime.  The general
coprime-residue fiber bound therefore controls the multiplicity of the
frequency-to-block-assignment map.
-/

open Finset BigOperators Classical

noncomputable section

namespace CircleMethod

open GlobalControl

/-- The primes in a block support are pairwise coprime. -/
lemma blockSupport_pairwise_coprime (BS : BlockSystem) :
    (blockSupport BS).toList.Pairwise (fun p q : ℕ => Nat.Coprime p q) := by
  refine List.Nodup.pairwise_of_forall_ne ?_ ?_
  · exact Finset.nodup_toList (blockSupport BS)
  · intro p hp q hq hpq
    have hp_support : p ∈ blockSupport BS := by simpa using hp
    have hq_support : q ∈ blockSupport BS := by simpa using hq
    exact (Nat.coprime_primes (blockSupport_prime BS hp_support)
      (blockSupport_prime BS hq_support)).mpr hpq

/-- Equality of block-support residue assignments implies congruence modulo
the product of all block-support primes. -/
lemma blockSupport_residue_eq_modEq_prod (BS : BlockSystem) {h h' : ℕ}
    (heq :
      (fun p : {p : ℕ // p ∈ blockSupport BS} => (h : ZMod p.1)) =
        (fun p : {p : ℕ // p ∈ blockSupport BS} => (h' : ZMod p.1))) :
    h ≡ h' [MOD ∏ p ∈ blockSupport BS, p] := by
  exact RequestProject.residueVector_eq_modEq_prod
    (blockSupport_pairwise_coprime BS) heq

/-- Every fiber of the frequency-to-block-assignment map on `range L` has at
most `b` elements when `L = b * ∏ blockSupport`. -/
theorem blockSupport_frequency_fiber_card_le
    (BS : BlockSystem) (L b : ℕ)
    (hL : L = b * ∏ p ∈ blockSupport BS, p) :
    ∀ a : GlobalAssignment BS,
      ((Finset.range L).filter
        (fun h => (fun p : {p : ℕ // p ∈ blockSupport BS} =>
          (h : ZMod p.1)) = a)).card ≤ b := by
  exact RequestProject.residueVector_fiber_card_le
    (blockSupport_pairwise_coprime BS) L b hL

end CircleMethod

end
