# E306-PD-SAS-01 — sparse-anchor standalone human proof

**Role:** `Erdős 306 — Sparse-Anchor Proof Development Worker` (`E306-PD-SAS-01`)  
**Frozen source:** `research/e306-frontier-v1@fed38b7d79b2b037ca1d3521a53b2c61c007867d`  
**State:** complete bounded proof-development candidate; independent sparse-route audit still required.

## 1. Headline theorem and avoiding reduction

A **squarefree semiprime** is a product of two distinct primes.

> **Theorem 1.** Let `q=a/b>0` be in lowest terms. Then `q` is a finite sum of reciprocals of distinct squarefree semiprimes if and only if `b` is squarefree.

Necessity is immediate: the reduced denominator of a finite sum of reciprocals of squarefree integers divides their squarefree least common multiple.

For sufficiency it is enough to prove the following avoiding unit statement.

> **Theorem 2.** Let `b>=3` be squarefree and let `T` be a finite set of positive integers. There is a finite set `A`, disjoint from `T`, of pairwise distinct squarefree semiprimes such that
>
> ```text
> sum_(e in A) 1/e = 1/b.
> ```

Indeed, successive applications with the previously used denominators added to `T` prove every numerator by induction. The cases `b=2` and `b=1` follow from avoiding representations of `1/3` and `1/6`, using `1/2=1/3+1/6`, and three disjoint copies of `1/3`, respectively.

The rest of the proof establishes Theorem 2.

## 2. Arithmetic family, load, and variance

Fix squarefree `b>=3`, finite `T`, and let `X` tend to infinity. Put

```text
Z = X^3,
P = {p prime : X <= p < Z},
B = {q prime : Z/2 <= q < Z},
S_b = {r prime : r|b}.
```

A sparse actual-prime set `S subset B` will be constructed in Section 5. Define

```text
E_pair = {pq : p,q in P, p<q},
E_b^S  = {rs : r in S_b, s in S},
E       = E_pair disjoint-union E_b^S,
L       = b * product_(p in P) p.
```

For large `X`, every prime in `P` exceeds every prime divisor of `b`, and every denominator in `E` exceeds every element of `T` when `T` is nonempty. Unique factorization gives distinctness of all denominators, separates `E_pair` from `E_b^S`, and shows that every member of `E` is a squarefree semiprime dividing `L`.

The prime number theorem, in fixed-ratio intervals and after Abel summation, gives

```text
sum_(p in P) 1/p = log 3 + o(1),
sum_(p in P) 1/p^2 = O(1/(X log X)),
|B| asymp Z/log Z.
```

Consequently

```text
Lambda_pair
 = sum_(p<q in P) 1/(pq)
 = 1/2 ((sum_(p in P)1/p)^2-sum_(p in P)1/p^2)
 -> (log 3)^2/2.
```

The sparse auxiliary load satisfies

```text
Lambda_b^S
 = (sum_(r|b)1/r)(sum_(s in S)1/s)
 <= C_b |S|/Z
 = O_b((log Z)^3/Z)=o_b(1).
```

Thus there are fixed numbers

```text
1/3 < lambda_- < lambda_+ < 1
```

such that, for large `X`,

```text
Lambda := sum_(e in E)1/e in [lambda_-,lambda_+].
```

Set

```text
theta = 1/(b Lambda).
```

For fixed `b`, `theta` lies in a compact interval `I_b subset (0,1)`, and

```text
theta Lambda = 1/b.
```

The inverse-square mass is

```text
sum_(p<q in P)1/(p^2q^2) asymp 1/(X^2 log^2 X).
```

The lower bound comes from pairs of primes in `[X,2X)`, and the upper bound from the square of `sum_(p in P)p^(-2)`. The auxiliary part is

```text
sum_(r|b,s in S)1/(r^2s^2)
 = O_b((log Z)^3/Z^2)
 = o(1/(X^2log^2X)).
```

