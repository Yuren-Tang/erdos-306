# Programme-state addendum: E307 port / Sondow / norm synthesis

**Programme:** `E306-RL`  
**Date:** 2026-07-23  
**Status:** `MATERIAL ADJACENT-PROBLEM MECHANISM CHECKPOINT / NOT INDEPENDENTLY REVIEWED`  
**Authority:** research only

## 1. Executive classification

The E307 exploration has moved beyond an arithmetic-derivative reformulation.  Four exact
coordinate systems are now linked:

```text
DYNAMICAL:
  D(x)=y, D(y)=x;

GAP / SONDOW:
  h=y-x,
  x is quotient-one (-h)-Sondow,
  y is quotient-one h-Sondow;

SEEDED PORT:
  after fixing one left seed p,
  cB-RD(B)=C=x^2p^2;

ALGEBRAIC NORM / DIVISOR CODE:
  for a two-prime right tail,
  K_p=(yD(xp))^2+L_p(xp)^2,
  d|K_p in one prescribed residue class.
```

The same problem also has a dual block-first quadratic giving at most two seed candidates for
any fixed right block.

No E307 solution is claimed.

## 2. Exact theorem chain

### 2.1 Seeded scalar port

For prefixes `x,y`, a left seed prime `p`,

```text
M=D(xp),
c=L_p=xpy-MD(y),
R=yM,
C=x^2p^2,
```

an arbitrary squarefree right block `B` satisfies the derivative-cycle equations with final
left output `r` exactly when

```text
cB-RD(B)=C.
```

The quotient

```text
r=(yB-xp)/M
```

is automatically a positive integer; only its primality and disjointness remain.

### 2.2 Residual-C port calculus

For

```text
Psi_(c,R)(B)=cB-RD(B),
```

one has

```text
Psi_(c,R)(AB)=Psi_(Psi_(c,R)(A),RA)(B).
```

Prime transition, slope subtraction, one-prime terminal formula, last-two discriminant, finite
parameter bound, modular square sieves, and `k`-prime terminal hypersurfaces all extend from
residual `1` to every positive residual `C`.

### 2.3 Residual port pencils

For fixed squarefree `B`, all solutions of

```text
cB-RD(B)=C
```

form one affine integer pencil.  If `B` fills a residual-one port `(R_0,c_0)`, then

```text
(c,R)=(Cc_0+tD(B),CR_0+tB),
```

and exactly

```text
gcd(c,R)=gcd(C,t).
```

Thus E313 blocks generate primitive residual-C ports whenever `gcd(t,C)=1`.

### 2.4 Ambient-collapse boundary

Using an E313 block in its original ambient port produces a primary pseudoperfect side `Y`.
If `Y` belongs to an E307 cycle, the other side is forced to be `Y-1`; therefore ambient reuse
is exactly the consecutive Giuga/primary-pseudoperfect case.  Pure scaling `t=0` is also
impossible for a seeded E307 port because its gcd is `C>1`.

General transfer must be nonambient.

### 2.5 Block-first seed quadratic

For a fixed squarefree right block `B`, with `d=D(B)`, a seed prime must solve

```text
x^2p^2
 -(Delta B-D(x)y d)p
 +x(D(y)B+y d)=0.
```

The discriminant is

```text
(Delta B-D(x)yD(B))^2
 -4x^3(D(y)B+yD(B)).
```

Hence every block gives at most two seed candidates before primality.

### 2.6 Two-prime tail as cubic divisor port

For fixed seed `p`, define

```text
M_p=D(xp),
L_p=xpy-M_pD(y),
K_p=x^2p^2L_p+y^2M_p^2.
```

All positive integral two-prime right tails are parameterized by divisors

```text
d|K_p,
d congruent -yM_p mod L_p.
```

The complementary divisor automatically lies in the same class.

### 2.7 Divisor-code Fourier hierarchy

The target-divisor problem is a bounded exponent subset-product problem in

```text
(Z/L_pZ)^x.
```

It has three exact levels:

```text
1. subgroup support obstruction;
2. bounded exponent-box obstruction;
3. targeted character cancellation / mixing.
```

Since `K_p` is a square of the target residue modulo `L_p`, every subgroup obstruction has a
quadratic character certificate.

### 2.8 Primitive quadratic norm

One has

```text
K_p=(yM_p)^2+L_p(xp)^2.
```

