# Arithmetic Bernoulli local limits and the heat-kernel mechanism

**Programme:** `E306-RL-FPCRT-02`  
**Research unit:** `E306-RL-FPCRT-02-LLT-01`  
**Status:** `GENERAL MECHANISM / PROVED REDUCTION / EXACT PROVIDER FRONTIER`  
**Date:** 2026-07-23  
**Authority:** research only; no released, proof-development, review, manuscript, Curator, Lean, DOI, arXiv, or submission status changes

## 1. Purpose

The existing E306 and finite-prefix arguments are written as finite Fourier positivity
proofs on a CRT group.  Their common probabilistic content is simpler:

> choose a random subset of denominators, scale by the common lcm, and ask for the
> probability that the resulting integer-valued random sum hits its exact mean.

Thus the complete construction is an arithmetic local limit theorem at the mean.  The
major arc is the ordinary Gaussian part of a local central limit theorem.  Every anchor,
fibre, exact-cold, fingerprint, observability, and reciprocal-label estimate is a provider
for the lattice-smoothing or high-frequency part.

This note proves the exact reduction and a general mean-point local-limit criterion.  It
also isolates a spectral-dimension formulation which is the natural mechanism-level
replacement for route-specific shell bookkeeping.

## 2. Exact random-sum recoding

Let `E` be a finite family of positive integers and let `L` be a common multiple of every
`e in E`.  For each `e`, let `xi_e` be an independent Bernoulli variable with parameter
`p_e in (0,1)`.  Put

```text
A_e=L/e,
S=sum_(e in E) A_e xi_e.
```

Then `S` is integer valued.  For a rational target `tau` with `L tau in Z`,

```text
Pr(S=L tau)
```

is exactly the total product-measure weight of subsets `A subset E` satisfying

```text
sum_(e in A)1/e=tau.
```

The mean and variance are

```text
mu=E S=L sum_e p_e/e,
B^2=Var(S)=L^2 sigma^2,
sigma^2=sum_e p_e(1-p_e)/e^2.
```

Consequently, if the probabilities are chosen so that

```text
sum_e p_e/e=tau,
```

then the representation problem is precisely

```text
Pr(S=mu)>0.
```

For the one-anchor E306 family, `tau=1/b`; for the finite-prefix GFF problem, `tau=q`.

### No-wrap

If

```text
Lambda=sum_e1/e<1,
```

then every possible reciprocal subset sum lies in `[0,1)`.  Equivalently,

```text
0<=S<L.
```

Hence a congruence `S congruent L tau mod L` is automatically the exact integer equality
`S=L tau`.  The integer local-limit formulation itself targets the exact equality and does
not require a separate alias step, but the no-wrap statement explains the equivalence with
the finite cyclic Fourier formula.

## 3. Fourier and arithmetic heat energy

Write

```text
phi(t)=E exp(2 pi i t(S-mu)),   -1/2<=t<=1/2.
```

Then

```text
Pr(S=mu)=integral_(-1/2)^(1/2) phi(t) dt.
```

For one Bernoulli summand,

```text
|1-p+p exp(2 pi i x)|
 <=exp(-8p(1-p)||x||^2),
```

where `||x||` is distance to the nearest integer.  Therefore

```text
|phi(t)|<=exp(-8 Q(t)),
Q(t)=sum_e p_e(1-p_e)||A_e t||^2.
```

The function `Q` is the arithmetic heat energy.  It is the Dirichlet spectrum of the
inhomogeneous Bernoulli walk with generators `A_e`.

The finite cyclic formulation has the corresponding discrete energy

```text
Q_L(h)=sum_e p_e(1-p_e)||h/e||^2,
h mod L,
```

because `A_e h/L=h/e`.

Thus all existing CRT energy estimates are estimates on the heat spectrum of one
integer-valued random walk.

## 4. Mean-point local-limit criterion

Let

```text
M=max_e A_e,
T_3=sum_e E|A_e(xi_e-p_e)|^3.
```

### Theorem 4.1 — Gaussian major plus heat-trace minor implies a local limit

Consider a sequence of such systems.  Assume

```text
B->infinity,
M/B->0,
T_3/B^3->0.
```

For `C>=1`, define

```text
H_C
 =B integral_(C/B<=|t|<=1/2) exp(-8Q(t)) dt.
```

If

```text
lim_(C->infinity) limsup H_C=0,
```

then

```text
B Pr(S=mu)->1/sqrt(2 pi).
```

In particular `Pr(S=mu)>0` for all sufficiently large systems.

#### Proof

On `|t|<=C/B`, the maximal phase tends to zero because `M/B->0`.  The logarithm of
the characteristic function has the uniform expansion

```text
log phi(t)=-2 pi^2 B^2 t^2+O(T_3|t|^3).
```

The normalized cubic error is `o_C(1)`.  After the change of variable `u=Bt`, the
major integral converges to

```text
1/B integral_R exp(-2 pi^2 u^2)du
 =1/(sqrt(2 pi)B).
```

The part outside `C/B` is at most `H_C/B` by the Bernoulli heat bound.  First let the
system grow and then let `C` grow.  `square`

### Interpretation

The theorem separates the proof into exactly two mechanisms:

1. **infinitesimal Gaussian transport:** no summand is large compared with the standard
   deviation and the cubic cumulant is negligible;
2. **strong arithmetic smoothing:** the high-frequency heat trace is `o(1/B)`.

The first mechanism is routine in every current E306 route.  The second is the entire CRT
rigidity problem.

## 5. Discrete cyclic form

Under no-wrap one also has the exact finite formula

