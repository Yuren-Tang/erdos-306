# Hot--cold smoothing ensembles and the microcanonical frontier

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-HCSE-01`  
**Status:** `GENERAL MECHANISM / CONDITIONAL RATE TRANSFER / NEW EXACT FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only; no theorem-status, proof-development, review, manuscript, Curator, Lean, release, DOI, arXiv, or submission change

## 1. The parameter coupling which created the square-root barrier

Every preceding finite-prefix route used essentially one Bernoulli parameter

```text
theta asymp q
```

on both:

1. the dense denominator family which supplies reciprocal mass and Gaussian variance;
2. the sparse sensor family which must mix CRT coordinates.

As `q->0`, the same factor which correctly reduces the mean also weakens every sensor
kernel.  A row then requires `1/q` more sensors, the terminal core grows like `1/q`, and
explicit core entropy produces the square-root balance.

This coupling is not forced by the representation problem.  A positive measure on subsets
may use different probabilities, or even different local ensembles, on disjoint denominator
families.

The mechanism-level replacement is:

```text
HOT sparse smoothing scaffold:
  probabilities bounded away from 0 and 1;
  negligible reciprocal load;
  strong lattice/CRT mixing.

COLD dense mass reservoir:
  probability asymp q;
  fixed reciprocal capacity;
  tunes the exact mean and supplies Gaussian variance.
```

This is the arithmetic analogue of convolving with a small smoothing kernel before applying
a local central limit theorem.

## 2. Heterogeneous Bernoulli centering

Let

```text
E=E_hot disjoint-union E_cold.
```

Assign probabilities

```text
p_e in [eta,1-eta] for e in E_hot,
p_e=theta for e in E_cold,
```

where `eta>0` is fixed.  Put

```text
mu_hot=sum_(e in E_hot)p_e/e,
Lambda_cold=sum_(e in E_cold)1/e.
```

For a target `q>mu_hot`, choose

```text
theta=(q-mu_hot)/Lambda_cold.
```

Then

```text
sum_e p_e/e=q
```

exactly.  If `Lambda_cold` stays in a compact subinterval of `(0,1)` and
`q-mu_hot=o(1)`, then `theta asymp q-mu_hot`.

The complex major arc remains centred because its linear phase is

```text
2 pi i m(sum_e p_e/e-q)=0.
```

No part of the Taylor argument requires equal probabilities.

### Variance

The true variance is

```text
sigma^2
 =sum_(e in E_hot)p_e(1-p_e)/e^2
  +theta(1-theta)sum_(e in E_cold)1/e^2.
```

A hot scaffold made of sufficiently large denominators may be reciprocal-load visible but
variance negligible.  Alternatively it may be deliberately used as a smoothing variance
reservoir.  The correct major arc always uses this full actual variance.

## 3. General hot--cold positivity principle

### Theorem 3.1 — smoothing scaffold transference

Let a sequence of heterogeneous subset measures satisfy:

1. **exact centering:** `sum_e p_e/e=q`;
2. **load/no-wrap:** `sum_e1/e<1`;
3. **Gaussian infinitesimality:** the maximal integer increment divided by the actual
   standard deviation tends to zero, and the normalized third cumulant tends to zero;
4. **hot smoothing:** after exact positive-measure slicing of all hot-observed transverse
   coordinates, the residual measure has total mass at most `1+o(1)` times its coherent
   short-label part;
5. **cold coherent damping:** on the retained short-label line the full characteristic
   function has a positive Gaussian major arc and an absolutely summable Gaussian/outer
   tail.

Then the exact mean-point coefficient is positive for all sufficiently large systems.

#### Proof

Use the positive-measure slicing theorem on the hot scaffold.  Because the residual remains
a positive measure, every cold factor is retained rather than replaced by an arbitrary
bounded function.  Hypothesis 4 removes the transverse CRT coordinates at near-unit cost.
The remaining one-dimensional coherent characteristic function satisfies the local-limit
criterion by hypotheses 3 and 5.  Exact centering gives a positive coefficient at the target;
no-wrap converts the cyclic statement to the reciprocal identity.  `square`

### Significance

The theorem changes the small-target problem from

```text
q-dependent sensor damping versus q-dependent core entropy
```

to

```text
reciprocal cost of one q-independent smoothing scaffold.
```

A successful scaffold can therefore cross the sampled-core power `1/2` barrier.

## 4. An elementary semiprime hot scaffold

Let

```text
P={r prime:Y<=r<=Z},
B={s prime:Z/2<s<=Z}.
```

For every lower prime row `r in P\B`, choose a set

```text
S_r subset B,
|S_r|=M,
```

and reserve the denominators

```text
E_hot,cross={rs:s in S_r}.
```

Use the same construction for the finitely many target-denominator prime coordinates.
These reserved edges are removed from the cold complete-pair reservoir.

For one row and one nonzero multiplier `d mod r`, the full top population has the elementary
energy floor

```text
sum_(s in B)||d s^(-1)/r||^2
 >>Z/(log Z)^3.
```

