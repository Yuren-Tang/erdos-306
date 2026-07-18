# Erdős 306 manuscript proof ledger

Workstream: `E306-P1-RECOVERY`  
Recovery base: `paper/arxiv-v1@c264d00a722364c777d89e4438aadc7babfcdbe0`  
Successor branch: `paper/arxiv-v1-recovery-v1`  
Paper backend: PNT followed by a self-contained Abel/partial-summation bridge.  
Archived formal evidence: `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`, DOI `10.5281/zenodo.20767390`.

## Evidence vocabulary

- **PAPER-EXTERNAL**: a cited theorem used by the article.
- **PAPER-PROVED**: a derivation supplied in the article.
- **PAPER-ASSEMBLED**: a conclusion assembled from preceding paper results.
- **RELEASE-CHECKED**: a declaration accepted by the Lean kernel at `v0.0.3`.
- **SOURCE-TRANSCRIBED-FORMAL**: an external theorem represented by a named formal axiom with an exact locator.
- **FROZEN-CONTEXT**: an unreleased checkpoint supplies architecture or names, not current formal authority.
- **REVIEW-GATED**: an independent review obligation remains open.

The paper proof and the released Lean proof have different analytic backends. No status is transferred silently between them.

## Analytic and arithmetic spine

| ID | Claim | Manuscript location | Status | Formal/review note |
|---|---|---|---|---|
| P0 | Squarefree semiprime means a product of two distinct primes; equivalently `ω=Ω=2`. | Section 1 | PAPER-PROVED / RELEASE-CHECKED | Matches the released denominator predicate. |
| P1 | A reciprocal sum of squarefree integers has squarefree reduced denominator. | Section 1 | PAPER-PROVED | LCM argument. |
| P2 | Avoiding `1/b` representations imply avoiding `a/b` representations. | Lemma `lem:numerator-reduction` | PAPER-PROVED / RELEASE-CHECKED | Disjoint induction. |
| P3 | The cases `b=1,2` reduce to squarefree denominators at least 3. | Lemma `lem:small-b` | PAPER-PROVED / RELEASE-CHECKED | Uses `1/2=1/3+1/6` and `1=1/2+1/3+1/6`. |
| P4 | `π(x) ~ x/log x`. | Section `sec:PNT` | PAPER-EXTERNAL | Soundararajan and Ingham locators; not a released project axiom. |
| P5 | Abel summation identity on `(x,2x]`. | Equation `eq:abel` | PAPER-PROVED | Standard step-function partial summation. |
| P6 | `Σ_{x≤p<2x}1/p = log 2/log x + o(1/log x)`. | Proposition `prop:local-law` | PAPER-PROVED / REVIEW-GATED | Endpoint and uniform-error audit remains independent-review work. |
| P7 | `A_k=1/k+o(1/k)`. | Equation `eq:local-law-k` | PAPER-PROVED | Substitute `x=2^k`. |
| P8 | Eventual dyadic cardinality `D_ev`. | Proposition `prop:local-to-supply` | PAPER-PROVED | Uses `A_k≤|P_k|/2^k`; no fixed cutoff is claimed. |
| P9 | Eventual inclusive-window mass `M_ev`. | Proposition `prop:local-to-supply` | PAPER-PROVED | Inclusive blocks correspond to `[2^{k0},2^{3k0+1})`. |
| P10 | The construction consumes only eventual supplies. | Section `sec:supply` and Section `sec:terminal` | PAPER-PROVED / FROZEN-CONTEXT | Bottom scale chosen after all constants. |

## Finite spectral construction

