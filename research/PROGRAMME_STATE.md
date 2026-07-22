# Erdős 306 Research Lead programme state

**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**State date:** 2026-07-22  
**Workspace:** `Yuren-Tang/erdos-306:research/e306-frontier-v1`  
**Immutable base:** `4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Writes:** `research/**` only  
**Downstream rule:** exact SHA checkpoints only

## Authority boundary

The released authority remains

`Yuren-Tang/erdos-306:v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

with the two named Rosser--Schoenfeld assumptions.  The frozen
`codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`
is read-only context and supplies no released premise.  This research branch is
not a PDL, Lean, manuscript, corpus, review, release, DOI, or submission surface.

## Current direction

`E306-RL-FPCRT-02 — Global finite-prefix transfer and realization threshold`
has produced two nested full theorem candidates:

1. a global-control route with sparse actual-prime sensors and candidate rate
   `gamma_N=O(1/log p_N)`;
2. a two-anchor route replacing the multi-block global quotient and candidate
   rate `gamma_N=O(1/(log p_N)^2)`.

Both remain `NOT INDEPENDENTLY REVIEWED`.  Exact proof expansion and
formal/informal correspondence belong to E306-PDL.  Research Lead work now
continues on sharpness, counterexamples, new consumers, and any exact
`BLOCKED-FRONTIER` returned by PDL.

Issue #39 remains `PREPARED-HOLD`.

## Durable source map

### Local suppression and first finite-prefix transfer

- `b21c3e993739a6ee1f59f0c657f38bc38ae4756c` —
  `CONVERSATION_RECOVERY_2026-07-22.md`;
- `38f5b1a84a5d0eb9c5793eb277e65d39bd1c1253` —
  `CRT_SUPPRESSION_THEOREMS_V1.md`;
- `2e9b765baeba29746ed08f0526e98674228153bb` —
  `GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`;
- `9f892b2bc8e213339d01e4e35a226f9d3e2c6fa6` —
  `GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md`.

Retained mathematics:

1. arbitrary-shift cyclic and product-fibre suppression;
2. multiplicity-sensitive cyclic energy;
3. actual prime-block sensing by PNT and Brun--Titchmarsh;
4. hyperbolic reciprocal capacity `pi^2/12`;
5. balanced target tuning and no-wrap exactness.

Withdrawn:

- the unnecessary Hoeffding alias detour;
- the derived false sparse-route `L<2` obstruction;
- a non-discriminating definition of diagonal CRT assignments.

### Original global-control GFF candidate

- `45a2a64d0cb72e6ed09563499b4aa380c1d32b6f` —
  `HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`;
- `58066649243e79c9e4ceff305707ea6018e46e65` —
  `HC_RATE_DYADIC_GFF_AUDIT_ADDENDUM_01.md`.

The accepted PDL control architecture at

`proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`

gives

```text
floor-sector <= epsilon_k/sigma_ctrl,
epsilon_k <= C exp(A(2k+1)-c 2^k/(k+1)^3).
```

The corrected terminal partition includes:

1. positive common labels;
2. an intermediate full-variance Gaussian tail;
3. a coherent outer tail;
4. the floor sector and low siblings.

### First RL-to-PDL handoff

- `059f1ecd2210c9aadf3d8a613167fa053f78bca0` —
  `FPCRT02_RL_TO_PDL_HANDOFF_2026-07-22.md`;
- issue #38 comment `5050438566`.

Structural counterexample search found no obstruction in mass-edge
factorization, prefix-prime incidence, no-wrap, coherent reconstruction,
frequency completeness, or recurrence direction.

### General mechanism extraction

- `032172416bcf58eb42f8edd0a159cb98f76d74f4` —
  `PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md`.

Status:

`ARGUMENT / GENERAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

It extracts shifted finite-code packing, decoded product-fibre compression,
entropy--floor transfer, and a combined quotient/fibre local-limit mechanism.

### Prefix-bounded load--distance theory

- `7eaab57fe7c1c202a578f3a21a98fbc89a66333c` —
  `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_V1.md`;
- `4b61069a1785b6a24a069a41c0375acf89932d31` —
  `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_IRREGULAR.md`;
- `ad2e338ce98bfaf79f8402f5465416d71baded28` —
  `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_PREFIX_BOUNDED.md`.

Every prefix-bounded irregular rowwise design satisfies

```text
Lambda >= 4 H_1(R) D_*/Z,
W_2    >= 4 H_2(R) D_*/Z^2.
```

The full top prime block is optimal for its large distance
`D_* asymp Z/log Z`; sparse constructions below show that the application only
needs logarithmic distance.

### Literature positioning

- `af11e3c6b69ac331882890ceee1664f042dd7193` —
  `LITERATURE_POSITIONING_PRODUCT_CODE_PEIERLS_V1.md`;
- `62a3462801575def26fee4f41bd8cd62ad71fc0a` —
  `LITERATURE_POSITIONING_ADDENDUM_PREFIX_OPTIMALITY.md`.

No priority or bibliographic-completeness claim is made.  The atomic metric and
Peierls lemmas are elementary or standard-style; the potentially distinctive
interfaces are decoded product fibres, arithmetic prefix sensing, sharp load
trade-offs, and cross-scale synchronization.

## Sparse actual-prime sensor theorems

### One common sample

- `575475b529d720092f373523ebb1eb317401f20d` —
  `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_V1.md`.

One actual-prime subset

```text
T_Z subset (Z/2,Z),
|T_Z|=O(log Z)
```

simultaneously gives cyclic distance `Omega(log Z)` for every
`r<sqrt(Z/2)`.  Hence

```text
Lambda_sensor = O(log Z log log Z/Z),
W2_sensor     = O(log Z/Z^2).
```

Replacing the dense sensor reservoir in the accepted global-control route gives

```text
gamma_(N_k)=O(1/k),
gamma_N=O(1/log p_N).
```

This supersedes the earlier quantitative rate
`O(log log p_N/log p_N)`.

### Row-adaptive sharp version

- `250a46cce3ade09018dde5564843fe11b5510d5a` —
  `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_ADDENDUM_ROW_ADAPTIVE.md`.

Choosing

```text
M_r=O(log r+log log Z)
```

actual top-block primes for row `r` gives full fibre error `o(1)` with

```text
Lambda_sensor = O(log Z/Z),
W2_sensor     = O(log log Z/Z^2).
```

This attains the prefix-bounded rowwise load order at the entropy-matched
application distance.

## Two-anchor theorem candidate

### Cross-scale route

- `565fea39484fb065d62dd69ac6f17779931d41ea` —
  `TWO_ANCHOR_CROSS_SCALE_CONTROL_V1.md`.

Use only:

1. the lowest high block `A=P_k`;
2. the top block `B=P_(2k)`;
3. internal complete graphs on both;
4. the complete bipartite graph `A x B`.

The anchor scales are

```text
Lambda_anchor = O(1/k^2),
sigma_anchor^2 asymp 1/(Z k^2).
```

All non-anchor coordinates are eliminated by one actual top-block sample of
size `O((log Z)^3)` and negligible load.

For coherent anchor labels `u,v`,

```text
n_pq(u,v)/(pq)
 = v/(pq)+(u-v)q^(-1)/p  (mod 1).
