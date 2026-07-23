# Erdős 307: Giuga-core relay and a counterexample to two-step contraction

**Programme:** `E306-RL-ADJ-15`  
**Status:** `EXPLICIT COUNTEREXAMPLE / GENERAL RELAY MECHANISM / WOLFRAM-VERIFIED`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose and correction

A preceding research note proposed the following possible obstruction to arithmetic-derivative
two-cycles:

```text
Y squarefree,
D(Y) squarefree,
0 < D(Y) < Y
  => D^2(Y) < Y.
```

This statement is false.

The present note gives an explicit counterexample in which all three successive integers are
squarefree and pairwise coprime in the relevant adjacent pairs:

```text
D(X)=Y,
D(Y)=Z<Y,
D(Z)>Y.
```

Thus the arithmetic derivative can descend from `Y` to a squarefree numerator `Z` and then
rebound past `Y` on the next step.

The example is not a blind search.  It is produced by a two-stage relay through the smallest
quotient-one Giuga core

```text
30,
D(30)=31=30+1.
```

## 2. General quotient-one Giuga-core relay

Let `Q` be a squarefree product of primes, coprime to `30*31`, and put

```text
A=D(Q)=Q sum_(q|Q) 1/q.
```

Let `t,m,r` be primes, disjoint from the prime factors of `Q` and from `2,3,5`, satisfying

```text
Q t =31m+30,                                      (2.1)
A t+Q=30r.                                        (2.2)
```

Define

```text
X=30m,
Y=Qt,
Z=30r.
```

### Theorem 2.1 — exact derivative relay

Under `(2.1)--(2.2)`,

```text
D(X)=Y,
D(Y)=Z,
D(Z)=31r+30.                                      (2.3)
```

All of `X,Y,Z` are squarefree.

#### Proof

Since `m` is prime and coprime to `30`, the product rule and `D(30)=31` give

```text
D(X)=D(30m)=31m+30=Qt=Y.
```

Since `Y=Qt`, with `Q` squarefree and `t` a new prime,

```text
D(Y)=tD(Q)+Q=At+Q=30r=Z.
```

Finally,

```text
D(Z)=D(30r)=31r+30.
```

Squarefreeness follows from the stated prime disjointness. `square`

## 3. The reciprocal-mass crossing criterion

Write

```text
sigma(Q)=sum_(q|Q)1/q.
```

Then

```text
Z/Y=D(Y)/Y=sigma(Q)+1/t.                           (3.1)
```

### Theorem 3.1 — descending first step and ascending second step

Assume

```text
sigma(Q)<1,
```

and

```text
sigma(Q)>30/31.                                    (3.2)
```

Then, for every sufficiently large prime `t` satisfying the relay equations,

```text
X<Z<Y<D(Z).                                        (3.3)
```

In fact the last inequality does not require a size limit once `(3.2)` holds.

#### Proof

The first relation in `(2.1)` gives

```text
Y-X=(31m+30)-30m=m+30>0.
```

By `(3.1)`, the condition `sigma(Q)+1/t<1` gives `Z<Y`.  Also

```text
Z/Y=sigma(Q)+1/t>30/31.
```

Since

```text
D(Z)/Z=31/30+1/r>31/30,
```

we obtain

```text
D(Z)/Y
  ={D(Z)/Z}{Z/Y}
  >(31/30)(30/31)=1.
```

Thus `D(Z)>Y`.  Moreover `(2.1)--(2.2)` in the explicit construction below give `Z>X`; this
can also be imposed as an affine inequality in the relay parameter. `square`

### Consequence

Taking the larger input `Y`, one has

```text
D(Y)=Z<Y,
```

with both `Y` and `Z` squarefree, but

```text
D^2(Y)=D(Z)>Y.
```

Therefore the squarefree two-step contraction conjecture is false.

## 4. CRT and affine-prime architecture

The relay equations can be generated from one integer parameter.

Suppose

```text
gcd(Q,31)=1,
gcd(A,30)=1.
```

Choose a residue `t_0` satisfying

```text
Q t_0 congruent 30 mod 31,
A t_0+Q congruent 0 mod 30.                        (4.1)
```

By the Chinese remainder theorem, `t` lies in one residue class modulo `930`:

```text
t=t_0+930n.
```

Then

```text
m=(Qt-30)/31,
r=(At+Q)/30                                     (4.2)
```

are integral affine functions of `n`.

Thus an exact squarefree relay is produced whenever the three affine forms

```text
t(n), m(n), r(n)
```

are simultaneously prime.

This is a prime-tuple problem in three linear forms.  The explicit example below is an
unconditional instance.

## 5. Explicit block Q

Take `Q` to be the product of the following `65` primes:

