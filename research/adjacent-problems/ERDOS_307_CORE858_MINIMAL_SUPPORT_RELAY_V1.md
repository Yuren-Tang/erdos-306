# Erdős 307: a minimal-support core-858 positive-defect relay

**Programme:** `E306-RL-ADJ-21`  
**Status:** `EXPLICIT CONSTRUCTION / MINIMAL SUPPORT LAYER / WOLFRAM-VERIFIED`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The general Giuga-core relay attaches to every quotient-one Giuga core `C` with

```text
D(C)=C+1
```

a residual-square E307 port

```text
CY-(C+1)D(Y)=C^2.
```

The smallest core `C=30` admits an explicit positive-return relay at total support `70`.  This note
shows that the larger core

```text
C=858=2*3*11*13,
D(858)=859
```

is structurally cheaper: its first admissible support layer has only `61` primes in total, and an
explicit positive-return relay exists exactly on that layer.

## 2. Support lower bound for the core-858 ansatz

Suppose an E307 cycle has sides

```text
858r,
Y,
```

with `r` prime.  The residual-square equation is

```text
858Y-859D(Y)=858^2.                                (2.1)
```

Every prime divisor of `Y` avoids

```text
2,3,11,13,859.                                     (2.2)
```

Indeed the first four divide the core and `859` divides `C+1`, so the general prime-exclusion
lemma applies.

Dividing `(2.1)` by `859Y` gives

```text
D(Y)/Y
 =858/859-858^2/(859Y).                            (2.3)
```

Let

```text
b_1<b_2<...
```

be the primes avoiding `(2.2)`, with

```text
S_k=sum_(i=1)^k1/b_i,
P_k=product_(i=1)^k b_i.
```

The core-side output prime is

```text
r=(Y-858)/859.
```

Since `r` is coprime to `858`, its smallest possible value is `5`; hence

```text
Y>=859*5+858=5153.                                 (2.4)
```

If `omega(Y)=k`, then the necessary inequality is

```text
S_k
 >=858/859
   -858^2/{859 max(P_k,5153)}.                     (2.5)
```

### Theorem 2.1 — exact finite support screen

Inequality `(2.5)` fails for every

```text
1<=k<=54.                                          (2.6)
```

The smallest exact gap occurs at `k=54`, whose last allowed prime is `271`.  It equals

```text
399873777497680701456602531779885378290169244763860599460576563981311932217055001037984232238400114645760154
/317029608680366544287015248468544456210869483603694044527706730161107686086170552557155934682625803146745568985
>0.                                                (2.7)
```

At `k=55`, with last allowed prime `277`, the gap becomes negative, so reciprocal mass no longer
excludes that layer.

Because `Y` is odd and

```text
D(Y)=858r
```

is even, `omega(Y)` must be even.  Hence:

### Corollary 2.2

```text
omega(Y)>=56.                                      (2.8)
```

The core side `858r` has five distinct prime factors.  Therefore every core-858 E307 cycle has

```text
at least 56+5=61 prime factors in total.            (2.9)
```

This is only one above the general unrestricted lower bound and is substantially smaller than the
core-30 bound `70`.

## 3. The 55-prime relay block

Take `Q` to be the product of the following `55` primes:

```text
5, 7, 17, 19, 23, 29, 31, 37, 41, 43, 47,
53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
101, 103, 107, 109, 113, 127, 131, 137, 139,
149, 151, 157, 163, 167, 173, 179, 181, 191, 193,
197, 199, 211, 223, 227, 229, 233, 239, 241, 251,
257, 263, 269, 271, 419.
```

Then

```text
Q=
154639587936057720670849114212246946626722134609950878529812712383590361432020327731604582807939710731648886385,
```

and

```text
A=D(Q)=
154633584336491691112881535252340689974895087386944691771749746653054095570617771479440014657260777605197448347.
```

Its reciprocal mass is

```text
A/Q
 =0.9999611768264119275836560583736169106834383820693788014765...
```

and satisfies

```text
858/859<A/Q<1.                                     (3.1)
```

## 4. CRT relay equations

Seek primes `t,m,r` satisfying

```text
Qt=859m+858,                                       (4.1)
At+Q=858r.                                         (4.2)
```