Hence, with

```text
sigma_E^2 = theta(1-theta) sum_(e in E)1/e^2,
```

we have

```text
sigma_E^2 asymp_b 1/(X^2log^2X),
1/sigma_E asymp_b XlogX.
```

## 3. Exact Fourier selection and the Bernoulli kernel

Give each `e in E` Bernoulli weight `theta`. Let `W` be the total weight of subsets `A subset E` satisfying

```text
sum_(e in A) L/e = L/b mod L.
```

Character orthogonality gives

```text
L W = sum_(h mod L) F(h),
F(h)=e(-h/b) product_(e in E) ((1-theta)+theta e(h/e)),
```

where `e(t)=exp(2 pi i t)`.

For real `t`,

```text
|(1-theta)+theta e(t)|^2
 = 1-4theta(1-theta)sin^2(pi t).
```

Compactness of `I_b` therefore supplies `kappa_b>0` such that

```text
|(1-theta)+theta e(t)| <= exp(-kappa_b ||t||^2)
```

uniformly in `theta in I_b`. All subsequent absolute estimates use this actual kernel.

Because `L` is squarefree, the map

```text
h mod L
 <-> ((h mod p)_(p in P),(h mod r)_(r|b))
```

is a bijection. There is no hidden multiplicity in any coordinate decomposition below.

## 4. Full-range population energy

For a prime `r`, a nonzero residue `d mod r`, and `s in B`, `s!=r`, put

```text
a_(r,d)(s)=||d s^(-1)/r||^2.
```

### Lemma 4.1 — multiplicity-sensitive cyclic packing

Let `r` be prime. Let `z_1,...,z_M` be a multiset in `Z/rZ`, with every residue occurring at most `mu` times. If `M>=8mu`, then

```text
sum_i ||z_i/r||^2 >= M^3/(256 mu^2 r^2).
```

**Proof.** Put `k=floor(M/(4mu))`. At most `mu(2k+1)` entries have centred residue of absolute value at most `k`. Since `M>=8mu`, at least `M/4` entries have centred absolute residue at least `k`, and `k>=M/(8mu)`. Their total squared norm is at least

```text
(M/4)(M/(8mu r))^2.
```

This is the asserted bound. ∎

### Proposition 4.2 — uniform population floor

There is an absolute `c_0>0` such that, for all large `Z`, every prime `X<=r<Z`, and every `d!=0 mod r`,

```text
sum_(s in B, s!=r) a_(r,d)(s)
 >= c_0 Z/(log Z)^3.
```

**Proof.** Write `M=|B|`.

If `r<Z/2`, then `r` is not in `B`. In the interval `[Z/2,Z)`, one residue modulo `r` occurs at most

```text
mu_r <= Z/(2r)+1 <= 2Z/r
```

for large `Z`. Inversion and multiplication by `d` permute the nonzero residues. Moreover

```text
M/mu_r >> r/log Z -> infinity,
```

uniformly for `r>=X=Z^(1/3)`, so Lemma 4.1 applies. It gives

```text
sum_(s in B)||d s^(-1)/r||^2
 >> M^3/(mu_r^2r^2)
 >> Z/(log Z)^3.
```

Now let `Z/2<=r<Z`, remove `r` if necessary, and write `M'=|B\{r}|`. Put

```text
eta = M'/(64Z).
```

If `||d s^(-1)/r||<=eta`, there is a nonzero integer `v` with

```text
|v|<=eta r<=M'/64,
vs=d mod r.
```

For fixed `v`, this determines one residue class of `s mod r`; the interval containing `B` has length at most `r`, so it contains at most two integers in that class. The number of possible `v` is at most `M'/32+1`; for large `Z` fewer than `M'/2` primes are close. At least `M'/2` terms therefore exceed `eta`, and

```text
sum_(s in B,s!=r)a_(r,d)(s)
 >= (M'/2)eta^2
 >> M'^3/Z^2
 >> Z/(log Z)^3.
```