```text
Pr(S=mu)
 =1/L sum_(h mod L)
   exp(-2 pi i h mu/L)
   product_e(1-p_e+p_e exp(2 pi i h/e)).
```

Since `B=L sigma`, the expected point-mass scale is

```text
1/B=1/(L sigma).
```

The major frequencies contain `asymp1/sigma` residues, while the outer factor `1/L`
returns the local-limit scale.

### Theorem 5.1 — discrete heat-trace criterion

Suppose a coherent major set `M_L` has positive real contribution

```text
Re sum_(h in M_L)F(h)>=(c+o(1))/sigma
```

and the complement satisfies

```text
sum_(h notin M_L)|F(h)|=o(1/sigma).
```

Then

```text
Pr(S=mu)>0.
```

If the major Taylor expansion is Gaussian with a growing window and the complement is
`o(1/sigma)`, then the same local-limit asymptotic as in Theorem 4.1 follows.

This is the finite-group form already abstracted by the anchor--fibre transference theorem.

## 6. Spectral-dimension formulation

For the discrete energy put

```text
N(R)=#{h mod L:Q_L(h)<=R}.
```

Layer-cake summation gives

```text
sum_(h mod L)exp(-cQ_L(h))
 =integral_0^infinity c exp(-cR)N(R)dR.
```

The coherent Gaussian branch has the one-dimensional count

```text
N_coh(R) asymp sqrt(R)/sigma.
```

This motivates the following provider.

### Definition 6.1 — spectral dimension one with a transverse remainder

A family has arithmetic spectral dimension one if

```text
N(R)
 <=C(1+sqrt(R))/sigma + E(R)
```

and

```text
sigma integral_0^infinity exp(-cR)E(R)dR=o(1)
```

for the relevant Bernoulli exponent `c`.

### Proposition 6.2

Spectral dimension one, together with the major Taylor expansion and a strict separation
between the short coherent labels and the transverse remainder, implies the discrete
heat-trace criterion of Theorem 5.1.

#### Proof

Insert the sublevel estimate into layer cake.  The coherent term gives the one-dimensional
Gaussian normalization `O(1/sigma)`.  The transverse Laplace transform is `o(1/sigma)`.
The strict major/minor constant budget then gives positivity.  `square`

### Meaning for the existing proof families

- exact-cold rigidity identifies the low-energy one-dimensional branch;
- fingerprint entropy bounds the transverse sublevel remainder;
- weighted fibre compression is a nonlinear spectral elimination;
- decoder-defect expansion is a retained-energy heat-trace expansion;
- positive-measure slicing is the physical-space version of eliminating a smoothing
  factor without replacing the residual by an arbitrary bounded function.

The route-specific parameters are therefore implementations of one spectral-dimension or
local-limit provider.

## 7. Classical local-limit comparison

The conceptual precedent is classical.

- Yu. A. Rozanov, *On a Local Limit Theorem for Lattice Distributions*, Theory of
  Probability and Its Applications 2 (1957), 260--265,
  DOI `10.1137/1102018`, separates normal convergence from strong lattice
  aperiodicity.
- A. B. Mukhin, *Local Limit Theorems for Lattice Random Variables*, Theory of
  Probability and Its Applications 36 (1992), 698--713,
  DOI `10.1137/1136086`, develops structural characteristics based on
  `E||dX^*||^2`, the same circle-distance energy appearing here.
- R. Giuliano and M. Weber, *Local Limit Theorems in some Random Models from Number
  Theory*, arXiv:`1502.05939`, emphasizes that weighted Bernoulli sums arising in
  number theory require nontrivial characteristic-function control.
- Z. Szewczak and M. Weber, *Classical and Almost Sure Local Limit Theorems*,
  arXiv:`2208.02700`, surveys Rozanov, Mukhin, Bernoulli-part extraction, and the
  remaining difficulty of general necessary-and-sufficient LLT criteria.

These sources provide the correct conceptual category, but they do not automatically close
E306.  Our weights, common lcm, and relevant modular resonances all change with the scale.
A fixed-modulus aperiodicity statement is insufficient; the proof needs a quantitative
high-frequency profile uniform up to growing prime moduli.

Thus the E306 CRT work is not an accidental reinvention of probability theory.  It is an
explicit verification of a particularly hostile triangular-array local limit theorem.

## 8. Exact mechanism frontier

The strongest possible replacement for parameter-by-parameter bookkeeping is now:

```text
ARITHMETIC LOCAL-LIMIT THEOREM FOR THE CRT BERNOULLI ARRAY

Gaussian infinitesimality
+ quantitative growing-modulus aperiodicity
+ one-dimensional coherent spectral branch
=> exact mean-point positivity.
```

In physical space this is joint terminal-block slice mixing while preserving the short
integer label.  In Fourier space it is spectral dimension one for the CRT heat kernel.
In sheaf/code language it is a cosystolic expansion theorem with one low-dimensional
coherent mode.

These are three formulations of the same missing mechanism.

## 9. Honest classification

Established in this note:

```text
EXACT RANDOM-SUM RECODING — PROVED
MEAN-POINT HEAT-TRACE LOCAL-LIMIT CRITERION — PROVED
DISCRETE SPECTRAL-DIMENSION CRITERION — PROVED
CURRENT CRT ROUTES IDENTIFIED AS PROVIDERS — STRUCTURAL MAP
```

Not proved here:

```text
A QUANTITATIVE GROWING-MODULUS LLT FOR THE FULL E306 ARRAY.
```

That missing theorem is strictly more valuable than another terminal parameter optimization.
It would replace the present proof architecture rather than merely improve a logarithm.