# E306-PAPER-01 — theorem dependency graph

## Governing principle

The article displays both the causal architecture of the concrete E306 proof and the reusable structures exposed by that architecture. Generality is introduced where it controls the proof and is not inflated beyond the work performed by the arithmetic providers.

## Standing native fixed-ratio data

```text
fixed reduced target t=a/b in (0,1), b squarefree
fixed eta in (0,1)
fixed gamma>1
Z=X^gamma
B={q prime: eta Z<=q<Z}
t < (log gamma)^2/2 < 1.
```

The fixed-ratio moments are

```text
|B|=(1-eta+o_eta(1)) Z/log Z,
V_B=sum_(q in B)1/q=(log(1/eta)+o_eta(1))/log Z,
W_B=sum_(q in B)1/q^2=(eta^(-1)-1+o_eta(1))/(Z log Z).
```

The proof is uniform for `eta` in compact subsets of `(0,1)`.  The endpoint `eta=eta(X)->1` is not part of the DAG.

## Four-layer analytic architecture

### Layer I — arithmetic capacity, centring and total variance

```text
fixed t, gamma and eta
 -> fixed-ratio prime supply with Z=X^gamma
 -> native anchor moments on [eta Z,Z)
 -> exact complete-pair load and square load
 -> target rows indexed by S_b and corrected tau(b)
 -> exact Bernoulli centring theta Lambda=t
 -> total actual-family variance
 -> exact finite Fourier coefficient.
```

The total variance is

```text
sigma_E^2
 ~ alpha_(t,gamma)(1-alpha_(t,gamma))
   {1/(2X^2 log^2 X)
    +(eta^(-1)-1)tau(b)/(Z log Z)}.
```

Its leading provider changes at `gamma=2`, but both contributions remain in the primary statement. The coefficient `1/2` is the exact unordered-pair identity and is unrelated to the former dyadic endpoint.

### Layer II — synchronization and information recovery

```text
fixed-ratio reciprocal dispersion on [delta Y,Y)
 -> nondominant forcing with delta-dependent constants
 -> exact anchor rigidity
 -> fingerprint entropy
 -> weighted anchor partition

multiplicity-sensitive cyclic energy
 + exact interval multiplicity 1+(1-eta)Z/r
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
T_0=kappa_0(t,gamma,eta,b) min(X^2,Z).
```

All `P`-coordinates are identified through `M_dec`; target coordinates are identified through `T_0`. Larger transition and adaptive ranges use prime coordinates only.

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

With `N=floor(C/sigma_E)`, every fixed `gamma>1` and fixed `eta in (0,1)` use one pairwise-disjoint exhaustive partition:

```text
I    |m| <= N
     -> total-variance Taylor major and positive real contribution

II   N < |m| <= T_0
     -> total-variance Gaussian tail

III  T_0 < |m| <= X^2/4
     -> prime-only complete-pair Gaussian transition

IV   X^2/4 < |m| <= M_dec
     -> adaptive retained-pair damping on an interval contained in [X,eta Z)

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

The cutoff `X^2/4` is a small-phase convenience and not anchor-ratio data.

## Formal analytic DAG

```text
PNT fixed-ratio prime supply
 |\
 | -> A0 native anchor moments M_B,V_B,W_B
 |       |\
 |       | -> A2 target-row load and eta-dependent square load over S_b
 |       |       \
 |       |        -> A3 total load, exact centring and no-wrap capacity
 |       |
 |       -> E1 fixed-ratio reciprocal dispersion and anchor rigidity
 |               -> E2 fingerprint entropy and weighted anchor partition
 |
 -> A1 exact complete-pair load and square load
          \
           -> A3

A1 + A2 + exact centring
 -> V1 total actual-family variance
 -> F1 exact Fourier coefficient

G1 complete-family collision theorem
 -> A1 exact pair identities

C1 multiplicity-sensitive cyclic energy
 + native interval multiplicity
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

## Exactness and characterization branch

```text
positive quotient coefficient
 -> quotient realization
 -> deterministic no-wrap
 -> avoiding fixed-target theorem for every fixed eta in (0,1)

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

## Quantitative branch

```text
retained exact target coefficient
 + native fixed-ratio total variance
 + universal six-sector budget
 -> quantitative coefficient lower bound
 -> sharp fixed-target asymptotic
 -> explicit gamma>2 and 1<gamma<=2 coefficient forms,
    the latter containing (eta^(-1)-1)tau(b)
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

The diversity exponents use `zeta` notation; `eta` is reserved globally for the anchor ratio.

## Protected proof statements

The manuscript retains explicitly:

- fixed reduced targets, fixed `gamma>1` and fixed `eta in (0,1)` quantifiers;
- `Z=X^gamma`, the sharp admissible region and native `B=[eta Z,Z)`;
- prime-divisor indexing by `S_b` and corrected `tau(b)`;
- the complete-pair load with its structural factor `1/2`;
- the native fixed-ratio prime count, reciprocal mass and inverse-square mass;
- the total variance and all three explicit regimes;
- reciprocal dispersion with an `eta`-dependent finite threshold and the zero-exception conclusion;
- the multiplicity-sensitive cyclic-energy provider;
- the unnormalized global fibre error;
- the exact denominator-factor partition;
- prime-coordinate decoding through `M_dec` and target-coordinate decoding through `T_0`;
- adaptive retained-prime intervals below `eta Z`;
- the universal six-sector partition;
- the aggregate Taylor remainder and parameter order `C -> X`;
- the strict no-wrap interval and direct fixed-target exactness;
- prime-dilution characterization without numerator induction or special denominators;
- zero-residual finite prescription;
- the distinction between local replacement and simultaneous globally proper replacement;
- transportation-based common refinement;
- sharp coefficient, entropy, diversity, height, proper-refinement branching and global transfer.

## Excluded distortions

The article must not:

- reintroduce an append-only fixed-ratio proposition or normalize the proof at `eta=1/2`;
- conflate the native fixed-ratio theorem with a shrinking-width/thin-anchor result;
- import reciprocal-flow machinery into the present proof;
- alter the structural unordered-pair coefficient `1/2`;
- normalize by decoder weights when zero weights are possible;
- demand target-coordinate identification beyond `T_0`;
- discard retained factors during fibre compression;
- omit the cyclic-energy provider;
- split the live proof into separate five- and six-sector architectures;
- restore avoiding-unit, numerator-induction or special-denominator closure as the current route;
- conflate local replacement with global properness;
- infer a universal restricted-denominator theorem from the present application.

## Audit boundary

The native reparameterization is PC-005 in `PROOF_CHANGE_LEDGER.md`. It is a writer result and requires a separate independent whole-article mathematical and naturalness audit. PR `#9` remains open, draft and unmerged; no refreeze, readiness, merge, tag, release, DOI, licence, arXiv or journal action is authorized.
