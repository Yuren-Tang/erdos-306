# Erdős 307: block-first two-prime closure and exact pencil intersection

**Programme:** `E306-RL-ADJ-12`  
**Status:** `GENERAL CLOSURE THEOREM / EXACT MEET-IN-THE-MIDDLE INTERFACE`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The seeded residual-port formulation writes an E307 completion as a right block `B`, one chosen
left seed prime `p`, and one final left output prime `r`.  This ordering is useful for a port-tree
search, but it hides a stronger symmetry: once the full right side and the old left prefix are
fixed, the unordered pair `{p,r}` is determined at once by its product and sum.

This note proves the exact two-prime closure theorem.  It identifies the preceding block-first
seed quadratic as the Vieta polynomial whose two roots are precisely the seed prime and the final
output prime.  Consequently no separate output-primality stage remains in the block-first lane.

## 2. Setup

Let `D` be the arithmetic derivative.  Fix coprime squarefree integers

```text
x>0,
Y>1.
```

Write

```text
a=D(x),
e=D(Y).
```

We seek distinct primes `p,r`, disjoint from `xY`, such that

```text
X=xpr
```

and

```text
D(X)=Y,
D(Y)=X.                                           (2.1)
```

The integer `x` is the already chosen left prefix; `Y` is the complete opposite side.

## 3. Product and sum are forced

The second equation in `(2.1)` gives

```text
e=xpr.
```

Thus the product of the two missing primes must be

```text
P:=pr=e/x.                                        (3.1)
```

The first equation gives

```text
Y=D(xpr)
 =a pr+x(p+r).
```

Therefore their sum must be

```text
S:=p+r=(Y-aP)/x.                                  (3.2)
```

Equivalently,

```text
P=e/x,
S=(xY-ae)/x^2.                                    (3.3)
```

### Theorem 3.1 — block-first two-prime closure

There exist distinct primes `p,r`, disjoint from `xY`, satisfying `(2.1)` if and only if:

1. `x|e`;
2. with `P=e/x`, one has `x|(Y-aP)`;
3. the integers
   ```text
   P=e/x,
   S=(Y-aP)/x
   ```
   are positive;
4. the discriminant
   ```text
   H=S^2-4P                                      (3.4)
   ```
   is a nonnegative perfect square;
5. the two roots
   ```text
   p=(S-sqrt(H))/2,
   r=(S+sqrt(H))/2                              (3.5)
   ```
   are distinct primes disjoint from `xY`.

When these conditions hold, the unordered pair `{p,r}` is unique.

#### Proof

Necessity follows from `(3.1)--(3.2)` and Vieta's formula.  Conversely, conditions `1--5` give

```text
pr=P,
p+r=S.
```

Hence

```text
D(Y)=e=xP=xpr=X,
```

and

```text
D(X)=aP+xS=Y.
```

The stated coprimality and squarefreeness conditions make this an E307 completion.  Uniqueness
follows because a monic quadratic is determined by its sum and product. `square`

A Wolfram symbolic check independently reduced the two reconstructed derivative equations and
the polynomial identity below to zero.

## 4. Integral polynomial form

The two primes are roots of

```text
z^2-Sz+P=0.                                      (4.1)
```

Clearing denominators gives the integral polynomial

```text
x^2 z^2-(xY-ae)z+xe=0.                           (4.2)
```

Its discriminant is

```text
Disc_(x,Y)
 =(xY-ae)^2-4x^3e
 =x^4 H.                                          (4.3)
```

Thus the square test may be performed without first dividing:

```text
Disc_(x,Y) must be x^4 times a square.            (4.4)
```

The divisibility conditions in Theorem 3.1 are equivalently

```text
x|D(Y),
x^2|xY-D(x)D(Y).                                (4.5)
```

These are the exact local gates before the discriminant and primality tests.

## 5. Recovery of the preceding block-first quadratic

Now write the complete right side as

```text
Y=yB,
```

where `y,B` are squarefree and coprime.  Put

```text
b=D(y),
d=D(B),
Delta=xy-D(x)D(y)=xy-ab.
```

Then

```text
e=D(Y)=bB+yd.                                     (5.1)
```

The forced product and sum become

```text
P=(bB+yd)/x,                                      (5.2)
```

```text
S={B Delta-a y d}/x^2.                            (5.3)
```

Indeed,

```text
xY-ae
 =xyB-a(bB+yd)
 =B(xy-ab)-ayd
 =B Delta-ayd.
```

Consequently `(4.2)` is exactly

```text
x^2 z^2
 -(B Delta-a y D(B))z
 +x(bB+yD(B))=0.                                  (5.4)
```

This is the earlier block-first seed quadratic.  Its two roots are not merely two possible seed
choices.  They are precisely the unordered pair

```text
{seed prime, final output prime}={p,r}.            (5.5)
```

### Corollary 5.1 — no separate final-output test in the block-first lane

For fixed `x,y,B`, once `(5.4)` has two distinct admissible prime roots, the complete E307 cycle
is already verified.  Choosing one root as the seed and reconstructing the other by the scalar
port quotient only changes the order in which the same pair is discovered.

