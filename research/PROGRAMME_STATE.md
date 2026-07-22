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

is read-only development context and supplies no released premise or proof
status.  This research branch is not a proof-development, manuscript,
formalization, review, release, DOI, or submission surface.

## Current direction

`E306-RL-FPCRT-02 — Global finite-prefix transfer and realization threshold`.

Issue #39 remains `PREPARED-HOLD`; this standing-branch work does not activate
the child probe.

## Durable source chain

### Conversation recovery

Commit:

`b21c3e993739a6ee1f59f0c657f38bc38ae4756c`

File:

`research/finite-prefix-crt/CONVERSATION_RECOVERY_2026-07-22.md`

Status: `COMPLETE / RECOVERY SOURCE`.

### Local CRT suppression

Commit:

`38f5b1a84a5d0eb9c5793eb277e65d39bd1c1253`

File:

`research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`

Status:

`ARGUMENT / MATERIAL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

Closed there:

1. weighted arbitrary-shift cyclic-code suppression;
2. distribution-free abundance suppression;
3. sparse `O_A(log r)` cyclic designs;
4. one simultaneous design matrix for all low primes;
5. semiprime CRT interpretation and sequential low-coordinate elimination;
6. algebraic realization of one sparse column modulo the low primorial.

### First global finite-prefix transfer

Commit:

`2e9b765baeba29746ed08f0526e98674228153bb`

File:

`research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`

Status:

`ARGUMENT / MATERIAL THEOREM CANDIDATE / SUPERSEDED CONDITIONAL FRONTIER`.

Closed there:

1. exact fixed-prefix Fourier formula;
2. congruence-to-exact alias transfer;
3. multiplicity-sensitive cyclic energy;
4. prefix-native top-block sensors via PNT and Brun--Titchmarsh;
5. hyperbolic reciprocal capacity `pi^2/12`;
6. balanced target tuning down to `O(log log z/log z)`;
7. main-frequency lower bound;
8. the least-prime-only sparse-route obstruction `L<2`.

That note isolated `HC-RATE(z)` as its remaining conditional input.

### Quantitative high-control closure and GFF transfer

Theorem-source commit before this state update:

`de6922f4eb481f7861c8d77a5544269c0b0f95c6`

File:

`research/finite-prefix-crt/HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`

Status:

`ARGUMENT / FULL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`.

## Material conclusions of FPCRT-02

### 1. Quantitative Peierls extraction

The accepted PDL level-set and localization architecture gives the explicit
moving bound

```text
offdiag <= epsilon_k / sigma_ctrl,

epsilon_k <= C exp(A(2k+1) - c 2^k/(k+1)^3).
```

Hence `epsilon_k=O_M(k^(-M))` for every fixed `M`.  The earlier condition
`HC-RATE(z)` is therefore closed with a super-polynomial margin when
`k asymp log z`.

Exact consumed proof-development checkpoint:

`proof-development/e306-rigour-v1@cecd3c351302e49577d180ebf42ad7fa784508dc`.

This consumption changes no PDL or release status.

### 2. Complete dyadic prefixes

For

```text
Z_k = 2^(2k+1),
N_k = pi(Z_k^-),
```

the primes below `Z_k` split exactly into low primes `<2^k` and complete high
dyadic blocks `P_k,...,P_(2k)`.  A common top-block sensor reservoir suppresses
all low CRT coordinates; the accepted high-control architecture suppresses the
high off-diagonal assignments; the hyperbolic mass pool tunes every target in

```text
[C log(k)/k, 1/5].
```

All selected prime factors remain inside the prefix and every selected
semiprime denominator is at least `Z_k/2`, so the Fourier congruence converts to
an exact subset sum by an exponentially strong alias estimate.

Thus

```text
gamma_(N_k) = O(log(k)/k).
```

### 3. All-prefix transfer

Li's exact floor recurrence is

```text
gamma_N <= gamma_(N-1) + w_N/p_N,
```

under a side condition already guaranteed by his unconditional bound
`gamma_N<=0.181...`.  His estimate `w_N<=4/sqrt(p_N)` makes
`sum_N w_N/p_N` convergent.  Iteration from the complete dyadic subsequence gives

```text
gamma_N = O(log log p_N / log p_N) -> 0.
```

This is a full argument candidate for Li's Gap-Free Floor conjecture and, via
Li's Proposition 9.2, for the complete positive-rational squarefree-denominator
`omega=2` theorem.

## Current classification

- conversation recovery: `COMPLETE`;
- local cyclic suppression: `PROVED-ARGUMENT`;
- top-block prefix realization: `PROVED-ARGUMENT / EXTERNAL PNT+BRUN–TITCHMARSH`;
- hyperbolic reciprocal capacity: `PROVED-ARGUMENT / EXTERNAL PNT+MERTENS`;
- exact Fourier and alias transfer: `PROVED-ARGUMENT`;
- quantitative high-control rate: `PROVED-ARGUMENT / CONSUMES ACCEPTED PDL CHECKPOINT`;
- complete dyadic-prefix coverage: `FULL THEOREM CANDIDATE`;
- Li Gap-Free Floor conjecture: `FULL THEOREM CANDIDATE / NOT INDEPENDENTLY REVIEWED`;
- full rational squarefree-denominator `omega=2` consequence: `CONDITIONAL ON THE CANDIDATE CHAIN / NOT YET PROJECT-ACCEPTED`;
- sparse least-prime-only route: `METHOD-OBSTRUCTED AT CURRENT EXPONENT SCALE`;
- released Erdős 306 theorem status: unchanged.

## No visible new-mathematics gap

No further exact missing mathematical implication is currently visible in the
preferred route.  The next work is an adversarial research-level stress test,
not routine manuscript or proof-development work:

1. audit the quantitative extraction from level sets to the moving
   `epsilon_k` rate;
2. audit every prime endpoint and incidence condition in the complete dyadic
   prefix;
3. reconstruct the diagonal-frequency partition with one fixed constant
   hierarchy;
4. verify the exact overlap with Li's central band and every recurrence side
   condition;
5. search for a counterexample to the claimed all-prefix rate or an overlooked
   unused-prime / alias lane;
6. only if the chain survives, extract the independently valuable general
   arithmetic product-code / quantitative Peierls theorem.

Only a material theorem, counterexample/obstruction, or smallest exact revised
gap returns to issue #9.
