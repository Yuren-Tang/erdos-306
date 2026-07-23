# E306 corollary map

**Workstream:** `E306-AFT-01`  
**Status:** `APPLICATION MAP / CONDITIONAL ON FROZEN PROVIDERS`  
**Frozen source:** `research/e306-frontier-v1@55b05ee5ca7e0c2f47ba4f17c6773defa5ac3951`  
**Warning:** this file does not certify the one-anchor E306 route

## 1. Purpose

This note maps the frozen one-anchor construction into the general
anchor–fibre transference theorem.  It separates:

- the general theorem proved in this workstream;
- arithmetic providers asserted at the frozen research checkpoint;
- provider obligations which remained unreviewed there.

No later moving Research Lead commit is consumed as authority.

## 2. Finite Fourier coefficient

Fix squarefree `b>=3`, a sufficiently large scale `X`, and put

```text
P={p prime:X<=p<X^3},
Z=X^3,
B={q prime:Z/2<=q<Z},
E_pair={pq:p,q in P,p<q},
E_b={rq:r|b prime,q in B},
E=E_pair disjoint-union E_b,
L=b product_(p in P)p.
```

The Bernoulli parameter is

```text
theta=1/(b Lambda),
Lambda=sum_(e in E)1/e.
```

The target coefficient is

```text
W_target
 =1/L sum_(h mod L)
   product_(e in E)((1-theta)+theta exp(2 pi i h/e))
   exp(-2 pi i h/b).
```

Positivity gives a subset satisfying the target congruence.  Since the total
reciprocal load is `<1`, every subset sum and the target lie in one fundamental
interval; no-wrap turns congruence into the exact reciprocal identity.

This supplies provider P6 of the general theorem.

## 3. Anchor and fibre coordinates

The CRT coordinates are divided as

```text
anchor Y = assignments on B,
row set R = (P\B) union {r:r|b prime}.
```

For fixed anchor assignment `y`, row `r` receives all top--row factors `rq` with
`q in B`.  Internal top factors, internal lower factors, and the target
character remain unassigned.

The exact absolute factorization is

```text
|F(y,x)|
 =A_B(y) [product_(r in R)A_(r,y)(x_r)] H_y(x),
0<=H_y(x)<=1.
```

The map to the general theorem is:

| general object | E306 object |
|---|---|
| anchor set `Y` | top-block CRT assignments |
| anchor weight `W_y` | `A_B(y)` after decoder normalization |
| row coordinate `X_r` | residue classes modulo `r` |
| row kernel | product of Bernoulli magnitudes on `rq`, `q in B` |
| decoder `d_r(y)` | minimum-energy row residue |
| residual `H_y` | all unassigned Fourier factors |
| decoded skeleton | one lower residue per row together with the anchor |

## 4. Weighted decoded-skeleton provider

The frozen source gives row tail bounds

```text
sum_(x_r!=d_r(y)) A_(r,y)(x_r)<=delta_(r,y)
```

with

```text
Delta=sup_y sum_r delta_(r,y)
 <=Z^2 exp(-cZ/(log Z)^3).
```

The anchor partition is asserted to satisfy

```text
Z_B=sum_y A_B(y)=O(Z log Z).
```

The general weighted theorem therefore gives

```text
E_fib
 <=Z_B(exp(Delta)-1)
 =o(1/sigma_E).
```

The use of `A_B(y)` before summing fibres is structural and is now supplied by
the general theorem.  The numerical row-distance and anchor-partition estimates
remain E306 providers.

## 5. Shift-uniform row separation

For `r in P\B`, the phase difference between two row residues is represented by

```text
(d q^(-1) mod r)/r,  q in B.
```

The frozen provider claims the multiplicity-sensitive packing bound

```text
D_r
 =min_(d!=0 mod r)sum_(q in B)||d q^(-1)/r||^2
 >>Z/(log Z)^3.
```

For fixed `r|b`, the elementary target row gives

```text
D_r>=|B|/r^2>>_b Z/log Z.
```

Together with the Bernoulli kernel bound, these provide shift-uniform decoder
errors.  The general theorem does not depend on their arithmetic proof.

## 6. Anchor partition provider

The top anchor energy is

```text
Q_B(y)=sum_(q<q' in B)||phi_(q,q')(y)||^2,
sigma_B^2=sum_(q<q' in B)1/(q^2q'^2).
```

The frozen source divides anchors into:

1. a cold coherent sector below
   ```text
   F_B=c_w Z/(log Z)^3;
   ```
2. an energetic sector above `F_B`.

The claimed providers are:

