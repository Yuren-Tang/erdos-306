# Erdős 307: core-30 support 70 and minimal-layer sign crossing

**Programme:** `E306-RL-ADJ-18`  
**Status:** `SUPPORT LOWER BOUND / EXACT FINITE CERTIFICATE / STRUCTURAL FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The core-30 residual port characterizes an E307 cycle with one side `30r` by

```text
30Y-31D(Y)=900,
```

together with primality of `(Y-30)/31`.

This note proves that the opposite side `Y` must contain at least `66` distinct prime factors.
Since `30r` contains four distinct prime factors, every E307 cycle in the core-30 ansatz has at
least `70` prime factors in total.

The explicit positive-defect Giuga-core relay constructed in `E306-RL-ADJ-15` has exactly `66`
prime factors on its middle side.  It therefore reaches the smallest support layer on which a
core-30 exact cycle can possibly occur, but lies on the positive-return side of the residual-900
surface.

## 2. General prime-exclusion lemma for Giuga-core ports

Let `C` be squarefree with

```text
D(C)=C+1,
```

and suppose squarefree `Y`, coprime to `C`, satisfies the residual-square equation

```text
CY-(C+1)D(Y)=C^2.                                  (2.1)
```

### Lemma 2.1 — primes of the opposite side avoid `C(C+1)`

```text
gcd(Y,C(C+1))=1.                                   (2.2)
```

#### Proof

Coprimality with `C` is part of the two-cycle setup.  Suppose a prime `ell` divides both `Y` and
`C+1`.  Reducing `(2.1)` modulo `ell`, both terms on the left vanish:

```text
CY congruent 0 mod ell,
(C+1)D(Y) congruent 0 mod ell.
```

But `ell` does not divide `C`, so `C^2` is nonzero modulo `ell`, a contradiction. `square`

### Corollary 2.2 — core-30 exclusions

For `C=30`, every prime divisor of `Y` avoids

```text
2,3,5,31.                                          (2.3)
```

The exclusion of `31` is not merely disjointness from the core; it is forced by the residual
port equation.

## 3. Exact reciprocal mass

Dividing

```text
30Y-31D(Y)=900
```

by `31Y` gives

```text
D(Y)/Y
 =sum_(q|Y)1/q
 =30/31-900/(31Y).                                 (3.1)
```

Let

```text
a_1<a_2<...
```

be the increasing sequence of primes different from `2,3,5,31`, and put

```text
S_k=sum_(i=1)^k 1/a_i,
P_k=product_(i=1)^k a_i.                           (3.2)
```

If `omega(Y)=k`, then

```text
sum_(q|Y)1/q <=S_k,
Y>=P_k.                                             (3.3)
```

Hence `(3.1)` implies the necessary inequality

```text
S_k
 >=30/31-900/(31P_k).                              (3.4)
```

Equivalently, with

```text
F_k=30/31-S_k-900/(31P_k),                         (3.5)
```

any admissible support size must satisfy

```text
F_k<=0.                                             (3.6)
```

## 4. Exact finite exclusion through support 64

### Theorem 4.1

For every integer

```text
2<=k<=64,
```

one has

```text
F_k>0.                                              (4.1)
```

Therefore no core-30 E307 opposite side has between `2` and `64` prime factors.

#### Exact certificate

The values were evaluated as exact rational numbers.  The minimum over `2<=k<=64` occurs at
`k=64`, where `a_64=337` and

```text
F_64
 =120021433534447303462947697148130042711646203751162053175852498712841045811610431539468217464229025223206988090732716072004562839112
  /71990153187008490713858235017779212275359941332984007431647864547281399494013276913890906146814228255090377117066819958633465472881793
 >0.
```

Numerically,

```text
F_64
 =0.00166719236202579227899171078313136824387032510071226719068...
```

An exact Wolfram-language computation confirmed

```text
F_k>0 for every 2<=k<=64.
```

The case `k=1` is excluded separately because the arithmetic derivative of a prime is `1`, whereas
an E307 core-30 cycle requires

```text
D(Y)=30r>1.
```

This proves exclusion for every `1<=k<=64`. `square`

### Threshold location

At `k=65`, with `a_65=347`, the certificate changes sign:

```text
F_65
 =-0.0012146520183776659342647733667245395371095019886249086463...