The simultaneous congruences determine one residue class for `t` modulo

```text
858*859.
```

For the block above, an affine-prime search gives

```text
t=14505622319,
```

```text
m=
2611342791811690358364768991616471958240026027484779770774981592131939506567626155070149101352193199528998726446741823,
```

```text
r=
2614284816285573739744902175792759351636299156072543641949673260213228147560725580445486076883046216598120265589442591.
```

All three are prime.

## 5. Explicit relay

Define

```text
X=858m
 =2240532115374430327476971794806932940169942331581941043324934206049204096635023241050187928960181765195880907291304484134,
```

```text
Y=Qt
 =2243143458166242017835336563798549412128182357609425823095709187641336036141590867205258078061533958395409906017751226815,
```

```text
Z=858r
 =2243056372373022268701126066830187523703944675910242444792819657262949750607102548022227053965653653841187187875741743078.
```

Then

```text
D(X)=Y,
D(Y)=Z,
D(Z)=859r+858
 =2245670657189307842440870969005980283055580975066314988434769330523162978754663273602672540042536700057785308141331186527.
```

The exact ordering is

```text
X<Z<Y<D(Z).                                        (5.1)
```

Thus

```text
Y squarefree,
D(Y)=Z squarefree,
D(Y)<Y,
D^2(Y)>Y.                                          (5.2)
```

Numerically,

```text
D(Y)/Y
 =0.9999611768953507140768189926263517450...,
```

```text
D^2(Y)/Y
 =1.0011266328124781624615239098671749988....
```

## 6. Support is exactly minimal

The middle side has

```text
omega(Y)=omega(Q)+1=55+1=56.                       (6.1)
```

The core side has

```text
omega(X)=omega(858)+1=4+1=5.                       (6.2)
```

Hence the relay uses exactly

```text
56+5=61                                             (6.3)
```

prime factors across the two adjacent sides.

By Corollary 2.2, this is the smallest total support on which a core-858 exact E307 cycle could
possibly occur.

The relay therefore reaches the minimal admissible support stratum while lying on the positive
return-defect side.

## 7. Independent verification

A Wolfram-language calculation independently returned:

```text
all 55 Q-factors prime = True;
t prime = True;
m prime = True;
r prime = True;
D(X)=Y = True;
D(Y)=Z = True;
X,Y,Z squarefree = True;
X<Z<Y<D(Z) = True;
omega(Y)=56;
omega(X)=5;
gcd(X,Y)=gcd(Y,Z)=1.
```

It also independently evaluated the reciprocal mass and derivative ratios above.

## 8. Structural assessment

This construction establishes three facts.

1. The core-30 relay is not exceptional; sign crossing persists across quotient-one Giuga cores.
2. Larger cores can lower the support cost dramatically.
3. The correct exact-zero search should compare residual-square cores rather than privileging the
   smallest core.

The core-858 exact target is

```text
858Y-859D(Y)=858^2,                                (8.1)
```

or, because `859` is prime, the standard near-fixed equation

```text
N-D(N)=858^2,
N=859Y,                                             (8.2)
```

plus primality of

```text
(Y-858)/859.
```

## 9. Revised core ranking

```text
CORE 30:
  minimal opposite support 66;
  total support 70;
  explicit minimal-layer positive relay known.

CORE 858:
  minimal opposite support 56;
  total support 61;
  explicit minimal-layer positive relay known.

CORE 1722:
  minimal opposite support 56;
  total support 61;
  explicit relay not yet constructed here.

CORE 66198:
  substantially larger support cost.
```

The highest-value exact-zero port is now `C=858`, with `C=1722` as the natural comparison lane.

## 10. Classification

```text
CORE-858 OPPOSITE SUPPORT >=56 — PROVED
CORE-858 TOTAL SUPPORT >=61 — PROVED
EXPLICIT 55-PRIME RELAY BLOCK — PROVED
THREE AFFINE PRIME FORMS — SOLVED EXPLICITLY
MINIMAL-SUPPORT POSITIVE-DEFECT RELAY — PROVED / WOLFRAM-VERIFIED
CORE-858 EXACT RESIDUAL-SQUARE FILLING — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed.