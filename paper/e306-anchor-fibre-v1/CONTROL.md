# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **Publication state:** first independent full-review return received on an earlier fixed object; bounded revision and source-maintenance pass completed; a clean second independent full review of the new fixed object is the next assurance gate. No publication action is authorized by this file.

## Current exact manuscript source

The manuscript source for the second independent review is exactly

```text
20fd8c774397faf14208fcdce550b344a6e9b77b
```

The branch may be ahead of this SHA only through workflow/control/profile/review-record commits. `main.tex`, `references.bib`, and `sections/` are frozen against this source by the manuscript workflow.

The preceding independently reviewed object was

```text
654189fe67b575bd539092f1700754835ee7ebda.
```

The first independent reader found no fatal mathematical defect, stress-tested the main Sections 4--6 dependency cones, and recommended bounded revision. The disposition is preserved in `INDEPENDENT_REVIEW_DISPOSITION_2026-08-09.md`; it is evidence for that earlier object and is not silently promoted to the current fixed object.

The post-review mathematical/expository revision first produced clean source

```text
3899f40fb493c2e2f2894f432cada64437a0964c.
```

After Owner review, a separate source-maintenance pass then made two deliberately non-mathematical changes before the second independent review:

1. **Equation-reference migration.** All 190 existing visible `\tag{section.number}` values are retained. Each tagged display now has exactly one real equation label, and all 94 equation references use ordinary LaTeX `\eqref`/hyperref navigation. Pre-existing descriptive labels `eq:unit-character` for (8.4) and `eq:moving-profile` for (8.15) are retained; the other displays use `eq:section.number` fallback labels. The global synthetic `\eqref` override is gone.
2. **Dedication face.** The two-line Greek dedication now uses EB Garamond OpenType only for the dedication. Body text remains ETbb and mathematics remains NewTX. The wording, 10 pt size, 15 pt baseline, 8 pt space above, 12 pt below, upright setting, and absence of added tracking are unchanged.

No theorem, proof range, mathematical construction, estimate, displayed formula, visible equation number, or quantifier was intentionally changed in this maintenance pass.

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

## Clean-build checkpoint for the second-review object

GitHub Actions run

```text
31303386599
```

(run number 196) on execution head

```text
4bafe3eca68a8a823167e77ba9aeda744a2c9830
```

clean-built exact manuscript source `20fd8c77...` and passed all configured gates:

- exact source freeze and Oxford spelling;
- semantic equation-reference surface: 190 tagged displays, 190 unique equation labels, 94 equation references, no legacy numeric `\eqref`, no global `\eqref` override, no multiple equation labels;
- XeLaTeX/Biber clean build;
- no unresolved or multiply defined references/citations/labels;
- no missing glyphs;
- no overfull hbox;
- Biber warning/error gate;
- all fonts embedded and no Type 3;
- EB Garamond present and embedded for the dedication;
- Unicode extraction of both Greek dedication lines, ORCID, and `Erdős`;
- internal-label leak gate;
- 35-page A4 PDF artifact upload (`artifact 9035208730`).

The resulting PDF is 35 A4 pages. The EB Garamond and preceding Artemisia first pages were rendered at equal scale and visually compared; EB Garamond is retained because it is quieter, narrower, and more consonant with the ETbb title-page texture while leaving the dedication visually distinct.

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
- two-line upright **EB Garamond** dedication, dedication-only;
- exact dedication text `ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ / ΚΑΙ ΟΙΣ ΦΙΛΩ`;
- concise generative-AI disclosure.

The earlier Owner supplement had already specified dedication-only EB Garamond conditionally on clean compilation, embedding, and extraction. That condition is now satisfied by the current XeLaTeX/OpenType build. The later GFS Didot -> GFS Artemisia choice was a valid comparison among the then-landed Greek faces, but it does not override the now-completed EB Garamond test requested by the Owner. Artemisia remains the immediately preceding historical face, not the controlling face.

The proposed Greek `ΟΙΣ -> ΟΥΣ` change from the first independent review remains not adopted: classical relative attraction supports the dative relative with an omitted dative antecedent. See the first-review disposition record for the philological rationale.

## Equation-reference policy

Equation references are now ordinary LaTeX/hyperref references. Stable visible numbering is deliberately decoupled from source identity:

- visible equation numbers remain the explicit reviewed `\tag{section.number}` values;
- each tagged display carries exactly one `eq:` label;
- descriptive equation labels are preferred when already present;
- `eq:section.number` is the fallback source label;
- the workflow hard-fails on duplicate tags, duplicate equation labels, missing reference targets, legacy bare numeric `\eqref`, multiple labels on one tagged display, or reintroduction of the global `\eqref` override.

This maintenance pass therefore gains source navigation and hyperlink correctness without renumbering the reviewed mathematical surface.

## Formal Lean axis

The archived Lean release is orthogonal evidence for the headline characterization only. The article does not depend on it and the local-limit theorem is not claimed formalized.

## Next gate: clean second independent full review

The Owner has elected not to close the assurance state by a narrow delta recheck. The next reviewer should instead read the **entire current fixed object** `20fd8c77...` cleanly, with the first review available only as historical context if desired.

The reviewer should independently assess theorem statements, quantifiers, all load-bearing Sections 4--6 estimates and exhaustion, moving-target transfer, multiplicity/entropy consequences, no-wrap and prime-dilution closure, citation/provenance claims, and the integrity of the maintained reference surface. The dedicated reviewer brief is `SECOND_INDEPENDENT_REVIEW_PACKET_2026-08-09.md`.

Until that second independent review is returned and the Owner gives explicit publication authorization, do **not** mark PR #9 ready, merge, tag, release, alter DOI metadata, upload to arXiv, submit to a journal, or contact an external party on the Owner's behalf.

## Current state

```text
[SECOND-REVIEW MANUSCRIPT SOURCE 20fd8c774397faf14208fcdce550b344a6e9b77b]
[FIRST INDEPENDENT REVIEW: EARLIER OBJECT, NO FATAL DEFECT / REVISION ADVISED]
[BOUNDED REVISION + SOURCE-MAINTENANCE PASS COMPLETE]
[SEMANTIC EQUATION REFERENCES: 190 DISPLAYS / 190 LABELS / 94 REFS]
[DEDICATION: EB GARAMOND, CLEANLY EMBEDDED AND EXTRACTED]
[CLEAN XELATEX/BIBER BUILD PASS — ACTION 31303386599]
[35-PAGE A4 SECOND-REVIEW PDF AVAILABLE]
[CLEAN SECOND INDEPENDENT FULL REVIEW NEXT]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO PUBLICATION SUBMISSION AUTHORIZED]
```
