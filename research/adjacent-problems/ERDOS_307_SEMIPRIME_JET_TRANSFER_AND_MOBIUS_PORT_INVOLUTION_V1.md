# Erdős 307: semiprime jet transfer and Möbius port involution

**Programme:** `E306-RL-ADJ-06`  
**Status:** `GENERAL JET-TRANSFER THEOREM / LOCAL PORT INVOLUTION / GLOBAL DISCRIMINANT FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

Erdős Problem 307 is equivalent to finding coprime squarefree integers `X,Y>1`
with

```text
D(X)=Y,
D(Y)=X,
```

where `D` is the arithmetic derivative.  Earlier notes established a bilateral defect
semigroup and a unique one-prime-per-side terminal formula.

This note studies the next nontrivial terminal block: two new primes on each side.  The
main result is that the four-prime problem is governed by a rational linear map on the
first arithmetic jets

```text
J(n)=(n,D(n)),
```

followed by one quadratic discriminant test.  Integrality of the transferred jet reduces
to one congruence modulo the square of the opposite prefix, and that congruence pairs the
two filler primes by a projective Möbius involution.

Thus the completion problem separates into:

```text
LOCAL PORT GEOMETRY:
  a norm-one / PGL_2 involution modulo y^2;

GLOBAL CLOSURE:
  the transferred integral jet must lie again on the semiprime jet locus.
```

This is a structural reduction, not a solution of E307.

## 2. Prefix data and bilateral fillers

Fix coprime squarefree prefixes `x,y>1`.  Put

```text
a=D(x),
b=D(y),
Delta=xy-ab.
```

Every proper prefix of a hypothetical E307 solution has

```text
Delta>0,
```

because

```text
Delta/(xy)=1-(D(x)/x)(D(y)/y)
```

and the reciprocal-product invariant is strictly below one before the cycle closes.

Let `A,B` be coprime squarefree fillers, also coprime to `xy`.  The enlarged pair

```text
X=xA,
Y=yB
```

is a derivative two-cycle exactly when

```text
aA+xD(A)=yB,                         (2.1)
bB+yD(B)=xA.                         (2.2)
```

## 3. Rational linear transfer on arithmetic jets

Write

```text
J(A)=(A,D(A))^T,
J(B)=(B,D(B))^T.
```

### Theorem 3.1 — jet-transfer matrix

Equations `(2.1)--(2.2)` are equivalent to

```text
J(B)=T_(x,y) J(A),
```

where

```text
          [ a/y          x/y      ]
T_(x,y)= [                         ].
          [ Delta/y^2  -bx/y^2    ]
```

Explicitly,

```text
B    =(aA+xD(A))/y,                         (3.1)
D(B) =(Delta A-bxD(A))/y^2.                 (3.2)
```

### Proof

Equation `(3.1)` is `(2.1)`.  Substituting it into `(2.2)` gives

```text
D(B)
 =(xA-bB)/y
 =(xyA-b(aA+xD(A)))/y^2
 =(Delta A-bxD(A))/y^2.
```

Conversely, `(3.1)--(3.2)` immediately reconstruct `(2.1)--(2.2)`.  `square`

### Theorem 3.2 — exact reversibility

Let `T_(y,x)` be the matrix obtained by interchanging

```text
x<->y,
a<->b.
```

Then

```text
T_(y,x) T_(x,y)=I,
T_(x,y) T_(y,x)=I.
```

Moreover,

```text
det T_(x,y)=-(x/y)^2,
det T_(y,x)=-(y/x)^2.
```

### Proof

Direct multiplication uses only

```text
Delta=xy-ab.
```

The four matrix entries reduce respectively to `1,0,0,1`.  The determinant calculation is

```text
-(abx+xDelta)/y^3
 =-x(ab+Delta)/y^3
 =-x(xy)/y^3
 =-(x/y)^2.
