# Erdős 307: literature attribution correction and Bado interface

**Programme:** `E306-RL-ADJ-13`  
**Status:** `ATTRIBUTION CORRECTION / NOVELTY-BOUNDARY AUDIT / RESEARCH ONLY`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Mandatory correction

The preceding E306-RL adjacent-problem notes independently derived the equivalence

```text
Erdos 307
  <=> coprime squarefree x,y with D(x)=y and D(y)=x.
```

This mathematical statement is correct, but it is not a new 2026-07 discovery of this programme.
A prior preprint by Idriss Olivier Bado,

> *Structural Constraints for an Erdős Unit-Fraction Problem over Primes*, May 2026,
> DOI `10.13140/RG.2.2.32245.54245`,

already proves the equivalent forcing identities

```text
A(P)=M(Q),
A(Q)=M(P),
```

where

```text
M(P)=product_(p in P)p,
A(P)=sum_(p in P)M(P)/p.
```

For squarefree `x=M(P)`, one has `A(P)=D(x)`.  Thus Bado's forcing theorem is exactly the
arithmetic-derivative two-cycle theorem in prime-set notation.

Accordingly:

```text
ARITHMETIC-DERIVATIVE TWO-CYCLE REFORMULATION
  = PRIOR ART / EQUIVALENT RESTATEMENT / INDEPENDENT RECONSTRUCTION,
  not a novelty claim of E306-RL.
```

All future summaries must attribute the forcing/two-cycle theorem to the prior Bado preprint or
state that the programme independently reconstructed an already available result.

## 2. Prior structural results in the May 2026 preprint

The May preprint records, among other things:

1. reduced reciprocal sums and `gcd(A(P),M(P))=1`;
2. the exact forcing identities `A(P)=M(Q)`, `A(Q)=M(P)`;
3. disjointness and one-sided determination of the opposite prime set;
4. the two-cycle map on finite prime sets;
5. the valuation fingerprint of the two reciprocal sums;
6. cross-product congruences;
7. reciprocal zero-sum congruences modulo every opposite prime;
8. parity restrictions;
9. a union discriminant condition;
10. a primitive Pythagorean form attached to the union;
11. an exact one-sided verification test;
12. an approximation theorem showing that products of disjoint reciprocal-prime sums may
    approach `1` arbitrarily closely.

These items must not be presented as new consequences of the current programme without a
specific theorem-by-theorem distinction.

In particular, the following earlier E306-RL labels require attribution downgrading:

```text
E307 TWO-CYCLE EQUIVALENCE;
MUTUAL RECIPROCAL-SYNDROME NECESSITY;
BASIC PARITY CONSEQUENCES;
ONE-SIDED NUMERATOR MAP;
BASIC UNION DISCRIMINANT / SQUARE CONDITION.
```

## 3. Prior local quadratic-residue model

A second preprint by the same author,

> *A Weighted Model for Quadratic-Residue Constraints in Arithmetic-Derivative Two-Cycles*,
> June 2026, DOI `10.13140/RG.2.2.12146.88006`,

studies the odd, squarefree, coprime reduction at the level of the union

```text
U=xy.
```

For every prime `ell|U`, it records the necessary condition

```text
(U/ell | ell)=1,
```

where the right side is a Legendre symbol.  The paper:

1. expands the local indicators into exact quadratic-character sums;
2. identifies the weighted model with weights `2^(-omega(U))` as the diagonal contribution,
   not a pointwise majorant;
3. isolates the full-support mode by quadratic reciprocity;
4. reduces the desired counting estimate to off-diagonal cancellation;
5. records conditional large-sieve/collision routes;
6. proves the weighted model has order `X/sqrt(log X)`.

The preprint explicitly does not prove the full cancellation estimate and does not solve the
existence problem.

### Interface consequence

The E306-RL local/genus work must now be divided into:

```text
ALREADY COVERED IN SPIRIT OR FORM:
  union-level Legendre necessary conditions;
  quadratic-character expansion as a counting mechanism;
  need for off-diagonal cancellation;

POTENTIALLY DISTINCT, SUBJECT TO DEDICATED AUDIT:
  prefix-dependent congruence modulo y^2;
  PGL_2 Möbius port involution;
  real/modular boundary coincidence;
  moving quadratic field attached to K_p;
  target-divisor characters in (Z/L_p Z)^x rather than union indicators.
```

