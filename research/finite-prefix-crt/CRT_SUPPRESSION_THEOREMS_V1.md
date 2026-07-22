# Local CRT suppression theorems for finite-prefix semiprime systems

**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22  
**Released-theorem consequence:** none  
**Issue #39:** remains `PREPARED-HOLD`

This note advances the recovered finite-prefix CRT draft. The local suppression results below are elementary and self-contained. Their application to a full gap-free-floor theorem remains gated by quantitative prime-residue realization and by the global finite-prefix Fourier transfer.

## 1. Notation

Write

\[
 e(t)=e^{2\pi i t},
 \qquad
 \|t\|=\min_{n\in\mathbb Z}|t-n|.
\]

Fix an integer `r>=2`. Let

- `theta_j in [0,1]`;
- `a_j=theta_j(1-theta_j)`;
- `alpha_j in R/Z`;
- `u_j in (Z/rZ)^x`.

Define

\[
 F(x)=\prod_{j=1}^m
 \left|(1-\theta_j)+\theta_j
 e\!\left(\alpha_j+\frac{x u_j}{r}\right)\right|,
 \qquad x\in\mathbb Z/r\mathbb Z.
\]

For a nonzero residue `Delta`, define the weighted cyclic-code distance

\[
 D(\Delta)
 =\sum_{j=1}^m a_j
   \left\|\frac{\Delta u_j}{r}\right\|^2,
 \qquad
 D_*=\min_{\Delta\ne0}D(\Delta).
\]

## 2. One-factor Gaussian bound

For every `theta in [0,1]` and `t in R/Z`,

\[
 |(1-\theta)+\theta e(t)|^2
 =1-4\theta(1-\theta)\sin^2(\pi t).
\]

Using `sqrt(1-y)<=exp(-y/2)` and
`sin(pi ||t||)>=2||t||` for `||t||<=1/2`,

\[
 |(1-\theta)+\theta e(t)|
 \le
 \exp\bigl(-8\theta(1-\theta)\|t\|^2\bigr).
\tag{2.1}
\]

## 3. Weighted cyclic-code suppression theorem

### Theorem 3.1

With the notation above,

\[
 \sum_{x\bmod r}F(x)
 \le
 1+(r-1)e^{-2D_*}.
\tag{3.1}
\]

The estimate is uniform in all shifts `alpha_j`.

### Proof

Put

\[
 E(x)=\sum_{j=1}^m a_j
 \left\|\alpha_j+\frac{x u_j}{r}\right\|^2.
\]

By (2.1),

\[
 F(x)\le e^{-8E(x)}.
\tag{3.2}
\]

Choose `x_0` minimizing `E`. For `x!=x_0`, set `Delta=x-x_0`. The circle metric gives, coordinate by coordinate,

\[
 \left\|\alpha_j+\frac{x u_j}{r}\right\|
 +
 \left\|\alpha_j+\frac{x_0u_j}{r}\right\|
 \ge
 \left\|\frac{\Delta u_j}{r}\right\|.
\]

Since `A^2+B^2>=(A+B)^2/2`, summing with weights `a_j` yields

\[
 E(x)+E(x_0)
 \ge \frac12D(\Delta)
 \ge \frac12D_*.
\]

Minimality gives `E(x_0)<=E(x)`, hence

\[
 E(x)\ge\frac14D_*.
\]

Thus every `x!=x_0` satisfies `F(x)<=e^{-2D_*}`, while `F(x_0)<=1`. Summation proves (3.1). `square`

## 4. Distribution-free abundance corollary

Let

\[
 M=\sum_{j=1}^m a_j.
\]

Because every `u_j` is a unit, for every nonzero `Delta mod r`,

\[
 \left\|\frac{\Delta u_j}{r}\right\|\ge\frac1r.
\]

Therefore `D_*>=M/r^2` and Theorem 3.1 gives:

### Corollary 4.1

