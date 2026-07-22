# Finite-prefix CRT suppression — recovered conversation draft

**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `WORKING-DRAFT / CONVERSATION-RECOVERY`  
**Recovered:** 2026-07-22  
**Workspace:** `research/e306-frontier-v1`  
**Standing base before this recovery:** `4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

This note preserves mathematical material that previously existed only in the Research Lead conversation. It is not a released theorem, a reviewed result, a proof-development checkpoint, or an activation of issue #39.

## 1. Target shape

The finite-prefix direction asks whether the Fourier/CRT mechanism behind Erdős 306 can give quantitative suppression for Li-type semiprime subset-sum systems. The local model is a cyclic partition function

\[
 Z_r(U,\theta,\alpha)
 :=\sum_{x\bmod r}
   \prod_{j\in U}
   \left|(1-\theta_j)+\theta_j
   e\!\left(\alpha_j+\frac{x u_j}{r}\right)\right|,
\]

where `r` is normally a low prime, every `u_j` is a unit modulo `r`, the shifts `alpha_j` encode the other CRT coordinates, and the Bernoulli weights `theta_j` come from the chosen semiprime edges.

The desired local output is of the form

\[
 Z_r\le 1+r^{-A}.
\]

The leading `1` represents the single possible main residue. The central issue is suppressing all other residues uniformly in the arbitrary shifts supplied by the remaining CRT coordinates.

## 2. Distribution-free abundance mechanism

The conversation identified a shift-uniform route that does not require equidistribution of the units `u_j`.

Write

\[
 a_j=\theta_j(1-\theta_j),
 \qquad
 M=\sum_j a_j.
\]

Each Bernoulli factor obeys a Gaussian-type upper bound in the distance to the nearest integer. Since multiplication by a unit sends every nonzero residue to a nonzero residue, two distinct codewords are separated in every coordinate by at least `1/r` in the circle metric. A minimum-energy argument then leaves at most one unsuppressed residue and gives exponential damping on every other residue at scale `M/r^2`.

The retained scale was

\[
 M\gg_A r^2\log r.
\]

For balanced weights `theta_j=1/2`, this means on the order of `r^2 log r` incident semiprime edges.

An earlier conversation bound was recorded in the weaker schematic form

\[
 Z_r\le 1+(r-1)
 \exp\!\left(-\frac{4M}{9r^2}\right).
\]

The constant was not the point; the durable mechanism is the distribution-free `M/r^2` exponent. A sharper constant is derived in the companion theorem note created after this recovery.

## 3. Reusing one high-prime reservoir

For all low primes `r<=X`, the same set of high primes can be reused. One includes every edge `(r,s)` with low endpoint `r` and high endpoint `s` in a common reservoir `H`.

This reuse is important: the number of high primes need only satisfy the worst low-prime requirement

\[
 |H|\gg_A X^2\log X,
\]

rather than the sum of `r^2 log r` over all low primes. When the `r` coordinate is summed first, the coordinates belonging to the high primes appear only as arbitrary shifts, and the distribution-free estimate is uniform in those shifts.

A dyadic high-prime block near `Y` was therefore expected to be sufficient once

\[
 \frac{Y}{\log Y}\gg X^2\log X,
\]

which leads to the heuristic scale

\[
 Y\gg X^2(\log X)^2.
\]

At that scale the reciprocal load of the complete low-high bipartite reservoir is expected to be small:

\[
 \left(\sum_{r\le X\atop r\ \mathrm{prime}}\frac1r\right)
 \left(\sum_{s\in H}\frac1s\right)
 \asymp
 \frac{\log\log X}{\log X}
 \longrightarrow 0.
\]

This is the **abundance regime**. It spends many high primes to avoid any residue-design problem.

The prime-counting and reciprocal-load formulas above are retained as asymptotic design heuristics in this recovery note; they are not being promoted here as a closed finite-prefix theorem.

## 4. Exact CRT elimination idea

For a squarefree product of low moduli, summation over CRT coordinates can be performed one coordinate at a time. If the local estimate for a low prime `r` is uniform in every shift coming from the other coordinates, then integrating the `r` coordinate replaces the corresponding local product by at most `1+r^{-A}`.

This gives a coordinate-elimination bound of the form

\[
 \sum_{x\bmod R}
 \prod_{r\mid R} F_r(x_r;\text{other coordinates})
 \le
 \prod_{r\mid R}(1+r^{-A}),
\]

provided the factors assigned to each elimination step have been specified without double use and the local estimate is genuinely uniform in the remaining coordinates.

The exact point retained from the conversation is that **uniformity in arbitrary shifts is what permits reservoir reuse and sequential CRT elimination**. A literal tensor product is unnecessary when the estimate is conditional-uniform at every step.

## 5. Sparse-design regime

The alternative is to choose the unit vectors deliberately. For one low prime `r`, define the cyclic code

\[
 x\longmapsto
 \left(\frac{x u_1}{r},\ldots,\frac{x u_m}{r}\right)
 \in (\mathbb R/\mathbb Z)^m.
\]

If every nonzero difference has squared circle distance comparable to `m`, then only

\[
 m=O_A(\log r)
\]

coordinates are needed for `Z_r<=1+r^{-A}`. Random units should supply such a code with positive probability, and the same number of columns can in principle serve all low primes `r<=X` by choosing a residue vector separately for each low prime in every column.

This is the **sparse-design regime**. It greatly reduces the high-prime count but moves the difficulty into simultaneous prime-residue realization.

## 6. Prime-residue realization boundary

For a fixed finite low-prime set, a column of desired units determines one nonzero residue modulo every low prime. CRT combines those entries into one reduced residue class modulo the low primorial. A high prime in that class realizes the whole column simultaneously.

The conversation did not close the quantitative finite-prefix version of this step. The retained missing interface was:

> produce `O_A(log X)` distinct high primes below a prefix-compatible bound, each realizing a prescribed reduced residue class modulo the low primorial, with enough control to keep the resulting semiprime edges inside the target finite prefix.

Qualitative existence of primes in fixed reduced residue classes is not by itself the finite-prefix statement needed for a gap-free-floor conclusion. The size of the realizing primes, uniformity over the prescribed classes, distinctness, and compatibility with the chosen prefix all matter.

## 7. Regime comparison retained from the conversation

| Regime | Local number of factors | Residue assumptions | High-prime scale | Main advantage | Main unresolved point |
|---|---:|---|---|---|---|
| Distribution-free abundance | `~ r^2 log r` | units only | heuristic `Y >> X^2(log X)^2` using one shared reservoir | no designed residues; arbitrary-shift uniform | conversion to the full finite-prefix Fourier/gap parameter |
| Sparse design | `O_A(log r)` | large cyclic-code distance | potentially much smaller factor count, but realization primes may be very large | load-efficient and structurally sharp | prefix-compatible simultaneous prime-residue realization |

## 8. Status boundary

- Released Erdős 306 authority remains `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe` with the two named Rosser–Schoenfeld inputs.
- This note does not use the frozen `codex/pushlinter` abstractions as released premises.
- Issue #39 remains `PREPARED-HOLD`.
- No claim is made here that Li's full gap-free-floor conjecture follows.
- The next note must separate a proved local suppression theorem from the still-open finite-prefix realization and global Fourier-transfer steps.
