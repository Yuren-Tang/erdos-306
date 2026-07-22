# Literature positioning for product-code / Peierls transfer

**Programme:** `E306-RL-FPCRT-02`  
**Role:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Status:** `INITIAL LITERATURE COMPARISON / NOVELTY NOT CLAIMED`  
**Date:** 2026-07-22

This note records an initial mechanism-level comparison for
`PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md` and
`PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_V1.md`.

It is not a priority or novelty certification.  The search is intentionally
conservative: familiar atomic ingredients are classified as standard or near
standard, and only combinations for which no direct match was located are kept
as possible original contributions.

## 1. Closest neighbouring literatures

### 1.1 Code and lattice smoothing / flatness

The closest broad neighbour is the smoothing or flatness literature for codes
and lattices.  In that setting noise is reduced modulo a code or lattice and one
asks when the resulting quotient distribution is close to uniform.  A modern
systematic reference is:

- T. Debris-Alazard, L. Ducas, N. Resch, J.-P. Tillich,
  *Smoothing Codes and Lattices: Systematic Study and New Bounds*, IEEE Trans.
  Inform. Theory 69 (2023), 6006--6027, arXiv:2205.10552.

That work explicitly treats Gaussian and Bernoulli noise, Fourier bounds,
triangle-inequality, Parseval/Cauchy--Schwarz, linear-programming estimates, and
minimum-distance information.

The relationship is close but not identical.

- Standard smoothing is a **wide-noise / flat-quotient** statement.
- The present local fibre lemma is a **narrow-kernel / unique-decoded-spike**
  statement: under an arbitrary translation, at most one code point has low
  energy and the entire complement has small `L^1` mass.

Thus the local theorem is better described as a shifted finite-code packing or
decoding estimate than as a new smoothing theorem.  Its proof by the metric
triangle inequality is elementary and should not be advertised as a standalone
novel contribution.

The nonstandard feature is the way many such local decoded spikes are assembled
into a product-fibre skeleton while external quotient coordinates remain
arbitrary.

### 1.2 Small-bias spaces

Naor--Naor small-bias spaces construct small probability spaces whose every
parity test is nearly unbiased:

- J. Naor, M. Naor, *Small-Bias Probability Spaces: Efficient Constructions and
  Applications*, SIAM J. Comput. 22 (1993), 838--856.

This is Fourier control of every individual nontrivial Boolean character and is
the natural comparison for the earlier sparse sensor design.

It does not directly subsume the present dense-reservoir theorem.  The required
quantity here is not one Fourier coefficient but an arbitrary-shift partition
sum over an entire CRT fibre, together with identification of one decoded
frequency and an `L^1` bound for all siblings.  Small bias and decoded-fibre
compression are therefore related design goals but different interfaces.

### 1.3 Weighted Bernoulli local limit theorems

Weighted Bernoulli sums and their characteristic functions have an established
local-limit literature.  A directly relevant arithmetic reference is:

- R. Giuliano, M. Weber, *Local Limit Theorems in some Random Models from Number
  Theory*, Stochastic Analysis and Applications 34 (2016), 941--960,
  arXiv:1502.05939.

That paper uses the characteristic-function method for weighted Bernoulli sums
arising in number theory and stresses that ordinary local-limit formulations can
be too weak for arithmetic progression events.

The present architecture should be viewed as a specialized local-limit
mechanism.  Its possible added value is not the one-dimensional Gaussian
analysis itself, but the prior reduction

```text
large CRT dual product
    -> arbitrary-shift fibre compression
    -> quotient Peierls localization
    -> decoded one-dimensional skeleton.
```

A systematic comparison with strong lattice local-limit and aperiodicity
criteria remains necessary before any novelty claim.

### 1.4 Random subset sums in finite abelian groups

Recent work studies when a random small subset of a finite abelian group has all
of the group as its subset-sum set, for example:

- J. Ma, Q. Tang, *An Erdős problem on random subset sums in finite abelian
  groups*, arXiv:2602.05768.

Classical deterministic subset-sum cardinality results in finite abelian groups
form another neighbouring area.

These works concern coverage thresholds or cardinality growth of subset-sum
sets.  They do not, at the level located in this initial search, provide the
specific conditional product-fibre compression or arithmetic common-reservoir
construction used here.

### 1.5 Modular inverses in intervals

There is an extensive analytic-number-theory literature on distribution of
modular inverses, including:

- S. M. Gonek, G. S. Krishnaswami, V. L. Sondhi,
  *The distribution of inverses modulo a prime in short intervals*, Acta Arith.
  102 (2002), 315--322;
- M. Z. Garaev, I. E. Shparlinski,
  *On the distribution of modular inverses from short intervals*, Mathematika
  69 (2023), 1183--1209, arXiv:2304.07953.

