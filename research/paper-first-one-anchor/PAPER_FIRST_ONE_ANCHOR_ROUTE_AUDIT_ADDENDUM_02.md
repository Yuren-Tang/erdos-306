# Paper-first one-anchor route — weighted-fibre correction and complete Fourier ledger

**Programme:** `E306-RL`  
**Research unit:** `E306-RL-PF1A-04`  
**Status:** `ARGUMENT / CONTROLLING CORRECTION / ROUTE SURVIVES / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-22

## 1. Purpose and disposition

This addendum adversarially rederives the strengthened one-anchor route recorded in

`research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_01.md`.

It finds one genuine bookkeeping gap:

> the unweighted retained-skeleton inequality in Addendum 01 does not by itself
> justify summing the fibre error over all top-block assignments.

If used literally, the error could be multiplied by the total number of top
assignments rather than by the top Gibbs partition.  The route survives after the
correct top weight is factored before fibre compression.

A second correction removes an unnecessary implicit appeal to prime equidistribution
modulo fixed divisors of `b`.  The required `b`-row code distance follows from an
elementary pointwise lower bound and ordinary top-block prime supply.

No released, manuscript, review, Curator, Lean, or PDL authority is changed.

## 2. Exact denominator and coordinate system

Fix squarefree `b>=3` and a finite forbidden set.  Put

```text
P = {p prime : X <= p < X^3},
Z = X^3,
B = {q prime : Z/2 <= q < Z}.
```

For sufficiently large `X`, the prime divisors of `b` are disjoint from `P`.  Let

```text
E_pair = {pq : p,q in P, p<q},
E_b    = {rq : r|b prime, q in B},
E      = E_pair disjoint-union E_b,
L      = b * product_(p in P) p.
```

The CRT coordinate set is

```text
B disjoint-union R,
R = (P\B) union {r : r|b prime}.
```

Every frequency `h mod L` is uniquely one top assignment `y=(y_q)_(q in B)` and one
lower assignment `x=(x_r)_(r in R)`.

The families assigned to lower rows are pairwise disjoint:

- for `r in P\B`, row `r` receives the factors for `rq`, `q in B`;
- for `r|b`, row `r` receives the factors for `rq`, `q in B`.

Every top--lower pair factor is assigned exactly once.  Internal top factors,
internal lower factors, and the unit-modulus target character remain unassigned.

## 3. Bernoulli factorization

Write

```text
K_theta(t) = (1-theta) + theta exp(2 pi i t).
```

For the compact `b`-dependent parameter interval there is `kappa_b>0` such that

```text
|K_theta(t)| <= exp(-kappa_b ||t||^2).
```

Fix a top assignment `y`.  Define its internal top weight

```text
A_B(y)
 = product_(q<q' in B) |K_theta(phi_qq'(y))|.
```

For every lower row `r`, define

```text
A_(r,y)(x_r)
 = product_(q in B) |K_theta(alpha_(r,q)(y)+psi_(r,q)(x_r))|.
```

All remaining absolute factors form `H_y(x)`, with

```text
0 <= H_y(x) <= 1.
```

Thus the exact absolute Fourier amplitude factors as

```text
|F(y,x)|
 = A_B(y) * [product_(r in R) A_(r,y)(x_r)] * H_y(x).
```

This is the factorization required for summable fibre compression.

## 4. Correct weighted retained-skeleton lemma

### Lemma 4.1 — weighted decoded skeleton

Let `I` be finite.  For each `i in I`, let `A_i:X_i->[0,1]`, choose `x_i^*`, and
assume

```text
sum_(x_i != x_i^*) A_i(x_i) <= delta_i.
```

Let `A>=0` and `H:product_i X_i->[0,1]`.  Then

```text
sum_x A [product_i A_i(x_i)] H(x)
 <= A [product_i A_i(x_i^*)] H(x^*)
    + A { product_i(A_i(x_i^*)+delta_i)
          - product_i A_i(x_i^*) }.
