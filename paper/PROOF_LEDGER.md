# Erdős 306 manuscript proof ledger

Workstream: `E306-P1-01`  
Revision checkpoint: `paper/arxiv-v1@c264d00a722364c777d89e4438aadc7babfcdbe0`  
Paper backend selected by `E306-DIR`: prime number theorem, followed by a self-contained Abel/partial-summation bridge.  
Current archived formal evidence: `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`, DOI `10.5281/zenodo.20767390`.

## 1. Evidence vocabulary

- **PAPER-EXTERNAL** — a standard external theorem cited and stated in the article.
- **PAPER-PROVED** — a complete mathematical derivation is supplied in the article.
- **PAPER-ASSEMBLED** — the article combines preceding proved statements into the named conclusion.
- **RELEASE-CHECKED** — the exact declaration is accepted by the Lean kernel at immutable release `v0.0.3`.
- **SOURCE-TRANSCRIBED-FORMAL** — an external theorem is represented as a named axiom in `v0.0.3` with an exact source locator.
- **FROZEN-CONTEXT** — a later, unreleased development checkpoint gives the mathematical principle, module boundary, or proof architecture used for exposition.
- **REVIEW-GATED** — independent mathematical, source, formal, or publication review remains open.

The paper proof and the current formal proof have different analytic backends. The paper invokes the prime number theorem and proves its construction-facing consequences. The immutable release invokes two exact Rosser--Schoenfeld statements. Neither status is silently transferred to the other.

## 2. Analytic and arithmetic spine

### P0 — Squarefree semiprimes

**Statement.** An integer is a squarefree semiprime exactly when it is the product of two distinct primes; equivalently, `ω(n)=Ω(n)=2`.

**Manuscript.** Section 1.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.  
**Formal location.** The released headline theorem records `Nat.omega (n i)=2` and `Nat.Omega (n i)=2`; the frozen architecture packages the denominator condition through the construction certificates.

### P1 — Necessity of a squarefree reduced denominator

**Statement.** A finite sum of reciprocals of squarefree integers has squarefree reduced denominator.

**Manuscript.** Section 1.  
**Proof.** The reduced denominator divides the least common multiple of the summand denominators, which is squarefree.  
**Status.** PAPER-PROVED.

### P2 — Avoiding unit numerator implies arbitrary numerator

**Statement.** If every finite obstruction set can be avoided while representing `1/b`, then every positive integer multiple `a/b` has an avoiding representation.

**Manuscript.** Lemma `lem:numerator-reduction`.  
**Proof.** Induction, enlarging the obstruction set by each previously chosen finite denominator set.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.  
**Frozen context.** `RequestProject.Core.UnitNumeratorReduction`.

### P3 — Small denominators

**Statement.** The avoiding assertion for squarefree `b≥3` implies it for `b=1,2`.

**Manuscript.** Lemma `lem:small-b`.  
**Proof.** Use `1/2=1/3+1/6` and `1=1/2+1/3+1/6`, choosing the component representations successively and disjointly.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.

### P4 — Prime number theorem

**Statement.** `π(x)~x/log x`.

**Manuscript.** Section `sec:PNT`, equation `eq:PNT`.  
**Source.** Soundararajan, Lecture 1, opening paragraph, p. 1; Ingham, Theorem 23.  
**Status.** PAPER-EXTERNAL.  
**Formal status.** Not an axiom or imported theorem of `v0.0.3`; not claimed to be formalized by the project.

### P5 — Abel summation on a dyadic interval

**Statement.** For the prime-counting step function,

`Σ_{x<p≤2x} 1/p = π(2x)/(2x) - π(x)/x + ∫_x^{2x} π(t)/t² dt`.

**Manuscript.** The proof of Proposition `prop:local-law`, equation `eq:abel`.  
**Status.** PAPER-PROVED.

### P6 — Local reciprocal-prime law

**Statement.** PNT implies

`Σ_{x≤p<2x} 1/p = log 2/log x + o(1/log x)`.

**Manuscript.** Proposition `prop:local-law`, equation `eq:local-law-x`.  
**Proof.** Insert the uniform PNT error on `[x,2x]` into P5; the integral gives `log(log(2x)/log x)`, while the boundary contribution is `o(1/log x)`. Endpoint changes are `O(1/x)`.  
**Status.** PAPER-PROVED.

### P7 — Dyadic form of the local law

**Statement.** For `P_k={p:2^k≤p<2^(k+1)}` and `A_k=Σ_{p∈P_k}1/p`, one has `A_k=1/k+o(1/k)`.

**Manuscript.** Proposition `prop:local-law`, equation `eq:local-law-k`.  
**Status.** PAPER-PROVED.

### P8 — Eventual dyadic cardinality supply

**Statement.** There is `K_D` such that for every `k≥K_D`,

`|P_k|≥2^k/(2 log(2^k))`.

