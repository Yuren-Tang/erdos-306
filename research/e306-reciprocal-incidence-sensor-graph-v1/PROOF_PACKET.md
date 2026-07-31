# Proof Packet

This file proves the exact finite statements in `THEOREM_PACKET.md` and records
the accepted analytic dependency chain. Sections 8–12 are inherited audited
provider/dependency proofs: they explain how the accepted providers compose,
but do not replace those providers by unstated self-contained reproofs.

## 1. CRT phase factorization

Let `e={u,v}` and let `h=h_e(a)` be the CRT lift modulo `n_u n_v`. Modulo one,
the standard CRT formula gives

```text
h/(n_u n_v)
 =a_u n_v^(-1)/n_u
  +a_v n_u^(-1)/n_v.
```

Hence, for every integer `j`,

```text
e(jh/(n_u n_v))
 =e(j a_u n_v^(-1)/n_u)
  e(j a_v n_u^(-1)/n_v).
```

The same label `j` occurs at both endpoints. There is no orientation sign and
no diagonal multiplicity.

## 2. Exact sourced identity and restricted fibres

Expand every edge kernel:

```text
product_e K_e(h_e(a)/n_e)
 =sum_(j in product_e mathcal J_e)
    product_e c_e(j_e)
    product_e e(j_e h_e(a)/n_e).
```

Finiteness permits interchange of sums. After the CRT phase factorization, the
total phase involving one vertex coordinate `a_v` is

```text
e(
 a_v[
   sum_(e={v,w})j_e n_w^(-1)-beta_v
 ]/n_v
).
```

Therefore

```text
sum_(a_v mod n_v)
 e(a_v[(partial_rec_tilde j)_v-beta_v]/n_v)
```

equals `n_v` when `(partial_rec_tilde j)_v=beta_v` and equals `0` otherwise.
Taking the product over all vertices gives

```text
Z_G(beta)
 =product_v n_v
  *sum_(j in F_beta(G,n,mathcal J))
     product_e c_e(j_e).
```

Normalize `c_e(j)` by `C_e`. Independence of the random variables `J_e` gives

```text
sum_(j in F_beta) product_e c_e(j_e)
 =product_e C_e * Pr(partial_rec_tilde J=beta),
```

which proves Theorem 1.2.

The ambient map `partial_rec_tilde:Z^E->A_G` is additive. Intersecting one of
its full inverse images with an arbitrary finite product alphabet produces only
an alphabet-restricted fibre; the intersection need not be a subgroup or a
coset. Literal kernel/coset language becomes available only when a separate
additive allowed-label group, subgroup, or module domain compatible with the
syndrome homomorphism is supplied. Corollary 1.3 therefore defines the
edge-symbol-resolved enumerator directly.

If the graph is disconnected, every factor and every syndrome equation belongs
to one component. Both the assignment sum and the independent-label
probability factor, proving Corollary 1.4.

For absolutely summable nonnegative coefficient families, Tonelli's theorem
permits the same expansion; finite vertex sums cause no further convergence
issue.

### 2.1 Exact source convolution

Let `c_e` and `d_e` be two coefficient systems and let

```text
r_e(k)=sum_(i+j=k)c_e(i)d_e(j).
```

Expanding the `r`-system is equivalent to choosing two integer edge-label
vectors `i` and `j` and using their sum `i+j`. Additivity gives

```text
partial_rec_tilde(i+j)
 =partial_rec_tilde i+partial_rec_tilde j.
```

Write `N=product_v n_v`. By Theorem 1.2,

```text
Z_r(beta)
 =N sum_(gamma in A_G)
    [sum_(partial_rec_tilde i=gamma)product_e c_e(i_e)]
    [sum_(partial_rec_tilde j=beta-gamma)product_e d_e(j_e)].
```

Each bracket equals the corresponding sourced coefficient divided by `N`.
Thus

```text
Z_r(beta)
 =(1/N)sum_(gamma in A_G)
   Z_c(gamma)Z_d(beta-gamma).
```