∎

## 5. One deterministic sparse actual-prime core

Fix a target row-distance coefficient `A>0`. Independently retain each `s in B` with probability

```text
rho = K (log Z)^4/Z,
```

where `K=K(A)` is fixed and sufficiently large.

For a test `(r,d)`, let

```text
Y_(r,d)=sum_(s in S,s!=r)a_(r,d)(s).
```

Proposition 4.2 gives

```text
E Y_(r,d) >= c_0 K log Z.
```

To make the concentration explicit, set

```text
X_s=4 a_(r,d)(s) 1_(s in S) in [0,1].
```

The standard lower-tail Chernoff inequality for independent `[0,1]` variables yields

```text
Pr(Y_(r,d)<(1/2)E Y_(r,d))
 <= exp(-(1/2)E Y_(r,d))
 <= Z^(-c_0K/2).
```

There are fewer than `Z^2` tests, because `sum_(r<Z)r<Z^2`. Choose `K` so that

```text
(c_0K)/2 > 4,
(c_0K)/2 >= A.
```

Then all tests simultaneously satisfy

```text
Y_(r,d)>=A log Z
```

with probability greater than `3/4` for large `Z`.

Also

```text
E|S| = rho |B| asymp K(log Z)^3.
```

Ordinary two-sided Chernoff bounds show, with probability tending to one,

```text
c_A(log Z)^3 <= |S| <= C_A(log Z)^3.
```

Hence one deterministic `S subset B` has both properties.

### Theorem 5.1 — sparse sensor core

For every fixed `A>0` and all large `Z`, there is an actual-prime set `S subset B` such that

```text
c_A(log Z)^3 <= |S| <= C_A(log Z)^3
```

and, simultaneously for every prime `X<=r<Z`,

```text
D_r(S)
 := min_(d!=0 mod r) sum_(s in S,s!=r)||d s^(-1)/r||^2
 >= A log Z.
```

This is one common deterministic core; no row chooses its own sensors.

## 6. Shift-uniform row tails

Fix a core assignment

```text
y=(y_s mod s)_(s in S).
```

For a prime `r notin S` and `x mod r`, define

```text
E_(r,y)(x)
 = sum_(s in S)||H_(rs)(x,y_s)/(rs)||^2,
```

where `H_(rs)` is the centred CRT lift. Choose one minimizer `x_r^*(y)` and put `e_r(y)=E_(r,y)(x_r^*(y))`.

Changing `x` by `d!=0 mod r` changes the `s`-coordinate phase by

```text
(d s^(-1) mod r)/r.
```

Thus the squared torus distance between two row codewords is at least `D_r(S)`. If two row values both had energy below `D_r(S)/4`, the triangle inequality in `l^2` would make their mutual distance smaller than `D_r(S)`. Therefore every nonchosen value has energy at least `D_r(S)/4`, whether or not the minimum is below that threshold. Hence

```text
sum_(x!=x_r^*) exp(-kappa_b E_(r,y)(x))
 <= r exp(-kappa_b D_r(S)/4).
```

For every prime `r in P\S`, choose the sensor constant `A` so large that

```text
delta := Z exp(-kappa_b A log Z/4) <= Z^(-K_0)
```

for a fixed `K_0>=20`. Then the sibling sum is at most `delta`, uniformly in `r` and in the arbitrary shift `y`.

For a fixed prime `r|b`, every nonzero row difference contributes at least `1/r^2` per sensor, so

```text
D_r^b(S)>=|S|/r^2 >>_b (log Z)^3,
```

and its sibling sum is `exp(-Omega_b((log Z)^3))`.

## 7. Decoder-defect expansion on the top block

Put

```text
R=B\S,
N=|R|.
```

For `x_R=(x_r)_(r in R)`, let

```text
Q_R(x_R)=sum_(r<t in R)||H_(rt)(x_r,x_t)/(rt)||^2.
```

