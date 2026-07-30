# E306-PAPER-01 — theorem dependency graph

## Governing principle

The article displays both the causal architecture of the concrete E306 proof and the reusable structures exposed by that architecture. Generality is introduced where it controls the proof and is not inflated beyond the work performed by the arithmetic providers.

## Four-layer analytic architecture

### Layer I — arithmetic capacity, centring and total variance

```text
fixed reduced target t=a/b and fixed gamma>1
 -> fixed-ratio prime supply with Z=X^gamma
 -> exact complete-pair load and square load
 -> target rows indexed by S_b and corrected tau(b)
 -> exact Bernoulli centring theta Lambda=t
 -> total actual-family variance
 -> exact finite Fourier coefficient.
```

Purpose: construct a denominator system with enough reciprocal mass, a squarefree CRT period, controlled total variance, target sensitivity and no-wrap room throughout the sharp region

```text
t < (log gamma)^2/2 < 1.
```

The total variance is

```text
sigma_E^2
 ~ alpha_(t,gamma)(1-alpha_(t,gamma))
   {1/(2X^2 log^2 X) + tau(b)/(Z log Z)}.
```

Its leading provider changes at `gamma=2`, but both contributions remain in the primary statement.

### Layer II — synchronization and information recovery

```text
anchor-block reciprocal rigidity
 -> coherent integer label or energetic anchor assignment
 -> weighted anchor partition

multiplicity-sensitive cyclic energy
 -> lower-prime row distance

target-row distance on S_b
 -> target-coordinate observability

row distances + shift-uniform tails
 -> exact fibre decoder
 -> prime-coordinate identification through M_dec
 -> target-coordinate identification through T_0.
```

Here

```text
T_0=kappa_0 min(X^2,Z).
```

Purpose: recover one low-dimensional global integer label from a high-dimensional CRT assignment while retaining every target direction needed by the major and total-variance Gaussian ranges. Larger transition and adaptive ranges use prime coordinates only.

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

### Layer IV — universal six-sector elimination

With `N=floor(C/sigma_E)`, every fixed `gamma>1` uses one pairwise-disjoint exhaustive partition:

```text
I    |m| <= N
     -> total-variance Taylor major and positive real contribution

II   N < |m| <= T_0
     -> total-variance Gaussian tail

III  T_0 < |m| <= X^2/4
     -> prime-only complete-pair Gaussian transition

IV   X^2/4 < |m| <= M_dec
     -> adaptive retained-pair damping

V    |m| > M_dec
     -> internal anchor energy

VI   noncoherent decoded or any nondecoder state
     -> anchor entropy and fibre error.
```

Then:

```text
strict C -> X six-sector budget
 -> positive quotient Fourier coefficient
 -> deterministic no-wrap
 -> direct fixed-target exact equality
 -> squarefree-denominator characterization by prime dilution.
```

## Formal analytic DAG

```text
PNT  fixed-ratio prime supply
 |\
 | -> A1 exact complete-pair load and square load
 |       \
 |        -> A3 total load and no-wrap capacity
 |
 | -> A2 target-row load and square load over S_b
          -> A3

A1 + A2 + exact centring
 -> V1 total actual-family variance
 -> F1 exact Fourier coefficient

G1 complete-family collision theorem
 -> A1 exact pair identities

E1 anchor-block rigidity
 -> E2 weighted anchor partition

C1 multiplicity-sensitive cyclic energy
 -> E3 lower-prime row distance

E4 target-row distance on S_b

E3 + E4
 -> E5 shift-uniform row tails
 -> E6 coordinate identification:
       all P-coordinates through M_dec,
       target coordinates through T_0

G2 exact weighted product-fibre compression
 + E2 + E5 + exact denominator-factor partition
 -> E7 decoded-skeleton reduction

V1 + E6 + E7
 -> E8 total-variance Taylor major
 -> E9 universal six-sector exhaustion and minor bounds

F1 + E2--E9
 -> S1 specialized decoded-skeleton positivity
 -> positive quotient coefficient
 -> no-wrap direct fixed-target equality.
```

`S1` remains the specialized positivity node so that `P1` remains available for the established weighted anchor-partition notation.

## Exactness and characterization branch

```text
positive quotient coefficient
 -> quotient realization
 -> deterministic no-wrap
 -> avoiding fixed-target theorem for reduced t=a/b in (0,1)

squarefree least-common-multiple obstruction
 + direct fixed-target theorem
 + prime dilution by one auxiliary prime
 + successive finite avoidance
 -> squarefree-denominator characterization
   with no numerator induction and no special cases b=1,2.
```

The numerator of the fixed target introduces no new decoder direction. Prime dilution moves an arbitrary admissible positive rational to a reduced target in `(0,1)` and sums pairwise-disjoint copies of that target.

## Finite prescription and refinement branch

