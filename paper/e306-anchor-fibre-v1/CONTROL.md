# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **arXiv-v1 state:** mathematically and editorially ready; exact source frozen and clean-built. The Owner must perform the arXiv submission/endorsement interaction if required.
- **Journal state:** no journal submission, merge, tag, release, DOI mutation, or external contact is authorized by this file.

## Exact arXiv-v1 manuscript source

```text
d21c612be5c3534b3b2b40361c4a861f40969565
```

The manuscript workflow freezes `main.tex`, `references.bib`, and `sections/` against this exact source. Later branch commits may change only workflow/control/review/submission records unless a new Owner disposition explicitly reopens the manuscript.

The fixed object that received the latest independent no-background mathematical review was

```text
8024ff325f454e1fc52c280ac65bab0c48315e96.
```

The reviewer cross-read TeX/PDF/bibliography, independently rebuilt the paper, and adversarially checked the load-bearing Sections 4--6 cone. No fatal mathematical objection was found. The review is recorded and disposed in `CURRENT_OBJECT_INDEPENDENT_REVIEW_DISPOSITION_2026-08-09.md`.

The arXiv-v1 source differs from that reviewed object only by bounded editorial changes:

1. a short logic roadmap at the start of Section 4;
2. explicit original-support avoidance in the common-proper-refinement remark;
3. addition/citation of the Bloom--Elsholtz broad Egyptian-fractions survey;
4. a tightened abstract.

No theorem, quantifier, mathematical construction, displayed formula, estimate, proof range, or visible equation number was changed in these v1 microrepairs.

## Theorem package

1. **Squarefree-denominator characterization with arbitrary finite avoidance.** A reduced positive rational is a finite sum of reciprocals of pairwise distinct squarefree semiprimes iff its denominator is squarefree.
2. **Direct proper-target theorem.** For reduced `t=a/b in (0,1)` with squarefree `b` and fixed `gamma>1` satisfying `t < (log gamma)^2/2 < 1`, the target-adapted sparse-sensor family represents `t` for all sufficiently large `X`.
3. **Compact-uniform local Gaussian profile.** The Bernoulli-weighted exact coefficients of the same family have the stated Gaussian profile on every fixed standardized target window.
4. **Multiplicity and entropy.** With `alpha=2t/(log gamma)^2`, the mesoscopic typical-cardinality window contains at least `exp([H(alpha)-o(1)]M_X)` exact representations; the total exact fibre and some exact cardinality inherit the same lower bound. For `0<t<1/2`, a distinguished `gamma` gives full binary entropy rate `log 2` per available denominator.
5. **Prime-dilution closure.** Arbitrary positive squarefree-denominator rationals follow from finitely many pairwise disjoint proper-target representations obtained by finite avoidance.

The paper does not claim growing standardized windows, a bivariate/prescribed-cardinality local limit, a matching global exact-fibre upper bound, deletion resilience, or a full abstract AFT theorem.

## Latest independent review disposition

The latest reader's central mathematical assessment is accepted: the current sparse-target `gamma>1` architecture has no identified fatal gap and is mature for arXiv v1. In particular the reader independently concentrated on the intended risk order `Section 4 > Section 5 > Section 6`.

Three substantive suggestions are deferred rather than inserted immediately before v1:

- `K_* = C log Z` sensors are plausible with sufficiently large fixed `C`, but the review's phrase “superpolynomially small” is literally incorrect at that scale: `exp(-c C log Z)=Z^{-cC}`. A fixed sufficiently large power should plausibly beat the finitely many polynomial losses, but that bookkeeping is a new theorem-strengthening and remains for later verification.
- the full entropy-rate supremum for `t >= 1/2` is mathematically natural but not needed for v1;
- joint local laws, growing windows, universal sensors, structured-prime variants, and a stronger abstract finite-Fourier theorem remain later research directions.

Manual visible equation tags are retained for v1; semantic LaTeX labels/hyperlinks are already real and machine-checked. Removing the stable visible tags is journal-stage source maintenance, not a v1 gate.

