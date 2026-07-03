import RequestProject.GlobalControl.GlobalAssignment
import RequestProject.LocalEnergy.CRTModel

/-!
# Global control energy

Internal and adjacent-block control pairs define the global quadratic energy
and its reciprocal-square deviation scale.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-! ## Control pairs and energy

For a global assignment `a : ∀ p, ZMod p`, the CRT representative of a control
pair `{p,q}` is `crtRepr p q (a p) (a q)`.  The control-pair energy `Qctrl`
sums `(H_{pq}/(pq))²` over internal pairs (within a block) and consecutive
bipartite pairs (between `Pₖ` and `Pₖ₊₁`); `sigmaCtrl²` is the same sum with
numerator `1`. -/

/-- Global CRT representative of a control pair under a global assignment. -/
def Hglob (a : (p : ℕ) → ZMod p) (p q : ℕ) : ℤ := crtRepr p q (a p) (a q)

/-- The internal control pairs of block `k` (unordered, `p < q`). -/
def internalPairs (BS : BlockSystem) (k : ℕ) : Finset (ℕ × ℕ) :=
  ((BS.P k) ×ˢ (BS.P k)).filter fun pq => pq.1 < pq.2

/-- The consecutive bipartite control pairs between blocks `k` and `k+1`. -/
def bipartitePairs (BS : BlockSystem) (k : ℕ) : Finset (ℕ × ℕ) :=
  (BS.P k) ×ˢ (BS.P (k + 1))

/-- All internal control pairs and all bipartite pairs between consecutive
blocks. -/
def ctrlPairs (BS : BlockSystem) : Finset (ℕ × ℕ) :=
  (Finset.Icc BS.k0 BS.K).biUnion (fun k => internalPairs BS k) ∪
  (Finset.Ico BS.k0 BS.K).biUnion (fun k => bipartitePairs BS k)

lemma ctrlPairs_mem_blockSupport (BS : BlockSystem) {pq : ℕ × ℕ}
    (h : pq ∈ ctrlPairs BS) :
    pq.1 ∈ blockSupport BS ∧ pq.2 ∈ blockSupport BS := by
  simp only [ctrlPairs, Finset.mem_union, Finset.mem_biUnion, internalPairs,
    bipartitePairs, Finset.mem_filter, Finset.mem_product, Finset.mem_Icc,
    Finset.mem_Ico, blockSupport] at h ⊢
  rcases h with ⟨k, hk, ⟨hp1, hp2⟩, _⟩ | ⟨k, hk, hp1, hp2⟩
  · exact ⟨⟨k, ⟨hk.1, hk.2⟩, hp1⟩, ⟨k, ⟨hk.1, hk.2⟩, hp2⟩⟩
  · exact ⟨⟨k, ⟨hk.1, le_of_lt hk.2⟩, hp1⟩, ⟨k + 1, ⟨le_trans hk.1 (Nat.le_succ k), hk.2⟩, hp2⟩⟩

/-- The global control energy `Qctrl(a) = ∑_{ctrl pairs} (H_{pq}/(pq))²`,
    over the faithful finite assignment type. -/
def Qctrl (BS : BlockSystem) (a : GlobalAssignment BS) : ℝ :=
  ∑ pq ∈ ctrlPairs BS,
    ((Hglob (toPlain BS a) pq.1 pq.2 : ℝ) / ((pq.1 : ℝ) * pq.2)) ^ 2

/-- The global control deviation `sigmaCtrl = √(∑ 1/(pq)²)`. -/
def sigmaCtrl (BS : BlockSystem) : ℝ :=
  Real.sqrt (∑ pq ∈ ctrlPairs BS, (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2)

lemma Qctrl_nonneg (BS : BlockSystem) (a : GlobalAssignment BS) : 0 ≤ Qctrl BS a :=
  Finset.sum_nonneg fun _ _ => by positivity

lemma sigmaCtrl_nonneg (BS : BlockSystem) : 0 ≤ sigmaCtrl BS := Real.sqrt_nonneg _

/-- The control deviation is positive whenever the control-pair set is
nonempty. -/
lemma sigmaCtrl_pos_of_ctrlPairs_nonempty (BS : BlockSystem)
    (hctrl : (ctrlPairs BS).Nonempty) : 0 < sigmaCtrl BS := by
  rw [sigmaCtrl, Real.sqrt_pos]
  have hterm : ∀ pq ∈ ctrlPairs BS,
      0 < (1 : ℝ) / ((pq.1 : ℝ) * pq.2) ^ 2 := by
    intro pq hpq
    have hp : 0 < (pq.1 : ℝ) := by
      exact_mod_cast (blockSupport_prime BS (ctrlPairs_mem_blockSupport BS hpq).1).pos
    have hq : 0 < (pq.2 : ℝ) := by
      exact_mod_cast (blockSupport_prime BS (ctrlPairs_mem_blockSupport BS hpq).2).pos
    positivity
  obtain ⟨pq, hpq⟩ := hctrl
  exact Finset.sum_pos' (fun pq hpq => (hterm pq hpq).le)
    ⟨pq, hpq, hterm pq hpq⟩

end GlobalControl

end