```

If `u!=v`, one lowest-anchor prime detects the difference and the top block
forces cross energy `Omega(Z/log Z)`.  If `u=v=m`, the anchor energy is exactly
`m^2 sigma_anchor^2`.

### Local-partition closure

- `f91b503cef858682b7385f0c9615b9e45c528d88` —
  `TWO_ANCHOR_LOCAL_PARTITION_CLOSURE_ADDENDUM.md`;
- `1f7928ce219cead2b10739a90bd048b38334a26e` —
  `TWO_ANCHOR_LOCAL_PARTITION_CLOSURE_ERRATUM.md`.

Take

```text
R_0=D^2 log Z.
```

For either anchor scale `Y`:

```text
R_0 << Y/(log Y)^3
```

so Theorem B forces every `Q<=R_0` assignment to be dominant.  Theorem A gives

```text
#exceptions << R_0(log Y)^3/Y < 1,
```

hence exact coherence and energy `m^2 sigma_P^2`.

The full complement is bounded by

```text
sum_(Q>R_0) exp(-cQ)
 <= exp(-(c-c')R_0) * C_(c')/sigma_P.
```

After multiplying by the opposite anchor partition scale, choose `D` with
`delta D^2>2`; using `V<<1/Z`, every high-anchor remainder is
`o(V^(-1/2))`.

Thus the two-anchor route is now a full argument-level theorem candidate:

```text
gamma_(N_k)=O(1/k^2),
gamma_N=O(1/(log p_N)^2).
```

### Superseding PDL handoff

- `931ea9b74de2bf01f3c76c46efbe16019a7609d3` —
  `FPCRT02_RL_TO_PDL_HANDOFF_ADDENDUM_SPARSE_TWO_ANCHOR.md`;
- issue #38 comments `5050880339` and `5050914868`.

The local interface is no longer a new-mathematics gap.  PDL should verify exact
hypotheses, constants, concentration statements, exception-count regime, and
formal correspondence.  A failure of any stated input returns as one exact
`BLOCKED-FRONTIER`.

## Current classification

- local cyclic/product suppression: `PROVED-ARGUMENT`;
- sparse common actual-prime sensing: `MATERIAL THEOREM CANDIDATE`;
- row-adaptive optimal sensing: `SHARP GENERAL THEOREM CANDIDATE`;
- hyperbolic mass capacity: `PROVED-ARGUMENT / EXTERNAL PNT+MERTENS`;
- no-wrap transfer: `PROVED-ARGUMENT`;
- global-control GFF rate `O(1/log p_N)`: `FULL THEOREM CANDIDATE / HANDED TO PDL`;
- cross-scale label synchronization: `PROVED-ARGUMENT`;
- two-anchor GFF rate `O(1/(log p_N)^2)`: `FULL THEOREM CANDIDATE / HANDED TO PDL`;
- abstract product-code/Peierls theorem: `GENERAL THEOREM CANDIDATE`;
- prefix-bounded load--distance theory: `MATERIAL GENERAL THEOREM CANDIDATE`;
- literature/priority status: `INITIAL COMPARISON ONLY / NOVELTY NOT CERTIFIED`;
- released Erdős 306 theorem status: unchanged.

## Next Research Lead work

1. adversarially test the two-anchor route for a hidden cross-label or
   concentration obstruction;
2. determine whether `O(1/k^2)` is optimal under the coherent-label range
   needed for low-coordinate decoding;
3. investigate whether cancellation, adaptive sensing, or a different variance
   reservoir can beat the quadratic-logarithmic threshold;
4. find a second non-semiprime consumer of decoded product-fibre compression;
5. receive from E306-PDL only exact new-mathematics gaps.

Only a material theorem, correction/counterexample, or smallest exact revised
gap returns to issue #9.