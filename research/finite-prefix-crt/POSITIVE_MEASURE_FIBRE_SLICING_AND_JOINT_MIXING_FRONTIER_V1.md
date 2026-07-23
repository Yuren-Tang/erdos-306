# Positive-measure fibre slicing and the joint-mixing frontier

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-PMFS-01`  
**Status:** `GENERAL THEOREM / MECHANISM UPGRADE / EXACT BLOCKED FRONTIER`  
**Date:** 2026-07-23  
**Related completed abstraction:**
`research/e306-anchor-fibre-transference-v1@2f49ab25c36326e9ea39e3fc0ed1d22a22b11693`

## 1. Why the absolute theorem is not the final mechanism

The weighted decoded-skeleton theorem is optimal when the residual factor is
only known to satisfy

```text
|H(x)|<=1.
```

It must then pay the full `l^1` off-decoder mass.  In an exact Bernoulli Fourier
problem, however, the residual factors are not arbitrary bounded functions.
Before absolute values are taken, the whole product is the characteristic
function of a positive measure.

Positive measures are stable under convolution and coordinate slicing.  This
permits an exact complex elimination which can be much stronger than nearest-
frequency decoding.

The gain is real but conditional: sequential slicing requires a triangular
independence structure, or else a genuinely joint block-mixing theorem.

## 2. Fourier conventions

Let `A` and `B` be finite abelian groups.  For a finite positive measure `mu` on
`A x B`, define

```text
muhat(chi,psi)
 =sum_(a in A,b in B)mu(a,b) chi(a) psi(b).
```

No normalization is placed in the transform.  Character inversion gives

```text
mu(a,b)
 =1/(|A||B|)
  sum_(chi in Ahat,psi in Bhat)
  muhat(chi,psi) conjugate(chi(a)psi(b)).
```

For `a_0 in A`, define the scaled positive slice measure on `B`

```text
Slice_(a_0)mu(b)=|A| mu(a_0,b).
```

## 3. Exact positive slice identity

### Theorem 3.1 — Fourier slicing preserves positivity

For every `psi in Bhat`,

```text
widehat(Slice_(a_0)mu)(psi)
 =sum_(chi in Ahat)
   conjugate(chi(a_0)) muhat(chi,psi).
```

In particular, summing the `A`-frequency coordinate with the target character
produces the Fourier transform of a positive measure on the remaining group.

#### Proof

Using character orthogonality,

```text
sum_chi conjugate(chi(a_0))muhat(chi,psi)
 =sum_(a,b)mu(a,b)psi(b)
   sum_chi chi(a-a_0)
 =|A|sum_b mu(a_0,b)psi(b).
```

The last expression is the Fourier transform of the scaled slice.  `square`

### Consequence

After exact coordinate elimination, the residual object is not an arbitrary
complex function.  It remains positive definite because it is the Fourier
transform of a positive measure.

## 4. Convolution contraction

Let `alpha` and `nu` be probability measures on `A x B`, and put

```text
mu=alpha*nu.
```

Write `alpha_A`, `nu_A`, and `mu_A` for their marginals on `A`.

### Theorem 4.1 — marginal mixing survives every positive residual

If

```text
||alpha_A||_infinity <=(1+delta)/|A|,
```

then for every `a_0 in A`,

```text
mass(Slice_(a_0)mu)
 =|A| mu_A(a_0)
 <=1+delta.
```

#### Proof

Marginals commute with convolution:

```text
mu_A=alpha_A*nu_A.
```

Convolution by a probability measure is an `l^infinity` contraction, so

```text
||mu_A||_infinity
 <=||alpha_A||_infinity.
```

Multiply by `|A|`.  `square`

### Interpretation

An assigned atom family need only have an almost-uniform marginal in the
coordinate being eliminated.  It may also contribute to all future
coordinates.  Every remaining independent atom family is harmless: convolution
cannot increase the marginal point mass.

This is stronger than an absolute bound against arbitrary `|H|<=1`, because it
uses the positive-measure structure of `H`.

## 5. Spectral criterion for one-coordinate mixing

Let `rho` be a probability measure on `A`.  Fourier inversion gives

```text
|A|rho(a)-1
 =sum_(chi!=1)rhohat(chi)conjugate(chi(a)).
```

Hence

```text
||rho||_infinity
 <=1/|A| [1+sum_(chi!=1)|rhohat(chi)|].
```

### Corollary 5.1 — multiplier spectral profile

If

```text
sum_(chi!=1)|rhohat(chi)|<=delta,
```

then exact slicing costs at most `1+delta`.

For a Bernoulli subset-sum marginal on `A=Z/rZ` with coefficient residues
`c_j`,

```text
rhohat(d)
 =product_j((1-theta_j)+theta_j exp(2pi i d c_j/r)).
```

Thus the correct complex row provider is the complete spectral profile

```text
sum_(d!=0)
 product_j |(1-theta_j)+theta_j exp(2pi i d c_j/r)|,
```

not merely the worst multiplier distance.

A uniform distance lower bound is one sufficient way to control this sum, but
it is not logically necessary.

## 6. Triangular sequential slicing

Let

```text
G=A_1 x ... x A_n x B.
```

Suppose a probability measure factors as

```text
mu=alpha_1*...*alpha_n*nu,
```

where, for every `i`, the measure `alpha_i` has zero projection to all earlier
coordinates:

```text
projection_(A_j)(alpha_i)=delta_0
for j<i.
```

It may contribute arbitrarily to `A_i,...,A_n,B`.

Assume its `A_i` marginal satisfies

```text
||(alpha_i)_(A_i)||_infinity
 <=(1+delta_i)/|A_i|.
