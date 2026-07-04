import RequestProject.GlobalControl.Encoding.DominantLabels

/-!
# Global diagonalization from compatible block labels

If every block is completely represented by its cold label and there are no
hot blocks or label-change boundaries, one integer label represents the whole
global assignment.
-/

open Finset Classical

noncomputable section

namespace GlobalControl

/-- Complete conformity on every block, together with absence of hot blocks
and label-change boundaries, forces a single global label. -/
lemma globally_diagonal_of_blockwise_cold_labels
    (BS : BlockSystem) (c2 : ℝ) (a : GlobalAssignment BS)
    (hhot : hotSet BS c2 a = ∅)
    (hboundary : boundarySet BS c2 a = ∅)
    (hconform : ∀ k, BS.k0 ≤ k → k ≤ BS.K → ∀ p ∈ BS.P k,
      (toPlain BS a p : ZMod p) = ((coldLabel BS a k : ℤ) : ZMod p)) :
    ∀ p : {p : ℕ // p ∈ blockSupport BS},
      (a p : ZMod p.1) = (coldLabel BS a BS.k0 : ZMod p.1) := by
  intro p
  obtain ⟨k, hk, hpk⟩ := Finset.mem_biUnion.mp p.2
  have hk0 : BS.k0 ≤ k := (Finset.mem_Icc.mp hk).1
  have hkK : k ≤ BS.K := (Finset.mem_Icc.mp hk).2
  have hcold : k ∉ hotSet BS c2 a := by simp [hhot]
  have hlabel : coldLabel BS a k = coldLabel BS a BS.k0 := by
    rw [coldLabel_eq_segStart BS c2 a k hk0 hkK hcold]
    simp [hhot, hboundary, RequestProject.segmentStart_empty]
  have hp := hconform k hk0 hkK p.1 hpk
  simpa [toPlain, p.2, hlabel] using hp

end GlobalControl

end
