# E306-PD-OA1-01 — one-anchor proof architecture

**State:** complete bounded proof-development packet  
**Controlling proof:** `proof-development/ONE-ANCHOR-HUMAN-PROOF.md`  
**Route decision:** `proof-development/ONE-ANCHOR-ROUTE-COMPARISON.md`

## 1. Headline theorem and avoiding form

A squarefree semiprime is a product of two distinct primes.

> **Headline theorem.** Let `q=a/b>0` be in lowest terms.  Then `q` is a finite sum of reciprocals of distinct squarefree semiprimes if and only if `b` is squarefree.

The constructive part is reduced to the following avoiding statement.

> **Avoiding unit theorem.** For every squarefree `b>=3` and every finite set `T` of positive integers, there is a finite set `A` of pairwise distinct squarefree semiprimes, disjoint from `T`, such that
> 
> ```text
> sum_(e in A) 1/e = 1/b.
> ```

Numerator induction, together with the identities

```text
1/2 = 1/3 + 1/6,
1   = 1/2 + 1/3 + 1/6,
```

then proves all squarefree denominators.

## 2. Denominator geometry

Fix `b`, `T`, and a large scale `X`; put `Z=X^3`.  Define

```text
P   = {p prime : X <= p < Z},
B   = {q prime : Z/2 <= q < Z},
S_b = {r prime : r|b}.
```

The denominator family is

```text
E_pair = {pq : p,q in P, p<q},
E_b    = {rq : r in S_b, q in B},
E       = E_pair disjoint-union E_b.
```

The period is

```text
L = b * product_(p in P) p.
```

For large `X`, the support of `b` is disjoint from `P`, so `L` is squarefree.  The coordinate map

```text
h mod L
  <-> ((h mod p)_(p in P), (h mod r)_(r in S_b))
```

is therefore a bijection.  This exact product decomposition is the reason no hidden fibre multiplicity or sibling sector remains.

## 3. Prime-number input and load

The sole external theorem is the prime number theorem.  Tail-uniform forms and Abel summation give:

1. `# {p prime:y<=p<cy} asymp_c y/log y` uniformly for the fixed ratios used below;
2. `sum_(X<=p<X^3) 1/p = log 3+o(1)`;
3. `sum_(X<=p<X^3) 1/p^2 = O(1/(X log X))`;
4. `sum_(Z/2<=q<Z) 1/q = O(1/log Z)`;
5. `sum_(Z/2<=q<Z) 1/q^2 = O(1/(Z log Z))`.

Consequently

```text
Lambda_pair -> (log 3)^2/2,
Lambda_b     = O_b(1/log Z),
Lambda       = sum_(e in E)1/e in (lambda_-,lambda_+) subset (1/3,1)
```

for fixed margins and large `X`.  Put

```text
theta = 1/(b Lambda).
```

Then `theta` lies in a compact interval `I_b subset (0,1)`,

```text
theta * sum_(e in E)1/e = 1/b,
Lambda < 1.
```

The inverse-square mass satisfies

```text
sum_(e in E)1/e^2 asymp 1/(X^2 log^2 X),
```

and the full-top auxiliary contribution is lower order.

## 4. Exact Fourier interface

For `h mod L`, write

```text
phi_e(h) = (1-theta) + theta exp(2 pi i h/e),
F(h)     = exp(-2 pi i h/b) * product_(e in E) phi_e(h).
```

Weighted character orthogonality gives

```text
L W = sum_(h mod L) F(h),
```

where `W` is the total Bernoulli weight of subsets satisfying the target congruence.  Compactness of `theta` gives a constant `kappa_b>0` such that

```text
|phi_e(h)| <= exp(-kappa_b ||h/e||^2).
```

Define

```text
sigma_E^2 = theta(1-theta) sum_(e in E)1/e^2
          asymp 1/(X^2 log^2 X).
```

The proof is complete once a positive real major sum of order `1/sigma_E` exceeds the absolute sum of all remaining frequencies.

