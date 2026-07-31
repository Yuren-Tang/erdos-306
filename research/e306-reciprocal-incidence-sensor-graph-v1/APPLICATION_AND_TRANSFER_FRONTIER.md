# Application, Obstruction, and Transfer Frontier

## 1. Immediate exact extensions

### Arbitrary finite graphs

The sourced coefficient identity, syndrome cosets, component factorization,
syndrome/integer-reciprocal equivalence, and support-core consequence hold for
every finite loopless multigraph with pairwise coprime vertex moduli. Analytic
thin-sensor entropy does not follow merely from changing the host graph.

### Edge-dependent kernels

The exact theorem permits arbitrary finite nonnegative Fourier support and
edge-dependent normalization. The Bernoulli majorant permits edge-dependent
`theta_e` and `lambda_e`. Quantitative mixing requires positive activity on the
edges actually used for elimination.

### Several fixed target coordinates

The source vector is already product-valued. Finitely many fixed compatible
target constraints are therefore an immediate exact algebraic corollary.
Arithmetic closure still requires pairwise-coprime compatibility and a
row-observability estimate for each target direction.

### Hypergraph algebra

Let `H=(V,E)` be a finite loopless hypergraph with pairwise coprime vertex
moduli. Put

```text
n_e=product_(v in e)n_v.
```

For a hyperedge label `j_e`, define

```text
(partial_rec^H j)_v
 =sum_(e containing v)
   j_e (product_(w in e\{v})n_w)^(-1)
   mod n_v.
```

The same CRT expansion proves the exact hypergraph coefficient identity and

```text
partial_rec^H j=0
iff
sum_e j_e/n_e is an integer.
```

Under local no-wrap, a nonzero support hypergraph has no vertex of support
degree one.

This exact extension does not close the analytic problem. For a complete
`k`-uniform prime-product family, the first missing estimate is source-uniform
inverse-product concentration:

```text
sup_t Pr(
 sum_(q_1,...,q_(k-1))
 J_(p,q_1,...,q_(k-1))
 (q_1...q_(k-1))^(-1)
 =t mod p
).
```

No accepted theorem supplies the required dispersion.

## 2. Robustness ledger

| Proposed transfer | Status | Exact qualification |
|---|---|---|
| Irregular sensor subset with `|S| asymp H/log Z` in the same interval | bounded corollary | actual cardinality and diameter enter the constants |
| Constant-fraction sensor deletion | bounded corollary | use surviving count in variance and concentration |
| Thinning far below `H/log Z` | open | needs a sparse nested-core entropy theorem |
| Movable sensor with retained damping interval preserved | bounded architecture | all coverage and separation checks must be redone |
| Arbitrary sensor location | blocked | may consume the only retained damping interval |
| Several blocks when one is sufficient | immediate | designate one block as sensor, retain others |
| Cooperative subcritical blocks | open | needs multi-core sourced elimination and joint row distance |
| Arbitrary denominator-edge deletion | false | can destroy rigidity or retained damping |
| Reciprocal-dispersed sparse graph sequence | open theorem | needs nested separator certificates |
| Very sparse/forest-like host | often false | capacity can fail; local no-wrap kernel may be zero |
| Restricted prime set | conditional | verify load, supply, dispersion, row distance, and retained intervals |
| New sharp local limit | open | graph algebra supplies no minor-arc or variance theorem |

## 3. Exact obstructions

### Pairwise coprimality

Without compatible CRT data, the product assignment space and the stated
coefficient identity are not defined. Two vertices both of modulus `2` already
admit residue pairs with no lift modulo the product.

### Nonnegative Fourier coefficients

Orthogonality still expands a signed kernel, but the probability interpretation
requires nonnegative coefficients. A kernel such as

```text
1-cos(2pi t)
```

has negative nonconstant coefficients and is not a current law.

### Vanishing activity

If every activity is zero, every edge current is deterministically zero.
Source-uniform mixing is impossible. Hence no theorem is uniform as activity
tends to zero.

### Decoder history

A completion rule depending on hidden-coordinate history need not be injective
when indexed only by the sensor state. Enlarging the state may restore
injectivity, but creates a new entropy problem.