Since `|B| asymp Z/log Z`, the population mean is

```text
>>1/(log Z)^2.
```

Sampling and a union bound over fewer than `Z^2` row/multiplier tests therefore give one
system of row samples with

```text
M=C_A(log Z)^3
```

such that every test has sampled energy at least

```text
A log Z.
```

With hot probabilities in a fixed compact subset of `(0,1)`, every row has polynomially
small nontrivial Fourier profile, with the exponent constant independent of the target `q`.

### Reciprocal load

For one lower row,

```text
sum_(s in S_r)1/(rs)<<M/(rZ).
```

Since

```text
sum_(r in P)1/r=O(1)
```

on a fixed power interval,

```text
Lambda_hot,cross=O(M/Z).
```

A sparse top synchronizer graph on `B` of degree `O(M)` has

```text
Lambda_hot,top=O(M/(Z log Z)).
```

The fixed target-denominator rows add only `O_b(M/Z)`.  Hence

```text
boxed:
Lambda_hot=O_b(M/Z).
```

For `M asymp(log Z)^3`,

```text
boxed:
Lambda_hot=O_b((log Z)^3/Z).
```

Thus the hot mean costs only this scale.

## 5. Conditional GFF rate transfer

Retain the complete-pair cold family with limiting reciprocal capacity larger than Li's
central-band threshold and smaller than one.  Retain also the full `r=2` outer-label/variance
family, with its probability included in the cold tuning ledger.

### Theorem 5.1 — conditional hot-scaffold rate

Assume that the hot cross-row samples and a hot top synchronizer satisfy a joint
positive-slicing theorem with:

```text
transverse slicing cost=1+o(1),
short integer labels retained,
all hidden target coordinates observed.
```

Then every target

```text
q>=C_b (log Z)^3/Z
```

can be centred by the cold reservoir and the finite-prefix Fourier/local-limit assembly
closes.  Consequently the conditional GFF rate is

```text
boxed:
gamma_N<< (log p_N)^3/p_N.
```

#### Quantitative checks

At this floor:

```text
theta_cold asymp (log Z)^3/Z.
```

The full `r=2` family has variance

```text
V_2 asymp theta_cold/(Z log Z)
    asymp (log Z)^2/Z^2,
```

so the major width is

```text
V_2^(-1/2) asymp Z/log Z.
```

All local phases tend to zero on a fixed Gaussian major window.  The hot sensor square load
is negligible relative to, or may be included in, the actual variance; its smallest
semiprime denominators are `>>Z^(1+epsilon)` in the power-scale implementation.  The
reciprocal load remains below one after fixing a sufficiently large constant in the target
floor and a sufficiently small hot-load fraction.

The only new mathematical provider is the joint hot top synchronizer.  The major arc,
central-band bridge, no-wrap, and outer-label mechanisms are unchanged in type.

## 6. Why this is not merely a parameter improvement

The preceding square-root routes used

```text
kernel strength q
x sensor population
```

to create mixing.  The hot--cold route uses

```text
kernel strength 1
x sparse reciprocal cost.
```

It changes which quantity pays for aperiodicity.  The target parameter no longer pays the
mixing exponent; it pays only the expected reciprocal mass of the scaffold.

This is a canonical/microcanonical separation:

- the cold reservoir is the canonical mass/variance ensemble;
- the hot scaffold is a separate smoothing ensemble chosen for its lattice geometry.

## 7. Intrinsic floor for a hot Bernoulli row

Suppose one prime coordinate `r asymp Z` is observed by `M` independent hot Bernoulli
atoms with probabilities at most `1-eta`.  The event that none of them is selected has
probability at least

```text
eta^M.
```

If the row marginal is `(1+o(1))/r`-uniform, every point mass, including the zero-selection
point, must be `O(1/r)`.  Therefore

```text
eta^M<<1/r,
M>>log r>>log Z.
```

Since a top sensor edge costs reciprocal mass `asymp1/(rZ)`, a scaffold serving
`asymp Z/log Z` rows has unavoidable load

```text
Omega(M/Z).
```

Thus any fixed-probability independent Bernoulli scaffold has the architectural lower bound

```text
boxed:
Lambda_hot>>log Z/Z.
```

This is not a lower bound for GFF.  It is a lower bound for this independent hot-Bernoulli
smoothing architecture.

The elementary inverse-dispersion provider loses two additional logarithms, giving the
current conditional `log^3 Z/Z` scale.  A constant spectral population profile would reduce
`M` to `O(log Z)` and attain the architecture-optimal

```text
O(log Z/Z).
```

## 8. Fixed-cardinality microcanonical sensors

The zero-selection obstruction is created by independent Bernoulli thinning.  It disappears
if a row chooses exactly `d` sensors.

Let `B_r` be a sensor population of size `M_r`.  Choose uniformly a `d`-subset and include
exactly the corresponding `d` semiprimes.  The row marginal Fourier coefficient at multiplier
`k` is

