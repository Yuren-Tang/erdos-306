# Quantitative high-control extraction and dyadic transfer to the gap-free floor

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / FULL THEOREM CANDIDATE / ADVERSARIALLY CORRECTED / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22  
**Released-theorem consequence:** none  
**Workspace:** `research/e306-frontier-v1`

This note continues and supersedes the conditional frontier in
`GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`.  It closes the previously isolated
high-control rate by extracting an explicit moving bound from the accepted
level-set / localization / Peierls architecture.  It then proves the
finite-prefix statement on complete dyadic prefixes and transfers it to every
prefix by Li's exact floor recurrence.

An adversarial pass corrected two earlier formulations:

1. no large-deviation alias argument is needed: the total reciprocal load is
   `<1`, so every random subset sum already lies in one fundamental interval and
   a congruence modulo the primorial is automatically an exact equality;
2. “induced by one integer label” is not a valid definition of a diagonal CRT
   assignment, since every finite CRT assignment has an integer representative.
   The correct split is the accepted localization split into a high-energy floor
   sector and a coherent-label sector with exact quadratic energy.

After these corrections, the route still closes and becomes simpler.  The
result is the full theorem candidate

\[
 \gamma_N=O\!\left(\frac{\log\log p_N}{\log p_N}\right)\longrightarrow0.
\]

The argument is not independently reviewed, formalized, or integrated into the
current-best corpus.

## 1. Exact inputs and authority boundary

The immutable released Erdős 306 authority remains

