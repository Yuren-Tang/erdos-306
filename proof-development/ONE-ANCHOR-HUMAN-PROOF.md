# E306-PD-OA1-01 — standalone one-anchor human proof

**Scope:** complete ordinary proof of Erdős Problem 306 through the one-anchor route  
**External theorem:** the prime number theorem  
**Excluded premises:** Lean declarations, released constants, prior correctness claims, global multiblock localization, and manuscript authority.

Throughout, `e(t)=exp(2 pi i t)` and `||t||` denotes distance from `t` to the nearest integer.

## 1. Statement and elementary reductions

A **squarefree semiprime** is a product `pq` of two distinct primes.

### Theorem 1

Let `q=a/b>0` be in lowest terms. Then `q` is a finite sum of reciprocals of distinct squarefree semiprimes if and only if `b` is squarefree.

### Necessity

If `A` is a finite set of squarefree integers and `M=lcm(A)`, then

```text
sum_(n in A) 1/n = (sum_(n in A) M/n)/M.
```

The reduced denominator divides `M`. The least common multiple of squarefree integers is squarefree, and every divisor of a squarefree integer is squarefree. Hence the reduced denominator is squarefree.

For sufficiency we prove an avoiding unit statement.

### Theorem 2 — avoiding unit representation

Let `b>=3` be squarefree and let `T` be a finite set of positive integers. There is a finite set `A` of pairwise distinct squarefree semiprimes, disjoint from `T`, such that

```text
sum_(e in A) 1/e = 1/b.
```

### Lemma 3 — numerator induction

If an avoiding representation of `1/b` exists for every finite forbidden set, then an avoiding representation of `a/b` exists for every integer `a>=1` and every finite forbidden set.

**Proof.** Induct on `a`. Having represented `a/b` by a finite set `A`, apply the unit statement with forbidden set `T union A`. The new unit representation is disjoint from the old one, and their reciprocal sums add. ∎

### Lemma 4 — denominators `1` and `2`

It is enough to prove Theorem 2 for squarefree `b>=3`.

**Proof.** For `b=2`, construct successively disjoint avoiding representations of `1/3` and `1/6` and use

```text
1/2 = 1/3 + 1/6.
```

For `b=1`, construct three successive avoiding representations of `1/3` and add them, equivalently applying Lemma 3 with `a=b=3`. In both cases Theorem 2 is invoked only for denominators at least `3`, and enlargement of the forbidden set preserves distinctness. Once an avoiding unit representation for `1` or `1/2` has been obtained, Lemma 3 gives every positive numerator. ∎

The rest of the proof establishes Theorem 2.

## 2. Prime supply and the denominator family

Fix squarefree `b>=3` and finite `T`. Let `X` tend to infinity and put

```text
Z = X^3,
P = {p prime : X <= p < Z},
B = {q prime : Z/2 <= q < Z},
S_b = {r prime : r|b}.
```

Choose `X` so large that every prime in `P` exceeds every prime divisor of `b`, and every product used below exceeds every element of `T`; the latter condition is vacuous when `T` is empty.

Define

```text
E_pair = {pq : p,q in P, p<q},
E_b    = {rq : r in S_b, q in B},
E       = E_pair disjoint-union E_b,
L       = b * product_(p in P) p.
```

### Lemma 5 — tail-uniform prime counts

For every fixed `0<u<v`, uniformly as `y` tends to infinity,

```text
# {p prime : uy <= p < vy}
 = (v-u+o(1)) y/log y.
```

In particular, the count is between positive constant multiples of `y/log y` for all sufficiently large `y`.

**Proof.** Write the PNT as

```text
pi(t)=t/log t * (1+epsilon(t)),
sup_(t>=Y)|epsilon(t)| -> 0.
```

Apply this simultaneously at `uy` and `vy`. Since `u,v` are fixed, replacing `log(uy)` and `log(vy)` by `log y` introduces only a relative `o(1)`. ∎

### Lemma 6 — reciprocal and square-reciprocal estimates

As `X` tends to infinity,

```text
S_X := sum_(p in P) 1/p = log 3 + o(1),
U_X := sum_(p in P) 1/p^2 = O(1/(X log X)).
```

Moreover

```text
M   := |B|                         asymp Z/log Z,
V_B := sum_(q in B) 1/q            = O(1/log Z),
W_B := sum_(q in B) 1/q^2          = O(1/(Z log Z)).
```

**Proof.** Abel summation and the tail-uniform PNT give

```text
sum_(X<=p<X^3)1/p
 = integral_X^(X^3) dt/(t log t) + o(1)
 = log log(X^3)-log log X + o(1)
 = log 3+o(1).
```

For the square sum, split `[X,X^3)` into dyadic intervals. Lemma 5 gives at most `C 2^k/k` primes in `[2^k,2^(k+1))`, so that interval contributes at most `C/(k2^k)`. The geometric tail is `O(1/(X log X))`.

The estimate for `M` is Lemma 5 on `[Z/2,Z)`. Since every `q in B` is at least `Z/2`,

```text
W_B <= 4M/Z^2 = O(1/(Z log Z)).
```

