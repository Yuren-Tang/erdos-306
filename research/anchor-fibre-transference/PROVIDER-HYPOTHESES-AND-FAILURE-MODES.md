# Provider hypotheses and failure modes

**Workstream:** `E306-AFT-01`  
**Status:** `GENERAL OBSTRUCTION LEDGER / COMPLETE COUNTEREXAMPLES`  
**Dependence:** `WEIGHTED-DECODED-SKELETON-THEOREM.md`,
`ANCHOR-FIBRE-FOURIER-TRANSFERENCE.md`

## 1. Purpose

The anchor–fibre theorem is useful only if its provider hypotheses are kept
separate.  This note gives explicit finite counterexamples showing that the
main hypotheses cannot be deleted by informal bookkeeping.

The examples are deliberately elementary.  They are obstructions to the
logical transference step, not to any particular arithmetic construction.

## 2. Omitting anchor weights is false

Let

```text
Y={0,1},
R={r},
X_r={star,u}.
```

Fix `0<delta<1`, and choose the decoder `star`.  Put

```text
a_(r,y)(star)=1,
a_(r,y)(u)=delta,
H_y=1.
```

Take anchor weights

```text
W_0=M,
W_1=0,
```

where `M>2`.

The true weighted off-decoder mass is

```text
M delta.
```

An unweighted argument which first proves row error `delta` and then multiplies
by the number of anchors gives only

```text
|Y| delta=2 delta.
```

This is false for `M>2`.

The correct theorem gives

```text
sum_y W_y delta=M delta.
```

### Conclusion

The anchor weight must be present before fibre compression.  It cannot be
restored later by counting anchors.

## 3. A hidden target coordinate can cancel the whole major term

This is a complete exact Fourier counterexample.

Let the target group be

```text
A=Z/2Z.
```

Let the random variable be identically zero:

```text
T=0 almost surely,
```

and ask for the target `t=1`.

The two characters are `chi_0=1` and `chi_1(x)=(-1)^x`.  Character
orthogonality gives

```text
2 Pr(T=1)
 =conjugate(chi_0(1))E chi_0(T)
  +conjugate(chi_1(1))E chi_1(T)
 =1-1
 =0.
```

If an analysis ignores the hidden `Z/2Z` coordinate, it retains only the
trivial character and sees the positive term `1`.  It would falsely infer
existence of the target.

### Conclusion

Every target coordinate must be observed by the anchor, a decoded fibre, or a
retained residual character.  Unsensed quotient coordinates are capable of
exact cancellation.

## 4. Nonuniform row distance cannot be replaced by a pointwise slogan

Let

```text
Y={good,bad},
R={r},
X_r={0,1,...,N-1}.
```

Choose decoder `0`.  Give both anchors weight `1`.

For `good`, put

```text
a_(r,good)(0)=1,
a_(r,good)(x)=0 for x!=0.
```

For `bad`, put

```text
a_(r,bad)(x)=1 for every x.
```

The good anchor is perfectly decoded.  The bad anchor has normalized row error

```text
epsilon_bad=N-1.
```

Saying merely that “each anchor has a minimum-energy decoder” gives no useful
compression.  The total off-decoder mass is `N-1`.

A valid proof must either:

1. establish a uniform error;
2. show that bad anchors have small total weight;
3. or sum the exact weighted errors anchor by anchor.

## 5. Discarding residual skeleton factors destroys the minor estimate

Let there be no fibres.  Take anchors

```text
Y={0,1,...,M}.
```

Let `0` be the major anchor and `1,...,M` minor anchors.  Put

```text
F(0)=1,
F(j)=-1/M^2  for 1<=j<=M.
```

Then

```text
sum_y F(y)=1-1/M>0.
```

Interpret the minor factor `1/M^2` as a residual skeleton damping factor.  If it
is retained, the total minor mass is `1/M` and positivity is immediate.

If residual factors are discarded using only `|H|<=1`, each of the `M` minor
anchors is bounded by `1`.  The resulting minor bound is `M`, which is larger
than the major term and proves nothing.

### Conclusion

Fibre compression must retain residual factors on the decoded skeleton.  They
are often the only source of intermediate- and large-label damping.

## 6. Raw anchor cardinality is not an anchor partition bound

Let `Y={y}` have one element and anchor weight

```text
W_y=exp(T).
```

The raw cardinality is `1`, while the anchor partition is `exp(T)`.  No estimate
of the form

