# Addendum — optimality against arbitrary irregular single-scale sensors

**Controls:** `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_V1.md`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL STRENGTHENING / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

The original theorem was stated for a common high-column multiset used against
every low modulus.  The universal lower bound does not require that restriction.
It holds row by row and therefore applies to an arbitrary irregular bipartite
sensor graph at one physical scale.

## 1. Irregular model

Let `R` be a nonempty finite set of primes.  For each `r in R`, let `S_r` be a
finite multiset of integers in `[Y,2Y]`, each coprime to `r`.  The multisets may
be unrelated for different `r`; repetitions and unequal row degrees are
allowed.

Put

\[
 M_r=|S_r|,
\]

and define

\[
 D_r
 =\min_{d\in(\mathbb Z/r\mathbb Z)^\times}
   \sum_{s\in S_r}\left\|\frac{d s^{-1}}r\right\|^2,
 \qquad
 D_*=\min_{r\in\mathcal R}D_r.
 \tag{1.1}
\]

The total reciprocal and square loads of the irregular graph are

\[
 \Lambda
 =\sum_{r\in\mathcal R}\sum_{s\in S_r}\frac1{rs},
 \qquad
 W_2
 =\sum_{r\in\mathcal R}\sum_{s\in S_r}\frac1{r^2s^2}.
 \tag{1.2}
\]

As before, write

\[
 H_1(\mathcal R)=\sum_{r\in\mathcal R}\frac1r,
 \qquad
 H_2(\mathcal R)=\sum_{r\in\mathcal R}\frac1{r^2}.
\]

## 2. Rowwise energy ceiling

For each row, averaging over nonzero multipliers gives

\[
 D_r\le\frac{M_r}{4}.
 \tag{2.1}
\]

(The sharper constant is `(r+1)/(12r)` for odd `r`.)  Hence uniform distance
`D_*` forces

\[
 M_r\ge4D_*
 \qquad(r\in\mathcal R).
 \tag{2.2}
\]

Every row must pay for enough columns; columns used elsewhere cannot compensate
for a deficient row.

## 3. Irregular load obstruction

Since `Y<=s<=2Y`,

\[
 \sum_{s\in S_r}\frac1{rs}
 \ge\frac{M_r}{2rY},
 \qquad
 \sum_{s\in S_r}\frac1{r^2s^2}
 \ge\frac{M_r}{4r^2Y^2}.
\]

Using (2.2) and summing over `r` gives:

### Theorem 3.1 — irregular single-scale load--distance bound

For every irregular scale-`Y` sensor graph,

\[
 \boxed{
 \Lambda\ge\frac{2H_1(\mathcal R)}Y D_*,
 }
 \tag{3.1}
\]

and

\[
 \boxed{
 W_2\ge\frac{H_2(\mathcal R)}{Y^2}D_*.
 }
 \tag{3.2}
\]

These are exactly the bounds obtained in the common-column theorem.

## 4. Consequence for the prime block

The complete prime-block graph has

\[
 D_*\asymp\frac Y{\log Y},
 \qquad
 \Lambda\asymp\frac{H_1(\mathcal R)}{\log Y},
 \qquad
 W_2\asymp\frac{H_2(\mathcal R)}{Y\log Y}.
\]

Therefore it attains (3.1)--(3.2) up to constants even when compared with the
larger class of all irregular row-dependent scale-`Y` designs.

### Strengthened optimality statement

Within a fixed dyadic high scale `[Y,2Y]`, and under a worst-row cyclic-distance
requirement, no choice of:

- different columns for different moduli;
- unequal row degrees;
- sparse or irregular incidence;
- repeated columns;

can improve the order of either reciprocal or inverse-square load over the
complete prime-block reservoir.

Density of the prime-block graph is therefore not an avoidable source of load at
this scale.  Any sparse design with the same uniform distance must retain the
same total load order, even if it uses fewer shared columns and more
row-specific columns.

## 5. Remaining escape routes

The strengthened theorem still permits genuinely different mechanisms:

1. multiscale columns, where different rows use substantially different physical
   denominator scales;
2. nonuniform edge weights or non-Bernoulli kernels;
3. cancellation-based estimates that do not require absolute-value cyclic
   distance in every row;
4. average-over-row rather than worst-row performance;
5. adaptive designs depending on the external quotient assignment.

Thus the next design frontier is multiscale or cancellation-based.  Merely
sparsifying a single-scale incidence graph cannot improve the load order.

No Lean, proof-development, corpus, manuscript, review, release, DOI, or
publication status changes through this addendum.