Finally, Abel summation on `[Z/2,Z)` gives

```text
V_B
 = log log Z-log log(Z/2)+o(1/log Z)
 = O(1/log Z).
```

∎

### Lemma 7 — distinctness, avoidance, load, and variance

For all sufficiently large `X`:

1. every member of `E` is a squarefree semiprime;
2. the members of `E` are pairwise distinct and avoid `T`;
3. every `e in E` divides `L`;
4. for fixed constants
   ```text
   1/3<lambda_-<(log 3)^2/2<lambda_+<1,
   ```
   the total load `Lambda=sum_(e in E)1/e` lies in `(lambda_-,lambda_+)`;
5. the inverse-square load satisfies
   ```text
   sum_(e in E)1/e^2 asymp 1/(X^2 log^2 X).
   ```

**Proof.** Since every prime in `P` is larger than every prime divisor of `b`, unique factorization separates a product of two primes in `P` from a product `rq` with `r|b` and `q in B`. It also proves distinctness within each family. The two factors of every denominator are distinct, so all denominators are squarefree semiprimes. The choice of `X` gives avoidance, and every denominator plainly divides `L`.

The pair load is

```text
Lambda_pair
 = sum_(p<q in P)1/(pq)
 = (S_X^2-U_X)/2
 -> (log 3)^2/2.
```

The auxiliary load is

```text
Lambda_b
 = (sum_(r in S_b)1/r) V_B
 = O_b(1/log Z)=o_b(1).
```

This proves the load interval.

For the upper square bound,

```text
sum_(p<q in P)1/(p^2q^2)
 <= U_X^2/2
 = O(1/(X^2log^2X)).
```

The interval `[X,2X)` contains `>>X/log X` primes. Its distinct pairs have products at most `4X^2`, hence contribute

```text
>> (X/log X)^2/X^4
 = 1/(X^2log^2X).
```

The auxiliary square load is

```text
(sum_(r in S_b)1/r^2) W_B
 = O_b(1/(ZlogZ))
 = o(1/(X^2log^2X)).
```

∎

Put

```text
theta = 1/(b Lambda).
```

Then `theta` belongs to the fixed compact interval

```text
I_b=[1/(b lambda_+),1/(b lambda_-)] subset (0,1),
```

and

```text
theta sum_(e in E)1/e = 1/b,
sum_(e in E)1/e < 1.
```

Define

```text
sigma_E^2=theta(1-theta)sum_(e in E)1/e^2.
```

Lemma 7 gives

```text
sigma_E^2 asymp_b 1/(X^2log^2X),
1/sigma_E asymp_b XlogX.
```

## 3. Exact finite Fourier formula

Give each subset `A subset E` the Bernoulli weight

```text
w(A)=theta^|A|(1-theta)^|E\A|.
```

Let `W` be the total weight of subsets satisfying

```text
sum_(e in A)L/e = L/b mod L.
```

Character orthogonality on `Z/LZ` gives

```text
L W = sum_(h mod L) F(h),
```

where

```text
F(h)=e(-h/b) product_(e in E)((1-theta)+theta e(h/e)).
```

For real `t`,

```text
|(1-theta)+theta e(t)|^2
 =1-4theta(1-theta)sin^2(pi t).
```

Since `sin(pi x)>=2x` on `[0,1/2]`, compactness of `I_b` gives a constant `kappa_b>0` such that

```text
|(1-theta)+theta e(t)|
 <= exp(-kappa_b ||t||^2).
```

Therefore

```text
|F(h)| <= exp(-kappa_b Q_E(h)),
Q_E(h)=sum_(e in E)||h/e||^2.
```

## 4. Repaired one-block rigidity

Let `Y` be large, let `Q` be a set of primes in `[Y,2Y)`, and suppose

```text
cY/logY <= N:=|Q| <= CY/logY.
```

For an assignment `a=(a_p)_(p in Q)`, let `H_pq(a)` be the unique centred CRT lift satisfying

```text
H_pq=a_p mod p,
H_pq=a_q mod q,
-pq/2 < H_pq <= pq/2.
```

Put

```text
mathcal Q(a)=sum_(p<q in Q)(H_pq(a)/(pq))^2,
sigma_Q^2=sum_(p<q in Q)1/(p^2q^2)
asymp 1/(Y^2log^2Y).
```

Fix `rho in (0,1/4)`.

### Lemma 8 — reciprocal dispersion

Let `q` be prime with `Y<=q<4Y`, let `F` be a set of `s>=16` primes in `[Y,2Y)` not containing `q`, and let `d` be nonzero modulo `q`. Then

```text
sum_(p in F)||d p^(-1)/q||^2
 >= c_D s^3/Y^2.
```

**Proof.** Put `delta=s/(64Y)`. If `||d p^(-1)/q||<=delta`, choose an integer `ell` with

```text
v=d p^(-1)-ell q,
|v|<=delta q<=s/16.
```

Then `vp=d mod q`. For fixed nonzero `v`, this determines one residue class for `p mod q`; an interval of length at most `q` contains at most two integers in such a class. There are at most `2(s/16)+1` possible `v`, so fewer than `s/2` primes are close. At least `s/2` terms exceed `delta`, giving the result. ∎

