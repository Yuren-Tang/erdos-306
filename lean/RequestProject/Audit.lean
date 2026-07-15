import RequestProject.Public.Erdos306

/-!
# Verification audit entry point

`lake env lean RequestProject/Audit.lean` prints everything an external reviewer
needs in order to verify the result, without reading the proof:

* the stable proposition `Erdos306` (compare against Erdős Problem 306 / the
  `google-deepmind/formal-conjectures` formulation);
* the type and axiom dependencies of its proof `Erdos306.erdos_306` (must be
  sorry-free, with no axiom beyond the three
  standard Lean ones and the two structural analytic inputs);
* the statements of those two analytic axioms: a PNT-type dyadic prime-density
  input and a Mertens-type reciprocal-prime window-mass input.

CI runs this file and gates on the axiom audit.
-/

open Erdos306

-- The stable proposition and its proof:
#check _root_.Erdos306
#check @erdos_306

-- Sorry-free, and depends only on the axioms listed here (fully qualified,
-- so the printed names can be matched exactly against GlobalControl/AnalyticInputs.lean):
#print axioms erdos_306

-- The two non-standard axioms (structural analytic-number-theory inputs):
#print GlobalControl.pnt_dyadic_prime_density
#print GlobalControl.mertens_dyadic_window_mass
