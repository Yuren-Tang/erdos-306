import Mathlib.NumberTheory.ArithmeticFunction.Misc

/-!
# Statement of Erdős Problem 306

This module contains only the stable public proposition. It is independent of
the project's proof architecture and can therefore be imported without the
circle-method implementation.
-/

open scoped BigOperators Finset ArithmeticFunction.omega ArithmeticFunction.Omega

/-- Erdős Problem 306 in the formulation used by
`google-deepmind/formal-conjectures`: every positive rational with squarefree
denominator is a sum of reciprocals of distinct squarefree semiprimes. -/
def Erdos306 : Prop :=
  ∀ (q : ℚ), 0 < q → Squarefree q.den →
    ∃ k : ℕ, ∃ (n : Fin (k + 1) → ℕ), n 0 = 1 ∧ StrictMono n ∧
      (∀ i ∈ Finset.Icc 1 (Fin.last k), ω (n i) = 2 ∧ Ω (n i) = 2) ∧
      q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i)
