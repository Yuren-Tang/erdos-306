# Erdős 307: defect-exchange determinant and low-swap rigidity

**Programme:** `E306-RL-ADJ-20`  
**Status:** `GENERAL IDENTITY / SHARED-SUPPORT RIGIDITY / EXACT COMPUTATIONAL CERTIFICATE`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The explicit core-30 relay produces a squarefree standard-coordinate state

```text
N_0=31Y_0
```

with negative defect

```text
c_0=N_0-D(N_0)<900.
```

The exact E307 target in this coordinate is defect `900`.

Direct one-, two-, and three-factor replacements of the relay did not reach defect `900`.  This
note extracts the mechanism behind that sparsity: two squarefree defect states sharing a large
prime block satisfy an exact cross-derivative determinant identity.  In particular the shared
block divides a small expression involving only the removed and inserted blocks.

## 2. Setup

Let `H,R,M` be pairwise coprime squarefree positive integers and put

```text
N=HR,
N'=HM.                                              (2.1)
```

Define their defects

```text
c=N-D(N),
C=N'-D(N').                                        (2.2)
```

The block `H` is the shared support, `R` is removed, and `M` is inserted.

## 3. Defect-exchange determinant

### Theorem 3.1

```text
cM-CR
 =H{R D(M)-M D(R)}.                                (3.1)
```

#### Proof

By the product rule,

```text
c
 =HR-{R D(H)+H D(R)}
 =R{H-D(H)}-H D(R),
```

and similarly

```text
C
 =M{H-D(H)}-H D(M).
```

Therefore

```text
cM-CR
 =RM{H-D(H)}-HM D(R)
  -RM{H-D(H)}+HR D(M)
 =H{R D(M)-M D(R)}.
```

`square`

### Corollary 3.2 — shared-support divisibility

```text
H divides cM-CR.                                    (3.2)
```

This is also visible primewise.  For every `p|H`, squarefreeness gives

```text
c congruent -N/p mod p,
C congruent -N'/p mod p.
```

Multiplying by `M` and `R` respectively yields

```text
cM congruent CR mod p.
```

Since `H` is squarefree, `(3.2)` follows.

## 4. Reciprocal interpretation

Dividing `(3.1)` by `HRM` gives

```text
c/(HR)-C/(HM)
 =D(M)/M-D(R)/R.                                   (4.1)
```

Thus changing the global defect while keeping `H` fixed is exactly equivalent to changing the
reciprocal mass of the exchanged block.

If

```text
c<0<C,
```

then `(3.1)` becomes

```text
|c|M+CR
 =H{M D(R)-R D(M)}                                 (4.2)
```

and in particular

```text
H divides |c|M+CR.                                 (4.3)
```

The inserted block must have smaller reciprocal mass than the removed block:

```text
D(M)/M<D(R)/R.                                     (4.4)
```

The large shared support therefore acts as an arithmetic code modulus for low-Hamming-distance
repairs.

## 5. Application to the positive-defect relay

Let `N_0=31Y_0` be the standard-coordinate integer from the explicit Giuga-core relay.  Its exact
defect is

```text
c_0=N_0-D(N_0)
 =-158990433555505940912358982290100646146657266397518611627727828881817579254577059499321543702364659459573799087005024090531581351072715272760.
```

It has `67` distinct prime factors:

```text
31,
65 primes in Q,
and t=5624273.
```

The target is

```text
C=900.                                              (5.1)
```

If an exact defect-900 candidate is obtained by replacing a block `R` of relay factors by a new
squarefree block `M`, while retaining `H=N_0/R`, then necessarily

```text
H divides |c_0|M+900R.                              (5.2)
```

This congruence is imposed simultaneously by every retained prime.

## 6. Exact one-swap formula

Take `R=u` and `M=v`, where `u` is one relay prime and `v` is a new prime.  Solving `(3.1)` for `v`
gives the unique rational candidate

```text
v
 =u{900u+N_0}/{c_0u+N_0}.                         (6.1)
```

