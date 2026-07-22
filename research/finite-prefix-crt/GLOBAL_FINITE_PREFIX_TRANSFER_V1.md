# Global finite-prefix Fourier transfer and prefix-compatible realization

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `ARGUMENT / MATERIAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22  
**Released-theorem consequence:** none  
**Workspace:** `research/e306-frontier-v1`

This note continues `CRT_SUPPRESSION_THEOREMS_V1.md`.  It replaces the earlier
working assumption that the sparse designed-residue route is the preferred
finite-prefix realization.  A robust prefix-compatible route uses the entire
top prime block as a common sensor reservoir.  The local CRT suppression,
prime-block energy, exact Fourier alias removal, and reciprocal-mass budget
then fit together without a prime-in-progressions realization theorem.

The remaining exact research interface is a quantitative high-coordinate
control estimate at the prefix scale.  No full gap-free-floor theorem is
claimed here.

## 1. Authority and external inputs

The immutable released authority remains

`v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

with its two named Rosser--Schoenfeld assumptions.  The present note uses the
following only as research-level mathematical inputs:

1. Li, *Every natural number is a sum of distinct semiprime unit fractions*,
   arXiv:2606.15159v2, especially Definition 2.1, Lemma 7.3 and Conjecture 9.1;
2. the prime number theorem and the reciprocal-prime Mertens law;
3. the Brun--Titchmarsh theorem, in the Montgomery--Vaughan form;
4. the existing Erdős 306 high-coordinate control architecture only as a
   candidate reusable mechanism, not as a newly released premise.

The least-prime-in-progression comparison in Section 12 uses Linnik's theorem
and the current unconditional exponent only to classify the sparse route.  It
is not needed by the abundance/top-block route.

## 2. The exact finite-prefix Fourier object

Let `z=p_N` and

\[
 \Pi(z):=\prod_{p\le z}p=P_N.
\]

For an unordered pair `e={p,q}` of distinct primes at most `z`, write also
`e=pq`.  Its semiprime atom in Li's integer subset-sum model is

\[
 a_e=\frac{\Pi(z)}e.
\]

Fix a finite edge set `E`, and let `(\xi_e)_{e\in E}` be independent
Bernoulli variables with common parameter `theta`.  Put

\[
 T=\sum_{e\in E}\frac{\xi_e}{e},
 \qquad
 S=\Pi(z)T=\sum_{e\in E}\xi_e a_e.
\]

For an integer target `t` put `q=t/\Pi(z)`.  If

\[
 \theta\sum_{e\in E}\frac1e=q,
 \tag{2.1}
\]

then `E[T]=q`.

### Proposition 2.1 -- finite-prefix congruence formula

\[
 \Pr(S\equiv t\pmod{\Pi(z)})
 =\frac1{\Pi(z)}\sum_{h\bmod\Pi(z)}
 e(-hq)
 \prod_{e\in E}
 \left(1-\theta+\theta e\!\left(\frac he\right)\right).
 \tag{2.2}
\]

This is ordinary character orthogonality, since

\[
 \frac{ha_e}{\Pi(z)}=\frac he.
\]

The formula is exact and uses only edges inside the fixed prime prefix.

## 3. Congruence-to-exact transfer by alias removal

A positive value of (2.2) gives a subset sum congruent to `t`, not yet the
exact value `t`.  The missing point is a large-deviation comparison.

### Lemma 3.1 -- alias inequality

If `E[T]=q=t/\Pi(z)`, then

\[
 \Pr(S=t)
 \ge
 \Pr(S\equiv t\pmod{\Pi(z)})
 -\Pr(|T-q|\ge1).
 \tag{3.1}
\]

Indeed, every other integer in the same congruence class has the form
`t+k\Pi(z)`, `k\ne0`, and therefore differs from `t` by at least `\Pi(z)`.

Write

\[
 W_2(E)=\sum_{e\in E}\frac1{e^2}.
\]

Hoeffding's inequality gives

\[
 \Pr(|T-q|\ge1)
 \le2\exp\!\left(-\frac2{W_2(E)}\right).
 \tag{3.2}
\]

### Corollary 3.2 -- prefix-compatible alias scale

Assume every `e\in E` satisfies `e\ge z` and

\[
 \Lambda(E):=\sum_{e\in E}\frac1e\le\Lambda_*<2.
\]

Then

\[
 W_2(E)\le\frac{\Lambda_*}{z},
 \qquad
 \Pr(|T-q|\ge1)
 \le2e^{-2z/\Lambda_*}.
 \tag{3.3}
\]

