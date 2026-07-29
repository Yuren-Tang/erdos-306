# E306-PAPER-01 — theorem dependency graph

## Governing principle

The article displays both the causal architecture of the concrete E306 proof and the reusable structures exposed by that architecture.  Generality is introduced where it controls the proof and is not inflated beyond the work performed by the arithmetic providers.

## Four-layer analytic architecture

### Layer I — arithmetic capacity and selection model

```text
complete-family mass
 -> complete-pair reciprocal capacity
 -> auxiliary target-sensitive rows
 -> Bernoulli centring
 -> exact finite Fourier coefficient.
```

Purpose: construct a denominator system with enough reciprocal mass, a squarefree CRT period, controlled variance, target sensitivity and no-wrap room.

General structures:

- complete-family mass from power sums;
- finite-valued subset-sum Fourier coefficients;
- quotient coefficient versus ambient exact equality.

### Layer II — synchronization and information recovery

```text
anchor-block reciprocal rigidity
 -> coherent integer label or energetic anchor assignment
 -> weighted anchor partition

row syndrome separation
 -> shift-uniform row tails
 -> sector-dependent decoder identification
 -> target-coordinate observability.
```

Purpose: recover one low-dimensional global integer label from a high-dimensional CRT assignment while retaining every target direction needed by the major and Gaussian ranges.

General structures:

- finite-group syndrome distance;
- hidden-coordinate observability;
- nearest-codeword concentration.

### Layer III — weighted fibre compression

```text
anchor weights + row kernels + retained residual factors
 -> exact tensorized off-decoder mass
 -> decoded-skeleton reduction.
```

Principal exact inequality:

```text
|E_fib|
 <= sum_y W_y {
      product_r(alpha_(r,y)+beta_(r,y))
      - product_r alpha_(r,y)
    }.
```

Purpose: compress the product fibre without multiplying by raw anchor cardinality and without discarding the lower--lower factors needed for adaptive damping.

### Layer IV — coherent-skeleton frequency elimination

```text
small labels
 -> Taylor major and positive real contribution

intermediate labels
 -> full-variance Gaussian tail

adaptive labels
 -> retained lower--lower complete-pair damping

large coherent labels
 -> anchor-block Gaussian tail

noncoherent / nondecoder states
 -> anchor and fibre error budgets.
```

Then:

```text
strict C -> X budget
 -> positive quotient Fourier coefficient
 -> no-wrap exact equality
 -> avoiding unit representation
 -> numerator and small-denominator closure
 -> squarefree-denominator characterization.
```

## Formal analytic DAG

```text
G1  Complete-family collision theorem
 |\
 | -> A1  complete-pair load and variance
 |       -> A2  Bernoulli parameter and no-wrap capacity
 |              -> F1 exact Fourier coefficient
 |
G2  Exact weighted product-fibre compression
 |
G3  Finite-group syndrome separation
 |\
 | -> E2 fixed target-row observability
 |
E1  anchor-block rigidity and weighted partition
 |
E3  lower-row cyclic separation
 |
E4  sector-dependent decoder identification
 |
E5  exact denominator-factor partition
 |\
 | -> G2 specialization -> E6 decoded-skeleton reduction
 |
E7  retained skeleton damping
E8  actual-family Taylor major
 |
E9  disjoint exhaustive frequency sectors
 |
A2 + F1 + E1--E9
 -> S1 specialized decoded-skeleton positivity
 -> positive coefficient
 -> no-wrap
 -> avoiding unit representation
 -> headline characterization.
```

`S1` is used for the specialized positivity node so that `P1` remains available for the established weighted anchor-partition notation.

## Exactness, extension and refinement branch

```text
positive coefficient
 -> quotient realization
 -> deterministic no-wrap
 -> avoiding unit representation
 -> numerator induction
 -> explicit denominator 2 closure
 -> explicit denominator 1 closure
 -> squarefree-denominator characterization
 -> finite extension principle
 -> disjoint realization of finite decompositions
 -> common refinement of two representations
 -> common refinement of every finite family
 -> iterated proper refinement.
```

The row--column common-refinement step uses a squarefree common denominator and a nonnegative integer transportation matrix.  Disjoint realization is supplied by successive finite avoidance; no new analytic estimate enters this branch.

## Quantitative branch

```text
retained exact target coefficient
 -> quantitative coefficient lower bound
 -> sharp fixed-target asymptotic
 -> exponential multiplicity
 -> entropy-optimal mesoscopic cardinality window
 -> exact-cardinality extraction
 -> Hamming-separated macroscopic diversity
 -> balanced signed reciprocal relations
 -> denominator-height conversion
 -> quantitative refinement branching
 -> fixed-residual transfer to every admissible rational.
```

Balanced signed relations are obtained by subtracting two equal-cardinality separated representations.  Their controlled non-minimality disclaimer remains part of the mathematical boundary.

## Article order controlled by the DAG

1. Introduction.
2. Finite Fourier selection and exactness.
3. Structural tools.
4. The semiprime denominator system.
5. The anchor block.
6. Fibre decoding and target observability.
7. The decoded skeleton and its minor ranges.
8. The major contribution and terminal budget.
9. Exact representation, extension and refinement.
10. Quantitative multiplicity, diversity and transfer.
11. Discussion and conclusion.

## Non-negotiable range structure

The decoder bridge remains sector-dependent:

```text
major:              |m| <= C/sigma_E
Gaussian:           C/sigma_E < |m| <= X^2/4
adaptive:           X^2/4 < |m| <= M_dec
large coherent:     |m| > M_dec.
```

- all `P`-coordinates are identified through `M_dec`: the `B`-coordinates are fixed by the coherent anchor label and the `P\B` coordinates are supplied by row decoding;
- coordinates dividing `b` are decoded only where needed, through `X^2/4`;
- adaptive damping uses retained lower--lower factors and does not require complete target-coordinate identification;
- no-wrap is applied only after quotient positivity.

## Protected proof statements

The manuscript retains explicitly:

- `s>=16` in the reciprocal-rigidity input;
- the zero-exception conclusion;
- the complete-pair load with its factor `1/2`;
- the direct fixed-`r|b` row argument;
- the unnormalized product-fibre error;
- the exact denominator-factor partition;
- sector-dependent decoder ranges;
- squarefree target observability;
- the aggregate Taylor remainder;
- parameter order `C -> X`;
- the strict no-wrap interval;
- avoiding-set numerator induction;
- the transportation proof of common refinement;
- the exact-cardinality and Hamming-packing route to balanced relations.

## Excluded distortions

The article must not:

- present the terminal triangle-inequality budget as deeper than its providers;
- hide weighted normalization inside prose;
- normalize by decoder weights when zero weights are possible;
- demand globally uniform decoder identification beyond the proved sector ranges;
- discard retained factors during fibre compression;
- demote the difficult E306 providers to a nominal corollary;
- restore multiblock propagation or sibling-reservoir machinery;
- infer a universal restricted-denominator theorem from the present application;
- overstate the balanced signed relations as minimal or as resolving neighbouring gap problems.

## Current control

The exact branch head and exact-head validation are recorded in issue `#8`, draft PR `#9`, and the latest durable return.  The manuscript remains on Owner hold and PR `#9` remains draft.
