# One-anchor reciprocal-label sensing

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL NEW ROUTE / FULL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

The critical `8/9` route uses a lower anchor only to keep the coherent label
inside the small-phase range.  This note removes that requirement.

A top-prime sample can perform two jobs simultaneously:

1. arbitrary-shift sensing of every lower CRT coordinate;
2. direct minor-arc sensing of the remaining common integer label.

Consequently only one sparsified anchor block, the top prefix block, is needed.
The candidate floor improves from the `2/9` power to

\[
 \gamma_N\ll p_N^{-1/4}(\log p_N)^{5/4}.
\]

No recurrence is used; the construction is naturally available at every large
prime prefix.

## 1. Top anchor

Let

\[
 Z=p_N,
 \qquad
 B=\{q:Z/2<q\le Z,\ q\text{ prime}\}.
\]

Apply the sparse Gibbs-anchor theorem at scale `Y=Z`.  There is an internal edge
set `G_B subset binom(B,2)` with

\[
 \boxed{
 \Lambda_B\ll Z^{-1/4}(\log Z)^{5/4},
 }
 \tag{1.1}
\]

\[
 \boxed{
 \sigma_B^2\asymp Z^{-9/4}(\log Z)^{5/4},
 }
 \tag{1.2}
\]

and super-polynomially small noncoherent partition mass.

Exact coherent assignments have energy

\[
 Q_B(m)=m^2\sigma_B^2.
 \tag{1.3}
\]

At the logarithmic anchor cutoff `R_0=D^2 log Z`, their label range is

\[
 |m|\le\frac{D\sqrt{\log Z}}{\sigma_B}
 \ll Z^{9/8}(\log Z)^{-1/8}.
 \tag{1.4}
\]

This exceeds the small-phase scale `o(Z)`, so a separate outer-label mechanism
is required.

## 2. Reciprocal-label population lemma

For `x in {0,1}`, define

\[
 E_{m,x}(q)
 =\left\|\frac{m}{2q}+\frac x2\right\|^2,
 \qquad q\in B.
\]

### Lemma 2.1 -- outer-label population energy

Uniformly for

\[
 \frac Z{\log Z}\le |m|\le Z^{9/8}
 \tag{2.1}
\]

and `x in {0,1}`,

\[
 \boxed{
 \frac1{|B|}\sum_{q\in B}E_{m,x}(q)
 \gg\frac1{(\log Z)^2}.
 }
 \tag{2.2}
\]

### Proof

By symmetry take `m>0`.  The inequality

\[
 \left\|\frac m{2q}+\frac x2\right\|<\delta
\]

implies

\[
 \left|\frac mq-k\right|<2\delta
 \tag{2.3}
\]

for an integer `k` whose parity is prescribed by `x`.

The case `k=0` is impossible when

\[
 \delta\le\frac1{4\log Z},
\]

because `m/q>=1/log Z`.

For `k>=1`, (2.3) confines `q` to an interval centered at `m/k` of length

\[
 O\left(\frac{\delta m}{k^2}\right).
\]

Only integers

\[
 k\asymp\frac mZ
\]

can place that interval inside `[Z/2,Z]`.  Summing the interval lengths over all
relevant `k` gives

\[
 O(\delta Z).
 \tag{2.4}
\]

This estimate is also valid when `m<Z`, where only `O(1)` positive `k` can be
relevant.  Thus the number of integers, and hence primes, `q in[Z/2,Z]`
satisfying (2.3) is at most

\[
 C\delta Z+O(Z^{1/8}).
\]

Take `delta=c_0/log Z` with `c_0` sufficiently small.  Since

\[
 |B|\asymp\frac Z{\log Z},
\]

at least a fixed positive proportion of `q in B` satisfy

\[
 E_{m,x}(q)\ge\delta^2.
\]

This proves (2.2).  `square`

## 3. One sample for both CRT and label sensing

The existing top-block multiplicity estimate gives, for every lower prime
`r<=Z/2` and every nonzero `d mod r`,