\[
 \sum_{x\bmod r}F(x)
 \le
 1+(r-1)\exp\left(-\frac{2M}{r^2}\right).
\tag{4.1}
\]

In particular, for `A>=0`,

\[
 M\ge\frac{A+1}{2}r^2\log r
 \quad\Longrightarrow\quad
 \sum_{x\bmod r}F(x)\le1+r^{-A}.
\tag{4.2}
\]

For balanced weights `theta_j=1/2`, `M=m/4`, so it is enough that

\[
 m\ge2(A+1)r^2\log r.
\tag{4.3}
\]

This closes the local **distribution-free abundance regime**. No equidistribution or designed-residue hypothesis is used.

## 5. Sparse cyclic designs

The abundance estimate uses only the weakest possible code distance `1/r` in every coordinate. A designed unit vector can make most differences macroscopic in many coordinates.

### Theorem 5.1 — one prime modulus

Let `r` be an odd prime and `A>=0`. There exist units

\[
 u_1,\ldots,u_m\in(\mathbb Z/r\mathbb Z)^\times
\]

with

\[
 m\le \left\lceil192(A+1)\log r\right\rceil+1
\tag{5.1}
\]

such that for every choice of shifts `alpha_j`, with `theta_j=1/2`,

\[
 \sum_{x\bmod r}
 \prod_{j=1}^m
 \left|\frac{1+e(\alpha_j+xu_j/r)}2\right|
 \le1+r^{-A}.
\tag{5.2}
\]

### Proof

Choose the `u_j` independently and uniformly from the nonzero residues modulo `r`. For a fixed nonzero `Delta`, multiplication by `Delta` permutes those residues. A uniformly random nonzero residue has circle distance at least `1/4` with probability at least `1/3`.

Let `Y_Delta` count the indices satisfying

\[
 \left\|\frac{\Delta u_j}{r}\right\|\ge\frac14.
\]

A Chernoff bound gives

\[
 \Pr(Y_\Delta<m/6)\le e^{-m/24}.
\]

The union bound over the `r-1` nonzero differences is strictly below `1` once `m>=48 log r`. Hence there is a choice for which every nonzero `Delta` has at least `m/6` such coordinates.

For balanced weights, `a_j=1/4`, so

\[
 D(\Delta)
 \ge \frac m6\cdot\frac14\cdot\frac1{16}
 =\frac m{384}.
\]

Theorem 3.1 gives

\[
 \sum_xF(x)
 \le1+r\exp(-m/192).
\]

The choice (5.1) makes the final term at most `r^{-A}`. `square`

### Theorem 5.2 — simultaneous design for all low primes

Fix `X>=3` and `A>=0`. There is one column count

\[
 m=O_A(\log X)
\]

and a matrix of units

\[
 u_{r,j}\in(\mathbb Z/r\mathbb Z)^\times,
 \qquad r\le X\text{ prime},\quad1\le j\le m,
\]

such that the bound (5.2) holds for every prime `r<=X`, uniformly in the shifts.

One explicit sufficient choice is

\[
 m\ge192(A+1)\log X+1.
\tag{5.3}
\]

### Proof

Choose the unit vectors independently for every pair `(r,j)`. The preceding bad-event estimate, summed over every nonzero difference for every prime `r<=X`, is at most

\[
 \sum_{r\le X\atop r\text{ prime}}r e^{-m/24}
 \le X^2e^{-m/24}<1
\]

under (5.3). Thus one matrix works simultaneously. For each `r<=X`,

\[
 1+r e^{-m/192}
 \le1+rX^{-(A+1)}
 \le1+r^{-A}.
\]

`square`

This proves the local **sparse-design regime** with only `O_A(log X)` common high-prime columns.

## 6. How semiprime edges induce the unit matrix

Let `r` and `s` be distinct primes. Under CRT, fixing the `s`-coordinate and varying the `r`-coordinate gives