All `67` relay factors were tested exactly.  No candidate was a positive integer distinct from the
retained support.

Thus no one-factor replacement reaches defect `900`.

## 7. Exact two-swap search

Remove two non-`31` relay factors `u,v`, leaving

```text
H=N_0/(uv),
a_H=H-D(H)>0.
```

Let the two new primes be `q<=t`.  The standard defect-900 port equation is

```text
a_H qt-H(q+t)=900.                                 (7.1)
```

Equivalently,

```text
(a_Hq-H)(a_Ht-H)=H^2+900a_H.                       (7.2)
```

For fixed `H`, positivity and `q<=t` restrict `q` to the exact finite interval

```text
H/a_H<q<={H+sqrt(H^2+900a_H)}/a_H.                 (7.3)
```

The complete calculation used:

```text
number of removal pairs:       C(66,2)=2145;
prime q candidates tested:     31457;
integer terminal candidates:   0.
```

Hence no two-factor replacement reaches defect `900`.

## 8. Exact three-swap search

Remove three non-`31` relay factors and write the remaining block as `H`, with

```text
a_H=H-D(H)>0.
```

Seek ordered new primes

```text
q<=s<=t.
```

After adjoining `q`, the state is

```text
H_1=Hq,
a_1=a_Hq-H.
```

The remaining two primes satisfy

```text
(a_1s-H_1)(a_1t-H_1)=H_1^2+900a_1.                (8.1)
```

The first prime is bounded because the normalized terminal equation gives

```text
a_H
 <=3H/q+900/q^3.                                   (8.2)
```

For every removal triple, the implemented upper endpoint

```text
q<=floor(3H/a_H)+2
```

was independently certified by the exact inequality

```text
a_H q^3>3Hq^2+900
```

at the next integer.  Thus the search was complete.

The exact calculation used:

```text
number of removal triples:     C(66,3)=45760;
first-prime states tested:      68368;
ordered prime-pair states:      305587;
integer terminal candidates:   0.
```

Hence no three-factor replacement reaches defect `900`.

## 9. Interpretation

The failure of low swaps is not evidence for nonexistence of a defect-900 state.  It says that the
explicit positive-defect relay and any exact zero are separated by a genuine arithmetic-code
distance.

The retained block `H` forces the exchange relation

```text
c_0M congruent 900R mod H.                         (9.1)
```

When only a few primes are changed, `M` and `R` have low multiplicative complexity while `H`
contains more than sixty independent prime moduli.  The replacement must solve all of those local
conditions simultaneously.

This is the multiplicative analogue of a high-distance code constraint.

## 10. New construction implication

A successful exact-zero construction should not be expected from local perturbation of the relay.
The viable mechanisms are instead:

1. replace a genuinely large block of factors;
2. construct the target port from both ends by meet-in-the-middle;
3. use residual-port pencils whose shared-support congruences are built in;
4. design a new relay with target-compatible local syndromes from the outset;
5. exploit divisor-code mixing across many inserted factors.

The positive-defect relay remains valuable as a proof that the sign can cross and as a minimal
support template, but not as a point from which Hamming-distance `<=3` repair is possible.

## 11. Classification

```text
DEFECT-EXCHANGE DETERMINANT — PROVED
SHARED-SUPPORT DIVISIBILITY — PROVED
RECIPROCAL-MASS EXCHANGE LAW — PROVED
ONE-SWAP REPAIR OF EXPLICIT RELAY — IMPOSSIBLE / EXACT CHECK
TWO-SWAP REPAIR — IMPOSSIBLE / COMPLETE EXACT CHECK
THREE-SWAP REPAIR — IMPOSSIBLE / COMPLETE EXACT CHECK
FOUR-OR-MORE / GLOBAL BLOCK REPAIR — OPEN
E307 EXACT ZERO DEFECT — OPEN
```

The computational exclusions are bounded statements about the explicit relay, not general E307
no-go results.  No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv,
submission, or canonical status is changed.