A label `m` is **dominant** if

```text
|m|<=Y^2/2
```

and at least `(1-rho)N` coordinates equal `m` modulo their primes. Two dominant labels are equal: their classes intersect in at least two primes, whose product divides their difference, while the difference has absolute value at most `Y^2`.

### Lemma 9 — repaired cross-label energy

Let `C_m,C_m'` be disjoint label classes with `m!=m'`, both labels of absolute value at most `B_0<Y^2/4`. Suppose

```text
|C_m|>=max(16,128B_0/Y),
|C_m'|>=2.
```

Then

```text
sum_(p in C_m)sum_(q in C_m') (H_pq/(pq))^2
 >= c_E |C_m|^3(|C_m'|-1)/Y^2.
```

**Proof.** Put `d=m'-m`. At most one prime in `C_m'` divides `d`, since two would have product greater than `Y^2`, while `0<|d|<Y^2/2`. Fix any other `q`. For `p in C_m`, write `H_pq=m+jp`. Reducing modulo `q` gives `jp=d mod q`, and hence

```text
||d p^(-1)/q||
 <= |H_pq|/(pq)+|m|/(pq).
```

Lemma 8 applied to `F=C_m` says that at least half the left sides exceed `|C_m|/(64Y)`. The size hypothesis gives

```text
|m|/(pq)<=B_0/Y^2<=|C_m|/(128Y).
```

Thus at least half the `p` satisfy

```text
|H_pq|/(pq)>=|C_m|/(128Y).
```

The energy for this `q` is `>>|C_m|^3/Y^2`. Sum over all but at most one `q`. ∎

### Proposition 10 — repaired nondominant forcing

There is `c_w>0` such that, for all sufficiently large `Y`,

```text
mathcal Q(a)<c_wY/log^3Y
```

implies that `a` has a unique dominant label.

**Proof.** If `mathcal Q(a)=0`, every centred lift is zero, so every coordinate is the residue of the label `0`; the conclusion is immediate. Assume

```text
0<R:=mathcal Q(a)<cY/log^3Y,
```

where `c` will be chosen.

Set

```text
B_0=A_rho sqrt(R)Y^2/N
```

with `A_rho` a sufficiently large fixed constant. Call a pair bad if `|H_pq|>B_0`. Since `pq<4Y^2`, every bad pair contributes more than `B_0^2/(16Y^4)`, so

```text
#bad <=16RY^4/B_0^2.
```

The sum of bad degrees is twice this number. Some base prime `p_0` has bad degree at most

```text
32RY^4/(B_0^2N)=32N/A_rho^2.
```

Choose `A_rho` so that this is at most `rho N/8`.

For every nonbad neighbour `q`, let

```text
ell(q)=H_(p_0q).
```

Then `|ell(q)|<=B_0`, `ell(q)=a_q mod q`, and all `ell(q)` lie in one residue class modulo `p_0`. Hence the number `M_0` of possible labels is at most

```text
M_0<=2B_0/Y+2.
```

For sufficiently small `c` and large `Y`, `B_0<Y^2/4`. Suppose no dominant class exists. Call a label class small if its size is less than

```text
s_0=256(B_0/Y+1).
```

This threshold is at least `16` and at least `128B_0/Y`.

**Case 1.** Small classes contain at least `rho N/4` vertices. Then

```text
rho N/4 <= M_0s_0 <= C_rho(B_0/Y+1)^2.
```

If `B_0/Y<1`, the right side is bounded while `N` tends to infinity, a contradiction. Otherwise

```text
N<=C_rho B_0^2/Y^2
 =C_rho A_rho^2 RY^2/N^2,
```

so

```text
R>>N^3/Y^2>>Y/log^3Y.
```

**Case 2.** Small classes contain less than `rho N/4` vertices. After removing `p_0` and its bad neighbours, the substantial classes have total size

```text
S>=(1-rho/2)N
```

for large `Y`. Let their sizes be `n_1,...,n_t`. Each is at least `s_0`, and the largest is at most `(1-rho)N`.

Apply Lemma 9 to ordered pairs of distinct substantial classes. Every undirected cross edge is then counted twice, so, after absorbing the factor `1/2` into the constant,

```text
R >= c/Y^2 sum_i n_i^3 sum_(j!=i)(n_j-1).
```

The inner sum is exactly

```text
sum_(j!=i)(n_j-1)=(S-n_i)-(t-1).
```

Because every other class has size at least `s_0`,

```text
S-n_i>=(t-1)s_0,
```

and therefore

```text
(S-n_i)-(t-1)
 >=(1-1/s_0)(S-n_i)
 >=(255/256)(S-n_i).
```

Thus

```text
R >= c/Y^2 sum_i n_i^3(S-n_i).
```

If the largest class has size at least `S/2`, then it contains `>>N` vertices and, because it is at most `(1-rho)N` while `S>=(1-rho/2)N`, at least `>>_rho N` substantial vertices lie outside it. Its single term is therefore `>>_rho N^4`.