No support-switching involution is used, and convolution generally enlarges the
edge alphabet. This proves Theorem 1.5 with its stated limitation.

## 3. Bernoulli three-point majorant

Let

```text
nu=theta(1-theta).
```

A direct calculation gives

```text
f(t)^2
 =|(1-theta)+theta e(t)|^2
 =1-2nu(1-cos(2pi t)).
```

Put

```text
x=2nu(1-cos(2pi t)).
```

Since `0<=nu<=1/4` and `0<=1-cos<=2`, one has `0<=x<=1`. For
`0<lambda<=1`, concavity of `y -> y^(lambda/2)` gives

```text
(1-x)^(lambda/2)
 <=1-(lambda/2)x.
```

Thus

```text
f(t)^lambda
 <=1-lambda nu(1-cos(2pi t))
 =1-lambda nu
   +(lambda nu/2)e(t)
   +(lambda nu/2)e(-t).
```

All coefficients are nonnegative and sum to one. This proves Proposition 2.1.

The concentration constant depends on the activity
`eta=lambda theta(1-theta)`. Uniformity over compact parameter sets therefore
uses a constant `c_(Theta,Lambda)` depending on both the compact `theta` range
and the compact `lambda` range. If the activity tends to zero, the law converges
to the deterministic zero current and no uniform mixing estimate can persist.

## 4. Syndrome/integer-reciprocal equivalence

Let

```text
R(j)=sum_(e={u,v})j_e/(n_u n_v),
N=product_v n_v.
```

Then `N R(j)` is an integer. Reduce it modulo `n_v`. Every nonincident edge
term contains the factor `n_v` and vanishes. An incident edge `e={v,w}`
contributes

```text
N/(n_v n_w) j_e
 =(N/n_v) j_e n_w^(-1) mod n_v.
```

Because `N/n_v` is invertible modulo `n_v`,

```text
N R(j)=0 mod n_v
iff
(partial_rec_tilde j)_v=0.
```

The moduli are pairwise coprime, so divisibility of `N R(j)` by every `n_v` is
equivalent to divisibility by `N`. That is equivalent to `R(j)` being an
integer. This proves Theorem 3.1.

If `sum_e |j_e|/n_e<1`, then `|R(j)|<1`. The only integer in that open interval
is zero, proving Corollary 3.2.

## 5. Support core, `2`-core restriction, and low weight

Let `G[j]=(V[j],E[j])` be the support graph defined in the theorem packet.
Suppose a nonzero support component has a leaf `v`, and let its unique support
edge be `e={v,w}`. The `v`-syndrome equation is

```text
j_e n_w^(-1)=0 mod n_v.
```

The coefficient `n_w^(-1)` is a unit modulo `n_v`, so `n_v` divides `j_e`.
This contradicts local no-wrap. Thus `G[j]` has no leaf and every one of its
vertices has support degree at least two. Every finite graph of minimum degree
at least two contains a cycle, proving Theorem 4.1.

### 5.1 Exact restriction and zero-extension

Assume `0 in mathcal J_e` for every edge and the stated nondivisibility of every
allowed nonzero symbol. Run the usual leaf-stripping process defining
`K=core_2(G)`. At each deleted leaf, the syndrome equation forces its unique
remaining incident edge to carry zero by the argument above. Induction through
the stripping order forces every edge outside `E(K)` to carry zero.

Restriction therefore maps every homogeneous restricted assignment on `G` to
one on `K`. Conversely, extend a homogeneous assignment on `K` by the admissible
zero symbol on every deleted edge. Every deleted vertex receives zero syndrome,
and every core equation is unchanged. Restriction and zero-extension are thus
inverse bijections.

For the enumerator, every deleted edge contributes exactly its zero-symbol
variable. Hence

```text
W_0(G;x)
 =product_(e notin E(K))x_(e,0) * W_0(K;x).
```

