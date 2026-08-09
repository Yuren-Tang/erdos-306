# E306 — second blind review disposition

**Date:** 2026-08-09  
**Reviewed fixed object:** `20fd8c774397faf14208fcdce550b344a6e9b77b`  
**Current post-disposition source:** `8024ff325f454e1fc52c280ac65bab0c48315e96`  
**Status:** review evidence on preceding object; substantive revision applied; current object pending focused independent recheck.

## Review return

The Owner supplied a blind-style review by a reader not given the project history. The reader reported no fatal mathematical objection after reading the 35-page PDF, TeX components, cross references, bibliography, and especially Sections 4--8. The reader regarded the paper as a genuine research article suitable for serious journal review and recommended substantive but non-foundational revision.

This disposition treats the report as evidence and mathematical input, not authority. Each suggestion was rechecked against the manuscript and existing portfolio mathematics before adoption.

## Adopted local repairs

The following suggestions were correct and were applied:

1. expand the fingerprint-rigidity contradiction to the explicit inequality supplied by reciprocal dispersion and choose `4g<c_D`;
2. define label classes when the nonbad neighbours first receive labels;
3. state explicitly that fixed anchor plus row tuple determines one CRT frequency `h mod L`, so the source character is a function of that tuple;
4. replace “maximum atom” by “uniform upper bound for an atom in the window”;
5. rename the temporary lcm variable in Section 9;
6. condense common proper refinement from a full proposition/proof to a remark when the strengthened article temporarily grew beyond the preferred page profile.

These repairs do not change theorem scope.

## Sparse-target suggestion: adopted after independent Director derivation

The review proposed replacing the full target rows

```text
{rq : r|b, q in B}
```

by a sparse set of target sensors and suggested that the clean theorem might then hold for every fixed `gamma>1` rather than only `gamma>2`.

The portfolio already contained a repaired sparse-sensor route and a historical independently audited `gamma>1` parameterized article, but not this exact hybrid. The Director therefore rederived the hybrid against the current five-sector proof rather than importing a conclusion from those sources.

The adopted family keeps the complete prime-pair family and complete anchor block, chooses any

```text
B_* subset B,
|B_*| = K_* = ceil((log Z)^2),
```

and uses only `rq` with `q in B_*` for the finitely many fixed coordinates `r|b`.

The recheck established the following authorial proof transport:

- target reciprocal load `O_b(K_*/Z)=o(1)`;
- target square load `O_b(K_*/Z^2)`, lower order than pair variance for every fixed `gamma>1`;
- target row distance `D_r>=K_*/r^2`, giving superpolynomially small off-minimizer mass;
- target candidate-energy / row-distance ratio `O_b(m^2/Z^2)`, sufficient on the Gaussian range because `X log X=o(Z)` for `gamma>1`;
- sparse-target cubic Taylor remainder tends to zero separately from the pair remainder;
- the first coherent tail needs only complete-pair modulus damping, not fixed-coordinate decoding;
- lower-prime decoding and adaptive retained damping remain valid for `gamma>1`;
- no fixed ordering is required between `M_dec` and the maximal low-energy anchor-label scale; if the latter is smaller, the large coherent range is empty;
- moving targets, no-wrap, finite avoidance, and prime dilution remain unchanged.

The revised theorem therefore uses

```text
gamma>1,
t < (log gamma)^2/2 < 1.
```

This is a genuine theorem-scope strengthening and reopens a dependency cone. It does not inherit independent assurance from the review that suggested it.

## Entropy observation

The review also suggested optimizing `H(alpha)` over `gamma`. The adopted statement is normalized correctly: it concerns entropy rate per denominator, not absolute representation count across families of different sizes.

For `0<t<1/2`, choosing

```text
gamma = exp(2 sqrt(t))
```

gives `alpha=1/2` and therefore at least `2^{(1-o(1))M_X}` exact representations in the mesoscopic typical-cardinality window and at some exact cardinality.

## Suggestions not adopted

- **Greek `ΟΙΣ -> ΟΥΣ`: rejected.** Classical relative attraction supports `ΚΑΙ [ΤΟΙΣ] ΟΙΣ ΦΙΛΩ`; the proposed passive paraphrase changes voice and the proposed accusative formulation changes or narrows the intended relation.
- **Full abstract meta-theorem in Article 1: not added.** The portfolio already contains the stronger Anchor--Fibre abstraction; the article retains only its concise concrete design principle.
- **Bivariate LLT, conditional CLT, growing standardized windows:** remain future work.
- **Alternative sparse/multiblock proof routes:** remain outside Article 1.
- **Journal-ranking and hypothetical endorsement judgments:** retained only as external editorial signals, not as mathematical evidence or publication authorization.

## Typography disposition

The Owner also reported dissatisfaction with both GFS Artemisia and EB Garamond. A fresh TeX Live comparison showed that the main defect was not simply the choice of regular face: uppercase Greek benefited from a true intermediate weight and open tracking.

Current choice:

```text
STIX Two Text Medium
10.5/16 pt
LetterSpace=9
upright, dedication only
```

No fake bold and no manual pair kerning are used. The current source cleanly embeds and extracts the Greek text.

## Current assurance state

The current object `8024ff32...` is author/Director-complete and clean-built, not independently passed. Its next gate is the focused dependency-cone review described in `SPARSE_TARGET_GAMMA1_FOCUSED_REVIEW_PACKET_2026-08-09.md`.
