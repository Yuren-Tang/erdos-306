# E306-OA-AUDIT-01 — Independent Route Comparison

**Frozen candidate:** `review/e306-one-anchor-proof-audit-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`  
**Comparison question:** whether the one-anchor route is a true simplification or merely relocates the multiblock burden

## 1. Classification

```text
GENUINE STRICT SIMPLIFICATION
```

The route proves the same headline theorem. The strictness concerns proof architecture and dependency count, not theorem strength.

## 2. What remains common and therefore is not part of the simplification claim

The following burdens remain genuinely necessary:

- complete-pair arithmetic and the reciprocal-load window;
- one-block reciprocal dispersion;
- nondominant forcing and exact zero-exception labelling;
- fingerprint entropy on a dense prime block;
- finite Fourier inversion and the Bernoulli modulus estimate;
- a positive Taylor major and quantitative minor bounds;
- no-wrap, avoidance, and numerator closure.

The one-anchor route does not erase these components and should not advertise their removal.

## 3. What the new route removes

The candidate does not require a family of neighbouring dense blocks, propagation of labels between blocks, shell or segment coding, a global multiblock level-set theorem, multiblock localization, or a separately sized sibling reservoir.

Instead, one top block `B` supplies a coherent label or an exponentially damped top assignment. Every remaining prime coordinate is then handled independently as a cyclic row against that fixed top assignment.

The removed proof chain is global and combinatorial. Its replacement consists of local uniform lemmas plus one exact product inequality.

## 4. Is multiblock complexity hidden in the row code?

No.

The row code has one uniform statement:

```text
D_r=min_(d!=0)sum_(q in B)||dq^(-1)/r||^2.
```

For lower prime rows it follows from a single multiplicity-sensitive cyclic estimate. For fixed rows dividing `b` it follows term by term from distance at least `1/r`. The argument is shift-uniform and applied independently to each row.

It does not introduce:

- labels shared between rows;
- propagation along a block graph;
- hot/cold transitions;
- shell vectors or boundary data;
- a global injective row code;
- a count of joint row patterns.

The only global operation is summation of the exponentially small row tails. Because the retained-skeleton inequality factors the pure row product, no exponential joint-state count appears. Thus the row code is a genuine local replacement, not a renamed multiblock code.

## 5. Is multiblock complexity hidden in the top partition?

No, except for the one-block entropy that the route openly retains.

The top partition classifies one assignment on one block:

```text
Q_B<F_B  -> one exact integer label,
Q_B>=F_B -> fingerprint-entropy damping.
```

Its complete weighted size is `O(Z log Z)`. There is no classification of many block labels, no consistency graph, and no global level-set entropy. The top partition therefore retains the indispensable one-block theorem but does not reconstruct the discarded multiblock machinery.

## 6. Is multiblock complexity hidden in the retained skeleton?

No.

The retained skeleton performs two transparent tasks:

1. it leaves every lower-lower complete-pair factor available at the decoder tuple;
2. it bounds all nondecoder tuples by

```text
P_top(exp(Delta)-1).
```

The first task supplies pointwise adaptive damping for coherent labels. The second is an elementary product expansion after absolute values. Neither task encodes a global family of labels or proves a multiblock localization theorem.

The skeleton is substantive replacement work, but its logical form is strictly simpler: exact factor partition, one distinguished product point, and a multiplicative error estimate.

## 7. Is sibling complexity merely moved into the full-top auxiliary family?

The former freedom modulo `b` is resolved, not hidden.

For each prime `r|b`, the denominators `rq` with all `q in B` form an explicit row. The direct distance bound

```text
D_r>=|B|/r^2
```

makes the row decoder unique in the major and Gaussian ranges. Outside those ranges, complete-pair or top damping already controls the frequency without identifying the `b` coordinates.

This eliminates a separately chosen reservoir and its terminal parameter. It does add a vanishing reciprocal load and a finite family of fixed rows, but no sibling classification survives.

## 8. Five sectors versus the former six lanes

The candidate's five sectors are exhaustive because two binary partitions are exact:

```text
top assignment: coherent / noncoherent,
lower tuple: decoder / nondecoder.
```

Coherent labels are then divided into four disjoint numerical ranges. Sector V combines two analytically different but separately bounded pieces:

- the decoder point of a noncoherent top assignment;
- every nondecoder lower tuple, for coherent or noncoherent top assignments.

This grouping is bookkeeping only. The first piece is controlled by the high top shell; the second by the weighted fibre estimate. No frequency, top assignment, lower tuple, or multiplicity is lost in the grouping.

## 9. Proof-length versus theorem strength

The theorem is unchanged. The simplification is nevertheless strict in each of the following senses:

- fewer structural parameters: terminal order `C -> X`, with no `eta` or reservoir size;
- fewer global objects: one top label rather than a multiblock label system;
- fewer interaction lemmas: no adjacent-block propagation or global code;
- direct coordinate resolution of the `b` factor;
- pointwise adaptive damping from retained complete pairs;
- exact product control of all nondecoder fibres.

This is not merely shorter prose. The dependency DAG has fewer theorem nodes and lower interaction arity.

## 10. Final comparison verdict

The one-anchor route moves some genuine work into three explicit providers—cyclic rows, a weighted top partition, and a retained complete-pair skeleton—but none of those providers contains an equivalent reconstruction of multiblock propagation or global localization.

Accordingly:

```text
route: GENUINE STRICT SIMPLIFICATION
correctness: PASS
headline strength: unchanged
hidden multiblock reconstruction: no
```
