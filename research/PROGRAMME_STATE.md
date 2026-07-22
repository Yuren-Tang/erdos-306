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
now has a hierarchy of argument-level theorem candidates.

The strongest current route is a **one-anchor sparse-Gibbs construction** at
an arbitrary prime prefix `Z=p_N`:

```text
gamma_N << p_N^(-1/4) (log p_N)^(5/4).
```

It uses:

1. one sparsified top prime block;
2. one `O((log Z)^3)` actual-prime sample which both eliminates all lower CRT
   coordinates and senses outer common labels;
3. a near-diagonal semiprime mass strip `Z<=pq<=4Z`.

It removes the multi-block global-control chain, the lower anchor,
cross-scale synchronization, and dyadic-to-all-prefix recurrence from the
preferred research architecture.

All theorem candidates remain `NOT INDEPENDENTLY REVIEWED`.  Exact proof
expansion, theorem-hypothesis checking, probability inequalities, and
formal/informal correspondence belong to E306-PDL.  E306-RL continues only with
new mathematics, counterexamples, sharpness, abstractions, and exact
`BLOCKED-FRONTIER` returns.

Issue #39 remains `PREPARED-HOLD`.

## Durable source map

### Recovery, local suppression, and first global transfer

- `b21c3e993739a6ee1f59f0c657f38bc38ae4756c` —
  `research/finite-prefix-crt/CONVERSATION_RECOVERY_2026-07-22.md`;
- `38f5b1a84a5d0eb9c5793eb277e65d39bd1c1253` —
  `research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`;
- `2e9b765baeba29746ed08f0526e98674228153bb` —
  `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`;
- `9f892b2bc8e213339d01e4e35a226f9d3e2c6fa6` —
  `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md`.

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

### Original global-control GFF route

- `45a2a64d0cb72e6ed09563499b4aa380c1d32b6f` —
  `HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`;
- `58066649243e79c9e4ceff305707ea6018e46e65` —
  `HC_RATE_DYADIC_GFF_AUDIT_ADDENDUM_01.md`.

The accepted PDL level-set/localization architecture yields a super-polynomial
moving floor-sector rate.  With dense top-block sensing this produced the first
full GFF candidate; sparse actual-prime sensing below improves that route to

```text
gamma_N=O(1/log p_N).
```

### General product-code and Peierls mechanism

- `032172416bcf58eb42f8edd0a159cb98f76d74f4` —
  `PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md`.