For fixed `y`, consider the top absolute partition after discarding the `S-S` factors, which have modulus at most one:

```text
Z_R(y)
 = sum_(x_R)
   exp(-kappa_b sum_(r in R)E_(r,y)(x_r))
   exp(-kappa_b Q_R(x_R)).
```

For an assignment `x_R`, define

```text
U={r in R:x_r!=x_r^*(y)},
G=R\U.
```

### Lemma 7.1 — retained-energy expansion

For every `y`,

```text
Z_R(y)
 <= sum_(U subset R) delta^|U| exp(-kappa_b T_U(y)),
```

where

```text
T_U(y)
 = sum_(r in G)e_r(y)
   +sum_(r<t in G)||H_(rt)(x_r^*,x_t^*)/(rt)||^2.
```

**Proof.** Fix `U`. On every row in `G`, retain the chosen decoder and its star factor. Retain every internal complete-pair factor with both endpoints in `G`. Discard only factors incident to `U`. They are at most one. The remaining sum over each nondecoder row in `U` is independent and at most `delta`; multiplying gives `delta^|U|`. Summing over `U` proves the inequality. No independence of the discarded internal factors is asserted or used. ∎

## 8. Robust positive-density exact-cold rigidity

The next theorem is reproved because it is load-bearing. It uses no fingerprint entropy.

Let `G` be any set of primes in `[Z/2,Z)` with

```text
c_* Z/log Z <= M:=|G| <= C_* Z/log Z.
```

For an assignment `a=(a_r)_(r in G)`, write

```text
Q_G(a)=sum_(r<t in G)(H_(rt)(a)/(rt))^2,
sigma_G^2=sum_(r<t in G)1/(r^2t^2)
asymp_(c_*) 1/(Z^2(log Z)^2).
```

### Lemma 8.1 — reciprocal dispersion on an arbitrary dense subset

Let `q` be prime in `[Z/2,2Z)`, let `F subset G\{q}` have `s>=16` elements, and let `d!=0 mod q`. Then

```text
sum_(p in F)||d p^(-1)/q||^2 >= c_D s^3/Z^2.
```

**Proof.** Put `eta=s/(64Z)`. If `||d p^(-1)/q||<=eta`, then for a nonzero integer `v` with `|v|<=s/16` one has `vp=d mod q`. For fixed `v`, this determines one residue class of `p mod q`, and an interval of length at most `q` contains at most two integers in that class. Fewer than `s/2` elements are close; at least `s/2` have norm at least `eta`. ∎

Fix a small `rho_0 in (0,1/8)`. A label `m`, with `|m|<Z^2/4`, is dominant if at least `(1-rho_0)M` coordinates equal `m` modulo their primes. Two dominant labels coincide, since their classes share at least two primes and the product of those primes exceeds the possible difference.

### Proposition 8.2 — repaired nondominant forcing

There is `c_w=c_w(c_*)>0` such that

```text
Q_G(a)<c_w Z/(log Z)^3
```

implies a unique dominant label.

**Proof.** If `Q_G(a)=0`, every pair lift is zero, hence all coordinates are the residue of `0`; handle this case before introducing `sqrt(Q_G)`.

Assume `0<R_0:=Q_G(a)<cZ/(log Z)^3`. Put

```text
B_0=A_0 sqrt(R_0) Z^2/M
```

with fixed large `A_0=A_0(rho_0)`. Call a pair bad if `|H_(pq)|>B_0`. Since `pq<Z^2`,

```text
#bad <= R_0 Z^4/B_0^2.
```

Averaging gives a base prime `p_0` with bad degree at most `rho_0M/8` when `A_0` is large. For every nonbad neighbour `q`, put `ell(q)=H_(p_0q)`. Then `|ell(q)|<=B_0`, `ell(q)=a_q mod q`, and all labels lie in one residue class modulo `p_0`. Hence the number of possible labels is