No novelty should be claimed for the second list until the full texts and dependencies are
compared theorem by theorem.

## 4. Candidate contributions not located in the two Bado preprints

A text-level and structural comparison did not locate the following mechanisms in the May and
June preprints:

1. bilateral defect coordinates and their semigroup action;
2. anti-inheritance of a closed derivative two-cycle;
3. rational arithmetic-jet transfer matrix between two fillers;
4. semiprime-jet discriminant transfer;
5. square-modulus PGL_2 port involution;
6. the same Möbius map as real zero-deficit boundary, modular partner, and derivative height;
7. general deficit determinant identity;
8. seeded reduction to a scalar residual-`C` port equation;
9. automatic positivity and integrality of the final bilateral output;
10. the general residual-`C` port composition law and E313 bridge;
11. residual-port affine pencils and exact gcd law;
12. seeded cubic divisor-port factorization;
13. primitive quadratic norm interpretation of the cubic value;
14. bounded divisor-code support and moving genus obstruction;
15. paired quotient-one `+-h`-Sondow diagonal;
16. block-first two-prime product/sum closure;
17. exact seed-curve / residual-port-pencil intersection theorem.

This is only a provisional negative comparison.  Absence of search terms is not a novelty proof.
A publication-level claim requires a dedicated literature audit across arithmetic derivative,
primary pseudoperfect/port filling, mu-Sondow, Giuga, quadratic norm, and divisor-distribution
literatures.

## 5. Relationship between the Bado union criterion and block closure

Bado's union discriminant says that for a complete union `U=P union Q`,

```text
A(U)^2-4M(U)^2
```

must be a square, and the two side products are recovered from its two square roots.

The E306-RL block-first two-prime closure instead fixes:

```text
one full side Y,
one partial opposite product x,
```

and recovers the two missing opposite primes through

```text
P=D(Y)/x,
S={xY-D(x)D(Y)}/x^2,
z^2-Sz+P=0.
```

Both are Vieta/discriminant mechanisms, so a conceptual relationship is expected.  The
block-first theorem should not be advertised as unrelated to the prior union discriminant.  Its
potentially distinct content is the partial-prefix completion, exact divisibility gates, and
port-pencil intersection interpretation.

## 6. Corrected novelty hierarchy

```text
TIER A — PRIOR ART / MUST ATTRIBUTE
  forcing identities;
  two-cycle reformulation;
  one-sided numerator map;
  valuation and basic reciprocal congruences;
  union discriminant and Pythagorean structure;
  union-level quadratic-residue constraints;
  weighted character-counting model.

TIER B — INDEPENDENT MECHANISM, NOVELTY UNRESOLVED
  bilateral defects;
  jet transfer;
  port involution;
  residual-C port calculus;
  E313 transfer pencils;
  cubic norm/divisor code;
  block-first closure;
  paired Sondow diagonal.

TIER C — OPEN MATHEMATICS
  E307 existence or nonexistence;
  deficient-squarefree forward invariance;
  constructive nonambient pencil intersection;
  targeted divisor-code mixing;
  prime-pair splitting on the closure quadratic.
```

## 7. Trust boundary

The two Bado documents are ResearchGate preprints with DOIs and author-uploaded full text.  The
ResearchGate pages mark them as early-stage work which may not have been peer reviewed.  No arXiv
copy was located in the initial search.  They are nevertheless clear prior public disclosures and
must be treated as attribution authority unless superseded or invalidated by a later audit.

This correction changes attribution and research prioritization only.  It does not change any
released E306 proof, manuscript, Lean authority, review status, DOI, or canonical result.

## 8. Corrected status

```text
E307 <=> PRIME-SET / ARITHMETIC-DERIVATIVE TWO-CYCLE
  — PRIOR BADO RESULT; INDEPENDENTLY RECONSTRUCTED HERE.

UNION LEGENDRE MODEL
  — PRIOR BADO RESULT / CONDITIONAL OFF-DIAGONAL FRONTIER.

PORT / JET / RESIDUAL-C / NORM-DIVISOR / BLOCK-CLOSURE PROGRAMME
  — MATHEMATICALLY PROVED INTERNALLY WHERE MARKED;
    NOVELTY NOT YET INDEPENDENTLY AUDITED.

E307 EXISTENCE OR NONEXISTENCE
  — OPEN.
```
