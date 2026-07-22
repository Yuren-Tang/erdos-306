# Erdős 306 arXiv checklist

> Repository-only control record. This file is excluded from the public arXiv source package.

Task: `E306-P1-REV3`  
Branch: `paper/arxiv-v1-revision-v3`  
Exact base: `6c708c08192cc6730cb9fa806310f662f2cf0eed`

## Current classification

**EDITORIAL NORMALIZATION COMPLETE / AWAITING DIRECTOR RECEPTION AND PORTFOLIO OWNER SUBSTANTIVE REVIEW / NOT SUBMISSION-READY.**

## Editorial normalization

- [x] Abstract shortened to a conventional theorem-and-method summary.
- [x] Standard introduction added, with historical context, theorem, elementary reductions, and proof overview.
- [x] Table of contents removed.
- [x] Engineering-dossier diction removed from headings, transitions, and theorem names.
- [x] Major/minor-arc, auxiliary-denominator, and completion terminology normalized.
- [x] Lean-specific dummy-anchor/tuple section removed from the mathematical body.
- [x] The formal tuple encoding is confined to one sentence in the unnumbered code-availability note and is identified as representational only.
- [x] Historical context moved to the introduction; code availability and disclosure moved to unnumbered end matter.
- [x] No load-bearing theorem, hypothesis, estimate, constant, parameter order, or proof implication was removed or weakened.

## Public source hygiene

- [x] Public source consists only of `main.tex`, `references.bib`, and eleven semantic files under `sections/`.
- [x] Tiny wrapper/include files from REV2 were consolidated and removed.
- [x] Unused packages, macros, and theorem environments were removed.
- [x] PDF title and author metadata are set.
- [x] BibTeX fields and notes are normalized without changing the canonical formalization DOI `10.5281/zenodo.20767389`.
- [x] No GitHub SHA/branch, workstream, checkpoint, workflow, internal review, Lean declaration inventory, or former DOI appears in the public source.
- [x] Repository-only control records are excluded from the public package.

## Mathematics and sources

- [x] Exact theorem, necessity, semiprime criterion, and avoiding reductions retained.
- [x] PNT/Abel local law, common threshold, and inclusive endpoint retained.
- [x] Finite Fourier identity and all control, level-set, tail, mass, major/minor, auxiliary-prime, and completion estimates retained.
- [x] All constants `21/20`, `1000001`, `501`, `2004`, and the dependency order remain explicit.
- [x] All eight bibliography entries are cited exactly once or more; no citation key is missing and no entry is unused.
- [ ] Human publisher-scan comparison of Rosser-Schoenfeld pp. 69-70.
- [ ] Final source-package and bibliography audit after Owner review.

## Validation

The final `[RETURN E306-P1-REV3]` records the exact source blob manifest, clean TeX/BibTeX passes, citation/reference audit, PDF hash/page count, 200-dpi full-page visual inspection, and exact base-to-tip path/history audit.

## Remaining author and submission decisions

- [ ] Final author-name form, affiliation, public email, and ORCID display.
- [ ] Final acknowledgement and AI-assistance wording.
- [ ] arXiv categories, comments, licence, and package metadata.
- [ ] Portfolio Owner approval.
- [ ] E306-DIR submission authorization.

Completion of this checklist authorizes no merge, release, tag, DOI mutation, default-branch movement, source upload, arXiv submission, or publication action.
