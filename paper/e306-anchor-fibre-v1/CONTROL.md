# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **Publication state:** independent full-review return received on the preceding fixed object; bounded revision applied and clean-built; independent delta recheck and Owner publication disposition remain before publication action.

## Current exact manuscript source

The revised manuscript source is exactly

```text
3899f40fb493c2e2f2894f432cada64437a0964c
```

The branch may be ahead of this SHA only through workflow/control/profile/review-record commits. `main.tex`, `references.bib`, and `sections/` are frozen against this source by the manuscript workflow.

The immediately preceding independent-review object was

```text
654189fe67b575bd539092f1700754835ee7ebda.
```

The Owner supplied an independent review of that complete TeX/PDF object. The reader found no fatal mathematical defect, specifically stress-tested the main Sections 4--6 dependency cones, and recommended publication after bounded revision. The resulting disposition is recorded in `INDEPENDENT_REVIEW_DISPOSITION_2026-08-09.md`.

The bounded post-review source delta contains only:

1. an explicit `Lambda<1` hypothesis in the no-wrap lemma;
2. removal of the Section 2 `S_X` notation collision;
3. an explicit Section 6 frequency-scale hierarchy;
4. earlier clarification that the Lean proof and analytic article are distinct proofs;
5. a concise target-row observability principle in the Introduction;
6. an explicitly non-theorem cardinality-decorrelation motivation in Section 10;
7. bibliography enlargement and removal of the Introduction overfull box;
8. one small reduction of engineering metaphor.

No theorem, displayed mathematical formula already proved, estimate, construction, proof range, or quantifier was intentionally changed.

## Current theorem package

1. **Characterization with finite avoidance.** A positive reduced rational `a/b` is a finite sum of reciprocals of distinct squarefree semiprimes iff `b` is squarefree, with arbitrary finite avoidance.
2. **Direct proper-target theorem.** Fix reduced `t=a/b in (0,1)` with squarefree `b`, and fixed `gamma>2` satisfying `t < (log gamma)^2/2 < 1`. With `Z=X^gamma`, the direct pair family plus target rows represents `t` for all sufficiently large `X`.
3. **Local Gaussian profile.** The Bernoulli-weighted exact coefficients of the same target-adapted family satisfy the compact-uniform Gaussian profile on every fixed standardized target window.
4. **Multiplicity and entropy.** With `alpha=2t/(log gamma)^2`, the typical-cardinality window contains at least `exp([H(alpha)-o(1)]M_X)` exact representations; the total fibre and at least one exact cardinality inherit the same lower bound. No matching total-fibre upper bound is asserted.
5. **Prime-dilution closure.** Arbitrary positive squarefree-denominator rationals follow from finitely many pairwise disjoint proper-target representations obtained by successive finite avoidance.

Every fixed `0<t<1` admits a pair-dominant exponent because

```text
max(2, exp(sqrt(2t))) < gamma < exp(sqrt(2)).
```

## Deliberate exclusions

Article 1 does not restore the `1<gamma<=2` target-row-dominant regimes, arbitrary/varying anchors, entropy optimization, full AFT, multiblock/sparse alternative routes, restricted-prime programmes, finite-prefix CRT, growing standardized windows, bivariate/prescribed-cardinality local limits, or deletion resilience.

## Clean-build checkpoint

GitHub Actions run

```text
31292599279
```

(run number 191) on execution head `4c48940b1407142b990fda8fe4cd3fa41f856ce0` clean-built exact manuscript source `3899f40...` and passed all configured gates:

- source freeze and Oxford spelling;
- XeLaTeX/Biber build;
- bibliography/reference/label/missing-glyph checks;
- **no overfull hbox**;
- Biber warning/error gate;
- embedded fonts and no Type 3;
- Unicode Greek dedication, ORCID, and `Erdős` extraction;
- internal-label leak gate;
- 35-page PDF artifact upload.

One mild underfull box remains in the final log; it is not a clipping or correctness defect.

## Presentation profile

Retain, absent a concrete review defect:

- British English with Oxford spelling;
- `amsart`, A4, 11 pt, right equation numbers;
- ETbb OpenType text with NewTX mathematics;
- XeLaTeX;
- numeric `biblatex`/Biber citations sorted `nyt`;
- bibliography in `\small`;
- no affiliation or email;
- compact linked ORCID;
- two-line upright **GFS Artemisia** inscriptional dedication;
- exact dedication text `ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ / ΚΑΙ ΟΙΣ ΦΙΛΩ`;
- concise generative-AI disclosure.

The durable front-matter record `#8#issuecomment-5109693351` explicitly chose GFS Artemisia Regular (10 pt on 15 pt, 8 pt above, 12 pt below). Garamond is not the controlling E306 dedication face.

The proposed Greek `ΟΙΣ -> ΟΥΣ` change from the independent review is not adopted: classical relative attraction supports the dative relative with an omitted dative antecedent. See the disposition record for the philological rationale.

## Equation-reference policy

The review source retains its explicit numeric `\tag{section.number}` / numeric-reference convention. The earlier synthetic label bridge was removed after it leaked internal labels into PDF text; the current clean-build gate prevents recurrence. A full migration to semantic `\label`/`\eqref` is deferred as a separately audited journal-source maintenance task rather than reopening the whole formula-reference surface immediately before public release.

## Formal Lean axis

The archived Lean release is orthogonal evidence for the headline characterization only. The article does not depend on it and the local-limit theorem is not claimed formalized.

## Next gate

The independent reader reviewed source `654189fe...`, not the revised source `3899f40...`. Therefore the correct assurance state is:

```text
[INDEPENDENT FULL-REVIEW RETURN: NO FATAL DEFECT / REVISION ADVISED]
[BOUNDED REVISION APPLIED]
[CLEAN REVISED-SOURCE BUILD PASS]
[INDEPENDENT DELTA RECHECK REQUIRED]
```

Ask the independent checker to compare `654189fe... -> 3899f40...` and verify that the bounded revisions are correct and do not alter theorem/proof scope inadvertently. A full re-review is unnecessary unless the delta check finds a reason to reopen a dependency cone.

After a delta PASS, the Owner may make the publication-route decision. Until then, and until explicit Owner authorization, do **not** mark PR #9 ready, merge, tag, release, alter DOI metadata, upload to arXiv, submit to a journal, or contact an external party on the Owner's behalf.

## Current state

```text
[REVISED MANUSCRIPT SOURCE 3899f40fb493c2e2f2894f432cada64437a0964c]
[INDEPENDENT REVIEW OF PRECEDING OBJECT: NO FATAL DEFECT / REVISION ADVISED]
[CLEAN XELATEX/BIBER BUILD PASS — ACTION 31292599279]
[35-PAGE REVISED REVIEW PDF AVAILABLE]
[INDEPENDENT DELTA RECHECK NEXT]
[OWNER PUBLICATION DISPOSITION AFTER DELTA PASS]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO PUBLICATION SUBMISSION AUTHORIZED]
```