```text
7, 11, 13, 17, 19, 23, 29,
37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89,
97, 101, 103, 107, 109, 113, 127, 131, 137, 139,
149, 151, 157, 163, 167, 173, 179, 181, 191, 193,
197, 199, 211, 223, 227, 229, 233, 239, 241, 251,
257, 263, 269, 271, 277, 281, 283, 293, 307, 311,
313, 317, 331, 347, 353.
```

Then

```text
Q=
844084029293563418783498522596227959301341492659954441879006277042313190908507734513201013193205861318490991044953751656262258948862229,
```

and

```text
A=D(Q)=
817767253093296033001828510327218862192895626333788267813256860636808367786938717012403143950577290942760420747182319880361330800207117.
```

The reciprocal mass is

```text
sigma(Q)
 =0.9688220896416052295353473726788872949644100187478447233907...
 >30/31
 =0.9677419354838709677419354838709677419...,
```

while `sigma(Q)<1`.

For this block, `(4.1)` gives

```text
t congruent 563 mod 930.
```

Taking

```text
n=6047
```

gives the three primes

```text
t=5624273,
```

```text
m=
153140613409257993872636244715414671398181736159583224151295621638696836682921468435927890389522306750172041344431457151258745287906265009177,
```

```text
r=
153311570864694021766090394158737360265006098811623566744443716078354705047711336241841139361245279502279109945600279757807703977531074380439.
```

## 6. Explicit counterexample

Define

```text
X=30m
 =4594218402277739816179087341462440141945452084787496724538868649160905100487644053077836711685669202505161240332943714537762358637187950275310,
```

```text
Y=Qt
 =4747359015686997810051723586177854813343633820947079948690164270799601937170565521513764602075191509255333281677375171689021103925094215284517,
```

```text
Z=30r
 =4599347125940820652982711824762120807950182964348707002333311482350641151431340087255234180837358385068373298368008392734231119325932231413170.
```

Then

```text
D(X)=Y,
D(Y)=Z,
```

and

```text
D(Z)=31r+30
 =4752658696805514674748802218920858168215189063160330569077755198428995856479051423497075320198603664570652408313608672492038823303463305793639.
```

The exact ordering is

```text
X<Z<Y<D(Z).                                        (6.1)
```

Numerically,

```text
D(Y)/Y
 =0.96882226744236276744291338165462513699...,
```

whereas

```text
D^2(Y)/Y
 =1.00111634302377485969101049437644597489....
```

Thus

```text
Y squarefree,
D(Y) squarefree,
D(Y)<Y,
D^2(Y)>Y.
```

This is an explicit counterexample to the proposed squarefree arithmetic-numerator contraction.

## 7. Independent verification

A Wolfram-language verification returned:

```text
AllQFactorsPrime = True,
tPrime = True,
mPrime = True,
rPrime = True,
D(X)=Y = True,
D(Y)=Z = True,
SquareFreeQ[X] = True,
SquareFreeQ[Y] = True,
SquareFreeQ[Z] = True,
X<Z<Y<D(Z) = True,
gcd(X,Y)=1,
gcd(Y,Z)=1.
```

It also independently evaluated the two ratios recorded above.

## 8. Structural interpretation

The mechanism is a **Giuga-core relay**:

```text
30 * prime
  --D--> large squarefree reciprocal block
  --D--> 30 * prime
  --D--> overshoot.
```

The first and third arrows are controlled by

```text
D(30p)=31p+30.
```

The middle arrow is controlled by the reciprocal mass of `Q`.

This shows that neither the sign nor the size of the second return defect is protected by a
monotonicity principle.  CRT engineering can move the return from below the starting point to
above it while preserving squarefreeness.

## 9. New E307 frontier: zero-defect targeting

An E307 cycle requires the exact equality

```text
D^2(Y)=Y.
```

The relay constructs a positive defect

```text
D^2(Y)-Y>0,
```

whereas small computations produced many negative-defect states.  The natural next problem is no
longer contraction.  It is a discrete zero-target problem:

```text
construct a parameterized family of squarefree relays
whose return defect takes both signs,
and prove or search for an exact zero.
```

The relevant coordinates are:

1. the reciprocal mass `sigma(Q)` controlling the continuous first-order size;
2. CRT classes controlling the exact derivative numerators;
3. affine prime tuples controlling squarefreeness;
4. residual-port pencils and block-closure quadratics controlling exact equality.

There is no ordinary intermediate-value theorem on this discrete set.  A successful argument must
supply either:

- a congruence/port mechanism forcing a zero defect; or
- enough distribution in the prime-tuple relay family to hit the exact target.

## 10. Classification

```text
QUOTIENT-ONE GIUGA-CORE RELAY — PROVED
EXPLICIT THREE-AFFINE-PRIME INSTANCE — PROVED / WOLFRAM-VERIFIED
SQUAREFREE TWO-STEP CONTRACTION CONJECTURE — FALSE
POSITIVE RETURN DEFECT WITH SQUAREFREE INTERMEDIATE — PROVED
E307 EXACT ZERO DEFECT — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed by this adjacent-problem counterexample.