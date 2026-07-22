# Erdős 306 manuscript proof ledger

> Repository-only control record. This file is excluded from the public arXiv source package.

Task: `E306-P1-REV4`  
Owned branch: `paper/arxiv-v1-revision-v4`  
Exact base: `94615a5c860be9ce04c2be0153759a4e66fc25ab`  
Public formalization citation: `10.5281/zenodo.20767389`

## Authority separation

| Layer | Exact authority | Manuscript role |
|---|---|---|
| Current-best mathematical architecture | `Yuren-Tang/mathematics:curation/erdos-306-proof-architecture-v1@6505b51f12de3fdaaf4976379b0ce8b0a665cfc1` | Natural object chain, mechanism chain, symbolic parameter architecture, manuscript-consumer requirements. |
| Mature human proof and mechanism purification | `Yuren-Tang/erdos-306:proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc` | Detailed local/global arguments, Review B reconciliation, finite-certificate classification, exact terminal budget. |
| Immutable formal theorem authority | `Yuren-Tang/erdos-306:v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe` | Complete released Lean theorem, finite tuple bridge, finite certificates, and the two Rosser-Schoenfeld assumptions. |
| Public article | this REV4 branch | Preferred PNT/Abel human analytic provider plus the symbolic downstream proof. |

The PNT/Abel provider and the symbolic REV4 architecture are not claimed to be formalized in v0.0.3. The release remains machine checked relative to exactly `rosser_schoenfeld_cor3` and `rosser_schoenfeld_thm5`.

## Current proof spine

| ID | Mathematical node | Public locus | REV4 status |
|---|---|---|---|
| P0 | Distinct-prime semiprime iff `omega=Omega=2`. | Lemma `lem:semiprime-equivalence` | Proved. |
| P1 | Necessity: reduced denominator divides a squarefree lcm. | Introduction | Proved. |
| P2 | Avoiding unit representations imply arbitrary numerators. | Lemma `lem:numerator-reduction` | Proved. |
| P3 | Cases `b=1,2` reduce to squarefree `b>=3`. | Lemma `lem:small-b` | Proved. |
| P4 | Common-threshold analytic interface `AI(mu)`, `1<mu<log 3`, inclusive through block `3k0`. | Definition `def:AI` | Stated exactly. |
| P5 | PNT plus tail-uniform Abel summation gives `A_k=1/k+o(1/k)`. | Proposition `prop:local-law` | Proved. |
| P6 | One PNT threshold supplies density and inclusive reciprocal mass. | Proposition `prop:PNT-AI` | Proved. |
| P7 | Finite character identity, positivity, and no-wrap. | Section `sec:fourier` | Proved. |
| P8 | Exact control graph, product injectivity, centred CRT phase identity. | Section `sec:control` | Proved. |
| P9 | Block-cardinality input gives control load `O(1/k0)`; bottom density gives symbolic `c_sigma`. | Proposition `prop:control-estimates` | Proved; explicit constants classified. |
| P10 | Nondominance forces `c_w(rho) X/log^3 X`; cold blocks have labels, exceptions, and size bounds. | Proposition `prop:nondominant` and following text | Mechanism and implications exposed. |
| P11 | Unequal adjacent labels force `Pi_k` only with the exact size, residue, cardinality, and exception hypotheses. | Proposition `prop:boundary-penalty` | Proved; false unqualified version recorded. |
| P12 | Four-layer injective encoding, wrapped-label injection, structural `exp(A_gamma J)` entropy. | Proposition `prop:level-set` | Proved. |
| P13 | Below the forcing floor, off-main assignments are globally diagonal with exact energy `m^2 sigmaCtrl^2`. | Lemma `lem:localization` | Proved. |
| P14 | High-floor Laplace absorption and one-dimensional Gaussian diagonal tail. | Lemmas `lem:laplace`, `lem:gaussian-tail` | Proved. |
| P15 | Pair-pool identity and exact forbidden-load cancellation. | Section `sec:mass` | Proved; no hidden surplus. |
| P16 | Greedy completion with coherent normalization `alpha=3/2`. | Lemma `lem:greedy` and equations `eq:alpha`--`eq:theta-window` | Proved. |
| P17 | `alpha=3/2` yields `theta in (1/3,2/3]`, `v_*=2/9`, and exact expected mass `1/b`. | Section `sec:mass` | Derived. |
| P18 | Symbolic inverse-square constant `C_2` and variance comparison with `K_sigma`. | Equations `eq:inverse-square-constant`--`eq:variance-comparison` | Proved; `1000001/501` classified as released instantiation. |
| P19 | Bernoulli nonvanishing, principal logarithm, symbolic Taylor data, and major lower `c_maj/sigmaE`. | Section `sec:main` | Proved. |
| P20 | Universal damping `c_F=8v_*=16/9`. | Equation `eq:fourier-energy` | Derived from normalization. |
| P21 | Exact minor partition inside the genuine Fourier-minor set and exact block fibre `b`. | Section `sec:minor` | Proved. |
| P22 | Squarefree mismatch prime, one common reservoir, `beta_b^G`, and exact count `b(2N+1)`. | Section `sec:minor` | Proved. |
| P23 | Three positive budget shares with sum below one; order fixed interfaces -> eta -> C -> D_sib -> G -> k0. | Section `sec:completion` | Proved non-circular. |
| P24 | Strict total minor bound below the major allowance. | Equations `eq:budget-block`--`eq:strict-minor` | Proved. |
| P25 | Positive Fourier count gives avoiding `1/b`; arithmetic closure gives the headline theorem. | End of Section `sec:completion` | Proved. |
| P26 | Finite denominator set and released finite increasing tuple are equivalent representations; the dummy `1` is excluded from the sum. | Formalization end matter / release theorem | Boundary stated exactly. |

