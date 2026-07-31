# Proof Packet

This file proves the theorem inventory in `THEOREM_PACKET.md` and records the
accepted analytic dependency chain without replacing inherited providers by
unstated abstractions.

## 1. CRT phase factorization

Let `e={u,v}` and let `h=h_e(a)` be the CRT lift modulo `n_u n_v`. Modulo one,
the standard CRT formula gives

```text
h/(n_u n_v)
 =a_u n_v^(-1)/n_u
  +a_v n_u^(-1)/n_v.
```

Indeed the two sides have the same additive characters against every integer:
the first summand is congruent to `a_u/(n_u n_v)` after multiplication by
`n_v`, and similarly at `v`. Hence, for every integer `j`,

```text
e(jh/(n_u n_v))
 =e(j a_u n_v^(-1)/n_u)
  e(j a_v n_u^(-1)/n_v).
```

The same label `j` occurs at both endpoints. There is no orientation sign and
no diagonal multiplicity.

## 2. Proof of the exact sourced identity

Expand every edge kernel:

```text
product_e K_e(h_e(a)/n_e)
 =sum_j product_e c_e(j_e)
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
 e(a_v[(partial_rec j)_v-beta_v]/n_v)
```

equals `n_v` when `(partial_rec j)_v=beta_v` and equals `0` otherwise. Taking
the product over all vertices gives

```text
Z_G(beta)
 =product_v n_v
  *sum_(j:partial_rec j=beta) product_e c_e(j_e).
```

Normalize `c_e(j)` by `C_e`. Independence of the labels gives

```text
sum_(j:partial_rec j=beta) product_e c_e(j_e)
 =product_e C_e * Pr(partial_rec J=beta),
```

which proves Theorem 1.2.

If the graph is disconnected, every factor and every syndrome equation belongs
to one component. Both the assignment sum and the independent-label
probability therefore factor. Setting `beta=0` gives the homogeneous weighted
enumerator. An arbitrary `beta` selects an affine fibre, not a new code.

For absolutely summable nonnegative coefficient families, Tonelli's theorem
permits the same expansion; finite vertex sums cause no further convergence
issue.

## 3. Proof of the Bernoulli three-point majorant

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
`0<lambda<=1`, concavity of `y -> y^(lambda/2)` on `[0,1]`, or the tangent
inequality at `1`, gives

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

The concentration constant obtained from this law depends on the activity
`lambda nu`. If that activity tends to zero, the law converges to the
deterministic zero current and no uniform mixing estimate can persist.

## 4. Proof of syndrome/integer-reciprocal equivalence

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
(partial_rec j)_v=0.
```

The moduli are pairwise coprime, so divisibility of `N R(j)` by every `n_v` is
equivalent to divisibility by `N`. That is equivalent to `R(j)` being an
integer. This proves Theorem 3.1.

If `sum_e |j_e|/n_e<1`, then `|R(j)|<1`. The only integer in that open interval
is zero, proving the no-wrap corollary.

## 5. Proof of the support-core consequence

Suppose a nonzero support component has a leaf `v`, and let its unique support
edge be `e={v,w}`. The `v`-syndrome equation is

```text
j_e n_w^(-1)=0 mod n_v.
```

The coefficient `n_w^(-1)` is a unit modulo `n_v`, so `n_v` divides `j_e`.
This contradicts the local no-wrap hypothesis. Thus no support leaf exists and
minimum degree is at least two.

Every finite graph of minimum degree at least two contains a cycle, and repeated
leaf stripping deletes no support edge. Hence the support lies in the
graph-theoretic `2`-core. A forest always has a leaf in each nontrivial
component, so it has no nonzero homogeneous support. The girth statement is
immediate for simple graphs.

Nothing in this proof gives parity of the support degree, a decomposition into
cycles, or support minimality.

## 6. Proof of sourced separator elimination

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
produce an arbitrary induced affine source `gamma`. The only remaining random
variables are the internal core labels `J|_(E[C])`, and their chance of meeting
that source is at most

```text
sup_gamma Pr(partial_rec^C J|_(E[C])=gamma).
```

Multiplication proves the conditional inequality. Averaging over `E[O]`
proves the unconditional inequality. Multiplying by the vertex-modulus factors
gives its `M_G` form.

Iterating this proof over nested cores gives the conditional sensor-separator
architecture. The source supremum is essential: eliminating one layer changes
the source seen by every later layer.

## 7. Decoder image and completion injectivity

The abstract inequality is immediate. Since `C:S->A` is injective,

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
restrictions agree, so the sensor assignments agree. This proves injectivity.
All nonsensor coordinates are then supplied by the accepted row decoder on its
stated range. No complex cancellation and no estimate of the full partition is
used in this injection argument.

## 8. Source-uniform terminal inverse-residue concentration

Let `p` be the row modulus and `F` a set of `s` distinct primes in an interval
of diameter `K`. For nonzero `d mod p`, the accepted divisor-dispersion argument
bounds the multiplicity with which a small centred residue can occur by the
parameter `D`. Ordering the possible centred values and discarding at most the
allowed multiplicity yields

```text
sum_(q in F)||d q^(-1)/p||^2
 >>s^3/(K^2D^2).
```

For the three-point law of activity `eta=lambda theta(1-theta)`, its
characteristic function at `x` is

```text
1-eta+eta cos(2pi x).
```

For fixed positive activity,

```text
|1-eta+eta cos(2pi x)|
 <=exp(-c_lambda ||x||^2).
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
using the dispersion estimate gives

```text
sup_t Pr(sum_(q in F)J_q q^(-1)=t)
 <=1/p+exp(-c_lambda s^3/(K^2D^2)).
```

