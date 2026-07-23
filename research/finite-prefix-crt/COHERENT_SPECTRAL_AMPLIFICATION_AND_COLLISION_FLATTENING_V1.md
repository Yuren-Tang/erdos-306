# Coherent spectral amplification and collision flattening

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-CSACF-01`  
**Status:** `GENERAL THEOREM / MECHANISM DECOMPOSITION / EXACT RANDOM-CODE FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The hot--cold mechanism leaves one hard provider: joint terminal mixing while preserving the
short integer coherent modes.  Asking directly for an `l^1` Fourier bound or an `l^infinity`
local limit may be unnecessarily strong for one sensor layer.

Independent sensor layers convolve in physical space and multiply in Fourier space.  This
permits a two-stage mechanism:

1. one layer has no almost-invariant transverse character;
2. one layer has substantial collision entropy;
3. a bounded or slowly growing number of independent layers amplifies these two facts to
   joint local mixing.

The coherent Fourier set is retained exactly rather than suppressed.

## 2. Fourier conventions

Let `G` be a finite abelian group and let `Ghat` be its character group.  For a probability
measure `mu` on `G`, write

```text
muhat(chi)=sum_(x in G)mu(x)chi(x).
```

Let

```text
C subset Ghat
```

be a chosen coherent set containing the trivial character.  Put

```text
T=Ghat\C.
```

Define the coherent inverse transform

```text
mu_C(x)
 =1/|G| sum_(chi in C)muhat(chi)conjugate(chi(x)).
```

This need not be a positive measure.  It is the exact Fourier component which must be
preserved for the major arc or short-label line.

## 3. Exact transverse inversion bound

### Theorem 3.1 — coherent/transverse decomposition

For every probability measure `mu`,

```text
mu(x)=mu_C(x)+R_T(x),
```

where

```text
|G| ||R_T||_infinity
 <=sum_(chi in T)|muhat(chi)|.
```

#### Proof

Fourier inversion gives

```text
R_T(x)
 =1/|G| sum_(chi in T)
   muhat(chi)conjugate(chi(x)).
```

Take absolute values.  `square`

Thus the desired joint slice-mixing statement is exactly a transverse Fourier `l^1` bound,
not a demand that the coherent characters be small.

## 4. Independent-layer amplification

Let `mu_1,...,mu_k` be probability measures on `G` and put

```text
nu=mu_1*...*mu_k.
```

Then

```text
nuhat(chi)=product_(j=1)^k muhat_j(chi).
```

### Theorem 4.1 — Hölder spectral amplification

Let `p_j in [1,infinity]` satisfy

```text
sum_j1/p_j=1.
```

Then

```text
sum_(chi in T)|nuhat(chi)|
 <=product_j
   (sum_(chi in T)|muhat_j(chi)|^(p_j))^(1/p_j),
```

with the usual supremum interpretation when `p_j=infinity`.

#### Proof

Apply Hölder's inequality on the finite set `T` to the functions
`|muhat_j|`.  `square`

This theorem allows different layers to supply different spectral information.

### Corollary 4.2 — identical-layer `l^2` to `l^infinity` amplifier

Let `mu_1=...=mu_k=mu`, with `k>=2`.  Define

```text
rho_T(mu)=max_(chi in T)|muhat(chi)|,
C_2,T(mu)=sum_(chi in T)|muhat(chi)|^2.
```

Then

```text
sum_(chi in T)|widehat(mu^(*k))(chi)|
 <=rho_T(mu)^(k-2) C_2,T(mu).
```

Consequently

```text
|G| ||mu^(*k)-(mu^(*k))_C||_infinity
 <=rho_T(mu)^(k-2) C_2,T(mu).
```

#### Proof

For each transverse character,

```text
|muhat(chi)|^k
 <=rho_T(mu)^(k-2)|muhat(chi)|^2.
```

Sum and apply Theorem 3.1.  `square`

### Corollary 4.3 — two different collision layers

For `nu=mu_1*mu_2`,

```text
sum_(chi in T)|nuhat(chi)|
 <=sqrt(C_2,T(mu_1) C_2,T(mu_2)).
```

This is Cauchy--Schwarz.

## 5. Collision interpretation

Parseval gives

```text
sum_(chi in Ghat)|muhat(chi)|^2
 =|G| sum_(x in G)mu(x)^2.
```

If `X,X'` are independent with law `mu`, then

```text
sum_x mu(x)^2=Pr(X=X').
```

Hence

```text
C_2,T(mu)
```

is the two-copy collision trace after removing the coherent Fourier contribution.

For a sensor incidence measure, let two independently selected sensor configurations have
difference vector `eta`.  Their syndromes agree exactly when

```text
A eta=0
```

in the CRT coordinate group, where `A` is the two-sparse incidence map.  Thus collision
flattening is a signed-kernel problem:

