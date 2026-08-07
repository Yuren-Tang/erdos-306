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

## August 2026 supersession

On 2026-08-07, issue `#11#issuecomment-5216568870` superseded the July frozen candidate `f03105e95dc2ec5595a931293f6ca951e4bc424a` for future publication preparation and authorized controlled replacement of the manuscript source plus build/visual/publication-engineering gates.

The July candidate remains immutable historical evidence. It is not the current publication candidate.

The controlling clean source was promoted from exactly

```text
Yuren-Tang/research-workbench@43c205356fe5def721d54206af83928e95338fac
intake/2026-08-07-e306-arxiv-v1/latex/
```

The active manuscript files on this branch were checked by Git blob identity against that audited source. The promotion itself introduced no manuscript-text change.

## Mathematical audit boundary

### Direct one-anchor proof

Primary proof source:

```text
Yuren-Tang/erdos-306@07ed8dcaff334ba9da4b9c87337455c2eca25002
proof-development/ONE-ANCHOR-HUMAN-PROOF.md
```

Independent route audit:

```text
1d63273ede93e1b83abf1ab9073d91b76600c23c
PASS / GENUINE STRICT SIMPLIFICATION
```

### Clean-v1 whole-manuscript audit

The August clean manuscript received a genuinely independent mathematical/source audit:

```text
E306-CLEAN-V1-INDEPENDENT-AUDIT-01
```

Verdict: all three public theorem blocks and all five load-bearing interfaces passed mathematically; four source-only repairs were requested.

Those four repairs were applied at the controlling research-workbench source above and independently re-checked:

```text
[PASS E306-CLEAN-V1-BOUNDED-RECHECK-01]
```

No mathematical repair, theorem restriction, exponent change, or new estimate remains pending.

### Formal Lean axis

The archived Lean release remains an orthogonal existence/priority record. The present analytic manuscript is not a line-by-line formalization and does not inherit human-proof assurance from Lean or vice versa.

## Public theorem package

The article intentionally has three main mathematical blocks.

1. **Squarefree-denominator characterization with finite avoidance.** A positive reduced rational `a/b` is a finite sum of reciprocals of distinct squarefree semiprimes iff `b` is squarefree; the support can avoid any prescribed finite set.
2. **Local Gaussian profile.** For the direct `Z=X^3` family attached to fixed squarefree `b>=3`, the exact target fibre has a compact-uniform Gaussian local profile on `|j| <= U L_X sigma_X` for every fixed `U`.
3. **Multiplicity and entropy.** The same family has exponentially many exact representations, ambient entropy exponent in a mesoscopic typical-cardinality window, and at least one exact cardinality with that exponent.

The fixed-target local limit is the central value of the local-profile theorem, not a separate proof route.

## Deliberate scope exclusions

The current article does **not** make any of the following load-bearing or claim them as part of v1:

- the fully abstract anchor--fibre transference theorem;
- general fixed targets `t` with free `gamma,eta` parameters;
- the multiblock or sparse-sensor proof as a second full proof;
- restricted-prime/AP/Chebotarev extensions;
- reciprocal-incidence graph algebra;
- thin-sensor/GFF/end-point programmes;
- finite-prefix CRT programmes;
- a growing standardized moving-target radius `U_X -> infinity`;
- quantitative transfer to denominators `b=1,2`.

These remain separate research/publication reserves rather than material to be consumed in this first paper.

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
10. Scope, limitations, and further directions.

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

## Source and build surface

- manuscript entry point: `paper/e306-anchor-fibre-v1/manuscript/main.tex`;
- build command: `make clean && make pdf`;
- bibliography backend: **BibTeX**;
- CI workflow: `.github/workflows/manuscript.yml`;
- active public source consists of `main.tex`, `references.bib`, and the ten files named by the `\input` statements in `main.tex`.

Files left in `manuscript/sections/` from the July candidate are historical branch artifacts only. They are not active source and must not be included in a minimal arXiv source archive unless explicitly referenced by the current `main.tex`.

Actual TeX/BibTeX, reference/label, font/glyph, extraction, PDF visual, and arXiv-portability evidence must come from post-promotion build gates; no pre-August 42-page forensic build evidence transfers to the clean manuscript.

## Legacy-control boundary

Control and architecture documents created before the 2026-08-07 supersession describe earlier manuscript candidates. In particular, older versions of `ARTICLE_ARCHITECTURE.md`, `THEOREM_DAG.md`, `PROOF_OBLIGATION_LEDGER.md`, and `PROOF_CHANGE_LEDGER.md` are retained as historical process evidence but are **noncontrolling for the clean August manuscript unless this file or a later dated disposition explicitly imports a statement from them**.

This rule prevents stale Architecture-E, general-parameter, Biber, or old publication-freeze statements from silently governing the clean candidate.

## Product rules

- One article, one branch, one draft PR.
- No task-, auditor-, repair-, or revision-specific manuscript branches.
- Mathematical changes after the independent PASS require explicit disposition and appropriate re-audit.
- Pure build/plumbing repairs may proceed under the August supersession authorization, but must not alter audited mathematics silently.
- Owner approval is required before marking PR `#9` ready, merge, release, DOI action, licence selection, arXiv upload, journal submission, or external contact.

## Current state

```text
[CLEAN AUGUST V1 CONTROLLING CANDIDATE]
[MATHEMATICAL AUDIT CLOSED]
[BOUNDED SOURCE RE-CHECK PASS]
[AUDITED SOURCE PROMOTED BYTE-FOR-BYTE]
[PUBLICATION ENGINEERING IN PROGRESS]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO EXTERNAL PUBLICATION ACTION AUTHORIZED]
```
