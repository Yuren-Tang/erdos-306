# E306-PAPER-01 — article architecture and editorial control

## Status

`M7 / NATIVE FIXED-RATIO WHOLE-ARTICLE REPARAMETERIZATION WRITER SUCCESSOR / INDEPENDENT AUDIT PENDING / OWNER HOLD`

This document records the maintained architecture of the article. The exact current branch head is recorded in controlling issue `#8`, draft PR `#9`, and the latest durable return; no commit attempts to contain its own hash.

## Article identity

Title:

**Reciprocal Sums of Distinct Squarefree Semiprimes**

The article has no subtitle. Its headline result remains unchanged:

> A positive rational number is a finite sum of reciprocals of distinct integers, each the product of two distinct primes, if and only if its reduced denominator is squarefree; moreover, every prescribed finite set of denominators may be avoided.

The theorem was first obtained in the author's archived Lean 4 formalization, release `0.0.3`. The present article grew out of that formal work and refines the same Fourier-analytic lineage into a one-anchor proof for ordinary mathematical reading. The archived code does not formalize the present exposition line by line.

## Current mathematical package

The direct article fixes

```text
t=a/b in (0,1), with b squarefree,
eta in (0,1),
gamma>1,
Z=X^gamma,
lambda_gamma=(log gamma)^2/2,
t<lambda_gamma<1,
alpha_(t,gamma)=2t/(log gamma)^2.
```

The native anchor block is

```text
B={q prime: eta Z<=q<Z}.
```

The fixed-ratio prime moments are

```text
|B|=(1-eta+o_eta(1)) Z/log Z,
sum_(q in B)1/q=(log(1/eta)+o_eta(1))/log Z,
sum_(q in B)1/q^2=(eta^(-1)-1+o_eta(1))/(Z log Z).
```

Target rows are indexed by the prime-divisor set `S_b`, and

```text
tau(b)=sum_(r in S_b) 1/r^2.
```

The total actual-family variance is

```text
sigma_E^2
 ~ alpha_(t,gamma)(1-alpha_(t,gamma))
   {1/(2X^2 log^2 X)
    +(eta^(-1)-1)tau(b)/(Z log Z)}.
```

The leading variance provider changes at `gamma=2`, but the proof architecture does not. With

```text
T_0=kappa_0 min(X^2,Z),
```

one pairwise-disjoint exhaustive six-sector partition applies for every fixed `gamma>1` and fixed `eta in (0,1)`. The lower-prime row distance is supplied explicitly by the multiplicity-sensitive cyclic-energy lemma. The adaptive retained-prime interval lies below `eta Z` for all sufficiently large `X`.

All fixed-ratio constants may depend on the fixed `eta`; the argument is uniform when `eta` ranges in a compact subset of `(0,1)`. A varying ratio `eta=eta(X)->1`, shrinking terminal width, thin-anchor exponent theorem and reciprocal-flow machinery are not part of this article.

The analytic branch proves direct fixed-target exactness. The full squarefree-denominator characterization then follows by prime dilution. The elementary post-analytic branch includes zero-residual finite prescription, disjoint realization, common refinement and countably infinite proper refinement. The quantitative branch includes the sharp total-variance coefficient, explicit regime corollaries with the native target-row constant, entropy optimization, exact-cardinality extraction, diversity, balanced relations, height bounds, globally proper refinement branching and global transfer with leading rate `2 log 2`.

## Governing order

The article follows the causal cycle

```text
squarefree-denominator problem and fixed reduced target
 -> native fixed-ratio anchor data eta
 -> finite Fourier selection
 -> general structural tools
 -> parameterized squarefree-semiprime denominator system
 -> exact pair and eta-dependent target-row loads, centring and total variance
 -> fixed-ratio anchor synchronization and weighted partition
 -> cyclic-energy row separation, fibre decoding and target observability
 -> retained decoded skeleton and universal six-sector elimination
 -> positive total-variance major and strict terminal budget
 -> quotient realization and no-wrap fixed-target exact equality
 -> prime-dilution characterization
 -> finite prescription, disjoint realization and refinement hierarchy
 -> sharp coefficient, entropy, diversity, height and global transfer
 -> discussion and conclusion.
```

The structural factor `1/2` in the complete-pair identity, the centred CRT half-interval, the `X^2/4` small-phase cutoff and the entropy threshold at `1/2` are unrelated to the former dyadic anchor endpoint and remain unchanged.

## Manuscript source architecture

`main.tex` inputs eleven Architecture-E wrappers:

```text
sections/arch_e_01_introduction.tex
sections/arch_e_02_composition_interface.tex
sections/arch_e_03_reciprocal_system.tex
sections/arch_e_04_one_anchor.tex
sections/arch_e_05_rows_fibres.tex
sections/arch_e_06_decoded_tail.tex
sections/arch_e_07_actual_well.tex
sections/arch_e_08_positive_realization.tex
sections/arch_e_09_characterization.tex
sections/arch_e_10_saturation_quantitative.tex
sections/arch_e_11_scope.tex
```

The wrappers transport the following provider files:

