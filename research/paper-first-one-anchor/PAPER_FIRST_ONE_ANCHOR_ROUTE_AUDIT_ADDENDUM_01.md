# Paper-first one-anchor route — adversarial audit and all-coordinate strengthening

**Programme:** `E306-RL`  
**Research unit:** `E306-RL-PF1A-03`  
**Status:** `ARGUMENT / MATERIAL STRICTER ROUTE CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

## 1. Current-state verification

At the time of this addendum:

- the immutable formal record remains `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`;
- the current authorial paper proof is the frozen paper-first candidate
  `review/e306-paper-first-proof-audit-v1@5753219dd888b77b0ebe892a8ae7feabb0ca40ae`;
- `E306-PF-AUDIT-01` in research-workbench issue #53 has been instantiated and is running;
- E306-DIR has separately prepared `E306-CPM-01` in issue #54 for broad complete-pair mechanism mining;
- the present one-anchor route remains on the standing RL branch and is not contained in any accepted manuscript, Curator corpus, formal release, or completed audit.

The purpose here is not to disturb the frozen audit.  It is to determine whether the
one-anchor route is genuinely ahead of every currently recorded E306 proof
architecture, and to close the most obvious structural gap in its first statement.

## 2. Main strengthening: eliminate the sibling sector as well

Let

```text
P = {p prime : X <= p < X^3},
Z = X^3,
B = {q prime : Z/2 <= q < Z}.
```

Retain the complete pair family

```text
E_pair = {pq : p,q in P, p<q}.
```

Instead of selecting a fixed number `G` of top primes for each prime divisor of
`b`, use the full top block:

```text
E_b = {rq : r | b prime, q in B}.
```

Put `E=E_pair disjoint-union E_b` and

```text
L = b * product_(p in P) p.
```

Because `b` is fixed and squarefree, and every `q in B` tends to infinity,
unique factorization gives pairwise distinct squarefree semiprimes and no collision
between `E_pair` and `E_b`.

The auxiliary reciprocal load is

```text
Lambda_b
 = (sum_(r|b, r prime) 1/r) * sum_(q in B) 1/q
 = O_b(1/log Z)
 = o_b(1).
```

The auxiliary square load is

```text
W2_b
 = (sum_(r|b, r prime) 1/r^2) * sum_(q in B) 1/q^2
 = O_b(1/(Z log Z)).
```

The complete-pair square load is of order

```text
1/(X^2 log^2 X),
```

so `W2_b=o(1/(X^2 log^2 X))` because `Z=X^3`.  Thus the full-top auxiliary family
preserves:

1. the limiting total reciprocal load `(log 3)^2/2+o(1)`;
2. the compact Bernoulli interval;
3. no-wrap (`Lambda<1` for large `X`);
4. the existing full-pair variance comparison.

Unlike the fixed-`G` reservoir, it also supplies a strong cyclic code for every
prime coordinate of `b`.

## 3. Exact decoded-skeleton inequality

Fix an assignment on the top block `B`.  Let

```text
R = (P \ B) union {r : r|b prime}.
```

Since `b` is squarefree and its prime factors are excluded from `P`, a frequency
modulo `L` is exactly a product assignment on the coordinates

```text
B disjoint-union R.
```

For every row `r in R`, the factors from the denominators `rq`, `q in B`, depend
only on the row coordinate `x_r mod r` and the fixed top assignment.  Write their
absolute product as `A_r(x_r)`.  Let `x_r^*` be a nearest decoder and suppose

```text
sum_(x_r != x_r^*) A_r(x_r) <= delta_r.
```

Let `G((x_r))` be the absolute product of every factor not assigned to these row
kernels.  Then `0<=G<=1`.  Expanding one row at a time gives the exact retained
skeleton bound

```text
sum_(x_R) [product_r A_r(x_r)] G(x_R)
 <= [product_r A_r(x_r^*)] G(x^*)
    + product_r(A_r(x_r^*)+delta_r) - product_r A_r(x_r^*).
```

Since every `A_r(x_r^*)<=1`, the error is at most

```text
exp(sum_r delta_r) - 1
 = O(sum_r delta_r)
```

when the latter sum tends to zero.

This is stronger than merely bounding each row partition by `1+delta_r`: it
retains all unused complete-pair factors on the decoded skeleton.  Those retained
factors are what later supply the full coherent-label damping.

## 4. Uniform row code distances

### 4.1 Prime rows inside the power interval

For `r in P\B`, changing the row residue by `d!=0 mod r` changes the `rq` phase by

```text
(d q^(-1) mod r)/r.
```

Let `M=|B|`, and let `mu_r` be the maximum multiplicity of one residue among
`q^(-1) mod r`, `q in B`.  An interval of length `Z/2` contains at most

```text
Z/(2r)+1
```

integers in one residue class modulo `r`, hence

```text
mu_r <= Z/(2r)+1.
```

The multiplicity-sensitive cyclic-energy inequality gives

```text
D_r
 := min_(d!=0) sum_(q in B) ||d q^(-1)/r||^2
 >= M^3/(12 mu_r^2 r^2)
 >> Z/log^3 Z
