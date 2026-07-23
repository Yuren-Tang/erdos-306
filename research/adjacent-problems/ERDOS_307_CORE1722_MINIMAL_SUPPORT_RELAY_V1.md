# Erdős 307: a minimal-support core-1722 positive-defect relay

**Programme:** `E306-RL-ADJ-25`  
**Status:** `EXPLICIT CONSTRUCTION / MINIMAL SUPPORT LAYER / WOLFRAM-VERIFIED`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The quotient-one Giuga core

```text
C=1722=2*3*7*41,
D(C)=1723
```

has the same current total-support lower bound as the core `858` lane.  This note constructs an
explicit positive-return relay exactly on that minimal support layer.

Consequently core `858` is not isolated: at least two distinct residual-square cores admit
minimal-layer sign-crossing templates.

## 2. Residual-square target

An E307 cycle with one side

```text
1722 r
```

and opposite side `Y` would satisfy

```text
1722Y-1723D(Y)=1722^2,                              (2.1)
```

and

```text
r=(Y-1722)/1723                                    (2.2)
```

would be prime.

Every prime factor of `Y` avoids

```text
2,3,7,41,1723.                                     (2.3)
```

## 3. Minimal support screen

Let

```text
b_1<b_2<...
```

be the primes avoiding `(2.3)`, and put

```text
S_k=sum_(i=1)^k1/b_i,
P_k=product_(i=1)^k b_i.
```

The smallest prime which may occur as `r` is `5`, so

```text
Y>=1723*5+1722=10337.                               (3.1)
```

If `omega(Y)=k`, the residual equation requires

```text
S_k
 >=1722/1723
   -1722^2/{1723 max(P_k,10337)}.                   (3.2)
```

An exact rational computation gives:

```text
(3.2) fails for every 1<=k<=54;
```

at `k=54` the last allowed prime is `271` and the exact gap remains negative, approximately

```text
-0.0012602938930559992.
```

At `k=55`, ending at `277`, the gap is positive, approximately

```text
0.0023498144101930982.
```

Since `Y` is odd while

```text
D(Y)=1722r
```

is even, `omega(Y)` must be even.  Therefore

### Theorem 3.1

Every core-1722 E307 cycle satisfies

```text
omega(Y)>=56.                                      (3.3)
```

The core side `1722r` has five distinct prime factors.  Hence the total support is at least

```text
56+5=61.                                           (3.4)
```

## 4. A 55-prime relay block

Take `Q` to be the product of the following `55` primes:

```text
5, 11, 13, 17, 19, 23, 29, 31, 37, 43, 47,
53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
101, 103, 107, 109, 113, 127, 131, 137, 139,
149, 151, 157, 163, 167, 173, 179, 181, 191,
193, 197, 199, 211, 223, 227, 229, 233, 239,
241, 257, 263, 269, 271, 277, 601.
```

This is obtained from the first `55` admissible primes by deleting `251` and inserting `601`.

The exact product is

```text
Q=
121966713385084713542669171371522039555895330468928451211116589796951834312171721031443237946661963952845293245.
```

Its arithmetic derivative is

```text
A=D(Q)=
121899541574344807968831933675637051201040492940427993874260245935411282573039895057088366870881907519996379999.
```

The reciprocal mass satisfies

```text
1722/1723<A/Q<1,                                   (4.1)
```

numerically

```text
A/Q
 =0.9994492611231737...
```

## 5. CRT relay equations

Seek primes `t,m,r` satisfying

```text
Qt=1723m+1722,                                     (5.1)
At+Q=1722r.                                        (5.2)
```

The two integrality congruences determine one residue class for `t` modulo

```text
1722*1723=2967006.
```

For this block the CRT class begins at

```text
t=26995 mod 2967006.
```

Writing

```text
t=26995+2967006 k,
```

small-prime wheel sieving and exact primality tests find

```text
k=464,
t=1376717779.
```

The corresponding prime outputs are

```text
m=
97454290634616017733786838852218343672050125200031460163249153578243523101699967756828858798895519139256664449715671,
```

and

```text
r=
97457181335259501040718068813511915743976648946519475902976551836997554118727481947479381926051659372168860809006153.
```

All three of `t,m,r` are prime.

## 6. Explicit relay

Define

```text
X=1722m
 =167816288472808782537580936503519987803270315594454174401115042461735346781127344477259294851698083957799976182410385462,
```

```text
Y=Qt
 =167913742763443398555314723342372206146942365719654205861278291615313590304229044445016123710496979476939232846860102855,
```

and

```text
Z=1722r
 =167821266259316860792116514496867518911127789485906537504925622263309788192448723913559495676660957438874778313108595466.
```

Then

```text
D(X)=Y,
D(Y)=Z.
```

The next derivative is

```text
D(Z)=1723r+1722
 =167918723440652120293157232565681030826871766134853056980828598815146785746567451395506975058587009098246947173917603341.
```

The exact ordering is

```text
X<Z<Y<D(Z).                                        (6.1)
```

Thus

```text
Y squarefree,
D(Y)=Z squarefree,
D(Y)<Y,
D^2(Y)>Y.                                          (6.2)
```

Numerically,

```text
D(Y)/Y
 =0.9994492618495389...,
```

and

```text
D^2(Y)/Y
 =1.0000296621177442....
```

## 7. Support is exactly minimal

The middle side has

```text
omega(Y)=55+1=56.
```

The core side has

```text
omega(X)=omega(1722)+1=4+1=5.
```

Hence the relay uses

```text
56+5=61
```

prime factors across the two adjacent sides.  By Theorem 3.1, this is exactly the first support
layer on which a core-1722 E307 cycle can occur.

## 8. Independent verification

A Wolfram-language calculation independently returned:

```text
all 55 Q-factors prime = True;
t prime = True;
m prime = True;
r prime = True;
Qt=1723m+1722 = True;
At+Q=1722r = True;
X<Z<Y<D(Z) = True;
omega(Y)=56;
omega(X)=5;
gcd(X,Y)=gcd(Y,Z)=1;
1722/1723<A/Q<1 = True.
```

## 9. Core comparison

```text
CORE 30:
  total support lower bound 70;
  explicit minimal-layer relay known;

CORE 858:
  total support lower bound 61;
  explicit minimal-layer relay known;

CORE 1722:
  total support lower bound 61;
  explicit minimal-layer relay now known.
```

The two cheapest cores now supply independent minimal-layer prime reservoirs with different
forbidden-prime sets and different complement jet moduli.  Exact-zero search should compare their
balanced jet-code collision statistics rather than select a core only by support.

## 10. Classification

```text
CORE-1722 OPPOSITE SUPPORT >=56 — PROVED
CORE-1722 TOTAL SUPPORT >=61 — PROVED
EXPLICIT 55-PRIME RELAY BLOCK — PROVED
THREE AFFINE PRIME FORMS — SOLVED EXPLICITLY
MINIMAL-SUPPORT POSITIVE-DEFECT RELAY — PROVED / WOLFRAM-VERIFIED
CORE-1722 EXACT RESIDUAL-SQUARE FILLING — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No released E306 theorem, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed.
