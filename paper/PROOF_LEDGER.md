# Erdős 306 manuscript proof ledger

Workstream: `E306-P1-REV1`  
Owned branch: `paper/arxiv-v1-revision-v1`  
Fixed parent: `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
Proof-development input: `proof-development/e306-rigour-v1@2eda43717603877d4c5a879b3103f99e36d5e6d1`  
Immutable formal evidence: `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`, DOI `10.5281/zenodo.20767390`  
Revision classification: **REVISED-CANDIDATE / READY-FOR-FINAL-FIXED-CANDIDATE-REVIEW / NOT-SUBMISSION-READY**

## Evidence vocabulary

- **PAPER-EXTERNAL**: a cited theorem used by the article.
- **PAPER-PROVED**: the article displays the hypotheses and the complete conceptual implication.
- **PAPER-ASSEMBLED**: a conclusion follows directly from preceding paper results.
- **FINITE/KERNEL-RESIDUAL**: only a named finite constant, cast, floor, threshold maximum, or polynomial inequality is delegated to the immutable companion.
- **RELEASE-CHECKED**: a declaration is accepted by the Lean kernel at `v0.0.3`.
- **SOURCE-TRANSCRIBED-FORMAL**: an external theorem is represented by a named formal axiom with an exact source locator.
- **DEVELOPMENT-SOURCE**: the PDL checkpoint supplies human expansion but is not independent or released authority.
- **FROZEN-CONTEXT**: an unreleased checkpoint supplies architecture or locators only.
- **FINAL-REVIEW-GATED**: the revised fixed candidate awaits its final mathematical/source/package review.

The paper proof and released Lean proof have different analytic backends. No premise or status transfers silently between them.

## Analytic and arithmetic spine

| ID | Claim | Revised manuscript locus | Status and exact boundary |
|---|---|---|---|
| P0 | A squarefree semiprime is a product of two distinct primes, equivalently `ω=Ω=2`. | Lemma `lem:semiprime-equivalence` | PAPER-PROVED in both directions / RELEASE-CHECKED in the direction consumed by the public theorem. |
| P1 | A reciprocal sum of squarefree integers has squarefree reduced denominator. | Section 1 | PAPER-PROVED; no released declaration required by the one-way formal theorem. |
| P2 | Avoiding `1/b` representations imply avoiding `a/b` representations. | Lemma `lem:numerator-reduction` | PAPER-PROVED / RELEASE-CHECKED. |
| P3 | The cases `b=1,2` reduce to squarefree denominators at least `3`. | Lemma `lem:small-b` | PAPER-PROVED / RELEASE-CHECKED. |
| P4 | `π(x)~x/log x`. | Equation `eq:PNT` | PAPER-EXTERNAL; not a released project axiom. |
| P5 | Abel summation on `(x,2x]`. | Equation `eq:abel` | PAPER-PROVED. |
| P6 | `Σ_{x≤p<2x}1/p=log 2/log x+o(1/log x)`. | Proposition `prop:local-law` | PAPER-PROVED, including the tail-uniform error and endpoint conversion; accepted Review A repair. |
| P7 | `A_k=1/k+o(1/k)`. | Equation `eq:local-k` | PAPER-PROVED. |
| P8 | Eventual dyadic cardinality. | Proposition `prop:PNT-AI` | PAPER-PROVED; RELEASE-CHECKED separately from RS Cor. 3. |
| P9 | Inclusive mass on `k0,...,3k0`, exactly `[2^k0,2^(3k0+1))`. | Definition `def:AI`, equations `eq:AI-mass`, `eq:inclusive-window` | PAPER-PROVED; RELEASE-CHECKED separately from RS Thm. 5. |
| P10 | One common provider threshold is fixed before the construction scale. | Definition `def:AI`, Proposition `prop:PNT-AI`, terminal Step 4 | PAPER-PROVED; accepted Review A common-threshold and constants-first/scale-last repair. |

## Finite spectral construction

| ID | Claim | Revised manuscript locus | Status and exact boundary |
|---|---|---|---|
| P11 | The two analytic supplies imply an avoiding representation of `1/b` for squarefree `b≥3`. | Theorem `thm:structural-construction` | PAPER-ASSEMBLED / RELEASE-CHECKED / FINAL-REVIEW-GATED. |
| P12 | Finite Fourier identity for the weighted subset count. | Equation `eq:finite-fourier` | PAPER-PROVED / RELEASE-CHECKED. |
| P13 | Main real part greater than total minor norm implies positivity. | Lemma `lem:spectral-positivity` | PAPER-PROVED / RELEASE-CHECKED. |
| P14 | Load below one converts the congruence to exact equality. | Equation `eq:no-wrap`, terminal section | PAPER-PROVED / RELEASE-CHECKED. |
| P15 | Exact control graph, assignment space, centered CRT, and control/full-energy identity. | Equations `eq:control-graph`--`eq:control-energy-identity` | PAPER-PROVED / RELEASE-CHECKED. |
| P16 | Control load and deviation have the required scale. | Lemmas `lem:primorial`, `lem:block-upper`, Proposition `prop:control-estimates` | PAPER-PROVED / RELEASE-CHECKED; explicit `32/(k0-1)` and `1/(100 k0 2^k0)`. |
| P17 | Cold blocks admit a unique dominant label with charged exceptions and uniform wrapped-label treatment. | Proposition `prop:nondominant`, equations `eq:exception-count`, `eq:label-bound`, Section 6 large-label paragraph | PAPER-PROVED / RELEASE-CHECKED; rational chase FINITE/KERNEL-RESIDUAL. |
| P18 | Distinct adjacent cold labels force the exception-reduced boundary floor. | Proposition `prop:boundary-penalty`, equation `eq:Pi` | PAPER-PROVED / RELEASE-CHECKED; every label-size, cardinality, residue, and exception hypothesis stated. |
| P19 | Global level sets satisfy the fixed-`A` bound. | Proposition `prop:level-set`, equation `eq:level-set` | PAPER-PROVED / RELEASE-CHECKED; finite code arithmetic FINITE/KERNEL-RESIDUAL. |
| P20 | Every off-main assignment is above the forcing floor or exactly diagonal. | Lemma `lem:localization`, equations `eq:global-floor`, `eq:diagonal-sector` | PAPER-PROVED / RELEASE-CHECKED. |
| P21 | High-floor Laplace mass is at most `η/σ_ctrl`. | Lemma `lem:laplace` | PAPER-PROVED / RELEASE-CHECKED; eventual threshold FINITE/KERNEL-RESIDUAL. |
| P22 | The diagonal sector has a discrete Gaussian tail. | Lemma `lem:gaussian-tail` | PAPER-PROVED / RELEASE-CHECKED. |
| P23 | Global control partition. | Theorem `thm:global-partition` | PAPER-ASSEMBLED / RELEASE-CHECKED / FINAL-REVIEW-GATED. |
| P24 | Pair-pool load is `(S1²-S2)/2` and at least `1/2`; forbidden load is cancelled exactly. | Equations `eq:pair-pool`, `eq:pool-half`, paragraphs before Lemma `lem:greedy` | PAPER-PROVED / RELEASE-CHECKED; no hidden mass surplus. |
| P25 | Greedy reciprocal window. | Lemma `lem:greedy` | PAPER-PROVED / RELEASE-CHECKED. |
| P26 | Load, uniform weight, and variance window. | Equations `eq:load-window`--`eq:variance-comparison` | PAPER-PROVED / RELEASE-CHECKED; inverse-square constant `1000001` FINITE/KERNEL-RESIDUAL; `Kσ=501`. |
| P27 | Bernoulli nonvanishing, logarithm branch, Taylor expansion, and Gaussian main lower bound. | Equations `eq:log-expansion`--`eq:main-lower` | PAPER-PROVED / RELEASE-CHECKED; aggregate numeric fields FINITE/KERNEL-RESIDUAL. |
| P28 | Universal Fourier-energy upper bound with exponent `16/9`. | Equation `eq:fourier-energy` | PAPER-PROVED / RELEASE-CHECKED. |
| P29 | The exact block-minor lane has CRT fibre multiplicity at most `b`. | Equations `eq:minor-lanes`, `eq:block-minor-budget` | PAPER-PROVED / RELEASE-CHECKED. |
| P30 | Every nonmain sibling differs modulo a prime divisor of squarefree `b`. | Equation `eq:mismatch-prime` and its preceding proof | PAPER-PROVED / RELEASE-CHECKED. |
| P31 | One common `G`-prime reservoir gives `β_b^G` damping and count `b(2N+1)`. | Equations `eq:high-prime-separation`--`eq:extra-count` | PAPER-PROVED / RELEASE-CHECKED. |
| P32 | `η→C→Dmp→G→k0`, `2004=4·501`, and three quarter budgets make minor strictly smaller than main. | Equations `eq:parameter-order`--`eq:strict-minor` | PAPER-PROVED / RELEASE-CHECKED; terminal maximum FINITE/KERNEL-RESIDUAL / FINAL-REVIEW-GATED. |
| P33 | The finite set yields the headline theorem and the finite public tuple. | Sections 10 and 11 | PAPER-ASSEMBLED / RELEASE-CHECKED; no infinite sequence is claimed. |

## Review A and Review B repair map

| Review item | Revision disposition | Manuscript evidence |
|---|---|---|
| Review A-1 | Incorporated | One `K_AI` in Definition `def:AI` and Proposition `prop:PNT-AI`. |
| Review A-2 | Incorporated | Inclusive endpoint `eq:inclusive-window` and provider-first/scale-last order at first construction use. |
| RB-01 | Incorporated | Exact blocks, support, complete internal/adjacent graph, assignment space, centered CRT, and product injectivity in Section 4. |
| RB-02 | Incorporated | Primorial, `Σ_{p∈P_k}1/p≤4/k`, edge-load decomposition, and `32/(k0-1)` in Section 4. |
| RB-03 | Incorporated | Dominance definition, uniqueness, forcing threshold, exceptions, label bounds, and wrapped/nonwrapped fibres in Sections 5-6. |
| RB-04 | Incorporated | Exception-aware Proposition `prop:boundary-penalty`; false unqualified formulation expressly rejected. |
| RB-05 | Incorporated | Four-layer injective code, fixed `e^{AJ}`, exception entropy, segment labels, and large-label route in Proposition `prop:level-set`. |
| RB-06 | Incorporated | `F0`, no-exception propagation, centered-CRT smallness, and exact diagonal identity in Lemma `lem:localization`. |
| RB-07 | Incorporated | Unit-shell sum, `8ε<c'<c`, and scale absorption in Lemma `lem:laplace`. |
| RB-08 | Incorporated | Label injection and explicit discrete Gaussian tail in Lemma `lem:gaussian-tail`. |
| RB-09 | Incorporated | Mechanism-only P17-P23 prose replaced by the theorem sequence; statuses synchronized below. |
| RB-10 | Incorporated | Component decomposition, `1000001`, and `501` in Section 7. |
| RB-11 | Incorporated | Open-right-half-plane nonvanishing, principal logarithm, Taylor disk, cubic sum, conjugation, and main lower bound in Section 8. |
| RB-12 | Incorporated | `S_blk=S_m∩...`, `S_ext=S_m∩...`, exact cover/disjointness, and `L=bP` fibre count in Section 9. |
| RB-13 | Incorporated | Squarefree-CRT mismatch proof before reservoir selection. |
| RB-14 | Incorporated | Common `G`-set, all `rs` edges, `2|m|<s`, distinctness, pointwise factor, and `b(2N+1)` sum. |
| RB-15 | Incorporated | Exact dependency order, `501`, `2004`, `(2N+1)σ≤2C+3`, and strict three-quarter comparison. |
| RB-16 | Incorporated | Nonempty finite set, increasing enumeration, dummy `1`, excluded anchor, finite tuple; assurance wording corrected from infinite to finite. |
| RB-17 | Incorporated | Both directions of the semiprime / `ω=Ω=2` equivalence in Lemma `lem:semiprime-equivalence`. |
| RB-18 | Incorporated after text revision | This ledger and `LEAN_CORRESPONDENCE.md` now describe the revised candidate rather than the existence of an external Lean proof. |
| RB-19 | Outside authority | Released Lean comments were not edited. |
| RB-20 | Recorded limitation | Review B was not an independent kernel/CI rerun; no mathematical repair was inferred. |

No item is classified as a material mathematical gap or blocked frontier.

## Exact finite/kernel residual ledger

The revised article names and limits the remaining delegations:

1. nondominant forcing rational rearrangements;
2. cold-threshold integer rounding and the no-exception cutoff;
3. finite label/shell/exception charge algebra;
4. eventual domination in the high-floor sector;
5. mass/gadget inverse-square arithmetic giving `1000001`;
6. aggregate Taylor and Gaussian-window numeric fields;
7. the final finite maximum of already fixed thresholds;
8. finite-to-tuple casts and index identities.

Each residual is downstream of a displayed mathematical implication and adds no external theorem.

## Remaining gates

1. Final fixed-candidate mathematical review of this exact revision tip.
2. Human-visible publisher-scan comparison of the two Rosser--Schoenfeld transcriptions on pp. 69-70.
3. Final bibliography and clean arXiv source-package audit.
4. Author decisions on title, affiliation/contact/ORCID display, acknowledgements, AI disclosure, licence, categories, comments, and ancillary files.
5. Explicit Portfolio Owner and `E306-DIR` submission authorization.

No Lean source, proof-development source, review branch, workflow, release, tag, DOI record, or arXiv submission is changed by this ledger.
