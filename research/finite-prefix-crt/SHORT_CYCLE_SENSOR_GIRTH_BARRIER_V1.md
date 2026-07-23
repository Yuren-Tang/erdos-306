# Short-cycle sensor barriers beyond C4

**Programme:** `E306-RL-FPCRT-02`  
**Status:** `CONDITIONAL METHOD-CLASS BARRIER / PROVED GRAPH LEMMAS`  
**Date:** 2026-07-23

## 1. Purpose

`C4_FREE_SENSOR_SQUARE_ROOT_BARRIER_V1.md` shows that the current square-root GFF
scale saturates the extremal density of four-cycle-free bipartite graphs.  One might
try to operate exactly at that density with a C4-free incidence graph.

This note shows why girth alone still cannot supply arithmetic synchronization.
At the required degree, six-cycles are unavoidable.  Balanced six-cycles carry the
same unit-increment CRT lattice modes as the plaquette, and additive three-prime
collisions are abundant in the ambient prime block.

## 2. A girth-eight degree bound

### Theorem 2.1

Let `H=(L,R,E)` be a bipartite graph with

```text
|L|=|R|=n
```

and minimum degree at least `D`.  If `H` has no four-cycle and no six-cycle, then

```text
n >= D+D(D-1)^2.
```

In particular,

```text
D <= n^(1/3)+2.
```

### Proof

Choose a vertex `v in L`.

The first neighborhood in `R` has at least `D` vertices.

Every first-neighborhood vertex has at least `D-1` further neighbors in `L`.
Because there is no four-cycle, all these second-level vertices are distinct.
Thus level two has at least

```text
D(D-1)
```

vertices.

Every second-level vertex has at least `D-1` further neighbors in `R`.  These
third-level endpoints are all distinct and are outside the first neighborhood:

- two paths through the same first-level parent meeting again would create a
  four-cycle;
- two paths through different first-level parents meeting would create a
  six-cycle;
- returning to the first neighborhood also creates a cycle of length at most six.

Hence the right side contains at least

```text
D+D(D-1)^2
```

vertices.  This proves the claim.  `square`

## 3. Consequence for small-q sensor degree

The implemented actual-prime sensing architecture uses

```text
M asymp (log Z)^3/q
```

neighbors per row at the current worst-test population scale.  With

```text
n asymp Z/log Z,
```

a graph avoiding both `C4` and `C6` would require

```text
(log Z)^3/q << n^(1/3).
```

Thus

```text
q >> Z^(-1/3) (log Z)^(10/3).
```

This is much larger than the square-root candidate floor.  Therefore a sensor graph
capable of the current

```text
q asymp Z^(-1/2)(log Z)^(7/2)
```

must contain a four-cycle or a six-cycle.  If it is designed to be C4-free, then it
necessarily contains six-cycles in the relevant density regime.

## 4. Balanced six-cycle CRT modes

Let an even cycle have vertex moduli `p_1,...,p_6` in cyclic order.  If

```text
p_1-p_2+p_3-p_4+p_5-p_6=0,
```

then Proposition 4.1 of
`ARITHMETIC_CYCLE_SPACE_RIGIDITY_FRONTIER_V1.md` constructs a nonconstant compatible
edge-lift mode with unit vertex increments.

For moduli in `[Z,2Z]`, its energy is

```text
O(1/Z^2).
```

Equivalently, a collision

```text
p_1+p_3+p_5=p_2+p_4+p_6
```

creates a balanced six-cycle mode.

## 5. Abundance of three-sum collisions

Let `A` be a set of `N` integers in an interval of length `L`.  There are
`binom(N,3)` unordered three-element sums, while all sums lie in an interval of
length at most `3L`.  Therefore some sum occurs at least

```text
binom(N,3)/(3L+1)
```

times.

For a prime block at scale `Z`,

```text
N asymp Z/log Z,
L asymp Z,
```

so the maximum three-sum multiplicity is at least

```text
>> Z^2/(log Z)^3.
```

After discarding intersecting triples greedily, many disjoint pairs of equal-sum
triples remain.  Thus the ambient prime population contains abundant balanced
six-vertex relations.

As with four-cycles, this does not prove that every prescribed graph contains the
corresponding cycle.  It shows that random labeling or unstructured dense incidence
cannot expect arithmetic balance to be rare merely because the moduli are prime.

## 6. Girth hierarchy and the power scale

For a sensor route that tries to eliminate all cycle modes by forbidding short
even cycles:

- avoiding `C4` allows degree at most `n^(1/2)`;
- avoiding both `C4` and `C6` allows degree at most `n^(1/3)`.

The current square-root degree lies exactly at the first threshold and far above the
second.  Hence high-girth graph design can at best postpone the first arithmetic
cycle obstruction from length four to length six; it cannot remove short-cycle
metastability at the required sensing density.

More generally, standard Moore-type breadth-first growth suggests the hierarchy

```text
girth >2k  =>  degree at most about n^(1/k),
```

but only the `k=2` and `k=3` cases needed here are proved in these notes.

## 7. Revised route frontier

The following strategy is now ruled out as a route to the square-root floor:

```text
use local absolute-value row decoding
+ choose a sparse graph with no short cycles
+ infer global integer synchronization.
```

At the required degree, some short cycle is forced.  Because the prime population
contains many additive balances, the proof must do more than control graph girth.

Viable directions are:

1. **arithmetic chord expansion:** add a small family of same-side or cross chords
   which charges every balanced `C4` and `C6` mode;
2. **cycle-lattice theta bounds:** sum the compatible lattice globally rather than
   vertex by vertex;
3. **complex cancellation:** retain phases and show that balanced-cycle modes cancel
   in the Fourier sum;
4. **average/joint decoding:** leave the worst-row absolute-value framework.

## 8. Disposition

Established:

```text
C4-AND-C6-FREE MINIMUM-DEGREE BOUND;
SQUARE-ROOT SENSOR DENSITY FORCES A C4 OR C6;
BALANCED SIX-CYCLE CRT MODE;
ABUNDANCE OF THREE-PRIME SUM COLLISIONS.
```

Not established:

```text
that every forced graph cycle is arithmetically balanced;
that balanced-cycle modes survive the full complex Fourier sum;
a problem-level lower bound for GFF.
```

Exact frontier:

```text
ARITHMETIC CHORD EXPANSION OR COMPLEX CYCLE-MODE CANCELLATION.
```

No proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv, or
canonical status changes through this note.