```text
01_introduction.tex
02_fourier_selection.tex
03_structural_tools.tex
04_denominator_system.tex
05_anchor_block.tex
06_fibre_decoding.tex
07_decoded_skeleton.tex
08_major_budget.tex
09_exact_completion.tex
10_quantitative_multiplicity_part1.tex
10_quantitative_multiplicity_part2.tex
11_discussion_conclusion.tex
```

The rejected append-only file `04a_fixed_ratio_anchor.tex` is absent. Bibliography processing uses `biblatex` with Biber.

## Eleven-section plan

1. **Introduction and main results:** headline characterization; fixed target, fixed exponent and native fixed anchor ratio; total variance; six-sector architecture; coefficient and quantitative consequences.
2. **Composition interface:** finite Fourier semantics; admissible observation/compression provider; exact realization interfaces.
3. **Reciprocal-semiprime system:** prime supply; complete pair family; native anchor block; target rows; load, modulus, exact centring and total variance; exact factor partition.
4. **One anchor and rigidity:** fixed-ratio reciprocal code on `[delta Y,Y)`; low-energy exact label; fingerprint entropy; weighted anchor partition.
5. **Rows, observability and fibres:** multiplicity-sensitive cyclic energy; lower-prime and target-row distance; unnormalized weighted fibre compression; prime and target coordinate identification.
6. **Decoded tail:** prime-only transition; adaptive retained pairs below `eta Z`; pairwise-disjoint exhaustive six sectors; coherent and terminal tails.
7. **Actual local well:** Taylor expansion; exact phase cancellation; total-variance Gaussian major; strict budget in the order `C -> X`.
8. **Positive coefficient and realization:** quotient positivity; rational congruence; deterministic no-wrap.
9. **Characterization and refinement:** prime dilution; finite prescription; disjoint realization; transportation; local versus globally proper replacement; infinite chains.
10. **Compact saturation and quantitative consequences:** sharp fixed-target coefficient with native target-row constant; compact moving targets on one fixed family; entropy, diversity, height and transfer.
11. **Scope and boundaries:** fixed `eta`; compact-uniform dependence; explicit exclusion of shrinking-width/thin-anchor and reciprocal-flow extensions.

## Theorem and dependency hierarchy

### General structural results

- `G1` complete-family collision theorem;
- `G2` exact weighted product-fibre compression;
- `G3` finite-group syndrome separation;
- `G4` decoded-skeleton positivity;
- `G5` quotient coefficient and exactness interfaces.

### E306 analytic providers

- `A1` fixed-ratio prime supply and exact complete-pair identities;
- `A2` native anchor moments, target-row loads indexed by `S_b`, Bernoulli centring and total variance;
- `A3` fixed-ratio anchor-block rigidity and weighted partition;
- `A4` multiplicity-sensitive cyclic energy and lower-prime row distance;
- `A5` target-row distance and observability;
- `A6` prime-coordinate identification through `M_dec` and target-coordinate identification through `T_0`;
- `A7` prime-only transition and adaptive retained-pair damping below `eta Z`;
- `A8` total-variance Taylor major;
- `A9` universal exhaustive six-sector strict budget.

### Exactness and representation structure

- `R1` positive quotient coefficient and no-wrap direct fixed-target equality;
- `R2` squarefree-denominator obstruction and prime-dilution characterization;
- `R3` zero-residual finite prescription and finite extension;
- `R4` disjoint realization of finite decompositions;
- `R5` local replacement, simultaneous proper replacement and common refinement;
- `R6` countably infinite proper refinement chains.

### Quantitative branch

- `Q1` quantitative coefficient lower bound;
- `Q2` sharp fixed-target coefficient with total native fixed-ratio variance;
- `Q3` exponential multiplicity;
- `Q4` entropy-optimal mesoscopic cardinality window and exact optimization;
- `Q5` exact-cardinality extraction and macroscopic diversity;
- `Q6` balanced signed reciprocal relations;
- `Q7` denominator-height bounds and globally proper refinement branching;
- `Q8` global quantitative transfer with leading rate `2 log 2`.

## Parameter order

The article preserves

```text
fix reduced t=a/b, squarefree b,
fix admissible gamma>1, eta in (0,1), and finite forbidden data
 -> fix structural constants depending only on the fixed data
 -> choose terminal Gaussian cutoff C
 -> choose X sufficiently large depending on the fixed data and C
 -> set Z=X^gamma and construct the finite family.
```

No estimate chooses `C` after `X` or hides dependence on `X` or the later cutoff `C` in a fixed constant.

## Change and audit boundary

The native whole-article reparameterization is recorded as PC-005 in `PROOF_CHANGE_LEDGER.md`. It is a writer result, not a self-certified theorem adoption. It requires exact-head workflow validation and a separate independent whole-article mathematical and naturalness audit.

The historical fixed-`Z=X^3`, five-sector candidate and its publication gate remain nontransferable. The append-only fixed-ratio absorption at `b64bac1f9426cbeb60090a6dbdc147c5e67386ac` was architecturally rejected and is retained only as the authorized starting head for the native rewrite.

No ready-for-review, merge, tag, release, DOI, Zenodo, licence, arXiv or journal action is implied by this architecture record.