## 5. Repaired one-block theorem

For a dense prime block `Q subset [Y,2Y)` define the complete internal centred-CRT energy

```text
Q_Q(a) = sum_(p<q in Q) (H_pq(a)/(pq))^2.
```

The standalone one-block package consists of:

1. reciprocal dispersion for at least sixteen sensors;
2. repaired cross-label energy, with the substantial class explicitly at least sixteen;
3. nondominant forcing, including the separate zero-energy case and the corrected cross-class sum;
4. exact zero-exception labelling below
   ```text
   c_w Y/log^3 Y;
   ```
5. fingerprint entropy
   ```text
   # {a:Q_Q(a)<=R} <= exp(epsilon R)
   ```
   uniformly for `R` above the forcing floor.

This package is reproved in the human proof and not imported as authority.

## 6. Top anchor

Apply the one-block theorem to

```text
B subset [Z/2,Z).
```

Let

```text
Q_B(a_B) = sum_(q<q' in B)(H_qq'(a_B)/(qq'))^2,
sigma_B0^2 = sum_(q<q' in B)1/(q^2 q'^2)
asymp 1/(Z^2 log^2 Z).
```

There is a forcing floor

```text
F_B >> Z/log^3 Z.
```

Below `F_B`, the top assignment has a unique exact integer label `m`, and

```text
Q_B(a_B)=m^2 sigma_B0^2.
```

Above `F_B`, fingerprint entropy is dominated by the Fourier exponential.  Hence

```text
sum_(a_B) exp(-kappa_b Q_B(a_B)) = O(Z log Z),
```

and the noncoherent part is exponentially small.

## 7. Row kernels and cyclic distance

Put

```text
R = (P\B) union S_b.
```

For a fixed top assignment and a row `r in R`, all denominators `rq`, `q in B`, form one row kernel.  Changing the row residue by `d!=0 mod r` changes the `q`-phase by

```text
(d q^{-1} mod r)/r.
```

For `r in P\B`, the maximum multiplicity of one inverse residue is at most

```text
mu_r <= Z/(2r)+1.
```

A multiplicity-sensitive cyclic-energy lemma yields

```text
D_r := min_(d!=0) sum_(q in B)||d q^{-1}/r||^2
     >> Z/log^3 Z
```

uniformly for `X<=r<Z/2`.

For fixed `r|b`, each summand is at least `1/r^2`, so

```text
D_r >= |B|/r^2 >>_b Z/log Z.
```

If `x_r^*` minimizes the row phase energy, the sum of all other row products is

```text
delta_r <= r exp(-c_b D_r).
```

Thus

```text
Delta=sum_(r in R)delta_r
     <= Z^2 exp(-c Z/log^3 Z).
```

## 8. Retained-skeleton inequality

After removing the internal-top factors, assign every top-cross denominator `rq` to the unique row `r`.  Leave every lower-lower complete-pair factor unassigned.

For row kernels `A_r(x_r)` and the modulus `G(x_R)` of all unused factors,

```text
0<=G<=1,
sum_(x_r != x_r^*) A_r(x_r) <= delta_r.
```

Then

```text
sum_(x_R) product_r A_r(x_r) G(x_R)
 <= product_r A_r(x_r^*) G(x^*)
    + product_r(A_r(x_r^*)+delta_r)
    - product_r A_r(x_r^*).
```

The error is at most `exp(Delta)-1`.  After multiplication by the top factor and summation over all top assignments, it is

```text
O(Z log Z * Delta)=o(1).
```

Every denominator appears exactly once: internal-top factors in the top partition, top-cross factors in row kernels, and lower-lower factors in the retained skeleton.

## 9. Decoder identification

For a coherent top label `m`, the candidate lower residue `m mod r` has row energy

```text
E_r(m) <= (m^2/r^2) sum_(q in B)1/q^2.
```

Set

```text
M_dec = X Z/(log Z)^2.
```