Those papers study discrepancy, moments, gaps, or exponential sums for inverse
sequences.  The prime-block sensor theorem asks a different, weaker but highly
uniform quantity:

\[
 \min_{d\ne0}\sum_{s\in\mathcal S_Y}
 \left\|\frac{d s^{-1}}r\right\|^2.
\]

Its proof needs no cancellation or full equidistribution.  PNT abundance plus a
Brun--Titchmarsh upper bound on residue multiplicity already force linear
energy.  No direct prior statement of the resulting load--distance optimality
was located in this initial search.

## 2. Conservative novelty classification

### Standard or near-standard ingredients

The following should not carry an independent novelty claim:

1. the metric midpoint threshold `D/4` for an arbitrarily shifted code;
2. exponential kernel bounds from squared distance;
3. tensorization over independent product coordinates;
4. shell summation of a level-set bound;
5. extraction of a factor `exp(-(c-c')F)` from a sector above an energy floor;
6. Gaussian Taylor analysis on the final one-dimensional frequency line.

Each is elementary or belongs to familiar coding, smoothing, Peierls, or local
limit technology.

### Potentially distinctive theorem interfaces

The initial search did not locate a direct match for the following combined
interfaces.

#### A. Shift-uniform decoded product-fibre compression

For arbitrary external phases, a very large direct-product fibre has total
absolute Fourier mass `1+o(1)`, and in a coherent sector all but one decoded
point have `o(1)` mass.  The decoded point varies with the quotient datum.

This is stronger and structurally different from bounding individual Fourier
characters or proving global flatness.

#### B. Arithmetic asymptotically free dimension elimination

One complete prime block, reused against all low prime moduli, gives:

- cyclic distance `Theta(Y/log Y)` uniformly for every `r<=sqrt(Y)`;
- reciprocal load `Theta(log log X/log Y)`;
- square load `Theta(1/(Y log Y))`.

The load tends to zero while the distance diverges.

#### C. Sharp common-reservoir load--distance trade-off

The universal averaging argument proves that every scale-`Y` common-column
reservoir must pay

\[
 \Lambda\gg\frac{H_1(\mathcal R)}Y D_*,
 \qquad
 W_2\gg\frac{H_2(\mathcal R)}{Y^2}D_*.
\]

The prime block attains both bounds up to constants.  This sharp formulation is
the cleanest self-contained theorem presently extracted from the project.

#### D. Product-code / Peierls local-limit transfer

Local metric codes eliminate the product fibre; quotient entropy plus a growing
energy floor eliminates the incoherent quotient sector; only a low-dimensional
coherent skeleton requires oscillatory or Gaussian analysis.

The architecture may be reusable even if every atomic lemma is standard.

## 3. Recommended terminology

To avoid overstating the relationship with code smoothing, use:

- **shifted finite-code packing bound** for the one-fibre lemma;
- **decoded product-fibre compression** for its tensorized form;
- **entropy--floor transfer** for the quantitative Peierls lemma;
- **arithmetic common-reservoir sensing** for the prime-block realization;
- **product-code / Peierls local-limit transfer** for the combined architecture.

Use “smoothing/flatness” only as neighbouring literature, not as the primary name
of the local spike theorem.

## 4. Publication-value assessment

At present the abstract metric and Peierls lemmas alone are too elementary for a
standalone paper.

A potentially publishable independent unit would need at least:

1. the sharp prime-block load--distance theorem;
2. a genuinely general product-fibre transfer theorem stated for finite abelian
   extensions or a class of arithmetic factor graphs;
3. one non-semiprime consumer, or a systematic optimality/counterexample theory
   beyond the complete bipartite model;
4. a deeper literature comparison confirming that the common-reservoir theorem
   and decoded-skeleton interface are not already standard under another name.

The GFF application itself, if the candidate chain survives PDL and independent
review, is already a substantive consumer.  But it should not be used to conceal
which abstract ingredients are elementary.

## 5. Next exploratory questions

1. Can the common-column lower bound be extended to irregular bipartite graphs,
   with degree-weighted distances and a matching sparse construction?
2. Is there a multiscale design that beats the single-scale reciprocal load for
   the same worst-modulus energy?
3. Can a second arithmetic or probabilistic local-limit problem be reduced by
   decoded product-fibre compression?
4. Is the decoded skeleton stable under weak interactions between fibre
   coordinates, replacing exact tensorization by a cluster or Dobrushin-type
   condition?
5. Can sparse deterministic columns attain the same load--distance point while
   satisfying a finite-prefix placement constraint?

No claim of bibliographic completeness, priority, or publication readiness is
made.  No Lean, proof-development, corpus, manuscript, review, release, DOI, or
publication status changes through this note.
