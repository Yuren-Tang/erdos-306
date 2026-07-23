# Erdős 307: general Giuga-core residual-square ports

**Programme:** `E306-RL-ADJ-17`  
**Status:** `GENERAL MECHANISM / FIXED-PORT FAMILY / CONSTRUCTION FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The core-30 E307 reduction is not an isolated numerical identity.  It is the first member of a
family indexed by quotient-one Giuga cores.

Let `C` be squarefree and satisfy

```text
D(C)=C+1.                                           (1.1)
```

The classical Giuga literature characterizes Giuga numbers more generally by equations
`D(C)=aC+1`; the present note uses the quotient-one case `(1.1)`, which includes all cores used
here.

For every such `C`, an E307 cycle with one side `Cr`, where `r` is prime, is equivalent to one
fixed scalar port:

```text
CY-(C+1)D(Y)=C^2.
```

## 2. Exact residual-square characterization

Let `Y` be squarefree and coprime to `C`.  Define

```text
Psi_C(Y)=CY-(C+1)D(Y).                              (2.1)
```

### Theorem 2.1 — Giuga-core cycle equivalence

The following are equivalent.

1. There is a prime `r`, coprime to `CY`, such that
   ```text
   D(Y)=Cr,
   D(Cr)=Y.
   ```
2. One has
   ```text
   Psi_C(Y)=C^2,                                    (2.2)
   ```
   and
   ```text
   r=(Y-C)/(C+1)                                    (2.3)
   ```
   is a prime coprime to `CY`.

#### Proof

If `D(Y)=Cr`, then by `(1.1)` and the product rule,

```text
D(Cr)=(C+1)r+C.
```

Thus a cycle gives

```text
Y=(C+1)r+C.
```

Consequently

```text
CY-(C+1)D(Y)
 =C{(C+1)r+C}-(C+1)Cr
 =C^2.
```

Conversely, assume `(2.2)`.  Reducing modulo `C+1` and using

```text
C congruent -1 mod C+1,
C^2 congruent 1 mod C+1,
```

one obtains

```text
-Y congruent 1 mod C+1,
```

or

```text
Y congruent C mod C+1.
```

Hence `r=(Y-C)/(C+1)` is an integer.  Equation `(2.2)` becomes

```text
(C+1)D(Y)=C(Y-C)=C(C+1)r,
```

so `D(Y)=Cr`.  If `r` is prime, then

```text
D(Cr)=(C+1)r+C=Y.
```

This proves the equivalence. `square`

## 3. General defect identity

Suppose only that

```text
D(Y)=Cr
```

for a prime `r`.  Then

```text
D^2(Y)=D(Cr)=(C+1)r+C.
```

### Theorem 3.1 — residual-square defect law

```text
C{D^2(Y)-Y}=C^2-Psi_C(Y).                          (3.1)
```

#### Proof

Since `(C+1)D(Y)=C(C+1)r`,

```text
C D^2(Y)
 =C{(C+1)r+C}
 =(C+1)D(Y)+C^2.
```

Subtract `CY`. `square`

### Sign dictionary

```text
Psi_C(Y)>C^2  <=> D^2(Y)<Y;
Psi_C(Y)=C^2  <=> D^2(Y)=Y;
Psi_C(Y)<C^2  <=> D^2(Y)>Y.                        (3.2)
```

Thus the exact E307 target is the zero level of a scalar port residual.

## 4. Fixed port data

For the general port operator

```text
Psi_(c,R)(B)=cB-RD(B),
```

the Giuga-core subproblem is

```text
(c,R,target)=(C,C+1,C^2).                          (4.1)
```

Hence every quotient-one Giuga core supplies a complete residual-port programme.

## 5. Partial block and terminal-prime formula

Let `Q` be squarefree and coprime to `C`.  Put

```text
A=D(Q),
c_Q=CQ-(C+1)A,
R_Q=(C+1)Q.                                        (5.1)
```

If only one final prime `t` remains, then

```text
c_Q t-R_Q=C^2.
```

### Proposition 5.1 — unique terminal factor

```text
t={C^2+(C+1)Q}/{CQ-(C+1)D(Q)}.                    (5.2)
```

A one-prime completion exists precisely when:

1. `c_Q>0`;
2. the quotient `(5.2)` is an integer prime disjoint from `CQ`;
3. the forced core-side quotient
   ```text
   r={Qt-C}/{C+1}                                  (5.3)
   ```
   is a prime disjoint from `CQt`.

The integrality of `r` follows automatically from the residual equation.

## 6. Reciprocal threshold

Since

```text
c_Q/Q
 =C-(C+1)sum_(q|Q)1/q,
