# Sparse arithmetic synchronization by decoder defect expansion

**Programme:** `E306-RL`  
**Research unit:** `E306-RL-PF1A-05`  
**Status:** `ARGUMENT / MATERIAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`  
**Date:** 2026-07-23

## 1. Purpose and disposition

The preceding note

`SPARSE_TOP_SYNCHRONIZATION_CORE_V1.md`

proved that one actual-prime subset

```text
S subset B={q prime:Z/2<=q<Z},
|S|=O((log Z)^3),
```

can conditionally decode every prime coordinate outside `S`, but left an exact
blocked frontier: conditional fibre compression did not by itself control the
number of quotient assignments on `S`.

The obstruction came from treating all non-decoder fibres as one additive error.
The quotient has

```text
prod_(s in S) s = exp(O((log Z)^4))
```

assignments, so a merely polynomially small unweighted error is not enough.

This note resolves that normalization problem.  Instead of summing all fibre
errors at once, expand by the set `U` of rows which leave their nearest decoder.
Every term retains the complete-pair energy on the nondefective witness rows
`G=R\U`.  Small `U` leaves a positive-density witness block, where deterministic
exact-cold rigidity forces one common integer label and the sensor edges force the
sparse core to carry that same label.  Large `U` is killed by the product of row
error factors.

The result removes the need for the one-block fingerprint-entropy theorem from the
proposed one-anchor synchronization layer.  It still uses the deterministic
zero-exception exact-cold theorem, in a robust positive-density-subset form.

No manuscript, proof-development, review, Curator, Lean, release, DOI, arXiv, or
canonical status changes through this note.

## 2. Arithmetic setting

Let

```text
P={p prime:X<=p<X^3},
Z=X^3,
B={q prime:Z/2<=q<Z}.
```

Choose a sparse actual-prime core `S subset B` by Theorem 4.1 of
`SPARSE_TOP_SYNCHRONIZATION_CORE_V1.md`.  Put

```text
R=B\S,
N=|R|.
```

Then

```text
N asymp Z/log Z,
|S|<=C_A (log Z)^3.
```

For a fixed squarefree denominator `b`, the Bernoulli parameter `theta` lies in a
compact subinterval of `(0,1)`.  Hence there is `kappa_b>0` such that every
Bernoulli kernel satisfies

```text
|1-theta+theta e(t)| <= exp(-kappa_b ||t||^2).
```

Choose the sensor-strength constant `A=A(b,K)` so large that

```text
D_r(S)>=A log Z
```

for every `r in P\S`, and so that

```text
delta:=Z exp(-kappa_b A log Z/4) <= Z^(-K)
```

for a fixed large `K` chosen below.

## 3. Row energies and nearest decoders

Fix an assignment

```text
y=(y_s mod s)_(s in S)
```

on the sparse core.  For `r in R` and `x mod r`, define the star energy

```text
E_(r,y)(x)
 = sum_(s in S)
   || H_(rs)(x,y_s)/(rs) ||^2,
```

where `H_(rs)` is the centred CRT lift.  Let

```text
x_r^*(y) in argmin_(x mod r) E_(r,y)(x),
e_r(y)=E_(r,y)(x_r^*(y)).
```

The row code has squared distance at least `A log Z`.  Therefore at most one row
value has energy below `D_r/4`; all non-nearest values satisfy the uniform
partition estimate

```text
sum_(x != x_r^*)
 exp(-kappa_b E_(r,y)(x))
 <= r exp(-kappa_b D_r/4)
 <= delta.
```

The estimate is uniform in `y`.

## 4. Decoder-defect expansion

Let

```text
Q_R(x_R)
 = sum_(r<t in R)
   || H_(rt)(x_r,x_t)/(rt) ||^2
```

be the full internal complete-pair energy on the witness block.  Consider the
absolute top-block partition using only the edges `S x R` and `binom(R,2)`; all
unused factors have modulus at most one.

For each assignment `x_R`, define its decoder-defect set

```text
U(x_R)={r in R:x_r != x_r^*(y)},
G=R\U.
```

### Lemma 4.1 — retained-energy defect expansion

For every core assignment `y`,

```text
Z_R(y)
 := sum_(x_R)
    [product_(r in R) exp(-kappa_b E_(r,y)(x_r))]
    exp(-kappa_b Q_R(x_R))
```

satisfies

```text
Z_R(y)
 <= sum_(U subset R)
    delta^|U|
    exp(-kappa_b T_U(y)),
```

where

```text
G=R\U,
T_U(y)
 = sum_(r in G)e_r(y)
   +Q_G(x^*(y)|_G).
```

#### Proof

Fix `U`.  Sum the star weights over the nondecoder values on every row in `U`;
the row partition estimate contributes at most `delta^|U|`.  On every row in `G`
retain the decoder factor `exp(-kappa_b e_r(y))`.  Retain also every internal
complete-pair factor whose two endpoints lie in `G`; their product is
`exp(-kappa_b Q_G)`.  Discard only factors incident to `U`, each of which has
modulus at most one.  Summing over all `U` proves the inequality.  `square`

