# E306-PAPER-01 — article architecture and editorial control

## Status

`M7 / RECOVERED SOURCE INTEGRATED / COMPARATIVE AUDIT BOUNDED RESTORATION / BR-01--BR-03 REPAIR / OWNER HOLD`

This document records the maintained architecture of the article. The exact current branch head is recorded in controlling issue `#8`, draft PR `#9`, and the latest durable return; no commit attempts to contain its own hash.

## Article identity

Title:

**Reciprocal Sums of Distinct Squarefree Semiprimes**

The article has no subtitle. Its headline result is the squarefree-denominator characterization with finite avoidance:

> A positive rational number is a finite sum of reciprocals of distinct integers, each the product of two distinct primes, if and only if its reduced denominator is squarefree; moreover, every prescribed finite set of denominators may be avoided.

The theorem was first obtained in the author's archived Lean 4 formalization, release `0.0.3`. The present article grew out of that formal work and refines the same Fourier-analytic lineage into a substantially simpler one-anchor proof for ordinary mathematical reading. The archived code does not formalize the present exposition line by line.

## Current mathematical package

The verified manuscript fixes a reduced target

```text
t=a/b in (0,1), with b squarefree,
```

a fixed exponent `gamma>1`, and

```text
Z=X^gamma,
lambda_gamma=(log gamma)^2/2,
t<lambda_gamma<1,
alpha_(t,gamma)=2t/(log gamma)^2.
```

Target rows are indexed by the prime-divisor set `S_b`, and

```text
tau(b)=sum_(r in S_b) 1/r^2.
```

The total actual-family variance is

```text
sigma_E^2
 ~ alpha_(t,gamma)(1-alpha_(t,gamma))
   {1/(2X^2 log^2 X) + tau(b)/(Z log Z)}.
```

The leading variance provider changes at `gamma=2`, but the proof architecture does not. With

```text
T_0=kappa_0 min(X^2,Z),
```

one pairwise-disjoint exhaustive six-sector partition applies for every fixed `gamma>1`. The lower-prime row distance is supplied explicitly by the multiplicity-sensitive cyclic-energy lemma.

The analytic branch proves direct fixed-target exactness. The full squarefree-denominator characterization then follows by prime dilution, not by an avoiding-unit theorem, numerator induction, or separate treatment of reduced denominators `1` and `2`.

The elementary post-analytic branch includes zero-residual finite prescription, disjoint realization, common refinement, and countably infinite proper refinement. It distinguishes local one-block replacement, which need not be globally proper, from simultaneous replacement of every block, which is globally proper.

The quantitative branch includes the sharp total-variance coefficient, its explicit regime corollaries, entropy optimization, exact-cardinality extraction, macroscopic diversity, balanced signed relations, denominator-height bounds, globally proper refinement branching, and global transfer with leading rate `2 log 2`.

## Governing order

The article follows the causal cycle

```text
squarefree-denominator problem and fixed reduced target
 -> finite Fourier selection
 -> general structural tools
 -> parameterized squarefree-semiprime denominator system
 -> exact pair and target-row loads, centring and total variance
 -> anchor-block synchronization and weighted partition
 -> cyclic-energy row separation, fibre decoding and target observability
 -> retained decoded skeleton and universal six-sector elimination
 -> positive total-variance major and strict terminal budget
 -> quotient realization and no-wrap fixed-target exact equality
 -> prime-dilution characterization
 -> finite prescription, disjoint realization and refinement hierarchy
 -> sharp coefficient, entropy, diversity, height and global transfer
 -> discussion and conclusion.
```

Generality appears where it controls the proof. No provider layer is omitted from the maintained architecture.

## Normalized manuscript source tree

```text
manuscript/
├── BUILD.md
├── Makefile
├── main.tex
├── references.bib
└── sections/
    ├── 01_introduction.tex
    ├── 02_fourier_selection.tex
    ├── 03_structural_tools.tex
    ├── 04_denominator_system.tex
    ├── 05_anchor_block.tex
    ├── 06_fibre_decoding.tex
    ├── 07_decoded_skeleton.tex
    ├── 08_major_budget.tex
    ├── 09_exact_completion.tex
    ├── 10_quantitative_multiplicity.tex
    └── 11_discussion_conclusion.tex
```

`main.tex` inputs these eleven files once each and in this order. Bibliography processing uses `biblatex` with Biber.

## Eleven-section plan

### 1. Introduction

- headline characterization and finite avoidance;
- fixed-target and fixed-exponent analytic theorem;
- total-variance and universal six-sector architecture;
- historical and literature context;
- external input, terminology, parameter order and roadmap.

### 2. Finite Fourier selection and exactness

- character orthogonality;
- reciprocal subset sums;
- quotient realization versus ambient equality;
- injective-support, fundamental-domain and measurable-alias interfaces;
- Chinese-remainder coordinates.

E306 uses deterministic no-wrap only after positivity.

### 3. Structural tools

- complete-family collision theorem;
- exact weighted product-fibre compression;
- finite-group syndrome separation;
- decoded-skeleton positivity.

The unnormalized compression statement retains zero weights, empty coordinate sets, nonunique decoders and complex residual factors.

### 4. The parameterized semiprime denominator system

- fixed reduced target `t=a/b`, squarefree `b`, fixed `gamma>1`, and `Z=X^gamma`;
- prime supply, complete pair family and target rows indexed by `S_b`;
- reciprocal load, exact Bernoulli centring and admissible region;
- complete pair and target-row square loads;
- one total actual-family variance and its three explicit regime corollaries;
- exact partition of every Fourier factor into anchor, row or retained-skeleton roles.

### 5. The anchor block

- reciprocal prime code;
- low energy forces one exact integer label;
- fingerprint counting above the forcing floor;
- application to the anchor block;
- weighted anchor partition and noncoherent tail.

