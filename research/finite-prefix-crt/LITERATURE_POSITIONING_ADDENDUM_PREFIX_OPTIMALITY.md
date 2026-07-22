# Literature-positioning addendum — prefix-bounded optimality

**Controls:** `LITERATURE_POSITIONING_PRODUCT_CODE_PEIERLS_V1.md`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `CONTROLLING UPDATE / NOVELTY NOT CERTIFIED`  
**Date:** 2026-07-22

The initial literature note predated the irregular and prefix-bounded optimality
addenda.  Two questions listed there have now been resolved mathematically and
the novelty candidate must be stated in its stronger form.

## 1. Superseded open questions

The initial note asked:

1. whether the common-column lower bound extends to irregular bipartite graphs;
2. whether multiscale placement can beat the single-scale reciprocal-load order.

Both questions are closed at the argument level under the uniform worst-row
absolute cyclic-distance interface.

`PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_IRREGULAR.md` allows unrelated
row-dependent column multisets, unequal degrees, repetitions, and arbitrary
sparse incidence.

`PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_PREFIX_BOUNDED.md` further allows
arbitrary mixing of all physical scales below a common prefix ceiling `Z`.

Every such design satisfies

\[
 \Lambda\ge\frac{4H_1(\mathcal R)}Z D_*,
 \qquad
 W_2\ge\frac{4H_2(\mathcal R)}{Z^2}D_*.
\]

The top prime block attains both orders.

## 2. Strengthened literature-comparison target

The self-contained theorem to compare against prior work is no longer merely a
common-reservoir trade-off.  It is:

> **Prefix-bounded arithmetic sensing.**  Among all irregular, row-dependent,
> multiscale sensor graphs realized below a fixed arithmetic prefix, the top
> prime block is constant-factor optimal simultaneously for reciprocal and
> inverse-square load, provided performance is measured by the minimum cyclic
> energy over all low rows.

The proof combines:

1. an exact rowwise average-energy ceiling;
2. a trivial but sharp prefix load floor;
3. PNT abundance;
4. Brun--Titchmarsh residue-multiplicity control.

No direct statement of this combined prefix-optimality theorem was located in
the initial searches of code smoothing, small-bias spaces, modular-inverse
distribution, weighted Bernoulli local limits, or finite-abelian subset sums.
This remains evidence for further search, not a priority claim.

## 3. Revised genuine frontiers

The remaining ways to beat the theorem must change the interface rather than the
incidence geometry alone:

1. joint decoding of low coordinates instead of rowwise absolute compression;
2. oscillatory cancellation rather than `L^1` control;
3. average-row or exceptional-row performance instead of worst-row distance;
4. adaptive sensors depending on quotient data;
5. nonuniform weighted kernels whose row energy is not bounded by a constant
   times edge count;
6. a second non-semiprime consumer establishing that decoded-skeleton transfer
   is more than one application-specific architecture.

## 4. Publication assessment unchanged

The strengthened optimality theorem is the cleanest independent mathematical
unit currently available, but publication or novelty status still requires a
systematic expert literature review and preferably a second consumer or a
larger weighted/joint-decoding theory.

No bibliographic completeness, priority, corpus, release, manuscript,
formalization, review, DOI, or publication status is claimed.