```text
M_0 <= 4B_0/Z+2.
```

For small `c` and large `Z`, `B_0<Z^2/4`. Suppose no dominant class exists. Call a class small if its size is below

```text
s_0=1024(B_0/Z+1).
```

Thus `s_0>=16` and `s_0>=512B_0/Z`.

If small classes contain at least `rho_0M/4` vertices, then

```text
rho_0M/4 <= M_0s_0 <= C_(rho_0)(B_0/Z+1)^2.
```

If `B_0/Z<1`, this contradicts `M->infinity`. Otherwise it gives

```text
M <= C B_0^2/Z^2
  = C A_0^2 R_0 Z^2/M^2,
```

so

```text
R_0 >> M^3/Z^2 >> Z/(log Z)^3.
```

Now suppose small classes contain fewer than `rho_0M/4` vertices. Remove `p_0` and its bad neighbours. The substantial classes have total size

```text
S_0 >= (1-rho_0/2)M.
```

Let their sizes be `n_1,...,n_t`. Every `n_i>=s_0`, and the largest is at most `(1-rho_0)M`. For two distinct classes with labels `m,m'`, apply Lemma 8.1 from the class of size `n_i` to all but at most one vertex of the other class. The hypothesis `n_i>=max(16,512B_0/Z)` allows the harmless label term to be absorbed. Summing over ordered class pairs counts each undirected edge twice, so

```text
R_0 >= c/Z^2 sum_i n_i^3 sum_(j!=i)(n_j-1).
```

The inner sum is exactly

```text
(S_0-n_i)-(t-1).
```

Because every other class has size at least `s_0`,

```text
(S_0-n_i)-(t-1)
 >= (1-1/s_0)(S_0-n_i)
 >= (1023/1024)(S_0-n_i).
```

If the largest class has size at least `S_0/2`, its single term is `>>_(rho_0)M^4`. If every class is smaller than `S_0/2`, then `S_0-n_i>=S_0/2` and power mean gives

```text
sum_i n_i^3 >= S_0^3/t^2 >= S_0^3/M_0^2.
```

In both cases

```text
R_0 >= c M^4/(M_0^2Z^2).
```

If `B_0/Z<1`, this is already much larger than `Z/(log Z)^3`. Otherwise `M_0^2<=C B_0^2/Z^2=C R_0Z^2/M^2`, so

```text
R_0^2 >= c M^6/Z^4,
R_0 >= c M^3/Z^2 >= c' Z/(log Z)^3.
```

Choosing `c=c_w` below the resulting constants gives the contradiction. ∎

### Proposition 8.3 — robust exact-cold theorem

After decreasing `c_w` if necessary, every assignment with

```text
Q_G(a)<c_w Z/(log Z)^3
```

is represented by one integer `m`:

```text
a_r=m mod r for every r in G,
|m| <= C_* sqrt(Q_G(a))/sigma_G.
```

**Proof.** Proposition 8.2 gives a dominant class `C` and label `m`. On pairs inside `C`, the centred lift is exactly `m`, so

```text
Q_G(a)>=m^2 sum_(p<q in C)1/(p^2q^2)
       >=c m^2 sigma_G^2.
```

This proves the label bound. After reducing `c_w` once more, it also gives `|m|<=|C|Z/1024`; the numerical constant is chosen only to absorb the factor coming from `p,q>=Z/2`.

For an exceptional coordinate `q notin C`, let `d=a_q-m mod q`. Lemma 8.1 applied to `C` and the displayed bound on `m` gives cross energy at least `c|C|^3/Z^2`. These edge sets are disjoint as `q` varies. Hence

```text
|G\C| c|C|^3/Z^2 <= Q_G(a).
```

Since `|C|>>Z/logZ` and `Q_G(a)<c_wZ/log^3Z`, the right side makes `|G\C|<1` for small `c_w`. Thus there are no exceptions. ∎

