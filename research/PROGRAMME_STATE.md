# Erdős 306 Research Lead programme state

**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**State date:** 2026-07-23  
**Workspace:** `Yuren-Tang/erdos-306:research/e306-frontier-v1`  
**Immutable base:** `4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Writes:** `research/**` only  
**Downstream rule:** exact SHA checkpoints only

## Authority boundary

The released authority remains

`Yuren-Tang/erdos-306:v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`.

The complete-pair multiblock paper-first route has passed independent audit with
bounded local repairs and is the assured ordinary-mathematics fallback.  Every
shorter original-theorem route and every GFF result below remains an unreviewed
research candidate.  This branch is not a proof-development, manuscript, Curator,
review, Lean, release, DOI, arXiv, or submission surface.

## Strongest original-theorem route

The proposed sparse-synchronization proof DAG is

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

It removes the load-bearing use of

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

Controlling sources:

- `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_01.md`;
- `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_02.md`;
- `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_MAJOR_ARC_AND_TERMINAL_BUDGET.md`;
- `research/paper-first-one-anchor/SPARSE_TOP_SYNCHRONIZATION_CORE_V1.md`;
- `research/paper-first-one-anchor/SPARSE_ARITHMETIC_SYNCHRONIZATION_CLUSTER_EXPANSION_V1.md`;
- `research/paper-first-one-anchor/CURRENT_STATE_2026-07-22_WEIGHTED_FIBRE.md`.

Status:

```text
MATERIAL STRICTER ROUTE CANDIDATE /
SPARSE ARITHMETIC SYNCHRONIZATION SOLVED AT ARGUMENT LEVEL /
NOT INDEPENDENTLY REVIEWED.
```

## Strongest GFF / finite-prefix route

At prime prefix `Z=p_N`, put

```text
Y=Z^(1/tau),
P={p prime:Y<=p<=Z},
E_pair={pq:p,q in P,p<q}.
```

Use the entire complete-pair family as reciprocal mass, variance reservoir, and
witness system.  For a grid target `q`, take

```text
theta=q/Lambda
```

and one target-adaptive actual-prime top core

```text
S subset (Z/2,Z],
|S|=O((log Z)^3/q).
```

The core supplies all CRT row tests and all reciprocal-label tests.  Its explicit
entropy is

```text
O((log Z)^4/q),
```

while decoder-defect synchronization supplies weighted witness damping

```text
qZ/(log Z)^3.
```

Thus the current balance is

```text
q^2Z>>(log Z)^7,
```

and the candidate rate is

```text
gamma_N << p_N^(-1/2)(log p_N)^(7/2).
```

### Correct power interval

The obsolete alias-derived restriction `tau<2` is withdrawn.  Direct no-wrap uses
only `Lambda<1`.

The lower-band argument closes throughout

```text
4/3<tau<=4.
```

- `tau>4/3` keeps the major width below `Z/log Z` and makes complete-pair variance
  dominate lower-sensor variance;
- `tau<=4` makes the smallest-denominator phase and aggregate cubic remainder
  tend to zero at the square-root floor;
- `lambda_tau=(log tau)^2/2<1` throughout this interval.

For the full GFF consequence, let Li's central threshold be

```text
gamma_*=0.181...,
tau_CB=exp(sqrt(2 gamma_*)) approximately 1.825.
```

Choose

```text
tau_CB<tau<=4,
gamma_*<q_*<lambda_tau.
```

Then the lower band overlaps Li's central band.  `tau=2` already works;
`tau=4` also remains inside all Taylor, variance, load, and no-wrap constraints.

### Full reciprocal-label range

The top-block population theorem now holds uniformly for

```text
Z/log Z<=|m|<=cZ^2/log Z,
x in {0,1},
```

with mean energy `>>1/(log Z)^2`.  The proof counts bad integers in reciprocal
intervals and obtains

```text
O(delta Z+|m|/Z+1),
delta asymp1/log Z.
```

This covers the full synchronized label range

```text
O(Z^(3/2)/(log Z)^(1/2)).
```

The same target-adaptive sample therefore controls all prime CRT rows and the
entire coherent outer-label lane.  Sample availability itself persists down to
`q>>=(log Z)^4/Z`; the present square-root obstruction is synchronization entropy,
not reciprocal-label supply.

Controlling sources:

- `research/finite-prefix-crt/SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_V1.md`;
- `research/finite-prefix-crt/SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_ADDENDUM_CENTRAL_BAND.md`;
- `research/finite-prefix-crt/SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_ADDENDUM_NO_WRAP_INTERVAL.md`;
- `research/finite-prefix-crt/RECIPROCAL_LABEL_POPULATION_FULL_RANGE_V1.md`.

Status:

```text
MATERIAL FULL THEOREM CANDIDATE /
CENTRAL-BAND GAP REPAIRED /
NO-WRAP INTERVAL STRENGTHENED /
OUTER-LABEL ENDPOINT CLOSED /
STRONGEST CURRENT GFF RATE /
NOT INDEPENDENTLY REVIEWED.
```

## Conditional square-root method barrier

`research/finite-prefix-crt/SAMPLED_CORE_DEFECT_EXPANSION_POWER_BARRIER_V1.md`

proves a method-class statement, not a problem lower bound.  If a proof uses all
of

1. kernel damping linear in small `q`;
2. independent absolute-value row compression;
3. one common bounded-energy core;
4. explicit enumeration of all core assignments;
5. a deterministic witness floor `Z^(1+o(1))`,

then effective row distance forces

```text
|S|>>log Z/q,
```

and the implemented entropy-versus-floor balance forces

```text
q>=Z^(-1/2-o(1)).
```

For population mean `(log Z)^(-b)` and witness floor `Z/(log Z)^a`, the concrete
balance is

```text
q^2Z>>(log Z)^(a+b+2).
```

The current values `a=3`, `b=2` give the logarithmic exponent `7`.  Better
reciprocal dispersion or witness rigidity may improve the logs, but crossing the
power `1/2` requires non-enumerative synchronization, joint decoding, adaptive
sensors, or complex cancellation.

## Durable mechanism ledger

### Shifted codes and product fibres

- `research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md`;
- `research/finite-prefix-crt/PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md`.

Retained: arbitrary-shift cyclic separation, one-fibre partition bounds, decoded
product-fibre compression, multiplicity-sensitive cyclic energy, and weighted
retained-skeleton inequalities.

### Prefix Fourier transfer

- `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`;
- `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md`.

Retained: exact prefix Fourier identity, no-wrap exactness, square-load control,
target tuning, and complement symmetry.

### Sparse sensing and load--distance

- `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_V1.md`;
- `SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_ADDENDUM_ROW_ADAPTIVE.md`;
- `ONE_ANCHOR_RECIPROCAL_LABEL_SENSOR_V1.md`;
- `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_V1.md`;
- `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_IRREGULAR.md`;
- `PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_PREFIX_BOUNDED.md`.

Retained: common and row-adaptive actual-prime samples, reciprocal-label sensing,
and universal prefix-bounded reciprocal/square-load lower bounds.

### Sparse Gibbs history

- `SPARSE_GIBBS_ANCHOR_AND_CRITICAL_SCALE_V1.md`;
- `SPARSE_GIBBS_ANCHOR_AUDIT_ADDENDUM_01.md`;
- `SPARSE_BLOCK_ENTROPY_VARIANCE_BARRIER_V1.md`.

These remain reusable general theorem candidates but are no longer load-bearing in
the strongest original-theorem or GFF routes.

## Quantitative route hierarchy

```text
O(1/log p_N)                         global-control route
O(1/(log p_N)^2)                     two-anchor route
p_N^(-2/9) polylog                   critical-scale sparse-Gibbs route
p_N^(-1/4)(log p_N)^(5/4)            one-anchor sparse-Gibbs route
p_N^(-1/2)(log p_N)^(7/2)            small-theta complete-pair defect route
```

All are argument-level candidates unless separately accepted by PDL or independent
audit.

## Current classification

- released Erdős 306 theorem: `UNCHANGED / FORMAL AUTHORITY`;
- audited complete-pair multiblock proof: `PASS-WITH-BOUNDED-REPAIRS / ASSURED FALLBACK`;
- sparse-synchronization original proof: `MATERIAL STRICTER ROUTE CANDIDATE`;
- decoder-defect expansion: `PROVED ARGUMENT`;
- sparse arithmetic synchronization: `ARGUMENT-LEVEL SOLUTION`;
- full-range reciprocal-label population: `PROVED ARGUMENT`;
- square-root GFF rate: `STRONGEST FULL THEOREM CANDIDATE / CORRECTED`;
- sampled-core power `1/2`: `CONDITIONAL METHOD-CLASS BARRIER`;
- literature/priority status: `INITIAL COMPARISON ONLY / NOVELTY NOT CERTIFIED`.

## Assurance and control disposition

Original theorem:

```text
PDL sparse-synchronization route expansion
-> independent route audit
-> DIR comparison against assured multiblock fallback
-> only then manuscript or MATH-CUR intake.
```

GFF theorem:

```text
PDL exact small-theta reconstruction
-> verify corrected Li central-band bridge
-> independent finite-prefix audit
-> only then theorem-status or publication decisions.
```

No current result authorizes manuscript, Curator, Lean, release, DOI, arXiv, or
canonical promotion.

## Next Research Lead frontier

1. adversarially audit the remaining small-`theta` defect-expansion and cumulant
   constants;
2. improve the logarithmic factor by strengthening top-scale reciprocal dispersion
   or the deterministic witness floor;
3. seek non-enumerative synchronization, joint decoding, or complex cancellation
   capable of crossing the sampled-core power `1/2` barrier;
4. investigate direct bipartite rigidity which might replace robust exact-cold
   witness rigidity;
5. abstract decoder-defect expansion into a general Gibbs/code theorem;
6. find a second non-semiprime consumer;
7. receive only exact failed implications or structural obstructions from PDL.

Only a material theorem, correction/counterexample, or smallest exact revised gap
returns to issue #9.

The fuller historical source map remains available in the Git history of this file
at blob `7f801a51ec731b5446872b87c9151eff31c68881`.
