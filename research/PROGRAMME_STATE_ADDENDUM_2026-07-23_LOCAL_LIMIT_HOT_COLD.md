# E306-RL programme state addendum — local limits and hot--cold smoothing

**Date:** 2026-07-23  
**Workspace:** `Yuren-Tang/erdos-306:research/e306-frontier-v1`  
**Status:** research only; no assurance, manuscript, Curator, Lean, release, DOI, arXiv, or submission consequence

## 1. New mechanism-level understanding

The exact representation problem is an arithmetic mean-point local limit theorem.
For independent subset variables `xi_e`,

```text
S=sum_e(L/e)xi_e,
E S=Lq.
```

The desired representation is exactly `Pr(S=E S)>0`.

The major arc is the Gaussian part of the local limit theorem.  CRT rigidity and all
minor-frequency work verify a quantitative growing-modulus aperiodicity or heat-kernel
condition.  This is recorded in

`research/finite-prefix-crt/ARITHMETIC_BERNOULLI_LOCAL_LIMIT_AND_HEAT_KERNEL_V1.md`.

The current proof mechanisms are now organized as:

```text
technical providers:
  prime supply, Kloosterman, cyclic packing, reciprocal labels;

absolute mechanism:
  weighted decoded skeleton and defect expansion;

positive mechanism:
  positive-measure slicing and joint terminal mixing;

local-limit mechanism:
  Gaussian infinitesimality plus spectral dimension one;

ensemble mechanism:
  hot q-independent smoothing plus cold q-dependent mass/variance.
```

## 2. Hot--cold route

The same small Bernoulli parameter need not govern every denominator.
Split the denominator family into:

```text
E_hot:
  sparse CRT smoothing scaffold,
  probabilities bounded away from 0 and 1;

E_cold:
  dense reciprocal-mass reservoir,
  probability theta chosen to centre the target.
```

For

```text
mu_hot=sum_(e in E_hot)p_e/e,
Lambda_cold=sum_(e in E_cold)1/e,
```

choose

```text
theta=(q-mu_hot)/Lambda_cold.
```

Then the linear major-arc phase cancels exactly.  All Taylor and variance statements use the
actual heterogeneous probabilities.

A rowwise top-sensor scaffold of size

```text
M asymp(log Z)^3
```

has elementary uniform cyclic energy `>>log Z` at fixed hot kernel strength.  Its total
reciprocal load is

```text
O(M/Z)=O((log Z)^3/Z).
```

Hence a joint hot top synchronizer would give the conditional rate

```text
gamma_N <<(log p_N)^3/p_N.
```

This is recorded in

`research/finite-prefix-crt/HOT_COLD_SMOOTHING_ENSEMBLE_AND_MICROCANONICAL_FRONTIER_V1.md`.

## 3. Microcanonical route

Instead of independent Bernoulli sensors, let each row choose exactly `d` sensors.  The row
Fourier coefficient is a normalized elementary symmetric polynomial.  If the sensor
population Fourier bias is `rho`, sampling without replacement gives

```text
|hat nu(k)|<=rho^d+O(d^2/M).
```

Consequences:

```text
rho<=1-c/(log Z)^2  -> d>>log^3 Z -> load O(log^3 Z/Z),
rho<=Z^(-delta)     -> d=O_delta(1) -> load O(1/Z).
```

The second line is an ideal mechanism candidate, not a proved E306/GFF theorem.

## 4. Intrinsic architecture bounds

For an independent hot Bernoulli row with `M` sensors, the probability that no sensor is
selected is exponentially `exp(-Theta(M))`.  Near-uniformity on a prime coordinate of size
`asymp Z` forces

```text
M>>log Z.
```

Thus independent hot Bernoulli smoothing cannot have reciprocal cost below

```text
Omega(log Z/Z)
```

within this top-sensor architecture.

Fixed-cardinality sensing removes this zero-selection obstruction and can in principle reach
`O(1/Z)` if a power-saving multiplier profile and joint terminal mixer are available.

These are architecture bounds, not lower bounds for Li's GFF quantity.

## 5. Current theorem hierarchy

Still strongest fully assembled argument-level GFF candidate:

```text
gamma_N <<p_N^(-1/2)(log p_N)^(5/2)
```

using the Kloosterman multiscale Bernoulli route.

New conditional mechanism candidates:

```text
joint hot Bernoulli synchronizer
  -> gamma_N <<(log p_N)^3/p_N;

power-saving multiplier profile
+ fixed-degree joint sensor ensemble
  -> natural smoothing scale O(1/p_N).
```

No promotion is implied.  The latter two are mechanism frontiers.

## 6. Exact next mathematical obligation

The most valuable missing theorem is now:

```text
JOINT LOCAL LIMIT FOR A SPARSE HETEROGENEOUS-PRIME SENSOR ENSEMBLE

Input:
  a two-sparse semiprime incidence system;
  hot row marginals with strong spectral profiles;
  short integer coherent modes;

Output:
  joint terminal law
   = controlled short-label component
     + negligible transverse component.
```

Equivalent formulations:

1. joint terminal-block positive slice mixing;
2. spectral dimension one for the CRT heat kernel;
3. a cosystolic/random-code local limit theorem for the prime-incidence matrix.

Proving this theorem would replace the sampled-core square-root mechanism.  Improving another
PNT/Kloosterman constant without this theorem changes only the technical provider.