```

A Wolfram symbolic computation independently returned both identity matrices and the two
determinants.  `square`

### Interpretation

For fixed prefixes, bilateral filling is not an arbitrary nonlinear relation between two
fillers.  Their first arithmetic jets are related by a rational linear isomorphism.

The arithmetic difficulty is that the set

```text
{(n,D(n)): n squarefree with a prescribed number of prime factors}
```

is extremely sparse inside the integer jet plane.  E307 asks for two such sparse jet loci
to meet under `T_(x,y)`.

## 4. The semiprime jet locus

Now specialize to

```text
A=pr,
B=qs,
```

where `p,r,q,s` are distinct primes outside the prefixes.  Put

```text
U=D(A)=p+r,
V=D(B)=q+s,
P=A=pr,
Q=B=qs.
```

The semiprime condition is equivalent to

```text
U^2-4P=(p-r)^2,
V^2-4Q=(q-s)^2.
```

### Theorem 4.1 — two-sum linearization

Given the two prime sums `U,V`, the products are uniquely forced:

```text
P=(xb U+y^2 V)/Delta,                       (4.1)
Q=(x^2 U+ay V)/Delta.                       (4.2)
```

Conversely,

```text
U=(yQ-aP)/x,                                (4.3)
V=(xP-bQ)/y.                                (4.4)
```

### Proof

The completion equations become the linear system

```text
aP+xU=yQ,
bQ+yV=xP.
```

Cramer's rule gives `(4.1)--(4.2)`, whose determinant is `Delta`.  Solving in the reverse
direction gives `(4.3)--(4.4)`.  `square`

### Corollary 4.2 — product-ratio wedge

Every positive semiprime completion satisfies

```text
a/y < Q/P < x/b.                            (4.5)
```

The width of this interval is

```text
x/b-a/y=Delta/(by).                         (4.6)
```

### Proof

Positivity of `U,V` in `(4.3)--(4.4)` gives the strict inequalities.  Their difference is

```text
(xy-ab)/(by)=Delta/(by).
```

Thus a small reciprocal-product deficit forces the two filler products into a very narrow
ratio wedge.

## 5. One-sided semiprime jet test

A stronger reduction chooses only the left semiprime `A=pr`.  Its jet `(P,U)` uniquely
forces the desired right jet:

```text
Q=(aP+xU)/y,                                (5.1)
V=(Delta P-bxU)/y^2.                        (5.2)
```

### Theorem 5.1 — one-side determines the other

The primes `p,r` extend the prefixes to a two-prime-per-side E307 completion if and only if:

1. the quantities `Q,V` in `(5.1)--(5.2)` are positive integers;
2. `V^2-4Q` is a nonnegative perfect square;
3. the two roots
   ```text
   (V-sqrt(V^2-4Q))/2,
   (V+sqrt(V^2-4Q))/2
   ```
   are distinct primes outside `xypr`.

When these conditions hold, the roots are the unique pair `{q,s}`.

### Proof

The jet-transfer theorem forces `(Q,V)`.  An integer pair `(Q,V)` is the product and sum of
two integers exactly when the monic polynomial

```text
t^2-Vt+Q
```

has integer roots, equivalently when its discriminant is a nonnegative square with the
correct parity.  Requiring the roots to be distinct new primes gives precisely the stated
conditions.  The reverse jet-transfer identity then verifies both derivative-cycle
equations.  `square`

### Computational sanity check

A Wolfram search used:

- all ordered disjoint prefix pairs of sizes one or two formed from the first eight primes;
- all two-prime left fillers formed from the first fifteen primes and disjoint from the
  prefixes.

There were `812` ordered prefix pairs.  No transferred integral jet landed on the positive
split semiprime locus; therefore no prime semiprime-to-semiprime transfer occurred in this
small range.

This has no exclusion force for E307.  Its value is diagnostic: the first visibly rare event
is already the second discriminant becoming a square, before primality is imposed.

## 6. Integrality collapses to one square-modulus congruence

At first sight `(5.1)` and `(5.2)` impose two divisibility conditions.  In fact only the
second is needed.

### Theorem 6.1 — integral jet-transfer criterion

For every integer filler `A`, put

```text
N(A)=Delta A-bxD(A).
```

Then the rational jet `T_(x,y)J(A)` is integral if and only if

```text
y^2 divides N(A).                            (6.1)
```

When `(6.1)` holds,

```text
D(B)=N(A)/y^2
```

and `B=(aA+xD(A))/y` is automatically an integer.

### Proof

Necessity follows from `(3.2)`.  Conversely, reduce `N(A)` modulo `y`.  Since

```text
Delta=xy-ab congruent -ab mod y,
```

one has

```text
N(A)
 congruent -abA-bxD(A)
 =-b(aA+xD(A))                              mod y.
