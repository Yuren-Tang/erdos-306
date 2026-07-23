# Unit-fraction neighbourhood mine map: Erdős 304--313

**Programme:** `E306-RL-ADJ-03`  
**Status:** `STRUCTURAL TRIAGE / RESEARCH PRIORITY MAP`  
**Date:** 2026-07-23  
**Authority:** research only

## 1. Purpose

The work around E306 has produced three distinct mechanisms:

1. weighted anchor--fibre Fourier transference;
2. arithmetic local limits and hot--cold smoothing;
3. prime-shift Hasse calculus and arithmetic-derivative dynamics.

The nearby Erdős problems are not one homogeneous family.  This note identifies which
mechanism genuinely transfers to which problem and prevents superficial numerical adjacency
from controlling research priority.

Current public statuses and statements were checked against `erdosproblems.com` on
2026-07-23.  They may change independently of this research note.

## 2. E304 — minimum number of unit fractions

E304 asks whether the worst-case minimum number of terms needed to represent `a/b` is
`O(log log b)`.  The currently recorded general upper bound is much larger.

### Mechanism relation

This is primarily a **sparsification/complexity** problem, not an exact local-limit problem.
A local-limit theorem normally supplies many representations using many available atoms; it
does not automatically minimize support size.

Possible interfaces:

- compress a dense exact representation by additive-combinatorial exchange;
- use a microcanonical ensemble with prescribed support size;
- optimize a Hasse-hypergraph coefficient under a cardinality constraint.

### Priority

High intrinsic importance, but not the nearest consumer of current E306 machinery.  It
requires a new support-compression principle.

## 3. E305 — maximal denominator scale

E305 asks for the smallest possible maximal denominator in arbitrary rational unit-fraction
representations.  It has been solved in the requested `b(log b)^(1+o(1))` scale, with later
quantitative refinements.

### Mechanism relation

This is a useful benchmark for denominator economics:

```text
reciprocal capacity versus largest available scale.
```

Hot--cold smoothing may give an alternative probabilistic architecture, but there is no
obvious open theorem dividend unless it improves secondary logarithms or extends to
restricted denominator classes.

### Priority

Low as a standalone target; medium as a comparison framework for restricted-semiprime
variants.

## 4. E306 — arbitrary semiprime graph coefficient

E306 asks for exact representation of positive rationals with squarefree denominator by
reciprocals of products of two distinct primes.

### Current role of the new mechanisms

E306 remains an active consumer, not merely historical motivation.

- weighted transference can shorten and modularize its ordinary proof;
- positive slicing may replace absolute fibre bookkeeping;
- hot--cold smoothing may strengthen the finite-prefix/GFF consequence;
- graph-Hasse calculus gives a conceptual algebraic statement;
- sparse incidence-code mixing may yield a much shorter local-limit proof.

### Honest boundary

The released theorem is already solved and Lean-checked.  The newest local-limit/hot--cold
routes are research candidates, not replacements until proof development and assurance close
them.

## 5. E307 — complete-bipartite coefficient / derivative two-cycle

E307 asks for prime sets `P,Q` with

```text
(sum_(p in P)1/p)(sum_(q in Q)1/q)=1.
```

It is equivalent to a coprime squarefree arithmetic-derivative two-cycle

```text
D(x)=y,
D(y)=x.
```

### Mechanism relation

E307 shares the semiprime graph geometry of E306 but imposes the strongest possible rank-one
support constraint: the edge set must be exactly `P x Q`.

This changes the problem from linear edge selection to nonlinear vertex-set closure and
smooth factorization.  E306 local limits do not directly solve it.

### Priority

Very high as a new mathematical programme because it connects:

- unit fractions;
- arithmetic derivative dynamics;
- squarefree numerator smoothness;
- mutual CRT syndrome equations;
- complete-bipartite restricted Hasse coefficients.

It is the richest genuinely new branch discovered here.

## 6. E308 and E309 — interval coverage by bounded denominators

E308 and E309 concern which integers are representable by distinct unit fractions with
denominators at most `N`.  Their main qualitative questions are solved, with quantitative
boundary deficits studied by Croot and Yokota.

### Mechanism relation

These are the clearest **second consumers** of the arithmetic local-limit viewpoint:

```text
Gaussian bulk + lattice smoothing -> contiguous or near-contiguous representable region.
```

Unlike E307, the variables remain linear subset choices.  Hot--cold smoothing, positive
slicing, and heat-trace bounds fit naturally.

### Research dividend

A general theorem simultaneously recovering semiprime GFF and a model form of E308/309
would justify a separate local-limit/transference paper.  The value would be conceptual
unification rather than reopening solved yes/no statements.

### Priority

High as an abstraction test and publication-level second consumer; lower as a new open
problem target.

## 7. E310 — dense sets contain a bounded-denominator rational sum

E310 is solved affirmatively through dense-set unit-fraction results.

