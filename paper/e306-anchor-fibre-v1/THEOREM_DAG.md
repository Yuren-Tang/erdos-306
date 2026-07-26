# E306-PAPER-01 — theorem dependency graph

## Governing principle

The article should display both:

1. the causal architecture of the concrete E306 proof; and
2. the reusable mathematical structures naturally exposed by that architecture.

Generality is introduced at the point where it controls the proof, not postponed as an unrelated afterthought and not inflated beyond the work performed by the arithmetic providers.

## Four-layer proof architecture

### Layer I — arithmetic capacity and selection model

```text
complete-family mass
  -> complete-pair reciprocal capacity
  -> auxiliary target-sensitive rows
  -> Bernoulli centering
  -> exact finite Fourier coefficient
```

Purpose: construct a candidate denominator system with enough reciprocal mass, a squarefree CRT period, controlled variance, target sensitivity, and no-wrap room.

General structures:

- complete-family mass from power sums;
- independent finite-valued subset-sum Fourier coefficients;
- quotient coefficient versus ambient exact equality.

### Layer II — information recovery and synchronization

```text
top-block reciprocal rigidity
  -> coherent integer label or energetic anchor
  -> weighted top partition

row syndrome separation
  -> shift-uniform row tails
  -> sector-dependent decoder identification
  -> target-coordinate observability
```

Purpose: recover a low-dimensional global integer label from a high-dimensional CRT assignment.

General structures:

- finite-group syndrome distance;
- hidden-coordinate observability;
- nearest-codeword concentration.

### Layer III — weighted fibre compression

```text
anchor weights + row kernels + retained residual factors
  -> exact tensorized off-decoder mass
  -> decoded-skeleton reduction
```

Principal exact inequality:

```text
|E_fib|
 <= sum_y W_y {
      product_r(alpha_(r,y)+beta_(r,y))
      - product_r alpha_(r,y)
    }.
```

Purpose: compress the product fibre without multiplying by raw anchor cardinality and without discarding factors needed for later damping.

### Layer IV — coherent-skeleton frequency elimination

```text
small labels
  -> Taylor major and positive real contribution

intermediate labels
  -> full-variance Gaussian tail

adaptive labels
  -> retained lower-lower complete-pair damping

large coherent labels
  -> top-anchor Gaussian tail

noncoherent / nondecoder states
  -> anchor and fibre error budgets
```

Then:

```text
strict C -> X budget
  -> positive quotient Fourier coefficient
  -> no-wrap exact equality
  -> avoiding unit theorem
  -> numerator induction
  -> Erdős 306 characterization
```

## Formal theorem DAG

```text
G1  Complete-family collision theorem
 |\
 | -> A1  complete-pair load and variance
 |       -> A2  Bernoulli parameter and no-wrap capacity
 |              -> F1 exact Fourier coefficient
 |
G2  Weighted product-fibre compression
 |
G3  Finite-group syndrome separation
 |\
 | -> E2 fixed target-row observability
 |
E1  top-anchor rigidity and weighted partition
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
E9  disjoint exhaustive frequency lanes
 |
A2 + F1 + E1--E9
 -> P1 specialized decoded-skeleton positivity
 -> positive coefficient
 -> no-wrap
 -> avoiding unit representation
 -> headline theorem
```

## Article order controlled by this DAG

1. Introduction and architecture.
2. Finite Fourier selection model.
3. General structural tools:
   - complete-family mass;
   - weighted product-fibre compression;
   - finite-group syndrome separation;
   - specialized decoded-skeleton positivity.
4. E306 denominator system and arithmetic capacity.
5. Top-anchor rigidity and weighted partition.
6. Fibre separation, observability, and decoder identification.
7. Decoded skeleton and residual damping.
8. Taylor major, terminal budget, no-wrap, and closure.
9. Scope, limitations, and genuine mechanism upgrades.

## Non-negotiable range structure

The decoder bridge must remain lane-dependent:

```text
major:              |m| <= C/sigma_E
Gaussian:           C/sigma_E < |m| <= X^2/4
adaptive:           X^2/4 < |m| <= M_dec
large coherent:     |m| > M_dec
```

- all `P`-coordinates decode through `M_dec`;
- coordinates dividing `b` decode only where needed, through `X^2/4`;
- adaptive damping uses retained lower-lower factors and does not require complete target-coordinate identification;
- no-wrap is applied after quotient positivity.

## Excluded distortions

The article must not:

- present the final triangle-inequality budget as deeper than its providers;
- hide weighted normalization inside prose;
- normalize by decoder weights when zero weights are possible;
- demand globally uniform decoder identification beyond the audited sector ranges;
- move all general mathematics to an unrelated final appendix;
- demote the difficult E306 providers to a nominal two-line corollary;
- restore multiblock propagation or sibling-reservoir machinery.
