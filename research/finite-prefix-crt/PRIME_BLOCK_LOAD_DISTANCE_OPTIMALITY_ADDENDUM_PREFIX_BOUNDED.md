# Addendum — optimality against all prefix-bounded sensor designs

**Controls:** `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_V1.md` and
`PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_IRREGULAR.md`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL STRENGTHENING / CONTROLLING OPTIMALITY FORM`  
**Date:** 2026-07-22

The preceding addendum allowed arbitrary irregular incidence but kept every
column in one dyadic scale `[Y,2Y]`.  The same argument needs only an upper bound
on column size.  It therefore controls every multiscale design inside a fixed
prefix.

This addendum supersedes the statement that multiscale placement is an escape
route from the load lower bound.  It is not, as long as performance is measured
by worst-row absolute cyclic distance and all columns remain below one common
prefix ceiling.

## 1. Prefix-bounded irregular model

Let `R` be a nonempty finite set of primes.  For each `r in R`, let `S_r` be a
finite multiset of positive integers, each coprime to `r`, satisfying

\[
 s\le Z\qquad(s\in S_r).
 \tag{1.1}
\]

No common lower scale is assumed.  Different rows may use entirely different
columns and arbitrary mixtures of scales.

Put

\[
 M_r=|S_r|,
\]

\[
 D_r
 =\min_{d\in(\mathbb Z/r\mathbb Z)^\times}
   \sum_{s\in S_r}\left\|\frac{d s^{-1}}r\right\|^2,
 \qquad
 D_*=\min_{r\in\mathcal R}D_r,
 \tag{1.2}
\]

and

\[
 \Lambda
 =\sum_{r\in\mathcal R}\sum_{s\in S_r}\frac1{rs},
 \qquad
 W_2
 =\sum_{r\in\mathcal R}\sum_{s\in S_r}\frac1{r^2s^2}.
 \tag{1.3}
\]

As before,

\[
 H_1(\mathcal R)=\sum_{r\in\mathcal R}\frac1r,
 \qquad
 H_2(\mathcal R)=\sum_{r\in\mathcal R}\frac1{r^2}.
\]

## 2. Universal prefix obstruction

Averaging over nonzero multipliers gives rowwise

\[
 D_r\le\frac{M_r}{4},
\]

so

\[
 M_r\ge4D_*.
 \tag{2.1}
\]

The prefix ceiling gives

\[
 \sum_{s\in S_r}\frac1{rs}
 \ge\frac{M_r}{rZ},
 \qquad
 \sum_{s\in S_r}\frac1{r^2s^2}
 \ge\frac{M_r}{r^2Z^2}.
\]

Therefore:

### Theorem 2.1 — prefix-bounded load--distance theorem

Every prefix-bounded irregular sensor design satisfies

\[
 \boxed{
 \Lambda\ge\frac{4H_1(\mathcal R)}Z D_*,
 }
 \tag{2.2}
\]

and

\[
 \boxed{
 W_2\ge\frac{4H_2(\mathcal R)}{Z^2}D_*.
 }
 \tag{2.3}
\]

The theorem allows:

- arbitrary row-dependent column sets;
- unequal row degrees;
- repeated columns;
- arbitrary sparse incidence;
- arbitrary mixing of all scales below `Z`.

None improves the order of load required for a prescribed uniform cyclic
distance.

## 3. Matching top-block realization

Take the top prime block

\[
 \mathcal S_Z=\{s\text{ prime}:Z/2<s\le Z\}
\]

and use it against every low prime `r<=sqrt(Z/2)`.  PNT plus
Brun--Titchmarsh gives

\[
 D_*\asymp\frac Z{\log Z}.
\]

The loads are

\[
 \Lambda\asymp\frac{H_1(\mathcal R)}{\log Z},
 \qquad
 W_2\asymp\frac{H_2(\mathcal R)}{Z\log Z}.
\]

Thus

\[
 \boxed{
 D_*\asymp\frac Z{H_1(\mathcal R)}\Lambda
       \asymp\frac{Z^2}{H_2(\mathcal R)}W_2.
 }
 \tag{3.1}
\]

The top-block complete bipartite reservoir attains the universal
prefix-bounded lower bounds up to absolute constants.

### Corollary 3.1 — prefix-optimality

Among all sensor architectures whose realizing columns remain inside a fixed
prefix and whose analysis requires a uniform worst-row cyclic distance, the top
prime block is simultaneously constant-factor optimal for reciprocal load and
inverse-square load.

This includes all single-scale, multiscale, common-column, row-dependent,
complete, sparse, and irregular incidence patterns.

## 4. Consequence for sparse design

A sparse design can still reduce the number of *distinct* high columns or alter
incidence geometry, which may matter computationally or for prefix coverage.
But it cannot improve the total reciprocal or square load order while preserving
the same worst-row distance.

In particular, the dense prime block is not analytically wasteful.  Its apparent
edge abundance is exactly what the universal rowwise energy ceiling forces in
aggregate.

## 5. Genuine escape routes

To beat the theorem one must leave at least one hypothesis:

1. replace worst-row distance by an average or exceptional-row criterion;
2. exploit oscillatory cancellation rather than absolute-value compression;
3. allow sensors above the prefix ceiling;
4. use adaptive sensors depending on the external quotient assignment;
5. use kernels or weighted edges for which energy is not bounded by a constant
   times row degree;
6. abandon independent rowwise decoding and analyze the low coordinates jointly.

These are now the genuine design frontiers.  Multiscale placement alone is not.

No Lean, proof-development, corpus, manuscript, review, release, DOI, or
publication status changes through this addendum.
