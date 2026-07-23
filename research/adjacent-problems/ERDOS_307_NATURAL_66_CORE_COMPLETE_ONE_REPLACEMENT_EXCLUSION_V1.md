# Erdős 307: complete one-replacement exclusion around the natural 66-prime core

**Programme:** `E306-RL-ADJ-24`  
**Status:** `EXACT BOUNDED COMPUTATIONAL CERTIFICATE / DIAGNOSTIC ONLY`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

A standard-coordinate core-30 candidate is an odd squarefree integer `N` with

```text
N-D(N)=900
```

and at least `67` prime factors.  Deleting one final prime from such an `N` leaves a positive-defect
`66`-prime cofactor.  This note completely tests the most natural one-replacement family around the
first `66` admissible primes.

The result is stronger than a bounded prime search: every relevant real terminal window is fully
enumerated, and no integer terminal pair exists.

## 2. Natural overfull state

Let `S_66` be the first `66` primes different from `2,3,5`:

```text
7,11,13,...,347.
```

Put

```text
H_0=product_(p in S_66)p.
```

The exact reciprocal sum satisfies

```text
sum_(p in S_66)1/p>1,
```

so

```text
delta(H_0)=H_0-D(H_0)<0.
```

Thus `H_0` itself cannot be extended multiplicatively to a positive defect.

## 3. Remove one natural prime

For every `u in S_66`, define

```text
B_u=H_0/u,
c_u=delta(B_u)>0.
```

The positivity follows because the first `65` admissible reciprocal terms remain below one after
any one of the first `66` primes is deleted.

Seek two new distinct positive integers `q<=t`, disjoint from `B_u`, such that

```text
delta(B_u q t)=900.                                (3.1)
```

The terminal equation is

```text
c_u q t-B_u(q+t)=900,                              (3.2)
```

or

```text
(c_u q-B_u)(c_u t-B_u)=B_u^2+900c_u.               (3.3)
```

## 4. Complete finite window

Positivity and the ordering `q<=t` force

```text
B_u/c_u<q<={B_u+sqrt(B_u^2+900c_u)}/c_u.            (4.1)
```

For the smallest removed primes the exact integer windows begin as follows:

```text
u=7:   8<=q<=14,
u=11: 12<=q<=22,
u=13: 14<=q<=26,
u=17: 18<=q<=34,
u=19: 20<=q<=38,
u=23: 24<=q<=47,
u=29: 31<=q<=60,
u=31: 33<=q<=64.
```

All `66` windows were enumerated over every integer `q`, not only primes.  For each `q`, the unique
candidate

```text
t={B_u q+900}/{c_u q-B_u}                           (4.2)
```

was tested for integrality.

### Theorem 4.1 — complete exclusion

Across all `66` removed primes and all integers in the exact windows `(4.1)`, there is no integer
pair `(q,t)` satisfying `(3.2)`.

Consequently no defect-900 number is obtained by:

```text
keep 65 primes from S_66,
replace the omitted natural prime by two arbitrary new factors.
```

The exclusion occurs before primality, squarefreeness of the terminal factors, the distinguished
factor `31`, or the final E307 output-prime test.

## 5. Defect-spectrum interpretation

For a hypothetical solution, the factors

```text
c_u q-B_u,
c_u t-B_u
```

would be the two intermediate defects

```text
delta(B_uq),
delta(B_ut).
```

The computation therefore says that none of the `66` natural 65-prime cofactors has an admissible
intermediate-defect factor in its complete terminal box.

This is a bounded divisor-code support obstruction, not evidence for general nonexistence.

## 6. Relation to previous diagnostics

Previous exact searches established:

1. no one-, two-, or three-factor repair of the explicit positive-return relay;
2. no integer closure for the natural support-65 block;
3. no integer closure across `12,020` one-boundary-replacement support-65 blocks.

The present certificate treats the symmetric family obtained by deleting every possible prime from
the natural overfull 66-prime state and then allowing two unrestricted terminal integers.  It is
complete for that family.

## 7. Research consequence

The natural reciprocal ordering does not accidentally solve the multiplicative syndrome.  Even at
the exact minimum support layer, successful blocks must be designed through their defect and
syndrome data rather than obtained by a local replacement of the smallest admissible primes.

The next useful unit is a distant block-collision theorem or construction, not a larger natural
cutoff.

## 8. Classification

```text
NATURAL 66-PRIME OVERFULL STATE — IDENTIFIED
ALL 66 ONE-DELETION COFACTORS — POSITIVE DEFECT
ALL EXACT TWO-FACTOR TERMINAL WINDOWS — ENUMERATED
INTEGER TERMINAL PAIRS — NONE
GENERAL DEFECT-900 EXISTENCE — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

This is a bounded research diagnostic.  It changes no released E306 theorem, manuscript, Lean
authority, review status, DOI, arXiv status, or canonical project status.