Since `log \Pi(z)=\vartheta(z)=z+o(z)`, this error is
`o(1/(\Pi(z)z^C))` for every fixed `C` whenever `2/\Lambda_*>1`.
In the construction below one may take `\Lambda_*<0.41`, leaving a large
exponential margin.

This is the first global-transfer requirement missed by a least-prime-only
sparse realization: the realizing primes must be high enough that the sum of
squared reciprocal atom sizes is `O(1/z)`.

## 4. A multiplicity-sensitive cyclic energy lemma

Let `r` be prime and let `U=(u_1,...,u_M)` be a multiset in
`(Z/rZ)^x`.  Define

\[
 \mathcal E_r(U)=
 \min_{d\ne0\bmod r}
 \sum_{j=1}^M\left\|\frac{du_j}{r}\right\|^2.
\]

Let `mu(U)` be the largest multiplicity of one residue in `U`.

### Lemma 4.1

\[
 \mathcal E_r(U)
 \ge
 \frac{M^3}{12\,\mu(U)^2r^2}.
 \tag{4.1}
\]

### Proof

Multiplication by a nonzero `d` preserves the maximal multiplicity.  Write the
centered nonzero representatives in increasing order of absolute value,
`a_1<=...<=a_M`.  Each absolute value can occur at most `2mu(U)` times, so

\[
 a_i\ge \frac{i}{2\mu(U)}.
\]

Consequently

\[
 \sum_i\left(\frac{a_i}{r}\right)^2
 \ge\frac1{4\mu(U)^2r^2}\sum_{i=1}^Mi^2
 \ge\frac{M^3}{12\mu(U)^2r^2}.
\]

Combining this with Theorem 3.1 of `CRT_SUPPRESSION_THEOREMS_V1.md` gives a
shift-uniform local partition estimate from any upper bound for `mu(U)`.

## 5. The full top block is a linear-energy sensor

Let

\[
 \mathcal S_z=\{s\text{ prime}:z/2<s\le z\}.
\]

For a prime `r<sqrt(z)` define the unit multiset

\[
 U_r=\{s^{-1}\bmod r:s\in\mathcal S_z\}.
\]

### Theorem 5.1 -- top-block cyclic energy

There is an absolute `c>0` such that, for all sufficiently large `z` and every
prime `r<sqrt(z)`,

\[
 \mathcal E_r(U_r)\ge c\frac{z}{\log z}.
 \tag{5.1}
\]

The bound is uniform in `r`.

### Proof

Put `M=|\mathcal S_z|`.  The prime number theorem gives

\[
 M\gg \frac z{\log z}.
 \tag{5.2}
\]

The multiplicity of a residue of `U_r` is the number of primes in
`(z/2,z]` in one reduced residue class modulo `r`.  Brun--Titchmarsh gives

\[
 \mu(U_r)
 \ll
 \frac{z}{(r-1)\log(z/(2r))}.
 \tag{5.3}
\]

For `r<sqrt(z)`,

\[
 \log(z/(2r))\ge \frac12\log z-O(1).
\]

Substitution of (5.2)--(5.3) into (4.1), together with
`(r-1)^2/r^2>=1/4`, yields (5.1).

### Corollary 5.2 -- simultaneous low-coordinate suppression

Fix `theta` in a compact subinterval of `(0,1)`.  For arbitrary shifts
`alpha_s`,

\[
 \sum_{x\bmod r}
 \prod_{s\in\mathcal S_z}
 \left|1-\theta+\theta
 e\!\left(\alpha_s+\frac{x s^{-1}}r\right)\right|
 \le1+r\exp\!\left(-c_\theta\frac z{\log z}\right)
 \tag{5.4}
\]

uniformly for every prime `r<sqrt(z)`.

Hence

\[
 \prod_{r<\sqrt z\atop r\text{ prime}}
 \left(1+r e^{-c_\theta z/\log z}\right)=1+o(1).
 \tag{5.5}
\]

No prescribed residue classes and no prime-in-progressions realization are
needed.  The actual top-block primes already form a sufficiently high-energy
sensor family.

## 6. Prefix-compatible edge architecture

Split the prefix primes into

\[
 \mathcal L_z=\{r<\sqrt z:r\text{ prime}\},
 \qquad
 \mathcal H_z=\{\sqrt z\le p\le z:p\text{ prime}\}.
\]

Use three disjoint edge families.

### 6.1 Sensor edges

\[
 E_{\rm sens}=\{rs:r\in\mathcal L_z,\ s\in\mathcal S_z\}.
\]

