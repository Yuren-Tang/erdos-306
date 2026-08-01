# E306-PAPER-01 — manuscript proof-obligation ledger

## Status vocabulary

- `SOURCE-PASS` — independently verified in a controlling mathematical source.
- `BASELINE-VERIFIED` — independently checked in the accepted pre-reparameterization manuscript.
- `WRITER-TRANSPORTED` — rewritten by the authorized native fixed-ratio writer and validated only by exact-head mechanical gates; not independently certified mathematically.
- `UNAFFECTED-VERIFIED` — unchanged from an independently verified baseline.
- `INDEPENDENT-AUDIT-PENDING` — requires the separately authorized whole-article mathematical and naturalness audit.
- `PUBLICATION-GATE-PENDING` — any exact-head publication gate requires separate Owner authorization.

The native fixed-ratio writer starts from `b64bac1f9426cbeb60090a6dbdc147c5e67386ac` under `#issuecomment-5150232754`. It replaces the rejected append-only proposition by one standing parameter `eta in (0,1)` throughout the article. This ledger records dependency continuity; it does not certify the writer's mathematics.

## A. Parameterized arithmetic capacity

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| A1 | fixed reduced `t=a/b in (0,1)`, squarefree `b`, fixed `gamma>1`, fixed `eta in (0,1)`, `Z=X^gamma`, and sharp admissible region | §§1, 3 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| A2 | native anchor block `B={q prime: eta Z<=q<Z}` and exact fixed-ratio prime count, reciprocal mass and inverse-square mass | §§1, 3 | SOURCE-PASS / WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| A3 | exact complete-pair load and square-load identities, including structural factor `1/2` | §§2–3 | UNAFFECTED-VERIFIED |
| A4 | target rows indexed by `S_b`; corrected `tau(b)=sum_(r in S_b)r^-2`; native target-row load and square-load coefficient `eta^(-1)-1` | §3 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| A5 | exact Bernoulli centring `theta Lambda=t`, compact parameter interval and limit `alpha_(t,gamma)` | §3 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| A6 | total actual-family variance with pair term and native fixed-ratio target-row term | §§1, 3, 10 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| A7 | explicit variance regimes: pair provider for `gamma>2`, target-row provider for `gamma=2` and `1<gamma<2`, with coefficient `(eta^(-1)-1)tau(b)` | §§3, 10 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| A8 | exact finite Fourier coefficient, Bernoulli modulus bound, squarefree CRT period and no-wrap capacity | §§2–3 | UNAFFECTED-VERIFIED except fixed-data dependence / INDEPENDENT-AUDIT-PENDING |

## B. Anchor, rows, fibres and coordinate identification

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| B1 | fixed-ratio reciprocal dispersion on `[delta Y,Y)` with a finite `delta`-dependent threshold, exact cold rigidity and zero-exception conclusion | §4 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| B2 | fingerprint rigidity, coherent label, noncoherent tail and weighted anchor partition with constants uniform on compact `eta`-sets | §4 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| B3 | multiplicity-sensitive cyclic-energy lemma | §5 | UNAFFECTED-VERIFIED |
| B4 | lower-prime row distance from `mu_r<=1+(1-eta)Z/r` | §5 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| B5 | target-row distance and observability over `S_b`; numerator creates no new decoder direction | §5 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| B6 | shift-uniform row tails and summed row error | §5 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| B7 | exact denominator-factor partition and unnormalized weighted fibre error | §§3, 5 | UNAFFECTED-VERIFIED except native block endpoints / INDEPENDENT-AUDIT-PENDING |
| B8 | all prime coordinates identified through `M_dec` | §5 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| B9 | target coordinates identified through `T_0=kappa_0(t,gamma,eta,b) min(X^2,Z)` | §5 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |

## C. Universal six-sector positivity

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| C1 | `N=floor(C/sigma_E)=o(T_0)` for every fixed admissible `(gamma,eta)` | §6 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| C2 | total-variance Gaussian sector `N<|m|<=T_0` | §§6–7 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| C3 | prime-only transition `T_0<|m|<=X^2/4` | §6 | UNAFFECTED-VERIFIED except fixed-data constants |
| C4 | adaptive retained-pair damping `X^2/4<|m|<=M_dec`, with the prime interval contained in `[X,eta Z)` | §6 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| C5 | anchor-energy range `|m|>M_dec` and terminal noncoherent/nondecoder sector | §6 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| C6 | pairwise-disjoint exhaustive six-sector partition for every fixed `gamma>1` and `eta in (0,1)` | §6 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| C7 | aggregate Taylor remainder, exact linear cancellation and total-variance Gaussian major | §7 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| C8 | strict terminal budget in parameter order `(t,gamma,eta,b,T), C, X` and positive Fourier numerator | §7 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |

