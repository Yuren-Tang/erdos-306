# Erdős 307: direct Giuga-core rebound via two linear prime forms

**Programme:** `E306-RL-ADJ-21`  
**Status:** `GENERAL CONSTRUCTION / EXPLICIT COUNTEREXAMPLE / FRONTIER CORRECTION`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The earlier Giuga-core relay proved that the proposed squarefree two-step contraction

```text
D(Y)<Y  =>  D^2(Y)<Y
```

is false.  This note gives a shorter mechanism.  It needs only one fixed reciprocal block and two
simultaneously prime linear forms.  There is no preliminary derivative arrow into the large block.

The construction also gives a smaller explicit counterexample: the descending integer `Y` has
exactly `60` prime factors.

## 2. Direct Giuga-core rebound theorem

Let `C` be squarefree and satisfy

```text
D(C)=C+1.                                            (2.1)
```

Let `A` be squarefree and coprime to `C`, and put

```text
a=D(A),
sigma=a/A=sum_(q|A)1/q.                            (2.2)
```

Assume

```text
C/(C+1)<sigma<1.                                    (2.3)
```

Let `v,m` be primes, disjoint from `AC`, satisfying

```text
a v+A=Cm.                                           (2.4)
```

Define

```text
Y=Av,
X=Cm.                                               (2.5)
```

### Theorem 2.1 — direct squarefree rebound

If additionally

```text
v>A/(A-a)=1/(1-sigma),                              (2.6)
```

then

```text
D(Y)=X<Y<D(X).                                      (2.7)
```

All of `X,Y` are squarefree and coprime.

### Proof

Because `v` is a new prime,

```text
D(Y)=D(Av)=a v+A=Cm=X.
```

Moreover

```text
X/Y=(a v+A)/(Av)=a/A+1/v=sigma+1/v.
```

Condition `(2.6)` is exactly `sigma+1/v<1`, so `X<Y`.

Since `m` is prime and `D(C)=C+1`,

```text
D(X)=D(Cm)=(C+1)m+C.
```

Using `(2.4)`,

```text
D(X)-Y
 ={C+1\over C}(a v+A)+C-Av
 =Av\left({C+1\over C}{a\over A}-1\right)
   +{C+1\over C}A+C.
```

Every term on the final line is positive by `(2.3)`.  Hence `D(X)>Y`.  Squarefreeness and
coprimality follow from the prime-disjointness assumptions. `square`

### Consequence

The return overshoot does not require delicate iteration dynamics.  It is driven by the strict
threshold crossing

```text
sigma(A)>C/(C+1).
```

The threshold is dual to the exact residual-square port, where the complete reciprocal mass lies
slightly below `C/(C+1)`.

## 3. Two affine prime forms

Assume

```text
gcd(a,C)=1.
```

Let `v_0` be the unique class modulo `C` satisfying

```text
a v_0+A=0 mod C.                                   (3.1)
```

Write

```text
v=v_0+Ct,

m=a t+{a v_0+A\over C}.                             (3.2)
```

Then `(2.4)` holds identically.  Thus every simultaneous prime value of the two linear forms in
`(3.2)` produces a rebound once `(2.6)` is met.

### Proposition 3.1 — elementary local admissibility criterion

Suppose:

1. `gcd(A,C)=gcd(a,C)=1`;
2. `gcd(v_0,C)=1`;
3. `A` is squarefree.

Then the pair of linear forms in `(3.2)` has no fixed prime divisor.

### Proof

A prime dividing `C` never divides `v_0+Ct`.  Let `ell` not divide `C`.  The first form vanishes in
at most one class modulo `ell`.  The second is not identically zero modulo `ell`: if `ell|a` and
also divided its constant term, then `(3.1)` would give `ell|A`, contradicting
`gcd(A,D(A))=1` for squarefree `A`.  Hence the second form also vanishes in at most one class.
For `ell>=3`, two classes cannot cover all residues.  The prime `2` is already among the prime
divisors of the even core in the concrete application. `square`

Therefore Dickson's conjecture predicts infinitely many rebounds for every such admissible block.
The example below is unconditional.

## 4. An explicit core-30 block

Take

```text
C=30,
D(C)=31.
```