This is the normalization step missing from a single additive fibre-error bound.
The synchronization energy is not lost unless a vertex is explicitly paid for in
`U`.

## 5. Robust exact-cold witness theorem

The deterministic proof of the paper-first zero-exception cold-block theorem uses
only:

1. all primes lying in one interval `[Y,2Y)`;
2. a lower cardinality bound `cY/log Y`;
3. the reciprocal-dispersion lemma;
4. complete internal pair energy.

Consequently the same proof gives the following positive-density-subset form.

### Proposition 5.1 — robust exact-cold rigidity

For every fixed `c_*>0`, there are constants `w_*=w_*(c_*)>0` and `Z_0` such that,
whenever

```text
G subset {q prime:Z/2<=q<Z},
|G|>=c_* Z/log Z,
```

and

```text
Q_G(a)<w_* Z/(log Z)^3,
```

there is one integer `m` with

```text
a_r=m mod r for every r in G,
```

and

```text
|m| <= C_* sqrt(Q_G(a))/sigma_G,
sigma_G^2=sum_(r<t in G)1/(r^2 t^2)
asymp_(c_*) 1/(Z^2 (log Z)^2).
```

This is a deterministic theorem.  It does not use fingerprint entropy or any
level-set count.  The three bounded local repairs found by `E306-PF-AUDIT-01`
must be included when this robust version is written as a final proof.

## 6. A core defect is amplified by a positive-density witness block

Assume `G` satisfies the hypotheses of Proposition 5.1 and its decoder assignment
is the common label `m`.  Let `s in S` satisfy

```text
y_s != m mod s.
```

Put `d=y_s-m mod s`, which is nonzero.  The same reciprocal-dispersion argument as
in the paper-first cross-label lemma, now with the prime set `G`, gives

```text
sum_(r in G)
 ||d r^(-1)/s||^2
 >> |G|^3/Z^2
 >> Z/(log Z)^3.
```

The exact-cold label bound at energy below `w_*Z/(log Z)^3` gives

```text
|m| << Z^(3/2)/(log Z)^(1/2)
     =o(|G|Z).
```

Thus the harmless `m/(rs)` term is smaller than half the dispersion threshold,
and the actual star energy obeys

```text
sum_(r in G)
 ||H_(rs)(m,y_s)/(rs)||^2
 >> Z/(log Z)^3.
```

### Proposition 6.1 — defect amplification

There is `c_def>0` such that every core coordinate which differs from the witness
label contributes at least

```text
c_def Z/(log Z)^3
```

to `sum_(r in G)e_r(y)`.

## 7. Small defect sets force the integer diagonal

Fix `epsilon=1/2`.  If `|U|<=epsilon N`, then

```text
|G|>=N/2>>Z/log Z.
```

Choose a synchronization floor

```text
F_sync=c_sync Z/(log Z)^3
```

with `c_sync` smaller than both the robust cold constant and the one-defect
amplification constant.

### Theorem 7.1 — low retained energy is exactly diagonal

If `|U|<=N/2` and

```text
T_U(y)<F_sync,
```

then there is an integer `m` such that

```text
x_r^*(y)=m mod r for every r in G,
y_s=m mod s for every s in S.
```

#### Proof

The internal part `Q_G` is below `F_sync`, so Proposition 5.1 gives one common
integer label `m` on `G`.  If a core coordinate differed from `m`, Proposition
6.1 would force the star part of `T_U` above `F_sync`.  Hence no core defect
exists.  `square`

The possible label is unique in the polynomial range supplied by Proposition 5.1,
because the product of two primes from `S` is of order `Z^2`, larger than the
label range.

## 8. Off-diagonal partition bound

The number of core assignments is at most

```text
Y_S=product_(s in S)s
   <= Z^|S|
   =exp(O_A((log Z)^4)).
```

Call a pair `(y,U)` off-diagonal when the conclusion of Theorem 7.1 does not hold.

### Small `U`

For `|U|<=N/2`, every off-diagonal pair has `T_U(y)>=F_sync`.  Hence

```text
sum_y sum_(|U|<=N/2, off-diagonal)
 delta^|U| exp(-kappa_b T_U(y))
 <=Y_S exp(-kappa_b F_sync)(1+delta)^N.
```

Choose `K>3`.  Since `N delta=o(1)`,

```text
(1+delta)^N=1+o(1),
```

while

```text
log Y_S=O((log Z)^4)=o(Z/(log Z)^3).
```

Therefore the small-defect off-diagonal mass is

```text
exp(-Omega_b(Z/(log Z)^3)).
```

### Large `U`

For `|U|>N/2`, discard all retained energy.  Then

```text
sum_y sum_(|U|>N/2)delta^|U|
 <=Y_S 2^N delta^(N/2).
```

