import RequestProject.Erdos306FormalConjectures

/-!
# Verification audit entry point

`lake env lean RequestProject/Audit.lean` prints everything an external reviewer
needs in order to verify the result, without reading the proof:

* the full statement of `erdos_306` (compare against Erdős Problem 306 / the
  `google-deepmind/formal-conjectures` formulation);
* its axiom dependencies (must be sorry-free, with no axiom beyond the three
  standard Lean ones: `propext`, `Classical.choice`, `Quot.sound`).  The former
  Rosser–Schoenfeld axioms have been replaced by elementary proofs
  (`NoAxiomMertens*`, `NoAxiomChebyshev`, `NoAxiomDensity`).

CI runs this file and gates on the axiom audit.
-/

open Erdos306 RosserSchoenfeld

-- The theorem that is proved:
#check @erdos_306

-- Sorry-free, and depends only on the axioms listed here:
#print axioms erdos_306
