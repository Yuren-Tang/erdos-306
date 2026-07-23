# Erdős 307: seeded divisor-port factorization

**Programme:** `E306-RL-ADJ-09`  
**Status:** `EXACT DIVISOR REDUCTION / FINITE SEED SEARCH / PROVED`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The two-prime-per-side completion problem initially has four prime variables

```text
p,r on the left,
q,s on the right.
```

The semiprime jet-transfer theorem reduces it to a discriminant-square test.  This note goes
further: after fixing only one seed prime `p`, every possible completion is encoded by a
restricted factorization of one explicit integer `K_p`.

Thus the remaining candidates for a fixed seed are indexed by divisors, not by triples of
primes.

## 2. Seed data

Fix coprime squarefree prefixes `x,y>1` and put

```text
a=D(x),
b=D(y),
Delta=xy-ab>0.
```

Choose one new left prime `p`.  Define

```text
M_p=D(xp)=ap+x,                               (2.1)
L_p=xpy-D(xp)D(y)
   =Delta p-xb.                               (2.2)
```

A seed which occurs in a proper completion must satisfy

```text
L_p>0.                                       (2.3)
```

The quantity `L_p` is the one-sided remaining reciprocal-product deficit after adjoining
`p` to the left prefix.

## 3. Elimination of the remaining left prime

Seek primes `r,q,s` such that

```text
D(xpr)=yqs,
D(yqs)=xpr.                                  (3.1)
```

Using the product rule, `(3.1)` becomes

```text
M_p r+xp=yqs,                                (3.2)
xp r=bqs+y(q+s).                             (3.3)
```

### Theorem 3.1 — seeded bilinear equation

Equations `(3.2)--(3.3)` imply, and are implied after defining `r` by `(3.2)`, by

```text
L_p qs-yM_p(q+s)=x^2p^2.                    (3.4)
```

### Proof

Multiply `(3.3)` by `M_p` and use `(3.2)`:

```text
xp(yqs-xp)=M_p{bqs+y(q+s)}.
```

Since

```text
xyp-bM_p=L_p,
```

this is exactly `(3.4)`.

Conversely, suppose `(3.4)` holds and put

```text
r=(yqs-xp)/M_p.                              (3.5)
```

Then `(3.2)` holds by definition.  Multiplying the desired equation `(3.3)` by `M_p`
and using `(3.4)` recovers an identity, so `(3.3)` also holds once `r` is integral.
`square`

## 4. Factorization of one cubic integer

Add `y^2M_p^2` to the two sides of `(3.4)` after multiplying by `L_p`.

### Theorem 4.1 — divisor-port identity

Define

```text
K_p=x^2p^2L_p+y^2M_p^2.                     (4.1)
```

Then every completion satisfies

```text
(L_p q-yM_p)(L_p s-yM_p)=K_p.               (4.2)
```

Conversely, every positive integer solution of `(4.2)` produces a positive integral `r`
through `(3.5)` and satisfies both derivative equations.

### Proof

Expanding the left side of `(4.2)` gives

```text
L_p^2qs-L_pyM_p(q+s)+y^2M_p^2.
```

Using `(3.4)` gives `(4.1)`.

For the converse, `(4.2)` implies `(3.4)`.  It remains to prove that `(3.5)` is integral.
Modulo `M_p`, equation `(3.4)` gives

```text
xyp qs=x^2p^2 mod M_p,
```

because `L_p=xyp-bM_p`.  Since `xp` is squarefree and

```text
gcd(xp,D(xp))=gcd(xp,M_p)=1,
```

one obtains

```text
M_p | yqs-xp.
```

Thus `r` is integral.  Moreover `L_p<xyp`, and `(3.4)` gives

```text
L_pqs>x^2p^2,
```

so `yqs>xp` and `r>0`.  The verification of `(3.3)` was given in Theorem 3.1.  `square`

### Cubic form

The integer `K_p` is the cubic polynomial

```text
K_p
 =x^2 Delta p^3
  +(a^2y^2-x^3b)p^2
  +2axy^2p
  +x^2y^2.                                  (4.3)
```

No factorization of this cubic is assumed.

## 5. One divisor condition is enough

A seed which can occur in a completion has

```text
gcd(L_p,y)=1.                                (5.1)
```

Indeed, the no-pole lemma for the Möbius port involution gives `(5.1)`.

Also

```text
gcd(L_p,M_p)
 =gcd(xyp-bM_p,M_p)
 =gcd(y,M_p),
```

because `gcd(xp,M_p)=1`.  Reducing `L_p` modulo every prime divisor of `y` gives

```text
L_p congruent -bM_p mod y,
```

and `gcd(b,y)=1`.  Hence `(5.1)` implies

```text
gcd(L_p,yM_p)=1.                             (5.2)
```