Its logarithm is

```text
O((log Z)^4)+O(N)-(K/2)N log Z
 =-Omega_K(Z),
```

so this sector is even smaller.

### Theorem 8.1 — sparse arithmetic synchronization

With the sensor constant chosen sufficiently large, the total top-block partition
outside the short integer diagonal is

```text
exp(-Omega_b(Z/(log Z)^3)).
```

The theorem uses:

1. a polylogarithmic actual-prime core `S`;
2. shift-uniform row code distance;
3. the decoder-defect expansion;
4. deterministic robust exact-cold rigidity on the retained witness block;
5. one-defect reciprocal amplification.

It does **not** use the one-block fingerprint-entropy theorem, the global
hot/cold encoder, adjacent-label propagation, or global level-set localization.

## 9. Diagonal partition scale

For a coherent integer label `m`, all retained `S x G` and `binom(G,2)` centred
CRT lifts equal `m` throughout the synchronized label range.  Hence

```text
T_U(m)=m^2 sigma_(G,S)^2,
```

where, uniformly for `|U|<=N/2`,

```text
sigma_(G,S)^2
 =sum_(r<t in G)1/(r^2t^2)
  +sum_(r in G,s in S)1/(r^2s^2)
asymp 1/(Z^2(log Z)^2).
```

Therefore

```text
sum_m exp(-kappa_b T_U(m))
 << Z log Z.
```

Summing the defect-set weights contributes only `(1+delta)^N=1+o(1)` for small
`U`; large `U` is exponentially negligible as above.  Thus the complete top
partition is

```text
O_b(Z log Z)
```

and the non-diagonal part is exponentially smaller.

This supplies exactly the polynomial normalization required to eliminate all
lower prime coordinates and all prime coordinates of `b` by the existing
weighted product-fibre argument.

## 10. Sparse denominator-sensitive family

The same core may replace the full-top denominator-sensitive family.  Put

```text
E_b^S={rs:r|b prime,s in S}.
```

For fixed `r|b`, every nonzero row difference contributes at least `1/r^2` per
sensor, so

```text
D_r>=|S|/r^2>>_b (log Z)^3.
```

The reciprocal and square loads are

```text
Lambda_b^S=O_b((log Z)^3/Z),
W2_b^S=O_b((log Z)^3/Z^2).
```

They are negligible in the complete-pair load, variance, and major-arc Taylor
estimates.  Thus the same sparse core controls both the prime CRT coordinates and
the squarefree target-denominator coordinates.

## 11. Consequence for the one-anchor proof DAG

The synchronized one-anchor architecture may now be organized as

```text
complete-pair load
+ sparse actual-prime top core
+ row code distance
+ decoder-defect cluster expansion
+ robust deterministic exact-cold witness theorem
+ direct full-family major arc
+ Gaussian and adaptive complete-pair tails
+ no-wrap and arithmetic closure.
```

Compared with the previous one-anchor route, it removes the load-bearing use of
fingerprint entropy.  Compared with the frozen multiblock paper-first route, it
also removes:

```text
all-block hot/cold bookkeeping,
adjacent-label propagation,
global injective encoding,
global level-set theorem,
multiblock localization,
separate sibling sector,
eta,
fixed reservoir size G.
```

The only surviving dense local theorem is deterministic exact-cold rigidity on a
positive-density witness block.  The complete internal witness edges are already
members of the natural complete-pair denominator family; no additional reciprocal
load is introduced.

## 12. Honest classification and remaining obligations

Established at argument level:

```text
DECODER-DEFECT EXPANSION — PROVED ARGUMENT
SMALL-DEFECT SYNCHRONIZATION — PROVED ARGUMENT
LARGE-DEFECT CLUSTER SUPPRESSION — PROVED ARGUMENT
SPARSE TARGET-DENOMINATOR CORE — PROVED ARGUMENT
```

Material theorem candidate:

```text
SPARSE ARITHMETIC SYNCHRONIZATION WITH EXPONENTIAL OFF-DIAGONAL TAIL.
```

Remaining assurance obligations:

1. write the robust positive-density-subset exact-cold theorem with the bounded
   repairs from `E306-PF-AUDIT-01` included explicitly;
2. verify the exact kernel exponent in the row sibling factor `delta`;
3. audit the defect-amplification constants and the label-size comparison;
4. integrate the top synchronization estimate with the lower-coordinate weighted
   fibre ledger and the already closed direct major arc;
5. perform an independent ordinary-mathematics route audit.

These are proof-development and assurance tasks unless one of them returns a
specific failed mathematical implication.

Current return:

```text
SPARSE ARITHMETIC SYNCHRONIZATION — ARGUMENT-LEVEL SOLUTION
FINGERPRINT ENTROPY — NO LONGER LOAD-BEARING IN THE PROPOSED ROUTE
ROUTE STILL NOT INDEPENDENTLY REVIEWED.
```
