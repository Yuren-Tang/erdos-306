# Sparse Gibbs anchors and the critical `8/9` scale

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL GENERAL THEOREM CANDIDATE / STRONGER FINITE-PREFIX ROUTE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

This note attacks the `1/(log Z)^2` load left by the two-anchor route.  That
load is not forced by arithmetic sensing; it comes from retaining complete
internal graphs on the two anchor blocks.  The complete single-block energy can
itself be sparsified.

The result has three layers.

1. A general Gibbs/Fourier edge-sparsification theorem.
2. A moving-entropy corollary extracted from the verified single-block SBEE
   ingredients.
3. A critical-scale two-anchor construction with lower anchor
   `Y=Z^(8/9)`, giving the candidate prefix floor

\[
 \gamma_N\ll p_N^{-2/9}(\log p_N)^{5/4}.
\]

Unlike the preceding dyadic-only routes, the construction is naturally stated
at an arbitrary prime prefix ceiling `Z=p_N`; no recurrence is needed for the
headline rate.

No Lean, proof-development, corpus, manuscript, review, release, DOI, or
publication status changes through this note.

## 1. Abstract Gibbs edge sparsification

Let `Omega` be a finite assignment space and `E_0` a finite edge family.  For
each `e in E_0`, let

\[
 q_e:\Omega\to[0,b]
\]

with fixed `b>0`, and put

\[
 Q(\omega)=\sum_{e\in E_0}q_e(\omega).
\]

Let `C subset Omega` be a coherent subset.  Assume:

1. **noncoherent floor**
   \[
   Q(\omega)\ge F\qquad(\omega\notin C);
   \tag{1.1}
   \]
2. **level-set entropy**
   \[
   \#\{\omega:Q(\omega)\le R\}
   \le A e^{\eta R}\left(1+\frac{\sqrt R}{\sigma}\right)
   \qquad(R\ge1),
   \tag{1.2}
   \]
   where `0<sigma<=1`.

Select each edge independently with probability `rho`, obtaining `S subset
E_0`, and define

\[
 Q_S(\omega)=\sum_{e\in S}q_e(\omega).
\]

Fix a Fourier damping constant `c>0`.  Since `0<=q<=b`,

\[
 1-e^{-cq}\ge \kappa_c q,
 \qquad
 \kappa_c:=\frac{1-e^{-cb}}b>0.
 \tag{1.3}
\]

Therefore, for every assignment,

\[
 \begin{aligned}
 \mathbb E_S e^{-cQ_S(\omega)}
 &=\prod_{e\in E_0}\bigl(1-\rho+\rho e^{-cq_e(\omega)}\bigr)\\
 &\le\exp\left(-\rho\sum_e(1-e^{-cq_e(\omega)})\right)\\
 &\le e^{-\kappa_c\rho Q(\omega)}.
 \end{aligned}
 \tag{1.4}
\]

Assume

\[
 \eta\le\frac{\kappa_c\rho}{2}.
 \tag{1.5}
\]

Shell summation using (1.1)--(1.2) then gives

\[
 \boxed{
 \mathbb E_S\sum_{\omega\notin C}e^{-cQ_S(\omega)}
 \le
 A\,\operatorname{poly}(\rho^{-1},\sigma^{-1},F)
 e^{-\kappa_c\rho F/3}.
 }
 \tag{1.6}
\]

The exact polynomial is immaterial whenever `rho F` dominates every logarithm
of the ambient parameters.

### Theorem 1.1 -- Gibbs sparsification

Suppose in addition that every edge has nonnegative costs `l_e,s_e`, and let

\[
 L_0=\sum_e l_e,
 \qquad
 S_0=\sum_e s_e.
\]

If `rho |E_0| -> infinity`, then there exists a deterministic subset `S` such
that simultaneously

\[
 \sum_{e\in S}l_e\le4\rho L_0,
 \tag{1.7}
\]

\[
 \sum_{e\in S}s_e\asymp\rho S_0
 \tag{1.8}
\]

whenever the `s_e` are comparable, and

\[
 \sum_{\omega\notin C}e^{-cQ_S(\omega)}
 \le
 A\,\operatorname{poly}(\rho^{-1},\sigma^{-1},F)
 e^{-\kappa_c\rho F/4}.
 \tag{1.9}
\]

Indeed, (1.7) follows from Markov, (1.8) from Chernoff, and (1.9) from
(1.6) and Markov.  The good events have positive joint probability once the
right side of (1.6) tends to zero.

This theorem is independent of CRT arithmetic.  It says that a complete Gibbs
interaction may be thinned whenever its low-energy state count has entropy
strictly below the damping retained by sampling.

## 2. Moving SBEE entropy

Let `P` be an Irving-good prime block in `[Y,2Y]`, with complete block energy
`Q_P` and complete square scale

