# RL to PDL handoff addendum — one-anchor sparse Gibbs route

**From:** `Erdős 306 — Research Lead` (`E306-RL`)  
**To:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Date:** 2026-07-22  
**Status:** `EXACT PROOF-DEVELOPMENT HANDOFF / RESEARCH AUTHORITY ONLY`

## Exact research sources

Consume the exact branch checkpoint containing:

1. `SPARSE_GIBBS_ANCHOR_AND_CRITICAL_SCALE_V1.md`;
2. `SPARSE_GIBBS_ANCHOR_AUDIT_ADDENDUM_01.md`;
3. `SPARSE_BLOCK_ENTROPY_VARIANCE_BARRIER_V1.md`;
4. `ONE_ANCHOR_RECIPROCAL_LABEL_SENSOR_V1.md`.

The controlling research conclusion is now the one-anchor all-prefix candidate

\[
 \gamma_N\ll p_N^{-1/4}(\log p_N)^{5/4}.
\]

This supersedes the `2/9` and `1/(log p)^2` routes only as the strongest current
research candidate.  It changes no released, manuscript, formalization,
review, corpus, DOI, or publication authority.

## Proof unit A — moving SBEE entropy

Verify that the explicit Theorem A / Theorem C thresholds permit the
scale-dependent choice

\[
 \varepsilon_Z=KZ^{-1/4}(\log Z)^{13/4}
\]

and yield, uniformly for all `R>=1`,

\[
 \#\{a:Q_B(a)\le R\}
 \le20e^{\varepsilon_ZR}
 \left(1+\frac{\sqrt R}{\sigma_B}\right).
\]

Check every threshold dependency and confirm that substituting moving
`eps=eps(Z)` introduces no circular quantifier.

## Proof unit B — Gibbs edge sparsification

For Bernoulli edge sampling with

\[
 \rho=C\varepsilon_Z,
\]

verify:

1. the product expectation
   \[
   \mathbb E e^{-cQ_S(a)}\le e^{-\kappa\rho Q_B(a)};
   \]
2. shell summation over the noncoherent floor
   `F_Z asymp Z/(log Z)^3`;
3. simultaneous positive-probability events for reciprocal load, square load,
   and noncoherent partition;
4. the resulting deterministic top graph scales
   \[
   \Lambda_B\ll Z^{-1/4}(\log Z)^{5/4},
   \qquad
   \sigma_B^2\asymp Z^{-9/4}(\log Z)^{5/4}.
   \]

## Proof unit C — dual-purpose top-prime sample

Verify the reciprocal-label population lemma:

\[
 \frac1{|B|}\sum_{q\in B}
 \left\|\frac m{2q}+\frac x2\right\|^2
 \gg(\log Z)^{-2}
\]

uniformly for

\[
 Z/\log Z\le|m|\le Z^{9/8},
 \qquad x\in\{0,1\}.
\]

The proof is by covering all `q` for which `m/q` lies within `O(1/log Z)` of
an integer of prescribed parity; the total interval length is `O(Z/log Z)`
with a sufficiently small constant.

Then verify one sampling-without-replacement event of size
`C(log Z)^3` simultaneously preserves:

1. every lower-coordinate inverse test `(r,d)`;
2. every outer-label test `(m,x)`.

Record the exact Bernstein/Serfling inequality used.

## Proof unit D — near-diagonal mass strip

Verify that semiprimes with

\[
 Z\le pq\le4Z
\]

have reciprocal capacity `gg 1/(log Z)^2`, for example through

\[
 p\in[Z^{1/3},2Z^{1/3}],
 \qquad q\in[Z/p,2Z/p].
\]

Check edge uniqueness, disjointness from control/sensor families, greedy
overshoot, and

\[
 V\asymp q/Z
\]

in the lowest tuned range.

## Proof unit E — four-lane Fourier assembly

Verify the exhaustive split:

1. `|m|<=M_0/sqrt(V)`: positive Taylor/Gaussian main arc;
2. `M_0/sqrt(V)<|m|<Z/log Z`: full-variance modulus tail;
3. `Z/log Z<=|m|<=D sqrt(log Z)/sigma_B`: reciprocal-label sensor tail;
4. top-anchor coherent outer tail plus noncoherent sparse-anchor sector.

Also verify:

- correct lower residues remain decoded in Lanes 1--2;
- both `r=2` residue choices are suppressed in Lane 3;
- the top-anchor label range lies inside `O(Z^(9/8))`;
- no-wrap exactness;
- overlap with Li's central band;
- the theorem is direct for every sufficiently large prefix `N`, not a dyadic
  recurrence statement.

## Return rule

Ordinary constant, endpoint, source, probability, and correspondence repairs
remain in PDL.  Return to E306-RL only if one of the five units fails as a
mathematical implication.  State the smallest exact failed theorem, not a broad
request to re-audit the route.
