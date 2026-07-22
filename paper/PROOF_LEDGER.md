# Erdős 306 manuscript proof ledger

> Repository-only control record. This file is excluded from the public arXiv source package.

Task: `E306-P1-REV3`  
Owned branch: `paper/arxiv-v1-revision-v3`  
Exact base: `6c708c08192cc6730cb9fa806310f662f2cf0eed`  
Public formalization citation: `10.5281/zenodo.20767389`

## Mathematical preservation boundary

REV3 is editorial.  Every load-bearing mathematical statement and implication from REV2 remains in the public article.  The only deleted mathematical-body section was the Lean-specific conversion from a finite set to a tuple with an auxiliary initial entry; that conversion is not needed for the public theorem.  The end matter now records, without implementation detail, that the formalization uses a finite increasing tuple as an equivalent representation.

## Proof spine

| ID | Mathematical claim | Public locus | REV3 status |
|---|---|---|---|
| P0 | Squarefree semiprimes are exactly integers with `ω=Ω=2`. | Lemma `lem:semiprime-equivalence` | Retained and proved. |
| P1 | A reciprocal sum of squarefree integers has squarefree reduced denominator. | Section 1 | Retained and proved. |
| P2 | Avoiding representations of `1/b` imply those of `a/b`. | Lemma `lem:numerator-reduction` | Retained and proved. |
| P3 | The cases `b=1,2` reduce to squarefree denominators at least `3`. | Lemma `lem:small-b` | Retained and proved. |
| P4 | Prime number theorem. | Equation `eq:PNT` | Retained external theorem. |
| P5 | Local reciprocal-prime law by Abel summation. | Proposition `prop:local-law` | Retained, including uniform error and endpoints. |
| P6 | One common threshold supplies dyadic density and inclusive reciprocal mass. | Proposition `prop:PNT-AI` | Retained and proved. |
| P7 | Finite weighted Fourier identity and positivity criterion. | Section `sec:fourier` | Retained and proved. |
| P8 | Control graph, centered CRT identity, reciprocal load, and deviation scale. | Section `sec:control` | Retained and proved. |
| P9 | Nondominant forcing, exception and label bounds, and adjacent-label energy. | Section `sec:cold` | Retained and proved. |
| P10 | Global level-set estimate, localization, high-energy and Gaussian tails. | Section `sec:global` | Retained and proved. |
| P11 | Pair-family mass, greedy selection, uniform weight, and variance comparison. | Section `sec:mass` | Retained and proved. |
| P12 | Major-arc logarithm expansion and Gaussian lower bound. | Section `sec:main` | Retained and proved. |
| P13 | Two minor-arc classes, CRT fibre count, and auxiliary-prime damping. | Section `sec:minor` | Retained and proved. |
| P14 | Parameter order and strict major/minor comparison. | Section `sec:completion` | Retained and proved. |
| P15 | Avoiding unit-fraction construction and headline theorem. | Theorems `thm:structural-construction`, `thm:headline` | Retained and assembled from P0-P14. |

## Before/after editorial manifest

- REV2 detailed abstract -> concise theorem-and-method abstract.
- REV2 opening theorem section -> standard introduction with historical context and proof overview.
- “analytic interface/provider”, “Fourier-minor lanes”, “mass batch”, “gadget”, and “terminal parameters” -> standard analytic input, minor arcs, selected mass family, auxiliary denominators, and completion terminology.
- Numbered formalization/context sections -> unnumbered end matter.
- Lean-specific finite-tuple/dummy-anchor section -> removed from the public proof; equivalent representation boundary recorded in code availability.
- Nested two-line and three-line TeX wrappers -> consolidated semantic section files.

## Remaining gates

1. Portfolio Owner substantive manuscript review.
2. Human source comparison of the cited Rosser-Schoenfeld locations.
3. Final bibliography and public source-package audit.
4. Author metadata, acknowledgement, disclosure, category, comments, and licence decisions.
5. Explicit submission authorization.

This ledger changes no Lean source, workflow, release, tag, DOI record, default branch, or publication/submission state.
