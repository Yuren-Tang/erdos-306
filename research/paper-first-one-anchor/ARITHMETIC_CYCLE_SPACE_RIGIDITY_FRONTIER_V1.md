# Arithmetic cycle-space rigidity after the plaquette obstruction

**Programme:** `E306-RL`  
**Research unit:** `E306-RL-PF1A-07`  
**Status:** `GENERAL STRUCTURE / PROVED OBSTRUCTION LEMMAS / NEW THEOREM FRONTIER`  
**Date:** 2026-07-23

## 1. Motivation

`BIPARTITE_PLAQUETTE_METASTABILITY_COUNTEREXAMPLE_V1.md` shows that mutual
nearest-decoder conditions do not force a short integer diagonal in a bipartite CRT
system.  The obstruction is not merely a bad constant.  It is a cycle-space
phenomenon.

This note extracts the exact integer lattice carried by a CRT graph, proves a
general balanced-cycle construction, and identifies the correct replacement for
naive direct bipartite rigidity.

## 2. Compatible edge-lift lattice

Let `H=(V,E)` be a finite graph.  Attach a pairwise coprime modulus `p_v` to each
vertex.  For an assignment `a_v mod p_v`, every edge `e=uv` has a unique centred CRT
lift

```text
h_e in [-p_u p_v/2,p_u p_v/2)
```

with

```text
h_e=a_u mod p_u,
h_e=a_v mod p_v.
```

Conversely, an integer edge vector `h=(h_e)` comes from a vertex assignment exactly
when

```text
h_e=h_f mod p_v
```

for every two edges `e,f` incident to the same vertex `v`.

Call such an edge vector **compatible**.  The diagonal sublattice consists of
constant vectors

```text
h_e=m
```

for one integer `m`.

For prime-scale vertices `p_v asymp Z`, the natural quadratic energy is

```text
Q_H(h)=sum_(e=uv) (h_e/(p_u p_v))^2.
```

The synchronization problem is a shortest-vector problem for the compatible edge
lattice modulo its constant diagonal.

## 3. Vertex increments and cycle closure

Fix an orientation of the line graph of `H`: two edge variables are adjacent when
the corresponding graph edges meet at a vertex.  Compatibility says that across a
vertex `v`, the edge-lift difference has the form

```text
h_e-h_f=k_(v;e,f) p_v
```

for an integer increment `k_(v;e,f)`.

Along a closed walk, the signed sum of these vertex-modulus increments must vanish.
Thus every non-diagonal low-energy mode is governed by a short integer relation
among the moduli encountered by a graph cycle.

## 4. Balanced even-cycle construction

### Proposition 4.1 — unit-increment cycle mode

Let

```text
C=(v_1,e_1,v_2,e_2,...,v_(2k),e_(2k),v_1)
```

be an even cycle.  Suppose its vertex moduli satisfy the alternating relation

```text
p_(v_1)-p_(v_2)+p_(v_3)-...-p_(v_(2k))=0.
```

Then the cycle supports a nonconstant compatible edge-lift vector with consecutive
increments equal to one signed vertex modulus.

### Proof

Set `h_(e_1)=0`.  Recursively define

```text
h_(e_i)-h_(e_(i-1))=(-1)^i p_(v_i)
```

with cyclic indices.  At vertex `v_i`, the two incident edge values differ by
`+p_(v_i)` or `-p_(v_i)`, so they are congruent modulo `p_(v_i)`.  The alternating
relation is exactly the closure condition returning from `e_(2k)` to `e_1`.
Therefore the edge vector is compatible and nonconstant.  `square`

### Corollary 4.2 — energy of a balanced cycle

If all cycle moduli lie in `[Z,2Z]`, then every constructed lift has magnitude at
most `2kZ`.  Hence

```text
Q_C(h)<=8 k^3/Z^2.
```

Thus a balanced cycle produces a non-diagonal mode whose energy tends to zero even
when every vertex modulus tends to infinity.

## 5. Four-cycles and repeated gaps

For a four-cycle with column moduli `a,b` and row moduli `c,d`, the balance condition
is

```text
a+d=b+c,
```

or equivalently

```text
b-a=d-c.
```

This is precisely an equal-gap rectangle.  The edge lifts may be chosen as

```text
0,c,a,a+d.
```

The exact prime example

```text
23+37=29+31
```

is the smallest clean instance used in the preceding counterexample.

### Proposition 5.1 — repeated differences in a dense integer set

Let `A` be a set of `N` integers contained in an interval of length `L`.  Some
positive difference occurs at least

```text
N(N-1)/(2L)
```

times among unordered pairs from `A`.