```text
hat nu_r(k)
 =e_d(z_s:s in B_r)/binom(M_r,d),
z_s=exp(2 pi i k c_s/r).
```

Here `e_d` is the elementary symmetric polynomial.

Sampling without replacement differs from `d` independent draws by collision probability
`O(d^2/M_r)`.  Hence, if

```text
rho_r(k)=|M_r^(-1)sum_s z_s|,
```

then

```text
|hat nu_r(k)|
 <=rho_r(k)^d+O(d^2/M_r).
```

Consequently:

1. if uniformly `rho_r(k)<=1-c/(log Z)^2`, then `d>>log^3 Z` gives an `l^1` row profile;
2. if uniformly `rho_r(k)<=Z^(-delta)` for some fixed `delta>0`, then a sufficiently
   large constant `d` gives an `l^1` row profile.

The reciprocal load of exactly `d` top sensors per row is

```text
O(d/Z).
```

Therefore the ideal microcanonical scales are

```text
elementary spectral bias: O((log Z)^3/Z),
power-saving spectral bias: O(1/Z).
```

The second possibility removes even the hot-Bernoulli `log Z` zero-atom barrier.

### Caution

The current elementary squared-distance lemma does not by itself supply the stated modulus
bound on the population Fourier average around every possible phase.  A shift-invariant
multiplier spectral-profile theorem is the exact provider needed for the microcanonical
conclusion.  Kloosterman estimates may supply it on scale-local populations; a top-to-all-
scales version is a separate analytic problem.

## 9. Terminal synchronization is now an ensemble-design problem

Rowwise hot smoothing is not enough.  The top sensor coordinates receive all row choices and
must themselves be sliced jointly while preserving the short integer label.

The correct object is no longer a Bernoulli core with raw assignment entropy.  It is a
positive measure on sparse sensor graphs or fixed-degree incidence structures.

Three candidate terminal ensembles are:

1. a sparse hot expander graph with bounded-away-from-zero edge probabilities;
2. a fixed-outdegree directed sensor graph, followed by conditioning on its terminal block;
3. a random regular or fixed-degree bipartite sensor ensemble whose joint syndrome law is
   locally uniform.

The desired theorem is

```text
JOINT HOT-SCAFFOLD LOCAL LIMIT

joint terminal law
 = controlled short-label component
   + negligible transverse component,
```

with reciprocal cost `O(M/Z)` or `O(d/Z)` rather than core-cardinality entropy.

This is a local-limit/random-code theorem for a heterogeneous-prime, two-sparse incidence
matrix.  It is strictly stronger than row code distance and strictly different from another
parameter choice in the existing Bernoulli proof.

## 10. Relation to classical Bernoulli-part extraction

Classical local-limit theory often separates a smoothing Bernoulli component from a residual
summand and uses convolution to transfer regularity.  The present hot--cold decomposition is
the finite-group/arithmetic counterpart:

```text
hot component  = lattice smoothing / observability,
cold component = target mean / Gaussian bulk.
```

The positive-measure slicing theorem is the exact convolution statement needed to keep the
residual positive after each coordinate is removed.

## 11. New mechanism hierarchy

```text
LEVEL 0 — parameter tuning
  change tau, sample sizes, cutoffs, or logarithmic budgets.

LEVEL 1 — provider replacement
  PNT, Kloosterman, cyclic packing, reciprocal-label estimates.

LEVEL 2 — absolute transference
  weighted decoded skeleton and decoder-defect expansion.

LEVEL 3 — positive local-limit transference
  triangular slicing and joint terminal mixing.

LEVEL 4 — ensemble separation
  hot q-independent smoothing scaffold
  + cold q-dependent mass/variance reservoir.

LEVEL 5 — microcanonical sensor design
  fixed-degree or regular incidence ensembles,
  potentially reducing the smoothing cost from polylog/Z to 1/Z.
```

Levels 4 and 5 are genuine mechanism changes.  They can alter the power of the rate rather
than only its logarithmic exponent.

## 12. Honest classification

Proved:

```text
HETEROGENEOUS CENTERING IDENTITY — PROVED
HOT--COLD SMOOTHING TRANSFERENCE — PROVED ABSTRACTLY
HOT CROSS-SCAFFOLD LOAD O(M/Z) — PROVED
HOT BERNOULLI LOG-Z DEGREE LOWER BOUND — PROVED
MICROCANONICAL ROW FOURIER FORMULA — PROVED
```

Conditional theorem candidate:

```text
JOINT HOT SYNCHRONIZER
=> gamma_N << (log p_N)^3/p_N
using the elementary top inverse profile.
```

Stronger conditional frontier:

```text
POWER-SAVING TOP MULTIPLIER PROFILE
+ FIXED-DEGREE JOINT SENSOR ENSEMBLE
=> a natural O(1/p_N) smoothing scale.
```

Neither conditional conclusion is yet independently proved.  The smallest exact new
mathematical obligation is the joint local limit theorem for the hot terminal sensor
ensemble, followed by the shift-invariant top multiplier profile needed for the
microcanonical improvement.