\[
 \frac1{|B|}\sum_{q\in B}
 \left\|\frac{dq^{-1}}r\right\|^2
 \gg
 \max\left\{\frac1{r^2},\frac1{(\log Z)^2}\right\}.
 \tag{3.1}
\]

Combine the test families:

1. all pairs `(r,d)` from (3.1);
2. all pairs `(m,x)` from Lemma 2.1, with
   `Z/log Z<=|m|<=Z^(9/8)` and `x in {0,1}`.

There are fewer than `Z^2` tests.  Every test has population mean at least
`c/(log Z)^2` after using the stronger `1/r^2` value for small `r`.
Bernstein/Serfling concentration for sampling without replacement therefore
produces one actual-prime set

\[
 \boxed{
 T\subset B,
 \qquad
 |T|=C(\log Z)^3,
 }
 \tag{3.2}
\]

such that simultaneously:

\[
 \min_{d\ne0\bmod r}
 \sum_{q\in T}\left\|\frac{dq^{-1}}r\right\|^2
 \gg
 (\log Z)^3
 \max\left\{\frac1{r^2},\frac1{(\log Z)^2}\right\},
 \tag{3.3}
\]

and

\[
 \boxed{
 \sum_{q\in T}
 \left\|\frac m{2q}+\frac x2\right\|^2
 \gg\log Z
 }
 \tag{3.4}
\]

for every outer label in (2.1) and both `x=0,1`.

Use sensor edges

\[
 E_{\rm sens}
 =\{rq:r\le Z/2,\ r\text{ prime},\ q\in T\}.
 \tag{3.5}
\]

Their reciprocal load is

\[
 \Lambda_{\rm sens}
 \ll\frac{(\log Z)^3\log\log Z}{Z},
 \tag{3.6}
\]

negligible relative to (1.1).

## 4. Lower-coordinate elimination

Condition on the top-anchor assignment.  For every lower prime `r`, the
arbitrary-shift cyclic partition theorem and (3.3) give

\[
 \sum_{x\bmod r}\prod_{q\in T}|K_{rq}(x)|
 \le1+\delta_r,
\]

with

\[
 \sum_{r\le Z/2}\delta_r=o(1).
\]

Thus all lower coordinates are eliminated at total cost `1+o(1)`.

When the top assignment has coherent label `m` with `|m|<Z/log Z`, the
distinguished lower residue `m mod r` has energy `o(D_r)` uniformly in `r`, so
the decoded global frequency is exactly `h=m`.

For outer labels, exact reconstruction is unnecessary: the row `r=2` alone
kills every possible residue choice.  Indeed the two residues produce precisely
the two values `x=0,1` in (3.4), and hence

\[
 \sum_{x\bmod2}\prod_{q\in T}|K_{2q}(x)|
 \ll Z^{-A}
 \tag{4.1}
\]

for any prescribed fixed `A`, after increasing the constant in (3.2).

This is the key replacement for the lower anchor.

## 5. Near-diagonal mass reservoir

The reciprocal mass should also supply a strong variance lower bound.  Restrict
the mass pool to semiprimes `pq` with

\[
 Z\le pq\le4Z.
 \tag{5.1}
\]

For example, take

\[
 p\in[Z^{1/3},2Z^{1/3}],
 \qquad
 q\in[Z/p,2Z/p].
\]

PNT/Mertens on fixed-ratio intervals gives reciprocal capacity

\[
 \sum\frac1{pq}\gg\frac1{(\log Z)^2}.
 \tag{5.2}
\]

This dominates the required load `Z^(-1/4)(log Z)^(5/4)`.
After deleting the sparse control and sensor edges, greedily select mass edges
until the total load has the desired value.

Because every mass denominator lies in `[Z,4Z]`, if its reciprocal load is
`Lambda_mass`, then

\[
 \frac{\Lambda_{\rm mass}}{4Z}
 \le
 \sum_{e\in E_{\rm mass}}\frac1{e^2}
 \le
 \frac{\Lambda_{\rm mass}}Z.
 \tag{5.3}
\]

Thus, in the lowest tuned range,

