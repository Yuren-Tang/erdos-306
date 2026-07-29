# E306-PAPER-01 — article architecture and editorial control

## Status

`M7 / GLOBAL EDITORIAL INTEGRATION COMPLETE / OWNER HOLD`

This document records the maintained architecture of the article.  The exact current branch head is recorded in controlling issue `#8`, draft PR `#9`, and the latest durable return; no commit attempts to contain its own hash.

## Article identity

Title:

**Reciprocal Sums of Distinct Squarefree Semiprimes**

The article has no subtitle.  Its headline result is the squarefree-denominator characterization with finite avoidance:

> A positive rational number is a finite sum of reciprocals of distinct integers, each the product of two distinct primes, if and only if its reduced denominator is squarefree; moreover, every prescribed finite set of denominators may be avoided.

The theorem was first obtained in the author's archived Lean 4 formalization, release `0.0.3`.  The present article grew out of that formal work and refines the same Fourier-analytic lineage into a substantially simpler one-anchor proof for ordinary mathematical reading.  The archived code does not formalize the present exposition line by line.

## Governing order

The article follows the causal cycle

```text
arithmetic characterization and target
 -> finite Fourier selection
 -> general structural tools
 -> concrete squarefree-semiprime denominator system
 -> anchor-block synchronization and weighted partition
 -> fibre decoding and target observability
 -> retained decoded skeleton and exhaustive minor sectors
 -> positive major and strict terminal budget
 -> quotient realization and no-wrap exact equality
 -> finite extension, disjoint realization and common refinement
 -> sharp coefficient, multiplicity, diversity and quantitative transfer
 -> discussion and conclusion.
```

Generality appears where it controls the proof.  The mathematical order of Sections 2--8 is retained without redesign.

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

`main.tex` inputs these eleven files once each and in this order.  Bibliography processing uses `biblatex` with Biber.

## Eleven-section plan

### 1. Introduction

- headline characterization and finite avoidance;
- historical and literature context;
- external input and proof architecture;
- the one-anchor construction;
- terminology, parameter order and organizational roadmap.

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

### 4. The semiprime denominator system

- prime blocks and the complete denominator family;
- target-sensitive rows;
- reciprocal load and Bernoulli centring;
- variance and squarefree CRT period;
- exact partition of every Fourier factor into anchor, row or retained-skeleton roles.

### 5. The anchor block

- reciprocal prime code;
- low energy forces one exact integer label;
- fingerprint counting above the forcing floor;
- application to the anchor block;
- weighted anchor partition and noncoherent tail.

### 6. Fibre decoding and target observability

- cyclic row distance;
- target-row observability;
- shift-uniform row tails;
- exact retained skeleton;
- identification of the decoded skeleton.

All prime coordinates are identified through the required range: coordinates in the anchor block are fixed by the coherent anchor label, while the remaining prime coordinates are supplied by row decoding.  Coordinates dividing the target denominator are decoded only through the range where they are needed.

### 7. The decoded skeleton and its minor ranges

- adaptive retained-pair damping;
- exhaustive five-sector partition;
- pointwise bounds on all minor skeleton ranges;
- separate accounting for noncoherent anchor assignments and nondecoder fibres.

Every factor not assigned to a row remains visible on the decoded skeleton.

### 8. The major contribution and terminal budget

- uniform local expansion;
- positive real major contribution;
- full-variance Gaussian tail;
- aggregate Taylor remainder;
- strict assembly in the order `C -> X`.

Complex major positivity remains distinct from absolute minor estimates.

### 9. Exact representation, extension and refinement

- quotient positivity and deterministic no-wrap;
- avoiding unit representation;
- numerator induction and the explicit denominator `1` and `2` closures;
- necessity and the strengthened characterization;
- finite extension and disjoint realization;
- common refinements and iterated proper refinement.

### 10. Quantitative multiplicity, diversity and transfer

1. fixed-target coefficient and multiplicity;
2. cardinality concentration, macroscopic diversity and balanced relations;
3. denominator height and quantitative refinement;
4. transfer to every admissible rational.

The balanced signed reciprocal relations are the additive consequence of the equal-cardinality macroscopically separated family.  Their non-minimality disclaimer remains part of the controlled statement.

### 11. Discussion and conclusion

- what the proof preserves;
- three bounded open directions;
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

- `A1` complete-pair load and variance;
- `A2` Bernoulli centring and no-wrap capacity;
- `A3` anchor-block rigidity and weighted partition;
- `A4` lower-prime row distance;
- `A5` target-row distance;
- `A6` sector-dependent decoder identification;
- `A7` retained complete-pair damping;
- `A8` actual-family Taylor major;
- `A9` exhaustive five-sector strict budget.

### Exactness and representation structure

- `R1` positive quotient coefficient and no-wrap equality;
- `R2` avoiding unit representation;
- `R3` numerator and small-denominator closure;
- `R4` squarefree-denominator characterization;
- `R5` finite extension and disjoint realization;
- `R6` common-refinement theorem and proper refinement chains.

### Quantitative branch

- `Q1` quantitative coefficient lower bound;
- `Q2` sharp fixed-target coefficient;
- `Q3` exponential multiplicity;
- `Q4` entropy-optimal cardinality concentration;
- `Q5` exact-cardinality extraction and macroscopic diversity;
- `Q6` balanced signed reciprocal relations;
- `Q7` denominator-height and refinement branching;
- `Q8` transfer to every admissible rational.

The final TeX numbering may differ, but this dependency order is controlling.

## Parameter order

The article preserves

```text
fixed rational data and squarefree denominator b
 -> fixed structural constants
 -> choose terminal Gaussian cutoff C
 -> choose X sufficiently large depending on b and C
 -> set Z=X^3 and construct the finite family.
```

No estimate chooses `C` after `X` or hides moving dependence in an absolute constant.

## Protected mathematical boundary

The global editorial integration changes no theorem, proposition, lemma, corollary, definition, remark, proof, displayed equation, quantitative constant, asymptotic, quantifier or mathematical disclaimer.  It changes only source identities, navigation, two Section 10 headings, minimal roadmap wording, build documentation, bibliography page transition and control metadata.

## Current control

- repository: `Yuren-Tang/erdos-306`;
- controlling issue: `#8`;
- sole branch: `paper/e306-anchor-fibre-v1`;
- draft PR: `#9`;
- publication state: Owner hold;
- exact current head and exact-head workflow evidence: PR `#9` body and the latest durable issue return.

No ready-for-review, merge, tag, release, DOI, Zenodo, arXiv or journal action is implied by this architecture record.