```

In particular, since `A_i(x_i^*)<=1`,

```text
sum_x A [product_i A_i(x_i)] H(x)
 <= A [product_i A_i(x_i^*)] H(x^*)
    + A ( exp(sum_i delta_i)-1 ).
```

#### Proof

Separate the all-star term.  On every other tuple use `H<=1`.  The sum of the pure
product weights over all tuples is

```text
product_i sum_(x_i) A_i(x_i)
 <= product_i(A_i(x_i^*)+delta_i).
```

Subtract the all-star pure product and restore the actual all-star `H` factor.  Then
multiply by `A`.  `square`

### Application

Apply Lemma 4.1 with

```text
A=A_B(y),
A_i=A_(r,y),
H=H_y.
```

For a chosen fibre decoder `x^*(y)`,

```text
sum_x |F(y,x)|
 <= |F(y,x^*(y))|
    + A_B(y)(exp(Delta_y)-1),
Delta_y=sum_r delta_(r,y).
```

The row distances below are uniform in `y`, so `Delta_y<=Delta` for every top
assignment.  Summing over `y` gives the corrected global compression

```text
sum_y sum_x |F(y,x)|
 <= sum_y |F(y,x^*(y))|
    + Z_B (exp(Delta)-1),
```

where

```text
Z_B = sum_y A_B(y).
```

This is the missing normalization in Addendum 01.

## 5. Shift-uniform row compression

For `r in P\B`, changing the row coordinate by nonzero `d mod r` changes the phase
vector by

```text
(d q^(-1) mod r)/r,  q in B.
```

Let `M=|B|` and let `mu_r` be the largest multiplicity of one residue among
`q^(-1) mod r`, `q in B`.  Since the interval `[Z/2,Z)` has length `Z/2`,

```text
mu_r <= Z/(2r)+1.
```

The multiplicity-sensitive cyclic packing bound gives

```text
D_r
 := min_(d!=0 mod r) sum_(q in B) ||d q^(-1)/r||^2
 >= M^3/(12 mu_r^2 r^2)
 >> Z/(log Z)^3