\[
 \sigma_P^2\asymp\frac1{Y^2(\log Y)^2}.
 \tag{2.1}
\]

The verified single-block architecture supplies:

1. below the nondominant window
   \[
   F_Y\asymp\frac{Y}{(\log Y)^3},
   \tag{2.2}
   \]
   Theorem B forces dominance;
2. Theorem A gives
   \[
   \#\mathrm{exceptions}\ll\frac{Q_P(\log Y)^3}{Y},
   \tag{2.3}
   \]
   so every assignment below a sufficiently small constant multiple of `F_Y`
   is exactly coherent;
3. the fingerprint threshold at entropy coefficient `eps` is
   \[
   R_C(\varepsilon)
   \asymp
   \varepsilon^{-4/3}Y^{2/3}(\log Y)^{4/3}.
   \tag{2.4}
   \]

To mesh fingerprint counting with the lower window one needs

\[
 R_C(\varepsilon)\le cF_Y.
 \]

This is equivalent, up to constants, to

\[
 \varepsilon\ge
 K Y^{-1/4}(\log Y)^{13/4}.
 \tag{2.5}
\]

The lower-window dominant entropy condition only requires
`eps >> (log Y)^4/Y`, which is weaker than (2.5).

Choose

\[
 \boxed{
 \varepsilon_Y
 =K Y^{-1/4}(\log Y)^{13/4}
 }
 \tag{2.6}
\]

with `K` sufficiently large.  Reading the explicit thresholds in Theorem A,
Theorem C, and their mesh yields the moving level-set estimate

\[
 \boxed{
 \#\{a:Q_P(a)\le R\}
 \le20e^{\varepsilon_YR}
 \left(1+\frac{\sqrt R}{\sigma_P}\right)
 \qquad(R\ge1)
 }
 \tag{2.7}
\]

for all sufficiently large `Y`.

This is not a new single-block combinatorial proof.  It is a quantitative
specialization of the already verified argument, using the explicit
`eps^(-4/3)` fingerprint threshold rather than fixing `eps` first.

## 3. Sparse anchor block

For a CRT block edge `{p,q}`, put

\[
 q_{pq}(a)
 =\left(\frac{\operatorname{crtRepr}_{p,q}(a_p,a_q)}{pq}\right)^2
 \in[0,1/4].
\]

Let `C_P` be the exact coherent assignments

\[
 a_p=m\pmod p\qquad(p\in P)
\]

within the centered label range.  From (2.2)--(2.3), every assignment outside
`C_P` has

\[
 Q_P(a)\ge cF_Y.
 \tag{3.1}
\]

Choose

\[
 \rho_Y=C\varepsilon_Y
 \asymp Y^{-1/4}(\log Y)^{13/4},
 \tag{3.2}
\]

with `C` large enough for (1.5).  Apply Theorem 1.1 to the complete block graph.
Since

\[
 \rho_YF_Y
 \asymp Y^{3/4}(\log Y)^{1/4}\to\infty,
 \tag{3.3}
\]

the noncoherent sparse partition is super-polynomially small.

### Theorem 3.1 -- sparse Gibbs anchor

There exists an internal edge set `G_P subset binom(P,2)` such that:

\[
 \boxed{
 \Lambda(G_P)
 \ll Y^{-1/4}(\log Y)^{5/4},
 }
 \tag{3.4}
\]

\[
 \boxed{
 \sigma(G_P)^2
 \asymp Y^{-9/4}(\log Y)^{5/4},
 }
 \tag{3.5}
\]

and

\[
 \boxed{
 \sum_{a\notin C_P}e^{-cQ_{G_P}(a)}
 \le
 \exp\bigl(-c_1Y^{3/4}(\log Y)^{1/4}\bigr).
 }
 \tag{3.6}
\]

For every coherent label `m`, exactly

\[
 Q_{G_P}(m)=m^2\sigma(G_P)^2.
 \tag{3.7}
\]

The load calculation is

\[
 \rho_Y\Lambda\left(\binom P2\right)
 \asymp
 \frac{\rho_Y}{(\log Y)^2}
 =Y^{-1/4}(\log Y)^{5/4},
\]

and (3.5) follows similarly from
`\sigma_P^2 asymp 1/(Y^2(log Y)^2)`.

Thus the complete graph is not quantitatively necessary for the single-block
partition interface.  A vanishing fraction of its edges preserves the entire
coherent skeleton and annihilates the noncoherent complement.

## 4. The critical anchor scale

Let `Z` be the prefix ceiling and take a lower anchor block at scale

\[
 Y=Z^\alpha.
 \]

From (3.5),

\[
 \sigma_Y
 \asymp
 Y^{-9/8}(\log Y)^{5/8}.
 \tag{4.1}
\]

Use a logarithmic coherent cutoff `R_0=D^2 log Z`.  Its exact-label range is