## Presentation profile

- British English with Oxford spelling;
- `amsart`, A4, 11 pt, `reqno`;
- ETbb OpenType body, NewTX mathematics;
- XeLaTeX;
- numeric `biblatex`/Biber citations sorted `nyt`;
- bibliography in `\small`;
- no affiliation or email;
- compact linked ORCID;
- exact dedication:
  ```text
  ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ
  ΚΑΙ ΟΙΣ ΦΙΛΩ
  ```
- dedication-only STIX Two Text Medium, upright, 10.5/16 pt, `LetterSpace=9`, 8 pt above and 12 pt below;
- concise generative-AI disclosure.

`ΟΙΣ` is deliberate under classical relative attraction. The current STIX Medium setting is retained for v1. A future Gentium Book Medium comparison is a permissible typography-only experiment, not a publication blocker.

## Equation-reference surface

- 190 explicit visible equation tags;
- 190 unique equation labels, one per tagged display;
- 94 equation references;
- ordinary LaTeX/hyperref navigation;
- no global `\eqref` override;
- no bare numeric `\eqref{n.m}` calls.

The workflow rejects duplicate tags/labels, missing targets, multiple labels on one tagged display, legacy numeric references, and leaked internal labels.

## Clean arXiv-v1 build

GitHub Actions run

```text
31326307200
```

(run number 213) on execution head

```text
802df0a52461948bf6613156ca7cd899f27a0d8d
```

clean-built exact manuscript source `d21c612...` and passed all configured gates:

- exact source freeze;
- Oxford-spelling guard;
- sparse-target / `gamma>1` theorem-surface guard;
- semantic equation-reference guard;
- clean XeLaTeX/Biber build;
- no unresolved or multiply defined references/citations/labels;
- no missing glyphs;
- no overfull hbox;
- Biber warning/error gate;
- all fonts embedded and no Type 3;
- STIX Two Text Medium present and embedded;
- exact Unicode extraction of both Greek dedication lines, ORCID, and `Erdős`;
- internal-label leak gate;
- PDF artifact `9041654586`.

Artifact digest:

```text
sha256:1e6061a01b4e25eba8a5f7fe57c7e7cf6279a768a0eea5d586e5e8f59bed35b6
```

The rendered PDF is **36 A4 pages**. Page 36 contains only the final three bibliography entries. We deliberately do not compress mathematical prose or bibliography typography merely to restore the former 35-page profile; any venue-specific one-page compression is deferred to a journal version if needed.

## arXiv-v1 submission profile

- **Primary category:** `math.NT`.
- Upload TeX source, not only the locally generated PDF.
- Preserve the `sections/` directory because the manuscript uses relative `\input{sections/...}` paths.
- Include `main.tex`, `references.bib`, and the required `sections/*.tex` files; do not include build products or project-control files.
- Do **not** upload font binaries: all required ETbb and STIX Two files are available in arXiv's TeX Live environment and are referenced by filename.
- Use XeLaTeX with Biber/biblatex processing.
- Inspect the PDF generated by arXiv before completing submission.
- If arXiv requests endorsement for this account/category, follow the endorsement workflow; endorsement is a category/community gate, not peer review.

## Current assurance state

```text
[CURRENT SPARSE-TARGET OBJECT INDEPENDENTLY HOSTILE-REVIEWED: NO FATAL OBJECTION]
[FOCUSED GAMMA>1 DEPENDENCY-CONE REVIEW CLOSED]
[ARXIV-V1 SOURCE d21c612be5c3534b3b2b40361c4a861f40969565]
[CLEAN BUILD PASS — ACTION 31326307200 / RUN 213]
[36-PAGE A4 ARXIV-V1 CANDIDATE]
[DEDICATION: STIX TWO TEXT MEDIUM / LETTERSPACE 9]
[ARXIV V1 READY]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO JOURNAL SUBMISSION OR MERGE AUTHORIZED]
```
