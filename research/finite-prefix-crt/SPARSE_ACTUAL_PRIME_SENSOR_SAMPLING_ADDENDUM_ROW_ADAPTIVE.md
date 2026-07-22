# Addendum — row-adaptive actual-prime sensors attain the prefix load bound

**Controls:** `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_V1.md` and
`PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_PREFIX_BOUNDED.md`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / SHARP GENERAL THEOREM STRENGTHENING / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

The common sample in the controlling sparse-sensor note minimizes the number of
distinct high primes: one set of `O(log Z)` actual top-block primes serves every
low modulus.  Its reciprocal load contains an extra harmonic factor
`log log Z` because every row has the same degree.

If row-dependent actual-prime samples are allowed, the degrees can be matched to
the row entropy.  This attains the universal prefix-bounded reciprocal-load lower
bound at the distance required for product-fibre compression.

## 1. Population input

Retain

\[
 Z=2^{2k+1},\qquad X=\sqrt{Z/2},
\]

and the actual top prime block

\[
 \mathcal S_Z=\{s:Z/2<s<Z,\ s\text{ prime}\}.
\]

For every prime `r<X` and nonzero `d mod r`, the full population satisfies

\[
 \frac1{|\mathcal S_Z|}
 \sum_{s\in\mathcal S_Z}
 \left\|\frac{d s^{-1}}r\right\|^2
 \ge c_0
 \tag{1.1}
\]

with one absolute `c_0>0`.

## 2. Row-dependent logarithmic samples

For each low prime `r<X`, choose independently and uniformly without replacement
an `M_r`-element subset

\[
 \mathcal T_r\subset\mathcal S_Z.
\]

Let

\[
 M_r=
 \left\lceil
 C_1\log r+C_2\log\log Z
 \right\rceil,
 \tag{2.1}
\]

where `C_1,C_2` are sufficiently large absolute constants.

For a fixed nonzero `d mod r`, multiplicative lower-tail concentration for
sampling without replacement gives

\[
 \Pr\left(
 \sum_{s\in\mathcal T_r}
 \left\|\frac{d s^{-1}}r\right\|^2
 <\frac{c_0}{2}M_r
 \right)
 \le e^{-c_1M_r}.
 \tag{2.2}
\]

A union bound over the `r-1` nonzero multipliers shows that there exists a
deterministic `\mathcal T_r` satisfying

\[
 D_r:=
 \min_{d\ne0\bmod r}
 \sum_{s\in\mathcal T_r}
 \left\|\frac{d s^{-1}}r\right\|^2
 \ge c_2M_r.
 \tag{2.3}
\]

The rows are chosen separately, so no union bound over all low primes is needed
for existence.

Choose the constants so that the shifted one-row sibling error obeys

\[
 \delta_r
 :=r\exp(-c_3D_r)
 \le\frac1{r^2(\log Z)^2}.
 \tag{2.4}
\]

Then

\[
 \sum_{r<X\atop r\text{ prime}}\delta_r=o(1),
 \tag{2.5}
\]

and the full low product fibre again costs `1+o(1)` uniformly in arbitrary
external phases.

### Theorem 2.1 — row-adaptive actual-prime sensing

There are actual-prime subsets `\mathcal T_r subset \mathcal S_Z` with

\[
 |\mathcal T_r|
 =O(\log r+\log\log Z)
\]

such that the sensor graph

\[
 E_{\rm sens}^{\rm adapt}
 =\{rs:r<X,\ r\text{ prime},\ s\in\mathcal T_r\}
\]

eliminates the entire low CRT product fibre with multiplicative cost `1+o(1)`.

## 3. Sharp reciprocal load

Since every `s>Z/2`,

\[
 \Lambda_{\rm sens}^{\rm adapt}
 \le\frac2Z
 \sum_{r<X\atop r\text{ prime}}\frac{M_r}{r}.
\]

Mertens' law and partial summation give

\[
 \sum_{r<X\atop r\text{ prime}}\frac{\log r}{r}
 =\log X+O(1),
\]

and

\[
 \sum_{r<X\atop r\text{ prime}}\frac1r
 =\log\log X+O(1).
\]

Therefore

\[
 \boxed{
 \Lambda_{\rm sens}^{\rm adapt}
 =O\left(\frac{\log Z}{Z}\right).
 }
 \tag{3.1}
\]

The term

\[
 \frac{(\log\log Z)^2}{Z}
\]

is lower order.

The square load satisfies

\[
 W_{2,{\rm sens}}^{\rm adapt}
 \le\frac4{Z^2}
 \sum_{r<X\atop r\text{ prime}}\frac{M_r}{r^2}
 =O\left(\frac{\log\log Z}{Z^2}\right).
 \tag{3.2}
\]

Both remain negligible relative to the high-control scales.

## 4. Matching the prefix-bounded lower bound

The universal prefix-bounded theorem says that a row `r` with cyclic distance
`D_r` must pay at least

\[
 \Lambda_r\ge\frac{4D_r}{rZ}.
 \tag{4.1}
\]

For product-fibre compression the natural entropy-matched requirement is

\[
 D_r\asymp\log r+\log\log Z.
 \tag{4.2}
\]

Summing (4.1) over the low primes gives the lower-bound order

\[
 \frac1Z
 \sum_{r<X\atop r\text{ prime}}
 \frac{\log r+\log\log Z}{r}
 \asymp\frac{\log Z}{Z}.
 \tag{4.3}
\]

The row-adaptive construction attains this order.

### Corollary 4.1 — application-scale optimality

Within the prefix-bounded, independent-row, absolute-value compression
interface, actual top-block prime sensors achieve the optimal reciprocal-load
order required to make the full product-fibre error `o(1)`.

The common-column construction and row-adaptive construction optimize different
resources:

1. **common sample:** `O(log Z)` distinct high primes, load
   `O(log Z log log Z/Z)`;
2. **row-adaptive samples:** optimal total load `O(log Z/Z)`, but more distinct
   incidences.

## 5. Consequence for the GFF candidate

The sharpened GFF threshold remains

\[
 \gamma_N=O(1/\log p_N),
\]

because the sensor load in either sparse construction is negligible compared
with the retained high-control load `O(1/log Z)`.

Thus the next quantitative frontier is no longer low-fibre sensing.  It is the
sparsification or replacement of the high-coordinate control architecture.