# Programme-state addendum: E307 rebound, block code, defect spectrum, and core ranking

**Programme:** `E306-RL`  
**Date:** 2026-07-23  
**Status:** `MATERIAL ADJACENT-PROBLEM CHECKPOINT / RESEARCH ONLY / NOT INDEPENDENTLY REVIEWED`

## 1. Executive correction

The proposed global obstruction

```text
Y and D(Y) squarefree, 0<D(Y)<Y
  =>D^2(Y)<Y
```

is false.  Explicit Giuga-core mechanisms prove squarefree descent followed by overshoot.  The
shortest construction gives a descending side with `60` prime factors and uses only two affine
prime forms.

Therefore no future E307 no-go programme should rely on monotonicity or two-step size contraction.
Exact equality

```text
D^2(Y)=Y
```

must be attacked through exact return arithmetic.

## 2. Direct rebound theorem

For any squarefree quotient-one Giuga core `C`,

```text
D(C)=C+1,
```

and any squarefree block `A` with

```text
C/(C+1)<D(A)/A<1,
```

simultaneous prime solutions of

```text
D(A)v+A=Cm
```

produce

```text
Y=Av,
X=Cm,
D(Y)=X<Y<D(X)
```

once `v` exceeds the exact reciprocal-gap threshold.

For `C=30`, an explicit `59`-prime block and primes `v=25409` and a `123`-digit prime `m` give an
unconditional counterexample.  This is the minimal mechanism for disproving contraction.

A longer three-affine-form relay remains valuable because it can be placed on the exact minimal
support layer of a chosen Giuga-core port.

## 3. Residual-square core family

For every squarefree quotient-one Giuga core `C`, an E307 cycle with one side `Cr`, `r` prime, is
equivalent to

```text
CY-(C+1)D(Y)=C^2,
(Y-C)/(C+1) prime.                                  (3.1)
```

If `C+1` is prime, the standard coordinate is

```text
N=(C+1)Y,
N-D(N)=C^2,                                         (3.2)
```

with one affine prime-output condition.

### Core 30

```text
30Y-31D(Y)=900,
(Y-30)/31 prime.
```

The opposite side has at least `66` prime factors and the total cycle at least `70`.  An explicit
positive-return relay reaches that minimal core-30 support layer.  Complete one-, two-, and
three-swap repairs of that relay fail.

### Core 858

```text
858Y-859D(Y)=858^2,
(Y-858)/859 prime.
```

The opposite side has at least `56` prime factors and the total cycle at least `61`.  An explicit
`55`-prime relay block and three affine prime values produce a squarefree positive-return relay
exactly on this minimal support layer.  Its recorded relative return margin is approximately

```text
1.12663*10^(-3).
```

### Core 1722

```text
1722Y-1723D(Y)=1722^2,
(Y-1722)/1723 prime.
```

The opposite side again has at least `56` prime factors and the total cycle at least `61`.  Two
explicit `55`-prime relay blocks now produce squarefree positive-return relays exactly on this
minimal layer.

The first was selected for a small CRT starting point and has relative return margin approximately

```text
2.9662*10^(-5).
```

The second was selected from `143` locally admissible one-replacement blocks for closest reciprocal
threshold.  It has

```text
D^2(Y)/Y-1
 =1.3292369542874746...*10^(-6).                    (3.3)
```

This is currently the closest explicit minimal-support relay to the exact residual-square surface.

Cores `858` and `1722` are therefore joint first construction lanes.  Support alone does not choose
between them; return margin and complement-jet geometry are separate optimization coordinates.

## 4. Block-code theorem

For coprime squarefree blocks `A,B` and `0<C<AB`,

```text
AB-D(AB)=C
```

if and only if

```text
B D(A)=-C mod A,
A D(B)=-C mod B,
D(A)/A+D(B)/B<1.
```

The theorem extends to any number of pairwise coprime blocks.  For squarefree `A`, the first
condition assigns one unique complement residue

```text
theta_C(A)=-C D(A)^(-1) mod A.
```

Thus exact defect is a hybrid of:

```text
multiplicative CRT syndrome,
reciprocal-load positivity.
```

The primewise `mu`-Sondow/Korselt criterion is prior literature; the block packaging is the current
construction interface and is not novelty-audited.

## 5. Complement jet code

Fix a squarefree partial block `H`, write

```text
a=H-D(H)>0,
```

and target defect `T`.  Every squarefree complement `M` satisfies

```text
aM-HD(M)=T.
```

Hence its first arithmetic jet lies in the two-coordinate CRT class

```text
M=T a^(-1) mod H,
D(M)=-T H^(-1) mod a,                              (5.1)
```

and on the exact affine line

```text
D(M)=(aM-T)/H.                                     (5.2)
```

For a split complement `M=UV`, candidate generation may be indexed by

```text
UV mod H,
U D(V)+V D(U) mod a,
```

followed by one exact residual check.  This is the balanced complement-jet meet-in-the-middle
architecture.

For core `858`, natural-prefix ordered-tail searches were complete through ten remaining primes:

```text
tails   terminal states tested   integral closures
  3             2574                   0
  4            23605                   0
  5           120948                   0
  6           414174                   0
  7          1053970                   0
  8          2036237                   0
  9          3496486                   0
 10          5261337                   0.
```

