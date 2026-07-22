# Erdős 306 Research Lead programme state

**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**State date:** 2026-07-22  
**Workspace:** `Yuren-Tang/erdos-306:research/e306-frontier-v1`  
**Immutable base:** `4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Writes:** `research/**` only  
**Downstream rule:** exact SHA checkpoints only

## Authority boundary

The released theorem authority remains

`v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

with the two named Rosser--Schoenfeld assumptions.  The frozen
`codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`
is read-only context and supplies no released premise.  This branch is not a
proof-development, manuscript, formalization, review, release, DOI, or
submission surface.

## Direction disposition

`E306-RL-FPCRT-02 — Global finite-prefix transfer and realization threshold`
has produced:

1. a full GFF theorem candidate using the accepted global-control architecture;
2. a sharper sparse-sensor version of that candidate;
3. a new two-anchor route with one exact local packaging interface still to
   verify;
4. general product-code, Peierls, and prefix-sensor optimality theorems.

The first full candidate was handed to E306-PDL for proof expansion.  Research
Lead work continues only on new mechanisms, sharpness, counterexamples,
second consumers, and exact mathematical gaps returned by PDL.

Issue #39 remains `PREPARED-HOLD`.

## Durable source chain

### Recovery and local suppression

- `b21c3e993739a6ee1f59f0c657f38bc38ae4756c` —
  `research/finite-prefix-crt/CONVERSATION_RECOVERY_2026-07-22.md`;
- `38f5b1a84a5d0eb9c5793eb277e65d39bd1c1253` —
  `research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`.

Closed there: arbitrary-shift cyclic suppression, abundance and sparse-design
regimes, sequential CRT elimination, and algebraic realization of sparse
columns.

### First global transfer and corrections

- `2e9b765baeba29746ed08f0526e98674228153bb` —
  `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`;
- `9f892b2bc8e213339d01e4e35a226f9d3e2c6fa6` —
  `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md`.

Retained valid content:

1. exact fixed-prefix Fourier formula;
2. multiplicity-sensitive cyclic energy;
3. actual top-block sensing by PNT and Brun--Titchmarsh;
4. hyperbolic reciprocal capacity `pi^2/12`;
5. balanced target tuning and major-frequency scale.

Withdrawn:

- the Hoeffding alias detour, because total reciprocal load `<1` gives
  deterministic no-wrap;
- the resulting false sparse-route `L<2` Linnik obstruction;
- the non-discriminating phrase “induced by one integer label” for arbitrary CRT
  assignments.

### Global-control GFF candidate

- `45a2a64d0cb72e6ed09563499b4aa380c1d32b6f` —
  `research/finite-prefix-crt/HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`;
- `58066649243e79c9e4ceff305707ea6018e46e65` —
  `research/finite-prefix-crt/HC_RATE_DYADIC_GFF_AUDIT_ADDENDUM_01.md`.

Status:

`ARGUMENT / FULL THEOREM CANDIDATE / ADVERSARIALLY CORRECTED / NOT INDEPENDENTLY REVIEWED`.

The accepted PDL level-set and localization architecture at

`proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`

gives the moving rate

```text
floor-sector <= epsilon_k / sigma_ctrl,

epsilon_k <= C exp(A(2k+1)-c 2^k/(k+1)^3).
```

The corrected coherent terminal split uses a growing cutoff and includes the
intermediate full-variance Gaussian lane.

### Research-to-PDL handoff

- `059f1ecd2210c9aadf3d8a613167fa053f78bca0` —
  `research/finite-prefix-crt/FPCRT02_RL_TO_PDL_HANDOFF_2026-07-22.md`;
- posted to research-workbench issue #38 comment `5050438566`.

The structural counterexample search found no new obstruction in mass-edge
factorization, prefix-prime incidence, no-wrap, coherent reconstruction,
frequency completeness, or recurrence direction.  Routine expansion and
source/correspondence checking belong to E306-PDL.  MATH-CUR integration remains
premature.

### General product-code / Peierls mechanism

- `032172416bcf58eb42f8edd0a159cb98f76d74f4` —
  `research/finite-prefix-crt/PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md`.

Status:

`ARGUMENT / GENERAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

It extracts shifted finite-code packing, arbitrary-shift product-fibre
compression, decoded skeletons, entropy--floor transfer, and the combined
quotient/fibre local-limit architecture.

### Prefix-bounded load--distance optimality

- `7eaab57fe7c1c202a578f3a21a98fbc89a66333c` —
  `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_V1.md`;
- `4b61069a1785b6a24a069a41c0375acf89932d31` —
  `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_IRREGULAR.md`;
- `ad2e338ce98bfaf79f8402f5465416d71baded28` —
  `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_PREFIX_BOUNDED.md`.

For arbitrary irregular row-dependent columns bounded by a prefix ceiling `Z`,
worst-row cyclic distance `D_*` forces

```text
Lambda >= 4 H_1(R) D_*/Z,
W_2    >= 4 H_2(R) D_*/Z^2.
```

The complete top prime block attains both bounds for its large distance
`D_* asymp Z/log Z`.  This is fixed-distance optimality; it does not say that an
application must use that unnecessarily large distance.

### Literature positioning

- `af11e3c6b69ac331882890ceee1664f042dd7193` —
  `LITERATURE_POSITIONING_PRODUCT_CODE_PEIERLS_V1.md`;
- `62a3462801575def26fee4f41bd8cd62ad71fc0a` —
  `LITERATURE_POSITIONING_ADDENDUM_PREFIX_OPTIMALITY.md`.

Status:

`INITIAL COMPARISON ONLY / NOVELTY NOT CERTIFIED`.

The atomic metric and Peierls lemmas are elementary or standard-style.  The
potentially distinctive interfaces are decoded product-fibre compression,
arithmetic prefix sensing, sharp load--distance trade-offs, and their modular
local-limit assembly.

## Sparse actual-prime sensing

### Common-column theorem

- `575475b529d720092f373523ebb1eb317401f20d` —
  `research/finite-prefix-crt/SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_V1.md`.

The full top prime population has constant mean cyclic energy for every
`r<sqrt(Z/2)` and every nonzero multiplier.  Sampling without replacement and a
union bound give one common actual-prime subset

```text
T_Z subset (Z/2,Z),
|T_Z|=O(log Z),
D_r(T_Z) >= c log Z  for every r<sqrt(Z/2).
```

This is exactly the distance scale needed for product-fibre compression.  The
sensor loads become

```text
Lambda_sensor = O(log Z log log Z / Z),
W2_sensor     = O(log Z / Z^2),
```

and are negligible relative to global high control.

Consequently the full global-control route sharpens to

```text
gamma_(N_k)=O(1/k),
gamma_N=O(1/log p_N).
```

This quantitative rate supersedes the earlier
`O(log log p_N/log p_N)` candidate rate.

### Row-adaptive sharp theorem

- `250a46cce3ade09018dde5564843fe11b5510d5a` —
  `research/finite-prefix-crt/SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_ADDENDUM_ROW_ADAPTIVE.md`.

Allowing each row to choose

```text
M_r=O(log r+log log Z)
```

actual top-block primes gives full product-fibre error `o(1)` and

```text
Lambda_sensor = O(log Z/Z),
W2_sensor     = O(log log Z/Z^2).
```

This attains the prefix-bounded rowwise load order at the entropy-matched
distance required by the application.  Common-column and row-adaptive designs
optimize different resources: number of distinct high columns versus total
reciprocal load.

## Two-anchor cross-scale route

- `565fea39484fb065d62dd69ac6f17779931d41ea` —
  `research/finite-prefix-crt/TWO_ANCHOR_CROSS_SCALE_CONTROL_V1.md`.

Status:

`ARGUMENT / MATERIAL NEW ROUTE / ONE LOCALIZATION INTERFACE TO VERIFY`.

Take only:

1. the lowest high block `A=P_k`;
2. the top block `B=P_(2k)`;
3. internal complete graphs on `A` and `B`;
4. the complete bipartite graph `A x B`.

Their total reciprocal load and variance are

```text
Lambda_anchor = O(1/k^2),
sigma_anchor^2 asymp 1/(Z k^2).
```

All non-anchor prefix coordinates are eliminated by one actual-prime top-block
sample of size `O((log Z)^3)` and negligible load.

### Cross-scale synchronization theorem

If the anchor blocks carry coherent labels `u` and `v`, then

```text
n_pq(u,v)/(pq)
 = v/(pq) + (u-v) q^(-1)/p   (mod 1).