`v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

with its two named Rosser--Schoenfeld assumptions.  Nothing here changes that
release or trust boundary.

The high-coordinate mechanism is consumed from the exact accepted
proof-development checkpoint

`proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`,

especially its level-set, localization, and Laplace architecture.

Research-level external inputs:

1. the prime number theorem and reciprocal-prime Mertens law;
2. Brun--Titchmarsh in the Montgomery--Vaughan form;
3. Li, arXiv:2606.15159v2, especially Lemma 7.3, Theorem 7.4, and Conjecture 9.1.

## 2. Abstract quantitative floor extraction

Let `A_k` be a finite assignment space, `Q_k:A_k->[0,infinity)` an energy,
`sigma_k>0` a deviation scale, and `J_k` a complexity count.  Let `F_k` be a
positive floor and let `Floor_k` be a sector satisfying

\[
 a\in Floor_k\quad\Longrightarrow\quad Q_k(a)\ge F_k.
 \tag{2.1}
\]

Fix constants

\[
 0<\alpha<c'<c.
\]

Assume the level-set estimate

\[
 \#\{a:Q_k(a)\le R\}
 \le e^{AJ_k}e^{\alpha R}
 \left(1+\frac{\sqrt R}{\sigma_k}\right)
 \qquad(R\ge1),
 \tag{2.2}
\]

with fixed `A`, and assume `sigma_k<=1` eventually.

### Theorem 2.1 -- quantitative Peierls extraction

There is `C=C(c',alpha)` such that

\[
 \sum_{a\in Floor_k}e^{-cQ_k(a)}
 \le
 \frac C{\sigma_k}
 \exp\bigl(AJ_k-(c-c')F_k\bigr).
 \tag{2.3}
\]

### Proof

On `Floor_k`,

\[
 e^{-cQ_k(a)}
 \le e^{-(c-c')F_k}e^{-c'Q_k(a)}.
\]

Shell summation of (2.2) gives

\[
 \sum_{a\in A_k}e^{-c'Q_k(a)}
 \le C(c',\alpha)e^{AJ_k}
 \left(1+\frac1{\sigma_k}\right).
\]

Use `1+1/sigma_k<=2/sigma_k`.  `square`

The significance is that a terminal theorem stated as “for every fixed
`eta>0`, eventually `<=eta/sigma_k`” contains a much stronger moving rate if its
proof retains the floor `F_k`.

## 3. Instantiation in the high-control system

Use dyadic prime blocks

\[
 k_0\le j\le K,
 \qquad2k_0\le K\le3k_0.
\]

Let `Qctrl`, `sigmaCtrl`, and `J=numBlocks` be the accepted high-control
objects.  The PDL checkpoint supplies, for every fixed sufficiently small
`alpha>0`,

\[
 \#\{a:Q_{\rm ctrl}(a)\le R\}
 \le e^{A_\alpha J}e^{\alpha R}
 \left(1+\frac{\sqrt R}{\sigma_{\rm ctrl}}\right).
 \tag{3.1}
\]

For `theta in [1/3,2/3]`, every control factor satisfies the Fourier damping
bound with

\[
 c_F=8\theta(1-\theta)\ge\frac{16}{9}.
 \tag{3.2}
\]

The localization theorem gives the exact dichotomy outside the high main arc:

1. the **floor sector**, where
   \[
   Q_{\rm ctrl}\ge
   F(k_0):=\min\{R_w(c_2,k_0),\Pi_{\rm floor}(e_0,k_0)\};
   \]
2. the **coherent-label sector**, carrying a common controlled integer label and
   the exact identity
   \[
   Q_{\rm ctrl}=m^2\sigma_{\rm ctrl}^2.
   \]

This is the correct substitute for the ambiguous word “diagonal”.

The accepted floor estimates give, eventually,

\[
 R_w(c_2,k_0)=\frac{c_2\,2^{k_0}}{(k_0\log2)^3},
 \tag{3.3}
\]

\[
 \Pi_{\rm floor}(e_0,k_0)
 \ge c_\Pi\frac{2^{2k_0}}{(k_0+1)^4},
 \tag{3.4}
\]

and `R_w<=Pi_floor`.  Hence

\[
 F(k_0)=R_w(c_2,k_0)\asymp\frac{2^{k_0}}{k_0^3}.
 \tag{3.5}
\]

Choose fixed `0<alpha<c'<16/9`.  Since `J<=2k_0+1`, Theorem 2.1 gives:

### Theorem 3.1 -- quantitative floor-sector rate

\[
 \sum_{a\in Floor(k_0)}
 \prod_{e\in E_{\rm ctrl}}
 \left|1-\theta+\theta e(h_a/e)\right|
 \le\frac{\varepsilon_{k_0}}{\sigma_{\rm ctrl}},
 \tag{3.6}
\]

where

\[
 \varepsilon_{k_0}
 \le C\exp\!\left(
 A(2k_0+1)-c\frac{2^{k_0}}{(k_0+1)^3}
 \right).
 \tag{3.7}
\]

Thus, for every fixed `M>0`,

\[
 \varepsilon_{k_0}=O_M(k_0^{-M}).
 \tag{3.8}
\]

This closes the quantitative part of the former `HC-RATE` interface with a
super-polynomial margin.  The coherent-label sector is not included in (3.6);
it is treated by its exact one-dimensional Gaussian energy.

## 4. Complete dyadic prefixes

For an integer `k`, put

\[
 X_k=2^k,
 \qquad Z_k=2^{2k+1},
 \qquad N_k=\pi(Z_k^-),
 \qquad P^{(k)}=P_{N_k}.
\]

Every prefix prime lies either in

\[
 \mathcal L_k=\{r<X_k:r\text{ prime}\}
\]

or in one complete block

\[
 \mathcal P_j=\{p:2^j\le p<2^{j+1},\ p\text{ prime}\},
 \qquad k\le j\le2k.
\]

Use three disjoint edge families.

### 4.1 Sensor edges

With top block `S_k=P_(2k)`, let

\[
 E_{\rm sens}=\{rs:r\in\mathcal L_k,\ s\in\mathcal S_k\}.
\]

PNT, Brun--Titchmarsh, and the multiplicity-sensitive cyclic-energy lemma give
uniformly in every low prime

\[
 \mathcal E_r(\{s^{-1}\bmod r:s\in\mathcal S_k\})
 \gg\frac{Z_k}{\log Z_k}.
 \tag{4.1}
\]

Sequential low-coordinate summation therefore has total excess `o(1)`.  Also

\[
 \Lambda_{\rm sens}=O\!\left(\frac{\log k}{k}\right),
 \qquad
 W_{2,{\rm sens}}\asymp\frac1{Z_k k}.
 \tag{4.2}
\]

Any additional low--high mass factors may be assigned to the low endpoint and
then discarded in absolute-value upper bounds; the sensor subfamily alone
supplies the required code distance.

### 4.2 High-control edges

On `P_k,...,P_(2k)`, take internal complete graphs and adjacent complete
bipartite graphs.  Then

\[
 \Lambda_{\rm ctrl}=O(1/k),
 \qquad
 \sigma_{\rm ctrl}^2\asymp\frac1{Z_k k^2}.
 \tag{4.3}
\]

Every high prime is incident, and the range has `K=2k`, satisfying the accepted
admissibility condition.

### 4.3 Mass edges

Take unused prefix pairs with

\[
 pq\ge Z_k.
\]

Their reciprocal capacity tends to

\[
 \frac{\pi^2}{12}.
 \tag{4.4}
\]

Deleting sensor and control edges removes only `o(1)` mass.

Every selected denominator is at least `Z_k/2`; this is used for the uniform
Taylor expansion.  Exactness will instead follow from the stronger no-wrap
property below.

## 5. Target tuning and no-wrap exactness

Let

\[
 \Lambda_0(k)=\Lambda_{\rm sens}+\Lambda_{\rm ctrl}
 =O\!\left(\frac{\log k}{k}\right).
\]

For

\[
 q=\frac{t}{P^{(k)}}
 \in\left[C\frac{\log k}{k},\frac15\right],
\]

greedily add mass edges until

\[
 2q\le\Lambda<2q+O(1/Z_k),
\]

and set `theta=q/Lambda`.  Then

\[
 \frac13\le\theta\le\frac12,
 \qquad
 \theta\sum_{e\in E}\frac1e=q,
 \qquad
 \Lambda<0.41
 \tag{5.1}
\]

for large `k`.

Let

\[
 T=\sum_{e\in E}\frac{\xi_e}{e},
 \qquad S=P^{(k)}T.
\]

Since every `xi_e` is `0` or `1`,

\[
 0\le T\le\Lambda<1.
 \tag{5.2}
\]

Also `0<=q<=1/5`.  Hence both `S` and `t` lie in `[0,P^{(k)})`.  Therefore

### Lemma 5.1 -- no-wrap transfer

\[
 S\equiv t\pmod{P^{(k)}}
 \quad\Longrightarrow\quad S=t.
 \tag{5.3}
\]

No alias probability or least-prime exponent is involved.  This corrects the
large-deviation detour in the preceding note.

## 6. Fourier partition at the dyadic levels

Put

\[
 V=\theta(1-\theta)\sum_{e\in E}\frac1{e^2}.
\]

The load estimates imply

\[
 \frac c{Z_k k}\le V\le\frac C{Z_k},
 \qquad
 \frac{\sqrt V}{\sigma_{\rm ctrl}}=O(k).
 \tag{6.1}
\]

The exact character formula is

\[
 \Pr(S\equiv t\pmod{P^{(k)}})
 =\frac1{P^{(k)}}
 \sum_{h\bmod P^{(k)}}e(-hq)
 \prod_{e\in E}\left(1-\theta+\theta e(h/e)\right).
 \tag{6.2}
\]

Partition the high-coordinate assignment by the accepted localization theorem.

### 6.1 Floor sector

Sum every low coordinate conditionally.  Top-block suppression contributes a
factor `1+o(1)`.  Drop all non-control factors in modulus and apply (3.6).  The
floor-sector contribution is

\[
 \ll\frac{\varepsilon_k}{\sigma_{\rm ctrl}}
 =o(V^{-1/2})
 \tag{6.3}
\]

by (3.8) and (6.1).

### 6.2 Coherent-label sector

For a coherent high assignment, the localization theorem provides a common
controlled label `m` and exact control energy

\[
 Q_{\rm ctrl}=m^2\sigma_{\rm ctrl}^2.
\]

The low-coordinate sensor code has one distinguished residue `m mod r`; all
other low residues have total weight

\[
 \exp(-\Omega(Z_k/\log Z_k)).
\]

The distinguished low residues reconstruct the single global frequency `h=m`
modulo `P^{(k)}`.  Thus this sector reduces to a one-dimensional frequency sum.

For `|m|<=c_0V^{-1/2}`, the denominator floor `e>=Z_k/2` and (6.1) give a uniform
Taylor expansion

\[
 \log(1-\theta+\theta e(m/e))
 =2\pi i\theta m/e
  -2\pi^2\theta(1-\theta)m^2/e^2
  +O(|m/e|^3).
\]

The linear term cancels `e(-mq)` by (5.1), and the cubic remainder is `o(1)`.
Therefore the main labels have positive real contribution

\[
 \gg V^{-1/2}.
 \tag{6.4}
\]

The coherent labels beyond the main Gaussian window are bounded by the exact
quadratic energy and the full variance, giving a tail

\[
 O(e^{-c_0^2}V^{-1/2}).
 \tag{6.5}
\]

Choose `c_0` once so that this is a small fraction of (6.4).  Labels outside the
coherent range fall back into the floor sector by localization.

Combining (6.3)--(6.5):

\[
 \Pr(S\equiv t\pmod{P^{(k)}})
 \gg\frac1{P^{(k)}\sqrt V}>0.
 \tag{6.6}
\]

Lemma 5.1 turns this congruence into an exact subset sum.

### Theorem 6.1 -- dyadic finite-prefix coverage

There is `C>0` such that for all sufficiently large `k`, every integer `t` with

\[
 C\frac{\log k}{k}P^{(k)}
 \le t\le\frac15P^{(k)}
 \tag{6.7}
\]

belongs to `L^2(N_k)`.

## 7. Dyadic floor and transfer to all prefixes

Li's Theorem 7.4 gives

\[
 \gamma_N\le0.181\ldots<\frac15
 \qquad(N\ge10).
 \tag{7.1}
\]

Its central band overlaps Theorem 6.1.  Complement symmetry therefore yields

\[
 \gamma_{N_k}=O\!\left(\frac{\log k}{k}\right).
 \tag{7.2}
\]

Li's Lemma 7.3 states, under a side condition already guaranteed by (7.1),

\[
 \gamma_N\le\gamma_{N-1}+\frac{w_N}{p_N}.
 \tag{7.3}
\]

His proof also gives eventually

\[
 w_N\le\frac4{\sqrt{p_N}},
\]

so

\[
 \sum_N\frac{w_N}{p_N}<\infty.
 \tag{7.4}
\]

For `N_k<=N<N_(k+1)`, iterate from `N_k`:

\[
 \gamma_N
 \le\gamma_{N_k}+\sum_{j>N_k}\frac{w_j}{p_j}.
 \tag{7.5}
\]

The tail tends to zero and is
`O(1/(sqrt(Z_k)log Z_k))` under PNT.  Since `Z_(k+1)=4Z_k`,
`log p_N asymp k` throughout the interval.

### Theorem 7.1 -- Gap-Free Floor theorem candidate

\[
 \boxed{
 \gamma_N
 =O\!\left(\frac{\log\log p_N}{\log p_N}\right)
 \longrightarrow0.
 }
 \tag{7.6}
\]

This proves Li's Conjecture 9.1 at the present argument level.  By Li's
Proposition 9.2 it also yields the full positive-rational, squarefree-denominator
`omega=2` theorem directly.

## 8. Corrected disposition of the sparse route

The preceding note claimed that a least-prime-only sparse realization would
need a Linnik exponent `<2` because of alias removal.  That claim is withdrawn:
no-wrap exactness depends only on total reciprocal load `<1`, not on the size of
the realizing primes.

Sparse prescribed-residue realization remains a separate design question, but
its actual costs are now:

1. fitting all prescribed primes inside the target prefix;
2. controlling every prefix prime not included in the sparse low sensor set;
3. maintaining a high-control range whose entropy is absorbed by its lowest
   energy floor.

No impossibility or exponent obstruction is claimed here.

## 9. Current frontier and assurance work

No new-mathematics implication is presently missing from the preferred
complete-dyadic route.  Remaining work is adversarial assurance and exact proof
expansion:

1. audit the moving-rate extraction (2.3) against the exact PDL quantifiers;
2. audit the coherent-label reconstruction and Gaussian tail with one fixed
   constant hierarchy;
3. verify all dyadic endpoint, incidence, and disjoint-edge conventions;
4. verify the exact overlap with Li's central band and every recurrence side
   condition;
5. audit PNT/Mertens/Brun--Titchmarsh uniformities;
6. search specifically for an unused-prime, double-assignment, wrapping, or
   frequency-lane counterexample.

The theorem remains `NOT INDEPENDENTLY REVIEWED`; no release, corpus,
manuscript, formalization, or publication status changes here.
