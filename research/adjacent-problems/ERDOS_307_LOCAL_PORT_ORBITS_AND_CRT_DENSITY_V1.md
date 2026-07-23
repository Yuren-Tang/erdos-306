# Erdős 307: local port orbits and CRT density

**Programme:** `E306-RL-ADJ-07`  
**Status:** `LOCAL ORBIT CLASSIFICATION / EXACT CRT COUNT`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Setup

Fix coprime squarefree prefixes `x,y>1` and put

```text
a=D(x),
b=D(y),
Delta=xy-ab,
c=xb.
```

For a left semiprime filler `pr`, integral jet transfer is equivalent to

```text
y^2 | Delta pr-c(p+r).                       (1.1)
```

The associated projective involution is

```text
f_y(z)=c z(Delta z-c)^(-1) mod y^2.          (1.2)
```

This note classifies its local factors.

## 2. Prime-level reciprocal-syndrome map

Let `ell|y`.  Reducing `(1.1)` modulo `ell` and using

```text
Delta congruent -ab mod ell,
c=xb,
```

gives

```text
a pr+x(p+r)=0 mod ell.                       (2.1)
```

Equivalently,

```text
a/x+1/p+1/r=0 mod ell.                       (2.2)
```

If `ap+x` is nonzero modulo `ell`, the unique solution is

```text
r congruent g_ell(p)
  :=-xp(ap+x)^(-1) mod ell.                  (2.3)
```

The map is involutive.

For odd `ell`:

- if `ell` does not divide `a`, there is one pole class
  ```text
  p=-x/a mod ell,
  ```
  one fixed class
  ```text
  p=-2x/a mod ell,
  ```
  and all other admissible classes form two-cycles;
- if `ell|a`, then
  ```text
  g_ell(p)=-p mod ell,
  ```
  with no pole and no fixed unit class.

Thus the port map is exactly the binary closure map for the mutual reciprocal syndrome.

## 3. Exact count modulo an odd prime square

Let `ell|y` be odd.  The domain of the lift

```text
f_(ell^2)(z)=c z(Delta z-c)^(-1) mod ell^2
```

consists of unit classes for which the denominator is a unit.

### Theorem 3.1

If `ell` does not divide `a`, then:

```text
number of admissible unit classes =ell(ell-2),
number of fixed classes           =1,
number of involution orbits       ={ell(ell-2)+1}/2.   (3.1)
```

The fixed class is

```text
z=2c Delta^(-1) mod ell^2.
```

If `ell|a`, then:

```text
number of admissible unit classes =ell(ell-1),
number of fixed classes           =0,
number of involution orbits       =ell(ell-1)/2.       (3.2)
```

### Proof

There are `ell(ell-1)` unit classes modulo `ell^2`.

When `ell` does not divide `a`, `Delta` is a unit modulo `ell`.  The denominator fails on
one residue class modulo `ell`, hence on `ell` lifts modulo `ell^2`.  This gives
`ell(ell-2)` admissible classes.  The fixed equation

```text
Delta z=2c mod ell^2
```

has one solution.

When `ell|a`, one has `ell|Delta` while `c` is a unit.  Therefore every unit class is in the
domain, while the fixed equation is impossible modulo `ell`.  The remaining classes pair
under the involution.  `square`

## 4. CRT count for odd `y`

Assume `y` is odd and let `D_y` be the admissible domain modulo `y^2`.

### Theorem 4.1

```text
|D_y|
 =product_(ell|y, ell|a)      ell(ell-1)
  *product_(ell|y, ell not|a) ell(ell-2).     (4.1)
```

Hence

```text
|D_y|/phi(y^2)
 =product_(ell|y, ell not|a)
    (ell-2)/(ell-1).                          (4.2)
```

The global involution has one fixed class if `gcd(a,y)=1`, and no fixed class otherwise.
Thus its number of global orbits is

```text
(|D_y|+F_y)/2,
F_y=1 if gcd(a,y)=1,
F_y=0 otherwise.                             (4.3)
```

### Proof

Apply Theorem 3.1 at every prime-square factor and use the Chinese remainder theorem.
`square`

The local integral-transfer cost is therefore an explicit Euler-type density, not an
uncontrolled assignment entropy.

## 5. The two-adic factor

Suppose `2|y`.  Then `x`, `b`, `c`, and every new filler prime are odd.  The denominator

```text
Delta p-c
```

is odd if and only if `Delta` is even.  Since

```text
Delta=xy-ab congruent a mod 2,
```

admissibility is equivalent to

```text
D(x) is even.                                (5.1)
```

For squarefree odd `x`, every summand `x/p` in `D(x)` is odd, so `(5.1)` is equivalent to
`omega(x)` being even.  This recovers the known E307 parity law when the opposite side
contains the prime `2`.

When admissible, both odd classes modulo four lie in the domain.

- If `Delta=0 mod 4`, they form one two-cycle.
- If `Delta=2 mod 4`, both are fixed.

Thus the parity condition is the two-adic shadow of the same port involution.

## 6. Norm-one coordinate

Condition `(1.1)` is equivalent to

```text
(Delta p-c)(Delta r-c)=c^2 mod y^2.          (6.1)
```

On the admissible domain define

```text
zeta(z)=(Delta z-c)c^(-1).
```

Then

```text
zeta(p)zeta(r)=1 mod y^2.                    (6.2)
```

The filler primes therefore occupy reciprocal classes in a multiplicative torus
coordinate.  The Möbius map is conjugate to inversion.

## 7. Strategic consequence

For fixed prefixes, a search should:

1. retain only admissible prime classes modulo `y^2`;
2. pair them by `f_y`;
3. search the paired prime classes;
4. test the transferred discriminant for a square;
5. test primality of the resulting roots only at the end.

The exact remaining global problem is to control

```text
F_(x,y)(p,r)
 ={Delta pr-xD(y)(p+r)}^2
  -4y^3{D(x)pr+x(p+r)}
```

on Möbius-paired prime classes.  A completion requires `F_(x,y)(p,r)/y^4` to be a square.

Possible next tools are a square sieve, local solubility analysis of the conic family, or a
prime-value heuristic after rational parameterization.

## 8. Classification

```text
PRIME-LEVEL RECIPROCAL-SYNDROME REFLECTION — PROVED
ODD PRIME-SQUARE ORBIT COUNTS — PROVED
GLOBAL CRT ADMISSIBLE DENSITY — PROVED
TWO-ADIC PARITY LAW AS PORT OBSTRUCTION — PROVED
NORM-ONE TORUS COORDINATE — PROVED
GLOBAL DISCRIMINANT-SQUARE RETURN — OPEN FRONTIER
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, journal, submission, or
canonical status changes through this checkpoint.
