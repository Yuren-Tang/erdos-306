# Erdős 306 Research Lead programme state

**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**State date:** 2026-07-23  
**Workspace:** `Yuren-Tang/erdos-306:research/e306-frontier-v1`  
**Immutable base:** `4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Writes:** `research/**` only  
**Downstream rule:** exact SHA checkpoints only

## Authority boundary

The released authority remains

`Yuren-Tang/erdos-306:v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

with the two named Rosser--Schoenfeld assumptions.  The frozen pushlinter line is
read-only development evidence.  This branch is not a proof-development,
manuscript, Curator, review, Lean, release, DOI, arXiv, or submission surface.

The complete-pair multiblock paper-first route has passed independent audit with
bounded local repairs and is the assured ordinary-mathematics fallback.  The
shorter one-anchor and GFF routes below remain unreviewed research candidates.

## Current strongest conclusions

### Original Erdős 306 proof architecture

The strongest proposed proof DAG is the sparse-synchronization one-anchor route:

```text
complete-pair load
+ polylog actual-prime top core
+ shift-uniform row decoding
+ decoder-defect expansion
+ robust deterministic exact-cold witness rigidity
+ direct full-family major arc
+ Gaussian / reciprocal-label tails
+ exactness and arithmetic closure.
```

It removes the load-bearing use of:

```text
all-block hot/cold propagation,
adjacent-label penalties,
global injective encoding,
global level-set/localization,
fingerprint entropy,
separate sibling sector,
eta,
fixed reservoir size G.
```

Status:

```text
MATERIAL STRICTER ROUTE CANDIDATE /
SPARSE ARITHMETIC SYNCHRONIZATION SOLVED AT ARGUMENT LEVEL /
NOT INDEPENDENTLY REVIEWED.
```

Controlling sources:

- `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_01.md`;
- `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_02.md`;
- `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_MAJOR_ARC_AND_TERMINAL_BUDGET.md`;
- `research/paper-first-one-anchor/SPARSE_TOP_SYNCHRONIZATION_CORE_V1.md`;
- `research/paper-first-one-anchor/SPARSE_ARITHMETIC_SYNCHRONIZATION_CLUSTER_EXPANSION_V1.md`;
- `research/paper-first-one-anchor/CURRENT_STATE_2026-07-22_WEIGHTED_FIBRE.md`.

### Gap-Free Floor / finite-prefix frontier

The strongest current GFF candidate is the small-parameter complete-pair route:

```text
gamma_N << p_N^(-1/2)(log p_N)^(7/2).
```

At prefix `Z=p_N`, choose a fixed power interval

```text
P={p:Z^(1/tau)<=p<=Z}.
```

The lower-band realization theorem uses

```text
4/3<tau<2.
```

The full GFF consequence additionally requires overlap with Li's known central
band.  If

```text
gamma_*=0.181...,
lambda_tau=(log tau)^2/2,
tau_CB=exp(sqrt(2 gamma_*)) approximately 1.825,
```

then choose

```text
tau in (tau_CB,2)
and
gamma_*<q_*<lambda_tau.
```

For example `tau=1.95` leaves a fixed overlap margin.  This corrects the earlier
overstatement that every `tau in (4/3,2)` automatically yields the full GFF
consequence.

Use all complete pairs in `P`, and set the common Bernoulli parameter
`theta=q/Lambda`.  A target-adaptive top core has size

```text
|S|=O((log Z)^3/q).
```

Its entropy is `O((log Z)^4/q)`, while decoder-defect synchronization supplies
weighted witness damping `qZ/(log Z)^3`.  Balancing the two gives

```text
q^2Z>>(log Z)^7.
```

The interval restrictions have three exact roles:

- `tau<2` makes every denominator at least the prime-prefix alias scale;
- `tau>4/3` keeps the major width below `Z/log Z` and makes complete-pair variance
  dominate the lower-sensor variance at the square-root floor;
- `tau>tau_CB` makes the complete-pair load exceed Li's central-band threshold.

Controlling sources:

- `research/finite-prefix-crt/SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_V1.md`;
- `research/finite-prefix-crt/SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_ADDENDUM_CENTRAL_BAND.md`.

Status:

```text
MATERIAL FULL THEOREM CANDIDATE /
CENTRAL-BAND GAP FOUND AND REPAIRED /
STRONGEST CURRENT GFF RATE /
NOT INDEPENDENTLY REVIEWED.
```

## Method-class power barrier

The file

`research/finite-prefix-crt/SAMPLED_CORE_DEFECT_EXPANSION_POWER_BARRIER_V1.md`

isolates a conditional square-root barrier.  In any proof which simultaneously
uses:

1. small-parameter kernel damping linear in `q`;
2. independent absolute-value row compression;
3. a common bounded-energy core;
4. explicit enumeration of all core residue assignments;
5. a deterministic witness floor `Z^(1+o(1))`;

the effective row distance forces

```text
|S|>>log Z/q,
```

and explicit core enumeration forces

```text
q>=Z^(-1/2-o(1)).
```

This is not a lower bound for GFF.  It says that improving reciprocal dispersion
or the witness floor may reduce the logarithmic factor, but cannot cross the power
`1/2` while the five architectural hypotheses remain.

For a population mean `(log Z)^(-b)` and witness floor `Z/(log Z)^a`, the concrete
balance is

```text
q^2Z>>(log Z)^(a+b+2).
```

The current values `a=3`, `b=2` give the exponent `7` on the logarithm.

## Mechanism ledger

### Shifted code and product fibres

- `research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`;
- `research/finite-prefix-crt/PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md`.

Retained mechanisms:

1. arbitrary-shift cyclic separation;
2. one-fibre partition bounds;
3. decoded product-fibre compression;
4. multiplicity-sensitive cyclic energy;
5. weighted retained-skeleton inequalities.

### Prefix-compatible Fourier transfer

- `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`;
- `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md`.

Retained mechanisms:

1. exact prefix Fourier identity;
2. no-wrap congruence-to-exact transfer;
3. high-denominator square-load control;
4. target tuning and complement-symmetry interface.

### Sparse actual-prime sensing

- `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_V1.md`;
- `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_ADDENDUM_ROW_ADAPTIVE.md`;
- `ONE_ANCHOR_RECIPROCAL_LABEL_SENSOR_V1.md`.

Retained mechanisms:

1. one common actual-prime sample for many CRT rows;
2. row-adaptive sharp sensor loads;
3. reciprocal-label interval sensing;
4. simultaneous CRT and outer-label sampling.

### Load--distance theory

- `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_V1.md`;
- `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_IRREGULAR.md`;
- `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_PREFIX_BOUNDED.md`.

Every prefix-bounded irregular rowwise design satisfies the recorded reciprocal
and square-load lower bounds.  The square-root route does not contradict them: its
sensor core grows as `1/q`, exactly paying for the weak small-parameter kernel.

### Sparse Gibbs history

- `SPARSE_GIBBS_ANCHOR_AND_CRITICAL_SCALE_V1.md`;
- `SPARSE_GIBBS_ANCHOR_AUDIT_ADDENDUM_01.md`;
- `SPARSE_BLOCK_ENTROPY_VARIANCE_BARRIER_V1.md`.

These remain reusable general theorem candidates, but are no longer load-bearing
in the strongest original-theorem or GFF routes.

## Quantitative route hierarchy

```text
O(1/log p_N)                         global-control route
O(1/(log p_N)^2)                     two-anchor route
p_N^(-2/9) polylog                   critical-scale sparse-Gibbs route
p_N^(-1/4)(log p_N)^(5/4)            one-anchor sparse-Gibbs route
p_N^(-1/2)(log p_N)^(7/2)            small-theta complete-pair defect route
```

Each line is an argument-level theorem candidate unless separately marked as
accepted by PDL or independent audit.  The last line is the strongest and newest.

## Current classification

- released Erdős 306 theorem: `UNCHANGED / FORMAL AUTHORITY`;
- audited complete-pair multiblock proof: `PASS-WITH-BOUNDED-REPAIRS / ASSURED FALLBACK`;
- sparse-synchronization original proof: `MATERIAL STRICTER ROUTE CANDIDATE`;
- cyclic/product-fibre suppression: `PROVED ARGUMENT`;
- sparse actual-prime sensing: `MATERIAL GENERAL THEOREM CANDIDATE`;
- decoder-defect expansion: `PROVED ARGUMENT`;
- sparse arithmetic synchronization: `ARGUMENT-LEVEL SOLUTION`;
- square-root GFF rate: `STRONGEST FULL THEOREM CANDIDATE / CENTRAL-BAND REPAIRED`;
- sampled-core power `1/2`: `CONDITIONAL METHOD-CLASS BARRIER / NOT PROBLEM OPTIMALITY`;
- literature/priority status: `INITIAL COMPARISON ONLY / NOVELTY NOT CERTIFIED`.

## Assurance and control disposition

Recommended flow for the original theorem:

```text
PDL sparse-synchronization route expansion
-> independent route audit
-> DIR comparison against assured multiblock fallback
-> only then manuscript or MATH-CUR intake.
```

Recommended flow for the GFF theorem:

```text
PDL exact small-theta reconstruction
-> verify the corrected Li central-band bridge
-> independent finite-prefix audit
-> only then theorem-status or publication decisions.
```

No current result authorizes manuscript, Curator, Lean, release, DOI, arXiv, or
canonical promotion.

## Next Research Lead frontier

1. adversarially audit the generalized reciprocal-label count, small-`theta`
   cumulants, and no-wrap/central-band ledger;
2. improve the logarithmic factor by strengthening top-scale reciprocal dispersion
   or the deterministic witness floor;
3. seek a genuinely non-enumerative synchronization, joint-decoding, or complex-
   cancellation route capable of crossing the sampled-core power `1/2` barrier;
4. investigate direct bipartite rigidity which might replace the remaining robust
   exact-cold witness theorem;
5. abstract decoder-defect expansion into a general Gibbs/code theorem;
6. find a second non-semiprime consumer;
7. receive only exact failed implications or structural obstructions from PDL.

Only a material theorem, correction/counterexample, or smallest exact revised gap
returns to issue #9.

The fuller historical source map remains available in the Git history of this file
at blob `7f801a51ec731b5446872b87c9151eff31c68881`.
