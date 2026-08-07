# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Lifecycle:** persistent single-product manuscript lane
- **Sole branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **Writer capacity:** one writer at a time
- **Independent audit capacity:** one-off read-only roles with no branch ownership
- **External publication state:** not authorized; internal publication engineering only

A committed control document does not attempt to contain its own commit hash. The exact current branch head is the head of PR `#9`.

## August 2026 supersession and audit closure

On 2026-08-07, issue `#11#issuecomment-5216568870` superseded the July frozen candidate `f03105e95dc2ec5595a931293f6ca951e4bc424a` for future publication preparation and authorized controlled replacement of the manuscript source plus build/visual/publication-engineering gates. The July candidate remains immutable historical evidence, not the current publication candidate.

The clean mathematical source was promoted from

```text
Yuren-Tang/research-workbench@43c205356fe5def721d54206af83928e95338fac
intake/2026-08-07-e306-arxiv-v1/latex/
```

The clean manuscript received the genuinely independent audit `E306-CLEAN-V1-INDEPENDENT-AUDIT-01`. All three public theorem blocks and all five load-bearing interfaces passed mathematically. Four source-only repairs were applied and then independently closed by

```text
[PASS E306-CLEAN-V1-BOUNDED-RECHECK-01]
```

No mathematical repair, theorem restriction, exponent change, or new estimate remains pending.

The post-promotion publication edits in `main.tex`, Section 10, bibliography metadata, build plumbing, and style-profile files are presentation/source-engineering changes only. Mathematical Sections 1–9 remain the independently audited clean source unless a later disposition explicitly states otherwise.

## Public theorem package

The article intentionally has three main mathematical blocks.

1. **Squarefree-denominator characterization with finite avoidance.** A positive reduced rational `a/b` is a finite sum of reciprocals of distinct squarefree semiprimes iff `b` is squarefree; the support can avoid any prescribed finite set.
2. **Local Gaussian profile.** For the direct `Z=X^3` family attached to fixed squarefree `b>=3`, the exact target fibre has a compact-uniform Gaussian local profile on `|j| <= U L_X sigma_X` for every fixed `U`.
3. **Multiplicity and entropy.** The same family has exponentially many exact representations, ambient entropy exponent in a mesoscopic typical-cardinality window, and at least one exact cardinality with that exponent.

The fixed-target local limit is the central value of the local-profile theorem, not a separate proof route.

## Deliberate mathematical scope

The current article does not make the fully abstract anchor–fibre transference theorem, general fixed targets with free parameters, alternative multiblock/sparse proofs, restricted-prime extensions, reciprocal-incidence graph algebra, finite-prefix CRT programmes, growing standardized target radius, or quantitative `b=1,2` transfer load-bearing. These remain outside this paper unless separately disposed.

## Manuscript architecture

The active public manuscript has ten sections:

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

The narrative spine is

```text
arithmetic family
 -> anchor rigidity
 -> row observability / decoding
 -> weighted fibre compression
 -> Gaussian localization
 -> exact representation fibres.
```

Technical Fourier sectors are subordinate proof ranges, not the article's organizing principle.

## Language and presentation control

The controlling project profile is `MANUSCRIPT_STYLE_PROFILE.md` in this directory. Its present decisions include:

- British English with Oxford spelling and philological attention to Greek/Latin-derived vocabulary;
- `amsart`, A4, 11 pt, right equation numbers;
- TeX Gyre Pagella text, NewPX mathematics, Inconsolata monospace;
- XeLaTeX for semantic Unicode handling;
- the Greek dedication in literal Unicode, not LGR/transliteration;
- no institutional affiliation or email in arXiv v1;
- a visible linked ORCID with the author identity;
- concise AI disclosure with no Lean-development claim in this article;
- `biblatex`/Biber with alphabetic pure-mathematics labels and no forced bibliography page break;
- quiet hyperlinks and restrained mathematical-humanist typography.

The portfolio manuscript standard specialized by this profile is recorded at `research-workbench@3b34de193647335c1c8ddfb3974554b76c21bbe5`. At adoption time that general standard was authorially complete but its independent cross-project audit was still pending; it must not be described as fully ratified until that audit is actually closed.

## Working-tree hygiene

The superseded July manuscript sections, Architecture-E wrappers, obsolete proof/architecture ledgers, and draft mathematics files were removed from the current publication branch on 2026-08-07. Their history remains recoverable through Git. The working branch is intentionally the surface of the current paper, not an archive of superseded candidates.

## Source and build surface

- manuscript entry point: `paper/e306-anchor-fibre-v1/manuscript/main.tex`;
- build command: `make clean && make pdf`;
- engine: **XeLaTeX**;
- bibliography backend: **Biber**;
- CI workflow: `.github/workflows/manuscript.yml`;
- active public source consists of `main.tex`, `references.bib`, and the ten files named by the `\input` statements in `main.tex`.

The arXiv source archive must contain only the files required by that build. Internal control/profile files are not part of the submission source.

## Formal Lean axis

The archived Lean release remains an orthogonal existence/priority record. The present analytic manuscript contains no Lean argument and the AI acknowledgement must not imply that Lean development is part of the paper's contents. No manuscript theorem depends on the formal artifact.

## Product rules

- One article, one branch, one draft PR.
- No task-, auditor-, repair-, or revision-specific manuscript branches.
- Mathematical changes after the independent PASS require explicit disposition and appropriate re-audit.
- Pure presentation/build/plumbing repairs may proceed under the August supersession authorization, but must not alter audited mathematics silently.
- Owner approval is required before marking PR `#9` ready, merge, release, DOI action, arXiv upload, journal submission, or external contact.

## Current state

```text
[CLEAN AUGUST V1 CONTROLLING CANDIDATE]
[MATHEMATICAL AUDIT CLOSED]
[BOUNDED SOURCE RE-CHECK PASS]
[SUPERSEDED WORKING FILES REMOVED]
[FINAL STYLE / UNICODE / BIBLIOGRAPHY ENGINEERING IN PROGRESS]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO EXTERNAL PUBLICATION ACTION AUTHORIZED]
```