**Manuscript.** Proposition `prop:local-to-supply`, first half of its proof.  
**Proof.** Since `A_k≤|P_k|/2^k` and eventually `A_k≥0.9/k`, while `0.9>1/(2 log 2)`.  
**Status.** PAPER-PROVED.  
**Qualification.** The fixed formal cutoff `k≥5` is not asserted as a consequence of PNT and is not needed by the constant-first/scale-last paper construction.

### P9 — Eventual inclusive-window reciprocal mass

**Statement.** There is `K_M` such that for all `k_0≥K_M`,

`Σ_{k=k_0}^{3k_0} A_k≥21/20`.

**Manuscript.** Proposition `prop:local-to-supply`, second half of its proof.  
**Proof.** Eventually `A_k≥0.98/k`; the inclusive harmonic window tends to `log 3`, and `0.98 log 3>21/20`.  
**Endpoint.** The corresponding prime interval is exactly `[2^{k_0},2^{3k_0+1})`.  
**Status.** PAPER-PROVED.

### P10 — Structural analytic package

**Statement.** The two eventual supplies P8 and P9 are sufficient for the construction.

**Manuscript.** Definitions `def:D` and `def:M`, plus the scale-last explanation before Theorem `thm:structural-construction`.  
**Proof.** Every use occurs after finitely many constants and thresholds have been fixed; the final `k_0` is taken above `K_D`, `K_M`, and the remaining thresholds.  
**Status.** PAPER-PROVED / FROZEN-CONTEXT.

## 3. Finite spectral construction

### P11 — Structural avoiding construction

**Statement.** Under the eventual supplies, every squarefree `b≥3` and finite `T` admit a representation of `1/b` by distinct squarefree semiprimes avoiding `T`.

**Manuscript.** Theorem `thm:structural-construction`; Sections `sec:spectral`--`sec:terminal`.  
**Status.** PAPER-ASSEMBLED / RELEASE-CHECKED / FROZEN-CONTEXT.  
**Review gate.** Independent review of P17--P32 remains open.

### P12 — Finite Fourier identity

**Statement.** The weighted count of subsets satisfying the residue condition is the finite Fourier sum in equation `eq:finite-fourier`.

**Manuscript.** Section `sec:spectral`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.  
**Frozen context.** `RequestProject.CircleMethod.ReciprocalSelection`.

### P13 — Finite spectral selection

**Statement.** A real main contribution strictly exceeding the total minor absolute mass forces a positive weighted subset count.

**Manuscript.** Lemma `lem:spectral-selection`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.  
**Frozen context.** `RequestProject.CircleMethod.ReciprocalSelection`.

### P14 — No-wrap conversion

**Statement.** If the total available reciprocal load is below one, the congruence modulo the common period is equivalent to exact reciprocal equality.

**Manuscript.** Equation `eq:no-wrap` and following paragraph.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.

### P15 — Exact CRT energy identity

**Statement.** A frequency's phase distance on a control denominator equals the normalized centered CRT representative, and control energy is bounded by full edge energy.

**Manuscript.** Equations `eq:Qctrl` and `eq:control-full-energy`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED / FROZEN-CONTEXT.

### P16 — Control load and variance scale

**Statement.** The control family has reciprocal load below `3/(4b)` and variance scale bounded below by an explicit block expression.

**Manuscript.** Equations `eq:sctrl-lower` and `eq:control-load`.  
**Status.** PAPER-PROVED at the handoff level / RELEASE-CHECKED.  
**Review gate.** Detailed elementary block-count constants remain part of the independent construction review.

### P17 — Cold-block structure

**Statement.** A low-energy block has one dominant integer label and energy-charged exceptions, with a controlled encoding count.

**Manuscript.** Lemma `lem:cold-block` and mechanism proof.  
**Status.** PAPER-PROVED at full mechanism level / FROZEN-CONTEXT / REVIEW-GATED.

### P18 — Adjacent-label mismatch penalty

**Statement.** Distinct dominant labels on adjacent cold blocks force a definite boundary energy.

**Manuscript.** Lemma `lem:boundary-penalty`.  
**Status.** PAPER-PROVED at full mechanism level / FROZEN-CONTEXT / REVIEW-GATED.

### P19 — Global level-set bound

**Statement.** The number of assignments of energy at most `R` is bounded by

`exp(AJ) exp(8εR) (1+sqrt(R)/σ_ctrl)`.

**Manuscript.** Lemma `lem:level-set`.  
**Status.** PAPER-PROVED / FROZEN-CONTEXT / REVIEW-GATED.

### P20 — Localization dichotomy

**Statement.** An off-main assignment either lies above the global forcing floor or is a diagonal assignment outside the label window.

**Manuscript.** Lemma `lem:localization`.  
**Status.** PAPER-PROVED / FROZEN-CONTEXT / REVIEW-GATED.

### P21 — High-floor Laplace absorption

**Statement.** After the base scale is sufficiently large, the Laplace mass above the forcing floor is at most `η/σ_ctrl`.

