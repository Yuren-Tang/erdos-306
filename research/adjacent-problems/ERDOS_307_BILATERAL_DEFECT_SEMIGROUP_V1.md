# Erdős 307: bilateral defect semigroup and monotone prefix geometry

**Programme:** `E306-RL-ADJ-05`  
**Status:** `GENERAL STATE CALCULUS / PROVED / SEARCH MECHANISM`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

E307 is equivalent to finding coprime squarefree integers `X,Y` with

```text
D(X)=Y,
D(Y)=X.
```

The preceding terminal-port note treats the case of one final prime on each side.  This note
develops a full bilateral residual calculus for arbitrary multiplicative fillers and proves
that the filler pairs act by a semigroup on defect states.

## 2. Bilateral state

For positive integers `X,Y`, define

```text
u=Y-D(X),
v=X-D(Y).
```

The state is

```text
S(X,Y)=(X,Y,u,v).
```

The success condition is exactly

```text
u=v=0.
```

For squarefree coprime `X,Y`, this is an E307 solution.

## 3. Arbitrary filler transition

Let `A,B` be positive integers and put

```text
X'=XA,
Y'=YB.
```

Using the arithmetic-derivative product rule,

```text
D(XA)=A D(X)+X D(A),
D(YB)=B D(Y)+Y D(B).
```

### Theorem 3.1 — bilateral defect update

The new defects are

```text
u'=Y(B-A)+A u-XD(A),
v'=X(A-B)+B v-YD(B).
```

### Proof

Since `D(X)=Y-u`,

```text
u'=YB-D(XA)
   =YB-A(Y-u)-XD(A)
   =Y(B-A)+A u-XD(A).
```

The second identity is symmetric. `square`

Denote this transformation by

```text
Phi_(A,B)(X,Y,u,v)
 =(
    XA,
    YB,
    Y(B-A)+A u-XD(A),
    X(A-B)+B v-YD(B)
  ).
```

## 4. Semigroup composition

### Theorem 4.1 — bilateral port composition law

For all positive fillers `A,B,C,D`,

```text
Phi_(C,D) o Phi_(A,B)=Phi_(AC,BD).
```

### Proof

Apply Theorem 3.1 twice.  The first new defect after the two stages is

```text
YB(D-C)
 +C{Y(B-A)+A u-XD(A)}
 -XA D(C).
```

Collecting terms gives

```text
Y(BD-AC)+ACu-X{C D(A)+A D(C)}.
```

By the product rule,

```text
D(AC)=C D(A)+A D(C),
```

so this equals the first component of `Phi_(AC,BD)`.  The second component is symmetric.
`square`

A Wolfram symbolic simplification independently returned the zero vector for the difference
between the two sides.

### Interpretation

Pairs of positive integers under componentwise multiplication act on the bilateral defect
state space.  This is the exact two-dimensional analogue of scalar port composition for
primary pseudoperfect numbers.

The difference is dynamical:

- scalar E313 ports may close and then inherit further fillings;
- a closed E307 state is rigid and has no nontrivial further filler by anti-inheritance.

## 5. Prime-pair transition

For prime fillers `p,q`, `D(p)=D(q)=1`.  The state update becomes

```text
X'=Xp,
Y'=Yq,
```

```text
u'=Y(q-p)+p u-X,
v'=X(p-q)+q v-Y.
```

This is an affine two-dimensional recurrence in the prime pair `(p,q)`.

The terminal equations `u'=v'=0` recover the one-prime-per-side completion formula.

## 6. Product-deficit identity

Define

```text
rho(X,Y)=D(X)D(Y)/(XY)
        =(sum_(p|X)v_p(X)/p)(sum_(q|Y)v_q(Y)/q).
```

For squarefree integers it is the product of the two reciprocal prime sums.

Also define

```text
Delta=XY-D(X)D(Y)=XY(1-rho).
```

### Proposition 6.1 — defect coordinates for Delta

In terms of the bilateral defects,

```text
Delta=Xv+Yu-uv.
```

### Proof

Use

```text
D(X)=Y-u,
D(Y)=X-v
```

and expand

```text
XY-(Y-u)(X-v).
```

`square`

This identity links the scalar reciprocal-product deficit to the two residual coordinates.

## 7. Monotone prefix invariant

Suppose `X,Y` are squarefree and we append new primes not already dividing them.  Then

```text
D(Xp)/(Xp)=D(X)/X+1/p,
D(Yq)/(Yq)=D(Y)/Y+1/q.
```

### Theorem 7.1 — reciprocal-product monotonicity

Under every nontrivial squarefree prime extension on either side,