This is a primitive norm.  Every odd prime factor of `K_p` splits in

```text
Q(sqrt(-L_p)).
```

For suitable squarefree part `L_0 congruent 3 mod 4`, the moving field character supplies a
factorization-free genus obstruction to the target divisor.

### 2.9 Paired Sondow diagonal

For `x<y`, `h=y-x`, E307 is exactly

```text
D(x)=x+h,
D(y)=y-h.
```

Thus `x` is quotient-one `(-h)`-Sondow and `y` quotient-one `h`-Sondow.  Moreover

```text
gcd(xy,h)=1.
```

The easy scaled `mu`-Sondow constructions are therefore not directly eligible.  E307 is a
primitive paired diagonal problem, not two independent one-sided existence questions.

## 3. Computational diagnostics

### Divisor support sample

Among `1457` admissible small seeds:

```text
1452 had no target divisor;
5 had exactly two target divisors;
all five were degenerate and gave no prime completion.
```

For `500` seeds with `L_p<=2000`:

```text
250 failed at subgroup support;
247 passed subgroup support but failed the bounded exponent box;
3 had target divisors.
```

### Known 2026 E313 blocks

The four central-port blocks from arXiv:`2605.21518` were tested against all ordered disjoint
prefix pairs formed from the first twelve primes, with each prefix of size at most three.
There were `74380` positive-deficit tests and no integral seed candidate.

This is diagnostic only.  It supports searching nonambient pencil intersections rather than
reusing ambient E313 geometry.

### Consecutive diagnostics

Direct exact checks show that neither of the two 2026 primary pseudoperfect examples has a
Giuga predecessor.  A Wolfram scan below `200000` also found no consecutive pair between the
small quotient-one negative and positive defect lists.

## 4. Mechanism transfer from E313

The following transfer algebraically for every positive residual `C`:

```text
port composition;
prime transition;
slope subtraction;
terminal-prime formula;
last-two discriminant;
finite parameter bound;
modular square sieve;
k-prime terminal hypersurface.
```

The following do not transfer automatically:

```text
ambient primary-pseudoperfect interpretation;
residual-one inheritance as an E313 solution;
final E307 output primality;
bilateral disjointness;
post-closure inheritance (forbidden by E307 anti-inheritance).
```

## 5. Current research ranking

### Highest-value next theorem

Construct a meet-in-the-middle **pencil-intersection theorem/search architecture**:

```text
LEFT INDEX:
  prefixes x,y and seed p,
  seeded port (c,R,C),
  divisor/norm/genus signatures;

RIGHT INDEX:
  residual-one or generated squarefree blocks B,
  their full residual-C port pencils,
  block quadratic coefficients;

MATCH:
  exact pencil intersection,
  followed by one final output-prime test.
```

This should combine:

1. seed-first cubic divisor ports;
2. block-first quadratic discriminants;
3. residual-one E313 block libraries;
4. paired `+-h` Sondow congruences;
5. genus/subgroup no-go filters.

### Secondary theorem frontiers

1. classify quotient-one parameter-coprime `mu`-Sondow numbers uniformly in moving `mu`;
2. develop full genus/ray-class orientation of `K_p` divisors;
3. prove targeted rather than uniform Fourier mixing for divisor residues;
4. formulate a prime-points hypothesis for residual-C block fillings plus the affine E307
   output prime.

## 6. Honest status

```text
E307 ARITHMETIC-DERIVATIVE TWO-CYCLE EQUIVALENCE — PROVED
BILATERAL DEFECT SEMIGROUP — PROVED
SEEDED RESIDUAL-C SCALAR PORT REDUCTION — PROVED
AUTOMATIC POSITIVE INTEGER OUTPUT — PROVED
GENERAL RESIDUAL-C PORT TOOLKIT — PROVED
RESIDUAL PORT PENCIL AND EXACT GCD LAW — PROVED
BLOCK-FIRST SEED QUADRATIC — PROVED
SEEDED CUBIC DIVISOR PORT — PROVED
DIVISOR FOURIER / QUADRATIC SUPPORT HIERARCHY — PROVED
PRIMITIVE NORM / SPLIT-FACTOR LAW — PROVED
SAFE MOVING GENUS OBSTRUCTION — PROVED
PAIRED QUOTIENT-ONE MU-SONDOW DIAGONAL — PROVED
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv, submission, or
canonical project status is changed by this research checkpoint.