**Manuscript.** Lemma `lem:floor-laplace`.  
**Status.** PAPER-PROVED / FROZEN-CONTEXT / REVIEW-GATED.

### P22 — Diagonal Gaussian tail

**Statement.** The diagonal sector outside the main label window contributes at most `C_tail exp(-cC²/2)/σ_ctrl`.

**Manuscript.** Lemma `lem:diagonal-tail`.  
**Status.** PAPER-PROVED / FROZEN-CONTEXT / REVIEW-GATED.

### P23 — Global control partition

**Statement.** The off-main assignment Laplace mass satisfies equation `eq:global-partition`.

**Manuscript.** Theorem `thm:global-partition`, assembled from P20--P22.  
**Status.** PAPER-ASSEMBLED / RELEASE-CHECKED / FROZEN-CONTEXT / REVIEW-GATED.

### P24 — Pair-pool reciprocal identity and lower mass

**Statement.** The reciprocal load of products of distinct primes is `(S_1²-S_2)/2`, and the eventual window mass yields at least `1/2` for all sufficiently large `k_0`.

**Manuscript.** Equations `eq:pair-mass-id` and `eq:pair-mass-half`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.

### P25 — Greedy reciprocal window

**Statement.** Positive terms of total mass at least `t` and individual size below `g` contain a subset of sum in `[t,t+g)`.

**Manuscript.** Lemma `lem:greedy-window`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.

### P26 — Uniform load and variance window

**Statement.** The selected edge family has total reciprocal load in `[3/(2b),3/b)`, uniform Bernoulli weight in `(1/3,2/3]`, exact expected reciprocal sum `1/b`, and comparable variance scales.

**Manuscript.** Equations `eq:load-window`--`eq:variance-comparison`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED / FROZEN-CONTEXT.

### P27 — Main-arc Taylor and Gaussian lower bound

**Statement.** The centered Bernoulli characteristic function has a uniform third-order expansion, and the real main sum is at least `c_3/σ_E`.

**Manuscript.** Equations `eq:main-expansion`--`eq:main-lower`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED / FROZEN-CONTEXT / REVIEW-GATED.

### P28 — Fourier energy upper bound

**Statement.** Every Fourier factor product is bounded by `exp(-(16/9)Q_E(h))`.

**Manuscript.** Equation `eq:fourier-energy`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.

### P29 — Block-minor fiber estimate

**Statement.** Fixing block residues leaves at most `b` frequencies modulo `L`; reindexing the residual energy over fibers gives equation `eq:block-budget`.

**Manuscript.** Section `sec:block-minor`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED / FROZEN-CONTEXT / REVIEW-GATED.  
**Critical detail.** The factor `b` is explicit CRT multiplicity, not hidden in asymptotic notation.

### P30 — Squarefree sibling mismatch

**Statement.** A non-main frequency in a main block fiber differs from the label modulo at least one prime divisor of squarefree `b`.

**Manuscript.** Lemma `lem:sibling-mismatch`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED.

### P31 — Reservoir damping

**Statement.** Each mismatch prime, paired with `G` high reservoir primes, supplies a product contraction `β_b^G`, and the total extra-sector mass obeys equation `eq:extra-budget`.

**Manuscript.** Section `sec:extra`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED / FROZEN-CONTEXT / REVIEW-GATED.

### P32 — Terminal parameter compatibility

**Statement.** Choosing `η`, then `C`, then `D_mp`, then `G`, and only then `k_0`, makes the main Gaussian contribution strictly exceed both minor sectors through one terminal budget.

**Manuscript.** Section `sec:terminal`, especially `eq:terminal-budget`.  
**Status.** PAPER-PROVED / RELEASE-CHECKED / FROZEN-CONTEXT / REVIEW-GATED.

### P33 — Headline theorem

**Statement.** A positive rational is a finite sum of reciprocals of distinct squarefree semiprimes if and only if its reduced denominator is squarefree.

**Manuscript.** Theorem `thm:headline`.  
**Derivation.** P4--P10 supply P11; P11 with P2 and P3 gives sufficiency; P1 gives necessity.  
**Status.** PAPER-ASSEMBLED / RELEASE-CHECKED.  
**Released declaration.** `Erdos306.erdos_306` in `v0.0.3` under its historical module path.  
**Exact released nonstandard axioms.** `RosserSchoenfeld.rosser_schoenfeld_cor3` and `RosserSchoenfeld.rosser_schoenfeld_thm5`.

## 4. Open gates

1. Independent mathematical review of P17--P23 and P27--P32.
2. Independent check of the PNT-to-local-law partial-summation derivation and its endpoint conventions.
3. Human-visible comparison of the two released Rosser--Schoenfeld source transcriptions with the publisher scan.
4. Detached exact-tip verification and disposition of the frozen development checkpoint.
5. Author metadata, disclosure, licence, category, acknowledgements, and ancillary-file decisions.
6. Final clean source-package audit and explicit author/E306-DIR submission authorization.