```

uniformly for every `X<=r<Z/2`.  Here `M>>Z/log Z` by the PNT.

For the Bernoulli kernel with parameter in a fixed compact subinterval of `(0,1)`,
there is `c_b>0` such that

```text
sum_(x_r != x_r^*) A_r(x_r)
 <= r exp(-c_b D_r)
 <= Z exp(-c_b' Z/log^3 Z).
```

### 4.2 Prime coordinates of b

For fixed `r|b`, the multiplicity among the top primes is

```text
mu_r <= M/(r-1)+O(1).
```

The same energy inequality therefore yields

```text
D_r >>_b M >> Z/log Z.
```

Thus the `b`-coordinate row errors are even smaller.

Summing over all rows gives

```text
Delta := sum_(r in R) delta_r
 <= Z^2 exp(-c Z/log^3 Z)
 = o(1).
```

Multiplication by the full top-block partition scale, which is only polynomial in
`Z`, still gives an exponentially negligible total fibre error.

## 5. Top-block partition

Let `Q_B` be the complete internal CRT energy on the top block.  The paper-first
one-block results give a forcing floor

```text
F_B >> Z/log^3 Z.
```

Below `F_B`, every top assignment is represented by one exact integer label `m`,
and

```text
Q_B = m^2 sigma_B^2,
sigma_B^2 asymp 1/(Z^2 log^2 Z).
```

Above `F_B`, choose a fixed entropy coefficient smaller than the Fourier damping
constant.  The explicit fingerprint count and shell summation give

```text
sum_(Q_B>=F_B) exp(-c Q_B)
 <= poly(Z) exp(-c' Z/log^3 Z).
```

The complete top partition is therefore

```text
O(1/sigma_B) + exponentially small
 = O(Z log Z).
```

Consequently the total decoded-fibre error is still

```text
O(Z log Z * Delta)=o(1).
```

## 6. Identification of the decoded coordinates

### 6.1 Rows in P\B

Suppose the top assignment is the exact integer label `m`.  If

```text
M_dec = X Z/(log Z)^2
```

and `|m|<=M_dec`, then for every `r in P\B` the candidate row `m mod r` has

```text
E_r(m)
 <= (m^2/r^2) sum_(q in B) q^(-2)
 << (m^2/r^2)/(Z log Z).
```

At the worst row `r=X`, this is

```text
O(Z/log^5 Z)=o(D_r).
```

The nearest-codeword inequality therefore forces

```text
x_r^* = m mod r
```

uniformly for every `r in P\B`.

### 6.2 Rows dividing b

For `r|b`, the same candidate has energy

```text
E_r(m) <<_b m^2/(Z log Z).
```

Throughout

```text
|m|<=X^2/4,
```

this is `O_b(X/log X)`, whereas `D_r>>_b Z/log Z=X^3/log Z`.  Hence

```text
x_r^* = m mod r
```

for every prime divisor `r` of `b` throughout the major arc and the whole
small-phase Gaussian tail.

Because `b` is squarefree, equality modulo every prime divisor of `b` is equality
modulo `b`.  Thus in this range the decoded skeleton is the genuine integer
frequency `h=m mod L`.  There is no separate sibling family.

## 7. Complete Fourier partition

Let

```text
sigma_E^2
 = theta(1-theta) sum_(e in E) e^(-2)
 asymp 1/(X^2 log^2 X).
```

Choose `N=ceil(C/sigma_E)` after the usual main/minor budget is fixed.

Every frequency is assigned to one of the following sectors.

### Sector I — genuine major frequencies

```text
|m|<=N.
```

All coordinates decode to `m`.  The finite Fourier terms are exactly the genuine
integer frequencies.  The existing compact-parameter Taylor argument gives

```text
Re sum_(|m|<=N) F(m) >= c_maj/sigma_E.
```

### Sector II — full-variance Gaussian tail

```text
N<|m|<=X^2/4.
```

Every coordinate, including every coordinate of `b`, still decodes to `m`.  Since
every denominator is at least `X^2`, all phases lie in the fixed small-phase disk
and

```text
|F(m)| <= exp(-c m^2 sigma_E^2).
```

Choosing `C` large makes the whole sector an arbitrarily small fixed fraction of
`1/sigma_E`.

### Sector III — adaptive complete-pair damping

```text
X^2/4<|m|<=M_dec.
```

Every prime coordinate in `P` decodes to `m`; the decoded coordinates modulo `b`
need not be identified.  This is harmless because the complete-pair factors do not
depend on those coordinates.

Choose

```text
I_m=[2 sqrt(|m|),3 sqrt(|m|)].
```

For large `X`, the full interval lies in `[X,X^3)`.  Tail-uniform PNT gives

```text
#(I_m intersect primes) >> sqrt(|m|)/log |m|.
```

For distinct `p,q` in this interval,

```text
1/9 <= |m|/(pq) <= 1/4.
```

Hence

```text
Q_E(m) >> |m|/(log |m|)^2,
```

and the sum over this sector is exponentially negligible relative to
`1/sigma_E`.

### Sector IV — top-label tail

```text
|m|>M_dec
```

within the exact-cold top sector.  The top-block energy alone gives

```text
m^2 sigma_B^2
 >= M_dec^2 sigma_B^2
 >> X^2/log^6 Z.
```

The resulting Gaussian top-label tail is exponentially negligible.

### Sector V — noncoherent top assignments and fibre siblings

Noncoherent top assignments are killed by the top forcing floor and fingerprint
entropy.  All non-decoder lower assignments are absorbed in the error `O(Delta)`
from the retained-skeleton inequality.

These five sectors are disjoint and exhaustive.

## 8. Terminal positivity and exact equality

Choose the terminal constants in the order

```text
C -> X,
```

where `C` first makes Sector II smaller than a prescribed fraction of the major
coefficient, and `X` is then above all PNT, one-block rigidity, decoder,
Taylor, adaptive-interval, avoidance, and strict-comparison thresholds.

Sectors III--V tend to zero super-polynomially or exponentially relative to
`1/sigma_E`; no separate `eta`, no adjacent-chain cutoff, and no reservoir size
`G` is needed.

The complete Fourier sum therefore has positive real part.  Since

```text
sum_(e in E) 1/e < 1,
```

no-wrap converts the congruence to the exact reciprocal identity.  Avoidance,
numerator induction, and the cases `b=1,2` proceed exactly as in the frozen
paper-first candidate.

## 9. Route-level comparison

The frozen paper-first proof uses:

```text
complete pair load
+ one-block forcing
+ all-block hot/cold chain
+ adjacent-label penalties
+ global injective code
+ global level-set theorem
+ localization and CRT tail
+ fixed-G sibling reservoir
+ three-stage eta -> C -> G -> X terminal order.
```

The strengthened one-anchor route uses:

```text
complete pair load
+ one top-block forcing/entropy theorem
+ shift-uniform product-fibre decoding of every other coordinate
+ full-variance Gaussian tail
+ adaptive complete-pair damping
+ two-stage C -> X terminal order.
```

It removes:

1. all-block hot/cold bookkeeping;
2. adjacent-label propagation;
3. shell/hot/boundary/segment encoding;
4. the global level-set theorem;
5. multiblock localization;
6. the block-minor/sibling-minor dichotomy;
7. the separate parameter `eta`;
8. the fixed reservoir size `G`.

No earlier E306 proof family recorded in the release, pushlinter refactor, old
Curator corpus, rejected manuscripts, or frozen paper-first candidate has this
architecture.  Therefore, **at the level of proposed mathematical route and proof
DAG**, it is strictly ahead of every currently recorded E306 proof architecture.

This is not an assurance statement.  The immutable Lean release remains the
strongest formal authority, and the running paper-first audit remains the only
active independent ordinary-proof assurance lane.

## 10. Exact disposition

Classification:

```text
MATERIAL STRICTER ALTERNATIVE ROUTE CANDIDATE /
ROUTE-LEVEL FRONTIER AHEAD OF ALL CURRENT E306 LIBRARIES /
NOT INDEPENDENTLY REVIEWED /
MUST NOT CONTAMINATE THE RUNNING FROZEN AUDIT.
```

The appropriate control action is:

1. continue `E306-PF-AUDIT-01` unchanged;
2. alert E306-DIR immediately that the RL route now removes both the global chain
   and the sibling sector;
3. let DIR decide whether to instantiate a separate bounded route audit or add the
   route to the prepared complete-pair mechanism probe;
4. do not launch REV5 or move MATH-CUR intake on this candidate before that
   disposition.

The next RL work, unless DIR redirects it, is an adversarial rederivation of:

- the retained-skeleton inequality with the exact Bernoulli factors;
- the uniform row multiplicity/energy constants;
- the adaptive-prime-interval bound uniformly at both endpoints;
- the final complex Fourier budget with no hidden factor from the product
  coordinates.