```

one has

```text
c_Q>0
 <=>sum_(q|Q)1/q<C/(C+1).                         (6.1)
```

At exact completion `Y=Qt`,

```text
sum_(q|Q)1/q+1/t
 =C/(C+1)-C^2/((C+1)Qt).                           (6.2)
```

Thus the reciprocal mass lies just below the core threshold `C/(C+1)`.

## 7. Two-prime tail

If two final primes `q,t` remain, then

```text
c_Q qt-R_Q(q+t)=C^2.
```

Hence

### Theorem 7.1 — Giuga-core divisor port

```text
(c_Q q-R_Q)(c_Q t-R_Q)
 =R_Q^2+C^2c_Q.                                    (7.1)
```

All two-prime tails are parameterized by complementary divisors of

```text
K_Q=R_Q^2+C^2c_Q.                                  (7.2)
```

The resulting factors are

```text
q=(d+R_Q)/c_Q,
t=(K_Q/d+R_Q)/c_Q,                                 (7.3)
```

subject to the corresponding residue, primality, and disjointness tests.

## 8. General Giuga-core relay

The positive-defect construction also generalizes.

Let `m,t,r` be primes and let `Q` be squarefree, all mutually disjoint from `C`, satisfying

```text
Qt=(C+1)m+C,                                       (8.1)
D(Q)t+Q=Cr.                                        (8.2)
```

Define

```text
X=Cm,
Y=Qt,
Z=Cr.
```

Then

```text
D(X)=Y,
D(Y)=Z,
D(Z)=(C+1)r+C.                                     (8.3)
```

If

```text
sum_(q|Q)1/q>C/(C+1),                              (8.4)
```

then the final derivative overshoots:

```text
D(Z)>Y.
```

Indeed, `Z/Y` exceeds `C/(C+1)` while `D(Z)/Z` exceeds `(C+1)/C`.

The core-30 counterexample is the case `C=30`.

## 9. Core portfolio

Different quotient-one Giuga cores produce different fixed ports:

```text
C=30:
  (c,R,target)=(30,31,900);

C=858:
  (c,R,target)=(858,859,858^2);

C=1722:
  (c,R,target)=(1722,1723,1722^2);

etc.
```

The tradeoffs are:

1. the reciprocal threshold `C/(C+1)` moves closer to `1` as `C` grows;
2. the core already contributes more prime factors and stronger local congruences;
3. the target residual `C^2` grows;
4. terminal divisibility and prime-output arithmetic change substantially;
5. known Giuga factor sets may provide reusable partial port structure.

There is no reason a priori that the smallest core is the easiest exact-zero core.

## 10. Research programme

The next construction programme should compare cores rather than commit exclusively to `C=30`.

For each usable quotient-one Giuga core `C`:

1. build the port tree for `(C,C+1,C^2)`;
2. test one-prime and two-prime terminal closures;
3. intersect the fixed port with residual-one and residual-`C^2` block pencils;
4. measure the reciprocal-support cost near `C/(C+1)`;
5. test primality of `(Y-C)/(C+1)`;
6. compare local obstructions and divisor-port factorization profiles.

The objective is exact zero defect, not sign control alone.

## 11. Classification

```text
GIUGA-CORE CYCLE <=> RESIDUAL-SQUARE PORT — PROVED
GENERAL DEFECT / RESIDUAL IDENTITY — PROVED
GENERAL TERMINAL-PRIME FORMULA — PROVED
GENERAL TWO-PRIME DIVISOR PORT — PROVED
GENERAL POSITIVE-DEFECT RELAY — PROVED
EXACT FILLING FOR ANY GIUGA CORE — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

The arithmetic-derivative characterization of Giuga numbers is prior work and must be attributed
to the Giuga literature.  The residual-square E307 organization is research-only and has not
received an independent novelty audit.

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed by this note.