If every class has size less than `S/2`, then `S-n_i>=S/2`, and power mean gives

```text
sum_i n_i^3>=S^3/t^2>=S^3/M_0^2.
```

In either subcase,

```text
R>=c_rho N^4/(M_0^2Y^2).
```

If `B_0/Y<1`, this is much larger than `Y/log^3Y`. Otherwise

```text
M_0^2<=C B_0^2/Y^2
      =C RY^2/N^2,
```

so

```text
R^2>=cN^6/Y^4,
R>=cN^3/Y^2>=c'Y/log^3Y.
```

Both cases contradict `R<cY/log^3Y` once `c` is chosen below the resulting fixed constants. Take such a `c` as `c_w`. ∎

### Proposition 11 — exact zero-exception theorem

After decreasing `c_w` if necessary, every assignment satisfying

```text
mathcal Q(a)<c_wY/log^3Y
```

is exactly represented by one integer `m`:

```text
a_p=m mod p for every p in Q.
```

Moreover

```text
|m|<=C_rho sqrt(mathcal Q(a))/sigma_Q.
```

**Proof.** Proposition 10 gives a dominant class `C` and label `m`. For `p,q in C`, the centred lift is exactly `m`; hence

```text
mathcal Q(a)
 >=m^2 sum_(p<q in C)1/(p^2q^2)
 >=c_rho m^2sigma_Q^2.
```

This proves the label bound.

Let `E_0=Q\C`. The label bound and cold upper bound imply, for large `Y`,

```text
|m|<=|C|Y/128.
```

For each `q in E_0`, let `d=a_q-m` be the nonzero residue modulo `q`. For `p in C`, the same CRT subtraction as in Lemma 9 gives

```text
||d p^(-1)/q||
 <=|H_pq|/(pq)+|m|/(pq).
```

Lemma 8 and the displayed bound on `m` show that the cross energy from `q` into `C` is at least `c|C|^3/Y^2`. These edge sets are disjoint as `q` varies. Therefore

```text
|E_0| c|C|^3/Y^2 <=mathcal Q(a).
```

Since `|C|>>Y/logY`,

```text
|E_0|
 <=C mathcal Q(a)Y^2/N^3
 <C'c_w.
```

Choose `c_w` so that `C'c_w<1`. The cardinality is an integer, so `E_0` is empty. ∎

### Lemma 12 — fingerprint rigidity

Fix `F subset Q` with `|F|=s>=16` and fix its residues. For `q in Q\F` and a candidate residue `w mod q`, put

```text
t_q(w)=sum_(p in F)(H_pq(a_p,w)/(pq))^2.
```

At most one residue `w` satisfies

```text
t_q(w)<g s^3/Y^2
```

for a fixed absolute `g>0`.

**Proof.** If `w!=w'`, the difference of the two CRT lifts is divisible by `p` and reduces modulo `q` to `w-w'`. Hence

```text
||(w-w')p^(-1)/q||
 <=|H_pq(a_p,w)|/(pq)+|H_pq(a_p,w')|/(pq).
```

After squaring and summing, Lemma 8 prevents both energies from being below `g s^3/Y^2` when `g` is sufficiently small. ∎

### Proposition 13 — fingerprint entropy

For every `epsilon>0`, all sufficiently large blocks satisfy

```text
# {a:mathcal Q(a)<=R}<=exp(epsilon R)
```

uniformly for

```text
R>=c_wY/log^3Y.
```

**Proof.** First suppose

```text
R<=c_*N^4/Y^2,
```

where `c_*` is a sufficiently small fixed constant. Choose

```text
s=ceil(A(RY^2)^(1/4))
```

with fixed large `A`, and use a predetermined fingerprint set `F` of size `s`. The lower bound on `R` gives `s>=16`; the upper bound, after fixing `c_*`, gives `s<=N/2`.

There are at most `(2Y)^s` assignments on `F`. For a complete assignment,

```text
sum_(q outside F)t_q(a_q)<=R.
```

By Lemma 12, all but at most

```text
t<=RY^2/(gs^3)<=C_As
```

vertices are forced to one residue. Choose `A` so that `C_A` is bounded, then choose the exceptional vertices and their residues. Their total number of possibilities is at most

```text
sum_(j<=t) binom(N,j)(2Y)^j
 <=exp(C(s+t)logY).
```

Thus the logarithmic count is

```text
O((RY^2)^(1/4)logY).
```

Dividing by `R` and using the forcing-floor lower bound gives

```text
O(Y^(-1/4)log^(13/4)Y),
```

which tends to zero uniformly in `R`.

If `R>c_*N^4/Y^2`, the total number of assignments is at most `(2Y)^N`, whose logarithm is `O(Y)`, while

```text
R>>N^4/Y^2>>Y^2/log^4Y.
```

Again `O(Y)<=epsilon R` for large `Y`. ∎

This completes the repaired one-block base.

## 5. The full-top auxiliary family and top partition

Apply the one-block results to `B subset [Z/2,Z)`, taking `Y=Z/2`. Define

