# arXiv checklist — Erdős 306 manuscript v1

## Release and proof authority

- [x] Manuscript is anchored to `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`.
- [x] DOI is exactly `10.5281/zenodo.20767390`.
- [x] Manuscript v1 is distinguished from software v0.0.3.
- [x] Frozen development ref `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff` is treated as context only.
- [x] No Lean source, release ref, tag, DOI, or software release was modified.
- [x] Exact released theorem statement is reproduced in `LEAN_CORRESPONDENCE.md`.
- [x] Exact released axiom audit is reproduced in `LEAN_CORRESPONDENCE.md`.
- [x] Structural PNT/Mertens development is not described as a released axiom or proved release consequence.

## Mathematical exposition

- [x] Exact problem and main theorem stated.
- [x] Formal sequence encoding explained.
- [x] `IsSemiprime`, `ω`, and `Ω` conventions explained.
- [x] Necessity of a squarefree reduced denominator explained.
- [x] Avoiding representations and numerator induction explained.
- [x] Separate reductions for `b = 1` and `b = 2` explained.
- [x] Dyadic prime blocks and common period explained.
- [x] Distinctness and semiprimality of control, mass, and gadget edges explained.
- [x] Reciprocal-load window and common Bernoulli weight explained.
- [x] Exact finite Fourier identity explained.
- [x] Main-arc Taylor/Gaussian mechanism explained.
- [x] Block-minor global-control mechanism explained.
- [x] Extra-minor CRT/gadget mechanism explained.
- [x] Both substantive roles of squarefreeness distinguished.
- [x] Parameter-selection order and positivity conclusion explained.
- [x] No shorter elementary proof invented.
- [x] Proof ledger records compressed numerical subarguments rather than hiding them.

## Rosser–Schoenfeld inputs

- [x] Bibliographic metadata and DOI verified.
- [x] Input 1 stated exactly as released:
  Corollary 3, equation (3.8), p. 69.
- [x] Input 2 stated exactly as released:
  Theorem 5, equations (3.17)–(3.18), p. 70.
- [x] Same constant `B` retained in the two Theorem 5 inequalities.
- [x] Exact Lean declaration names and module recorded.
- [x] Downstream use of input 1 identified: dyadic prime density and prime supply.
- [x] Downstream use of input 2 identified: cumulative reciprocal-prime mass and semiprime pair-pool load.
- [ ] **Pre-submission visual check:** compare the two displayed statements directly with the publisher scan on pp. 69–70. Automated Project Euclid access was blocked during this work unit; do not mark this item complete without a human-visible scan.

## Bibliography

- [x] `references.bib` contains only entries with checked metadata and direct relevance.
- [x] Rosser–Schoenfeld article entry includes volume, issue, pages, year, and DOI.
- [x] Archived software release entry includes version, commit, and DOI.
- [x] Formal Conjectures article entry matches arXiv metadata.
- [x] Erdős–Graham book title, authors, publisher, and year checked.
- [x] No unresolved citation was inserted as a fabricated BibTeX entry.
- [ ] Run final BibTeX style/diacritic review after title and author decisions.

## Build and source package

- [x] `main.tex` uses ordinary arXiv-compatible packages.
- [x] No shell escape, minted, external figure, custom font, or generated binary is required.
- [x] Bibliography file is local.
- [x] Source contains no absolute local paths.
- [x] Draft compiles locally with the available TeX toolchain, or otherwise receives a syntax-only fallback check recorded in the handoff.
- [ ] Re-run `pdflatex`, `bibtex`, `pdflatex`, `pdflatex` in the final submission environment.
- [x] Inspect rendered 11-page PDF for overfull boxes, broken URLs, and page-break defects; local compile log is warning-free.
- [x] Confirm branch diff contains exactly the six intended `paper/` source files and no other changes.

## Reproducibility

- [x] Released Lean/Mathlib versions stated.
- [x] Released build and audit commands stated.
- [x] Immutable commit and DOI stated in manuscript.
- [x] Article/release/future-refactor relationship stated.
- [ ] Independently rerun `lake build` and `lake env lean RequestProject/Audit.lean` from a clean checkout immediately before submission.
- [ ] Archive build log or CI link selected by the author.

## Authorship, title, disclosure, and metadata

- [ ] Author confirms final paper title.
- [ ] Author confirms author list and order.
- [ ] Author confirms affiliation and contact email.
- [ ] Author confirms ORCID display.
- [ ] Author approves AI-assistance disclosure.
- [ ] Author chooses arXiv primary and secondary classifications.
- [ ] Author writes or approves arXiv comments field, including release DOI if desired.
- [ ] Author decides whether to mention problem-page discussion or acknowledgements.
- [ ] Director confirms novelty/priority wording.
- [ ] Director confirms whether the publisher-scan check is a hard submission gate.

## Submission and review status

- [x] Draft does not claim peer review.
- [x] Draft does not claim independent human verification.
- [x] Draft does not claim arXiv submission.
- [x] Draft does not claim a journal acceptance or publication.
- [x] Draft uses conservative release-evidenced priority language.
- [ ] Obtain author approval before any arXiv submission.
- [ ] Do not submit from this bounded workstream.
