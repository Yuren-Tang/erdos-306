# Erdős 307: return-defect stratification after the contraction counterexample

**Programme:** `E306-RL-ADJ-14`  
**Status:** `GENERAL DEFECT IDENTITY / CONTRACTION CONJECTURE RETRACTED`  
**Date:** 2026-07-23  
**Authority:** research only

## 0. Mandatory correction

The original version of this note proposed the conjecture

```text
Y squarefree,
D(Y) squarefree,
0<D(Y)<Y
  => D^2(Y)<Y.
```

This conjecture is false.

An explicit squarefree counterexample is proved and independently verified in

```text
research/adjacent-problems/
ERDOS_307_GIUGA_CORE_RELAY_AND_TWO_STEP_CONTRACTION_COUNTEREXAMPLE_V1.md
```

There one has squarefree integers `Y,Z=D(Y)` with

```text
Z<Y<D(Z).
```

Consequently all earlier statements describing weak two-step contraction as an open or
computationally supported conjecture are superseded.

The valid return-defect identities and mass bounds are retained below.

## 1. Return-defect notation

Let `Y>1` be squarefree and put

```text
X=D(Y).
```

Assume that `X` is squarefree and `0<X<Y`.  Define

```text
beta =X/Y=sum_(q|Y)1/q,
alpha=D(X)/X=sum_(p|X)1/p.
```

Then

```text
D^2(Y)/Y=alpha beta.                               (1.1)
```

An E307 two-cycle with `X<Y` is exactly equality in `(1.1)`.

## 2. Strong one-step invariance is false

The smaller example

```text
Y=29861=13*2297,
D(Y)=2310=2*3*5*7*11,
D^2(Y)=2927>2310
```

already shows that

```text
D(Y)<Y =>D^2(Y)<D(Y)
```

fails in the squarefree-to-squarefree regime.

The Giuga-core relay counterexample now shows the stronger failure

```text
D(Y)<Y but D^2(Y)>Y.
```

Thus no monotonicity or two-step contraction principle can obstruct E307.

## 3. Exact local-return layers

The congruence

```text
D(X) congruent Y mod X                             (3.1)
```

is equivalent, because `X` is squarefree, to

```text
pY congruent X mod p^2        for every p|X.       (3.2)
```

Whenever `(3.1)` holds, define the integer return defect

```text
k={D(X)-Y}/X in Z.                                 (3.3)
```

Then

```text
D(X)=Y+kX.                                         (3.4)
```

The layers are:

```text
k=0: exact E307 return;
k<0: undershoot by |k| copies of X;
k>0: overshoot by k copies of X.
```

The explicit relay counterexample does not itself lie in an integer `k` layer; it proves that the
continuous return defect can cross zero while preserving squarefreeness.  Exact `k=0` remains the
E307 target.

## 4. Return-defect mass identity

Since `beta=X/Y`, equation `(3.4)` gives

```text
alpha=beta^(-1)+k.
```

Therefore the reciprocal mass of the complete union `U=XY` is

```text
s(U)=alpha+beta=beta+beta^(-1)+k.                  (4.1)
```

For `0<beta<1`, strict AM--GM gives

```text
s(U)>2+k.                                          (4.2)
```

In particular,

```text
k=0 =>s(U)>2,
k>=1=>s(U)>3.
```

These support-entropy bounds remain valid.  They explain why exact nonnegative integer-return
layers are absent from small computations even though nonintegral positive return defects can be
constructed by CRT relay.

## 5. Relationship with Bado's local conditions

Assume the exact one-sided equation

```text
D(Y)=X.
```

For every prime `q|Y`,

```text
qX congruent Y mod q^2.                            (5.1)
```

If the return congruences `(3.2)` also hold, then for every prime `ell|XY`,

```text
(XY/ell | ell)=1.
```

Thus

```text
one-sided exact forcing
+ exact return congruences
  => Bado's union Legendre conditions.
```

The converse is false in general.  The Legendre model is an outer local envelope around the exact
return layers.

## 6. Computational evidence and its corrected meaning

The earlier enumeration through `Y<=500000` found no example with `D^2(Y)>=Y`, and the maximum
observed ratio was approximately `0.5272717618`.  This was only a small-support phenomenon.

The explicit relay counterexample has roughly `142` decimal digits and

```text
D^2(Y)/Y
 =1.00111634302377485969101049437644597489... .
```

Accordingly the earlier computation has no conjectural force.  It records the scale at which the
sign change had not yet become accessible.

## 7. Corrected research frontier

The obstruction programme based on universal contraction is closed.

The new frontier is **zero-defect targeting**:

```text
construct squarefree families in which
D^2(Y)-Y takes both signs,
and force or detect an exact zero.
```

The useful mechanisms are now:

1. Giuga-core CRT relays producing controlled positive defects;
2. small and port-generated families producing negative defects;
3. residual-C port pencils and block-first closure quadratics;
4. exact mod-square return congruences;
5. prime-tuple distribution for affine relay forms.

There is no ordinary intermediate-value theorem on this discrete parameter space.  The main
mathematical problem is to create a congruence or port mechanism that converts sign flexibility
into exact equality.

## 8. Corrected classification

```text
RETURN-DEFECT IDENTITY — PROVED
DEFECT-LAYER UNION-MASS LOWER BOUND — PROVED
EXACT RETURN CONGRUENCE => BADO LEGENDRE CONDITIONS — PROVED
STRONG ONE-STEP INVARIANCE — FALSE
WEAK TWO-STEP CONTRACTION — FALSE
EXPLICIT SQUAREFREE POSITIVE-DEFECT RELAY — PROVED
E307 EXACT ZERO DEFECT — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed by this correction.