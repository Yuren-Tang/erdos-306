# Erdős 307: real--modular port geometry and the deficit determinant

**Programme:** `E306-RL-ADJ-08`  
**Status:** `GENERAL DEFICIT IDENTITY / REAL-MODULAR UNIFICATION / PROVED`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The semiprime port congruence pairs two future primes by

```text
r congruent xD(y)p(Delta p-xD(y))^(-1) mod y^2.
```

This note proves that the same fractional-linear expression is also the exact real boundary
between extendible and overfilled prefixes.  It further gives a determinant identity which
combines one-sided and two-sided filler deficits for arbitrary positive fillers.

Thus three previously separate objects become one:

```text
reciprocal-product monotonicity,
square-modulus integral transfer,
transferred derivative height.
```

## 2. Deficits for arbitrary fillers

Fix coprime squarefree prefixes `x,y>1` and write

```text
a=D(x),
b=D(y),
Delta=xy-ab>0.
```

For positive fillers `A,B`, define

```text
L(A)=xAy-D(xA)b,
R(B)=xyB-aD(yB),
H(A,B)=xAyB-D(xA)D(yB).
```

Using the product rule,

```text
L(A)=A Delta-xbD(A),                         (2.1)
R(B)=B Delta-ayD(B),                         (2.2)
```

and

```text
H(A,B)
 =AB Delta-ay A D(B)-xbD(A)B-xyD(A)D(B).    (2.3)
```

The normalized quantity

```text
H(A,B)/(xAyB)
```

is exactly one minus the reciprocal-product invariant of the enlarged prefix pair.

## 3. Deficit determinant identity

### Theorem 3.1

For all positive integers `A,B`,

```text
L(A)R(B)
 =Delta H(A,B)+x^2y^2D(A)D(B).               (3.1)
```

### Proof

Expand the left side using `(2.1)--(2.2)`:

```text
(A Delta-xbD(A))(B Delta-ayD(B)).
```

Subtract `Delta H(A,B)`.  Every term cancels except

```text
xyD(A)D(B)(ab+Delta).
```

Since `ab+Delta=xy`, the remainder is

```text
x^2y^2D(A)D(B).
```

A Wolfram symbolic expansion independently returned zero for the difference between the two
sides.  `square`

### Normalized form

When `D(A)D(B)>0`, `(3.1)` becomes

```text
{L(A)/(xyD(A))}{R(B)/(xyD(B))}
 =1+Delta H(A,B)/(x^2y^2D(A)D(B)).           (3.2)
```

Hence, for `Delta>0`, a positive two-sided remaining deficit is equivalent to the product of
the two normalized one-sided deficits being greater than one.

## 4. One-sided positivity is necessary for every completion

### Proposition 4.1

Suppose `(A,B)` is a nontrivial filler pair which completes `(x,y)` to an E307 cycle.  Then

```text
L(A)>0,
R(B)>0.                                      (4.1)
```

### Proof

Write

```text
alpha=D(x)/x,
beta=D(y)/y,
alpha_A=D(A)/A,
beta_B=D(B)/B.
```

Completion gives

```text
(alpha+alpha_A)(beta+beta_B)=1.
```

Since `beta<beta+beta_B`,

```text
(alpha+alpha_A)beta<1,
```

which is exactly `L(A)>0` after clearing denominators.  The second inequality is symmetric.
`square`

### Corollary 4.2 — future-prime thresholds

Every individual future left prime `p` in a completion satisfies

```text
p>xb/Delta.                                  (4.2)
```

Every individual future right prime `q` satisfies

```text
q>ay/Delta.                                  (4.3)
```

Indeed,

```text
L(p)=p Delta-xb,
R(q)=q Delta-ay.
```

These are exact branch-and-bound thresholds, not heuristic size estimates.

## 5. The real port involution

Put

```text
c=xb=xD(y)
```

and define, for real `t>c/Delta`,

```text
f_y(t)=ct/(Delta t-c).                       (5.1)
```

### Theorem 5.1

The map `f_y` is a decreasing involution of the interval

```text
(c/Delta,infinity)
```

onto itself.  It satisfies

```text
f_y(f_y(t))=t,                               (5.2)
f_y'(t)=-c^2/(Delta t-c)^2<0,                (5.3)
```