## Numerical classification

### Structural or derived

- `1<mu<log 3` and the inclusive block endpoint;
- `alpha=3/2` as the balancing normalization for the greedy weight interval;
- `theta in (1/3,2/3]`, `v_*=2/9`, `c_F=8v_*=16/9`;
- finite positive `c_sigma,C_2,K_sigma,r_T,delta_T,c_maj` with their stated inequalities;
- exact fibre factors `b` and `b(2N+1)`;
- `beta_b=sqrt(1-4v_*/b^2)`;
- positive `q_blk,q_gauss,q_sib` with sum below `1`;
- the constant-first, scale-last dependency order.

### Safety or finite certificates

- `mu=21/20` and the associated finite cutoff;
- human/released control constants `4,32,512,1/100`;
- local cold-block powers of two and rational chases;
- the coefficient `8` in the former level-set exponent and one explicit Gaussian-tail constant;
- `C_2=1000001`, `K_sigma=501`;
- `r_T=delta_T=1/10`, the coefficient `0.8`;
- equal quarter budgets and `2004=4*501`.

Each certificate now appears only where its evidentiary role is explained.

## REV3 -> REV4 reconstruction manifest

- Fixed `21/20` analytic ontology -> symbolic `AI(mu)` for every fixed `1<mu<log 3`, with `21/20` retained as a certificate.
- Explicit control constants as theorem statement -> symbolic `C_load,c_sigma`, with the block-cardinality proof and explicit values retained as certification.
- Full local numerical chase -> mechanism-first covering/dispersion proof, while all corrected exception and label-size hypotheses remain visible.
- `exp(AJ) exp(8 epsilon R)` -> `exp(A_gamma J) exp(gamma R)` for arbitrary `gamma>0`; structural block entropy retained.
- Fixed variance constants -> symbolic `C_2,K_sigma`; released values recorded once.
- Fixed Taylor disk and `0.8` -> symbolic `r_T,delta_T,a_T,c_maj`; certificate recorded once.
- “extra” minor class -> sibling class, with exact partition, `b`, `b(2N+1)`, common reservoir, and `beta_b` retained.
- Equal quarters and `2004` -> three symbolic budget shares with strict sum below one and one final threshold ledger.
- Formalization paragraph -> exact RS release authority, explicit non-formalized status of the PNT/symbolic presentation, and in-progress future formalization statement.
- Bibliography metadata invisible under `alpha` -> rendered DOI/URL notes; Bloom problem-page entry added and cited.

## Open gates

1. Human symbol-by-symbol comparison of the two Rosser-Schoenfeld assumptions with the publisher scan on pp. 69--70 (`BLOCKED-SOURCE`, non-blocking for the downstream human proof).
2. Portfolio Owner substantive manuscript review of this exact REV4 candidate.
3. Final author metadata, acknowledgement/disclosure, arXiv category, comments, licence, and submission-package decisions.
4. Explicit Portfolio Owner and E306-DIR submission authorization.

This ledger changes no Lean source, PDL source, workflow, release, tag, DOI record, default branch, or publication/submission state.