### Support geometry

The support-core theorem gives minimum degree two only. It does not provide:

- ordinary integer conservation;
- even degree;
- an Eulerian support;
- a cycle or signed-circuit decomposition;
- nowhere-zero support on a prescribed host;
- twofold edge coverage.

## 4. CDC, 5-CDC, and AffineCDC boundary

There is no direct CDC, 5-CDC, or AffineCDC consequence in this packet.

Before any flow-cover transfer, one would need a theorem that converts a
reciprocal kernel configuration into a common-group or ordinary signed flow
while preserving enough support information. At minimum it must provide:

1. a coefficient-preserving or controlled projection from heterogeneous
   reciprocal syndromes to one common flow group;
2. ordinary or signed conservation at every host vertex;
3. a decomposition into cycles or rigorously defined signed circuits;
4. nowhere-zero or otherwise prescribed host-edge support;
5. a coverage theorem, ultimately giving the required multiplicity on every
   host edge;
6. compatibility with the reduction/gluing operation used by the target
   flow-cover theory.

No such theorem is currently available. The support-core consequence is far
weaker.

## 5. First unresolved E306 boundary

At

```text
H=Z^(2/3),
```

the current worst-row estimate has scale only

```text
D_min >>1/(log Z)^3,
```

while the accepted absolute row/fibre summation needs a logarithmically
growing effective budget. Equivalent targets for progress are:

1. gain slightly more than four logarithmic powers in the worst-row estimate;
2. prove a uniform inverse-residue row distance
   ```text
   min_(r,d!=0)
   sum_(q in B_H)||d q^(-1)/r||^2
   >>log Z;
   ```
3. avoid independent absolute row summation by a heterogeneous joint row-flow
   theorem;
4. obtain cancellation in the residual complex Fourier kernel.

No arithmetic counterexample at the boundary is known. The endpoint is open,
not false.

## 6. Ranked research questions

### 1. Heterogeneous joint row-flow theorem

Prove a source-uniform partition theorem for the full sensor-row bipartite
graph, retaining shared sensor edges rather than summing absolute row tails.
The first lemma is a nearly uniform sourced syndrome estimate for heterogeneous
row moduli.

### 2. Short-interval inverse-residue row distance

Prove a uniform lower bound strong enough to close the limiting cubic scale.
This is the cleanest arithmetic endpoint route but may require genuinely new
short-interval inverse-residue distribution.

### 3. Reciprocal-dispersed sparse graph theorem

Characterize graph sequences admitting nested separators whose cross
neighbourhoods have quantitative reciprocal dispersion. Express entropy in
terms of weighted degree, interval diameter, and terminal-core size.

### 4. Higher-uniformity inverse-product concentration

Establish the hypergraph estimate displayed in Section 1. This is the first
analytic obstacle to squarefree products of more than two primes.

### 5. Nonuniform elliptic selection

Allow edge-dependent selection parameters bounded away from `0` and `1`, prove
the corresponding sourced concentration, and optimize the variational entropy

```text
sum_e H(theta_e).
```

### 6. Joint value-cardinality local limit

Prove a two-parameter local limit rather than extracting one cardinality from a
concentration window. This strengthens quantitative multiplicity but is not
needed for existence.

### 7. Minimal reciprocal-support theory

Develop a coefficient-sensitive notion of support minimality over the actual
mixed-modulus operator. Determine when classical balanced cycles or handcuffs
remain feasible after reciprocal congruences. This is a prerequisite for any
honest circuit terminology.

## 7. What survives unchanged

The accepted representation theorem and its established quantitative
consequences do not need stronger public statements from this packet. Under the
thin-sensor replacement, the following remain structurally unchanged:

- the headline squarefree-semiprime representation theorem;
- entropy rate;
- exact-cardinality extraction at its proved scale;
- Hamming-separated representation families;
- denominator-height rate;
- refinement branching;
- global transfer.

The sharp coefficient uses the corrected total variance. Balanced relations
gain the reciprocal-code interpretation. No new stronger headline
representation theorem is asserted.
