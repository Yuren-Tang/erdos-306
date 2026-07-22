# E306-PD-OA1-01 — manuscript handoff

**Return state:** ready for an independent route audit, not yet for manuscript adoption  
**Consumer:** a separately authorized independent route auditor; only after audit, a future manuscript worker  
**Exact source branch:** `proof-development/e306-one-anchor-v1`

## 1. Controlling proof-development packet

A future consumer must read these six files together:

1. `ONE-ANCHOR-ROUTE-COMPARISON.md`;
2. `ONE-ANCHOR-PROOF-ARCHITECTURE.md`;
3. `ONE-ANCHOR-HUMAN-PROOF.md`;
4. `ONE-ANCHOR-DEPENDENCY-AND-PARAMETER-LEDGER.md`;
5. `ONE-ANCHOR-FAILURE-MODE-AUDIT.md`;
6. this handoff.

The human proof controls mathematical content.  The ledger controls dependencies and quantifiers.  The failure-mode audit records repairs and adversarial tests.  The route comparison controls simplification claims.

The frozen multiblock proof and its independent audit remain useful comparison sources, but they do not override this route's architecture.

## 2. Mathematical headline

The route proves the same public theorem:

> A positive rational `a/b` in lowest terms is a finite sum of reciprocals of distinct products of two distinct primes if and only if `b` is squarefree.

It first proves the avoiding unit theorem for every squarefree `b>=3`, then uses numerator induction and elementary reductions for `b=1,2`.

## 3. Principal proof architecture

Fix `Z=X^3` and use

```text
P={p prime:X<=p<Z},
B={q prime:Z/2<=q<Z},
E_pair={pq:p,q in P,p<q},
E_b={rq:r|b prime,q in B}.
```

The proof consists of:

1. the natural complete-pair load `(log3)^2/2` and a vanishing full-top auxiliary load;
2. exact finite Fourier inversion with one common Bernoulli parameter;
3. a repaired one-block forcing, zero-exception, and fingerprint theorem on `B`;
4. shift-uniform cyclic decoding of every other prime coordinate;
5. an exact retained-skeleton product inequality;
6. decoder identification for all prime coordinates and, in the small range, all prime coordinates of `b`;
7. an exact five-sector Fourier partition;
8. a positive Taylor major, Gaussian tail, adaptive pair damping, top-label tail, and global fibre error;
9. terminal order `C -> X`;
10. positivity, no-wrap, avoidance, and elementary closure.

## 4. Repairs that must survive every rewrite

A public rewrite must preserve five corrections.

### R1. Cross-label size hypothesis

The substantial sensor class must satisfy

```text
s>=16.
```

The clean statement is

```text
|C_m|>=max(16,128B/Y).
```

### R2. Zero-energy branch

Before setting a cutoff proportional to `sqrt(R)`, handle `R=0` separately.

### R3. Cross-class summation

Use

```text
sum_(j!=i)(n_j-1)=(S-n_i)-(t-1)
```

and include the factor `1/2` for ordered-pair double counting.

### R4. Fixed rows `r|b`

Do not invoke unproved equidistribution of top primes modulo `r`.  Use the direct estimate

```text
||dq^(-1)/r||>=1/r,
D_r>=|B|/r^2.
```

### R5. Global fibre error

Do not multiply the row error by the raw number of top assignments.  Multiply by the weighted top partition:

```text
P_top=O(ZlogZ),
error<=P_top(exp(Delta)-1).
```

These are proof requirements, not optional expository refinements.

## 5. Required theorem hierarchy for a future manuscript

No manuscript should be launched before independent route audit.  If the route passes, the natural public hierarchy is:

### Section 1 — theorem and reductions

- headline theorem;
- lcm necessity;
- avoiding unit theorem;
- numerator induction;
- cases `b=1,2`.

### Section 2 — prime interval and denominator family

- tail-uniform fixed-ratio PNT counts;
- Abel proof of the `log3` reciprocal sum;
- reciprocal-square bounds;
- complete-pair and full-top auxiliary families;
- distinctness, avoidance, load, no-wrap, and variance.

### Section 3 — exact Fourier formula

- weighted subset count;
- character orthogonality;
- Bernoulli modulus estimate;
- variance scale.

### Sections 4–5 — one-block top anchor

