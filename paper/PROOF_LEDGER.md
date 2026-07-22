# Erdős 306 manuscript proof ledger

> Repository-only control record. This file is excluded from the public arXiv source package.

Task: `E306-P1-REV2`  
Owned branch: `paper/arxiv-v1-revision-v2`  
Exact base: `84ee55acaa292cf170661cc5fe32936de7d28ccd`  
Public formalization citation: `10.5281/zenodo.20767389`

## Publication boundary

The public article source is `main.tex`, `references.bib`, and the semantic section files under `sections/`. It contains no GitHub commit, branch, workstream, internal review, assurance, workflow, or development-checkpoint record. It cites the formalization only through the public Zenodo DOI. Lean declaration names do not replace any load-bearing mathematical argument.

## Proof spine

| ID | Mathematical claim | Public locus | Article status |
|---|---|---|---|
| P0 | Squarefree semiprimes are exactly integers with `ω=Ω=2`. | Lemma `lem:semiprime-equivalence` | Proved. |
| P1 | A reciprocal sum of squarefree integers has squarefree reduced denominator. | Section 1 | Proved. |
| P2 | Avoiding representations of `1/b` imply those of `a/b`. | Lemma `lem:numerator-reduction` | Proved. |
| P3 | The cases `b=1,2` reduce to squarefree denominators at least `3`. | Lemma `lem:small-b` | Proved. |
| P4 | Prime number theorem. | Equation `eq:PNT` | Cited external theorem. |
| P5 | Local reciprocal-prime law by Abel summation. | Proposition `prop:local-law` | Proved, including endpoint conversion. |
| P6 | One common eventual threshold supplies dyadic density and inclusive reciprocal mass. | Proposition `prop:PNT-AI` | Proved. |
| P7 | Finite weighted Fourier identity and positivity criterion. | Section `sec:fourier` | Proved. |
| P8 | Exact control graph, centered CRT identity, reciprocal load, and deviation scale. | Section `sec:control` | Proved. |
| P9 | Nondominant forcing, exception bounds, label bounds, and adjacent-label penalty. | Section `sec:cold` | Proved. |
| P10 | Global level-set estimate, localization, Laplace absorption, and Gaussian tail. | Section `sec:global` | Proved. |
| P11 | Pair-pool mass, greedy batch, uniform weights, and variance comparison. | Section `sec:mass` | Proved. |
| P12 | Main-arc nonvanishing, logarithm expansion, and Gaussian lower bound. | Section `sec:main` | Proved. |
| P13 | Exact block and external minor lanes, CRT fibre count, and common reservoir damping. | Section `sec:minor` | Proved. |
| P14 | Parameter order and strict main/minor comparison. | Section `sec:terminal` | Proved. |
| P15 | Finite-set construction yields the finite strictly increasing public tuple. | Section `sec:tuple` | Proved. |
| P16 | Headline theorem. | Theorem `thm:headline` | Assembled from P0-P15. |

## Editorial changes in REV2

- Removed internal release, GitHub, workstream, review, assurance, and workflow prose from the public article.
- Removed the appendix of Lean declaration locators.
- Replaced every “machine residual” or “immutable companion” substitution with public mathematical prose.
- Reduced formalization discussion to one concise code-availability section.
- Updated the formalization citation to public Zenodo DOI `10.5281/zenodo.20767389`.
- Retained the distinction between the article’s PNT presentation and the archived formalization’s explicit Rosser-Schoenfeld estimates without exposing internal project history.

## Remaining gates

1. Portfolio Owner substantive manuscript review.
2. Human source comparison of the cited Rosser-Schoenfeld locations.
3. Final bibliography and clean public source-package audit.
4. Author metadata, acknowledgement, disclosure, category, comments, and licence decisions.
5. Explicit submission authorization.

This ledger changes no Lean source, workflow, release, tag, DOI record, default branch, or publication/submission state.
