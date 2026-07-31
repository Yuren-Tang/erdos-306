# Application, Obstruction, and Transfer Frontier

## 1. Immediate exact applications and extensions

All statements in this section have been independently accepted by the packet
mathematical audit. They retain the alphabet, coprimality, local-no-wrap,
simplicity, odd-prime, and source-uniform hypotheses displayed below. They are
not imported from the separate moving-target research return.

### 1.1 Arbitrary finite graphs and edge-dependent kernels

The sourced coefficient identity, component factorization,
syndrome/integer-reciprocal equivalence, support-core consequence, and
source-convolution identity hold for every finite loopless multigraph with
pairwise coprime vertex moduli. Analytic thin-sensor entropy does not follow
merely from changing the host graph.

The exact theorem permits arbitrary finite nonnegative Fourier supports and
edge-dependent normalization. The Bernoulli majorant permits edge-dependent
`theta_e` and `lambda_e`. Quantitative mixing requires activity bounded below
on the edges actually used for elimination.

### 1.2 Exact `2`-core restriction and zero-extension

Let every edge `e` have a finite integer alphabet `mathcal J_e` satisfying

```text
0 in mathcal J_e,
```

and assume every allowed nonzero symbol is nondivisible by either endpoint
modulus:

```text
j in mathcal J_e\{0}, v in e
 ==> n_v does not divide j.
```

Let `K=core_2(G)`. Restriction to `K` and zero-extension to the deleted edges
are inverse bijections between the alphabet-restricted homogeneous fibres:

```text
F_0(G,n,mathcal J)
 <->
F_0(K,n|_(V(K)),mathcal J|_(E(K))).
```

For the directly defined edge-symbol-resolved enumerator

```text
W_0(G;x)
 =sum_(j in F_0(G,n,mathcal J))product_e x_(e,j_e),
```

one has the exact factorization

```text
W_0(G;x)
 =product_(e notin E(K))x_(e,0) * W_0(K;x).
```

This is a nonlinear alphabet-restricted theorem. A forest's homogeneous fibre
is exactly the singleton zero assignment under the displayed zero-symbol and
nondivisibility hypotheses. No dimension or linear-code assertion is made
without additional module structure.

### 1.3 Odd-prime three-point minimum distance

Let `G` be simple, give its vertices distinct odd-prime moduli, and take

```text
mathcal J_e={-1,0,1}.
```

Every nonzero homogeneous restricted assignment has Hamming weight at least
`4`. Weights one and two are excluded by minimum support degree two. Weight
three would be a triangle on odd primes `p,q,r`; no-wrap would give

```text
+/-1/(pq) +/-1/(pr) +/-1/(qr)=0,
```

whose product with `pqr` is an impossible signed sum of three odd integers.
The odd-prime condition is essential, since

```text
1/6-1/10-1/15=0
```

on the triangle with moduli `2,3,5`.

### 1.4 Separator min-entropy certificate

Suppose a nested source-uniform elimination removes the vertices `O` and leaves
terminal core `C`, with

```text
M_(G[C])<=T,
n_p rho_p<=1+epsilon_p  for p in O.
```

Then

```text
max_beta Pr(partial_rec_tilde J=beta)
 <=T product_(p in O)(1+epsilon_p)
   /product_(v in V)n_v,
```

and hence

```text
H_infinity(partial_rec_tilde J)
 >=sum_(v in V)log n_v
   -log T
   -sum_(p in O)log(1+epsilon_p).
```

This is an upper bound on the largest syndrome atom, equivalently a min-entropy
certificate. It is not a total-variation theorem and is not by itself a
homogeneous-assignment-count lower bound.

### 1.5 Exact source convolution

For two nonnegative edge coefficient systems `c_e` and `d_e`, define

```text
r_e(k)=sum_(i+j=k)c_e(i)d_e(j).
```

With `N=product_v n_v`, their sourced coefficients satisfy

```text
Z_r(beta)
 =(1/N)sum_(gamma in A_G)
    Z_c(gamma)Z_d(beta-gamma).
```

This identity follows from additivity of the ambient syndrome homomorphism. It
is not a random-current switching lemma: it neither switches supports nor
preserves the original three-point alphabet.

### 1.6 Explicit non-Eulerian homogeneous witness

On `K_4` with vertex moduli `5,7,11,13`, order the edges as