A forest has empty `2`-core, so under the zero-symbol and nondivisibility
hypotheses its homogeneous restricted fibre is exactly the singleton zero
assignment. No dimension claim is available without a linear/module structure.
This proves Theorem 4.2.

### 5.2 Odd-prime three-point minimum distance

For a simple graph with distinct odd-prime moduli and alphabet `{-1,0,1}`, a
nonzero support of weight one or two cannot have minimum support degree two. A
weight-three support with minimum degree two must be a triangle on moduli
`p,q,r`. Corollary 3.2 gives

```text
+/-1/(pq) +/-1/(pr) +/-1/(qr)=0.
```

Multiplication by `pqr` gives a signed sum of three odd integers equal to zero,
which is impossible by parity. Thus every nonzero homogeneous restricted
assignment has Hamming weight at least four.

The odd-prime restriction cannot be omitted: on moduli `2,3,5`,

```text
1/6-1/10-1/15=0.
```

This proves Corollary 4.3.

### 5.3 Explicit non-Eulerian witness

For moduli `5,7,11,13`, direct arithmetic gives

```text
-1/35+1/55+1/65+1/77-1/91-1/143=0.
```

The labels are exactly those in Example 4.4. By Theorem 3.1 they have zero
syndrome. Their support is all of `K_4`, so every support degree is three. This
proves the claimed failure of Eulerian, ordinary-cycle, signed-circuit, and
cycle-cover conclusions.

## 6. Sourced separator elimination and min-entropy

Fix the labels on `E[O]`. Their contribution merely changes the required source
at every vertex in `O` and `C`.

For distinct vertices `p,p' in O`, the cross-edge families `F_p` and `F_p'`
are disjoint: a cross edge has exactly one endpoint in `O`. Hence the random
vectors `J|_(F_p)` are independent across `p`.

For the full syndrome event to occur, each `p in O` must satisfy one equation

```text
sum_(e={p,q} in F_p)J_e n_q^(-1)=t_p mod n_p,
```

where `t_p` is determined by `beta` and the fixed internal labels. By
definition, the probability of each equation is at most `rho_p`. Independence
therefore gives

```text
Pr(all O-equations | J|_(E[O]))
 <=product_(p in O)rho_p.
```

Now expose the cross-edge labels. Their contributions to vertices in `C`
produce an arbitrary induced affine source. The only remaining random variables
are the internal core labels, whose largest source atom is `P_(G[C])` by the
explicit induced-graph definition. Multiplication proves the conditional
inequality; averaging over `E[O]` proves Theorem 5.1.

Iterating gives

```text
M_G
 <=product_(p in O)(n_p rho_p)M_(G[C]).
```

If `M_(G[C])<=T` and `n_p rho_p<=1+epsilon_p`, then

```text
max_beta Pr(partial_rec_tilde J=beta)
 <=T product_(p in O)(1+epsilon_p)
   /product_v n_v.
```

Taking negative logarithms gives Corollary 5.2. It controls the largest
syndrome atom only; it does not establish total-variation mixing or abundance
of homogeneous assignments.

The source supremum is essential: eliminating one layer changes the source seen
by every later layer.

## 7. Decoder image and hypergraph algebra

The decoder-image inequality is immediate. Since `C:S->A` is injective,

```text
{C(s):s in S}
```

is a subset of `A`; nonnegativity of `W` gives

```text
sum_s W(C(s))
 =sum_(a in C(S))W(a)
 <=sum_(a in A)W(a).
```

In the literal construction, the sensor coordinates are retained unchanged in
the completed assignment. If two completed assignments agree, their sensor
restrictions agree, so the sensor assignments agree. This proves Proposition
6.1 and its application.

For a hyperedge `e`, CRT factorization gives

```text
e(j_e h_e(a)/n_e)
 =product_(v in e)
   e(
     j_e a_v
     (product_(w in e\{v})n_w)^(-1)/n_v
    ).
```

