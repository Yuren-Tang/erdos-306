# Erdős 307: return-defect stratification and the two-step contraction frontier

**Programme:** `E306-RL-ADJ-14`  
**Status:** `GENERAL DEFECT IDENTITY / PARTIAL OBSTRUCTION / COMPUTATIONAL FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The exact E307 equation is a period-two equation for the arithmetic derivative.  A natural
obstruction question is whether the squarefree deficient side can ever return far enough on the
second derivative step.

This note separates three statements:

```text
STRONG ONE-STEP INVARIANCE:
  D(Y)<Y and Y,D(Y) squarefree
  =>D^2(Y)<D(Y);

WEAK TWO-STEP CONTRACTION:
  D(Y)<Y and Y,D(Y) squarefree
  =>D^2(Y)<Y;

EXACT TWO-CYCLE:
  D^2(Y)=Y.
```

The strong statement is false.  The weak statement remains an open strengthening of a negative
answer to E307 and has no counterexample in the computation recorded below.

## 2. One-sided forcing notation

Let `Y>1` be squarefree and put

```text
X=D(Y).
```

Assume that `X` is also squarefree and

```text
X<Y.                                               (2.1)
```

Define reciprocal masses

```text
beta =D(Y)/Y=X/Y=sum_(q|Y)1/q,
alpha=D(X)/X    =sum_(p|X)1/p.                     (2.2)
```

Then

```text
D^2(Y)/Y=alpha beta.                               (2.3)
```

Thus the weak contraction statement is exactly

```text
alpha beta<1.                                      (2.4)
```

An E307 cycle with `X<Y` is exactly equality in `(2.4)`.

## 3. Strong invariance is false

Take

```text
Y=29861=13*2297.
```

Then

```text
D(Y)=13+2297=2310=2*3*5*7*11,
```

which is squarefree and much smaller than `Y`.  However

```text
D(2310)=2927>2310.
```

Therefore the implication

```text
D(Y)<Y =>D^2(Y)<D(Y)
```

fails even in the squarefree-to-squarefree regime.

The relevant mechanism, if one exists, is not forward invariance of the deficient set.  It is
contraction of the two-step product `alpha beta`.

## 4. Exact local-return layer

The congruence

```text
D(X) congruent Y mod X                             (4.1)
```

is equivalent, because `X` is squarefree, to the primewise conditions

```text
pY congruent X mod p^2        for every p|X.       (4.2)
```

Indeed,

```text
D(X) congruent X/p mod p,
```

so `(4.1)` modulo `p` is equivalent to

```text
Y congruent X/p mod p,
```

which is `(4.2)`.

Whenever `(4.1)` holds, define the integer return defect

```text
k={D(X)-Y}/X in Z.                                 (4.3)
```

Then

```text
D(X)=Y+kX.                                         (4.4)
```

The layers have the interpretations

```text
k=0:
  exact E307 return;

k<0:
  second derivative undershoots Y by |k| copies of X;

k>0:
  second derivative overshoots Y by k copies of X.
```

## 5. Return-defect mass identity

Since `beta=X/Y`, equation `(4.4)` gives

```text
alpha=D(X)/X=Y/X+k=beta^(-1)+k.                   (5.1)
```

Therefore the reciprocal mass of the complete union `U=XY` is

```text
s(U)
 =alpha+beta
 =beta+beta^(-1)+k.                               (5.2)
```

### Theorem 5.1 — defect-layer mass bound

For `0<beta<1`:

```text
s(U)>2+k.                                          (5.3)
```

In particular:

```text
k=0 => s(U)>2;
k>=1 => s(U)>3;
k>=m => s(U)>2+m.                                (5.4)
```

#### Proof

The strict arithmetic-geometric mean inequality gives

```text
beta+beta^(-1)>2
```

because `beta!=1`.  Add `k`. `square`

### Interpretation

The absence of nonnegative integer return defects in small computation is not surprising.
A `k=0` state already requires enough distinct primes for their reciprocal sum to exceed `2`.
A positive defect requires the much more extreme threshold `2+k`.

For all primes allowed, the sum of the reciprocals of the first `58` primes is less than `2`,
while including the `59`th prime `277` makes it exceed `2`.  Thus the mass condition alone needs
at least `59` prime factors; the additional parity restrictions raise the familiar E307 lower
bound to at least `60` in the unrestricted case.

For an odd union, the first `1411` odd primes have reciprocal sum below `2`, while the first
`1412`, ending at `11789`, exceed `2`.  Hence an odd--odd cycle would require at least `1412`
prime factors from the reciprocal-mass condition alone.

The `k>=1` threshold `s(U)>3` is vastly more expensive: the reciprocal sum of all primes first
exceeds `3` only after hundreds of thousands of prime factors.  This explains why positive
integer return defects are invisible at ordinary computational scales without proving that they
never occur.

## 6. Relationship with Bado's local conditions

Assume the exact one-sided equation

```text
D(Y)=X.                                            (6.1)
```

For every prime `q|Y`, reducing `(6.1)` modulo `q` gives

```text
qX congruent Y mod q^2.                            (6.2)
```

If the return congruences `(4.2)` also hold, then for every prime `ell|XY` the union quotient

```text
(XY/ell | ell)
```

is a quadratic residue:

- if `ell=p|X`, then
  ```text
  (XY/p)=(X/p)Y congruent Y^2 mod p;
  ```
- if `ell=q|Y`, then
  ```text
  (XY/q)=X(Y/q) congruent X^2 mod q.
  ```

Thus the implication hierarchy is

```text
one-sided exact forcing D(Y)=X
+ exact return congruences D(X)=Y mod X
  => union Legendre constraints of Bado.            (6.3)