- reciprocal dispersion;
- repaired cross-label lemma;
- repaired nondominant forcing;
- exact zero-exception theorem;
- fingerprint rigidity and entropy;
- top coherent/noncoherent partition.

### Section 6 — row decoding

- multiplicity-sensitive cyclic-energy lemma;
- uniform lower-prime rows;
- stronger fixed rows dividing `b`;
- row product tails;
- retained-skeleton inequality;
- decoder identification.

### Section 7 — five-sector Fourier analysis

- exact sector exhaustion;
- Taylor major;
- Gaussian tail;
- adaptive interval and pair damping;
- top-label tail;
- noncoherent and fibre error.

### Section 8 — terminal budget and closure

- order `C -> X`;
- displayed strict comparison;
- Fourier positivity;
- no-wrap equality;
- avoiding and headline conclusions.

## 6. Multiblock material that must not re-enter

A manuscript based on this route must not restore, unless an independent audit finds a genuine necessity:

- all-block hot/cold bookkeeping;
- adjacent-label propagation;
- shell vectors;
- hot and boundary sets;
- maximal cold segments;
- a global injective block code;
- the global level-set theorem;
- multiblock localization;
- a block-minor/sibling-minor split;
- a free entropy parameter `eta`;
- a finite sibling-reservoir parameter `G`.

The top one-block theorem remains indispensable, but it does not license importing the old global chain.

## 7. Claims a future manuscript may make

After independent route audit, a manuscript may accurately state that:

- the proof uses the complete family of pairs of primes from a fixed power interval;
- one top prime block anchors all remaining prime coordinates through cyclic product-fibre decoding;
- the full top `b`-sensitive family removes a separate sibling sector;
- a retained lower complete-pair skeleton supplies adaptive damping;
- the terminal choice has only two stages, `C -> X`;
- the route is a strict simplification of the earlier multiblock paper-first architecture.

It must not claim that this one-anchor proof has been machine checked or already independently accepted.

## 8. Prose that cannot substitute for proof

The following phrases are unacceptable unless immediately followed by the displayed argument:

- “dispersion forces a label” without the bad-pair average, label cover, two cases, and closing algebra;
- “the exceptions vanish” without the disjoint-star estimate and strict integer `<1`;
- “the row code has large distance” without the multiplicity lemma or the fixed-row direct estimate;
- “all fibres decode” without the candidate-energy comparison with `D_r`;
- “the remaining factors are retained” without the denominator partition;
- “the top contribution is polynomial” without the Gaussian low part and fingerprint high part;
- “the sectors are exhaustive” without the squarefree coordinate bijection and decoder/nondecoder split;
- “adaptive damping is exponential” without the interval containment, PNT count, pair count, and `1/9` phase bound;
- “the errors are negligible” without comparison to `1/sigma_E`;
- “take `X` large” without the dependency order and finite threshold ledger.

## 9. Independent route-audit checklist

The next auditor should independently recompute at least:

1. every constant-free implication in the repaired nondominant forcing proof;
2. the exact top-block label uniqueness range;
3. the cyclic multiplicity lemma near both `r=X` and `r=Z/2`;
4. the fixed-row direct bound for every prime divisor of `b`;
5. the arbitrary-shift decoder tail;
6. the retained-skeleton inequality with actual factor assignment;
7. the global multiplication by `P_top`;
8. the decoder range `M_dec`;
9. the exact CRT coordinate bijection and absence of a residual factor `b`;
10. the adaptive interval at both endpoints and both signs;
11. the five-sector disjointness and exhaustion;
12. the Taylor remainder and real major coefficient;
13. every displayed comparison to `1/sigma_E`;
14. no-wrap and the avoiding induction.

The auditor should return a mathematical verdict, not infer correctness from this packet's internal consistency.

## 10. Acceptance boundary

This proof-development return is not:

- an independent mathematical audit;
- Owner approval;
- a formalization result;
- a manuscript revision;
- a Curator promotion;
- a release, tag, DOI, arXiv, journal, or submission action.

The only authorized next state is independent route audit.

## 11. Route return

The six deliverables are complete, the route is classified as a genuine strict simplification, and no unresolved implication remains in the proof-development packet.

```text
[READY-FOR-INDEPENDENT-ROUTE-AUDIT E306-PD-OA1-01]
```