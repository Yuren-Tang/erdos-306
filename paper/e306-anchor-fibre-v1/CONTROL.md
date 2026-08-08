# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **Publication state:** external review is authorized; arXiv upload, journal submission, merge, release, DOI action, and other publication actions are not yet authorized.

A governance commit may advance the branch after a manuscript checkpoint. The exact external-review manuscript source is therefore recorded explicitly below rather than inferred from moving HEAD.

## Mathematical audit closure

The clean August mathematical source was promoted from

```text
Yuren-Tang/research-workbench@43c205356fe5def721d54206af83928e95338fac
intake/2026-08-07-e306-arxiv-v1/latex/
```

and independently audited under `E306-CLEAN-V1-INDEPENDENT-AUDIT-01`. All three public theorem blocks and all five load-bearing interfaces passed mathematically. Four bounded source/exposition repairs were made and independently closed by

```text
[PASS E306-CLEAN-V1-BOUNDED-RECHECK-01]
```

No mathematical repair, theorem restriction, exponent change, or new estimate remains pending.

The frozen mathematical baseline used by the presentation CI is

```text
dba5400f67acc2a8c05dedc1a1861700e17ee33d
```

for `references.bib` and every file under `manuscript/sections/`. The external-review presentation revision changes only `main.tex` and presentation/build/control surfaces. CI verifies those mathematical files remain byte-identical to this baseline.

## Public theorem package

1. **Squarefree-denominator characterization with finite avoidance.** A positive reduced rational `a/b` is a finite sum of reciprocals of distinct squarefree semiprimes iff `b` is squarefree; the support can avoid any prescribed finite set.
2. **Local Gaussian profile.** For the direct `Z=X^3` family attached to fixed squarefree `b>=3`, the exact target fibre has a compact-uniform Gaussian local profile on `|j| <= U L_X sigma_X` for every fixed `U`.
3. **Multiplicity and entropy.** The same family has exponentially many exact representations, ambient entropy exponent in a mesoscopic typical-cardinality window, and at least one exact cardinality with that exponent.

The fixed-target local limit is the central value of the local-profile theorem, not a separate proof route.

## Deliberate scope

The article does not make the fully abstract anchor–fibre transference theorem, general fixed targets with free parameters, alternative multiblock/sparse proofs, restricted-prime extensions, reciprocal-incidence graph algebra, finite-prefix CRT programmes, growing standardized target radius, prescribed-cardinality local asymptotics, or quantitative `b=1,2` transfer load-bearing.

## Article architecture

The active manuscript has ten sections:

1. Introduction and main theorems.
2. The direct semiprime family.
3. Fourier inversion and exactness.
4. One-anchor rigidity.
5. Row observability and decoded-skeleton compression.
6. Local Gaussian analysis.
7. Multiplicity and typical cardinality.
8. Moving-target local saturation.
9. Characterization and finite-avoidance consequences.
10. Further questions and perspective.

Narrative spine:

```text
arithmetic family
 -> anchor rigidity
 -> row observability / decoding
 -> weighted fibre compression
 -> Gaussian localization
 -> exact representation fibres.
```

## External-review presentation

The controlling presentation profile is `MANUSCRIPT_STYLE_PROFILE.md`.

The external-review design is:

- British English with Oxford spelling and philological attention to Greek/Latin-derived terminology;
- `amsart`, A4, 11 pt, right equation numbers;
- **ETbb OpenType** for the public text;
- **NewTX** mathematics;
- URLs/DOIs inherit the surrounding roman face rather than introducing a separate T1 typewriter encoding;
- XeLaTeX for semantic Unicode text;
- dedication in literal Unicode, two centred lines, uppercase and without diacritics, set **upright in GFS Artemisia**:

  ```text
  ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ
  ΚΑΙ ΟΙΣ ΦΙΛΩ
  ```

