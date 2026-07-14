import RequestProject.LocalEnergy.CRTRepresentation
import RequestProject.Core.IncreasingPairs
import Mathlib.Analysis.Complex.Exponential

/-!
# Quadratic energy of a CRT block

A block assignment chooses one residue class modulo each prime. Pairwise
centered CRT representatives define the quadratic energy `QP`; the associated
scale `sigmaP` and partition function measure the local counting problem.
-/

open Finset BigOperators Classical

noncomputable section

/-! ## CRT assignment space -/

/-- A block assignment: for each prime p ∈ P, a residue class mod p. -/
abbrev BlockAssignment (P : Finset ℕ) := ∀ p : P, ZMod p.1

/-! ## CRT energy and block deviation -/

/-- The CRT energy for an assignment a on a prime block P:

    `QP P a = ∑_{p < q ∈ P} (crtRepr(p,q,a(p),a(q)) / (p·q))²`

    This is the real quadratic form on the CRT product space.
    The nontrivial structure ensures that the trivial bound
    `≤ ∏ p` (the size of the assignment space) is far from the
    desired saving bound `≤ C / sigmaP`. -/
def QP (P : Finset ℕ) (a : BlockAssignment P) : ℝ :=
  ∑ pq ∈ increasingPairs P,
    ((crtRepr pq.1.1 pq.2.1 (a pq.1) (a pq.2) : ℝ) /
      ((pq.1.1 : ℝ) * pq.2.1)) ^ 2

/-- QP is nonneg (sum of squares). -/
theorem QP_nonneg (P : Finset ℕ) (a : BlockAssignment P) :
    0 ≤ QP P a :=
  Finset.sum_nonneg fun _ _ => by positivity

/-- The block standard deviation:

    `sigmaP P = √(∑_{p < q ∈ P} 1/(p·q)²)` -/
def sigmaP (P : Finset ℕ) : ℝ :=
  Real.sqrt (∑ pq ∈ increasingPairs P,
    (1 : ℝ) / ((pq.1.1 : ℝ) * pq.2.1) ^ 2)

/-- sigmaP is nonneg. -/
theorem sigmaP_nonneg (P : Finset ℕ) : 0 ≤ sigmaP P :=
  Real.sqrt_nonneg _

/-
sigmaP is positive when P has at least 2 distinct primes.
-/
theorem sigmaP_pos_of_two (P : Finset ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p)
    (h2 : 1 < P.card) :
    0 < sigmaP P := by
  refine' Real.sqrt_pos.mpr _;
  refine' Finset.sum_pos _ _;
  · exact fun i hi => one_div_pos.mpr ( sq_pos_of_pos ( mul_pos ( Nat.cast_pos.mpr ( Nat.Prime.pos ( hP _ i.1.2 ) ) ) ( Nat.cast_pos.mpr ( Nat.Prime.pos ( hP _ i.2.2 ) ) ) ) );
  · obtain ⟨ p, hp, q, hq, hpq ⟩ := Finset.one_lt_card.mp h2; cases lt_trichotomy p q <;> simp_all +decide [ increasingPairs ] ;
    · exact ⟨ ⟨ ⟨ p, hp ⟩, ⟨ q, hq ⟩ ⟩, by aesop ⟩;
    · exact ⟨ ⟨ ⟨ q, hq ⟩, ⟨ p, hp ⟩ ⟩, by aesop ⟩

/-! ## Assignment space cardinality -/

/-
The cardinality of the block assignment space is ∏_{p ∈ P} p.
-/
/-- The assignment space has one independent residue modulo each element of `P`. -/
theorem blockAssignment_card (P : Finset ℕ) [∀ p : P, NeZero p.1] :
    Fintype.card (BlockAssignment P) = ∏ p ∈ P, p := by
  convert Fintype.card_pi;
  refine' Finset.prod_bij ( fun p hp => ⟨ p, hp ⟩ ) _ _ _ _ <;> aesop

/-! ## Partition function with saving bound -/

/-- The Gaussian-weighted partition function over the CRT assignment space:

    `blockPartitionFunction P hP c = ∑_{a ∈ BlockAssignment P} exp(-c · QP(P, a))`

    The trivial bound is `≤ ∏_{p ∈ P} p` (each term ≤ 1).
    The local-energy saving bound is `≤ C / sigmaP(P)`, which is
    much smaller than `∏ p` for large blocks. -/
def blockPartitionFunction (P : Finset ℕ) (hP : ∀ p ∈ P, Nat.Prime p) (c : ℝ) : ℝ :=
  haveI : ∀ p : P, NeZero p.1 := fun p => ⟨(hP p.1 p.2).ne_zero⟩
  ∑ a : BlockAssignment P, Real.exp (-c * QP P a)

end