```

The converse is false in general: the Legendre conditions remember only quadratic-residue
classes, whereas `(4.2)` is an exact cofactor congruence.

Bado's weighted union model therefore counts a weaker local envelope around the integer-return
layers.  Its expected abundance is compatible with the possibility that the exact quotient
condition `k=0` remains much rarer.

## 7. Computational evidence

An exact Wolfram-language enumeration tested all squarefree

```text
2<=Y<=500000
```

for which

```text
X=D(Y)
```

is squarefree, coprime to `Y`, and `X<Y`.

The results were:

```text
number of deficient squarefree-to-squarefree pairs: 173781;
number with D^2(Y)>=Y:                              0;
number with D^2(Y)>=D(Y):                           2582.
```

Thus the strong statement has many counterexamples, while the weak two-step contraction had no
counterexample in this range.

The maximum observed value of

```text
D^2(Y)/Y
```

in the broader squarefree-to-squarefree sample through `500000` was approximately

```text
0.5272717618,
```

attained at

```text
Y=282490=2*5*13*41*53,
X=D(Y)=231693=3*7*11*17*59,
D(X)=148949.
```

This evidence has no exclusion force for E307.

A separate enumeration through `Y<=300000` found only `38` cases satisfying the exact return
congruence `(4.1)`.  Every one had negative return defect `k`; none had `k=0` or `k>0`.
Again, Theorem 5.1 explains why nonnegative layers have a much larger support threshold.

## 8. The contraction conjecture

### Conjecture 8.1 — squarefree arithmetic-numerator contraction

If

```text
Y squarefree,
X=D(Y) squarefree,
0<X<Y,
```

then

```text
D(X)<Y.                                            (8.1)
```

Equivalently,

```text
(sum_(q|Y)1/q)(sum_(p|D(Y))1/p)<1.                (8.2)
```

This conjecture is stronger than a negative answer to E307.  It must not be presented as an
established theorem.

## 9. Exact remaining difficulty

The conjecture is trivial when

```text
D(X)<=X,
```

so the only hard regime is

```text
D(Y)=X<Y,
D(X)>X.                                            (9.1)
```

That is, a deficient squarefree denominator has a squarefree numerator which is itself
nondeficient, but not nondeficient enough to recover the original denominator.

The example `Y=29861`, `X=2310` shows this regime is nonempty.  The desired inequality is the
quantitative gap

```text
1<D(X)/X<Y/X.                                     (9.2)
```

The programme should therefore seek a relation between:

1. the exact numerator equation `D(Y)=X`;
2. the small-prime core required for `D(X)/X>1`;
3. the reciprocal-zero-sum congruences imposed on the primes of `Y` by every small prime of `X`;
4. a lower bound for `Y/X` forced by those simultaneous congruences.

This is a global numerator-factorization problem.  Bado's union Legendre constraints are a useful
outer sieve but do not by themselves supply the required quantitative gap.

## 10. Research ranking after the defect split

```text
HIGHEST UPSIDE:
  prove Conjecture 8.1 or a strong enough partial contraction theorem;

MOST CONCRETE CONSTRUCTION:
  find nonambient residual-port-pencil intersections whose closure quadratic has two prime roots;

MOST TRACTABLE ANALYTIC SIDE RESULT:
  prove unconditional cancellation or collision bounds in Bado's union-character model;

LOWEST VALUE:
  add further local congruences without connecting them to either contraction or construction.
```

## 11. Honest classification

```text
RETURN-DEFECT IDENTITY — PROVED
DEFECT-LAYER UNION-MASS LOWER BOUND — PROVED
EXACT RETURN CONGRUENCE => BADO LEGENDRE CONDITIONS — PROVED
STRONG DEFICIENT FORWARD-INVARIANCE — FALSE
WEAK TWO-STEP CONTRACTION — OPEN / COMPUTATIONALLY SUPPORTED ONLY
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, or canonical project
status is changed by this note.
