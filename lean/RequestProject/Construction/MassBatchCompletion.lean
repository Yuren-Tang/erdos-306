import RequestProject.Construction.BaseLoadBudget

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Completing the edge mass by a residual batch

Once the control and gadget edges fit below the target load, a residual batch
of block-semiprime edges fills the remaining mass window while avoiding the
finite obstruction set.
-/

/-- Mass-batch layer (gate-free): given a concrete `D` whose base load already fits the
window and whose obstruction edges are below the bottom pair scale, a residual mass batch
`Q` with `R2MassBatchSupply (D.withQ Q)` exists.  The load threshold `k1` is supplied
explicitly (obtained from `blockPrimes_product_load_ge` upstream), avoiding the inner gate. -/
lemma exists_massBatch_of_base_load {T : Finset ℕ} {b : ℕ} (hb : 3 ≤ b)
    (D : R2ConcreteData T b)
    (hbase : D.baseLoad < 3 / (2 * (b : ℝ)))
    (hlarge : 2 * b < 3 * (2 ^ D.BS.k0 * 2 ^ D.BS.k0))
    (hTsmall : ∀ e ∈ T, e < 2 ^ D.BS.k0 * 2 ^ D.BS.k0)
    (hdisj : Disjoint (ctrlEdges D.BS) (gadgetEdges D.R D.S))
    (hsub : blockPrimes D.BS.k0 ⊆ blockSupport D.BS)
    (k1 : ℕ) (hk1le : k1 ≤ D.BS.k0)
    (hload : ∀ k0 : ℕ, k1 ≤ k0 →
      (1 : ℝ) / 2 ≤ ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
        (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ))) :
    ∃ Q : Finset ℕ, R2MassBatchSupply (D.withQ Q) :=
  exists_massBatchSupply_of_blockPrimes_forbiddenBudget D (by omega) hbase hlarge
    (R2ForbiddenBudget.of_basePieces D hTsmall) k1 hk1le hsub hload
    (by simpa [R2ForbiddenBudget.of_basePieces] using
      basePieces_forbiddenBudget_final_ineq D hb hTsmall hdisj)

/-- Data layer for a `G`-element gadget set `S` (generalising the singleton form):
from a block system and a set `S` of primes `≥ 2^k0`, the residual mass batch `Q`
with its supply exists for `D = ⟨BS, ∅, b.primeFactors, S⟩`. -/
lemma exists_massBatch_for_gadget_set {T : Finset ℕ} {b : ℕ} (hb : 3 ≤ b)
    (BS : BlockSystem) (S : Finset ℕ)
    (hsub : blockPrimes BS.k0 ⊆ blockSupport BS)
    (hS_ge : ∀ s ∈ S, 2 ^ BS.k0 ≤ s)
    (hRout : ∀ r ∈ b.primeFactors, r ∉ blockSupport BS)
    (hctrl : R2ConcreteData.recipLoad (ctrlEdges BS) ≤ 3 / (4 * (b : ℝ)))
    (hsum : 3 / (4 * (b : ℝ)) +
        ((b.primeFactors.card * S.card : ℕ) : ℝ) / ((2 * 2 ^ BS.k0 : ℕ) : ℝ)
        < 3 / (2 * (b : ℝ)))
    (k1 : ℕ) (_hk15 : 5 ≤ k1) (hk1le : k1 ≤ BS.k0)
    (hload : ∀ k0 : ℕ, k1 ≤ k0 →
      (1 : ℝ) / 2 ≤ ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
        (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)))
    (hlarge : 2 * b < 3 * (2 ^ BS.k0 * 2 ^ BS.k0))
    (hTsmall : ∀ e ∈ T, e < 2 ^ BS.k0 * 2 ^ BS.k0) :
    ∃ Q : Finset ℕ,
      R2MassBatchSupply ((⟨BS, ∅, b.primeFactors, S⟩ : R2ConcreteData T b).withQ Q) := by
  set D0 : R2ConcreteData T b := ⟨BS, ∅, b.primeFactors, S⟩ with hD0
  have hRprime : ∀ r ∈ D0.R, Nat.Prime r := fun r hr => Nat.prime_of_mem_primeFactors hr
  have hRout' : ∀ r ∈ D0.R, r ∉ blockSupport D0.BS := hRout
  have B0 : R2BaseLoadBudget D0 :=
    baseLoadBudget_of_control_epsilon_and_gadget_scale D0 (3 / (4 * (b : ℝ))) 2 (2 ^ BS.k0)
      (by norm_num) (by positivity) hctrl
      (fun r hr => by
        have := (Nat.prime_of_mem_primeFactors hr).two_le; exact_mod_cast this)
      (fun s' hs' => by
        have := hS_ge s' (by simpa [hD0] using hs'); exact_mod_cast this)
      (by simpa [hD0] using hsum)
  have hbase : D0.baseLoad < 3 / (2 * (b : ℝ)) := baseLoad_lt_of_budget D0 hRprime hRout' B0
  have hdisj := r2Concrete_ctrl_gadget_disjoint_of_R_outside_blockSupport D0 hRprime hRout'
  exact exists_massBatch_of_base_load hb D0 hbase hlarge hTsmall hdisj hsub k1 hk1le hload