```text
Q_B(a_B)=sum_(q<q' in B)(H_qq'(a_B)/(qq'))^2,
sigma_B0^2=sum_(q<q' in B)1/(q^2q'^2).
```

The prime count gives

```text
sigma_B0^2 asymp 1/(Z^2log^2Z).
```

There is a forcing floor

```text
F_B=c_BZ/log^3Z
```

such that every assignment with `Q_B<F_B` has a unique exact integer label `m`. Proposition 11 gives

```text
|m|<=C sqrt(F_B)/sigma_B0
     =O(Z^(3/2)/sqrt(logZ))
     =o(Z^2).
```

Hence `m` is the centred lift on every internal top pair, and

```text
Q_B=m^2sigma_B0^2.
```

Let

```text
T_B(a_B)
 =product_(q<q' in B)
   |(1-theta)+theta e(H_qq'(a_B)/(qq'))|.
```

Then

```text
T_B(a_B)<=exp(-kappa_bQ_B(a_B)).
```

Choose `epsilon<kappa_b/2` in Proposition 13. Unit-shell summation gives

```text
sum_(Q_B>=F_B)T_B(a_B)
 <=Cexp(-cF_B).
```

Below the floor, distinct assignments have distinct labels: two labels would differ by two top primes, while both are `o(Z^2)`. Therefore

```text
sum_(Q_B<F_B)T_B(a_B)
 <=sum_(m in Z)exp(-kappa_bm^2sigma_B0^2)
 <=C/sigma_B0
 <=CZlogZ.
```

Thus the complete weighted top partition satisfies

```text
P_top:=sum_(a_B)T_B(a_B)<=CZlogZ,
```

and its noncoherent part is exponentially small.

The full-top auxiliary family has already been fully checked in Lemma 7: it is distinct and avoiding, has load `O_b(1/logZ)`, square load `O_b(1/(ZlogZ))`, preserves the compact Bernoulli interval and no-wrap, and is negligible on the variance scale.

## 6. Uniform row code distance

Put

```text
R_rows=(P\B) union S_b.
```

Fix a top assignment. For each row `r in R_rows` and residue `x mod r`, let `u_rq(x) in R/Z` be the phase `h/(rq)` determined by the row residue `x` and the fixed top residue modulo `q`. If the row residue changes by `d`, CRT gives

```text
u_rq(x+d)-u_rq(x)
 =d q^(-1)/r mod 1.
```

### Lemma 14 — multiplicity-sensitive cyclic energy

Let `c_1,...,c_M` be nonzero residues modulo a prime `r`, each occurring at most `mu` times. If `M/mu` is sufficiently large, then for every nonzero `d mod r`,

```text
sum_j||dc_j/r||^2
 >=c M^3/(mu^2r^2).
```

**Proof.** Multiplication by `d` permutes the nonzero residues, so the multiplicity bound remains `mu`. Put

```text
t=floor(M/(4mu)).
```

For large `M/mu`, `t>=M/(8mu)>=1`. Fewer than `2mut<=M/2` terms can lie in the residue classes whose circle distance is less than `t/r`. Hence at least `M/2` terms have distance at least `M/(8mur)`, and their squares give the claim. ∎

### Proposition 15 — uniform lower-prime row distance

For every prime `r in P\B`,

```text
D_r:=min_(d!=0 mod r)
     sum_(q in B)||d q^(-1)/r||^2
    >>Z/log^3Z
```

uniformly in `r`.

**Proof.** Inversion is a permutation of the nonzero residues. An interval of length `Z/2` contains at most

```text
mu_r<=Z/(2r)+1<=2Z/r
```

integers in one residue class modulo `r`, because `r<Z/2`. Also `M>>Z/logZ`. Lemma 14 gives

```text
D_r
 >>M^3/(mu_r^2r^2)
 >>(Z^3/log^3Z)/Z^2
 =Z/log^3Z.
```

Moreover `M/mu_r>>r/logZ>=X/logZ`, so the largeness condition is uniform. ∎

### Proposition 16 — fixed `b`-row distance

For every prime `r|b`,

```text
D_r>=M/r^2>>_b Z/logZ.
```

**Proof.** Every `q in B` is coprime to `r`. If `d!=0 mod r`, then `dq^(-1)` is nonzero modulo `r`; consequently

```text
||dq^(-1)/r||>=1/r.
```

Sum the squares over all `M` top primes. This uses no distribution of primes in arithmetic progressions. ∎

## 7. Row tails and the retained skeleton

For a row `r`, define

```text
E_r(x)=sum_(q in B)||u_rq(x)||^2,
A_r(x)=product_(q in B)
       |(1-theta)+theta e(u_rq(x))|.
```

Choose `x_r^*` minimizing `E_r(x)`.

### Lemma 17 — row tail

There is `c_b>0` such that

```text
delta_r:=sum_(x!=x_r^*)A_r(x)
 <=r exp(-c_bD_r).
```

**Proof.** The Fourier modulus bound gives

```text
A_r(x)<=exp(-kappa_bE_r(x)).
```