```text
Z_anchor<=poly(|Y|)
```

follows from cardinality alone.

More generally, two anchor systems may have the same number of assignments and
exponentially different Gibbs partitions.  The transference theorem consumes
weighted mass, not combinatorial cardinality.

## 7. Pointwise decoder identification is not uniform identification

For each integer `n>=1`, let the coherent label set be

```text
L_n={1,...,n}.
```

There is one row `X={0,1}`.  Define the claimed decoder identification by

```text
d_n(m)=0 for m<n,
d_n(n)=1.
```

Suppose the desired coherent residue is always `0`.  For every fixed label `m`,

```text
d_n(m)=0
```

for all sufficiently large `n`.  Thus decoder identification holds pointwise in
`m`.

Nevertheless, at every scale `n` the moving endpoint label `m=n` is decoded
incorrectly.  Give that label skeleton weight `1` and every other label weight
`0`.  The entire coherent partition is then misidentified at every `n`.

### Conclusion

When the coherent range grows with the scale, decoder identification must be
uniform over that full moving range.  Pointwise eventual correctness is
insufficient.

## 8. Nonunique decoders may carry macroscopic sibling mass

Let one row have two states `a,b` with equal weights

```text
a(a)=a(b)=1.
```

Choose `a` as the decoder.  The chosen decoder is a genuine minimizer or
maximizer, but the other state contributes normalized error `1`.  Repeating
this in `k` independent rows gives total product mass `2^k` and decoder mass
`1`.

The weighted decoded-skeleton theorem remains true, with error `2^k-1`, but no
small-error consequence follows.

### Conclusion

A decoder selection theorem and a quantitative uniqueness/separation theorem
are different statements.

## 9. A plaquette obstruction to purely bipartite local decoding

The following arithmetic example explains why rowwise mutual nearest-decoder
conditions do not automatically imply a global integer diagonal.

Take the prime rectangle

```text
23+37=29+31.
```

Regard `{23,29}` and `{31,37}` as the two sides of `K_(2,2)`.  Assign centred
edge lifts around the four-cycle by

```text
0, 31, 23, 60.
```

Successive differences are divisible by the incident vertex primes, and the
cycle closes because the alternating prime sum is zero.  Every edge lift is
`O(1)` while every denominator is of order the square of the prime scale, so
the total bipartite edge energy is `O(Z^(-2))` after scaling the construction to
one large block.

The four vertex residues are not induced by one short integer label.  Yet each
side can be locally consistent with the other.  Adding a same-side chord forces
a constant-scale discrepancy and destroys the mode.

### Conclusion

Pure mutual row/column decoding does not replace internal witness rigidity.
Arithmetic cycle modes must be killed by chords, a global rigidity theorem, or
complex cancellation.

This obstruction is independent of the E306 route and is included here because
it marks a genuine boundary of the abstract mechanism.

## 10. Alias removal cannot be inferred from Fourier positivity

Let `M=Z`, `A=Z/2Z`, and let `pi:M->A` be reduction modulo `2`.  Let a random
variable take the value `0` or `2`, each with positive probability, and set the
target to `0`.

Then

```text
Pr(pi(T)=0)=1>0,
```

but positivity of the quotient coefficient does not distinguish the exact
values `0` and `2`.  If the target were required to be exactly `0`, an alias
criterion is still necessary.

### Conclusion

No-wrap, injective support, or a quantitative alias estimate is a separate
provider.

## 11. Minimal provider checklist

A valid application should record, separately:

1. **weighted anchor mass**, not raw cardinality;
2. **row decoder error**, uniform or weighted-average;
3. **quantitative decoder separation**, not mere existence;
4. **uniform identification** over the full coherent range;
5. **retained residual skeleton factors**;
6. **observability of every target coordinate**;
7. **positive complex major phase**, not only a modulus lower bound;
8. **exact alias/no-wrap control**.

## 12. Classification

```text
OMITTED-WEIGHT COUNTEREXAMPLE — COMPLETE
HIDDEN-TARGET CANCELLATION — COMPLETE
NONUNIFORM / NONUNIQUE DECODER FAILURES — COMPLETE
RESIDUAL-DAMPING FAILURE — COMPLETE
POINTWISE-NONUNIFORM IDENTIFICATION FAILURE — COMPLETE
BIPARTITE PLAQUETTE OBSTRUCTION — COMPLETE
ALIAS OBSTRUCTION — COMPLETE.
```