\[
 \boxed{
 V\asymp\frac qZ
 \asymp Z^{-5/4}(\log Z)^{5/4}.
 }
 \tag{5.4}
\]

The positive main width is therefore

\[
 V^{-1/2}
 \asymp Z^{5/8}(\log Z)^{-5/8}.
 \tag{5.5}
\]

## 6. Terminal Fourier partition

The frequency space has four relevant lanes.

### Lane A -- positive Gaussian main arc

For

\[
 |m|\le M_0V^{-1/2},
\]

all denominators are at least `Z`, and

\[
 \frac1{Z\sqrt V}\to0.
\]

The Taylor expansion is uniform and gives a positive contribution
`asymp V^(-1/2)`.

### Lane B -- small-phase coherent tail

For

\[
 M_0V^{-1/2}<|m|<\frac Z{\log Z},
\]

one has `|m|/e=o(1)` for every denominator.  The modulus bound gives

\[
 \prod_e|K_e(m)|\le e^{-cVm^2}.
\]

Choose `M_0` so this tail is a small fraction of Lane A.

### Lane C -- reciprocal-label minor arc

For

\[
 \frac Z{\log Z}\le|m|\le
 \frac{D\sqrt{\log Z}}{\sigma_B},
\]

(1.4) lies inside the range of Lemma 2.1.  Equation (4.1) makes the full lane
smaller than any inverse power of `Z`.

### Lane D -- anchor outer and noncoherent sectors

Coherent labels beyond the logarithmic cutoff contribute

\[
 O\left(\frac{Z^{-\delta D^2}}{\sigma_B}\right),
\]

and noncoherent top assignments are super-polynomially small by sparse Gibbs
sparsification.  Choose `D` once so both are `o(V^(-1/2))`.

These four lanes are exhaustive.

## 7. Target tuning and exactness

The reserved load is

\[
 \boxed{
 \Lambda_0(Z)
 \ll Z^{-1/4}(\log Z)^{5/4}.
 }
 \tag{7.1}
\]

The near-diagonal mass pool tunes every

\[
 q\in
 \left[CZ^{-1/4}(\log Z)^{5/4},\frac15\right]
 \tag{7.2}
\]

with one Bernoulli parameter in a fixed compact subinterval of `(0,1)`.
Total reciprocal load remains below one, so modular Fourier positivity is an
exact subset-sum equality by no-wrap.

Li's existing central band supplies the overlap needed for complement symmetry.

### Theorem 7.1 -- one-anchor finite-prefix candidate

For all sufficiently large `N`,

\[
 \boxed{
 \gamma_N
 \ll
 p_N^{-1/4}(\log p_N)^{5/4}.
 }
 \tag{7.3}
\]

This is a direct all-prefix theorem candidate and supersedes the `2/9` route as
the strongest current research-line conclusion.

## 8. Significance and new frontier

The one-anchor architecture consists only of:

1. one sparsified top block;
2. one polylogarithmic actual-prime sample;
3. one near-diagonal reciprocal-mass pool.

It removes:

- the full multi-block global-control chain;
- the lower anchor;
- cross-scale synchronization;
- dyadic checkpoint transfer.

The method-class `2/3` barrier from the preceding note is evaded because the
coherent outer range is no longer treated by small-phase reconstruction.

The new bottleneck is entirely the moving single-block entropy coefficient
`Z^(-1/4)(log Z)^(13/4)`.  Any improvement of sparse Gibbs control immediately
improves the prefix exponent.  An optimal `Z polylog Z`-edge top-anchor theorem
would bring the reserved load close to `polylog(Z)/Z`, matching the independent
row-sensor scale.

## 9. Exact assurance boundary

PDL should verify:

1. the interval-count proof of Lemma 2.1, including negative `m` and all parity
   conventions;
2. the simultaneous Bernstein/Serfling sample in Section 3;
3. the exact top-anchor coherent label range consumed in Lane C;
4. the near-diagonal mass capacity and edge disjointness;
5. the four-lane Fourier assembly and central-band overlap.

A failure returns as one exact `BLOCKED-FRONTIER`.  No authority or assurance
status changes through this exploratory theorem candidate.