Every sensor denominator satisfies `rs>=z`, because `r>=2` and `s>z/2`.
Their reciprocal load factorizes:

\[
 \Lambda_{\rm sens}
 =\left(\sum_{r<\sqrt z}\frac1r\right)
  \left(\sum_{z/2<s\le z}\frac1s\right)
 =O\!\left(\frac{\log\log z}{\log z}\right).
 \tag{6.1}
\]

Their square load is

\[
 W_{2,\rm sens}=O\!\left(\frac1{z\log z}\right).
 \tag{6.2}
\]

### 6.2 High-control edges

Choose dyadic high-prime blocks from scale `asymp sqrt(z)` to scale `asymp z`
with internal complete graphs and consecutive complete bipartite graphs, as in
the existing Erdős 306 control architecture.  The index range satisfies the
same admissible relation `K=2k_0+O(1)`.

Every such edge has product at least `z` up to a harmless endpoint adjustment.
The crude load estimates are

\[
 \Lambda_{\rm ctrl}=O(1/\log z),
 \qquad
 W_{2,\rm ctrl}=O(1/(z\log^2z)).
 \tag{6.3}
\]

The present note does **not** import an unproved global-control theorem.  The
exact quantitative control property required from this family is isolated in
Section 10.

### 6.3 Mass edges

Let

\[
 \mathcal M_z=
 \{pq:p<q\le z,\ p,q\text{ prime},\ pq\ge z\}.
 \tag{6.4}
\]

Remove the already used sensor and control edges.  The remaining edges are the
mass pool.  Again every denominator is at least `z`.

Thus every selected Bernoulli atom in the whole construction satisfies the
single structural condition

\[
 e\ge z.
 \tag{6.5}
\]

This simultaneously guarantees small major-arc phases and exponentially
strong alias removal.

## 7. Reciprocal capacity of the hyperbolic mass pool

### Theorem 7.1

\[
 \sum_{pq\in\mathcal M_z}\frac1{pq}
 \longrightarrow\frac{\pi^2}{12}.
 \tag{7.1}
\]

### Proof sketch

Put

\[
 u=\frac{\log p}{\log z},
 \qquad
 v=\frac{\log q}{\log z}.
\]

The reciprocal-prime Mertens law turns reciprocal prime mass on power-scale
intervals into the measure `du/u`.  The condition `pq>=z` becomes `u+v>=1`.
After removing the negligible diagonal,

\[
 \begin{aligned}
 \lim_{z\to\infty}
 \sum_{pq\in\mathcal M_z}\frac1{pq}
 &=\frac12\int_0^1\int_{1-u}^1\frac{dv}{v}\frac{du}{u}\\
 &=\frac12\int_0^1\frac{-\log(1-u)}u\,du
 =\frac{\pi^2}{12}.
 \end{aligned}
\]

The endpoint `u=0` is harmless: truncation at `u=epsilon` loses `O(epsilon)`
reciprocal mass, and then the power-scale Mertens limit is uniform on the
compact truncated region.

Since (6.1) and (6.3) are `o(1)`, deleting sensor and control edges leaves

\[
 \frac{\pi^2}{12}-o(1)
 \tag{7.2}
\]

available reciprocal mass.  In particular the remaining pool eventually has
load greater than `0.4`, which is enough for every target `q<=1/5` with nearly
balanced Bernoulli weights.

## 8. Exact target tuning with balanced weights

Let

\[
 E_0=E_{\rm sens}\cup E_{\rm ctrl},
 \qquad
 \Lambda_0(z)=\sum_{e\in E_0}\frac1e
 =O\!\left(\frac{\log\log z}{\log z}\right).
 \tag{8.1}
\]

Fix a target

\[
 q\in[\gamma(z),1/5],
 \qquad
 \gamma(z):=\frac12\Lambda_0(z)+\frac1z.
 \tag{8.2}
\]

Since every mass edge has reciprocal at most `1/z`, a greedy crossing argument
chooses a subset `E_{\rm mass}` of the remaining mass pool such that the total
load

\[
 \Lambda=\sum_{e\in E_0\cup E_{\rm mass}}\frac1e
\]

satisfies

\[
 2q\le\Lambda<2q+\frac1z.
 \tag{8.3}
\]

Set

\[
 \theta=\frac q\Lambda.
 \tag{8.4}
\]

Then (2.1) holds exactly and, for large `z`,

\[
 \frac13\le\theta\le\frac12.
 \tag{8.5}
\]

Moreover

\[
 \Lambda<\frac25+o(1),
 \qquad
 W_2(E)\le\frac{\Lambda}{z}<\frac{0.41}{z}.
 \tag{8.6}
\]