### Proof

There are `N(N-1)/2` unordered pairs and at most `L` positive differences.
Pigeonhole gives the claim.  `square`

Pairs with one fixed positive difference form disjoint paths in the graph on `A`
joining `n` to `n+g`.  A matching contains at least half of those pairs.  Hence,
when `N^2/L` tends to infinity, equal-gap rectangles occur abundantly after a
suitable bipartition of the matched pairs.

For primes in a fixed-ratio interval at scale `Z`, PNT gives

```text
N asymp Z/log Z,
N^2/Z asymp Z/(log Z)^2 -> infinity.
```

Therefore additive prime rectangles are a persistent arithmetic resource, not an
isolated small-number coincidence.

This does not say that every prescribed sparse bipartite graph contains such a
rectangle.  It says that a graph design intended to prove CRT rigidity must control
which additive relations its cycle space admits.

## 6. Why high girth alone is not enough

Removing short cycles eliminates plaquettes, but a forest has no closure equations
at all.  On a tree, one may choose an initial edge lift and then propagate arbitrary
integer multiples of successive vertex moduli along the edges.  The absence of
cycles therefore creates many compatible non-diagonal modes rather than rigidity.

The correct requirement is not simply high girth.  One needs simultaneously:

1. enough independent cycles to constrain the compatible lattice;
2. no low-coefficient arithmetic balance on those cycles;
3. quantitative expansion ensuring that a local increment cannot remain confined
   to a small part of the graph.

## 7. Arithmetic cycle spectral gap

For a graph `H` with prime moduli, define informally

```text
lambda_ar(H)
 = inf Q_H(h)
```

over compatible edge-lift vectors outside the allowed short constant diagonal,
with a fixed normalization excluding multiplication by the full CRT modulus.

A useful theorem must lower-bound not only the energy of one nonzero vector but the
weighted partition of the entire compatible lattice outside the diagonal.

Balanced cycles show

```text
lambda_ar(H)<=O(k^3/Z^2)
```

whenever `H` contains a balanced cycle of length `2k`.

The current complete internal witness graph avoids relying on a sparse
cycle-spectrum theorem: its dense same-side interactions yield the robust
exact-cold floor directly.  Any proposed replacement must prove an arithmetic
cycle spectral gap strong enough to dominate the relevant assignment entropy.

## 8. New theorem frontier

### Sparse arithmetic cycle-expander problem

Construct a sparse graph on actual prefix primes, together with the necessary
core--witness incidence, such that:

1. every nonzero vertex fibre has the required local cyclic distance;
2. every compatible nonconstant edge-lift mode has a large arithmetic cycle-space
   energy;
3. the complete off-diagonal Gibbs partition is negligible;
4. short constant integer modes are retained with the correct Gaussian variance;
5. reciprocal and square loads remain below the target budget.

A positive theorem would remove the remaining dense exact-cold provider and could
open a non-enumerative route past the sampled-core square-root barrier.

A negative theorem should prove that every prefix-bounded sparse graph with the
required local degrees contains either:

- a balanced or near-balanced short cycle;
- a tree-like low-energy mode;
- or a sufficiently large family of metastable compatible lattice vectors.

## 9. Design consequences

The plaquette and cycle lemmas narrow the viable mechanisms to three families.

### 9.1 Chorded arithmetic expanders

Use same-side or additional cross chords chosen so that every short arithmetic
cycle receives a large penalty.  This is closest to the current exact-cold witness
system but may use far fewer edges.

### 9.2 Joint lattice decoding

Analyze the compatible edge lattice globally rather than alternating vertex
fibres.  The desired estimate is a lattice theta-function bound modulo the constant
diagonal.

### 9.3 Complex cancellation

Retain the complex phases of different cycle modes.  Absolute-value Gibbs bounds
count every metastable plaquette positively and cannot exploit cancellation.

## 10. Disposition

Established at argument level:

```text
COMPATIBLE EDGE-LIFT LATTICE DESCRIPTION;
BALANCED EVEN-CYCLE MODE;
O(k^3/Z^2) CYCLE-ENERGY UPPER BOUND;
REPEATED-GAP SOURCE OF PRIME PLAQUETTES;
HIGH-GIRTH-ALONE OBSTRUCTION.
```

Exact frontier:

```text
SPARSE ARITHMETIC CYCLE-SPACE SPECTRAL GAP
OR
COMPLEX CANCELLATION OF METASTABLE CYCLE MODES.
```

The current sparse-synchronization route is unchanged and remains dependent on the
robust deterministic exact-cold witness theorem until such a result is proved.

No proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv, or
canonical status changes through this note.