```

Thus reciprocal mass alone no longer excludes support `65`.  The final step to `66` comes from
parity, not from misplacing the reciprocal threshold.

## 5. Parity forces even support

### Lemma 5.1

In a core-30 cycle,

```text
omega(Y) is even.                                   (5.1)
```

#### Proof

By Corollary 2.2, `Y` is odd.  If `Y` is a product of `k` odd primes, then

```text
D(Y)=sum_(q|Y)Y/q
```

is a sum of `k` odd integers.  Hence

```text
D(Y) congruent k mod 2.
```

But in the core-30 cycle

```text
D(Y)=30r
```

is even.  Therefore `k` is even. `square`

## 6. Support lower bound

### Theorem 6.1 — core-30 opposite-side support

Every core-30 E307 cycle satisfies

```text
omega(Y)>=66.                                       (6.1)
```

#### Proof

Theorem 4.1 and the `k=1` observation exclude `k<=64`.  The next possible size `65` is odd and is
excluded by Lemma 5.1.  Hence `k>=66`. `square`

### Corollary 6.2 — total support

The other side is

```text
30r=2*3*5*r,
```

with four distinct prime factors.  Since the two sides are coprime,

```text
omega(Y)+omega(30r)>=66+4=70.                      (6.2)
```

Thus every E307 cycle in the core-30 ansatz has at least `70` prime factors in total.

This is stronger than the general support lower bound because it exploits the fixed Giuga core,
the exclusion of `31`, and parity on the opposite side.

## 7. The relay reaches the minimal support layer

The explicit positive-return relay from `E306-RL-ADJ-15` has

```text
Y=Qt,
```

where `Q` is the product of `65` distinct primes and `t` is one additional prime, disjoint from
`Q`.  Hence

```text
omega(Y)=66.                                        (7.1)
```

It also satisfies

```text
D(Y)<Y<D^2(Y),
```

or equivalently

```text
30Y-31D(Y)<900.                                     (7.2)
```

Therefore the relay lies on the positive-defect side of the residual-900 surface at exactly the
smallest support size permitted for an exact core-30 cycle.

### Structural consequence

The support barrier is no longer a reason to expect nonexistence.  The sign-crossing construction
already reaches the first admissible support stratum.  The remaining difficulty is exact residual
arithmetic:

```text
move within the 66-prime stratum from residual <900 to residual =900,
while preserving squarefreeness and the prime output (Y-30)/31.
```

This is substantially sharper than searching arbitrary prime sets of size at least `60`.

## 8. General support-screening template

For any quotient-one Giuga core `C`, let

```text
b_1<b_2<...
```

be the primes not dividing `C(C+1)`.  If a core-`C` E307 opposite side has `k` prime factors, then

```text
sum_(i=1)^k 1/b_i
 >=C/(C+1)-C^2/((C+1) product_(i=1)^k b_i).         (8.1)
```

This gives an exact finite support-screening algorithm for every residual-square port

```text
(C,C+1,C^2).
```

Additional valuation or parity information may raise the resulting lower bound.  The core-30
case is the first fully evaluated example.

## 9. Corrected research priority

The highest-value bounded construction problem is now:

```text
CORE-30 MINIMAL SUPPORT PROBLEM

Find 66 distinct primes, all avoiding 2,3,5,31, whose product Y satisfies

  30Y-31D(Y)=900

and for which

  (Y-30)/31

is prime.
```

Useful mechanisms include:

1. residual-900 port trees with exactly `66` terminal prime factors;
2. perturbations of the explicit 66-prime positive-defect relay;
3. one-prime and two-prime terminal closure formulae;
4. meet-in-the-middle reciprocal-deficit and CRT indexing;
5. residual-port pencils generated by squarefree block libraries.

Natural-prefix and local-swap searches are diagnostics only and have no exclusion force.

## 10. Classification

```text
PRIME EXCLUSION FROM C(C+1) — PROVED
CORE-30 SUPPORT 1..64 — EXCLUDED BY EXACT CERTIFICATE
CORE-30 OPPOSITE-SIDE PARITY — EVEN
CORE-30 OPPOSITE-SIDE SUPPORT >=66 — PROVED
CORE-30 TOTAL SUPPORT >=70 — PROVED
EXPLICIT POSITIVE-DEFECT RELAY AT SUPPORT 66 — PROVED
EXACT RESIDUAL-900 FILLING AT SUPPORT 66 — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed by this research note.