Thus the Bernoulli weights remain in the same uniformly nondegenerate regime
as the original spectral construction, while the alias error is
`exp(-(4.8+o(1))z)`.

## 9. Major-frequency analysis

Let

\[
 a=\theta(1-\theta),
 \qquad
 V=aW_2(E).
\]

The sensor edges alone give

\[
 V\gg\frac1{z\log z},
 \tag{9.1}
\]

while (8.6) gives `V=O(1/z)`.  Hence

\[
 z^{1/2}\ll V^{-1/2}\ll (z\log z)^{1/2}.
 \tag{9.2}
\]

For an integer frequency `m` with `|m|<=cV^{-1/2}`, all selected edges satisfy
`|m/e|=o(1)`.  Uniformly for `theta in [1/3,1/2]`,

\[
 \log(1-\theta+\theta e(x))
 =2\pi i\theta x-2\pi^2a x^2+O(|x|^3).
\]

Summing over `e\in E`, the linear term is `2\pi imq` by (2.1), and therefore
cancels the target character `e(-mq)`.  Also

\[
 \sum_{e\in E}|m/e|^3
 \le |m|^3\frac{W_2(E)}z
 =o(1)
\]

throughout a fixed small Gaussian window.  Consequently the main-frequency
sum has positive real part

\[
 \sum_{|m|\le cV^{-1/2}}
 e(-mq)\prod_{e\in E}(1-\theta+\theta e(m/e))
 \gg V^{-1/2}.
 \tag{9.3}
\]

The complementary diagonal labels are bounded by the Gaussian tail
`exp(-cVm^2)`.

## 10. Conditional global Fourier transfer theorem

The low-coordinate part is now closed by Theorem 5.1.  What remains is a
quantitative high-coordinate synchronization statement.

Let

\[
 \sigma_{\rm ctrl}^2
 =\sum_{e\in E_{\rm ctrl}}\frac1{e^2}.
\]

The scale estimates give

\[
 \sigma_{\rm ctrl}^2\asymp\frac1{z\log^2z},
 \qquad
 \frac{\sqrt V}{\sigma_{\rm ctrl}}=O(\log z).
 \tag{10.1}
\]

### Required high-control input `HC-RATE(z)`

After fixing the high-prime CRT assignment, use only the control-edge factors.
Let `D` be the diagonal high assignments induced by one integer label.  The
required estimate is

\[
 \sum_{a\notin D}
 \prod_{e\in E_{\rm ctrl}}
 \left|1-\theta+\theta e(h_a/e)\right|
 \le\frac{\varepsilon_z}{\sigma_{\rm ctrl}},
 \tag{10.2}
\]

with

\[
 \varepsilon_z=o(1/\log z).
 \tag{10.3}
\]

Here `h_a/e` denotes the CRT phase determined by the high assignment on the
endpoints of `e`.  Additional mass factors only reduce the absolute value.

### Theorem 10.1 -- global transfer, conditional form

Assume `HC-RATE(z)`.  Then, uniformly for every integer target

\[
 \gamma(z)\Pi(z)\le t\le\frac15\Pi(z),
\]

the selected finite-prefix edge family has a subset summing **exactly** to
`t`, for all sufficiently large `z`.

### Proof

1. Sum the low CRT coordinates one at a time.  The top-block sensor theorem is
   uniform in all high-coordinate shifts, so the total conditional fibre
   factor is `1+o(1)`.
2. For a diagonal high assignment with label `m` in the main window, the
   low-coordinate point `x_r=m mod r` has sensor energy `O(1/r^2)`, while every
   competing point is separated by `Omega(z/log z)`.  It is therefore the
   unique decoded low point, and all low siblings have total weight `o(1)`.
3. The diagonal main labels contribute the positive quantity (9.3).
4. The off-diagonal high assignments contribute at most
   `(1+o(1))epsilon_z/sigma_ctrl`, which is `o(V^{-1/2})` by
   (10.1)--(10.3).  The remaining diagonal labels are absorbed by the full
   Gaussian tail.
5. Fourier inversion therefore gives

   \[
    \Pr(S\equiv t\pmod{\Pi(z)})
    \gg\frac1{\Pi(z)\sqrt V}.
    \tag{10.4}
   \]

6. By (3.3), the probability of every nonzero alias is
   `exp(-(4.8+o(1))z)`, whereas the right side of (10.4) is
   `exp(-(1+o(1))z)` times a polynomial factor.  Lemma 3.1 gives
   `Pr(S=t)>0`.