```text
Pr(A eta=0)
```

with the coherent short-label kernel separated from transverse kernel vectors.

This is a random-code or sparse-matrix question, not a raw assignment count.

## 6. Spectral radius interpretation

The condition

```text
rho_T(mu)<=rho<1
```

says that no transverse character is almost invariant under one sensor layer.  For a product
or categorical sensor ensemble, each Fourier coefficient is an average of phase products.
The existing cyclic packing and Kloosterman estimates are possible providers for this
condition.

Plaquette and arithmetic cycle modes are exactly obstructions to a uniform transverse
spectral radius.  Chords, expansion, or a random regular sensor design must remove them.

## 7. Coherent-preserving flattening criterion

### Theorem 7.1 — joint terminal mixing from two provider bounds

Suppose one can construct a base hot layer `mu` and a coherent set `C` such that

```text
rho_T(mu)<=exp(-a_Z),
C_2,T(mu)<=exp(b_Z).
```

Then `k` independent denominator-disjoint copies of this layer satisfy

```text
|G| ||mu^(*k)-(mu^(*k))_C||_infinity
 <=exp(b_Z-(k-2)a_Z).
```

In particular, if

```text
(k-2)a_Z-b_Z->infinity,
```

then the joint terminal law equals its coherent component up to `o(1/|G|)` pointwise.

#### Proof

Apply Corollary 4.2.  `square`

### Reciprocal cost

If one layer has reciprocal load `lambda_layer`, then `k` disjoint layers cost

```text
k lambda_layer.
```

The mechanism is useful when collision entropy makes `b_Z` much smaller than the raw group
entropy.  If one only uses the trivial estimate `C_2,T<=|G|`, no gain over direct
enumeration should be expected.

## 8. A flattening hierarchy for E306-type sensor systems

The joint hot synchronizer may now be attacked in the following order.

### Provider A — spectral radius

Prove that every noncoherent terminal character pays at least one of:

1. a row multiplier profile;
2. a chord/cycle defect;
3. a reciprocal-label defect;
4. a hidden target-coordinate defect.

This yields

```text
rho_T<=exp(-a_Z).
```

### Provider B — collision entropy

For two independent sensor configurations, bound the probability that their signed
difference has zero syndrome without being a coherent difference.  Desired forms include

```text
C_2,T<=exp(o(a_Z k))
```

or a polynomial bound.

### Provider C — layer amplification

Use a bounded or slowly growing number of disjoint hot layers.  Their convolution preserves
the coherent short-label Fourier modes while suppressing the transverse spectrum.

## 9. Relation to positive slicing and local limits

Positive-measure slicing says that an already near-uniform joint marginal can be removed at
near-unit cost.  The present theorem supplies a mechanism for manufacturing that joint
marginal:

```text
spectral radius
+ collision flattening
+ convolution layers
=> transverse Fourier l^1
=> joint positive slice mixing.
```

In local-limit language, the base layer supplies irreducibility and collision entropy; the
convolution amplifier supplies the strong local smoothing.

## 10. Why this may cross parameter barriers

Explicit core enumeration pays approximately the logarithm of the entire terminal state
space.  Collision flattening pays only the logarithm of the number of two-copy kernel
collisions.  A code-like sensor matrix can have a huge state space but very few kernel
collisions.

If the transverse signed kernel is typically empty or small, `b_Z` may be polynomial or
sublinear even when `log|G|` is of order `(log Z)^4` or larger.  Then a small number of hot
layers can yield joint mixing without a square-root entropy balance.

## 11. Exact new mathematical problem

For a sparse heterogeneous-prime incidence ensemble, prove simultaneously:

```text
TRANSVERSE SPECTRAL RADIUS:
  max_(chi noncoherent)|muhat(chi)|<=exp(-a_Z);

TRANSVERSE COLLISION TRACE:
  sum_(chi noncoherent)|muhat(chi)|^2<=exp(b_Z),
  with b_Z=o(k a_Z)
```

for a reciprocal-cost-efficient number of layers.

Equivalently, classify signed edge configurations satisfying all prime-coordinate equations
and show that noncoherent kernel configurations are rare.

This is a more structured target than a direct `l^1` Fourier estimate.

## 12. Honest classification

Proved:

```text
COHERENT/TRANSVERSE INVERSION — PROVED
HOLDER LAYER AMPLIFICATION — PROVED
L2-TO-LINFINITY CONVOLUTION AMPLIFIER — PROVED
COLLISION-KERNEL INTERPRETATION — PROVED
```

Exact frontier:

```text
SPARSE CRT SENSOR MATRIX:
TRANSVERSE SPECTRAL RADIUS + TRANSVERSE COLLISION ENTROPY.
```

No E306 or GFF rate is promoted by this abstract theorem alone.