\[
 |m|\le\frac{D\sqrt{\log Z}}{\sigma_Y}
 \asymp
 Y^{9/8}(\log Y)^{-5/8}\sqrt{\log Z}.
 \tag{4.2}
\]

Every selected denominator in the finite-prefix construction is at least a
constant multiple of `Z`.  To reconstruct the common Fourier label throughout
(4.2), one needs

\[
 \frac{|m|}{Z}=o(1).
 \tag{4.3}
\]

For fixed-power scales this requires

\[
 \alpha\le\frac89.
 \tag{4.4}
\]

At the endpoint

\[
 \boxed{Y=Z^{8/9},}
 \tag{4.5}
\]

one still has

\[
 \frac{|m|}{Z}\ll(\log Z)^{-1/8}\to0.
 \tag{4.6}
\]

The lower-anchor load becomes

\[
 \boxed{
 \Lambda_A
 \ll Z^{-2/9}(\log Z)^{5/4}.
 }
 \tag{4.7}
\]

The top sparse anchor at scale `Z` costs only

\[
 O\bigl(Z^{-1/4}(\log Z)^{5/4}\bigr),
\]

which is smaller.

### Criticality

The exponent `8/9` is the intersection of two independent constraints:

1. fingerprint entropy permits sparsification density only down to
   `Y^(-1/4)` up to logs;
2. coherent reconstruction requires the sparse anchor label scale to remain
   `o(Z)`.

It is therefore a structural exponent of the present mechanism, not an
arbitrary optimization.

## 5. Sparse cross-scale synchronization

Let

\[
 A\subset[Y,2Y],\qquad Y=Z^{8/9},
\]

and let

\[
 B\subset[Z/2,Z]
\]

be the top prime block.  Low-energy sparse-anchor assignments have labels

\[
 |u|\ll Z(\log Z)^{-1/8},
 \qquad
 |v|\ll Z^{9/8}(\log Z)^{-1/8}.
 \tag{5.1}
\]

Choose two primes `p_1,p_2 in A`.  Their product is

\[
 p_1p_2\asymp Z^{16/9},
\]

which exceeds every possible nonzero `|u-v|` in (5.1).  Hence, if `u!=v`, at
least one of `p_1,p_2` does not divide `u-v`.

For each `p_i`, sample `M=C log Z` actual primes from `B`.  Since
`p_i<=Z^(8/9)`, the top-block inverse energy has positive constant population
mean uniformly in every nonzero multiplier modulo `p_i`.  A union bound over
`d mod p_i` gives a sample `T_i` satisfying

\[
 \min_{d\ne0\bmod p_i}
 \sum_{q\in T_i}\left\|\frac{dq^{-1}}{p_i}\right\|^2
 \gg M.
 \tag{5.2}
\]

The cross-scale identity

\[
 \frac{n_{p_iq}(u,v)}{p_iq}
 \equiv
 \frac{v}{p_iq}+\frac{(u-v)q^{-1}}{p_i}
 \pmod1
\]

and (5.1) imply that the additive `v/(p_iq)` perturbation contributes `o(M)`.
Thus

\[
 \boxed{
 u\ne v
 \Longrightarrow
 Q_{\rm cross}(u,v)\gg\log Z.
 }
 \tag{5.3}
\]

Taking the sampling constant large makes the total distinct-label contribution
smaller than any prescribed inverse power of `Z`.

The reciprocal load of these cross edges is

\[
 O\left(\frac{\log Z}{YZ}\right)
 =O\left(Z^{-17/9}\log Z\right),
 \tag{5.4}
\]

negligible compared with (4.7).

## 6. Elimination of all non-anchor coordinates

The complete top block gives, for every non-anchor prime `r<=Z/2`, the hybrid
population bound

\[
 \frac1{|B|}\min_{d\ne0\bmod r}
 \sum_{q\in B}
 \left\|\frac{dq^{-1}}r\right\|^2
 \gg
 \max\left\{\frac1{r^2},\frac1{(\log Z)^2}\right\}.
 \tag{6.1}
\]

Sampling `O((log Z)^3)` actual top primes preserves these tests
simultaneously and gives row distance

\[
 D_r\gg(\log Z)^3
 \max\left\{\frac1{r^2},\frac1{(\log Z)^2}\right\}.
 \tag{6.2}
\]

This is enough for product-fibre compression over every non-anchor prefix
coordinate.

For the common coherent label in (4.2), the distinguished sensor energy obeys

\[
 E_r(m)
 \ll
 \frac{m^2(\log Z)^3}{r^2Z^2}.
\]

Dividing by (6.2) gives

\[
 \frac{E_r(m)}{D_r}
 \ll\frac{m^2}{Z^2}=o(1),
 \tag{6.3}
\]