## 9. Core-defect amplification

Assume `|U|<=N/2`, so `G=R\U` has positive density in `B`, and suppose the decoder assignment on `G` is the common label `m` supplied by Proposition 8.3. If some `s in S` has `y_s!=m mod s`, put `d=y_s-m mod s`.

Lemma 8.1 gives

```text
sum_(r in G)||d r^(-1)/s||^2
 >= c |G|^3/Z^2
 >= c Z/(log Z)^3.
```

For the actual star lift, write `H_(rs)(m,y_s)=m+j_rr`; then `j_r=d r^(-1) mod s`, and

```text
H_(rs)/(rs)=j_r/s+m/(rs).
```

The `l^2` norm of the perturbation `m/(rs)` is at most

```text
C |m| sqrt(|G|)/Z^2.
```

At retained energy below a fixed multiple of `Z/log^3Z`, Proposition 8.3 gives

```text
|m| << Z^(3/2)/(log Z)^(1/2),
```

so the perturbation norm is `O(1/log Z)`, whereas the dispersion norm is `>>sqrt(Z)/(log Z)^(3/2)`. For large `Z`, the latter dominates by a fixed factor. Therefore one defective core coordinate contributes

```text
sum_(r in G)||H_(rs)(m,y_s)/(rs)||^2
 >= c_def Z/(log Z)^3.
```

## 10. Sparse arithmetic synchronization

Choose

```text
F_sync=c_sync Z/(log Z)^3
```

with `c_sync` smaller than the robust cold threshold and the defect-amplification constant.

### Theorem 10.1 — low retained energy is the integer diagonal

If `|U|<=N/2` and `T_U(y)<F_sync`, then there is an integer `m` such that

```text
x_r^*(y)=m mod r for every r in G,
y_s=m mod s for every s in S,
|m| << Z^(3/2)/(log Z)^(1/2).
```

**Proof.** The internal part of `T_U` is below the robust cold threshold, so Proposition 8.3 gives the common label on `G`. A core defect would contribute at least `c_defZ/log^3Z` to the star part, contradicting the choice of `F_sync`. ∎

For such a low-energy pair, all centred retained lifts equal `m`, because the label bound is `o(Z^2)`. Thus

```text
T_U(y)=m^2 sigma_(G,S)^2,
```

where

```text
sigma_(G,S)^2
 = sum_(r<t in G)1/(r^2t^2)
   +sum_(r in G,s in S)1/(r^2s^2)
asymp 1/(Z^2(log Z)^2)
```

uniformly for `|U|<=N/2`; the `G-G` term alone gives both needed orders.

Let

```text
Y_S=product_(s in S)s <= Z^|S|=exp(O_A((log Z)^4)).
```

There are three error classes.

1. **Energetic small defects.** For `|U|<=N/2` and `T_U>=F_sync`,

   ```text
   sum_y sum_U delta^|U|e^(-kappa_bT_U)
   <= Y_S e^(-kappa_bF_sync)(1+delta)^N
   = exp(-Omega_b(Z/(log Z)^3)).
   ```

2. **Large defects.** For `|U|>N/2`,

   ```text
   sum_y sum_U delta^|U|
   <=Y_S 2^N delta^(N/2)
   =exp(-Omega(Z)).
   ```

3. **Cold but nonempty defects.** The retained skeleton is diagonal, but the original top assignment still has nondecoder coordinates in `U`; these are not genuine global integer modes. Their mass is

   ```text
   <= C ZlogZ ((1+delta)^N-1)
   <= C ZlogZ * Ndelta * exp(Ndelta)
   = O(Z^2 delta),
   ```

   because `sum_m exp(-c m^2/(Z^2log^2Z))<<ZlogZ`.

The only main class is therefore `U=emptyset` with low energy. In that class every coordinate in `B=S disjoint-union R` equals one common integer label `m`, and

