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

## Current direction

`E306-RL-FPCRT-02 — Global finite-prefix transfer and realization threshold`.

Issue #39 remains `PREPARED-HOLD`.

## Durable source chain

### Recovery source

- commit `b21c3e993739a6ee1f59f0c657f38bc38ae4756c`;
- `research/finite-prefix-crt/CONVERSATION_RECOVERY_2026-07-22.md`.

### Local suppression

- commit `38f5b1a84a5d0eb9c5793eb277e65d39bd1c1253`;
- `research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`;
- status `ARGUMENT / MATERIAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

This closes arbitrary-shift cyclic suppression, the abundance and sparse-design
regimes, sequential CRT elimination, and algebraic realization of sparse
columns.

### First global transfer

- commit `2e9b765baeba29746ed08f0526e98674228153bb`;
- `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`;
- status `SUPERSEDED CONDITIONAL FRONTIER`.

Retained valid content:

1. exact fixed-prefix Fourier formula;
2. multiplicity-sensitive cyclic energy;
3. top-block sensor realization by PNT and Brun--Titchmarsh;
4. hyperbolic reciprocal capacity `pi^2/12`;
5. balanced target tuning and major-frequency scale.

Controlling correction:

- commit `9f892b2bc8e213339d01e4e35a226f9d3e2c6fa6`;
- `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md`.

Withdrawn claims:

- alias removal does not require Hoeffding because total reciprocal load is `<1`;
- the asserted sparse-route Linnik exponent obstruction `L<2` was an artefact of
  that unnecessary alias argument and is withdrawn;
- “induced by one integer label” is not a discriminating definition of a
  diagonal CRT assignment.

### Quantitative high-control and dyadic GFF transfer

Corrected theorem source:

- commit `45a2a64d0cb72e6ed09563499b4aa380c1d32b6f`;
- `research/finite-prefix-crt/HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`;
- status `ARGUMENT / FULL THEOREM CANDIDATE / ADVERSARIALLY CORRECTED / NOT INDEPENDENTLY REVIEWED`.

Controlling terminal-lane addendum:

- commit `58066649243e79c9e4ceff305707ea6018e46e65`;
- `research/finite-prefix-crt/HC_RATE_DYADIC_GFF_AUDIT_ADDENDUM_01.md`;
- status `ARGUMENT / CONTROLLING ADDENDUM / NOT INDEPENDENTLY REVIEWED`.

## Current material conclusions

### 1. Quantitative Peierls extraction

The accepted PDL level-set and localization architecture at

`proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`

gives the moving floor-sector rate

```text
floor-sector <= epsilon_k / sigma_ctrl,

epsilon_k <= C exp(A(2k+1)-c 2^k/(k+1)^3).
```

Thus `epsilon_k=O_M(k^(-M))` for every fixed `M`.  The earlier `HC-RATE`
condition is closed with a super-polynomial margin.

The exact localization split is:

1. high-energy floor sector;
2. coherent-label sector with exact quadratic energy.

### 2. Complete dyadic prefixes

For

```text
Z_k=2^(2k+1),
N_k=pi(Z_k^-),
```

the prefix splits into low primes `<2^k` and complete high blocks
`P_k,...,P_(2k)`.  Top-block sensors suppress every low CRT coordinate, the
accepted high-control system handles the high floor sector, and the hyperbolic
mass pool tunes every target in

```text
[C log(k)/k, 1/5].
```

The total reciprocal load is `<0.41<1`, so a Fourier congruence modulo the
primorial is automatically an exact equality; no alias estimate is needed.

### 3. Coherent-label terminal partition

Take a growing high-main cutoff

```text
C_k=D sqrt(log k).
```

For every coherent label `|m|<=C_k/sigma_ctrl`, the correct low residue
`m mod r` remains the unique decoded point because its sensor energy is only
`O(k log k/r^2)`, while the cyclic code distance is `Omega(Z_k/log Z_k)`.
The reconstructed global frequency is `h=m`, and the full Bernoulli product has
variance `V` throughout this range.

The terminal split is therefore:

1. positive labels `|m|<=M_0/sqrt(V)`;
2. coherent intermediate Gaussian tail;
3. coherent outer tail `exp(-c C_k^2)/sigma_ctrl`;
4. floor sector and low siblings.

Each negative lane is `o(V^(-1/2))` after fixed choices of `M_0,D`.

### 4. Gap-free floor

The dyadic theorem candidate gives

```text
gamma_(N_k)=O(log k/k).
```

Li's recurrence

```text
gamma_N <= gamma_(N-1)+w_N/p_N
```

has a summable tail because eventually `w_N<=4/sqrt(p_N)`.  His unconditional
`gamma_N<=0.181...` supplies the recurrence side condition and overlaps the
new low interval.  Hence

```text
gamma_N=O(log log p_N/log p_N) -> 0.
```

This is a full argument candidate for Li's Gap-Free Floor conjecture and, via
Li's Proposition 9.2, for the complete positive-rational squarefree-denominator
`omega=2` theorem.

## Current classification

- local cyclic suppression: `PROVED-ARGUMENT`;
- top-block realization: `PROVED-ARGUMENT / EXTERNAL PNT+BRUN--TITCHMARSH`;
- hyperbolic capacity: `PROVED-ARGUMENT / EXTERNAL PNT+MERTENS`;
- no-wrap Fourier transfer: `PROVED-ARGUMENT`;
- moving high-control rate: `PROVED-ARGUMENT / CONSUMES ACCEPTED PDL CHECKPOINT`;
- coherent-label terminal partition: `PROVED-ARGUMENT`;
- dyadic finite-prefix coverage: `FULL THEOREM CANDIDATE`;
- Li GFF: `FULL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`;
- full rational `omega=2` consequence: `CANDIDATE CONSEQUENCE / NOT PROJECT-ACCEPTED`;
- sparse prescribed-residue route: `SECONDARY OPEN DESIGN QUESTION / NO L<2 OBSTRUCTION CLAIM`;
- released Erdős 306 status: unchanged.

## Next routine branch work

No visible new-mathematics implication remains in the preferred route.  Continue
an adversarial stress test:

1. audit the moving-rate quantifier order against the exact PDL theorem;
2. audit coherent-label injection and the growing `C_k` range;
3. audit every dyadic endpoint, edge-disjointness, and prime-incidence condition;
4. audit the exact central-band overlap and recurrence side conditions;
5. search for unused-prime, double-assignment, wrapping, or missing-frequency
   counterexamples;
6. if the chain survives, extract the general quantitative Peierls/product-code
   theorem as an independently valuable result.

Only a material theorem, correction/counterexample, or smallest exact revised
gap returns to issue #9.