## 6. Exact affine-pencil intersection theorem

Suppose the fixed right block `B` has a residual-one port `(c_0,R_0)`:

```text
c_0 B-R_0 D(B)=1.                                 (6.1)
```

For a positive residual `C`, all integer ports filled by `B` form the pencil

```text
(c,R)=(C c_0+tD(B), C R_0+tB),
 t in Z.                                           (6.2)
```

For E307 prefixes `x,y` and a prospective left prime `p`, the seeded port is

```text
c_seed=Delta p-xD(y),
R_seed=y(pD(x)+x),
C=x^2p^2.                                          (6.3)
```

### Theorem 6.1 — pencil intersection equals the closure quadratic

The seeded port `(6.3)` lies on the block pencil `(6.2)` for some integer `t` if and only if `p`
is a root of `(5.4)`.

Moreover, when the intersection exists, `t` is automatically an integer and is uniquely given by

```text
t={c_seed-Cc_0}/D(B)
 ={R_seed-CR_0}/B.                                (6.4)
```

#### Proof

Eliminate `t` from `(6.2)`:

```text
B(c_seed-Cc_0)=D(B)(R_seed-CR_0).                 (6.5)
```

Using `(6.1)` and `(6.3)`, equation `(6.5)` becomes

```text
x^2p^2
 -(BDelta-D(x)yD(B))p
 +x(D(y)B+yD(B))=0,
```

which is `(5.4)`.

Conversely, if `(5.4)` holds, then `(6.5)` holds.  The integer vector

```text
(c_seed-Cc_0, R_seed-CR_0)
```

lies in the integer kernel of

```text
(u,v) -> Bu-D(B)v.
```

Since `B` is squarefree,

```text
gcd(B,D(B))=1,
```

so that kernel is generated by `(D(B),B)`.  Hence a unique integer `t` exists and `(6.4)` holds.
`square`

This is the exact meet-in-the-middle theorem promised by the port-pencil programme:

```text
seed curve intersects block pencil
  if and only if
one explicit quadratic splits.                    (6.6)
```

## 7. Structural consequences

### 7.1 The final-prime bottleneck was partly coordinate-induced

In the seed-first lane one first solves a residual-`C` port and then asks whether

```text
r=(yB-xp)/D(xp)
```

is prime.  The block-first theorem shows that this `r` is simply the conjugate root of `(5.4)`.
Thus the two primality requirements are one symmetric prime-pair splitting event, not two
unrelated events.

### 7.2 Arithmetic gates are sharply ordered

For each pair `(x,Y)` the closure test is:

1. `x|D(Y)`;
2. `x^2|xY-D(x)D(Y)`;
3. positivity of `P,S`;
4. square discriminant;
5. two prime roots;
6. disjointness.

No factorization of a cubic `K_p` is required in this lane.

### 7.3 Seed-first and block-first lanes have different strengths

```text
SEED-FIRST:
  best when one wants to grow B recursively by residual-C port composition;
  two-prime tails reduce to divisors of K_p.

BLOCK-FIRST:
  best when B comes from a library or a generated block family;
  all possible seed/output pairs are obtained by one quadratic.
```

The two lanes should be indexed against each other rather than treated as competing proofs.

## 8. New search architecture

A meet-in-the-middle engine may now use:

### Right/block table

For every generated squarefree `Y` or decomposition `Y=yB`, store

```text
Y,
D(Y),
B,
D(B),
residual-port pencil data,
local and Sondow signatures.
```

### Left-prefix table

For each squarefree `x`, test

```text
x|D(Y),
x^2|xY-D(x)D(Y).
```

If both pass, compute

```text
P=D(Y)/x,
S={xY-D(x)D(Y)}/x^2.
```

Then perform one discriminant and prime-pair test.

For an actual E307 cycle, choosing `x` to be the opposite side with any two prime factors removed
must make this closure test succeed.  Hence the architecture is complete, not heuristic.

## 9. Current obstruction after the theorem

The block-first obstacle is now exactly:

```text
find a squarefree right side Y
and a squarefree divisor x of D(Y)
for which
  x^2|xY-D(x)D(Y)
and
  z^2-Sz+P splits into two new primes.             (9.1)
```

The residual-port and E313 block machinery is one way to generate promising `Y`; paired
`+-h`-Sondow congruences and genus/divisor signatures are filters.  But after this theorem the
fundamental correlation is visible directly in `(9.1)`.

## 10. Honest classification

```text
BLOCK-FIRST TWO-PRIME PRODUCT/SUM CLOSURE — PROVED
INTEGRAL DIVISIBILITY GATES — PROVED
BLOCK-FIRST QUADRATIC ROOTS ARE {p,r} — PROVED
EXACT SEED-CURVE / PORT-PENCIL INTERSECTION — PROVED
SEPARATE FINAL-OUTPUT PRIMALITY IN BLOCK-FIRST LANE — ELIMINATED
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv, submission, or
canonical project status is changed by this research note.