- exact integer labeling in the cold sector;
- exact quadratic energy
  ```text
  Q_B=m^2 sigma_B^2;
  ```
- a fingerprint level-set bound above the floor;
- the resulting weighted partition
  ```text
  Z_B=O(1/sigma_B)=O(Z log Z).
  ```

These are P1 providers.  Their correctness is not proved by the abstract
transference theorem.

## 7. Decoder identification and coherent labels

For a cold anchor with integer label `m`, the frozen route claims uniform
identification

```text
d_r(y)=m mod r
```

for all prime rows in a stated decoder range, and similarly for the target
coordinates dividing `b` in the range where those rows are needed.

This supplies P3.  Uniformity over the entire moving label range is essential;
the general failure-mode ledger shows that pointwise identification would not
suffice.

The coherent anchor label set is then partitioned into the following skeleton
lanes:

1. major labels `|m|<=C/sigma_E`;
2. Gaussian labels up to `X^2/4`;
3. adaptive complete-pair labels up to
   ```text
   M_dec=XZ/(log Z)^2;
   ```
4. large cold top labels.

Energetic anchors and nondecoder fibres form the remaining sectors.

## 8. Actual-family major provider

The actual variance is

```text
sigma_E^2
 =theta(1-theta)sum_(e in E)1/e^2
 asymp_b1/(X^2(log X)^2).
```

The exact centering identity is

```text
theta sum_(e in E)1/e=1/b.
```

For `|m|<=C/sigma_E`, the frozen source claims a uniform Taylor expansion

```text
log F(m)
 =-2pi^2m^2sigma_E^2+o_(b,C)(1),
```

and hence

```text
Re sum_(|m|<=C/sigma_E)F(m)
 >=c_maj/sigma_E.
```

This is provider P5.

## 9. Residual skeleton damping

The retained residual factors supply P4:

### Gaussian lane

```text
sum_(C/sigma_E<|m|<=X^2/4)|F(m)|
```

is made a small fixed fraction of `1/sigma_E` by choosing `C` first.

### Adaptive complete-pair lane

The natural complete-pair factors yield exponential damping for

```text
X^2/4<|m|<=M_dec.
```

### Large cold-label lane

Top-anchor quadratic energy yields a Gaussian tail beyond `M_dec`, including
its `1/sigma_B` prefactor.

### Energetic anchors

The anchor provider gives an exponentially small energetic partition.

The key structural point is that internal lower and other unassigned factors
are retained on the skeleton.  Discarding them before label summation would
remove the adaptive damping provider.

## 10. Target observability

The hidden target group is

```text
H=product_(r|b, r prime)Z/rZ.
```

For each coordinate, the full top row supplies characters

```text
d -> d q^(-1)/r,  q in B.
```

The elementary distance

```text
D_r>=|B|/r^2
```

makes the syndrome map quantitatively observable.  Thus the special `b`-rows
are an application of the general target-observability provider.

Squarefreeness is also the exact arithmetic boundary: sums of
squarefree-denominator atoms cannot have a nonsquarefree reduced denominator.

## 11. Strict terminal budget

The frozen route chooses parameters in the order

```text
fixed problem data -> C -> X.
```

Its numerical claims are intended to prove

```text
E_fib+E_Gauss+E_adaptive+E_large+E_eng
 < c_maj/sigma_E.
```

Once those provider estimates are verified, Theorem 3.1 of
`ANCHOR-FIBRE-FOURIER-TRANSFERENCE.md` gives positive real Fourier sum, and the
no-wrap provider gives the exact representation.

## 12. What the abstraction changes

The general theorem removes three sources of possible confusion.

1. **Normalization:** fibre error is weighted by the actual decoded anchor
   partition, never by raw anchor cardinality.
2. **Provider separation:** row decoding, anchor entropy, skeleton damping,
   target observability, major positivity, and exactness are distinct.
3. **Replaceability:** a stronger analytic row-code theorem can replace the
   packing provider without changing the transference proof.

It does not prove the arithmetic providers.

## 13. Frozen provider status

At the exact source checkpoint, the following remained research-level and not
independently reviewed:

- one-block exact-cold rigidity;
- fingerprint entropy with the required uniformity;
- multiplicity-sensitive cyclic packing constants;
- full endpoint and quantifier assembly.

Therefore the honest application classification is

```text
GENERAL TRANSFERENCE IMPLICATION — PROVED
E306 PROVIDER MAP — COMPLETE
E306 ONE-ANCHOR COROLLARY — CONDITIONAL ON FROZEN PROVIDERS
NO RELEASED OR ASSURED STATUS CHANGE.
```