and has the unique fixed point

```text
t_*=2c/Delta.                                (5.4)
```

### Proof

Direct substitution gives `(5.2)`.  Differentiation gives `(5.3)`.  Solving

```text
t=ct/(Delta t-c)
```

for positive `t` gives `(5.4)`.  The limits at the endpoints are

```text
f_y(t)->infinity as t downarrow c/Delta,
f_y(t)->c/Delta as t->infinity.
```

`square`

## 6. The same map controls positivity, congruence, and height

Let `p,r` be two new left primes.  Their one-sided deficit is

```text
L(pr)=Delta pr-c(p+r).                       (6.1)
```

Since

```text
L(pr)=(Delta p-c){r-f_y(p)},                 (6.2)
```

and `p>c/Delta`, one has:

### Theorem 6.1 — real port boundary

```text
L(pr)>0
 if and only if
r>f_y(p).                                    (6.3)
```

The boundary `r=f_y(p)` is symmetric because `f_y` is an involution.

If the semiprime jet transfer is integral, then

```text
L(pr)=y^2V,
```

where `V=D(B)=q+s` is the transferred right-prime sum.  Hence

```text
r-f_y(p)
 =y^2V/(Delta p-c).                          (6.4)
```

At the same time, modulo `y^2`, integral transfer gives

```text
r congruent f_y(p) mod y^2.                  (6.5)
```

Thus one and the same Möbius function has three roles:

1. **real boundary:** the next prime must lie above it;
2. **modular pairing:** the next prime lies in its residue class modulo `y^2`;
3. **height coordinate:** the real displacement from the boundary records `D(B)`.

This is the central real--modular coincidence.

## 7. Cross-seed deficit composition

Take prime seeds `p` on the left and `s` on the right.  Define

```text
Omega=H(p,s)
      =Delta ps-ayp-xbs-xy.                  (7.1)
```

This is the updated deficit of the prefix pair `(xp,ys)`.

The general determinant identity gives:

### Corollary 7.1

```text
(Delta p-xb)(Delta s-ay)
 =Delta Omega+x^2y^2.                        (7.2)
```

Consequently,

```text
Omega>0
 if and only if
(Delta p-xb)(Delta s-ay)>x^2y^2.             (7.3)
```

The unique terminal primes after the seeds have denominator `Omega`; therefore `(7.2)`
expresses terminal solvability as a hyperbolic product condition on the two one-sided seed
deficits.

## 8. Geometric interpretation

For fixed prefixes:

```text
p=c/Delta
```

is the first one-sided pole.  The curve

```text
r=f_y(p)
```

is the zero-deficit hyperbola for two left additions.  The region above it consists of
prefixes which have not yet crossed reciprocal product one.

Integral transfer does not select arbitrary lattice points above the curve.  It selects
vertical arithmetic progressions whose base residue is the point on the curve itself:

```text
r=f_y(p) + y^2 * positive height /(Delta p-c).
```

This is a mixed Archimedean/non-Archimedean port geometry.

## 9. Search consequences

A constructive search can now prune in the following order.

1. Reject every prime below the one-sided threshold `xb/Delta` or `ay/Delta`.
2. For a chosen `p`, compute the real boundary and modular class from the same `f_y(p)`.
3. Search only primes `r` above the boundary and in that class modulo `y^2`.
4. Read the transferred derivative sum directly from `(6.4)`.
5. Test whether the transferred quadratic polynomial splits into two primes.
6. For cross-side seeding, reject pairs failing the product condition `(7.3)` before applying
   terminal formulas.

This combines monotone pruning, CRT pruning, and derivative-size bookkeeping without separate
parameters.

## 10. Classification

```text
GENERAL DEFICIT DETERMINANT IDENTITY — PROVED
ONE-SIDED POSITIVITY FOR COMPLETABLE FILLERS — PROVED
EXACT FUTURE-PRIME THRESHOLDS — PROVED
REAL MOBIUS INVOLUTION — PROVED
REAL BOUNDARY / MODULAR CLASS / HEIGHT COINCIDENCE — PROVED
CROSS-SEED HYPERBOLIC DEFICIT LAW — PROVED
GLOBAL SEMIPRIME RETURN — OPEN FRONTIER
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, journal, submission, or
canonical status changes through this checkpoint.
