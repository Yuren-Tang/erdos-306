# Quantitative high-control extraction and dyadic transfer to the gap-free floor

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / FULL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22  
**Released-theorem consequence:** none  
**Workspace:** `research/e306-frontier-v1`

This note continues `GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`.  It closes the
previously isolated input `HC-RATE(z)` by extracting an explicit rate from the
existing global-control / Peierls architecture, and it removes the arbitrary
prefix-endpoint problem by proving the finite-prefix statement first on complete
dyadic prefixes and then using Li's exact floor recurrence.

The result is a full argument candidate for Li's Gap-Free Floor conjecture:

\[
 \gamma_N=O\!\left(\frac{\log\log p_N}{\log p_N}\right)\longrightarrow0.
\]

This classification is deliberately weaker than `PROVED` in the project trust
sense.  The argument has not been independently reviewed, formalized, or
integrated into the current-best mathematical corpus.  It uses the accepted PDL
high-control theorem at the exact checkpoint named below and standard analytic
prime inputs as research-level premises.

## 1. Exact inputs and authority boundary

The immutable released Erdős 306 authority remains

`v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

with its two named Rosser--Schoenfeld assumptions.  Nothing in this note changes
that release or its trust boundary.

The high-coordinate input is consumed from the exact accepted proof-development
checkpoint

`proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`,

especially the level-set, localization, and Laplace architecture recorded in

- `proof-development/E306-PD-MECH-01-MANUSCRIPT-ARCHITECTURE.md`;
- `proof-development/ARTICLE_CORE_CHECKPOINT.md`.

The research-level external inputs are:

1. the prime number theorem and the reciprocal-prime Mertens law;
2. Brun--Titchmarsh in the Montgomery--Vaughan form;
3. Li, *Every natural number is a sum of distinct semiprime unit fractions*,
   arXiv:2606.15159v2, in particular Lemma 7.3, Theorem 7.4, and Conjecture 9.1.

## 2. Abstract quantitative Peierls extraction

The useful principle is more general than the present arithmetic application.

Let `A_k` be a finite assignment space with nonnegative energy `Q_k`, deviation
scale `sigma_k>0`, block count `J_k`, and a distinguished diagonal subset.  Fix
constants

\[
 0<\alpha<c'<c.
\]

Assume that for every `R>=1`,

\[
 \#\{a:Q_k(a)\le R\}
 \le
 \exp(AJ_k)\exp(\alpha R)
 \left(1+\frac{\sqrt R}{\sigma_k}\right),
 \tag{2.1}
\]

with fixed `A`, and that every off-diagonal assignment has

\[
 Q_k(a)\ge F_k.
 \tag{2.2}
\]

Assume also `sigma_k<=1` eventually.

### Theorem 2.1 -- quantitative floor extraction

There is a constant `C=C(c',alpha)` such that

\[
 \sum_{a\ \mathrm{offdiag}}e^{-cQ_k(a)}
 \le
 \frac{C}{\sigma_k}
 \exp\bigl(AJ_k-(c-c')F_k\bigr).
 \tag{2.3}
\]

### Proof

For every off-diagonal `a`,

\[
 e^{-cQ_k(a)}
 =e^{-(c-c')Q_k(a)}e^{-c'Q_k(a)}
 \le e^{-(c-c')F_k}e^{-c'Q_k(a)}.
\]

The shell summation of (2.1), equivalently the standard partition-series
estimate, gives

\[
 \sum_{a\in A_k}e^{-c'Q_k(a)}
 \le
 C(c',\alpha)e^{AJ_k}\left(1+\frac1{\sigma_k}\right).
\]

Since `sigma_k<=1`, the last factor is at most `2/sigma_k`.  Absorb the `2` in
`C`.  This proves (2.3).  `square`

### Remark 2.2

The theorem extracts a *moving* error rate from a theorem often stated in the
weaker terminal form

> for every fixed `eta>0`, the tail is eventually at most `eta/sigma_k`.

The moving rate is available whenever the proof retains a quantitative energy
floor.  No new combinatorics are needed.

## 3. Instantiation in the Erdős 306 high-control system

Take dyadic prime blocks indexed by

\[
 k_0\le j\le K,
 \qquad 2k_0\le K\le3k_0.
\]

Let `Qctrl`, `sigmaCtrl`, and `J=numBlocks` be the accepted global-control
objects.  The PDL checkpoint supplies, for every fixed sufficiently small
level-set exponent `alpha>0`,

\[
 \#\{a:Q_{\rm ctrl}(a)\le R\}
 \le
 e^{A_\alpha J}e^{\alpha R}
 \left(1+\frac{\sqrt R}{\sigma_{\rm ctrl}}\right).
 \tag{3.1}
\]

For Bernoulli parameters in `[1/3,2/3]`, the Fourier damping exponent may be
fixed as

\[
 c_F=\frac{16}{9}.
 \tag{3.2}
\]

The localization theorem says that an assignment outside the high main arc is
either

1. above the global control floor, or
2. globally diagonal with exact quadratic label energy.

In particular, a genuinely off-diagonal assignment is always above the floor

\[
 F(k_0)=\min\{R_w(c_2,k_0),\Pi_{\rm floor}(e_0,k_0)\}.
 \tag{3.3}
\]

The accepted cold-block and boundary estimates give, eventually,

\[
 R_w(c_2,k_0)
 =\frac{c_2\,2^{k_0}}{(k_0\log2)^3},
 \tag{3.4}
\]

and

\[
 \Pi_{\rm floor}(e_0,k_0)
 \ge c_\Pi\frac{2^{2k_0}}{(k_0+1)^4}.
 \tag{3.5}
\]

Moreover the localization proof establishes

\[
 R_w(c_2,k_0)\le\Pi_{\rm floor}(e_0,k_0)
 \tag{3.6}
\]

for all sufficiently large `k_0`.  Hence

\[
 F(k_0)=R_w(c_2,k_0)
 \asymp\frac{2^{k_0}}{k_0^3}.
 \tag{3.7}
\]

Choose fixed

\[
 0<\alpha<c'<c_F.
\]

Since `J<=2k_0+1`, Theorem 2.1 yields:

### Theorem 3.1 -- explicit `HC-RATE`

For every sufficiently large `k_0`,

\[
 \sum_{a\ \mathrm{offdiag}}
 \prod_{e\in E_{\rm ctrl}}
 \left|1-\theta+\theta e(h_a/e)\right|
 \le
 \frac{\varepsilon_{k_0}}{\sigma_{\rm ctrl}},
 \tag{3.8}
\]

uniformly for `theta in [1/3,2/3]`, where

\[
 \varepsilon_{k_0}
 \le
 C\exp\!\left(
  A(2k_0+1)-c\frac{2^{k_0}}{(k_0+1)^3}
 \right)
 \tag{3.9}
\]

for fixed positive constants `A,c,C`.

Consequently, for every fixed `M>0`,

\[
 \varepsilon_{k_0}=O_M(k_0^{-M}).
 \tag{3.10}
\]

Thus the earlier requirement

\[
 \varepsilon_z=o(1/\log z)
\]

is not merely satisfied; it is satisfied with a super-polynomial margin after
`k_0 asymp log z`.

### Corollary 3.2

The interface `HC-RATE(z)` isolated in
`GLOBAL_FINITE_PREFIX_TRANSFER_V1.md` is closed by the existing accepted
high-control architecture.  It is not a new analytic hypothesis.

## 4. Why arbitrary prefix endpoints should not be attacked directly

For an arbitrary endpoint `z=p_N`, the last dyadic interval may contain too few
primes to serve as one of the dense high-control blocks.  Also every prime factor
of `P_N` must occur in at least one selected denominator: if a prime `r|P_N` is
unused, every selected integer atom `P_N/(pq)` is divisible by `r`, so arbitrary
targets cannot be represented.

This is a genuine bookkeeping obstruction to a direct arbitrary-endpoint block
construction, but it is not a mathematical obstruction to GFF.  The right route
is:

1. prove a quantitative floor bound on complete dyadic prefixes;
2. transfer it to all intermediate levels using Li's one-step floor recurrence.

## 5. Complete dyadic prefixes

For an integer `k` put

\[
 X_k=2^k,
 \qquad Z_k=2^{2k+1},
 \qquad N_k=\pi(Z_k^-),
\]

so the first `N_k` primes are exactly the primes below `Z_k`.  Let

\[
 P^{(k)}=P_{N_k}.
\]

Partition these primes into

\[
 \mathcal L_k=\{r<X_k:r\text{ prime}\}
\]

and the complete dyadic high blocks

\[
 \mathcal P_j=\{p:2^j\le p<2^{j+1},\ p\text{ prime}\},
 \qquad k\le j\le2k.
\]

Their union is every prime in `[X_k,Z_k)`.  Hence every prime in the prefix is
either low or belongs to one complete high block.

Use the following disjoint edge families.

### 5.1 Sensor edges

Let the top block be `S_k=P_{2k}` and put

\[
 E_{\rm sens}
 =\{rs:r\in\mathcal L_k,\ s\in\mathcal S_k\}.
 \tag{5.1}
\]

The top-block energy theorem from `GLOBAL_FINITE_PREFIX_TRANSFER_V1.md` gives,
uniformly for every low prime,

\[
 \mathcal E_r(\{s^{-1}\bmod r:s\in\mathcal S_k\})
 \gg\frac{Z_k}{\log Z_k}.
 \tag{5.2}
\]

Therefore sequential summation of all low CRT coordinates costs only

\[
 1+o(1).
 \tag{5.3}
\]

The reciprocal and square loads satisfy

\[
 \Lambda_{\rm sens}=O\!\left(\frac{\log k}{k}\right),
 \qquad
 W_{2,{\rm sens}}\asymp\frac1{Z_k k}.
 \tag{5.4}
\]

### 5.2 High-control edges

On the blocks `P_k,...,P_{2k}`, use the internal complete graphs and adjacent
complete bipartite graphs of the accepted global-control construction.  Then

\[
 \Lambda_{\rm ctrl}=O(1/k),
 \qquad
 \sigma_{\rm ctrl}^2\asymp\frac1{Z_k k^2}.
 \tag{5.5}
\]

Every high prime is incident to a control edge.  The block range has `K=2k`, so
it satisfies the admissible global-range condition exactly.

### 5.3 Mass edges

Use unused pairs of prefix primes satisfying

\[
 pq\ge Z_k.
 \tag{5.6}
\]

Their total reciprocal capacity tends to

\[
 \frac{\pi^2}{12}.
 \tag{5.7}
\]

Deleting the sensor and control families removes only `o(1)` reciprocal mass.

### 5.4 Uniform denominator floor

Every sensor and mass denominator is at least `Z_k`; every high-control
denominator is at least

\[
 2^{2k}=Z_k/2.
\]

Thus every selected denominator obeys

\[
 e\ge Z_k/2.
 \tag{5.8}
\]

This fixed-factor form is sufficient for both the Taylor expansion and alias
removal.

## 6. Quantitative exact coverage at dyadic levels

Let

\[
 \Lambda_0(k)=\Lambda_{\rm sens}+\Lambda_{\rm ctrl}
 =O\!\left(\frac{\log k}{k}\right).
 \tag{6.1}
\]

For every target

\[
 q=\frac{t}{P^{(k)}}
 \in\left[C\frac{\log k}{k},\frac15\right]
 \tag{6.2}
\]

with a sufficiently large fixed `C`, greedily add mass edges until the total
reciprocal load `Lambda` satisfies

\[
 2q\le\Lambda<2q+O(1/Z_k).
 \tag{6.3}
\]

Set

\[
 \theta=q/\Lambda.
 \tag{6.4}
\]

Then

\[
 \frac13\le\theta\le\frac12,
 \qquad
 \theta\sum_{e\in E}\frac1e=q.
 \tag{6.5}
\]

Let

\[
 V=\theta(1-\theta)\sum_{e\in E}\frac1{e^2}.
\]

The load estimates give

\[
 \frac{c}{Z_k k}\le V\le\frac{C}{Z_k},
 \qquad
 \frac{\sqrt V}{\sigma_{\rm ctrl}}=O(k).
 \tag{6.6}
\]

The exact finite-prefix Fourier formula, low-coordinate elimination, Theorem 3.1,
and the one-dimensional diagonal Gaussian analysis now give

\[
 \Pr(S\equiv t\pmod{P^{(k)}})
 \gg\frac1{P^{(k)}\sqrt V}.
 \tag{6.7}
\]

Here the minor decomposition is:

1. genuinely off-diagonal high assignments, bounded by (3.8)--(3.10);
2. diagonal labels outside a fixed Gaussian main window, bounded by the full
   variance `V` and the accepted diagonal localization;
3. low-coordinate siblings, bounded by the top-block cyclic energy (5.2).

Since every selected denominator is at least `Z_k/2` and the total load is below
`0.41` eventually,

\[
 \sum_{e\in E}\frac1{e^2}\le\frac{2\Lambda}{Z_k},
\]

so Hoeffding gives

\[
 \Pr\left(\left|\sum_e\frac{\xi_e}{e}-q\right|\ge1\right)
 \le\exp(-cZ_k)
 =o\!\left(\frac1{P^{(k)}\sqrt V}\right).
 \tag{6.8}
\]

The congruence solution is therefore an exact equality.

### Theorem 6.1 -- dyadic finite-prefix coverage

There is a constant `C>0` such that for every sufficiently large `k`, every
integer `t` satisfying

\[
 C\frac{\log k}{k}P^{(k)}
 \le t\le\frac15P^{(k)}
 \tag{6.9}
\]

belongs to `L^2(N_k)`.

By complement symmetry the reflected interval at the upper endpoint is also
covered.

## 7. Dyadic gap-free-floor bound

Li's Theorem 7.4 gives the unconditional bound

\[
 \gamma_N\le0.181\ldots<\frac15
 \qquad(N\ge10).
 \tag{7.1}
\]

Consequently its central gap-free band overlaps the interval supplied by
Theorem 6.1.  Together with complement symmetry:

### Corollary 7.1

\[
 \gamma_{N_k}
 =O\!\left(\frac{\log k}{k}\right).
 \tag{7.2}
\]

Equivalently,

\[
 \gamma_{N_k}
 =O\!\left(\frac{\log\log p_{N_k}}{\log p_{N_k}}\right).
 \tag{7.3}
\]

## 8. Transfer from the dyadic subsequence to every prefix

Li defines

\[
 w_N=
 \max_{r\in\mathbf Z/p_N\mathbf Z}
 \min\left\{\sum_{i\in T}\frac1{p_i}:
 T\subseteq\{1,\ldots,N-1\},\
 \sum_{i\in T}p_i^{-1}\equiv r\pmod{p_N}\right\}.
\]

His Lemma 7.3 states that, whenever the feed residues cover and
`gamma_{N-1}<=0.45 B_{N-1}`,

\[
 \gamma_N\le\gamma_{N-1}+\frac{w_N}{p_N}.
 \tag{8.1}
\]

The unconditional bound (7.1) ensures the side condition at every sufficiently
large step.  Moreover Li proves

\[
 w_N\le\frac4{\sqrt{p_N}}
 \tag{8.2}
\]

beyond an absolute threshold.  Hence

\[
 \sum_N\frac{w_N}{p_N}
 \le4\sum_Np_N^{-3/2}<\infty.
 \tag{8.3}
\]

For `N_k<=N<N_{k+1}`, iteration of (8.1) gives

\[
 \gamma_N
 \le\gamma_{N_k}
   +\sum_{j>N_k}\frac{w_j}{p_j}.
 \tag{8.4}
\]

The tail tends to zero; with the prime number theorem it is

\[
 O\!\left(\frac1{\sqrt{Z_k}\log Z_k}\right),
 \tag{8.5}
\]

which is negligible compared with `log k/k`.  Since
`Z_{k+1}=4Z_k`, `log p_N asymp k` throughout this interval.

### Theorem 8.1 -- Gap-Free Floor theorem candidate

\[
 \boxed{
 \gamma_N
 =O\!\left(\frac{\log\log p_N}{\log p_N}\right)
 \longrightarrow0.
 }
 \tag{8.6}
\]

Thus the argument proves Li's Conjecture 9.1, subject only to the stated trust
classification of the consumed high-control checkpoint and the standard
research-level analytic inputs.

By Li's Proposition 9.2, (8.6) would also give the full positive-rational
`squarefree denominator / omega=2` representation theorem directly, without the
`omega=3` lift.

## 9. What changed relative to the previous frontier

The previous note isolated two apparent obstacles:

1. `HC-RATE(z)`;
2. quantitative sparse prime-residue realization.

The present disposition is:

- `HC-RATE(z)`: **closed**, with super-polynomial margin, by quantitative
  extraction from the accepted Peierls proof;
- sparse prescribed-residue realization: **not needed** on the preferred route;
- arbitrary partial top dyadic block: **bypassed** by complete dyadic prefixes
  and Li's summable floor recurrence;
- full GFF: **full theorem candidate**, not yet independently reviewed.

## 10. Remaining assurance and proof-development work

No further *visible new-mathematics implication* remains in this route.  The
remaining work is assurance and exact proof expansion:

1. independently audit the mapping from the accepted PDL level-set and
   localization theorems to Theorem 3.1;
2. verify all endpoint conventions in the complete dyadic prefix architecture;
3. expand the diagonal-frequency partition in Section 6 with one fixed set of
   constants;
4. verify the exact overlap with Li's `0.181...` central band and the one-step
   recurrence side condition;
5. audit the PNT/Mertens/Brun--Titchmarsh source statements and uniformities;
6. decide whether the theorem belongs as an independent finite-prefix result, a
   sequel, or a broader arithmetic product-code theorem.

These are not authorization for writes outside `research/**`, nor are they
claims of independent verification, Lean formalization, publication readiness,
or change to the released Erdős 306 theorem.