```text
headline characterization with finite avoidance
 -> finite prescription:
      zero residual is already complete,
      positive residual is represented disjointly
 -> qualitative flexibility
 -> disjoint realization of finite decompositions

squarefree row--column transportation
 + disjoint realization
 -> common refinement of two representations
 -> common refinement of every finite family

local replacement of one block
 -> a refinement that need not be globally proper

simultaneous disjoint replacement of every block
 -> globally proper refinement
 -> countably infinite pairwise-disjoint proper refinement chain.
```

The row--column theorem is essential for aligning different decompositions. Local replacement alone does not supply a common refinement or global properness.

## Quantitative branch

```text
retained exact target coefficient
 + total actual-family variance
 + universal six-sector budget
 -> quantitative coefficient lower bound
 -> sharp fixed-target asymptotic
 -> explicit gamma>2 and 1<gamma<=2 coefficient forms
 -> exponential multiplicity
 -> entropy-optimal mesoscopic cardinality window
 -> exact entropy optimization over fixed admissible gamma
 -> exact-cardinality extraction
 -> Hamming-separated macroscopic diversity
 -> balanced signed reciprocal relations
 -> denominator-height conversion
 -> quantitative globally proper refinement branching
 -> global transfer with leading exponent 2 log 2.
```

Balanced signed relations are obtained by subtracting two equal-cardinality separated representations. Their controlled non-minimality disclaimer remains part of the mathematical boundary.

## Article order controlled by the DAG

1. Introduction.
2. Finite Fourier selection and exactness.
3. Structural tools.
4. The parameterized semiprime denominator system.
5. The anchor block.
6. Fibre decoding and target observability.
7. The decoded skeleton and its universal minor ranges.
8. The major contribution and terminal budget.
9. Exact representation, extension and refinement.
10. Quantitative multiplicity, optimization and transfer.
11. Discussion and conclusion.

## Non-negotiable range structure

The decoder and skeleton bridge is

```text
major:                 |m| <= N=floor(C/sigma_E)
total-variance tail:   N < |m| <= T_0
prime transition:      T_0 < |m| <= X^2/4
adaptive:              X^2/4 < |m| <= M_dec
large coherent:        |m| > M_dec
terminal error:         noncoherent decoded or nondecoder.
```

- all `P`-coordinates are identified through `M_dec`: the `B`-coordinates are fixed by the coherent anchor label and the `P\B` coordinates are supplied by row decoding;
- target coordinates indexed by `S_b` are identified through `T_0`;
- the transition and adaptive sectors use only prime coordinates;
- adaptive damping uses retained lower--lower factors;
- no-wrap is applied only after quotient positivity.

## Protected proof statements

The manuscript retains explicitly:

- fixed reduced targets and fixed `gamma>1` quantifiers;
- `Z=X^gamma` and the sharp admissible region;
- prime-divisor indexing by `S_b` and corrected `tau(b)`;
- the complete-pair load with its factor `1/2`;
- the total variance and all three explicit regimes;
- `s>=16` in the reciprocal-rigidity input and the zero-exception conclusion;
- the multiplicity-sensitive cyclic-energy provider;
- the unnormalized global fibre error;
- the exact denominator-factor partition;
- prime-coordinate decoding through `M_dec` and target-coordinate decoding through `T_0`;
- the universal six-sector partition;
- the aggregate Taylor remainder and parameter order `C -> X`;
- the strict no-wrap interval and direct fixed-target exactness;
- prime-dilution characterization without numerator induction or special denominators;
- zero-residual finite prescription;
- the distinction between local replacement and simultaneous globally proper replacement;
- transportation-based common refinement;
- sharp coefficient, entropy, diversity, height, proper-refinement branching and global transfer.

## Historical dependency boundary

The fixed-`Z=X^3`, five-sector, avoiding-unit and numerator-induction chain belongs to the historical candidate `79a43178bdc4919677375362ef58b9c127da18b0`. It is not the live dependency graph. The former 44-page technical publication gate at that exact head is nontransferable.

## Excluded distortions

The article must not:

- present the terminal triangle-inequality budget as deeper than its providers;
- hide weighted normalization inside prose;
- normalize by decoder weights when zero weights are possible;
- demand target-coordinate identification beyond `T_0`;
- discard retained factors during fibre compression;
- omit the cyclic-energy provider;
- split the live proof into separate five- and six-sector architectures;
- restore avoiding-unit, numerator-induction or special-denominator closure as the current route;
- conflate local replacement with global properness;
- demote the difficult E306 providers to a nominal corollary;
- infer a universal restricted-denominator theorem from the present application;
- overstate the balanced signed relations as minimal or as resolving neighbouring gap problems.

## Current control

The verified manuscript baseline is `544d42d510bcab3ad0ddd7855525770e0d4b0926`. The exact synchronized branch head and its validation are recorded in issue `#8`, draft PR `#9`, and the latest durable return. The synchronized head remains pending independent control-surface verification and Owner disposition; it is not refrozen and inherits no earlier publication gate.