For `x!=x_r^*`, the squared distance between the two phase vectors is at least `D_r`. The circle triangle inequality and `(a+b)^2<=2a^2+2b^2` give

```text
D_r<=2E_r(x)+2E_r(x_r^*)<=4E_r(x),
```

because `x_r^*` minimizes the energy. Thus `E_r(x)>=D_r/4`. Summing over at most `r` nondecoder residues proves the claim. ∎

Propositions 15 and 16 imply

```text
Delta:=sum_(r in R_rows)delta_r
 <=Z^2exp(-cZ/log^3Z)=o(1).
```

Indeed there are fewer than `Z` lower-prime rows, each row size is less than `Z`, and the finitely many rows dividing `b` have the stronger exponent.

Now decompose the absolute Fourier product for a fixed top assignment. Assign:

- every internal top denominator `qq'` to `T_B`;
- every top-cross denominator `rq`, with `r in R_rows` and `q in B`, to the unique row kernel `A_r`;
- every remaining denominator, necessarily a pair of two primes in `P\B`, to a residual product `G(x_R)`.

The target factor `e(-h/b)` has modulus one. Hence

```text
0<=G(x_R)<=1.
```

These denominator classes are disjoint and cover `E`; no factor is omitted or assigned twice.

### Lemma 18 — exact retained-skeleton inequality

Suppose finitely many nonnegative row kernels satisfy

```text
sum_(x_r!=x_r^*)A_r(x_r)<=delta_r,
0<=G<=1.
```

Then

```text
sum_(x_R) product_r A_r(x_r)G(x_R)
 <=product_r A_r(x_r^*)G(x^*)
   +product_r(A_r(x_r^*)+delta_r)
   -product_rA_r(x_r^*).
```

Moreover the last difference is at most

```text
product_r(1+delta_r)-1
 <=exp(Delta)-1.
```

The statement remains valid for an empty or singleton row set under the usual empty-product convention.

**Proof.** Separate the single point `x^*`. On every other point discard `G`. The sum of the pure product over all row coordinates factors:

```text
sum_(x_R)product_rA_r(x_r)
 =product_rsum_(x_r)A_r(x_r)
 <=product_r(A_r(x_r^*)+delta_r).
```

Subtract the decoder-point product and add back its actual value with `G(x^*)`; this gives the first inequality.

Write `a_r=A_r(x_r^*) in [0,1]`. The function

```text
H((a_r))=product_r(a_r+delta_r)-product_ra_r
```

is nondecreasing in each `a_r`, because every partial derivative is the difference of two products with the first factorwise no smaller than the second. Hence

```text
H((a_r))<=H((1))=product_r(1+delta_r)-1.
```

Finally `1+u<=e^u`. ∎

Multiplying by `T_B(a_B)` and summing over all top assignments shows that the entire nondecoder error is at most

```text
P_top(exp(Delta)-1)
 <=CZlogZ * O(Delta)
 =o(1).
```

This is the globally accumulated fibre estimate; the raw number of top assignments never appears.

## 8. Decoder identification

Suppose the top assignment is coherent with integer label `m`. For a row `r`, the candidate residue `m mod r` makes every top-cross phase congruent to `m/(rq)`. Therefore

```text
E_r(m mod r)
 <=(m^2/r^2)W_B
 <<(m^2/r^2)/(ZlogZ).
```

If this candidate energy is less than `D_r/8`, it is the unique minimizer. Indeed, for any other residue `x`,

```text
D_r<=2E_r(x)+2E_r(m),
```

so

```text
E_r(x)>=D_r/2-E_r(m)>3D_r/8>E_r(m).
```

Set

```text
M_dec=XZ/(logZ)^2.
```

### Proposition 19 — all prime coordinates decode

For every `r in P\B` and every coherent top label with `|m|<=M_dec`,

```text
x_r^*=m mod r.
```

**Proof.** The candidate energy is largest at the smallest row `r=X`. At `|m|=M_dec`, it is

```text
<<M_dec^2/X^2 /(ZlogZ)
 =Z/log^5Z.
```

Proposition 15 gives `D_r>>Z/log^3Z`; the ratio tends to zero uniformly. ∎

### Proposition 20 — the coordinates of `b` decode in the small-phase range

For every `r|b` and every coherent top label with `|m|<=X^2/4`,

```text
x_r^*=m mod r.
```

**Proof.** The candidate energy is

```text
<<_b X^4/(ZlogZ)=O_b(X/logX),
```

whereas Proposition 16 gives

```text
D_r>>_b Z/logZ=X^3/logZ.
```

The ratio tends to zero. ∎

Because `b` is squarefree, agreement modulo every prime divisor of `b` is agreement modulo `b`. Hence, for `|m|<=X^2/4`, the decoded coordinate tuple is exactly the residue of the integer `m modulo L`.

For `X^2/4<|m|<=M_dec`, all coordinates in `P` still decode to `m`, although the coordinates of `b` need not. This is sufficient for the retained complete-pair damping.

## 9. Adaptive prime-interval damping

### Proposition 21 — adaptive interval

For every integer `m` satisfying

```text
X^2/4<|m|<=M_dec,
```

the interval

