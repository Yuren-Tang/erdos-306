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
has reached a full theorem candidate and has been handed to E306-PDL for exact
proof expansion.

The Research Lead continues only with frontier mathematics:

1. general product-code / Peierls mechanism extraction;
2. literature and sharpness comparison;
3. genuine counterexamples or new consumers;
4. return questions from PDL that expose a new mathematical implication.

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

### First global transfer and correction

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

### Research-to-PDL handoff

- commit `059f1ecd2210c9aadf3d8a613167fa053f78bca0`;
- `research/finite-prefix-crt/FPCRT02_RL_TO_PDL_HANDOFF_2026-07-22.md`;
- posted to research-workbench issue #38 comment `5050438566`.

The structural counterexample search found no new obstruction in mass-edge
factorization, prefix-prime incidence, no-wrap, coherent reconstruction,
frequency completeness, or recurrence direction.  Remaining candidate-chain
work is proof expansion and source/correspondence checking owned by E306-PDL.
MATH-CUR integration is premature until PDL and assurance complete.

### General mechanism extraction

- commit `032172416bcf58eb42f8edd0a159cb98f76d74f4`;
- `research/finite-prefix-crt/PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md`;
- status `ARGUMENT / GENERAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

The note extracts:

1. shifted weighted-code separation;
2. arbitrary-shift one-fibre partition bounds;
3. product-fibre compression and decoded skeletons;
4. quantitative entropy--floor Peierls transfer;
5. a combined quotient/fibre theorem;
6. prime-block complete bipartite sensors;
7. asymptotically free CRT dimension elimination.

## FPCRT-02 material conclusions

### Quantitative Peierls extraction

The accepted PDL level-set and localization architecture at

`proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`

gives

```text
floor-sector <= epsilon_k / sigma_ctrl,

epsilon_k <= C exp(A(2k+1)-c 2^k/(k+1)^3).
```

Thus `epsilon_k=O_M(k^(-M))` for every fixed `M`.

### Complete dyadic prefixes

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

The total reciprocal load is `<0.41<1`, so modular Fourier positivity is already
an exact equality, with no alias estimate.

### Coherent-label terminal partition

With

```text
C_k=D sqrt(log k),
```

the expected low residues remain uniquely decoded throughout the growing high
main arc.  The terminal split is:

1. positive labels `|m|<=M_0/sqrt(V)`;
2. coherent intermediate full-variance Gaussian tail;
3. coherent outer tail `exp(-c C_k^2)/sigma_ctrl`;
4. floor sector and low siblings.

Every negative lane is `o(V^(-1/2))` after fixed choices of `M_0,D`.

### Gap-free floor candidate

The argument gives

```text
gamma_(N_k)=O(log k/k).
```

Li's recurrence

```text
gamma_N <= gamma_(N-1)+w_N/p_N
```

has a summable tail because eventually `w_N<=4/sqrt(p_N)`.  His unconditional
`gamma_N<=0.181...` supplies the side condition and overlaps the new low
interval.  Hence the candidate conclusion is

```text
gamma_N=O(log log p_N/log p_N) -> 0.
```

This would prove Li's Gap-Free Floor conjecture and, via his Proposition 9.2,
the complete positive-rational squarefree-denominator `omega=2` theorem.

## Current classification

- local cyclic suppression: `PROVED-ARGUMENT`;
- top-block realization: `PROVED-ARGUMENT / EXTERNAL PNT+BRUN--TITCHMARSH`;
- hyperbolic capacity: `PROVED-ARGUMENT / EXTERNAL PNT+MERTENS`;
- no-wrap Fourier transfer: `PROVED-ARGUMENT`;
- moving high-control rate: `PROVED-ARGUMENT / CONSUMES ACCEPTED PDL CHECKPOINT`;
- coherent-label terminal partition: `PROVED-ARGUMENT`;
- dyadic finite-prefix coverage: `FULL THEOREM CANDIDATE`;
- Li GFF: `FULL THEOREM CANDIDATE / HANDED TO PDL / NOT INDEPENDENTLY REVIEWED`;
- full rational `omega=2` consequence: `CANDIDATE CONSEQUENCE / NOT PROJECT-ACCEPTED`;
- abstract product-code/Peierls theorem: `GENERAL THEOREM CANDIDATE`;
- prime-block free-dimension elimination: `GENERAL ARITHMETIC THEOREM CANDIDATE`;
- sparse prescribed-residue route: `SECONDARY OPEN DESIGN QUESTION / NO L<2 OBSTRUCTION CLAIM`;
- released Erdős 306 status: unchanged.

## Next Research Lead work

1. compare the abstract theorem with small-bias spaces, expander codes, polymer or
   cluster-expansion Peierls bounds, and conditional local-limit theorems;
2. determine the sharp load--distance frontier for complete bipartite arithmetic
   sensors and whether the prime-block construction is asymptotically optimal;
3. find a second non-semiprime consumer of decoded-skeleton Fourier compression;
4. investigate whether deterministic sparse designs can match the dense
   prime-block reservoir while preserving prefix placement;
5. receive from E306-PDL only exact new-mathematics gaps.

Only a material theorem, correction/counterexample, or smallest exact revised
gap returns to issue #9.
