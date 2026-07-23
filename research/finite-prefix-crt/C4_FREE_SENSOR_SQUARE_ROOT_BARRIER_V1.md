# The C4-free sensor threshold and the square-root GFF scale

**Programme:** `E306-RL-FPCRT-02`  
**Status:** `CONDITIONAL METHOD-CLASS BARRIER / STRUCTURAL SCALE IDENTIFICATION`  
**Date:** 2026-07-23

## 1. Purpose

The small-parameter complete-pair route currently gives the candidate floor

```text
q >> Z^(-1/2) (log Z)^(7/2).
```

`SAMPLED_CORE_DEFECT_EXPANSION_POWER_BARRIER_V1.md` explains the power `1/2` by
explicit core entropy.  The plaquette counterexample reveals a second, independent
source of exactly the same scale: the extremal density of four-cycle-free bipartite
graphs.

This note proves the elementary graph bound and records the precise conditional
implication for actual-prime sensor designs.  It is a method-class statement, not a
lower bound for GFF.

## 2. Sensor degree in the current small-q architecture

Let the top prime population have scale `Z` and size

```text
n asymp Z/log Z.
```

For one row and one nonzero residue difference, the currently proved uniform
population energy is

```text
mu_Z >> 1/(log Z)^2.
```

The Bernoulli kernel exponent is linear in the target parameter:

```text
|K_theta(t)| <= exp(-c q ||t||^2)
```

when `theta asymp q`.

To make the complete sibling sum for one row smaller than a fixed negative power of
`Z`, the raw cyclic distance must satisfy

```text
q D_row >> log Z.
```

Sampling at the proved worst-case population scale therefore uses row degree

```text
M
 asymp D_row/mu_Z
 asymp (log Z)^3/q.
```

This is the degree scale of the existing target-adaptive common-core construction.
The statement is conditional on using the current worst-test population floor and
absolute-value row suppression; a stronger reciprocal-dispersion theorem could
reduce the logarithmic powers.

## 3. Elementary C4-free extremal bound

### Theorem 3.1

Let `H=(L,R,E)` be a bipartite graph with

```text
|L|=|R|=n
```

and no four-cycle.  If `m=|E|`, then

```text
m <= n^(3/2)+n.
```

### Proof

For `v in R`, let `d_v` be its degree.  Because the graph has no four-cycle, two
distinct vertices of `L` have at most one common neighbor in `R`.  Therefore

```text
sum_(v in R) binom(d_v,2) <= binom(n,2).
```

Convexity of `x -> binom(x,2)` gives

```text
n binom(m/n,2) <= binom(n,2).
```

Equivalently,

```text
m^2/n-m <= n^2-n.
```

The positive root is below `n^(3/2)+n`, proving the claim.  `square`

### Corollary 3.2

A biregular or minimum-degree-`M` bipartite graph with no four-cycle satisfies

```text
M <= sqrt(n)+1.
```

## 4. Exact square-root balance

Combine the implemented sensor degree

```text
M asymp (log Z)^3/q
```

with

```text
n asymp Z/log Z
```

and the C4-free constraint `M<<sqrt(n)`.  One obtains

```text
(log Z)^3/q
 << sqrt(Z/log Z),
```

or

```text
boxed: q >> Z^(-1/2) (log Z)^(7/2).
```

Thus the current GFF scale is exactly the density at which a sensor graph using the
proved worst-test reciprocal population can still hope to be four-cycle-free.

At the candidate floor,

```text
M asymp sqrt(n).
```

Below the candidate floor by any fixed power of `Z`, the required degree is
`n^(1/2+epsilon)` up to logarithms, and every such graph necessarily contains many
four-cycles.

## 5. Relation to arithmetic plaquette modes

A graph-theoretic four-cycle is not automatically a low-energy CRT plaquette.  The
unit-increment mode additionally needs an arithmetic balance

```text
p_1+p_3=p_2+p_4,
```

or a sufficiently near-balanced replacement.

Nevertheless:

1. exact additive prime rectangles exist abundantly in the ambient prime block;
2. the counterexample shows that a balanced four-cycle supports a strict
   non-diagonal mutual decoder mode;
3. once the graph density exceeds the C4-free threshold, avoiding all four-cycles
   is impossible, so one must control their arithmetic labels rather than delete
   the cycle space combinatorially.

This distinguishes two barriers:

```text
COMBINATORIAL C4 THRESHOLD
```

and

```text
ARITHMETIC BALANCE OF THE FORCED C4s.
```

The first is proved here.  The second is the next mathematical frontier.

## 6. Consequences for route design

### 6.1 What can still work at the current floor

A near-extremal C4-free or very-low-codegree incidence graph could replace the
common core enumeration while retaining degree `asymp sqrt(n)`.  Such a theorem
would not improve the power `1/2`, but it could:

- give non-enumerative synchronization at the same scale;
- improve logarithmic factors;
- reduce proof and load complexity;
- isolate longer-cycle arithmetic obstructions.

The graph must also satisfy the actual-prime row-distance tests; abstract C4-free
incidence alone is not sufficient.

### 6.2 What cannot cross the power barrier

A strategy whose only protection against plaquettes is `C4-free` cannot operate
with degree much larger than `sqrt(n)`.  Therefore it cannot prove targets

```text
q << Z^(-1/2-o(1))
```

while retaining the current local-distance requirement.

### 6.3 Genuine escape routes

To cross the square-root power, at least one of the following is necessary:

1. improve the worst-test reciprocal population substantially;
2. tolerate four-cycles but prove they are arithmetically unbalanced;
3. add sparse chords which penalize every balanced cycle;
4. bound the full arithmetic cycle-lattice theta function;
5. exploit complex Fourier cancellation among plaquette modes;
6. abandon independent worst-row absolute-value decoding.

## 7. General logarithmic form

Suppose the proved population scale is

```text
mu_Z asymp (log Z)^(-b).
```

Then row suppression uses

```text
M asymp (log Z)^(b+1)/q.
```

The C4-free extremal bound gives the conditional threshold

```text
q >> Z^(-1/2) (log Z)^(b+3/2).
```

For the current `b=2`, this is exactly

```text
Z^(-1/2) (log Z)^(7/2).
```

Hence improving reciprocal dispersion from `b=2` to `b=0` would change the
C4-free logarithmic threshold to `Z^(-1/2)(log Z)^(3/2)`, but would still not cross
the power `1/2`.

## 8. Disposition

Established:

```text
C4-FREE BIPARTITE EDGE BOUND;
CURRENT SENSOR DEGREE SATURATES THE C4-FREE THRESHOLD;
SECOND INDEPENDENT EXPLANATION OF THE SQUARE-ROOT POWER;
EXACT LOGARITHMIC MATCH AT b=2.
```

Not established:

```text
that every forced C4 is arithmetically balanced;
that a C4-free actual-prime sensor graph with all row-distance properties exists;
that the square-root scale is a lower bound for GFF.
```

Exact next frontier:

```text
ARITHMETIC CONTROL OR COMPLEX CANCELLATION OF FORCED FOUR-CYCLES.
```

No proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv, or
canonical status changes through this method-class theorem.
