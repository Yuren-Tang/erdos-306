# Erdős 306 arXiv checklist

Workstream: `E306-P1-01`  
Current revision base: `paper/arxiv-v1@c264d00a722364c777d89e4438aadc7babfcdbe0`  
Decision standard: no item is marked complete merely because a related Lean declaration, review note, or draft sentence exists.

## Overall decision

**FAIL — NOT YET SUBMISSION-READY.**

The bounded manuscript revision can be complete while submission remains unauthorized. The paper now has the Director-approved analytic architecture, but independent mathematical review, formal-companion evidence, author decisions, and explicit submission authorization remain open.

## 1. Mathematical manuscript

- [x] Exact Erdős 306 statement and necessity direction.
- [x] Avoiding representation and arbitrary-numerator reduction.
- [x] PNT is the sole load-bearing paper-level analytic theorem.
- [x] A self-contained Abel/partial-summation proof derives the local law
  `A_k=1/k+o(1/k)`.
- [x] The local law derives eventual dyadic cardinality.
- [x] The local law derives eventual inclusive-window reciprocal mass `≥21/20`.
- [x] Fixed `k≥5` and witness `20` are no longer presented as paper-construction assumptions.
- [x] The inclusive block endpoint is stated correctly as `[2^{k_0},2^{3k_0+1})`.
- [x] The construction remains constant-first/scale-last; no second construction rewrite was introduced.
- [x] Finite spectral selection and no-wrap conversion are stated.
- [x] Global-control partition is isolated through cold blocks, mismatch energy, level-set counting, localization, high-floor absorption, and diagonal Gaussian tail.
- [x] Block-minor reindexing includes the exact fiber factor `b`.
- [x] Squarefree CRT mismatch and multi-reservoir damping are isolated.
- [x] Terminal parameter order and the single minor-versus-main budget are explicit.
- [ ] Independent mathematical review of the global-control chain.
- [ ] Independent mathematical review of the main-arc Taylor/Gaussian constants.
- [ ] Independent mathematical review of the block-minor transfer.
- [ ] Independent mathematical review of the CRT reservoir damping.
- [ ] Independent mathematical review of terminal parameter compatibility.
- [ ] Independent check of the PNT partial-summation bridge and endpoint conventions.

## 2. Source and bibliography

- [x] Direct modern PNT locator: Soundararajan (2006), Lecture 1, opening paragraph, p. 1.
- [x] Standard monograph PNT locator: Ingham, Theorem 23.
- [x] Optional historical PNT source: Hadamard (1896), with verified DOI.
- [x] Rosser--Schoenfeld citation retained only for the current formal/release backend.
- [x] Mertens (1874) classified as historical/background, not the local block backend.
- [x] Bibliography distinguishes theorem source, historical source, formal source, software release, benchmark, and problem source.
- [x] The supplied reference note was used only as a discovery lead and was not added as a publication source or repository artifact.
- [ ] Independent source audit of Soundararajan and Ingham locators in the final source package.
- [ ] Human-visible publisher-scan comparison of Rosser--Schoenfeld pp. 69--70 against the released axiom transcriptions.
- [ ] Final bibliography normalization against arXiv packaging rules.

## 3. Formal verification and versioning

- [x] Immutable evidence identified as `v0.0.3@4582185...`, DOI `10.5281/zenodo.20767390`.
- [x] Exact released five-item axiom audit is stated.
- [x] The paper PNT backend is explicitly separated from the released Rosser--Schoenfeld backend.
- [x] `codex/pushlinter@e55ef359...` is identified as unreleased architecture context, not proof authority.
- [x] The paper does not claim that PNT or the partial-summation bridge is formalized by this project.
- [x] The paper's eventual interfaces are not described as edits to the frozen Lean axioms.
- [ ] Detached exact-tip verification of `e55ef359...` completed and dispositioned.
- [ ] Any required frozen-tip source repairs completed under separate authorization.
- [ ] Final companion-code relation updated after formal evidence is settled.

## 4. TeX and source-package validation

- [x] `pdflatex` first pass succeeds.
- [x] `bibtex8` succeeds.
- [x] Two final `pdflatex` passes succeed.
- [x] No undefined references or citations.
- [x] No LaTeX errors or missing glyph warnings.
- [x] No overfull or underfull boxes in the final log.
- [x] PDF opens, is unencrypted, and is text-based rather than scanned.
- [x] All 17 pages rendered and visually inspected for clipping, overlap, broken glyphs, and bad page breaks.
- [ ] Final remote blobs match the locally validated six source files.
- [ ] Exact base-to-tip diff contains only the six authorized `paper/` files.
- [ ] arXiv source archive generated and tested in a clean directory.

These boxes are intentionally left open until the final validation and push are complete. The return comment must record the actual result rather than retroactively assuming it.

## 5. Title, authorship, and metadata

- [ ] Final title approved by the author.
- [ ] Final author name form approved.
- [ ] Affiliation wording decided.
- [ ] Contact email display decided.
- [ ] ORCID display decided.
- [ ] arXiv primary and secondary categories decided.
- [ ] arXiv comments field decided.
- [ ] Licence selected.
- [ ] Acknowledgements finalized.
- [ ] Historical problem-page / benchmark attribution wording finalized.

## 6. AI assistance and disclosure

- [x] Manuscript contains conservative responsibility wording.
- [ ] Exact AI-assistance disclosure approved by the author.
- [ ] Acknowledgement versus disclosure placement decided.
- [ ] Any journal- or arXiv-specific disclosure requirements checked at submission time.

## 7. Ancillary and reproducibility files

- [x] `PROOF_LEDGER.md` synchronized with the PNT backend.
- [x] `LEAN_CORRESPONDENCE.md` separates paper, frozen, and released layers.
- [x] `OPEN_EDITORIAL_QUESTIONS.md` contains only retained author/publication decisions.
- [ ] Decide whether the ledger and correspondence ship as ancillary files, appendices, or repository-only review material.
- [ ] Decide whether a compiled PDF is stored outside arXiv source control.
- [ ] Final public software links and version language checked after formal disposition.

## 8. Review and authorization

- [ ] P1 revised packet accepted by `E306-DIR`.
- [ ] Independent mathematical reviewer signs off on the load-bearing construction.
- [ ] Source and bibliography reviewer signs off.
- [ ] Formal-companion verification/source gates close or are accurately disclosed.
- [ ] Portfolio Owner, acting as author, approves the final text and metadata.
- [ ] `E306-DIR` explicitly authorizes arXiv submission.

No merge, release, DOI mutation, or arXiv submission is authorized by completion of this checklist revision alone.