```

uniformly for `X<=r<Z/2`.

For an arbitrary shift, at most one row residue has shifted energy below `D_r/4`.
Choosing a minimum-energy row residue `x_r^*(y)` therefore gives

```text
sum_(x_r != x_r^*) A_(r,y)(x_r)
 <= r exp(-c_b D_r)
 <= Z exp(-c_b' Z/(log Z)^3).
```

The constant absorbs the Bernoulli exponent and the factor `1/4`.

## 6. Elementary b-row distance; no PNT in progressions

Let `r|b` be prime and fixed.  For every `q in B`, `q` is nonzero modulo `r`.  If
`d!=0 mod r`, then `d q^(-1)` is also nonzero modulo `r`; hence

```text
||d q^(-1)/r|| >= 1/r.
```

Therefore

```text
D_r
 := min_(d!=0 mod r) sum_(q in B) ||d q^(-1)/r||^2
 >= M/r^2
 >>_b Z/log Z.
```

This proof uses only the ordinary lower bound `M>>Z/log Z`.  The claim

```text
mu_r <= M/(r-1)+O(1)
```

from Addendum 01 is deleted: it is unnecessary and would require an additional
fixed-modulus distribution statement if interpreted literally.

The corresponding `b`-row sibling mass is

```text
<= r exp(-c_b D_r)
<= O_b(exp(-c_b' Z/log Z)).
```

## 7. Uniform total fibre error

There are `O(Z/log Z)` prime rows in `P\B` and only `omega(b)` fixed `b`-rows.
Consequently

```text
Delta
 := sup_y sum_(r in R) delta_(r,y)
 <= Z^2 exp(-c Z/(log Z)^3)
 = o(1).
```

The deliberately wasteful factor `Z^2` absorbs all row sizes and row counts.

## 8. Independent top partition ledger

Let

```text
Q_B(y)=sum_(q<q' in B) ||phi_qq'(y)||^2,
sigma_B^2=sum_(q<q' in B) 1/(q^2 q'^2).
```

Then

```text
sigma_B^2 asymp 1/(Z^2 (log Z)^2),
1/sigma_B asymp Z log Z.
```

The Bernoulli estimate gives

```text
A_B(y) <= exp(-kappa_b Q_B(y)).
```

The single-block cold theorem gives a forcing floor

```text
F_B = c_w Z/(log Z)^3.
```

Below `F_B`, every top assignment is represented by one integer `m`, and the cold
label bound gives

```text
|m| << sqrt(F_B)/sigma_B
     << Z^(3/2)/(log Z)^(1/2)
     = o(Z^2).
```

Thus `|m|<qq'/2` for every `q,q' in B` at sufficiently large `Z`, so the centred CRT
lift is literally `m`, not merely congruent to `m`.  Hence

```text
Q_B(y)=m^2 sigma_B^2
```

throughout the cold sector.  The label is unique because its absolute size is far
below the product of the top primes.

Therefore the cold partition is at most

```text
sum_(m in Z) exp(-kappa_b m^2 sigma_B^2)
= O(1/sigma_B).
```

Above `F_B`, the one-block fingerprint entropy theorem states that for every fixed
`epsilon>0`, sufficiently large `Z` gives

```text
#{y:Q_B(y)<=R} <= exp(epsilon R)
```

uniformly for `R>=F_B`.  Choose `epsilon<kappa_b`.  Shell summation gives

```text
sum_(Q_B>=F_B) exp(-kappa_b Q_B)
 <= C exp(-(kappa_b-epsilon)F_B).
```

Thus

```text
Z_B=sum_y A_B(y)=O(1/sigma_B)=O(Z log Z).
```

Combining with Section 7,

```text
Z_B(exp(Delta)-1)
 << Z log Z * Delta
 = o(1).
```

In particular it is `o(1/sigma_E)` because `1/sigma_E` tends to infinity.

## 9. Decoder identification for exact top labels

Suppose the top assignment has exact integer label `m`.

### 9.1 Rows in P\B

For candidate row residue `m mod r`,

```text
E_r(m)
 <= (m^2/r^2) sum_(q in B) q^(-2)
 << (m^2/r^2)/(Z log Z).
```

Set

```text
M_dec = X Z/(log Z)^2 = X^4/(log Z)^2.
```

At `|m|<=M_dec`, the worst row is `r=X`, and

```text
E_r(m) << Z/(log Z)^5 = o(D_r).
```

The shifted separation lemma therefore forces

```text
x_r^*(m)=m mod r
```

for every `r in P\B`.

### 9.2 Rows dividing b

For fixed `r|b`,

```text
E_r(m) <<_b m^2/(Z log Z).
```

At `|m|<=X^2/4`, this is `O_b(X/log X)`, while

```text
D_r >>_b Z/log Z = X^3/log Z.
```

Hence

```text
x_r^*(m)=m mod r
```

for every prime divisor `r` of `b` throughout the genuine major range and the full
small-phase Gaussian tail.  Since `b` is squarefree, the decoded skeleton is the
genuine frequency `h=m mod L` in this range.

## 10. Exhaustive corrected Fourier partition

Let

```text
sigma_E^2
 = theta(1-theta) sum_(e in E) e^(-2)
 asymp 1/(X^2 (log X)^2).
```

After fixing the terminal budget, choose

```text
N=ceil(C/sigma_E).
```

For large `X`, `N<X^2/4<M_dec`.

### Lane I — genuine major frequencies

```text
|m|<=N.
```

All `P`-coordinates and all `b`-coordinates decode to `m`.  The skeleton is the
actual integer frequency `h=m`.  The compact-parameter Taylor argument gives

```text
Re sum_(|m|<=N) F(m) >= c_maj/sigma_E.
```

### Lane II — full-variance Gaussian tail

```text
N<|m|<=X^2/4.
```

Every coordinate still decodes to `m`.  Every denominator in `E` is at least
`X^2` for sufficiently large `X`, so

```text
||m/e||=|m|/e <= 1/4.
```

Therefore

```text
|F(m)| <= exp(-c m^2 sigma_E^2).
```

Choosing `C` first makes the whole lane an arbitrarily small fixed fraction of
`1/sigma_E`.

### Lane III — adaptive complete-pair damping

```text
X^2/4<|m|<=M_dec.
```

Every coordinate in `P` decodes to `m`; the `b`-coordinates need not.  Internal
complete-pair factors are independent of the `b`-coordinates.

Put

```text
I_m=[2 sqrt(|m|),3 sqrt(|m|)].
```

At the lower endpoint, `2sqrt(|m|)>X`; at the upper endpoint,

```text
3sqrt(M_dec)=3 X^2/log Z < X^3=Z
```

for large `X`.  Hence `I_m subset [X,X^3)`.  Tail-uniform PNT gives

```text
#(I_m intersect primes) >> sqrt(|m|)/log |m|.
```

For distinct primes `p,q in I_m`,

```text
1/9 <= |m|/(pq) <= 1/4,
```

so every such pair contributes a fixed positive amount to the CRT energy.  Thus

```text
Q_E(m) >> |m|/(log |m|)^2.
```

Since there are at most `2M_dec+1` labels in the lane,

```text
sum_(Lane III skeletons) |F|
 <= O(M_dec) exp(-c X^2/(log X)^2)
 = o(1/sigma_E).
```

### Lane IV — large exact top labels

```text
|m|>M_dec
```

inside the cold exact-label sector.  The cold label bound ensures `|m|=o(Z^2)`, so

```text
Q_B(m)=m^2 sigma_B^2.
```

Hence

```text
M_dec^2 sigma_B^2
 asymp X^2/(log Z)^6.
```

The Gaussian tail, including its `1/sigma_B` prefactor, obeys

```text
sum_(|m|>M_dec, cold) A_B(m)
 <= C/sigma_B * exp(-c X^2/(log Z)^6)
 = o(1/sigma_E).
```

### Lane V — energetic top assignments

```text
Q_B>=F_B.
```

The one-block entropy estimate gives

```text
sum_(Lane V skeletons) |F|
 <= sum_(Q_B>=F_B) A_B(y)
 <= C exp(-c F_B)
 = o(1/sigma_E).
```

### Lane VI — all non-decoder fibres

For every top assignment, all lower assignments except its selected decoder are
absorbed globally by

```text
Z_B(exp(Delta)-1)=o(1/sigma_E).
```

The six lanes are disjoint and exhaustive after fixing the unique cold label in its
bounded centred range.

## 11. Terminal positivity and no-wrap

Choose constants in the order

```text
C -> X.
```

First choose `C` so that Lane II is smaller than a prescribed fraction of the major
lower bound.  Then choose `X` above all fixed PNT, load, one-block rigidity,
fingerprint, decoder, Taylor, adaptive-interval, avoidance, and strict-budget
thresholds.

Lanes III--VI are `o(1/sigma_E)`.  Therefore

```text
Re sum_(h mod L) F(h) > 0.
```

The weighted subset coefficient is positive.  Since

```text
sum_(e in E) 1/e < 1,
```

the congruence has no nonzero integer alias and is the exact reciprocal equality.
Avoidance, numerator induction, and the elementary `b=1,2` reductions are unchanged.

## 12. Audit verdict

The one-anchor/no-sibling route survives the adversarial audit after one material
normalization repair and one analytic-input simplification.

Correct classification:

```text
MATERIAL STRICTER ALTERNATIVE ROUTE CANDIDATE /
WEIGHTED-FIBRE BOOKKEEPING REPAIRED /
NO PNT-IN-PROGRESSIONS INPUT NEEDED /
FULL FOURIER PARTITION RE-DERIVED /
NOT INDEPENDENTLY REVIEWED.
```

Remaining highest-risk obligations are now narrower:

1. independent verification of the single-block cold and entropy theorems at the
   exact top-block normalization;
2. independent verification of the multiplicity-sensitive cyclic packing constant;
3. a line-by-line complex Taylor major-arc budget with the full `E_b` family;
4. ordinary mathematical audit of every strict endpoint and parameter quantifier.