```

For squarefree `y`,

```text
gcd(b,y)=gcd(D(y),y)=1.
```

Thus `y|N(A)` implies

```text
y divides aA+xD(A),
```

so `B` is integral.  The stronger assumption `y^2|N(A)` gives both jet coordinates.
`square`

This is the first major local compression: integral bilateral transfer is controlled by one
congruence modulo `y^2`, not two unrelated congruences.

## 7. Möbius pairing of the two filler primes

For `A=pr`, condition `(6.1)` becomes

```text
y^2 divides Delta pr-bx(p+r).                (7.1)
```

Put

```text
c=bx=xD(y).
```

Then `(7.1)` is

```text
(Delta p-c)r congruent cp                  mod y^2.   (7.2)
```

### Lemma 7.1 — no pole on an admissible prime

If a new prime `p` occurs in a solution of `(7.2)`, then

```text
gcd(Delta p-c,y)=1.
```

### Proof

Suppose a prime `ell|y` also divides `Delta p-c`.  The right side `cp` of `(7.2)` is nonzero
modulo `ell`, because

```text
gcd(xb p,y)=1.
```

The left side is zero modulo `ell`, a contradiction.  `square`

Hence the coefficient in `(7.2)` is invertible modulo `y^2`.

### Theorem 7.2 — bilateral port involution

Define, on the admissible residue classes modulo `y^2`,

```text
f_y(z)=c z (Delta z-c)^(-1) mod y^2.         (7.3)
```

Then every admissible filler pair satisfies

```text
r congruent f_y(p) mod y^2.                  (7.4)
```

Moreover,

```text
f_y(f_y(z))=z.                               (7.5)
```

Thus `f_y` is a projective Möbius involution.

### Proof

Equation `(7.4)` is `(7.2)` after inversion.  The transformation is represented in
`PGL_2(Z/y^2 Z)` by

```text
[ c      0 ]
[ Delta -c ].
```

Its square is

```text
c^2 I.
```

Equivalently, direct calculation gives

```text
Delta f_y(z)-c =c^2/(Delta z-c),
```

and substitution into `(7.3)` yields `f_y(f_y(z))=z`.  A Wolfram symbolic check returned
exactly `z`.  `square`

### Corollary 7.3 — norm-one coordinate

On admissible classes define

```text
zeta_y(z)=Delta z c^(-1)-1 mod y^2.
```

Then `(7.1)` is equivalent to

```text
zeta_y(p) zeta_y(r)=1 mod y^2.               (7.6)
```

Indeed,

```text
(Delta p-c)(Delta r-c) congruent c^2 mod y^2.
```

The two filler primes therefore occupy reciprocal classes in a norm-one torus coordinate.
The local problem is not arbitrary pair selection.

### Fixed residue classes

A residue class is self-paired precisely when

```text
Delta z congruent 2c mod y^2.
```

A self-paired class may still contain two distinct primes; self-pairing is a statement about
residue classes, not equality of the actual primes.

## 8. Pulled-back discriminant curve

For `A=pr`, define

```text
F_(x,y)(p,r)
 = {Delta pr-bx(p+r)}^2
   -4y^3{a pr+x(p+r)}.                       (8.1)
```

### Proposition 8.1

Once the integral-transfer congruence holds,

```text
F_(x,y)(p,r)=y^4 (q-s)^2                    (8.2)
```

for a semiprime completion `B=qs`.

Conversely, if `(7.1)` holds and `F_(x,y)(p,r)` is `y^4` times a square with the correct
parity, the transferred integer jet splits over the integers; primality of the roots is the
only remaining semiprime condition.

### Proof

The transferred sum and product are

```text
V={Delta pr-bx(p+r)}/y^2,
Q={a pr+x(p+r)}/y.
```

Therefore

```text
y^4(V^2-4Q)=F_(x,y)(p,r).
```

The claim follows from

```text
V^2-4Q=(q-s)^2.
```

### Rationality after fixing one seed prime

For fixed `p`, equation

```text
w^2=F_(x,y)(p,r)
```

is quadratic in `r`, and its leading coefficient is the square

```text
(Delta p-bx)^2.
```

Thus the corresponding conic has rational points at infinity and is rationally
parameterizable.  Choosing one of the right-hand roots as parameter gives the crossed
terminal formulas in the next section.

The global difficulty is therefore not geometric irrationality of the conic.  It is the
simultaneous integrality and primality of the four roots under the large square-modulus port
condition.

## 9. Cross-seeded terminal formulas

Choose one new prime `p` on the left and one new prime `s` on the right.  Regard

```text
xp,
ys
```

as the updated prefixes.  Their new reciprocal-product deficit is

```text
Omega
 =xp*ys-D(xp)D(ys)
 =Delta ps-ayp-bxs-xy.                       (9.1)