### Mechanism relation

This is a density-to-structure theorem.  Hot--cold smoothing may reinterpret the proof as
extraction of a smoothing component plus a bounded quotient, but the current machinery does
not obviously improve the sharp exponential dependence on density.

### Priority

Medium as a stress test for target observability and dense-set extraction; low as an open
frontier.

## 8. E312 — exponentially close subset sum below one

E312 asks whether reciprocal mass `>K` always contains a submultiset whose sum lies in

```text
(1-exp(-cK), 1].
```

The known older guarantee is polynomial rather than exponential in `K`.

### Mechanism relation

This is the closest open neighbouring problem to the **hot--cold smoothing philosophy**.
It does not require exact lattice equality, so it avoids the hardest CRT alias problem.
The target is an exponentially thin terminal interval, suggesting:

- entropy/large-deviation selection;
- a hot smoothing subensemble;
- a cold reservoir tuned just below one;
- anti-concentration or one-sided local limits.

### Priority

Very high.  It may be more tractable than the full joint CRT mixer while still testing the
same ensemble-separation mechanism.  A successful theorem here would be an independent
consumer of hot--cold smoothing and could guide the exact E306/GFF local limit.

## 9. E313 — defect-one arithmetic-derivative near-fixed points

For squarefree `m`, E313 is exactly

```text
D(m)=m-1.
```

The known examples are primary pseudoperfect numbers.

### Mechanism relation

E313 and E307 form one arithmetic-dynamical pair:

```text
E313: near-fixed points with defect -1;
E307: genuine coprime two-cycles.
```

Construction methods for primary pseudoperfect numbers, Euclid-style recurrences, and
squarefree smoothness may inform E307.  Conversely, a monotonicity or height theory for the
arithmetic derivative could constrain both.

### Priority

Very high within the arithmetic-derivative branch.  It is likely the best source of known
examples, recurrences, and obstructions for E307.

## 10. Three research veins

### Vein I — finish and simplify E306

Goal:

```text
Replace route-specific blocks by one growing-modulus arithmetic local-limit theorem.
```

Highest-value missing provider:

```text
sparse CRT incidence code:
transverse spectral radius + collision entropy.
```

Potential dividend:

- shorter human proof;
- stronger GFF rate;
- reusable local-limit theorem.

### Vein II — E307/E313 arithmetic dynamics

Goal:

```text
Understand squarefree arithmetic-derivative near-cycles and two-cycles.
```

Highest-value problems:

1. classify squarefree-to-squarefree derivative transitions;
2. control factor-count and smoothness under `D`;
3. construct or obstruct reciprocal-numerator two-cycles;
4. reinterpret primary pseudoperfect recurrences dynamically.

Potential dividend:

- genuinely new problem family;
- connection between Egyptian fractions and arithmetic dynamics;
- possible independent paper even without solving E307.

### Vein III — E312 and coverage local limits

Goal:

```text
Use hot--cold smoothing without exact CRT equality.
```

Highest-value problems:

1. one-sided local limits near `1`;
2. exponential approximation from large reciprocal mass;
3. general smoothing-extraction theorem for positive atom multisets.

Potential dividend:

- second substantive consumer of the transference mechanism;
- feedback to exact GFF smoothing;
- potentially direct progress on an open neighbouring problem.

## 11. Recommended allocation

The best portfolio allocation is not to abandon E306 or to keep everything inside it.

```text
40% — E306/local-limit incidence code:
       because it can simplify the solved theorem and strengthen GFF.

35% — E307/E313 arithmetic-derivative dynamics:
       because it is the richest newly exposed mathematical branch.

25% — E312 hot--cold approximate theory:
       because it is a plausible second consumer and may be easier than exact CRT mixing.
```

These percentages are strategic, not scheduling authority.

## 12. Publication-level assessment

- The anchor--fibre theorem alone belongs as a central proposition or appendix in an E306
  paper if the route is selected.
- A growing-modulus arithmetic LLT with two consumers (E306/GFF and E308/309 or E312)
  could justify a separate paper.
- The arithmetic-derivative/Hasse graph calculus should not be inserted into the first E306
  manuscript unless it materially shortens the proof.  It is better developed as a separate
  adjacent-problem note after a dedicated novelty audit.

## 13. Classification

```text
E306 SIMPLIFICATION — STILL A LIVE AND VALUABLE CONSUMER
E307 — NOT SOLVED BY E306; NEW ARITHMETIC-DYNAMICAL PROGRAMME
E308/309 — NATURAL LOCAL-LIMIT SECOND CONSUMERS, QUALITATIVE PROBLEMS SOLVED
E312 — HIGH-VALUE OPEN HOT--COLD TEST PROBLEM
E313 — NEAR-FIXED-POINT COMPANION TO E307
```

No project, proof-development, manuscript, review, Curator, Lean, release, DOI, arXiv, or
canonical status changes through this triage map.