Vertex character orthogonality then proves the sourced hypergraph coefficient
identity exactly as in Sections 1–2. For the reciprocal equivalence, put
`N=product_v n_v` and reduce `N sum_e j_e/n_e` modulo each `n_v`; the incident
terms reproduce the `v`-coordinate of `partial_rec_tilde^H`, multiplied by the
unit `N/n_v`. Pairwise coprimality completes the proof. At a support-degree-one
vertex, the same unit argument forces the unique incident nonzero label to be
divisible by the vertex modulus, contradicting local no-wrap. This proves
Theorem 6.2.

## 8. Inherited source-uniform terminal inverse-residue concentration

This section records the inherited audited provider used by Theorem 7.2; it is
not a new independent derivation of the divisor-dispersion estimate.

Let `p` be the row modulus and let `F` be a set of `s` distinct sensor primes in
an interval of diameter `K`, with `p notin F`. The inherited provider supplies,
for every nonzero `d mod p`,

```text
sum_(q in F)||d q^(-1)/p||^2
 >>s^3/(K^2D^2).
```

Here `D` is exactly the divisor/multiplicity parameter appearing in that
provider. This displayed dispersion inequality, rather than an undefined
multiplicity shorthand, is the hypothesis used below.

For the three-point law of activity `eta=lambda theta(1-theta)`, its
characteristic function at `x` is

```text
1-eta+eta cos(2pi x).
```

When `theta in Theta subset (0,1)` and `lambda in Lambda subset (0,1]` range
over fixed compact sets, the activity is bounded below and

```text
|1-eta+eta cos(2pi x)|
 <=exp(-c_(Theta,Lambda)||x||^2).
```

Fourier inversion on `Z/pZ` gives, for every source `t`,

```text
Pr(sum_(q in F)J_q q^(-1)=t)
 =1/p sum_(d mod p)
   e(-dt/p)
   product_(q in F)
    [1-eta+eta cos(2pi d q^(-1)/p)].
```

The `d=0` term is `1/p`. Taking absolute values on all nonzero frequencies and
using the inherited dispersion estimate gives

```text
sup_t Pr(sum_(q in F)J_q q^(-1)=t)
 <=1/p+exp(-c_(Theta,Lambda)s^3/(K^2D^2)).
```

The bound is uniform in `t`, so labels exposed at earlier stages may be absorbed
into the source. The proof uses a positive activity lower bound and gives no
uniformity as `lambda` or `theta(1-theta)` tends to zero.

## 9. Inherited nested dense-core elimination

This section records the accepted dependency proof. Its arithmetic thresholds,
diameter contraction, and divisor controls are inherited providers.

The terminal proof applies the separator theorem repeatedly:

- at each nonterminal stage, remove vertices having a sufficiently large
  reciprocal-dispersed neighbourhood in the retained core;
- apply the source-uniform row bound to every removed vertex;
- expose all edges internal to the removed set;
- pass the induced arbitrary source to the smaller core;
- if no such vertex remains, invoke the inherited contracted-cardinality and
  interval-diameter alternative, so the survivor is a dense residual core
  rather than an uncontrolled sparse remainder.

The inherited terminal alternatives are exhaustive:

1. **eliminable stage:** the product of factors `n_p rho_p` is bounded by the
   reciprocal-dispersion gain;
2. **small residual core:** count its labels trivially;
3. **dense residual core:** use its inherited diameter contraction and retained
   neighbourhood to continue at another scale;
4. **terminal bounded core:** absorb its complete label count into the final
   entropy budget.

Source-uniformity prevents multiplication by the number of possible incoming
sources. Shared edge variables are never replaced by independently optimized
row variables. With the accepted thresholds, the inherited iteration yields

```text
log(number/weighted mass of surviving joint currents)
 =O(D^2 ell^5).
```

The exponent is not a generic graph-theoretic consequence; it depends on the
accepted terminal interval geometry, divisor/multiplicity provider, and nested
core schedule.

## 10. Inherited weighted anchor partition

This section records how the exact packet enters the accepted anchor theorem.
It does not re-prove prime supply, rigidity, or the energy-floor provider.

