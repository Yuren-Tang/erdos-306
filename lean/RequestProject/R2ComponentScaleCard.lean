import RequestProject.R2ConcreteData
import RequestProject.GlobalControl.ControlEnergy

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# R2 component scale / cardinality supplies
-/

lemma blockSupport_ge_pow_k0 (BS : BlockSystem) {p : ℕ}
    (hp : p ∈ blockSupport BS) :
    2 ^ BS.k0 ≤ p := by
  rw [blockSupport, Finset.mem_biUnion] at hp
  obtain ⟨k, hk, hpk⟩ := hp
  rw [Finset.mem_Icc] at hk
  calc 2 ^ BS.k0 ≤ 2 ^ k := Nat.pow_le_pow_right (by norm_num) hk.1
    _ ≤ p := (BS.hwindow k p hpk).1

lemma ctrlEdges_ge_k0_square
    (BS : BlockSystem) {e : ℕ} (he : e ∈ ctrlEdges BS) :
    2 ^ BS.k0 * 2 ^ BS.k0 ≤ e := by
  rw [ctrlEdges, Finset.mem_image] at he
  obtain ⟨pq, hpq, rfl⟩ := he
  obtain ⟨h1, h2⟩ := ctrlPairs_mem_blockSupport BS hpq
  exact Nat.mul_le_mul (blockSupport_ge_pow_k0 BS h1) (blockSupport_ge_pow_k0 BS h2)

lemma gadgetEdges_card_le_product (R S : Finset ℕ) :
    (gadgetEdges R S).card ≤ R.card * S.card := by
  rw [gadgetEdges]
  refine le_trans Finset.card_image_le ?_
  rw [Finset.card_product]

end CircleMethod