```text
rho(X,Y)
```

strictly increases.

Consequently:

1. if `rho>1`, the prefix can never be extended to an E307 solution;
2. if `rho=1`, the reduced-denominator theorem already forces `D(X)=Y,D(Y)=X`, so the
   prefix is a complete cycle;
3. by anti-inheritance, a `rho=1` cycle admits no nontrivial multiplicative continuation;
4. every proper prefix of a hypothetical E307 solution must satisfy `rho<1`.

### Proof

Each appended prime adds a positive reciprocal to one logarithmic derivative.  Their product
therefore strictly increases.  The remaining statements use the E307 two-cycle theorem and
anti-inheritance. `square`

### Search consequence

A branch-and-bound search may discard a state immediately once

```text
rho>=1
```

unless it already verifies the exact cycle equations.

This is a genuine monotone pruning invariant absent from raw prime-set enumeration.

## 8. Terminal difference formula

For a prime-pair terminal completion, put

```text
Delta=Xv+Yu-uv.
```

Subtracting the two completion formulas gives

```text
q-p=(Xv-Yu)/Delta.
```

Thus integrality requires the scalar deficit to divide the oriented defect imbalance

```text
Xv-Yu.
```

Together with

```text
p=(XD(Y)+Y^2)/Delta,
q=(YD(X)+X^2)/Delta,
```

this yields three equivalent terminal coordinates:

1. the derivative data `D(X),D(Y)`;
2. the defects `u,v`;
3. the scalar deficit plus oriented imbalance.

This may be useful for modular sieving.

## 9. General block transitions

For squarefree fillers `A,B`, one may write

```text
D(A)=A L(A),
D(B)=B L(B),
```

where

```text
L(A)=sum_(p|A)1/p.
```

The transition becomes

```text
u'=Y(B-A)+A(u-XL(A)),
v'=X(A-B)+B(v-YL(B)).
```

A successful block pair must solve two coupled affine-linear equations in the integer values
`A,B` and their reciprocal logarithmic derivatives.

This is the natural starting point for:

- two-prime or three-prime block discriminants;
- meet-in-the-middle on `(A,D(A))` and `(B,D(B))`;
- bilateral port-primitive classifications;
- local congruence sieves.

## 10. Comparison with E313 port composition

The 2026 E313 port formalism uses a scalar state

```text
Delta_(R,c)(B)=cB-RD(B)
```

and its composition law.  The E307 state is intrinsically two-dimensional because each side
is simultaneously the target and the source of the other derivative equation.

The common mechanism is:

```text
Leibniz rule -> residual state -> multiplicative composition.
```

The divergent mechanism is:

```text
E313: closed state may inherit;
E307: closed state is terminal by positivity of D.
```

## 11. Computational programme

A serious search should store states by

```text
(X,Y,u,v,rho,Delta).
```

Recommended operations:

1. append prime pairs using the affine transition;
2. prune immediately at `rho>1`;
3. test terminal divisibility through `Delta | (Xv-Yu)` and the two prime formulas;
4. hash states by modular residues of `u,v,Delta`;
5. use meet-in-the-middle through the semigroup law;
6. privilege states with squarefree `D(X),D(Y)` or smooth terminal numerators.

The semigroup law allows independent filler blocks to be precomputed and composed without
re-expanding prime sets.

## 12. Exact frontiers

### Frontier A — monotone obstruction

Find a second monotone or convex quantity which, together with `rho`, excludes return to
`u=v=0`.

### Frontier B — bilateral discriminants

Derive explicit factorization/discriminant criteria for two-prime-per-side terminal blocks,
analogous to primary-pseudoperfect port fillings.

### Frontier C — collision of state trajectories

Use the semigroup action to find distinct filler pairs reaching the same residual state.  A
controlled collision may permit a gluing or descent argument.

### Frontier D — statistical dynamics

Study the distribution of `(u,v,rho)` under random prime append operations and determine
whether near-zero states are exponentially rare or structurally organized.

## 13. Classification

```text
BILATERAL DEFECT UPDATE — PROVED
SEMIGROUP COMPOSITION LAW — PROVED
WOLFRAM SYMBOLIC VERIFICATION — PASSED
SCALAR DEFICIT IDENTITY — PROVED
RECIPROCAL-PRODUCT MONOTONICITY — PROVED
TERMINAL DEFECT-IMBALANCE FORMULA — PROVED
BILATERAL DISCRIMINANT / CONSTRUCTION THEORY — OPEN
```

No E306 proof, manuscript, review, Curator, Lean, release, DOI, arXiv, or canonical status
changes through this adjacent-problem state calculus.