## D. Exactness, characterization and qualitative refinement

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| D1 | positive quotient coefficient followed by deterministic no-wrap direct fixed-target exactness for every fixed `eta` | §8 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| D2 | squarefree least-common-multiple obstruction | §9 | UNAFFECTED-VERIFIED |
| D3 | prime-dilution characterization with successive disjoint finite avoidance; no numerator induction or special `b=1,2` case | §9 | UNAFFECTED-VERIFIED; depends on D1 audit |
| D4 | finite prescription with explicit zero-residual branch and positive-residual extension | §9 | UNAFFECTED-VERIFIED; depends on D1 audit |
| D5 | disjoint realization of finite decompositions | §9 | UNAFFECTED-VERIFIED |
| D6 | row–column transportation and common refinement of finite families | §9 | UNAFFECTED-VERIFIED |
| D7 | local one-block replacement refines but need not be globally proper | §9 | UNAFFECTED-VERIFIED |
| D8 | simultaneous disjoint replacement of every block yields a globally proper refinement | §9 | UNAFFECTED-VERIFIED |
| D9 | countably infinite pairwise-disjoint proper refinement chain with finite prescriptions | §9 | UNAFFECTED-VERIFIED |

## E. Quantitative consequences

| ID | Obligation | Manuscript location | Current status |
|---|---|---|---|
| E1 | quantitative coefficient lower bound from the strict six-sector assembly | §10 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| E2 | sharp fixed-target coefficient from native fixed-ratio total variance and explicit regime corollaries | §10 | WRITER-TRANSPORTED / INDEPENDENT-AUDIT-PENDING |
| E3 | exponential multiplicity and entropy-optimal mesoscopic window | §10 | UNAFFECTED-VERIFIED conditional on E2 |
| E4 | exact entropy optimization over fixed admissible `gamma` | §10 | UNAFFECTED-VERIFIED |
| E5 | exact-cardinality extraction and Hamming-separated macroscopic diversity; `eta` reserved for anchor ratio and diversity exponent renamed `zeta` | §10 | WRITER-TRANSPORTED notation / UNAFFECTED mathematics |
| E6 | balanced signed reciprocal relations with non-minimality boundary | §10 | UNAFFECTED-VERIFIED conditional on E2 |
| E7 | direct denominator-height bounds | §10 | UNAFFECTED-VERIFIED conditional on E2 |
| E8 | quantitative globally proper refinement branching | §10 | UNAFFECTED-VERIFIED conditional on E2 |
| E9 | global quantitative transfer with universal leading rate `2 log 2` | §10 | UNAFFECTED-VERIFIED conditional on E2 |

## F. Boundary and lifecycle obligations

| ID | Obligation | Evidence | Current status |
|---|---|---|---|
| F1 | no live `B=[Z/2,Z)` normalization, no standalone fixed-ratio annex and no normalization sentence `eta=1/2` | source search and file inventory at writer return | WRITER VALIDATION REQUIRED |
| F2 | every remaining `1/2` classified as structural pair identity, centred CRT fundamental domain, phase cutoff, Gaussian/entropy normalization or other unrelated quantity | source search and writer return | WRITER VALIDATION REQUIRED |
| F3 | `eta` uniquely denotes the anchor ratio in the article; former Hamming exponents renamed | source search and label gate | WRITER VALIDATION REQUIRED |
| F4 | exact-head clean TeX/Biber build, citations/references/labels, embedded fonts and no Type 3 | final manuscript workflow | PENDING FINAL HEAD |
| F5 | unchanged Lean workflow passes | final Lean workflow | PENDING FINAL HEAD |
| F6 | separate independent whole-article mathematical and naturalness audit | later one-off read-only role | INDEPENDENT-AUDIT-PENDING |
| F7 | any refreeze or publication gate separately authorized at its exact head | Owner disposition | PUBLICATION-GATE-PENDING |

## Acceptance boundary

PC-005 is a writer-produced Class-B whole-article reparameterization. Mechanical success and this ledger do not constitute independent mathematical acceptance. The successor may advance only to the separately authorized whole-article mathematical and naturalness audit. No readiness, merge, refreeze, licence, release, DOI, Zenodo, arXiv or journal action is authorized here.
