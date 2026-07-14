import RequestProject.Construction.Certificates.Foundation
import RequestProject.Construction.BlockSystemSelection

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Gadget-edge construction certificate
-/

/-! ## Concrete semiprime data layer (gadget prime reservoir) -/

/-- **Concrete certificate.**  The gadget-prime reservoir `S` chosen in the high
dyadic block `2·k0`, together with the prime-side structural facts: `S` consists
of primes that are large (`≥ 2^{2k0}`), sit in the block support, number exactly
`G`, and dominate the divisor primes `R = b.primeFactors`. -/
structure GadgetEdgeCertificate {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) where
  /-- the gadget primes. -/
  S : Finset ℕ
  hScard : S.card = F.parameters.G
  hSprime : ∀ s ∈ S, Nat.Prime s
  hSge : ∀ s ∈ S, 2 ^ (2 * F.bsCert.BS.k0) ≤ s
  hSblock : S ⊆ blockSupport F.bsCert.BS
  hb2k0 : b < 2 ^ F.bsCert.BS.k0
  hRpos' : ∀ r ∈ b.primeFactors, 2 ≤ r
  hlt' : ∀ r ∈ b.primeFactors, ∀ s ∈ S, r < s

/-- Produce the concrete (gadget-prime) certificate from the foundation. -/
lemma exists_gadget_edge_certificate {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) :
    Nonempty (GadgetEdgeCertificate F) := by
  classical
  have hbpos := F.parameters.hbpos
  have hk05 := F.bsCert.hk05
  have hk0dens := F.bsCert.hk0dens
  have hmass := F.parameters.hk0massFact F.bsCert.BS.k0 F.bsCert.hk0mass
  obtain ⟨S, hSsub, hScard, hSprime, hSge⟩ :=
    exists_primes_in_dyadicBlock (2 * F.bsCert.BS.k0) (by omega) F.parameters.G
      (F.parameters.hk0density (2 * F.bsCert.BS.k0) (by omega))
  have hSblock : S ⊆ blockSupport F.bsCert.BS := fun s hs => F.bsCert.hdyadic2k (hSsub hs)
  have hb2k0 : b < 2 ^ F.bsCert.BS.k0 := by omega
  have hRpos' : ∀ r ∈ b.primeFactors, 2 ≤ r := fun r hr => (F.bsCert.hRp r hr).two_le
  have hlt' : ∀ r ∈ b.primeFactors, ∀ s ∈ S, r < s := by
    intro r hr s hs
    have hrle : r ≤ b := Nat.le_of_dvd hbpos (F.bsCert.hRdvd r hr)
    have hsge : 2 ^ (2 * F.bsCert.BS.k0) ≤ s := hSge s hs
    have : 2 ^ F.bsCert.BS.k0 ≤ 2 ^ (2 * F.bsCert.BS.k0) := Nat.pow_le_pow_right (by norm_num) (by omega)
    omega
  exact ⟨⟨S, hScard, hSprime, hSge, hSblock, hb2k0, hRpos', hlt'⟩⟩


end CircleMethod

end
