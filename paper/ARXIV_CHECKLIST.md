# Erdős 306 arXiv checklist

Workstream: `E306-P1-RECOVERY`

Recovery base: `paper/arxiv-v1@c264d00a722364c777d89e4438aadc7babfcdbe0`

Successor: `paper/arxiv-v1-recovery-v1`

## Overall decision

**FAIL - NOT YET SUBMISSION-READY.**

The clean recovery may be complete while independent review, formal-companion evidence, author decisions, and explicit submission authorization remain open.

## Mathematical manuscript

- [x] Exact theorem and necessity direction.
- [x] Avoiding representation and arbitrary-numerator reduction.
- [x] PNT is the sole load-bearing paper-level analytic theorem.
- [x] A self-contained partial-summation proof gives `A_k=1/k+o(1/k)`.
- [x] The local law gives eventual dyadic cardinality.
- [x] The local law gives eventual inclusive-window mass at least `21/20`.
- [x] The inclusive endpoint is `[2^{k_0},2^{3k_0+1})`.
- [x] The construction remains constant-first/scale-last.
- [x] Finite spectral selection, control partition, mass pool, main arcs, block-minor fibre, squarefree reservoir, and terminal budget are present.
- [ ] Independent audit of the PNT bridge.
- [ ] Independent review of global control and terminal construction estimates.

## Sources and bibliography

- [x] Soundararajan modern PNT locator.
- [x] Ingham, Theorem 23, standard monograph locator.
- [x] Hadamard historical PNT source.
- [x] Rosser--Schoenfeld retained only for formal-release correspondence.
- [x] Mertens classified as historical/background rather than the local backend.
- [ ] Independent source audit in the final source package.
- [ ] Publisher-scan comparison of Rosser--Schoenfeld pp. 69--70.

## Formal verification and versioning

- [x] Immutable evidence identified as `v0.0.3@4582185...` and DOI `10.5281/zenodo.20767390`.
- [x] Exact released five-item audit stated.
- [x] Paper PNT backend separated from released Rosser--Schoenfeld backend.
- [x] Frozen checkpoint described as unreleased context.
- [x] No claim that the PNT bridge is formalized by the project.
- [ ] Frozen-checkpoint verification and disposition complete.
- [ ] Final companion-code relation settled.

## TeX and clean-source validation

- [x] `pdflatex`, `bibtex8`, and two final `pdflatex` passes succeed.
- [x] No undefined citations or references.
- [x] No LaTeX errors, missing glyphs, or overfull/underfull boxes.
- [x] The 14-page PDF was rendered and every page visually inspected.
- [x] Final remote blobs match the locally validated manuscript and synchronized support packet.
- [x] Exact base-to-tip diff contains only the six authorized `paper/` files.
- [ ] Clean arXiv source archive generated and tested.

The source-archive box remains open because submission packaging is outside this recovery.

## Author and submission decisions

- [ ] Final title and author-name form approved.
- [ ] Affiliation, contact email, and ORCID display decided.
- [ ] arXiv categories, comments field, and licence decided.
- [ ] Acknowledgements and exact AI-assistance disclosure approved.
- [ ] Ancillary-file policy decided.
- [ ] Independent mathematical and source reviewers sign off.
- [ ] Portfolio Owner approves final text and metadata.
- [ ] `E306-DIR` explicitly authorizes submission.

No merge, release, DOI mutation, or arXiv submission is authorized by completion of this recovery.
