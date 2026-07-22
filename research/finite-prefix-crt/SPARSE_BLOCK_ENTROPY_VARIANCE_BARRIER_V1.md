# Entropy--variance barrier for sparse block control

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL METHOD-CLASS LOWER BOUND / NOT A PROBLEM LOWER BOUND`  
**Date:** 2026-07-22

This note identifies the natural endpoint of the sparse-anchor strategy.
It is a lower bound for a **method class**, not for Li's gap-free floor and not
for Erdős 306.

The method class is:

1. one uses an unweighted graph of CRT pair interactions inside a prime block
   `[Y,2Y]`;
2. every edge energy is bounded by an absolute constant;
3. the block partition function is required to be polynomial-size, typically
   `O(1/sigma_G)`;
4. a logarithmic energy cutoff is converted into a coherent integer-label
   window;
5. that whole window is reconstructed by small-phase Fourier analysis using
   denominators at least `Z`.

Within this class, reciprocal load cannot beat

\[
 Z^{-2/3}(\log Z)^{1/3}
\]

up to slowly varying factors.  The current `2/9` route is therefore not the
method-class endpoint; it is the endpoint imposed by the presently verified
fingerprint entropy threshold.

## 1. Pure entropy forces linearly many edges

Let `P` be a prime block in `[Y,2Y]` with

\[
 |P|\asymp\frac{Y}{\log Y}.
\]

The assignment space is

\[
 \Omega_P=\prod_{p\in P}\mathbb Z/p\mathbb Z,
\]

and PNT gives

\[
 \log|\Omega_P|
 =\sum_{p\in P}\log p
 =\Theta(Y).
 \tag{1.1}
\]

Let `G` be an unweighted graph on `P` with `m` edges, and suppose every edge
energy lies in `[0,b]`, where `b` is an absolute constant.  Then

\[
 Q_G(a)\le bm
 \qquad(a\in\Omega_P).
\]

For every fixed damping constant `c>0`,

\[
 \sum_{a\in\Omega_P}e^{-cQ_G(a)}
 \ge |\Omega_P|e^{-cbm}.
 \tag{1.2}
\]

Assume the desired block partition bound is polynomial in `Y`; in particular,

\[
 \sum_a e^{-cQ_G(a)}\le Y^A
 \tag{1.3}
\]

for some fixed `A`.  Combining (1.1)--(1.3) gives

\[
 \boxed{m\ge c_0Y.}
 \tag{1.4}
\]

The usual target `O(1/sigma_G)` is covered: for block edges `pq` with
`p,q in[Y,2Y]`,

\[
 \sigma_G^2=\sum_{pq\in G}\frac1{p^2q^2}
 \ge\frac{m}{16Y^4},
\]

so `1/sigma_G<=4Y^2/sqrt(m)<=4Y^2` when `m>=1`.

Thus a constant-degree graph cannot possibly supply the required partition
compression.  Linear edge count is the information-theoretic minimum.

## 2. Load and square scale

Since every block denominator `pq` is comparable with `Y^2`,

\[
 \boxed{
 \Lambda_G\asymp\frac{m}{Y^2},
 \qquad
 \sigma_G^2\asymp\frac{m}{Y^4}.
 }
 \tag{2.1}
\]

Equivalently,

\[
 \sigma_G\asymp\frac{\sqrt{\Lambda_G}}Y.
 \tag{2.2}
\]

The entropy bound (1.4) already yields

\[
 \boxed{\Lambda_G\gg\frac1Y.}
 \tag{2.3}
\]

This is sharp at the level of edge count: `m=Theta(Y)` would have load
`Theta(1/Y)`.

## 3. Coherent-window reconstruction forces a second load bound

To make every noncoherent assignment negligible against polynomial partition
scales, the standard extraction uses a cutoff

\[
 R_0=D^2\log Z
 \tag{3.1}
\]

with fixed sufficiently large `D`.

The coherent labels below this cutoff satisfy

\[
 |m|\le\frac{D\sqrt{\log Z}}{\sigma_G}.
 \tag{3.2}
\]

If all Fourier denominators are at least a constant multiple of `Z`, the
small-phase reconstruction used by the present architecture requires

\[
 \frac{\sqrt{\log Z}}{\sigma_GZ}=o(1).
 \tag{3.3}
\]

Using (2.2), condition (3.3) forces, up to a factor tending to infinity,

\[
 \boxed{
 \Lambda_G\gg\frac{Y^2\log Z}{Z^2}.
 }
 \tag{3.4}
\]

This is the variance side of the barrier.  A graph may reduce its reciprocal
load by using fewer edges, but then its coherent label window expands and
leaves the small-phase regime.

## 4. Optimized method-class barrier

Combining (2.3) and (3.4), every architecture in the stated class obeys

\[
 \boxed{
 \Lambda_G
 \gg
 \max\left\{\frac1Y,\frac{Y^2\log Z}{Z^2}\right\}.
 }
 \tag{4.1}
\]

The two terms balance when

\[
 Y^3\asymp\frac{Z^2}{\log Z},
\]

that is,

\[
 Y\asymp Z^{2/3}(\log Z)^{-1/3}.
 \tag{4.2}
\]

At this scale,

\[
 \boxed{
 \Lambda_G
 \gg Z^{-2/3}(\log Z)^{1/3}.
 }
 \tag{4.3}
\]

### Theorem 4.1 -- sparse-anchor entropy--variance barrier

No unweighted bounded-edge block-control architecture satisfying the five
method-class conditions in the introduction can produce a reserved reciprocal
load

\[
 o\bigl(Z^{-2/3}(\log Z)^{1/3}\bigr).
\]

The theorem is a lower bound for the architecture, not for the underlying
subset-sum problem.  Cancellation, nonlocal decoding, weighted interactions,
or a non-small-phase treatment of the coherent outer range may evade it.

## 5. Polylogarithmic-degree target

Suppose a sparse block theorem can be proved with

\[
 m\ll YL(Y)
\]

for a slowly varying function `L`.  Then

\[
 \Lambda_G\ll\frac{L(Y)}Y,
 \qquad
 \sigma_G^2\asymp\frac{L(Y)}{Y^3}.
\]

The largest small-phase anchor scale is

\[
 Y\asymp
 \left(\frac{Z^2L(Y)}{\log Z}\right)^{1/3},
\]

and the resulting load is

\[
 \Lambda_G
 \ll
 Z^{-2/3}L(Y)^{2/3}(\log Z)^{1/3}.
 \tag{5.1}
\]

Thus any `Y polylog(Y)`-edge sparse SBEE theorem would achieve the optimal
power exponent `2/3`, losing only logarithms.

## 6. Relation to the current `2/9` theorem candidate

The current verified fingerprint architecture permits a moving entropy
coefficient only at

\[
 \varepsilon_Y
 \asymp Y^{-1/4}(\log Y)^{13/4}.
\]

Gibbs sampling therefore retains

\[
 m\asymp
 Y^{7/4}(\log Y)^{5/4}
\]

edges, rather than the information-theoretic `Theta(Y)` scale.  Its load is

\[
 Y^{-1/4}(\log Y)^{5/4},
\]

and the coherent-window condition selects `Y=Z^(8/9)`, producing the exponent
`2/9`.

Hence:

- `2/9` is the endpoint of **current fingerprint-controlled sparsification**;
- `2/3` is the natural endpoint of the broader unweighted sparse-anchor method;
- the gap between them is precisely a sparse single-block entropy problem.

## 7. Exact new frontier: sparse SBEE

The highest-value next theorem is the following.

### `SPARSE-SBEE(Y,L)`

For every Irving-good prime block `P subset[Y,2Y]`, construct an internal graph
`G_P` with

\[
 |E(G_P)|\ll YL(Y)
\]

such that:

1. the full Fourier partition is `O(1/sigma_G)`;
2. exact coherent labels have energy `m^2 sigma_G^2`;
3. the entire noncoherent contribution is negligible after a logarithmic
   cutoff;
4. the construction is uniform under the fixed Bernoulli damping interval used
   by the finite-prefix argument.

A theorem with `L(Y)=polylog(Y)` would improve the finite-prefix exponent from
`2/9` to `2/3` up to logarithms and would substantially simplify the original
complete-block SBEE mechanism.

## 8. Genuine escape routes

The barrier does not apply if one:

1. uses signed or oscillatory cancellation instead of absolute partition
   control;
2. uses weighted edges with energy per reciprocal load larger than the present
   pair interactions;
3. jointly decodes several blocks without assigning each a polynomial-size
   partition function;
4. treats coherent labels of size comparable with or larger than `Z` by a
   non-small-phase minor-arc theorem;
5. uses higher-order interactions rather than pair denominators.

These are the correct routes if one seeks a power exponent beyond `2/3`.
