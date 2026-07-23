# Erdős 307: defect-900 standardization and no one-prime inheritance

**Programme:** `E306-RL-ADJ-19`  
**Status:** `GENERAL EQUIVALENCE / INHERITANCE OBSTRUCTION / CONSTRUCTION INTERFACE`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The core-30 residual port is

```text
30Y-31D(Y)=900.
```

Multiplying the opposite side by the prime `31` converts this moving-coefficient equation into a
standard near-fixed-point equation.  The resulting coordinate identifies the core-30 E307 problem
with a defect-`900` primary-pseudoperfect / Sondow-type problem carrying one affine prime-output
constraint.

The same coordinate also exposes a sharp difference from ordinary primary pseudoperfect numbers:
for every defect `C>1`, squarefree solutions admit no one-prime inheritance preserving `C`.

## 2. Standard defect-900 coordinate

Let `Y` be squarefree, coprime to `30*31`, and put

```text
N=31Y.                                              (2.1)
```

Since `31` is prime and does not divide `Y`,

```text
D(N)=D(31Y)=Y+31D(Y).                               (2.2)
```

### Theorem 2.1 — standardization

```text
30Y-31D(Y)=900
```

if and only if

```text
N-D(N)=900.                                         (2.3)
```

#### Proof

Using `(2.1)--(2.2)`,

```text
N-D(N)
 =31Y-{Y+31D(Y)}
 =30Y-31D(Y).
```

`square`

Thus the fixed port

```text
(c,R,target)=(30,31,900)
```

is the composition of the standard port

```text
(c,R,target)=(1,1,900)
```

with the prime factor `31`.

## 3. Exact E307 criterion in standard form

### Theorem 3.1

A core-30 E307 cycle exists with sides

```text
30r,
Y
```

if and only if there is a squarefree integer `N` such that:

1. `31|N` and `31^2` does not divide `N`;
2. `N-D(N)=900`;
3. `N/31` is coprime to `30`;
4. the integer
   ```text
   r=(N-930)/961                                  (3.1)
   ```
   is a prime disjoint from `N`.

#### Proof

Put `Y=N/31`.  Theorem 2.1 gives the core-30 residual equation.  The core-cycle equivalence gives

```text
r=(Y-30)/31
  =(N-930)/961.
```

The remaining conditions are exactly squarefreeness, disjointness, and primality. `square`

## 4. Reciprocal form

For squarefree `N`, equation `(2.3)` is

```text
sum_(p|N)1/p
 =1-900/N.                                         (4.1)
```

Equivalently,

```text
900+sum_(p|N)N/p=N.                                (4.2)
```

This is a quotient-one `900`-Sondow / generalized primary-pseudoperfect equation.

The core-30 support theorem says that an E307-eligible solution in this coordinate must have

```text
omega(N)>=67,
```

with one distinguished factor `31` and at least `66` factors in `Y`.

## 5. Local coprimality for every positive defect

Let `C>0` and suppose squarefree `N` satisfies

```text
N-D(N)=C.                                          (5.1)
```

### Lemma 5.1 — defect coprimality

```text
gcd(N,C)=1.                                        (5.2)
```

#### Proof

Let `p|N`.  Since `N` is squarefree,

```text
D(N) congruent N/p mod p,
```

and `N/p` is nonzero modulo `p`.  Reducing `(5.1)` modulo `p` gives

```text
C congruent -N/p mod p,
```

so `p` does not divide `C`.  This holds for every `p|N`. `square`

### Core-30 consequence

Every squarefree defect-`900` solution avoids

```text
2,3,5.
```

The E307 subfamily additionally requires the distinguished factor `31`.

## 6. No one-prime same-defect inheritance for `C>1`

Suppose squarefree `N` satisfies `(5.1)` and let `q` be a prime not dividing `N`.  Then

```text
Nq-D(Nq)
 =Nq-{qD(N)+N}
 =q{N-D(N)}-N
 =qC-N.                                            (6.1)
```

### Theorem 6.1 — inheritance obstruction

If `C>1`, there is no new prime `q` such that

```text
Nq-D(Nq)=C.                                        (6.2)
```

#### Proof

Equations `(6.1)--(6.2)` imply

```text
qC-N=C,
```

or

```text
N=C(q-1).                                          (6.3)
```

Thus `C|N`, contradicting Lemma 5.1 because `C>1`. `square`

### Contrast with defect one

For `C=1`, equation `(6.3)` becomes

```text
q=N+1,
```

which is the classical one-prime inheritance rule for primary pseudoperfect numbers.  Hence the
familiar chains

```text
2 -> 6 -> 42 -> 1806 -> ...
```

are a special defect-one phenomenon and cannot occur at defect `900`.

## 7. Consequence for E307 construction

A core-30 E307 candidate `N=31Y` is necessarily one-prime primitive relative to the fixed
defect-`900` equation.  It cannot be obtained from a smaller defect-`900` solution by multiplying
one additional prime.

Therefore the viable mechanisms are:

1. genuinely multi-prime port fillings;
2. residual-port composition by nontrivial blocks;
3. two-prime or larger terminal divisor factorizations;
4. meet-in-the-middle construction inside the 67-factor near-fixed-point layer;
5. nonambient pencils imported from defect-one or other block libraries.

The obstruction explains why local one- and two-factor repairs of the explicit positive-defect
relay are sparse.  It does not rule out multi-prime exact fillings.

## 8. Standard port tree

For the standard operator

```text
Phi(B)=B-D(B),
```

a partial squarefree block `Q` has state

```text
(Q,a_Q),
a_Q=Q-D(Q).                                       (8.1)
```

Appending a prime `q` gives

```text
(Q,a_Q)
 ->(Qq, q a_Q-Q).                                  (8.2)
```

The success condition is

```text
a_Q=900.                                           (8.3)
```

If one final prime remains, it is uniquely

```text
q=(900+Q)/a_Q.                                     (8.4)
```

If two primes `q,t` remain, then

```text
(a_Qq-Q)(a_Qt-Q)=Q^2+900a_Q.                       (8.5)
```

These are the standard-coordinate versions of the core-30 terminal formula and divisor port.

## 9. Small diagnostic

An exact local sieve through `N<=2,000,000` found no squarefree solution of

```text
N-D(N)=900.
```

This has no exclusion force.  The core-30 support theorem already places an E307-eligible solution
in a 67-prime layer far outside this numerical range.

## 10. Classification

```text
CORE-30 RESIDUAL-900 PORT <=> STANDARD DEFECT-900 NEAR-FIXED POINT — PROVED
DEFECT COPRIMALITY gcd(N,C)=1 — PROVED
ONE-PRIME SAME-DEFECT INHERITANCE FOR C>1 — IMPOSSIBLE
DEFECT-ONE INHERITANCE — EXCEPTIONAL
CORE-30 E307 CANDIDATE — MUST BE MULTI-PRIME PORT-PRIMITIVE
EXACT DEFECT-900 SOLUTION WITH E307 OUTPUT PRIME — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

Primary pseudoperfect numbers and defect-one port fillings are prior literature.  This note records
the exact defect-900 E307 interface and the elementary but structurally decisive inheritance
obstruction.  No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv,
submission, or canonical status is changed.