For an anchor assignment with reciprocal energy `Q`, raise the Bernoulli
modulus to the fixed fractional power `lambda`. Proposition 2.1 majorizes it by
a nonnegative three-point edge law, and Theorem 1.2 converts the resulting
assignment sum into a nonnegative weighted sum over sourced reciprocal
currents.

The inherited rigidity argument supplies an energy floor sufficient to dominate
the joint-current entropy precisely when

```text
H^2 >> Z D^3 ell^8.
```

Below the floor, decoder-image inclusion reduces the actual image to the full
weighted anchor partition, and coherent labels are summed by the inherited
Gaussian/rigidity estimate. Above the floor, inherited Fourier damping dominates
`O(D^2 ell^5)`. Thus the accepted provider yields:

- the complete weighted anchor partition at the required polynomial scale;
- an exponentially negligible energy-above-floor tail;
- no substitution of raw assignment count for the weighted partition.

The reciprocal-incidence theorem removes the old fingerprint-counting
obstruction for the literal terminal block. It does not itself supply prime
supply, target observability, Taylor control, quotient semantics, or no-wrap.

## 11. Inherited row-specific decoding

For a coherent label `m` and row modulus `r`, the accepted cyclic
inverse-residue provider gives

```text
D_r >> H/ell^3
```

when `r<=H`, and

```text
D_r >> H^3/(r^2 ell^3)
```

when `r>H`. The accepted candidate-energy comparison holds for

```text
|m| << Z min(r,H)/ell.
```

The nearest-syndrome inequality from the verified structural interface then
identifies the candidate uniquely. The inherited off-decoder estimate is

```text
r exp(-cD_r).
```

Weighted product-fibre compression sums these errors without an exponential
coordinate-count loss. The worst retained rows occur at the largest relevant
`r`, and accepted absolute summation closes under

```text
H^3 >> Z^2 ell^4.
```

This condition is globally stronger than the anchor condition throughout the
fixed-power literal regime of interest.

## 12. Inherited full literal closure

Under the cubic condition, the audited dependency chain is

```text
decoder-image injectivity
 -> positive Fourier edge-current majorant
 -> exact sourced reciprocal-incidence identity
 -> inherited source-uniform inverse-residue concentration
 -> inherited nested dense-core elimination
 -> O(D^2 ell^5) joint entropy
 -> inherited weighted anchor partition
 -> inherited row-specific decoder and product-fibre compression
 -> retained-skeleton minor-lane damping
 -> actual-family Taylor major
 -> positive quotient coefficient
 -> deterministic no-wrap.
```

The final four arrows are inherited accepted providers from the one-anchor
proof and structural interface. They remain necessary.

If `H=Z^(1/Gamma)`, the cubic condition reads

```text
Z^(3/Gamma-2) >> ell^4.
```

Every fixed `Gamma<3/2` has a positive power margin and is covered. At
`Gamma=3/2`, the left power is `Z^0`; it cannot dominate `ell^4`. Thus the
equality endpoint is outside the theorem.

At `H=Z^(2/3)`, the present worst-row estimate is only of order `ell^(-3)`,
while the accepted absolute fibre argument needs a logarithmically growing
aggregate separation. The missing gain is in the row/fibre layer; anchor
entropy is already below its own power threshold.

## 13. Dependency audit

The exact finite graph and hypergraph theorems require only CRT, additivity, and
character orthogonality. The inherited thin-sensor theorem additionally
requires:

- fixed positive edge activity, uniformly bounded below on mixing edges;
- prime supply and pairwise coprimality;
- the inherited interval-diameter and divisor-dispersion estimate;
- the exact sensor/row/retained factor partition;
- injective completion;
- source-uniform separator elimination;
- target observability;
- product-fibre compression;
- retained minor-lane damping;
- Taylor major control;
- quotient realization and no-wrap.

Removing any one of the last five providers is not justified by the graph
identity alone. Sections 8–12 record this inherited dependency structure and do
not enlarge any analytic theorem, endpoint, or uniformity range.