It extracts shifted finite-code packing, decoded product-fibre compression,
entropy--floor transfer, and a combined quotient/fibre local-limit mechanism.
Status: `GENERAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

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

The complete top prime block is constant-factor optimal at its large distance;
the sparse sensor theorems attain the application-scale frontier.

### Literature positioning

- `af11e3c6b69ac331882890ceee1664f042dd7193` —
  `LITERATURE_POSITIONING_PRODUCT_CODE_PEIERLS_V1.md`;
- `62a3462801575def26fee4f41bd8cd62ad71fc0a` —
  `LITERATURE_POSITIONING_ADDENDUM_PREFIX_OPTIMALITY.md`.

No priority or bibliographic-completeness claim is made.  Elementary or
standard-style ingredients are distinguished from the potentially distinctive
interfaces: decoded product fibres, arithmetic prefix sensing, sharp load
trade-offs, sparse Gibbs anchors, and reciprocal-label sensing.

## Sparse actual-prime sensor theorems

### Common sample

- `575475b529d720092f373523ebb1eb317401f20d` —
  `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_V1.md`.

One actual-prime subset of size `O(log Z)` simultaneously supplies logarithmic
cyclic distance for all primes below `sqrt(Z/2)`.  In the accepted global-control
route this gives the candidate

```text
gamma_N=O(1/log p_N).
```

### Row-adaptive sharp version

- `250a46cce3ade09018dde5564843fe11b5510d5a` —
  `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_ADDENDUM_ROW_ADAPTIVE.md`.

With `M_r=O(log r+log log Z)` actual top primes per row,

```text
Lambda_sensor=O(log Z/Z),
W2_sensor=O(log log Z/Z^2),
```

matching the prefix-bounded rowwise load order at the application distance.

## Two-anchor route

- `565fea39484fb065d62dd69ac6f17779931d41ea` —
  `TWO_ANCHOR_CROSS_SCALE_CONTROL_V1.md`;
- `f91b503cef858682b7385f0c9615b9e45c528d88` —
  `TWO_ANCHOR_LOCAL_PARTITION_CLOSURE_ADDENDUM.md`;
- `1f7928ce219cead2b10739a90bd048b38334a26e` —
  `TWO_ANCHOR_LOCAL_PARTITION_CLOSURE_ERRATUM.md`;
- `931ea9b74de2bf01f3c76c46efbe16019a7609d3` —
  `FPCRT02_RL_TO_PDL_HANDOFF_ADDENDUM_SPARSE_TWO_ANCHOR.md`.

Two complete internal anchor graphs plus cross-scale synchronization yielded

```text
gamma_N=O(1/(log p_N)^2).
```

This route remains a valid simpler candidate but is superseded quantitatively
by sparse-Gibbs constructions.

## Sparse Gibbs anchors and critical-scale route

### Gibbs sparsification and moving SBEE entropy

- `7443c62c58ee81a2c02542551ceff8da23e6bbad` —
  `SPARSE_GIBBS_ANCHOR_AND_CRITICAL_SCALE_V1.md`;
- `0bcaba1c742187e0cba4aa5776928fc5e24d28f0` —
  `SPARSE_GIBBS_ANCHOR_AUDIT_ADDENDUM_01.md`.

For bounded edge energies, Bernoulli edge sampling with rate `rho` converts a
level-set entropy coefficient `eta<kappa rho` and a noncoherent floor `F` into
an expected sparse noncoherent partition of size

```text
poly(parameters) * exp(-c rho F).
```

The verified single-block threshold formulas permit the moving coefficient

```text
epsilon_Y asymp Y^(-1/4) (log Y)^(13/4).
```

Sampling at this density gives a sparse block graph with

```text
Lambda_G << Y^(-1/4) (log Y)^(5/4),
sigma_G^2 asymp Y^(-9/4) (log Y)^(5/4),
```

and super-polynomially small noncoherent partition mass.

Using a lower anchor at `Y=Z^(8/9)` produced the direct all-prefix candidate

```text
gamma_N << p_N^(-2/9) (log p_N)^(5/4).
```

The audit identifies the top-sensor row `r=2` as the Lindeberg/variance
reservoir and records the exact polynomial partition scales beaten by the
logarithmic cutoff.

### Entropy--variance method-class barrier

- `4d793ac2ff07b9121d42e1cfed7e4a48d678b052` —
  `SPARSE_BLOCK_ENTROPY_VARIANCE_BARRIER_V1.md`.

For unweighted bounded-energy pair graphs whose whole coherent cutoff must stay
in a small-phase window, pure assignment entropy forces `Omega(Y)` edges and

```text
Lambda_G >> max(1/Y, Y^2 log Z/Z^2).
```

Optimizing gives the method-class barrier

```text
Lambda_G >> Z^(-2/3) (log Z)^(1/3).
```

This is not a problem lower bound.  The one-anchor route below evades it by
sensing the coherent outer range directly rather than reconstructing it by
small phases.

## Strongest current route: one anchor plus reciprocal-label sensing

- `b0174895801cf9c1410b816683e7fa9839b028b2` —
  `ONE_ANCHOR_RECIPROCAL_LABEL_SENSOR_V1.md`;
- `6b438a96ee7f74ea32559e91fef6f3547987669c` —
  `FPCRT02_RL_TO_PDL_HANDOFF_ADDENDUM_ONE_ANCHOR.md`.

At an arbitrary prime prefix `Z=p_N`:

1. sparsify the top block `B=(Z/2,Z]` by Gibbs sampling;
2. sample `O((log Z)^3)` actual top primes;
3. use this one sample both for every lower CRT inverse test and for every
   outer common-label test;
4. tune with a near-diagonal mass strip `Z<=pq<=4Z`.

The reciprocal-label population theorem states, uniformly for

```text
Z/log Z <= |m| <= Z^(9/8),  x in {0,1},
```

that

```text
(1/|B|) sum_(q in B) ||m/(2q)+x/2||^2 >> 1/(log Z)^2.
```

Thus the `r=2` sensor row annihilates both possible lower residues throughout
the coherent outer range.  The terminal Fourier partition is:

1. positive Gaussian main arc;
2. small-phase full-variance Gaussian tail;
3. reciprocal-label minor arc;
4. top-anchor coherent outer tail and noncoherent sparse-anchor sector.

A near-diagonal mass strip provides

```text
V asymp q/Z
```

at the lowest tuned targets.  The reserved load is

```text
Lambda_0(Z) << Z^(-1/4) (log Z)^(5/4).
```

Hence the strongest current research conclusion is

```text
gamma_N << p_N^(-1/4) (log p_N)^(5/4).
```

Status:

`FULL ARGUMENT-LEVEL THEOREM CANDIDATE / HANDED TO PDL / NOT INDEPENDENTLY REVIEWED`.

## PDL handoffs

- first FPCRT handoff: issue #38 comment `5050438566`;
- sparse two-anchor handoff: issue #38 comments `5050880339`, `5050914868`;
- one-anchor handoff source:
  `FPCRT02_RL_TO_PDL_HANDOFF_ADDENDUM_ONE_ANCHOR.md`.

The one-anchor proof-development units are:

1. moving-`epsilon` SBEE quantifiers;
2. Gibbs edge sparsification;
3. dual-purpose top-prime sample and reciprocal-label interval count;
4. near-diagonal mass capacity and variance;
5. exhaustive four-lane Fourier assembly.

Only a failed mathematical implication returns to E306-RL as one exact
`BLOCKED-FRONTIER`.

## Current classification

- cyclic/product-fibre suppression: `PROVED-ARGUMENT`;
- sparse actual-prime sensing: `MATERIAL GENERAL THEOREM CANDIDATE`;
- row-adaptive sensor optimality: `SHARP GENERAL THEOREM CANDIDATE`;
- Gibbs edge sparsification: `MATERIAL GENERAL THEOREM CANDIDATE`;
- moving SBEE entropy specialization: `ARGUMENT / CONSUMES VERIFIED EXPLICIT THRESHOLDS`;
- entropy--variance barrier: `MATERIAL METHOD-CLASS LOWER BOUND`;
- global-control rate `O(1/log p_N)`: `FULL THEOREM CANDIDATE / HANDED TO PDL`;
- two-anchor rate `O(1/(log p_N)^2)`: `FULL THEOREM CANDIDATE / HANDED TO PDL`;
- critical-scale rate `p_N^(-2/9) polylog`: `FULL THEOREM CANDIDATE / SUPERSEDED QUANTITATIVELY`;
- one-anchor rate `p_N^(-1/4) polylog`: `STRONGEST FULL THEOREM CANDIDATE / HANDED TO PDL`;
- literature/priority status: `INITIAL COMPARISON ONLY / NOVELTY NOT CERTIFIED`;
- released Erdős 306 theorem status: unchanged.

## Next Research Lead work

1. adversarially attack the reciprocal-label population lemma and the
   simultaneous top-prime sample;
2. seek a counterexample to the near-diagonal mass-strip assembly or four-lane
   completeness;
3. improve the moving single-block entropy coefficient beyond exponent `1/4`;
4. investigate a near-linear-edge `SPARSE-SBEE` theorem and the possible
   `polylog(Z)/Z` one-anchor endpoint;
5. compare sparse Gibbs anchor compression with random graph rigidity,
   expander-code, and polymer/cluster-expansion literature;
6. find a second non-semiprime consumer;
7. receive from E306-PDL only exact new-mathematics gaps.

Only a material theorem, correction/counterexample, or smallest exact revised
gap returns to issue #9.
