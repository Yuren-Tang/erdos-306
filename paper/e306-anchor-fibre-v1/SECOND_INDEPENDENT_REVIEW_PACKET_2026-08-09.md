# E306 — second independent full-review packet

## Review object

Review this exact fixed manuscript source as a complete object:

```text
repository: Yuren-Tang/erdos-306
branch:     paper/e306-anchor-fibre-v1
source:     20fd8c774397faf14208fcdce550b344a6e9b77b
entry:      paper/e306-anchor-fibre-v1/manuscript/main.tex
```

Title:

> *Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem*

A clean XeLaTeX/Biber build of this exact source is certified by GitHub Actions run `31303386599` (run 196, execution head `4bafe3eca68a8a823167e77ba9aeda744a2c9830`). The PDF is 35 A4 pages; workflow PDF artifact `9035208730`.

## Independence instruction

Please perform a **fresh full mathematical review of the fixed object above**. Do not treat an earlier review, Director audit, Lean proof, or successful build as a substitute for checking this manuscript.

There was a previous independent review of an earlier source. It found no fatal defect and led to bounded revision. That history may be consulted for context after your own read, but no conclusion from it should be inherited automatically. The purpose of this round is a clean second assurance cone on the current object.

The separate Lean 4 development is orthogonal evidence for the headline characterization only. The analytic local-limit argument in this manuscript is not claimed to be formalized and must be checked on its own terms.

## Headline claims to verify

Please check statement/proof agreement and exact scope for all of the following.

1. **Squarefree-denominator characterization with finite avoidance.** A positive reduced rational `a/b` is representable as a finite sum of reciprocals of pairwise distinct squarefree semiprimes iff `b` is squarefree, and a prescribed finite set of denominators may be avoided.
2. **Direct proper-target construction.** For fixed reduced `t=a/b in (0,1)` with squarefree `b` and fixed `gamma>2` satisfying `t < (log gamma)^2/2 < 1`, the pair-dominant family with target rows produces exact representations for all sufficiently large `X`.
3. **Compact-uniform local Gaussian profile.** For every fixed standardized radius `U`, the Bernoulli-weighted exact lattice coefficients have the asserted Gaussian profile uniformly for `|j| <= U L_X sigma_X`.
4. **Multiplicity / entropy lower bounds.** The typical-cardinality window, total exact fibre, and at least one exact cardinality have the stated `exp([H(alpha)-o(1)]M_X)` lower bound. No unproved matching upper bound should be inferred.
5. **Prime-dilution closure.** The proper-target theorem plus successive finite avoidance gives arbitrary positive squarefree-denominator rationals on pairwise disjoint supports.

## Load-bearing proof audit

A useful adversarial reading order is Sections 2--6, then 8, 7, 9, and finally the Introduction/Conclusion against what has actually been proved.

Please pay particular attention to:

- the reciprocal-mass and variance asymptotics, especially why the target-row square mass is lower order exactly in the retained `gamma>2` regime;
- the finite Fourier normalization and the separation between quotient positivity and exact rational equality;
- one-anchor rigidity: reciprocal dispersion, cross-label energy, dominant-label forcing, zero-exception integer step, and fingerprint population bound;
- row observability and the distinction between lower-prime decoder range, target-coordinate decoder range, and retained complete-pair damping;
- every transition scale in the Section 6 five-sector exhaustion, including absence of gaps/overlap assumptions that are not justified;
- exact centering and Taylor remainder uniformity on fixed standardized compacta;
- the treatment of large coherent labels by retained damping rather than an invalid decoder extrapolation;
- noncoherent/off-minimizer weighted summation rather than pointwise estimates alone;
- moving-target insertion as a unit character and why all modulus estimates remain uniform in the fixed `U` window;
- no-wrap for all relevant moving lattice targets;
- the probabilistic-to-unweighted entropy conversion and what is, and is not, proved about exact cardinalities;
- pairwise disjointness in the prime-dilution closure and the finite-avoidance quantifiers.

If any proof step depends on an unstated range, hidden order of limits, silently strengthened quantifier, or use of an estimate outside its proved domain, please identify the exact dependency cone.

## Scope boundaries that should remain boundaries

Please flag any place where the prose accidentally suggests more than the proved theorem. In particular, the paper does **not** claim:

- `gamma<=2` transition regimes;
- a growing standardized radius `U_X -> infinity`;
- a bivariate or prescribed-cardinality local limit;
- a matching global upper bound for the total exact fibre;
- deletion resilience;
- the abstract anchor--fibre theorem as a replacement for the concrete arithmetic proof;
- formalization of the local-limit theorem;
- an assurance-independent second proof via the sparse or multiblock routes.

## Equation-reference maintenance surface

The current object deliberately preserves all reviewed visible equation numbers while replacing a synthetic numeric-reference workaround by ordinary LaTeX/hyperref labels.

Mechanical invariant at the fixed source:

```text
190 explicit tagged displays
190 unique equation labels, exactly one per tagged display
94 equation references
```

Two pre-existing descriptive labels are retained:

```text
(8.4)  eq:unit-character
(8.15) eq:moving-profile
```

Other tagged displays use `eq:section.number` fallback labels. Visible equation numbers were not renumbered. Please report any incorrect formula target, misleading reference, or navigation mismatch you encounter while reading; the successful build only proves syntactic closure, not semantic correctness of every human reference.

## Front matter / typography fixed-object checks

These are secondary to the mathematics but belong to the reviewed object:

- body text: ETbb OpenType;
- mathematics: NewTX;
- dedication only: EB Garamond OpenType;
- exact Greek dedication:

  `ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ`

  `ΚΑΙ ΟΙΣ ΦΙΛΩ`

- no affiliation or email; compact linked ORCID;
- British English with Oxford spelling;
- concise AI-assistance disclosure.

The Greek `ΟΙΣ` is deliberate: the authorial disposition relies on classical relative attraction with an omitted dative antecedent. It should not be treated as an obvious typo without a contrary philological argument.

The clean build already checks embedded fonts, no Type 3, Unicode dedication extraction, unresolved references/citations/labels, missing glyphs, Biber diagnostics, and overfull hboxes. A visual defect should nevertheless be reported if observed.

## Citation / provenance checks

Please verify that:

- historical comparison with Butler--Erdős--Graham and Li is accurate and not priority-overclaiming;
- the separate Lean proof is described as a different proof/evidence object rather than a dependency of this article;
- no bibliography entry is being used to support a stronger statement than it contains;
- the article's use of “self-contained analytic resolution” matches what the body actually supplies.

## Requested review output

Please return a fixed-object report with:

1. **Disposition:** PASS / PASS WITH MINOR REPAIRS / MAJOR REPAIR REQUIRED / FAIL.
2. **Fatal or theorem-affecting findings first**, each with precise section/equation/lemma location and dependency consequence.
3. **Nonfatal mathematical gaps or statement-hygiene issues** separately.
4. **Citation/provenance issues** separately.
5. **Presentation/reference/typography issues** separately.
6. A short explicit statement of which headline claims you believe the reviewed object actually establishes.

Please distinguish a defect in an optional/expository route from a defect in the complete dependency cone of a theorem. A failed alternate intuition should not be allowed to masquerade as a failure of a theorem already closed by another argument; conversely, shared hidden assumptions should not be counted as independent corroboration.

## Publication boundary

This review is evidence only. Even a PASS does not authorize merge, tag, release, DOI metadata changes, arXiv upload, journal submission, endorsement requests, or external contact. Those remain Owner decisions after review disposition.