| ID | Claim | Manuscript location | Status |
|---|---|---|---|
| P11 | Eventual supplies imply an avoiding representation of `1/b` for squarefree `b≥3`. | Theorem `thm:structural-construction` | PAPER-ASSEMBLED / RELEASE-CHECKED / FROZEN-CONTEXT / REVIEW-GATED |
| P12 | Finite Fourier identity for the weighted subset count. | Equation `eq:finite-fourier` | PAPER-PROVED / RELEASE-CHECKED |
| P13 | Main real part greater than total minor norm implies positivity. | Lemma `lem:spectral-selection` | PAPER-PROVED / RELEASE-CHECKED |
| P14 | Load below one converts the modular condition to exact equality. | Equation `eq:no-wrap` | PAPER-PROVED / RELEASE-CHECKED |
| P15 | Centered CRT representatives give the exact control-energy identity. | Equations `eq:Qctrl`, `eq:control-full-energy` | PAPER-PROVED / RELEASE-CHECKED / FROZEN-CONTEXT |
| P16 | Control variance and load have the required scale. | Equations `eq:sctrl-lower`, `eq:control-load` | PAPER-PROVED at handoff level / RELEASE-CHECKED / REVIEW-GATED |
| P17 | Low-energy blocks admit one dominant integer label with charged exceptions. | Lemma `lem:cold-block` | PAPER-PROVED at mechanism level / FROZEN-CONTEXT / REVIEW-GATED |
| P18 | Distinct adjacent labels force boundary energy. | Lemma `lem:boundary-penalty` | PAPER-PROVED at mechanism level / FROZEN-CONTEXT / REVIEW-GATED |
| P19 | Global low-energy level sets satisfy `eq:level-set`. | Lemma `lem:level-set` | PAPER-PROVED / FROZEN-CONTEXT / REVIEW-GATED |
| P20 | Every off-main assignment is above the forcing floor or diagonal. | Lemma `lem:localization` | PAPER-PROVED / FROZEN-CONTEXT / REVIEW-GATED |
| P21 | The high-floor Laplace mass is at most `η/σ_ctrl`. | Lemma `lem:floor-laplace` | PAPER-PROVED / FROZEN-CONTEXT / REVIEW-GATED |
| P22 | The diagonal tail is Gaussian. | Lemma `lem:diagonal-tail` | PAPER-PROVED / FROZEN-CONTEXT / REVIEW-GATED |
| P23 | Global control partition. | Theorem `thm:global-partition` | PAPER-ASSEMBLED / RELEASE-CHECKED / REVIEW-GATED |
| P24 | Pair-pool mass is `(S1²-S2)/2` and eventually at least `1/2`. | Equations `eq:pair-mass-id`, `eq:pair-mass-half` | PAPER-PROVED / RELEASE-CHECKED |
| P25 | Greedy reciprocal window. | Lemma `lem:greedy-window` | PAPER-PROVED / RELEASE-CHECKED |
| P26 | Uniform load, weight, and variance window. | Equations `eq:load-window`--`eq:variance-comparison` | PAPER-PROVED / RELEASE-CHECKED / FROZEN-CONTEXT |
| P27 | Main-arc Taylor expansion and Gaussian lower bound. | Equations `eq:main-expansion`--`eq:main-lower` | PAPER-PROVED / RELEASE-CHECKED / REVIEW-GATED |
| P28 | Fourier energy upper bound. | Equation `eq:fourier-energy` | PAPER-PROVED / RELEASE-CHECKED |
| P29 | Block-minor fibre multiplicity is exactly at most `b`. | Equation `eq:block-budget` | PAPER-PROVED / RELEASE-CHECKED / REVIEW-GATED |
| P30 | Squarefree sibling mismatch. | Lemma `lem:sibling-mismatch` | PAPER-PROVED / RELEASE-CHECKED |
| P31 | Reservoir products give `β_b^G` damping. | Equations `eq:one-gadget`--`eq:extra-budget` | PAPER-PROVED / RELEASE-CHECKED / REVIEW-GATED |
| P32 | Constant-first/scale-last choices make main exceed both minor sectors. | Section `sec:terminal` | PAPER-PROVED / RELEASE-CHECKED / REVIEW-GATED |
| P33 | Headline theorem. | Theorem `thm:headline` | PAPER-ASSEMBLED / RELEASE-CHECKED |

## Recovery extraction ledger

The recovery compared the controlled manuscript checkpoint `c264d00...` with the later mixed source only at the six authorized paper paths. The disposition of the content hunks is:

| File | Retained from `c264d00...` | Revised from later paper content | Omitted / unresolved |
|---|---|---|---|
| `main.tex` | theorem, avoiding reductions, finite spectral construction, control geometry, global partition, mass pool, main/minor analysis, terminal parameter order, formal-status sections | analytic opening replaced by PNT; added complete Abel bridge; fixed-cutoff interfaces replaced by eventual ones; formal-release wording separated from paper proof | the former Rosser--Schoenfeld-as-paper-backend section was omitted; independent review remains open |
| `references.bib` | release, benchmark, problem source, and Rosser--Schoenfeld formal-source citation | added Soundararajan, Ingham, and Hadamard for PNT; reclassified Mertens as background | no unverified discovery note was added |
| `PROOF_LEDGER.md` | downstream construction ledger and released audit | inserted PNT, Abel, local-law, and eventual-supply entries; added this recovery map | no formal status was transferred to the PNT bridge |
| `LEAN_CORRESPONDENCE.md` | theorem-statement map and exact released audit | separated paper, frozen-context, and immutable-release layers | no claim of a formal PNT theorem or bridge |
| `ARXIV_CHECKLIST.md` | author, review, source, formal, packaging, and authorization gates | synchronized mathematical and TeX-validation state with the clean recovery | submission-ready boxes remain open |
| `OPEN_EDITORIAL_QUESTIONS.md` | title, metadata, disclosure, licence, ancillary, and timing decisions | closed the analytic-backend and eventual-interface choices | mathematical review questions remain outside the editorial list |

No additional repository path was needed for the recovery.

## Exact released nonstandard inputs

The released headline audit contains the standard Lean foundations `propext`, `Classical.choice`, and `Quot.sound`, plus exactly:

- `RosserSchoenfeld.rosser_schoenfeld_cor3`;
- `RosserSchoenfeld.rosser_schoenfeld_thm5`.

They correspond to Rosser--Schoenfeld (1962), Corollary 3, equation (3.8), p. 69, and Theorem 5, equations (3.17)--(3.18), p. 70. They are formal-release facts, not premises of the PNT-first paper proof.

## Open gates

1. Independent audit of PNT-to-local-law uniformity and endpoints.
2. Independent mathematical review of P17--P23 and P27--P32.
3. Human-visible comparison of the released Rosser--Schoenfeld transcriptions with the publisher scan.
4. Separate disposition of the frozen development checkpoint.
5. Author metadata, disclosure, licence, category, acknowledgements, and ancillary-file decisions.
6. Final source-package audit and explicit author/E306-DIR submission authorization.