This establishes a stopping rule: do not extend the ordered-tail tree; switch to balanced jet-code
matching.

The two core-1722 relays provide an independent pair of minimal-layer reservoirs for the same
balanced architecture, with substantially smaller positive return margins.

## 6. Ambient E313 boundary

If `K` is any even squarefree primary pseudoperfect number and `B` is a coprime squarefree block,
then `B` is odd and

```text
B-KD(B)
```

is odd.  Therefore no even PPN ambient core can be filled to any even residual by any coprime
squarefree block.

Known E313 blocks may still enter through nonambient residual-port pencils, but ambient inheritance
is completely unavailable for `900`, `858^2`, `1722^2`, or any other even target.

The standard small `mu`-Sondow constructions often insert `rad(mu)` into the constructed number.
They are incompatible with primitive squarefree defect states, which satisfy `gcd(N,mu)=1`.

## 7. Defect spectrum

If squarefree `N` satisfies

```text
delta(N)=N-D(N)=C>0,
```

then for every `p|N`, with `K=N/p`,

```text
delta(K)=(K+C)/p=(N+Cp)/p^2.                      (7.1)
```

Hence every final prime is a one-prime terminal port from its cofactor.

For a two-prime tail `N=Hqt`, with `c=delta(H)`, the two factors in

```text
(cq-H)(ct-H)=H^2+Cc                                (7.2)
```

are exactly the intermediate defects

```text
delta(Hq),
delta(Ht).
```

The two-prime divisor port is therefore a defect ladder

```text
(H,c) -> (Hq,d) -> (Hqt,C),
```

not an anonymous factorization.

For the distinguished factor `31` in the core-30 coordinate,

```text
31 delta(N/31)=N/31+900,
```

and the E307 output prime is

```text
delta(N/31)-30.
```

The same shifted-cofactor-defect interpretation holds for every residual-square core.

## 8. Computational diagnostics

The following complete bounded tests produced no integral exact-zero closure:

1. core-30 relay repairs changing one, two, or three factors;
2. the natural support-65 partial block and its two-prime terminal window;
3. `12,020` one-boundary-replacement support-65 blocks;
4. all `66` one-deletion cofactors of the natural overfull 66-prime state, with every integer in
   every exact two-prime terminal window;
5. structured odd tails arising from known primary-pseudoperfect cores, completed by the smallest
   admissible primes;
6. core-858 natural-prefix ordered tails through ten terminal primes.

The failures occur at integral divisor / jet-code support before primality.  They are diagnostics,
not general exclusions.

The successful affine relay searches show the complementary fact: approximation and sign crossing
are abundant once the reciprocal window is designed.  Failure is concentrated at exact jet-code
closure.

## 9. Corrected research ranking

### Joint first lanes: cores 858 and 1722

Both have total support lower bound `61` and explicit minimal-layer positive relays.  Core `1722`
currently has the much smaller recorded positive margin; core `858` has the deeper completed
ordered-tail diagnostic and existing complement-jet search setup.

The next useful comparison is not another relay.  It is a matched experiment/theorem on balanced
block signatures:

```text
product residue mod H,
derivative residue mod delta(H),
reciprocal mass,
support split,
exact residual check.
```

### Structural model: core 30

Retain core `30` for transparent residual-`900` identities, defect-spectrum interpretation, and
smallest-core examples.  It is not currently the cheapest exact construction lane.

### General analytic mechanism

Develop a multiplicative hot-cold model:

```text
hot block:
  mix product and derivative residues;

cold block:
  supply reciprocal mass;

terminal block:
  close the finite residual C^2 exactly.
```

The essential difficulty relative to E306 is self-modularity: the modulus, derivative modulus, and
target move with the partial block.

### Low-value directions

```text
more contraction inequalities;
more random low swaps;
longer ordered-tail trees;
more positive-relay examples without a new core or sharper margin;
more local congruences without a gluing or distribution theorem;
ambient transfer from even PPN chains.
```

## 10. Honest status

```text
SQUAREFREE TWO-STEP CONTRACTION — FALSE / EXPLICIT COUNTEREXAMPLES
DIRECT TWO-LINEAR-FORM REBOUND — PROVED
GENERAL GIUGA-CORE RESIDUAL-SQUARE PORT — PROVED
CORE-30 MINIMAL-LAYER POSITIVE RELAY — PROVED
CORE-858 MINIMAL-LAYER POSITIVE RELAY — PROVED
CORE-1722 MINIMAL-LAYER POSITIVE RELAYS — PROVED
CORE-1722 NEAR-ZERO MARGIN 1.32924*10^(-6) — VERIFIED
CORES 858 AND 1722 TOTAL SUPPORT LOWER BOUND 61 — PROVED
BLOCK-SYNDROME GLUING — PROVED
COMPLEMENT JET CODE — PROVED
AMBIENT EVEN-PPN TO EVEN DEFECT — IMPOSSIBLE
DEFECT SPECTRUM / INTERMEDIATE LADDER — PROVED
CORE-858 EXACT RESIDUAL-SQUARE FILLING — OPEN
CORE-1722 EXACT RESIDUAL-SQUARE FILLING — OPEN
E307 EXISTENCE OR NONEXISTENCE — OPEN
```

No released E306 proof, manuscript, Lean authority, review status, DOI, arXiv, submission, or
canonical status is changed by this checkpoint.