```text
I_m=[2sqrt(|m|),3sqrt(|m|)]
```

lies in `[X,Z/2)`, contains

```text
K_m>>sqrt(|m|)/log|m|
```

primes, and the retained complete-pair energy on the decoded skeleton satisfies

```text
Q_pair(m)>>|m|/(log|m|)^2.
```

**Proof.** Put `y=sqrt(|m|)`. The strict lower inequality gives `2y>X`. At the upper endpoint,

```text
3y<=3sqrt(XZ)/logZ=3X^2/logZ<Z/2
```

for large `X`. Thus the entire interval is in `P\B`.

The tail-uniform PNT gives

```text
pi(3y)-pi(2y)>>y/logy,
```

uniformly because `y>=X/2` tends to infinity. Replacing the real endpoints by integer endpoints changes the count by at most two, which is absorbed by the growing lower bound.

For distinct primes `p,q in I_m`,

```text
4|m|<=pq<=9|m|,
```

so

```text
1/9<=|m|/(pq)<=1/4.
```

This ratio already lies in `[0,1/2]`, hence its circle distance is at least `1/9`. Since `K_m` tends uniformly to infinity,

```text
binom(K_m,2)>>K_m^2>>|m|/(log|m|)^2.
```

All these denominators are lower-lower factors retained in `G`, and all their prime coordinates decode to `m`. Summing their squared circle distances proves the claim. The sign of `m` is irrelevant because circle distance is even. Overlap between intervals for different labels is irrelevant, since the estimate is pointwise for each frequency. ∎

## 10. Exhaustive five-sector Fourier partition

Since `b` is squarefree and the support of `b` is disjoint from `P`,

```text
L=product_(r in S_b)r * product_(p in P)p
```

is squarefree. Thus CRT gives a bijection

```text
h mod L
 <-> ((h mod q)_(q in B),
      (h mod r)_(r in R_rows)).
```

There is no unrecorded lift or fibre multiplicity.

Fix a constant `C>=1` later and put

```text
N=floor(C/sigma_E).
```

For large `X`,

```text
N<X^2/4<M_dec
```

and the residues of all integers `|m|<=N` are distinct modulo `L`.

Every top assignment is either noncoherent (`Q_B>=F_B`) or coherent with its unique label `m`. For a coherent assignment, exactly one of the following disjoint ranges holds:

```text
I.   |m|<=N;
II.  N<|m|<=X^2/4;
III. X^2/4<|m|<=M_dec;
IV.  |m|>M_dec.
```

For each fixed top assignment, Lemma 18 splits the lower-coordinate sum into the single decoded skeleton and all nondecoder points. Hence every frequency belongs to exactly one of five sectors:

1. genuine major frequencies from range I;
2. full-variance Gaussian frequencies from range II;
3. adaptively damped decoded skeletons from range III;
4. coherent top-label tails from range IV;
5. noncoherent top assignments and every nondecoder fibre point.

The partition is disjoint by construction and exhaustive by the CRT coordinate bijection. There is no residual sibling sector: in I and II the `b` coordinates decode to `m`; in III their values are irrelevant to complete-pair damping; IV and V are controlled without any sibling classification.

## 11. Sector I — the positive major sum

For `|m|<=N`, Propositions 19 and 20 identify the decoded frequency with the genuine integer residue `h=m mod L`.

Compactness of `I_b` gives constants `rho_b>0` and `M_b<infinity` such that, uniformly in `theta in I_b` and `|z|<=rho_b`,

```text
log((1-theta)+theta e(z))
 =2pi i theta z
  -2pi^2theta(1-theta)z^2
  +R_theta(z),
|R_theta(z)|<=M_b|z|^3.
```

Every denominator in `E` is at least `X^2` for large `X`. Uniformly for `|m|<=N`,

```text
max_e|m/e|
 <<_C logX/X
 ->0.
```

Also

```text
sum_e|m/e|^3
 <=|m|^3/X^2 sum_e1/e^2
 <<_b C^3/(sigma_EX^2)
 <<_b C^3logX/X
 ->0.
```

Hence the logarithm is valid and the aggregate remainder tends uniformly to zero for fixed `C`. The linear term cancels exactly:

```text
2pi i m theta sum_e1/e-2pi i m/b=0.
```

Thus

```text
F(m)=exp(-2pi^2m^2sigma_E^2+epsilon_m),
max_(|m|<=N)|epsilon_m|->0.
```

For large `X`, make the remainder small enough that

```text
Re F(m)>=a_b exp(-2pi^2m^2sigma_E^2)
```

with fixed `a_b>0`. Conjugation pairs `m` and `-m`, so the major sum is real. The interval `|m|<=1/(4sigma_E)` lies inside the major range for fixed `C>=1`; on it the Gaussian is bounded below by a positive constant and it contains `>>1/sigma_E` integers. Therefore

```text
Re sum_(|m|<=N)F(m)
 >=c_maj/sigma_E
```

for fixed `c_maj=c_maj(b)>0`.

## 12. Sector II — full-variance Gaussian tail

For

```text
N<|m|<=X^2/4,
```