Thus exact subset-sum coverage follows, not merely a congruence.

## 11. Consequence for Li's gap-free floor

Li defines

\[
 \gamma_N=\inf\{\gamma:
 [\gamma P_N,\sigma_2(N)-\gamma P_N]\cap\mathbb Z
 \subseteq L^2(N)\}.
\]

His floor recurrence gives the unconditional fixed-prefix bound
`gamma_N<=0.181...<1/5` for every `N>=10`.  Therefore Theorem 10.1, if
`HC-RATE(z)` is supplied, overlaps the existing fixed-prefix band and, by
complement symmetry, gives

\[
 \gamma_N
 =O\!\left(\frac{\log\log p_N}{\log p_N}\right)
 \longrightarrow0.
 \tag{11.1}
\]

Hence the finite-prefix transfer is genuinely stronger than target-by-target
Erdős 306 representability: it would prove Li's Gap-Free Floor conjecture with
an explicit rate.

This consequence remains conditional only on the quantitative high-control
rate (10.2)--(10.3), not on a prime-residue realization theorem.

## 12. Why least-prime sparse realization does not close the transfer

Let

\[
 R_X=\prod_{r\le X\atop r\text{ prime}}r=e^{(1+o(1))X}.
\]

One sparse design column prescribes a reduced class modulo `R_X`.  Linnik's
theorem with exponent `L` gives a realizing prime of size at most

\[
 B(X)\le R_X^{L+o(1)}=e^{(L+o(1))X}.
 \tag{12.1}
\]

Distinct primes and a lower realization scale can be forced by adding an
auxiliary modulus; this does not change the exponent-level conclusion.  To
remain below a prefix cap `z`, (12.1) restricts

\[
 X\le(1/L+o(1))\log z.
 \tag{12.2}
\]

Even if the realizing primes are forced up to the natural scale
`R_X polylog(X)=z^{1/L+o(1)}`, the resulting square-load alias exponent is at
most

\[
 z^{2/L+o(1)}.
\]

The primorial Fourier normalization costs `exp((1+o(1))z)`.  Therefore a route
using only a least-prime bound needs

\[
 L<2
 \tag{12.3}
\]

to make the alias error smaller than the main congruence term by this method.
The current unconditional Linnik exponent is greater than `5`, so the
least-prime-only sparse route cannot close the exact finite-prefix transfer.

This is a method obstruction, not a proof that sparse realization is
impossible.  A theorem placing the prescribed classes directly in a high
interval near `z` could still revive it.  The top-block abundance route avoids
the issue entirely.

## 13. Revised exact frontier

### Closed in this note

1. the exact Fourier formula for `L^2(N)` restricted to a selected edge family;
2. congruence-to-exact transfer through a quantitative alias bound;
3. multiplicity-sensitive cyclic energy;
4. simultaneous top-block suppression for every low prime below `sqrt(z)`;
5. a prefix-compatible edge architecture with every denominator at least `z`;
6. hyperbolic reciprocal mass `pi^2/12`;
7. exact target tuning for
   `q in [O(log log z/log z),1/5]` with `theta in [1/3,1/2]`;
8. a complete conditional global Fourier transfer theorem;
9. an exact least-prime-only obstruction for the sparse route.

### Smallest revised gap

`HC-RATE(z)`:

> instantiate the high-coordinate global-control mechanism on dyadic prime
> blocks from `sqrt(z)` to `z`, with off-diagonal partition error
> `epsilon_z/sigma_ctrl` where `epsilon_z=o(1/log z)`.

A merely qualitative statement saying that the error is eventually smaller
than every fixed `epsilon` is not by itself enough, because the comparison
scale loses a factor `O(log z)` between `sigma_ctrl` and the full variance.
An explicit Peierls/partition rate, or a direct proof strong enough for
(10.3), is now the only visible global-transfer obstruction.

The prime-residue interface `PREFIX-REALIZATION(A,X,B)` is no longer on the
preferred route.  It remains an independently interesting sparse-design
question.

## 14. Sources for the new analytic interfaces

- H. L. Montgomery and R. C. Vaughan, *The large sieve*, Mathematika 20
  (1973), 119--134: Brun--Titchmarsh input.
- T. Xylouris, *On the least prime in an arithmetic progression and estimates
  for the zeros of Dirichlet L-functions*, Acta Arith. 150 (2011), 65--91:
  least-prime comparison only.
- S. Li, arXiv:2606.15159v2: finite-prefix set `L^2(N)`, floor recurrence and
  GFF.

No source above changes the released Erdős 306 trust boundary.