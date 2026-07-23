# Erdős 307: primitive quadratic norm and split-factor geometry

**Programme:** `E306-RL-ADJ-08`  
**Status:** `ALGEBRAIC-NUMBER-THEORY REDUCTION / PROVED LOCAL SPLITTING LAW / NEW FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

For fixed coprime squarefree prefixes `x,y` and a seed prime `p`, the seeded divisor-port
integer is

```text
K_p=x^2p^2L_p+y^2M_p^2,
M_p=D(xp),
L_p=xpy-D(xp)D(y)>0.
```

The previous reduction treats `K_p` as a cubic value whose divisors are searched in one
prescribed residue class modulo `L_p`.  This note records a stronger algebraic fact: `K_p` is a
primitive binary quadratic norm.  Its prime factors are therefore not generic prime factors of
a cubic value.

## 2. Primitive norm form

Put

```text
A_p=yM_p,
B_p=xp,
L=L_p.
```

Then

```text
K_p=A_p^2+L B_p^2.                              (2.1)
```

### Proposition 2.1 — primitivity

For every admissible seed,

```text
gcd(A_p,B_p)=1,
gcd(A_p,L)=1,
gcd(B_p,L) need not be one,
gcd(K_p,L B_p)=1.                               (2.2)
```

#### Proof

Since `xp` is squarefree,

```text
gcd(xp,D(xp))=1.
```

The prefixes and seed are disjoint, so `gcd(y,xp)=1`.  Hence

```text
gcd(yM_p,xp)=1.
```

The no-pole/integral-transfer condition gives `gcd(L_p,yM_p)=1`.  Thus `gcd(A_p,L)=1`.
If a prime divided both `K_p` and `B_p`, equation `(2.1)` would force it to divide `A_p`,
contradicting primitivity.  If a prime divided both `K_p` and `L`, it would divide `A_p^2`,
again a contradiction. `square`

Hence

```text
K_p=N(A_p+B_p sqrt(-L))                         (2.3)
```

in the quadratic order `Z[sqrt(-L)]`, with a primitive norm representation.

## 3. Split-prime law

### Theorem 3.1 — every odd prime factor splits

Let `lambda` be an odd prime divisor of `K_p`.  Then

```text
lambda does not divide L B_p
```

and

```text
(-L/lambda)=+1,                                 (3.1)
```

where the symbol is the Legendre/Kronecker symbol.

#### Proof

By Proposition 2.1, `B_p` is invertible modulo `lambda`.  Reducing `(2.1)` modulo `lambda`
gives

```text
(A_p B_p^(-1))^2 congruent -L mod lambda.
```

Thus `-L` is a nonzero square modulo `lambda`. `square`

Consequently every odd prime factor of `K_p` is split in the quadratic field

```text
Q(sqrt(-L_p)).                                  (3.2)
```

No inert odd prime can occur.  Since `gcd(K_p,L_p)=1`, odd ramified primes do not occur either.
The factorization of `K_p` is supported on split primes, apart from the separate two-adic case.

## 4. A moving quadratic field

The field/order depends on the seed through

```text
L_p=Delta p-xD(y).
```

Thus this is not a fixed quadratic-field norm family.  The seed simultaneously changes:

1. the represented norm `K_p`;
2. the quadratic discriminant/order;
3. the target divisor residue `t_p=-A_p mod L_p`;
4. the affine prime outputs `q,s,r`.

Any analytic treatment must therefore be uniform in a moving family of quadratic orders.
This explains why generic results on one fixed norm form do not immediately solve the port
problem.

## 5. Relation to divisor residues

The required target divisor satisfies

```text
d|K_p,
d congruent -A_p mod L_p.                 (5.1)
```

Write

```text
d=L_p q-A_p,
d'=L_p s-A_p.
```

Then `dd'=K_p` is equivalent to

```text
L_p q s-A_p(q+s)=B_p^2.                        (5.2)
```

Thus the divisor port is a factorization of the primitive norm into two positive factors lying
in the same affine residue class `-A_p mod L_p`.

The norm representation and the prescribed-residue condition are distinct constraints:

```text
NORM SPLITTING:
  every prime factor lies over a split rational prime;

PORT ORIENTATION:
  a selected product of those prime factors must land at -A_p mod L_p.
```

The second condition chooses an orientation/subset among the split factors.  In ideal language,
one expects it to depend on how the prime ideals dividing the principal ideal
`(A_p+B_p sqrt(-L_p))` are distributed between conjugate orientations, together with class-group
relations.  This note does not assert a complete ideal-theoretic parameterization.

## 6. Quadratic-character consequences

Let `D_L` be the fundamental discriminant of `Q(sqrt(-L))`.  Every odd prime
`lambda|K_p` with `lambda` coprime to `D_L` satisfies

```text
chi_(D_L)(lambda)=+1.                           (6.1)
```

Hence every odd divisor of `K_p` coprime to `D_L` lies in the kernel of the quadratic
splitting character `chi_(D_L)`.

This provides an additional family of local filters on a proposed divisor

```text
d=L_p q-A_p.
```

The exact form depends on the two-adic conductor and on the residue of `d` modulo the conductor,
not merely modulo `L_p`; therefore it must be handled case by case rather than silently folded
into the modulo-`L_p` support subgroup.

## 7. Genus/class-group frontier

The primitive representation

```text
K_p=A_p^2+L_pB_p^2
```

places the problem in the principal class of a binary quadratic form of discriminant roughly
`-4L_p`.  A target divisor port asks for a very special factorization of that represented
integer.  Three increasingly strong algebraic questions arise:

1. **genus obstruction:** do genus characters forbid a divisor in the target affine class?
2. **class-group orientation:** can the split prime ideals be partitioned so that the selected
   rational divisor has the required residue?
3. **principal/prime output:** do the resulting affine quotients `q,s,r` become rational primes?

The first may produce inexpensive no-go theorems.  The second is a structured subset-product
problem in a class group or ray class group.  The third remains a prime-values problem.

## 8. Connection with the Fourier support obstruction

The divisor-residue subgroup theorem works in

```text
(Z/L_p Z)^x.
```

The norm theorem says that the prime factors supplied to that subgroup are already restricted
to a Chebotarev splitting set for `Q(sqrt(-L_p))`.  Therefore the factor-residue distribution is
not generic.

A future positive theorem should exploit, rather than ignore, the joint structure:

```text
split prime residues
+ principal norm relation
+ target square-root residue
+ complement symmetry.
```

A future negative theorem may arise from a genus character which is simultaneously:

```text
trivial on every available split-factor orientation,
nontrivial on the required target port.
```

## 9. Honest classification

Established:

```text
K_p AS A PRIMITIVE QUADRATIC NORM — PROVED
COPRIMALITY OF K_p WITH L_p x p — PROVED
ALL ODD PRIME FACTORS SPLIT IN Q(sqrt(-L_p)) — PROVED
NORM / PORT-ORIENTATION SEPARATION — STRUCTURAL MAP
```

Open:

```text
RAY-CLASS OR GENUS PARAMETERIZATION OF TARGET DIVISORS
UNIFORM FACTOR-ORIENTATION THEOREM IN THE MOVING QUADRATIC FAMILY
E307 PRIME COMPLETION
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this note.