the decoded frequency is exactly `m mod L`. Every denominator is at least `X^2`, so

```text
|m|/e<=1/4
```

and `||m/e||=|m|/e`. The Fourier-energy bound therefore gives

```text
|F(m)|<=exp(-c_bm^2sigma_E^2)
```

for a fixed `c_b>0`. A Gaussian integral yields

```text
sum_(|m|>N)exp(-c_bm^2sigma_E^2)
 <=K_b sigma_E^(-1)exp(-c_bC^2/2).
```

Choose `C` so large that this is less than

```text
c_maj/(8sigma_E).
```

This is the only terminal constant choice before `X`.

## 13. Sectors III–V

### Sector III — adaptive damping

For every coherent label in

```text
X^2/4<|m|<=M_dec,
```

all prime coordinates in `P` decode to `m`. Proposition 21 and the retained lower-lower factors give

```text
|F(h_m)|
 <=exp(-c|m|/(log|m|)^2).
```

Throughout this range `log|m|` is comparable with `logX`, so each term is at most

```text
exp(-cX^2/log^2X).
```

There are at most `2M_dec+1=O(X^4)` labels. Hence the entire sector is

```text
O(X^4exp(-cX^2/log^2X))
 =o(1/sigma_E).
```

No identification of the coordinates of `b` is used here.

### Sector IV — top-label tail

For a coherent top label, the internal-top factor is at most

```text
exp(-kappa_bm^2sigma_B0^2).
```

The decoded row and residual products have modulus at most one. Therefore

```text
sum_(|m|>M_dec)
 exp(-kappa_bm^2sigma_B0^2)
 <=C sigma_B0^(-1)
   exp(-cM_dec^2sigma_B0^2).
```

Since

```text
M_dec^2sigma_B0^2
 >>(X^2Z^2/log^4Z)/(Z^2log^2Z)
 =X^2/log^6Z,
```

and `sigma_B0^(-1)=O(ZlogZ)`, Sector IV is `o(1/sigma_E)`.

### Sector V — noncoherent top assignments and nondecoder fibres

The decoded-skeleton contribution of noncoherent top assignments is at most

```text
sum_(Q_B>=F_B)T_B(a_B)
 <=Cexp(-cF_B).
```

The entire nondecoder contribution, including coherent and noncoherent top assignments, is at most

```text
P_top(exp(Delta)-1)
 <=CZlogZ * O(Z^2exp(-cZ/log^3Z)).
```

Since `1/sigma_Easymp XlogX`, both displayed quantities are `o(1/sigma_E)`. Thus Sector V is negligible.

## 14. Terminal budget and positivity

The parameter order is exactly

```text
C -> X.
```

All constants depending on `b`, the compact interval `I_b`, and the repaired one-block theorem are fixed first. Choose `C` as in Sector II. Then choose `X` above the finite maximum of the thresholds required for:

- prime counts and Abel sums;
- exclusion of the support of `b` and avoidance of `T`;
- the load interval, no-wrap, and variance comparison;
- repaired one-block forcing and fingerprint entropy;
- the top partition;
- uniform cyclic row distance;
- decoder identification;
- adaptive interval containment and prime count;
- the Taylor disk and aggregate remainder;
- the strict comparisons for Sectors III–V.

For this `X`, the total absolute contribution of Sectors II–V is less than, say,

```text
c_maj/(2sigma_E),
```

while Sector I has real part at least `c_maj/sigma_E`. Hence

```text
Re sum_(h mod L)F(h)>0.
```

The exact Fourier identity gives `W>0`; therefore some subset `A subset E` satisfies

```text
sum_(e in A)L/e=L/b mod L.
```

Dividing by `L`, the difference

```text
sum_(e in A)1/e-1/b
```

is an integer. But

```text
0<=sum_(e in A)1/e<=Lambda<1,
0<1/b<1,
```

so the difference lies strictly between `-1` and `1`. It is zero. Thus

```text
sum_(e in A)1/e=1/b.
```

By Lemma 7, `A` consists of distinct squarefree semiprimes and avoids `T`. This proves Theorem 2. Lemmas 3 and 4 prove sufficiency in Theorem 1, while necessity was proved at the outset. ∎

## 15. Independence and route closure

Every load-bearing implication used by the one-anchor architecture is proved in this file. The only external theorem is the PNT. In particular:

- the repaired one-block forcing and zero-exception theorem are not cited from the frozen packet;
- the full-top auxiliary family is estimated directly;
- the retained-skeleton inequality uses the actual Bernoulli moduli, handles empty and singleton row sets, and assigns every denominator exactly once;
- the row code distance is uniform, with a separate stronger proof for every `r|b`;
- decoder identification and every use of squarefreeness are explicit;
- the top partition and five-sector exhaustion expose every coordinate and multiplicity;
- the adaptive interval treats signs, endpoints, rounding, diagonal exclusion, and containment;
- the final budget has the non-circular order `C -> X`;
- positivity, no-wrap, avoidance, numerator induction, and the cases `b=1,2` are closed.

The route is therefore mathematically complete at proof-development level and ready for independent route audit.