/-
Obtain the residual mass batch `Q` for the high-block gadget set `S`,
discharging the `k0`-large side conditions (`hsum`/`hlarge`/`hTsmall`).
-/
lemma exists_massBatch_at_large_scale {T : Finset ℕ} {b : ℕ} (hb : 3 ≤ b)
    (BS : BlockSystem) (S : Finset ℕ)
    (hsub : blockPrimes BS.k0 ⊆ blockSupport BS)
    (hSge : ∀ s ∈ S, 2 ^ (2 * BS.k0) ≤ s)
    (hRout : ∀ r ∈ b.primeFactors, r ∉ blockSupport BS)
    (hctrl : R2ConcreteData.recipLoad (ctrlEdges BS) ≤ 3 / (4 * (b : ℝ)))
    (k1 : ℕ) (hk15 : 5 ≤ k1) (hk1le : k1 ≤ BS.k0)
    (hload : ∀ k0 : ℕ, k1 ≤ k0 →
      (1 : ℝ) / 2 ≤ ∑ pq ∈ (blockPrimes k0).offDiag.filter (fun pq : ℕ × ℕ => pq.1 < pq.2),
        (1 : ℝ) / ((pq.1 : ℝ) * (pq.2 : ℝ)))
    (hmass : 2 * b * (b.primeFactors.card * S.card) < 3 * 2 ^ BS.k0 ∧
      2 * b < 2 ^ BS.k0)
    (hk0T : T.sup id + 1 ≤ BS.k0) :
    ∃ Q : Finset ℕ,
      R2MassBatchSupply ((⟨BS, ∅, b.primeFactors, S⟩ : R2ConcreteData T b).withQ Q) := by
  convert exists_massBatch_for_gadget_set hb BS S hsub ( fun s hs => ?_ ) hRout hctrl ?_ k1 hk15 hk1le hload ?_ ?_ using 1;
  · exact le_trans ( pow_le_pow_right₀ ( by norm_num ) ( by linarith ) ) ( hSge s hs );
  · rw [div_add_div, div_lt_div_iff₀] <;> norm_cast <;> try positivity
    nlinarith [hmass.1]
  · exact hmass.2.trans_le (by
      have : 1 ≤ 2 ^ BS.k0 := one_le_pow₀ (by omega)
      nlinarith [Nat.zero_le (2 ^ BS.k0)])
  · intro e he
    have heK : e < BS.k0 := lt_of_le_of_lt (Finset.le_sup (f := id) he) (by omega)
    exact heK.trans (Nat.lt_two_pow_self.trans_le <|
      Nat.le_mul_of_pos_right _ (pow_pos (by omega) _))


end CircleMethod

end