- no institutional affiliation or email;
- linked compact ORCID in the conventional `amsart` author footnote;
- concise generative-AI disclosure, with no Lean-development claim in this article;
- `biblatex` + Biber, **numeric citations**, bibliography sorted `nyt`;
- no forced bibliography page break;
- quiet hyperlinks and no decorative manuscript devices.

The Garamond build and the later Pagella/NewPX candidate are historical comparison/presentation evidence only. Neither is the selected external-review design.

## Exact external-review checkpoint

The exact manuscript-source checkpoint for external review is

```text
bb94f26fa9a33cf7df8ceda7beaeae9f4f129a14
```

with presentation/build workflow at that checkpoint given by `verify-e306-manuscript` run **#181**, run id `31240197085`.

At that exact manuscript checkpoint:

- frozen mathematical source check against `dba5400f...`: PASS;
- Oxford-spelling guard: PASS;
- clean XeLaTeX + Biber build: PASS;
- citations, references, labels, and Biber diagnostics: PASS;
- final-pass missing-glyph gate: PASS;
- all PDF fonts embedded, no Type 3: PASS;
- ETbb text is CID/OpenType and preserves literal `Erdős`: PASS;
- dedication extracts as literal Unicode: PASS;
- ORCID compact iD extracts correctly: PASS;
- no internal LaTeX label names leak into PDF text: PASS;
- same-head Lean workflow `verify-erdos-306` run **#915**, run id `31240197087`: PASS;
- page size: A4;
- length: **33 pages**;
- PDF artifact id: `9016794980`;
- diagnostics artifact id: `9016794816`;
- final PDF SHA-256:

  ```text
  187f5c7b30311b486ac463f0fa9e609f1708cb8d0905383909dd9857caeb5a13
  ```

The immediately preceding Unicode-safe presentation differed only in the dedication's inherited italic shape. A render diff against the corrected checkpoint reports **exactly one changed page (page 1)**, with the changed bounding box confined to the two dedication lines; pages 2–33 are pixel-identical. Page 1 of the corrected checkpoint was inspected directly and the PDF embeds `GFSArtemisia-Regular`, not Italic.

The 33-page ETbb/NewTX presentation was also compared visually with the preceding 34-page Pagella/NewPX candidate. ETbb/NewTX is retained because the text is denser without crowding, the math/text weight is more coherent across Fourier/CRT pages, numeric citations are quieter in the small bibliography, and the inscriptional dedication plus ORCID footnote produce a less intrusive title block.

## Superseded publication packet

The arXiv source packet previously generated from `dba5400f...` belongs to the superseded Pagella/NewPX presentation candidate. It is archival only and must not be submitted. A fresh arXiv packet will be generated only after external review and closure of any bounded review repairs.

## Formal Lean axis

The archived Lean release remains orthogonal evidence for existence/priority. The analytic manuscript contains no Lean argument; the AI acknowledgement does not imply otherwise, and no manuscript theorem depends on the formal artifact.

## Product rules from this checkpoint

- Mathematical Sections 1–10 and `references.bib` remain closed unless external review identifies a concrete mathematical/source issue requiring a new bounded disposition.
- Presentation changes are also closed for the external-review copy unless the review itself identifies a reason to reopen them.
- The Owner may distribute the fixed PDF for external review.
- Do not mark PR #9 ready, merge, release, upload to arXiv, submit to a journal, or make DOI/publication changes without a new contemporaneous Owner disposition.

## Current state

```text
[CLEAN AUGUST MATHEMATICS — INDEPENDENT PASS]
[BOUNDED SOURCE RE-CHECK PASS]
[EXTERNAL-REVIEW PRESENTATION FIXED]
[ETbb / NewTX / NUMERIC / UNICODE INSCRIPTION]
[33-PAGE PDF ENGINEERING PASS]
[EXTERNAL REVIEW AUTHORIZED]
[OLD ARXIV PACKET SUPERSEDED]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO PUBLICATION SUBMISSION YET]
```