```

### Theorem 6.1 — triangular positive-measure elimination

For any target coordinates `a_i`, exact Fourier slicing in the order

```text
A_1,A_2,...,A_n
```

leaves a positive measure on `B` whose total mass is at most

```text
product_(i=1)^n(1+delta_i).
```

#### Proof

At step `i`, all later factors `alpha_j`, `j>i`, have zero `A_i` projection.
The current measure is a convolution of the untouched factor `alpha_i` with a
positive residual measure.  Theorem 4.1 bounds the scaled slice mass by
`1+delta_i` times the incoming mass.  Theorem 3.1 shows that the sliced residual
remains a positive measure.  Iterate.  `square`

### Graph interpretation

For two-coordinate atoms, choose an elimination order and assign each atom to
the earliest coordinate it touches.  The assigned atoms of coordinate `i`
connect it only to later coordinates.  Their marginal subset-sum distribution
must be almost uniform.

This is a probabilistic counterpart of oriented fibre decoding.

## 7. Exact obstruction without triangularity

Coordinatewise marginal mixing alone does not imply joint mixing.

Take

```text
A_1=A_2=Z/2Z
```

and let `xi` be uniform on `Z/2Z`.  Define the positive random vector

```text
T=(xi,xi).
```

Both marginals are exactly uniform:

```text
Pr(T_1=0)=Pr(T_1=1)=1/2,
Pr(T_2=0)=Pr(T_2=1)=1/2.
```

Nevertheless

```text
Pr(T=(0,1))=0.
```

After slicing `T_1=0`, the second coordinate is deterministically `0`; its
former marginal uniformity is destroyed.

### Conclusion

One cannot multiply one-coordinate mixing costs unless the assigned positive
measures have a triangular support/independence structure.  Reusing a shared
atom family after conditioning is invalid.

This is the physical-space analogue of the arithmetic plaquette obstruction.

## 8. Block slicing

Let `C` be a product of several coordinates and let `D` be the remaining group.
Theorems 3.1 and 4.1 hold verbatim with `A=C`.

Thus a terminal coordinate block can be removed in one step if an assigned
positive measure `alpha` has joint marginal

```text
||alpha_C||_infinity <=(1+delta)/|C|.
```

The Fourier sufficient condition is

```text
sum_(chi in Chat, chi!=1)|alphahat_C(chi)|<=delta.
```

This is the exact **joint slice-mixing provider**.

It is stronger than separate marginal mixing.  It is also the precise missing
input when an acyclic orientation leaves a terminal core.

## 9. Application to semiprime edge systems

A Bernoulli atom attached to an edge `{r,s}` contributes one residue to each
endpoint coordinate.  An orientation assigns that independent atom to one
endpoint while allowing its other component to survive in future coordinates.

For every nonterminal vertex, a sufficiently mixing outgoing edge family can
be eliminated by Theorem 6.1 without taking absolute values against arbitrary
residual factors.

However, in any finite acyclic orientation with large required outdegree, a
terminal block remains.  The previous terminal-core principle therefore
survives in a sharper form:

```text
one-coordinate positive slicing
removes all oriented fibres at near-unit cost,
but a terminal block requires joint slice mixing.
```

The problem is no longer normalization or rowwise decoder bookkeeping.

## 10. Relation to the current E306 square-root barrier

The current sampled-core route pays the raw assignment entropy of a terminal
core.  That cost leads to the balance

```text
q^2 Z >> polylog(Z)
```

and the power `1/2` barrier within that method class.

Theorems 3.1--6.1 show a genuine escape route:

1. eliminate every triangular fibre by positive-measure slicing;
2. do not enumerate its decoder assignments;
3. preserve the remaining object as a positive measure;
4. replace terminal-core enumeration by one joint slice-mixing estimate.

If the terminal block marginal is near-uniform at a cost smaller than its raw
group cardinality, the square-root entropy balance is no longer forced.

## 11. Exact new blocked frontier

For an E306-type terminal block `C` with Bernoulli two-sparse incidence measure
`alpha_C`, prove a target-compatible estimate of the form

```text
|C| max_c alpha_C(c) <=1+delta
```

or, more realistically because short integer labels must remain visible,

```text
joint terminal mass
 =controlled short-label component
  +negligible noncoherent component.
```

Fourier-dually, this asks for a non-enumerative bound on

```text
sum_(noncoherent chi)
 product_(edges e)
 |(1-theta_e)+theta_e chi(v_e)|,
```

while preserving the coherent short-label major modes.

This is not a one-row code-distance theorem.  It is a local-limit/mixing theorem
for a heterogeneous-prime, two-sparse incidence measure.

## 12. Research ranking

The hierarchy is now:

```text
TECHNICAL PROVIDER:
prime supply / Kloosterman / cyclic packing estimates.

GENERAL MECHANISM 1:
weighted absolute decoded-skeleton transference.

GENERAL MECHANISM 2:
positive-measure triangular slicing.

CURRENT FRONTIER:
joint terminal-block slice mixing preserving short labels.
```

A better row estimate improves rates inside a provider.  A joint slice-mixing
theorem changes the mechanism and is the most plausible route across the
sampled-core power `1/2` barrier.

## 13. Classification

```text
POSITIVE FOURIER SLICE IDENTITY — PROVED
MARGINAL CONVOLUTION CONTRACTION — PROVED
TRIANGULAR SEQUENTIAL SLICING — PROVED
SPECTRAL-PROFILE PROVIDER — PROVED
MARGINAL-WITHOUT-JOINT-MIXING COUNTEREXAMPLE — COMPLETE
TERMINAL JOINT SLICE MIXING — EXACT BLOCKED FRONTIER.
```

No proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv,
or canonical status changes through this theorem seed.