Let `A` be the product of the following `59` primes:

```text
7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
61, 67, 71, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127,
131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191,
193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257,
263, 269, 271, 277, 281, 283, 293, 449.
```

Equivalently, start with the first `59` primes greater than `5`, delete `73`, and insert `449`.
Then

```text
A=
419021512029367288828112888525510968605770522243824842534403310896066368582459840837579509888173752559401829793718622291,
```

and

```text
a=D(A)=
405634033055699054119924371193094480249446767838863848690969441485086041992743538431751647107353679001566142126582068011.
```

One has

```text
A=1 mod 30,
a=1 mod 30,
```

and

```text
sigma(A)=a/A
 =0.96805061652125877504902854328247736873...
 >30/31
 =0.96774193548387096774193548387096774193...,
```

while `sigma(A)<1`.

The allowed prime class is

```text
v=29 mod 30.
```

Take

```text
t=846,
v=29+30t=25409,
```

and

```text
m=
343572472247476221114066215351128771987559956484664511874379231400181576912073434261773839362021260116778450237470582823793.
```

Both `v` and `m` are prime, and

```text
a v+A=30m.
```

## 5. Explicit counterexample

Define

```text
X=30m
 =10307174167424286633421986460533863159626798694539935356231376942005447307362203027853215180860637803503353507124117484713790,
```

and

```text
Y=Av
 =10646917599154193441833520384544708201304023199693345423956653726558150359311722095842057766748606878781841093228596473792019.
```

Then

```text
D(Y)=X.
```

Also

```text
D(X)=31m+30
 =10650746639671762854536052675884991931614358651024599868105756173405628884274276462114989020222659063620131957361588067537613.
```

The exact ordering is

```text
X<Y<D(X).                                           (5.1)
```

The overshoot is

```text
D(X)-Y=
3829040517569412702532291340283730310335451331254444149102446847478524962554366272931253474052184838290864132991593745594.
```

Furthermore

```text
gcd(X,Y)=1,
X and Y are squarefree,
omega(Y)=60,
omega(X)=4.
```

Numerically,

```text
D(Y)/Y
 =0.96808997265491220493607643969713359...,
```

```text
D(X)/X
 =1.03333333333333333333333333333333333...,
```

and

```text
D^2(Y)/Y
 =1.00035963841007594510061232102037138....
```

This is an explicit squarefree-to-squarefree counterexample to two-step contraction.

## 6. Relationship with the longer relay

The earlier three-arrow relay has the form

```text
C*prime -> large block -> C*prime -> overshoot.
```

The present construction removes the first arrow.  It begins directly at the large block:

```text
large block -> C*prime -> overshoot.
```

The longer relay remains useful because it controls both sides of the sign-crossing family and, in
the core-30 implementation, avoids the prime `31` and lands at the support layer relevant to the
exact residual-900 port.  The direct relay is the minimal mechanism for disproving contraction.

## 7. Exact-zero geometry

For fixed `C,A`, the return defect is affine in `v`.  Eliminating `m` gives

```text
D(Cm)-Av
 =Av\left({C+1\over C}{D(A)\over A}-1\right)
  +{C+1\over C}A+C.                                (7.1)
```

Thus:

- reciprocal mass above `C/(C+1)` forces positive return defect;
- reciprocal mass below `C/(C+1)` allows a unique positive zero candidate;
- exact zero is the one-prime terminal formula
  ```text
  v={(C+1)A+C^2}/{CA-(C+1)D(A)}.
  ```

This is precisely the Giuga-core residual-square port.  The sign-crossing construction and the
exact E307 target are two sides of the same fractional-linear terminal geometry.

## 8. Classification

```text
DIRECT GIUGA-CORE REBOUND THEOREM — PROVED
TWO-LINEAR-FORM PRIME ARCHITECTURE — PROVED
EXPLICIT 60-PRIME DESCENDING BLOCK COUNTEREXAMPLE — PROVED
SQUAREFREE TWO-STEP CONTRACTION — FALSE
EXACT ZERO / E307 CYCLE — OPEN
```

This note changes the research frontier only.  It does not alter the released E306 theorem,
manuscript, Lean authority, review status, DOI, arXiv status, or canonical project state.
