# E306-PAPER-01 — manuscript proof-obligation ledger

## Status vocabulary

- `SOURCE-PASS` — independently verified in the controlling mathematical source.
- `MANUSCRIPT-VERIFIED` — independently checked in the recovered integrated manuscript at exact checkpoint `c2dfc5120eec017718ef07cbe43f9c151803769c`.
- `CONTROL-SYNCED` — the control ledger agrees with the recovered integration and the comparative audit disposition.
- `REPAIR-DIFF-RECHECK-PENDING` — the BR-01--BR-03 successor requires a narrow independent exact-diff and exact-head re-check before readiness.
- `PUBLICATION-GATE-PENDING` — a later exact-head publication gate would require separate Owner authorization; no earlier gate transfers.

The recovered integrated manuscript was checked by the exact-head comparative audit at `#issuecomment-5141204793`. At checkpoint `c2dfc5120eec017718ef07cbe43f9c151803769c`, `verify-e306-manuscript` run `30608129577` and `verify-erdos-306` run `30608129625` succeeded, and the generated manuscript has 42 pages. The audit found no mathematical manuscript defect and authorized only BR-01--BR-03 provenance and control repairs. Those repairs change no mathematical obligation below.

## A. Parameterized arithmetic capacity

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| A1 | fixed reduced `t=a/b in (0,1)`, squarefree `b`, fixed `gamma>1`, `Z=X^gamma`, and sharp admissible region | §§1, 4 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| A2 | fixed-ratio prime supply and reciprocal power sums | §4 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| A3 | exact complete-pair load and square-load identities, including factor `1/2` | §§3–4 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| A4 | target rows indexed by the prime-divisor set `S_b`; corrected `tau(b)=sum_(r in S_b)r^-2` | §4 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| A5 | exact Bernoulli centring `theta Lambda=t`, compact parameter interval and limit `alpha_(t,gamma)` | §4 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| A6 | total actual-family variance with pair and target-row contributions | §4 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| A7 | explicit variance regimes: pair provider for `gamma>2`, target-row provider for `gamma=2` and `1<gamma<2` | §4 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| A8 | exact finite Fourier coefficient, Bernoulli modulus bound, squarefree CRT period and no-wrap capacity | §§2, 4 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |

## B. Anchor, rows, fibres and coordinate identification

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| B1 | reciprocal dispersion with `s>=16`, exact cold rigidity and zero-exception conclusion | §5 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| B2 | fingerprint rigidity, coherent label, noncoherent tail and weighted anchor partition | §5 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| B3 | restored multiplicity-sensitive cyclic-energy lemma | §6 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| B4 | uniform lower-prime row distance derived from cyclic energy | §6 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| B5 | target-row distance and observability over `S_b`; numerator creates no new decoder direction | §6 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| B6 | shift-uniform row tails and summed row error | §6 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| B7 | exact denominator-factor partition and unnormalized weighted fibre error | §§4, 6 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| B8 | all prime coordinates identified through `M_dec` | §6 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| B9 | target coordinates identified through `T_0=kappa_0 min(X^2,Z)` | §6 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |

## C. Universal six-sector positivity

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| C1 | `N=floor(C/sigma_E)=o(T_0)` for every fixed admissible parameter set | §7 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| C2 | total-variance Gaussian sector `N<|m|<=T_0` | §§7–8 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| C3 | prime-only transition `T_0<|m|<=X^2/4` | §7 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| C4 | adaptive retained-pair damping `X^2/4<|m|<=M_dec` | §7 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| C5 | anchor-energy range `|m|>M_dec` and terminal noncoherent/nondecoder sector | §7 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| C6 | pairwise-disjoint exhaustive six-sector partition for every fixed `gamma>1` | §7 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| C7 | aggregate Taylor remainder, exact linear cancellation and total-variance Gaussian major | §8 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| C8 | strict terminal budget in parameter order `C -> X` and positive Fourier numerator | §8 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |

## D. Exactness, characterization and qualitative refinement

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| D1 | positive quotient coefficient followed by deterministic no-wrap direct fixed-target exactness | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| D2 | squarefree least-common-multiple obstruction | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| D3 | prime-dilution characterization with successive disjoint finite avoidance; no numerator induction or special `b=1,2` case | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| D4 | finite prescription with explicit zero-residual branch and positive-residual extension | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| D5 | disjoint realization of finite decompositions | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| D6 | row--column transportation and common refinement of finite families | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| D7 | local one-block replacement refines but need not be globally proper | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| D8 | simultaneous disjoint replacement of every block yields a globally proper refinement | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| D9 | countably infinite pairwise-disjoint proper refinement chain with finite prescriptions | §9 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |

## E. Quantitative consequences

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| E1 | quantitative coefficient lower bound from the strict six-sector assembly | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| E2 | sharp fixed-target coefficient from total variance and explicit regime corollaries | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| E3 | exponential multiplicity and entropy-optimal mesoscopic window | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| E4 | exact entropy optimization over fixed admissible `gamma` | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| E5 | exact-cardinality extraction and Hamming-separated macroscopic diversity | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| E6 | balanced signed reciprocal relations with non-minimality boundary | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| E7 | direct denominator-height bounds | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| E8 | quantitative globally proper refinement branching | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |
| E9 | global quantitative transfer with universal leading rate `2 log 2` | §10 | MANUSCRIPT-VERIFIED / CONTROL-SYNCED |

## F. Verification and lifecycle obligations

| ID | Obligation | Evidence | Current status |
|---|---|---|---|
| F1 | independent exact-head mathematical-value, architecture, provenance and build audit of the recovered integration | `#issuecomment-5141204793`; runs `30608129577`, `30608129625`; 42-page build | MANUSCRIPT-VERIFIED |
| F2 | recovered-source provenance and control records distinguish the integrated source, the rendered evidence object and the current GitHub Actions artifact | `RECOVERED_SOURCE_PROVENANCE.md`; BR-01--BR-03 repair record | CONTROL-SYNCED |
| F3 | the bounded repair successor receives a narrow exact-diff, exact-file-list, exact-head workflow and artifact re-check | later one-off read-only role | REPAIR-DIFF-RECHECK-PENDING |
| F4 | any refreeze or publication gate is separately authorized at its exact head | Owner disposition | PUBLICATION-GATE-PENDING |

## Acceptance boundary

The mathematical obligations A1--E9 are complete in the recovered integrated manuscript at checkpoint `c2dfc5120eec017718ef07cbe43f9c151803769c`; the comparative audit found no mathematical repair. The BR-01--BR-03 successor changes only authorized provenance and control prose and PR metadata. It may advance only to a narrow independent exact-diff and exact-head re-check, followed by a separate Owner disposition.

The former 44-page technical publication gate at `79a43178bdc4919677375362ef58b9c127da18b0` is historical and nontransferable. Neither the recovered integration nor its bounded repair successor is refrozen, ready for review, merged, licensed, released, uploaded or submitted by this ledger.