### 6. Fibre decoding and target observability

- multiplicity-sensitive cyclic energy;
- uniform lower-prime row distance;
- target-row distance and observability;
- shift-uniform row tails and exact weighted fibre compression;
- prime-coordinate identification through `M_dec`;
- target-coordinate identification through `T_0=kappa_0 min(X^2,Z)`.

All prime coordinates are identified through `M_dec`: coordinates in the anchor block are fixed by the coherent anchor label and the remaining prime coordinates are supplied by row decoding. Target coordinates indexed by `S_b` are identified through `T_0`; larger transition and adaptive ranges use only prime coordinates.

### 7. The decoded skeleton and its universal minor ranges

- prime-only Gaussian transition from `T_0` to `X^2/4`;
- adaptive retained-pair damping from `X^2/4` to `M_dec`;
- one pairwise-disjoint exhaustive six-sector partition for every fixed `gamma>1`;
- separate accounting for noncoherent anchor assignments and nondecoder fibres.

Every factor not assigned to a row remains visible on the decoded skeleton.

### 8. The major contribution and terminal budget

- uniform local expansion;
- positive real major contribution;
- total-variance Gaussian tail;
- aggregate Taylor remainder;
- strict six-sector assembly in the order `C -> X`.

Complex major positivity remains distinct from absolute minor estimates.

### 9. Exact representation, extension and refinement

- positive quotient coefficient and deterministic no-wrap;
- direct avoiding fixed-target representation;
- squarefree-denominator obstruction and prime-dilution characterization;
- zero-residual finite prescription;
- disjoint realization of finite decompositions;
- local replacement versus simultaneous globally proper replacement;
- common refinements and countably infinite proper refinement chains.

### 10. Quantitative multiplicity, optimization and transfer

1. total-variance fixed-target coefficient and explicit regime corollaries;
2. entropy-optimal cardinality concentration;
3. exact-cardinality extraction, macroscopic diversity and balanced relations;
4. entropy optimization over admissible fixed `gamma`;
5. denominator-height conversion;
6. quantitative globally proper refinement branching;
7. global transfer to every admissible rational with leading rate `2 log 2`.

The balanced signed reciprocal relations are the additive consequence of the equal-cardinality macroscopically separated family. Their non-minimality disclaimer remains part of the controlled statement.

### 11. Discussion and conclusion

- what the proof preserves;
- bounded open directions;
- conclusion.

This section states the scope of the proved mechanisms without asserting a general black-box representation theorem.

## Theorem and dependency hierarchy

### General structural results

- `G1` complete-family collision theorem;
- `G2` exact weighted product-fibre compression;
- `G3` finite-group syndrome separation;
- `G4` decoded-skeleton positivity;
- `G5` quotient coefficient and exactness interfaces.

### E306 analytic providers

- `A1` fixed-ratio prime supply and exact complete-pair identities;
- `A2` target-row loads indexed by `S_b`, Bernoulli centring and total variance;
- `A3` anchor-block rigidity and weighted partition;
- `A4` multiplicity-sensitive cyclic energy and lower-prime row distance;
- `A5` target-row distance and observability;
- `A6` prime-coordinate identification through `M_dec` and target-coordinate identification through `T_0`;
- `A7` prime-only transition and adaptive retained-pair damping;
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
- `Q2` sharp total-variance fixed-target coefficient and explicit regime forms;
- `Q3` exponential multiplicity;
- `Q4` entropy-optimal mesoscopic cardinality window and exact optimization;
- `Q5` exact-cardinality extraction and macroscopic diversity;
- `Q6` balanced signed reciprocal relations;
- `Q7` denominator-height bounds and globally proper refinement branching;
- `Q8` global quantitative transfer with leading rate `2 log 2`.

The final TeX numbering may differ, but this dependency order is controlling.

## Parameter order

The article preserves

```text
fix reduced t=a/b, squarefree b, fixed admissible gamma>1 and finite forbidden data
 -> fix structural constants depending only on the fixed data
 -> choose terminal Gaussian cutoff C
 -> choose X sufficiently large depending on the fixed data and C
 -> set Z=X^gamma and construct the finite family.
```

No estimate chooses `C` after `X` or hides dependence on `X` or the later cutoff `C` in a fixed constant.

## Historical architecture boundary

The refrozen candidate `79a43178bdc4919677375362ef58b9c127da18b0` used the earlier fixed-`Z=X^3`, five-sector and numerator-induction presentation. Its 44-page technical publication gate belongs only to that historical exact head. It does not transfer to the later parameterized manuscript or to the recovered-source integration and bounded repair successor.

## Current control

- repository: `Yuren-Tang/erdos-306`;
- controlling issue: `#8`;
- sole branch: `paper/e306-anchor-fibre-v1`;
- draft PR: `#9`;
- historical parameterized baseline: `544d42d510bcab3ad0ddd7855525770e0d4b0926`;
- recovered-source integration checkpoint: `c2dfc5120eec017718ef07cbe43f9c151803769c`;
- exact-head build at that checkpoint: 42 pages;
- exact-head workflows: `verify-e306-manuscript` run `30608129577` and `verify-erdos-306` run `30608129625`, both successful;
- comparative audit: `#issuecomment-5141204793`, disposition `[BOUNDED-RESTORATION E306-MANUSCRIPT-COMPARATIVE-VALUE-ARCHITECTURE-AUDIT-02]`;
- bounded repair successor: exact head recorded in PR `#9` and the latest durable return;
- lifecycle: narrow independent exact-diff re-check required before readiness;
- refreeze: none for the recovered integration or repair successor;
- publication gate: none transferred.

No ready-for-review, merge, tag, release, DOI, Zenodo, licence, arXiv or journal action is implied by this architecture record.