```text
sum_m exp(-c m^2/(Z^2log^2Z)) << ZlogZ.
```

### Corollary 10.2 — exact coherent top partition

The complete top absolute partition is `O_b(ZlogZ)`. The mass outside genuine globally coherent integer assignments is

```text
exp(-Omega_b(Z/(log Z)^3))+O(Z^2delta).
```

This corollary is the precise synchronization statement needed later. It corrects two invalid shortcuts: high-energy assignments are not called Gaussian diagonal merely because they admit a residue label, and `U!=emptyset` is not called globally coherent merely because the retained set `G` is coherent.

## 11. Lower rows and the retained skeleton

Write

```text
P_low=P\B.
```

For each `r in P_low`, use only the denominators `rs`, `s in S`, as its row kernel. For each `r|b`, use the sparse family `rs`, `s in S`. The remaining complete-pair factors are retained, not discarded.

The denominator-factor partition is exactly:

```text
top synchronization:   S-R and R-R,
lower row kernels:     S-P_low,
b-row kernels:         S_b-S,
retained skeleton:     S-S, R-P_low, and P_low-P_low.
```

Every denominator in `E` appears exactly once.

For row kernels `A_j(x_j)` with chosen decoders `x_j^*`, sibling sums at most `delta_j`, and the modulus `G(x)` of all retained factors, `0<=G<=1`, one has

```text
sum_x product_j A_j(x_j)G(x)
 <= product_j A_j(x_j^*)G(x^*)
    +product_j(A_j(x_j^*)+delta_j)
    -product_j A_j(x_j^*).
```

This follows by retaining the all-decoder term and bounding every other term after replacing `G` by `1`. If

```text
Delta=sum_j delta_j,
```

the error is at most `exp(Delta)-1`. Here

```text
Delta <= |P_low|delta + exp(-Omega_b((log Z)^3))
      <= Z delta + exp(-Omega_b((log Z)^3)).
```

After summing the top partition, the total lower-fibre error is

```text
O_b(ZlogZ)(exp(Delta)-1)=o(1/sigma_E)
```

for `K_0>=20`.

## 12. Decoder identification

Put

```text
W_S=sum_(s in S)1/s^2 <= C_A(log Z)^3/Z^2,
M_dec=XZ/(log Z)^2.
```

Suppose the top assignment is the coherent label `m`.

For `r in P_low` and `|m|<=M_dec`, the candidate row value `m mod r` has centred lift `m` on every edge `rs`, because `|m|<rs/2`. Its star energy is

```text
E_r(m)=m^2 W_S/r^2
 <= C_A/log Z
 =o(D_r(S)).
```

It is therefore the unique decoder.

For fixed `r|b` and `|m|<=X^2/4`,

```text
E_r(m)/(D_r^b(S)) <= m^2/Z^2=o(1),
```

so the `b`-coordinate also decodes to `m mod r`. Squarefreeness of `b` then identifies the single residue `m mod b`.

## 13. Major arc and complete minor decomposition

Choose

```text
N_maj=floor(C/sigma_E),
```

with `C` fixed later. For large `X`,

```text
N_maj<X^2/4<M_dec.
```

### Sector I — genuine major frequencies

For `|m|<=N_maj`, all prime and `b` coordinates equal `m`, hence the actual frequency is `h=m mod L`. Since `|m/e|=o(1)` uniformly,

```text
log((1-theta)+theta e(m/e))
 =2pi i theta m/e
  -2pi^2 theta(1-theta)m^2/e^2
  +O_b(|m/e|^3).
```

The linear term cancels `e(-m/b)` because `theta sum_e1/e=1/b`. Moreover

```text
N_maj^3 sum_(e in E)1/e^3=o_b(1).
```

For the pair family this is `O(log X/X)`, and the sparse auxiliary family is smaller. Therefore, uniformly for fixed `C`,

```text
F(m)=exp(-2pi^2m^2sigma_E^2)(1+o_b(1)).
```