Furthermore,

```text
K_p congruent (yM_p)^2 mod L_p.              (5.3)
```

### Theorem 5.1 — restricted divisor parameterization

Assume `L_p>0` and `(5.2)`.  Let `d` be a positive divisor of `K_p` satisfying

```text
d congruent -yM_p mod L_p.                  (5.4)
```

Put

```text
d'=K_p/d.
```

Then automatically

```text
d' congruent -yM_p mod L_p.                 (5.5)
```

Define

```text
q=(d +yM_p)/L_p,                             (5.6)
s=(d'+yM_p)/L_p,                             (5.7)
r=(yqs-xp)/M_p.                              (5.8)
```

These are positive integers satisfying both derivative equations.

Conversely, every positive integer completion arises from such a divisor pair, with

```text
d =L_pq-yM_p,
d'=L_ps-yM_p.                               (5.9)
```

### Proof

Because `d` is a unit modulo `L_p`, `(5.3)--(5.4)` give

```text
d'
 congruent (yM_p)^2(-yM_p)^(-1)
 congruent -yM_p                             mod L_p,
```

which proves `(5.5)`.  Equations `(5.6)--(5.7)` are therefore positive integers and satisfy
`(4.2)`.  Theorem 4.1 supplies the positive integer `r` and both cycle equations.  The
converse is immediate from `(4.2)`.  `square`

Thus only one divisor in each complementary pair needs its residue checked.

## 6. Prime completion criterion

For a fixed prefix pair and seed prime `p`, an E307 two-prime-per-side completion exists if
and only if there is a divisor `d|K_p`, with `d<=sqrt(K_p)` after ordering, such that:

1. `d=-yM_p mod L_p`;
2. the integers `q,s` from `(5.6)--(5.7)` are distinct primes;
3. the integer `r` from `(5.8)` is prime;
4. `p,r,q,s` are distinct and disjoint from the prefix prime factors.

The number of arithmetic candidates before primality is at most

```text
tau(K_p)/2+O(1).
```

This replaces a three-prime search by a divisor enumeration of one explicit cubic value.

## 7. Relation to the discriminant formulation

The transferred right jet is

```text
B=qs,
D(B)=q+s.
```

The discriminant-square condition

```text
D(B)^2-4B=(q-s)^2
```

is equivalent to the factorization `(4.2)` via

```text
L_pq-yM_p,
L_ps-yM_p.
```

Thus the conic is not merely rational in principle.  Its integral points are exactly encoded
by restricted divisors of `K_p`.

The two descriptions serve different purposes:

```text
discriminant / conic form:
  local solubility, square sieves, rational geometry;

divisor-port form:
  exact search, factorization obstructions, congruence pruning.
```

## 8. Computational probe

A Wolfram search used:

- all ordered disjoint prefixes of sizes one or two from the first eight primes;
- each of the first twenty primes as the seed `p` when disjoint from the prefixes;
- complete divisor enumeration of `K_p` subject to `(5.4)`.

Only one positive integral divisor-port candidate appeared:

```text
x-primes={2,3},
y-primes={5},
p=23,
L_p=569,
K_p=11202061,
d=533,
r=2,
q=2,
s=38.
```

It is invalid: it reuses the prefix prime `2` and `38` is composite.  No nondegenerate prime
completion occurred.

This computation has no exclusion force for E307.  It demonstrates that the divisor-port
reduction removes almost the entire small search space before primality testing.

## 9. New arithmetic frontiers

The global two-prime terminal problem is now concentrated in the cubic sequence `K_p`.
Useful questions include:

1. when does `K_p` possess two complementary divisors in the same residue class
   `-yM_p mod L_p`?
2. can local factorization of `K_p` rule out large classes of seeds?
3. can one force such divisors by algebraic factorization after choosing special prefixes?
4. what is the typical size of the restricted divisor set as `p` varies over its admissible
   prime classes?
5. can the prime values of `q,s,r` be studied conditionally after divisor parameterization?

This is a divisor-distribution problem attached to an arithmetic-derivative cubic, not a raw
four-prime equation.

## 10. Classification

```text
SEEDED BILINEAR ELIMINATION — PROVED
ONE-CUBIC DIVISOR-PORT FACTORIZATION — PROVED
AUTOMATIC INTEGRALITY OF THE LAST PRIME — PROVED
ONE-DIVISOR RESIDUE TEST — PROVED
FINITE EXACT SEARCH FOR EACH SEED — PROVED
SMALL DIVISOR SEARCH — NO NONDEGENERATE PRIME COMPLETION
GLOBAL RESTRICTED DIVISOR / PRIME-VALUE PROBLEM — OPEN FRONTIER
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, journal, submission, or
canonical status changes through this checkpoint.
