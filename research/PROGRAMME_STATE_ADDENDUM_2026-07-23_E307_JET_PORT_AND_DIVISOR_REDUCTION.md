# Programme state addendum — E307 jet ports and divisor reduction

**Programme:** `E306-RL`  
**Date:** 2026-07-23  
**Authority:** research only

## Material adjacent-problem checkpoint

Erdős 307 is now represented at four exact structural levels.

### 1. Arithmetic-derivative dynamics

For coprime squarefree `X,Y`, E307 is exactly

```text
D(X)=Y,
D(Y)=X.
```

True cycles are multiplicatively primitive and admit no nontrivial inheritance.

### 2. Bilateral defect semigroup

For prefixes `(x,y)` and fillers `(A,B)`, the defect state evolves by an exact semigroup
action.  The reciprocal-product deficit is monotone under prime extensions.

### 3. Rational first-jet transfer

Writing

```text
a=D(x), b=D(y), Delta=xy-ab,
J(n)=(n,D(n))^T,
```

bilateral filling is equivalent to

```text
J(B)=T_(x,y)J(A),

          [ a/y          x/y      ]
T_(x,y)= [                         ],
          [ Delta/y^2  -bx/y^2    ]
```

with

```text
T_(y,x)=T_(x,y)^(-1).
```

For semiprime fillers, one side determines the other jet and only a discriminant-square test
remains.

### 4. Port involution and divisor reduction

Integral transfer of `A=pr` is equivalent to

```text
y^2 | Delta pr-xD(y)(p+r).
```

The two primes are paired modulo `y^2` by the involution

```text
f_y(z)=xD(y)z(Delta z-xD(y))^(-1).
```

The same real Möbius function is the zero-deficit boundary and its displacement records the
transferred derivative sum.

After fixing one seed prime `p`, define

```text
M_p=D(xp),
L_p=xpy-M_pD(y),
K_p=x^2p^2L_p+y^2M_p^2.
```

Every two-prime-per-side completion is equivalent to a restricted divisor factorization

```text
K_p=d d',
d congruent d' congruent -yM_p mod L_p.
```

Then

```text
q=(d+yM_p)/L_p,
s=(d'+yM_p)/L_p,
r=(yqs-xp)/M_p.
```

The last quantity is automatically integral.  Only primality, distinctness, and disjointness
remain.

## Exact current frontier

The problem has moved from raw prime tuples to the cubic sequence

```text
K_p
 =x^2 Delta p^3
  +(D(x)^2y^2-x^3D(y))p^2
  +2D(x)xy^2p
  +x^2y^2.
```

The highest-value next questions are:

1. local factorization obstructions for `K_p` in admissible seed classes;
2. existence of a divisor of `K_p` in the prescribed square-root residue class;
3. distribution of such divisors as `p` varies;
4. primality of the three affine outputs `q,s,r`;
5. novelty comparison with arithmetic-derivative and divisor-value literature.

## Classification

```text
E307 DERIVATIVE TWO-CYCLE — PROVED EQUIVALENCE
BILATERAL DEFECT SEMIGROUP — PROVED
RATIONAL JET TRANSFER — PROVED
REAL/MODULAR MOBIUS PORT INVOLUTION — PROVED
SEEDED CUBIC DIVISOR FACTORIZATION — PROVED
EXISTENCE OR NONEXISTENCE OF A PRIME CYCLE — OPEN
```

This adjacent-problem programme does not alter the released E306 theorem, Lean authority,
manuscript, review, Curator, DOI, arXiv, journal, submission, or canonical status.