Thus

```text
Re sum_(|m|<=N_maj)F(m)>=c_maj(C)/sigma_E.
```

### Sector II — full-variance Gaussian tail

For

```text
N_maj<|m|<=X^2/4,
```

all denominator phases lie in the small disk and

```text
|F(m)|<=exp(-c_bm^2sigma_E^2).
```

Hence the sector is at most

```text
C/sigma_E * integral_C^infinity exp(-c_bt^2)dt.
```

Choose `C` so this is less than one quarter of the major lower bound.

### Sector III — adaptive complete-pair damping

For

```text
X^2/4<|m|<=M_dec,
```

all prime coordinates in `P` still decode to `m`; the `b` coordinates may be arbitrary, producing only a fixed factor depending on `b`. The interval

```text
I_m=[2sqrt(|m|),3sqrt(|m|)]
```

lies in `P_low` for large `X` and contains `>>sqrt(|m|)/log|m|` primes. For distinct `p,q in I_m`,

```text
1/9 <= |m|/(pq) <=1/4,
```

and the centred lift is `m`. Therefore

```text
Q_pair(m)>>|m|/(log|m|)^2.
```

Summing over `m` makes Sector III `exp(-Omega(X^2/log^2X))`.

### Sector IV — coherent top-label tail

For low-energy coherent top labels with

```text
M_dec<|m|<<Z^(3/2)/(log Z)^(1/2),
```

the top retained energy is

```text
m^2 sigma_(R,S)^2
 >>m^2/(Z^2log^2Z).
```

At `M_dec` the exponent is `>>X^2/log^6Z`. The Gaussian tail is therefore

```text
O(ZlogZ exp(-cX^2/log^6Z))=o(1/sigma_E).
```

### Sector V — synchronization and fibre errors

This sector consists of:

```text
energetic small-U top assignments,
large-U top assignments,
cold top assignments with U!=emptyset,
and lower or b-row nondecoder fibres.
```

Corollary 10.2 and Section 11 bound their total absolute mass by

```text
exp(-Omega_b(Z/log^3Z))
 +O(Z^2delta)
 +O_b(ZlogZ)(exp(Delta)-1)
 =o(1/sigma_E).
```

The five sectors are disjoint after the main/error split and exhaustive because the CRT coordinate map is a bijection and every non-main assignment is charged either to top synchronization error or to a lower-row sibling.

## 14. Positivity, no-wrap, and closure

Fix the structural constants, including `K_0`, the sensor strength `A`, and the robust-cold constants. Then choose `C` for Sector II, and finally choose `X` above every PNT, sampling, rigidity, decoder, Taylor, adaptive-interval, avoidance, and error threshold.

Sectors II–V have total absolute mass less than the positive real contribution of Sector I. Hence

```text
Re sum_(h mod L)F(h)>0,
```

so `W>0`. There is a subset `A subset E` satisfying the target congruence.

Because

```text
0<=sum_(e in A)1/e<=Lambda<1
```

and `0<1/b<1`, the congruence

```text
sum_(e in A)1/e = 1/b mod 1
```

is an equality. Distinctness, squarefree-semiprimality, and avoidance were built into `E`. This proves Theorem 2, and the elementary reductions prove Theorem 1. ∎

## 15. Proof-development verdict

The sparse route is mathematically closed at ordinary-proof level, subject to independent audit. Fingerprint entropy is not used. A trivial core-assignment count `exp(O((log Z)^4))` remains, but it is dominated directly by the deterministic synchronization floor and is not a level-set or fingerprint theorem. Robust exact-cold rigidity remains load-bearing on a positive-density witness block.

The route is structurally cleaner than the dense one-anchor route in theorem hierarchy, but it is not plainly shorter as a standalone proof: the removed fingerprint-entropy argument is replaced by population sampling, defect expansion, core amplification, and the explicit top-defect sector.