uniformly in `r`.  Hence the decoded residue remains exactly `m mod r`
throughout the full lower-anchor coherent range.

The sensor reciprocal load is

\[
 O\left(\frac{(\log Z)^3\log\log Z}{Z}\right),
\]

again negligible relative to (4.7).

## 7. Fourier assembly at an arbitrary prefix

Take `Z=p_N` and use:

1. a sparse lower anchor at scale `Z^(8/9)`;
2. a sparse top anchor in `[Z/2,Z]`;
3. the sparse cross synchronizer of Section 5;
4. top-block sensors eliminating every remaining prime coordinate;
5. unused semiprime edges with denominator at least `Z` as the reciprocal-mass
   pool.

The reserved load is

\[
 \boxed{
 \Lambda_0(Z)
 \ll Z^{-2/9}(\log Z)^{5/4}.
 }
 \tag{7.1}
\]

The anchor Gibbs theorems eliminate every noncoherent anchor assignment.  The
cross synchronizer eliminates unequal coherent labels.  The sensor system
reconstructs all remaining coordinates from one common label `m`.

For

\[
 |m|\le M_0V^{-1/2},
\]

one has the usual positive Taylor/Gaussian main term.  Since all denominators
are `>=cZ`,

\[
 \frac1{Z\sqrt V}=o(1)
\]

in the tuned range, so the cubic remainder is uniform.  For the intermediate
range up to (4.2), the modulus inequality

\[
 |1-\theta+\theta e(m/e)|
 \le e^{-c\|m/e\|^2}
\]

and `m/e=o(1)` give the full-variance Gaussian tail without using a cubic
expansion.  Labels beyond the logarithmic anchor cutoff are absorbed by the
sparse-anchor energy, and all noncoherent sectors are super-polynomially small.

The hyperbolic mass pool tunes every

\[
 q\in
 \left[CZ^{-2/9}(\log Z)^{5/4},\frac15\right]
\]

with one Bernoulli parameter in a fixed compact subinterval of `(0,1)`.  Total
load remains below one, so modular positivity is exact by no-wrap.

### Theorem 7.1 -- arbitrary-prefix sparse-anchor candidate

For all sufficiently large `N`, with `Z=p_N`,

\[
 \boxed{
 \gamma_N
 \ll
 Z^{-2/9}(\log Z)^{5/4}.
 }
 \tag{7.2}
\]

Equivalently,

\[
 \boxed{
 \gamma_N
 \ll
 p_N^{-2/9}(\log p_N)^{5/4}
 \longrightarrow0.
 }
 \tag{7.3}
\]

This is a direct arbitrary-prefix candidate, stronger than the preceding
`O((log p_N)^(-2))` dyadic-plus-recurrence route.

## 8. General exponent law

The critical calculation has a reusable form.  Suppose a block level-set
theorem permits a moving entropy coefficient

\[
 \varepsilon_Y\asymp Y^{-\beta}L(Y)
\]

with slowly varying `L`.  Gibbs sparsification then gives load

\[
 Y^{-\beta}L(Y)/(\log Y)^2
\]

and sparse coherent scale

\[
 \sigma_Y\asymp
 Y^{-1-\beta/2}\,L(Y)^{1/2}/\log Y.
\]

The condition `sigma_Y^(-1)=o(Z)` allows

\[
 Y\le Z^{1/(1+\beta/2)}
\]

up to slowly varying factors.  The best resulting prefix-load exponent is

\[
 \boxed{
 \frac{2\beta}{2+\beta}.
 }
 \tag{8.1}
\]

For the current fingerprint threshold `beta=1/4`, this is `2/9`.

If future block entropy reached the natural scale `beta=1`, the same mechanism
would predict a `Z^(-2/3)` prefix floor up to logarithms.  Thus improvements to
single-block fingerprint entropy translate mechanically into stronger global
finite-prefix exponents.

## 9. Exact assurance boundary

The new mathematical content is:

1. Gibbs edge sparsification under a moving level-set entropy bound;
2. extraction of the moving SBEE coefficient
   `Y^(-1/4)(log Y)^(13/4)` from the verified threshold formulas;
3. the critical `8/9` scale law;
4. sparse two-prime cross synchronization;
5. the arbitrary-prefix exponent `2/9` candidate.

PDL should verify:

1. the moving-`eps` quantifier substitution in the exact Theorem A/C constants;
2. the exact coherent floor after combining nondominant forcing and the integer
   exception count;
3. the probabilistic simultaneous-event bookkeeping in Theorem 3.1;
4. the hybrid top-sensor population bound (6.1);
5. all Taylor, variance, and mass-pool inequalities at arbitrary prefix `Z`.

A failure of any listed implication returns as one exact `BLOCKED-FRONTIER`.
The present status is

`FULL ARGUMENT-LEVEL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.