```

If `u!=v`, at least one lowest-anchor prime does not divide `u-v`; the complete
top block then forces cross energy

```text
Omega(Z/log Z).
```

If `u=v=m`, the anchor energy is exactly

```text
m^2 sigma_anchor^2.
```

### Exact remaining interface

`LOCAL-ANCHOR-PARTITION(j)`:

package the already verified single-block SBEE mechanism as a uniform split into

1. a coherent main arc with exact label energy;
2. a Gaussian coherent tail;
3. a nondominant/floor error `exp(-Omega(2^j/j^3))/sigma_j`;
4. a base scale independent of the later growing cutoff.

The tree already contains `SBEEAssembly.single_block_counting`, Theorem A
dominant counting, Theorem B forcing, and exact CRT quadratic identities.  The
question is whether these package directly with the required quantifier order.
That packaging belongs to PDL; failure of the interface would be the smallest
new mathematical gap.

Conditional on this interface, the route gives

```text
gamma_(N_k)=O(1/k^2),
gamma_N=O(1/(log p_N)^2).
```

## Current classification

- local cyclic suppression: `PROVED-ARGUMENT`;
- dense top-block sensing: `PROVED-ARGUMENT / EXTERNAL PNT+BRUN--TITCHMARSH`;
- sparse common actual-prime sensing: `MATERIAL THEOREM CANDIDATE`;
- row-adaptive application-scale optimal sensing: `SHARP GENERAL THEOREM CANDIDATE`;
- hyperbolic mass capacity: `PROVED-ARGUMENT / EXTERNAL PNT+MERTENS`;
- no-wrap Fourier transfer: `PROVED-ARGUMENT`;
- moving global-control rate: `PROVED-ARGUMENT / CONSUMES ACCEPTED PDL CHECKPOINT`;
- global-control dyadic coverage: `FULL THEOREM CANDIDATE`;
- sharpened global-control GFF rate `O(1/log p_N)`: `FULL THEOREM STRENGTHENING CANDIDATE / NOT INDEPENDENTLY REVIEWED`;
- two-anchor cross-scale synchronization: `PROVED-ARGUMENT`;
- two-anchor GFF rate `O(1/(log p_N)^2)`: `CONDITIONAL ROUTE CANDIDATE / LOCAL-ANCHOR-PARTITION TO VERIFY`;
- abstract product-code/Peierls theorem: `GENERAL THEOREM CANDIDATE`;
- prefix-bounded load--distance optimality: `MATERIAL GENERAL THEOREM CANDIDATE`;
- literature/priority status: `INITIAL COMPARISON ONLY / NOVELTY NOT CERTIFIED`;
- released Erdős 306 theorem status: unchanged.

## Next Research Lead work

1. send the sparse-sensor strengthening and exact `LOCAL-ANCHOR-PARTITION`
   question to E306-PDL;
2. test the two-anchor route for exception-set and label-range obstructions;
3. determine whether the `O(1/k^2)` anchor load is optimal under the required
   coherent-label range;
4. investigate cancellation or adaptive designs only after the two-anchor route
   is dispositioned;
5. search for a second non-semiprime consumer of decoded product-fibre
   compression;
6. receive from E306-PDL only exact new-mathematics gaps.

Only a material theorem, correction/counterexample, or smallest exact revised
gap returns to issue #9.