The bound is uniform in `t`. Therefore all labels exposed at previous
elimination stages may be absorbed into the source without changing the bound.

The proof uses the lower bound on activity. It does not yield uniformity as
`lambda` or `theta(1-theta)` tends to zero.

## 9. Nested dense-core elimination

The accepted terminal proof applies the separator theorem repeatedly. Its
combinatorial invariant is:

- at each nonterminal stage, remove vertices having a sufficiently large
  reciprocal-dispersed neighbourhood in the retained core;
- apply the source-uniform row bound to every removed vertex;
- expose all edges internal to the removed set;
- pass the induced arbitrary source to the smaller core;
- if no such vertex remains, the surviving set has contracted cardinality and
  interval diameter, so it is a dense residual core rather than an uncontrolled
  sparse remainder.

The terminal alternatives are exhaustive:

1. **eliminable stage:** the product of factors `n_p rho_p` is bounded by the
   reciprocal-dispersion gain;
2. **small residual core:** count its labels trivially;
3. **dense residual core:** its diameter contraction and minimum retained
   neighbourhood allow another elimination scale;
4. **terminal bounded core:** absorb its complete label count into the final
   entropy budget.

The source-uniformity proved in the previous section prevents any multiplication
by the number of possible incoming sources. Shared edge variables are never
replaced by independently optimized row variables.

With the accepted thresholds, the complete iteration has logarithmic current
entropy

```text
log(number/weighted mass of surviving joint currents)
 =O(D^2 ell^5).
```

This is the joint reciprocal-flow entropy estimate. The exponent is not a
generic graph-theoretic consequence: it uses the terminal interval diameter,
the divisor/multiplicity bound, and the particular nested-core schedule.

## 10. Weighted anchor partition

For an anchor assignment with reciprocal energy `Q`, raise the Bernoulli
modulus to the fixed fractional power `lambda`. The positive majorant and
Theorem 1.2 convert its assignment sum into a nonnegative weighted sum over
sourced reciprocal currents.

The accepted rigidity argument supplies an energy floor of scale sufficient
to dominate the joint-current entropy precisely when

```text
H^2 >> Z D^3 ell^8.
```

Below the floor, the decoder-image inclusion reduces the actual image to the
full weighted anchor partition, and coherent labels are summed by the accepted
Gaussian/rigidity estimates. Above the floor, the Fourier damping contributes
an exponential factor whose exponent dominates `O(D^2 ell^5)`. Therefore:

- the complete weighted anchor partition is polynomial at the required scale;
- the energy-above-floor tail is exponentially negligible;
- no raw count of assignments is substituted for the weighted partition.

This theorem replaces the old fingerprint-counting obstruction for the literal
terminal block. It does not re-prove prime supply, target observability, Taylor
control, quotient semantics, or no-wrap.

## 11. Row-specific decoding

For a coherent label `m` and row modulus `r`, compare the candidate row phase
with every competing residue. The accepted cyclic inverse-residue estimate
gives the separation

```text
D_r >> H/ell^3
```

when `r<=H`, and

```text
D_r >> H^3/(r^2 ell^3)
```

when `r>H`.

The candidate energy remains below a fixed fraction of this separation for

```text
|m| << Z min(r,H)/ell.
```

The nearest-syndrome inequality from the verified structural interface then
makes the candidate the unique decoder. Its off-decoder row mass is bounded by

```text
r exp(-cD_r).
```

The weighted product-fibre compression theorem sums these errors without an
exponential coordinate-count loss.

The worst retained rows occur at the largest relevant `r`. The accepted
absolute summation closes under

```text
H^3 >> Z^2 ell^4.
```

This condition is globally stronger than the anchor condition throughout the
fixed-power literal regime of interest.

## 12. Full literal closure

Under the cubic condition, the proof chain is:

```text
decoder-image injectivity
 -> positive Fourier edge-current expansion
 -> exact sourced reciprocal-incidence identity
 -> source-uniform inverse-residue concentration
 -> nested dense-core elimination
 -> O(D^2 ell^5) joint entropy
 -> weighted anchor partition
 -> row-specific decoder and product-fibre compression
 -> retained-skeleton minor-lane damping
 -> actual-family Taylor major
 -> positive quotient coefficient
 -> deterministic no-wrap.
```

The last four arrows are inherited accepted providers from the one-anchor
proof and structural interface. They remain necessary.

If `H=Z^(1/Gamma)`, the cubic condition reads

```text
Z^(3/Gamma-2) >> ell^4.
```

Every fixed `Gamma<3/2` has a positive power margin and is covered. At
`Gamma=3/2`, the left power is `Z^0`; it cannot dominate `ell^4`. Thus the
equality endpoint is outside the theorem.

At the pure boundary `H=Z^(2/3)`, the present worst-row estimate is only of
order `ell^(-3)`, while the accepted absolute fibre argument needs a
logarithmically growing aggregate separation. The missing gain is in the
row/fibre layer; anchor entropy is already below its own power threshold.

## 13. Dependency audit

The exact finite graph theorems require only CRT and character orthogonality.
The thin-sensor theorem additionally requires:

- fixed positive edge activity;
- prime supply and pairwise coprimality;
- interval-diameter and divisor/multiplicity control;
- the exact sensor/row/retained factor partition;
- injective completion;
- source-uniform separator elimination;
- target observability;
- product-fibre compression;
- retained minor-lane damping;
- Taylor major control;
- quotient realization and no-wrap.

Removing any one of the last five providers is not justified by the graph
identity alone.
