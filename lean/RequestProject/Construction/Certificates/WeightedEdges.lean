import RequestProject.Construction.Certificates.GadgetEdges
import RequestProject.Construction.MassBatchCompletion
import RequestProject.Construction.MassBatchSupply

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Weighted semiprime edge certificate
-/

/-! ## Mass batch layer (residual batch `Q`, edge data, load window) -/

/-- **Mass certificate.**  The residual mass batch `Q` (packaged as a
`R2MassBatchSupply`, which records the reciprocal-load window
`3/(2b) ≤ baseLoad + recipLoad Q < 3/b`), the assembled concrete edge data `D`
and weights `W`, and the structural facts of the edge set: every edge is a
semiprime, positive, divides the period `L`, avoids `T`; the set is nonempty;
the total reciprocal load is `< 3/b`; and the inverse-square load is controlled
by `σ_ctrl`. -/
structure WeightedEdgeCertificate {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F) where
  /-- the residual mass batch. -/
  Q : Finset ℕ
  /-- the assembled concrete edge data. -/
  D : R2ConcreteData T b
  /-- the edge weights. -/
  W : R2ConcreteData.Weights D
  /-- the mass-batch supply (encodes the load window). -/
  QB : R2MassBatchSupply D
  hDdef : D = (⟨F.bsCert.BS, ∅, b.primeFactors, Cc.S⟩ : R2ConcreteData T b).withQ Q
  hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p
  hL : 0 < D.L
  hsemi : ∀ e ∈ D.E, IsSemiprime e
  he0 : ∀ e ∈ D.E, 0 < e
  heL : ∀ e ∈ D.E, e ∣ D.L
  hne : D.E.Nonempty
  hctrlAvoid : ∀ e ∈ ctrlEdges D.BS, e ∉ T
  hgadgetAvoid : ∀ e ∈ gadgetEdges D.R D.S, e ∉ T
  havoid : ∀ e ∈ D.E, e ∉ T
  hloadUpper : R2ConcreteData.recipLoad D.E < 3 / (b : ℝ)
  hsumE : ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2 ≤ F.ledger.Sload * (sigmaCtrl D.BS) ^ 2

/-- Produce the mass-batch certificate: choose the residual batch `Q`, assemble
`D` and `W`, and discharge the edge structural facts. -/
lemma exists_weighted_edge_certificate {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F) :
    Nonempty (WeightedEdgeCertificate F Cc) := by
  classical
  have hbpos := F.ledger.hbpos
  have hmass : 2 * b * (b.primeFactors.card * Cc.S.card) < 3 * 2 ^ F.bsCert.BS.k0 ∧
      2 * b < 2 ^ F.bsCert.BS.k0 := by
    simpa [Cc.hScard] using
      F.ledger.hk0massFact F.bsCert.BS.k0 F.bsCert.hk0mass
  obtain ⟨Q, QB⟩ := exists_massBatch_at_large_scale F.ledger.hb3 F.bsCert.BS Cc.S
    F.bsCert.hsub Cc.hSge F.bsCert.hRout
    (F.ledger.hk0ctrl F.bsCert.BS F.bsCert.hk0ctrlle) F.ledger.k1 F.ledger.hk15 F.bsCert.hk1le F.ledger.hload
    hmass F.bsCert.hk0T
  set D : R2ConcreteData T b := (⟨F.bsCert.BS, ∅, b.primeFactors, Cc.S⟩ : R2ConcreteData T b).withQ Q
    with hDdef
  set W : R2ConcreteData.Weights D := QB.weights hbpos with hWdef
  have hScardD : D.S.card = F.ledger.G := Cc.hScard
  have hk0TD : T.sup id + 1 ≤ D.BS.k0 := F.bsCert.hk0T
  have hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p := rfl
  have hL : 0 < D.L := D.period_pos hbpos
  have hsemi : ∀ e ∈ D.E, IsSemiprime e := D.semiprime QB.q_semiprime F.bsCert.hRp Cc.hSprime Cc.hlt'
  have he0 : ∀ e ∈ D.E, 0 < e := D.edges_pos hsemi
  have heL : ∀ e ∈ D.E, e ∣ D.L := D.dvd_period QB.q_dvd_period F.bsCert.hRdvd Cc.hSblock
  have hne : D.E.Nonempty := D.nonempty_of_massBatch_nonempty QB.hQne
  have hTlt : ∀ e ∈ T, e < 2 ^ (2 * D.BS.k0) := by
    intro e he
    have h1 : e ≤ T.sup id := Finset.le_sup (f := id) he
    have h2 : D.BS.k0 < 2 ^ D.BS.k0 := Nat.lt_two_pow_self
    have h3 : 2 ^ D.BS.k0 ≤ 2 ^ (2 * D.BS.k0) := Nat.pow_le_pow_right (by norm_num) (by omega)
    omega
  have hctrlAvoid : ∀ e ∈ ctrlEdges D.BS, e ∉ T := by
    intro e he hT
    have hge : 2 ^ D.BS.k0 * 2 ^ D.BS.k0 ≤ e := ctrlEdges_ge_k0_square D.BS he
    have : 2 ^ D.BS.k0 * 2 ^ D.BS.k0 = 2 ^ (2 * D.BS.k0) := by rw [← pow_add]; ring_nf
    have := hTlt e hT; omega
  have hgadgetAvoid : ∀ e ∈ gadgetEdges D.R D.S, e ∉ T := by
    intro e he hT
    rw [mem_gadgetEdges] at he
    obtain ⟨r, hr, s, hs, rfl⟩ := he
    have hsge : 2 ^ (2 * D.BS.k0) ≤ s := Cc.hSge s hs
    have hr2 : 2 ≤ r := Cc.hRpos' r hr
    have := hTlt (r * s) hT
    have hsr : s ≤ r * s := le_mul_of_one_le_left (Nat.zero_le s) (by omega)
    omega
  have havoid : ∀ e ∈ D.E, e ∉ T :=
    D.avoid hctrlAvoid QB.hQavoid hgadgetAvoid
  have hloadUpper : R2ConcreteData.recipLoad D.E < 3 / (b : ℝ) :=
    (D.total_recipLoad_window_of_residual QB.hloadDisj QB.hloadLower QB.hloadUpper).2
  have hRcard : D.R.card ≤ b :=
    le_trans (Finset.card_le_card (fun x hx => Finset.mem_Icc.mpr
      ⟨Nat.pos_of_mem_primeFactors hx, Nat.le_of_mem_primeFactors hx⟩))
      (by rw [Nat.card_Icc]; omega)
  have hsumE : ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2
      ≤ F.ledger.Sload * (sigmaCtrl D.BS) ^ 2 :=
    F.ledger.hk0loadFact D QB F.bsCert.hk0load hScardD Cc.hSge Cc.hRpos' hRcard
  exact ⟨⟨Q, D, W, QB, hDdef, hLeq, hL, hsemi, he0, heL, hne, hctrlAvoid,
    hgadgetAvoid, havoid, hloadUpper, hsumE⟩⟩


end CircleMethod

end