Uniformly for every `r in P\B` and `|m|<=M_dec`, this candidate energy is `o(D_r)`, so the unique decoder is `m mod r`.

For each fixed `r|b`, the same conclusion holds throughout `|m|<=X^2/4`.  Since `b` is squarefree, agreement modulo every prime divisor of `b` is agreement modulo `b`.  Therefore the decoded skeleton is the genuine integer frequency for `|m|<=X^2/4`.

## 10. Five-sector decomposition

Choose

```text
N=floor(C/sigma_E).
```

For large `X`, `N<X^2/4<M_dec`.  Every frequency belongs to exactly one sector.

### Sector I — genuine major frequencies

```text
|m|<=N.
```

All coordinates decode to `m`; the actual frequency is `h=m mod L`.  Uniform Taylor expansion and exact cancellation of the linear term give

```text
Re sum_(|m|<=N)F(m) >= c_maj/sigma_E.
```

### Sector II — full-variance Gaussian tail

```text
N<|m|<=X^2/4.
```

The frequency is still exactly `m`, every phase is in the small disk, and

```text
|F(m)|<=exp(-c m^2 sigma_E^2).
```

Choosing `C` large makes this a small fixed fraction of the major term.

### Sector III — adaptive complete-pair damping

```text
X^2/4<|m|<=M_dec.
```

All coordinates in `P` decode to `m`; the coordinates of `b` need not.  The interval

```text
I_m=[2 sqrt(|m|),3 sqrt(|m|)]
```

lies in `P\B`, contains `>>sqrt(|m|)/log|m|` primes, and every pair from it has circle distance at least `1/9`.  Hence

```text
Q_pair(m)>>|m|/(log|m|)^2.
```

### Sector IV — top-label tail

For coherent top labels with

```text
|m|>M_dec,
```

the internal-top factor alone gives a Gaussian tail with exponent

```text
M_dec^2 sigma_B0^2 >> X^2/log^6 Z.
```

### Sector V — noncoherent top assignments and nondecoder fibres

The high top assignments contribute `exp(-cF_B)`.  All row-fibre errors together contribute `O(Z log Z Delta)`.

The five sectors are disjoint by construction and exhaustive because the coordinate map modulo `L` is a bijection and the top partition is exact.

## 11. Terminal order

All structural constants are fixed before the terminal choice.  The only terminal order is

```text
C -> X.
```

1. Choose `C` so that Sector II is below a prescribed fraction of `c_maj/sigma_E`.
2. Choose `X` above all remaining thresholds.  Sectors III–V and the fibre error are then `o(1/sigma_E)`.

The complete Fourier sum has positive real part, so `W>0`.  No-wrap converts the target congruence to exact equality.  Avoidance and the elementary reductions finish the theorem.

## 12. Dependency graph

```text
PNT
 ├─ prime counts on fixed-ratio intervals
 ├─ complete-pair reciprocal load
 ├─ reciprocal-square bounds
 └─ top-block load and size
      │
      ├─ compact theta interval and no-wrap
      ├─ sigma_E and sigma_B estimates
      └─ adaptive interval prime supply

one-block arithmetic
 ├─ dispersion
 ├─ repaired nondominant forcing
 ├─ zero-exception theorem
 └─ fingerprint entropy
      │
      └─ top partition

cyclic row geometry
 ├─ uniform lower-row distance
 ├─ fixed b-row distance
 ├─ product-fibre compression
 └─ decoder identification
      │
      └─ retained decoded skeleton

finite Fourier identity
 ├─ Taylor major
 ├─ Gaussian tail
 ├─ adaptive pair damping
 ├─ top-label tail
 └─ noncoherent/fibre error
      │
      └─ positivity
           └─ no-wrap exact equality
                └─ avoiding theorem
                     └─ headline theorem.
```

No node depends on the old global level-set theorem, a Lean declaration, a previous manuscript, or a numerical certificate.