```text
5*7, 5*11, 5*13, 7*11, 7*13, 11*13
```

and assign

```text
-1,   +1,   +1,    +1,   -1,    -1.
```

The exact identity

```text
-1/35+1/55+1/65+1/77-1/91-1/143=0
```

makes this a homogeneous reciprocal assignment. Its support is all of `K_4`
and has degree three at every vertex. A reciprocal homogeneous support need not
be Eulerian, an ordinary cycle, a signed circuit, or a cycle cover.

### 1.7 Exact hypergraph algebra

Let `H=(V,E)` be a finite loopless hypergraph with pairwise coprime vertex
moduli. Put

```text
n_e=product_(v in e)n_v
```

and define

```text
(partial_rec_tilde^H j)_v
 =sum_(e containing v)
   j_e (product_(w in e\{v})n_w)^(-1)
   mod n_v.
```

The same CRT expansion gives the exact sourced hypergraph coefficient identity
and

```text
partial_rec_tilde^H j=0
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

### 1.8 Several fixed target coordinates

The source vector is already product-valued. Finitely many fixed compatible
target constraints are therefore an immediate exact algebraic corollary.
Arithmetic closure still requires pairwise-coprime compatibility and a
row-observability estimate for each target direction.

## 2. E306 and Li's gap-free-floor conjecture

The controlling external comparison is Shisheng Li, *Every natural number is a
sum of distinct semiprime unit fractions*, arXiv:2606.15159v2 (17 June 2026).

The accepted E306 theorem proves the squarefree-denominator rational
representation conclusion by a different prime-window/Fourier construction. It
therefore **bypasses the representation implication for which Li's gap-free-
floor conjecture is sufficient**. It does not prove or imply that conjecture,
does not imply Li's primorial subset-sum interval assertion, and proves no
nontrivial growing gap-free interval in Li's exact set.

The quantifiers differ. The accepted fixed-target E306 proof may choose its
scale, Bernoulli centring, target rows, and auxiliary denominator family after
the fixed target is known. Li's GFF fixes one complete first-`N` primorial
family and asks for simultaneous positivity at every lattice point in a large
moving interval. Eventual representation of every fixed rational target does
not justify exchanging these quantifiers.

In particular:

- no growing interval theorem for one fixed Li primorial family is proved;
- fixed-target or target-adapted E306 families are not simultaneous coverage by
  one prescribed family;
- the compact moving-target local-saturation theorem returned at
  `#issuecomment-5146761939` is not integrated into this packet and remains
  outside it pending independent audit.

## 3. Robustness ledger

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
| Very sparse/forest-like host | often false | capacity can fail; the restricted homogeneous fibre may be singleton zero |
| Restricted prime set | conditional | verify load, supply, dispersion, row distance, and retained intervals |
| New sharp local limit | open in this packet | graph algebra supplies no minor-arc or variance theorem |

## 4. Exact obstructions

### Pairwise coprimality

Without pairwise coprimality, the product assignment space

```text
product_v Z/n_vZ
```

remains defined. What fails is unrestricted CRT lifting of an arbitrary tuple
of endpoint residues to a single class modulo the product. Consequently the
particular reciprocal-unit coefficient formula and the exact CRT graph identity
stated in this packet are unavailable without additional compatibility data.
Two vertices both of modulus `2` already admit residue pairs with no lift modulo
`4`.

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

The explicit `K_4` witness shows directly that odd support degree can occur.

## 5. CDC, 5-CDC, and AffineCDC boundary

There is no direct CDC, 5-CDC, or AffineCDC consequence in this packet.

Before any flow-cover transfer, one would need a theorem that converts a
reciprocal homogeneous assignment into a common-group or ordinary signed flow
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

## 6. First unresolved E306 packet boundary

At

```text
H=Z^(2/3),
```

the current worst-row estimate has scale only

```text
D_min >>1/(log Z)^3,
```

while the accepted absolute row/fibre summation needs a logarithmically growing
effective budget. Equivalent targets for progress are:

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
not false. This statement concerns the inherited packet boundary and does not
incorporate the separately returned moving-target theorem.

## 7. Ranked research questions

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

## 8. What survives unchanged

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
gain the reciprocal-fibre interpretation. No new stronger headline
representation theorem, Li/GFF theorem, moving-target theorem, or flow-cover
theorem is asserted here.