\[
 \frac{x}{rs}
 \equiv
 \frac{x_r(s^{-1}\bmod r)}r
 +\frac{x_s(r^{-1}\bmod s)}s
 \pmod1.
\tag{6.1}
\]

Thus an edge `(r,s)` contributes to the `r`-coordinate exactly in the form used above:

- unit `u_{r,s}=s^{-1} mod r`;
- an arbitrary shift determined by the fixed `s`-coordinate.

This is why shift-uniformity is the correct local notion.

## 7. Sequential CRT elimination

Take a low-prime set `L` and a high-prime set `H`, and include a chosen family of distinct edges `(r,s)` with `r in L`, `s in H`. Assign every edge to its low endpoint.

When the CRT coordinate `x_r` is summed, all coordinates outside `r` are fixed. The factors assigned to `r` have the form of Section 1, while factors assigned to other low primes do not involve `x_r`. Therefore Theorem 3.1 removes the entire `r`-star at a cost of at most `1+r^{-A}`.

Iterating over the low primes gives the exact nonnegative Fubini bound

\[
 \text{low-coordinate contribution}
 \le
 \prod_{r\in L}(1+r^{-A}).
\tag{7.1}
\]

The high primes may be reused across every low star. Disjoint high reservoirs are unnecessary.

## 8. Residue realization

For the simultaneous sparse design, every column `j` prescribes one desired unit `u_{r,j}` for each low prime `r<=X`. By (6.1), one needs

\[
 s_j\equiv u_{r,j}^{-1}\pmod r
 \quad\text{for every low prime }r.
\tag{8.1}
\]

CRT combines (8.1) into one reduced residue class modulo

\[
 R_X=\prod_{r\le X\atop r\text{ prime}}r.
\]

Consequently:

- **algebraic realization is closed**: every code column is one reduced class modulo `R_X`;
- **qualitative prime realization is available** from the classical theorem that every reduced residue class contains infinitely many primes;
- **finite-prefix quantitative realization remains open in this programme**.

## 9. Smallest exact remaining prime-residue interface

Define `PREFIX-REALIZATION(A,X,B)` to mean:

> For the simultaneous unit matrix of Theorem 5.2, there are `m<=C_A log X` distinct primes `s_1,...,s_m`, all larger than `X` and at most `B`, such that `s_j` realizes column `j` through (8.1).

The smallest unresolved realization question is not CRT consistency. It is to obtain `PREFIX-REALIZATION(A,X,B(X))` with a bound `B(X)` compatible with the target finite prefix.

More explicitly, for a prefix ending at the `N`-th prime `p_N`, one needs a choice `X=X(N)->infinity` such that

\[
 B(X(N))\le p_N,
\tag{9.1}
\]

while the remaining uncontrolled Fourier coordinates, reciprocal load, and main-frequency analysis still imply the desired bound for the finite-prefix gap parameter.

This interface cleanly separates:

1. the now-proved local cyclic suppression;
2. the prime-in-progressions realization scale;
3. the global finite-prefix Fourier-to-gap transfer.

## 10. Current verdict

- **Local distribution-free suppression:** `PROVED` in Corollary 4.1.
- **Local sparse-design suppression:** `PROVED` in Theorems 5.1–5.2.
- **Simultaneous algebraic CRT realization:** `PROVED` by (8.1) and CRT.
- **Qualitative prime realization:** available from a classical external theorem.
- **Prefix-compatible quantitative prime realization:** `OPEN INTERFACE` as `PREFIX-REALIZATION(A,X,B)`.
- **Full Li gap-free-floor consequence:** not claimed; the global Fourier/gap transfer and remaining frequency lanes are not closed here.

The material theorem checkpoint is the weighted cyclic-code estimate (3.1), with abundance and sparse-design corollaries. The smallest visible missing implication is the prefix-compatible realization interface (9.1), followed by the global finite-prefix transfer.