```

### Theorem 9.1 — unique crossed terminal pair

If `Omega!=0`, the unique rational primes `r,q` which would complete

```text
X=xpr,
Y=yqs
```

are

```text
r={xp(bs+y)+y^2 s^2}/Omega,                  (9.2)
q={ys(ap+x)+x^2 p^2}/Omega.                  (9.3)
```

Positive completion requires `Omega>0`, and the displayed values must be distinct new primes.

### Proof

With `p,s` fixed, the two derivative equations are linear in `r,q`:

```text
(ap+x)r-ys q=-xp,
xp r-(bs+y)q=ys.
```

Their determinant is

```text
Omega=xyps-(ap+x)(bs+y).
```

Cramer's rule gives `(9.2)--(9.3)`.  Equivalently, this is the earlier
one-prime-per-side terminal theorem applied after the seed transition

```text
(x,y)->(xp,ys).
```

`square`

This gives a second search coordinate system.  Instead of choosing two primes on one side
and testing a discriminant, choose one seed prime on each side and test whether the unique
crossed terminal pair is integral and prime.

## 10. Deficit amplification inequalities

The semiprime identities impose useful size constraints before any primality test.

### Proposition 10.1

Every positive semiprime completion satisfies

```text
U>4xb/Delta,
V>4ay/Delta,                                 (10.1)
```

and

```text
UV>16x^2y^2/Delta^2.                         (10.2)
```

### Proof

Since `P=pr` and `U=p+r`,

```text
P<=U^2/4.
```

Using `(4.1)` and positivity of `V`,

```text
Delta U^2/4
 >=Delta P
 =xbU+y^2V
 >xbU,
```

which gives the first inequality for `U`.  The bound for `V` is symmetric.

Also

```text
Delta U^2>4y^2V,
Delta V^2>4x^2U.
```

Multiplication and cancellation of `UV>0` give `(10.2)`.  `square`

Thus a very small prefix deficit does not make terminal completion easier.  It forces the
new prime sums to become very large.  This is the bilateral analogue of terminal-prime
denominator amplification in one-sided port problems.

## 11. Search and analytic interfaces

The new reduction suggests the following order.

### Stage A — local port sieve

For each candidate prime `p`, compute the unique admissible class

```text
r congruent f_y(p) mod y^2.
```

Dirichlet-type prime supply may populate this class, but it does not address global closure.

### Stage B — discriminant-square sieve

Among primes in the paired class, test

```text
F_(x,y)(p,r)/y^4
```

for a square.  This is the first genuinely sparse global event.

### Stage C — prime-root sieve

Factor the transferred polynomial

```text
t^2-Vt+Q.
```

Only after integrality and square splitting should primality be tested.

### Stage D — reciprocal construction or obstruction

Possible analytic directions are:

1. distribution of primes under the Möbius involution modulo `y^2`;
2. square-sieve estimates for the pulled-back discriminant on paired prime classes;
3. integral-point analysis on the conic family;
4. local obstructions at primes dividing `Delta`, `x`, or `y`;
5. use of the narrow ratio wedge and deficit amplification to restrict scale patterns.

This is more structured than raw enumeration of four prime variables.

## 12. Relation to E306 and the local-limit programme

The Möbius port involution is not an E306 fibre decoder.  It belongs to the nonlinear E307
closure problem.  Nevertheless there is a shared theme:

```text
E306:
  random / selectable incidence edges are mixed across CRT coordinates;

E307:
  a complete bipartite incidence block must close under a deterministic jet transfer.
```

Both lead to reciprocal transformations modulo growing composite moduli, but their roles are
different.  E306 seeks smoothing and point hitting; E307 seeks an integral two-cycle in a
sparse arithmetic jet locus.

## 13. Honest classification

```text
RATIONAL LINEAR JET TRANSFER — PROVED
EXACT REVERSE MATRIX — PROVED
ONE-SIDE SEMIPRIME DISCRIMINANT TEST — PROVED
INTEGRALITY REDUCED TO ONE MOD-y^2 CONDITION — PROVED
MOBIUS PORT INVOLUTION / NORM-ONE COORDINATE — PROVED
CROSS-SEEDED UNIQUE TERMINAL FORMULAS — PROVED
DEFICIT AMPLIFICATION INEQUALITIES — PROVED
SMALL JET-TRANSFER SEARCH — NO SPLIT SEMIPRIME RETURNS
GLOBAL PRIME SEMIPRIME-TO-SEMIPRIME ORBIT — OPEN FRONTIER
```

A novelty and literature audit is required before publication-level claims.  No E306 proof,
manuscript, review, Curator, Lean, release, DOI, arXiv, journal, submission, or canonical
status changes through this research checkpoint.
