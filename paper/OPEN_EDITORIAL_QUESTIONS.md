# Open editorial and publication decisions — Erdős 306 manuscript

This file contains decisions that the bounded manuscript worker must not make unilaterally. Mathematical defects belong in `PROOF_LEDGER.md`; objective submission gates belong in `ARXIV_CHECKLIST.md`.

## 1. Title and framing

1. Retain the descriptive title
   **“Distinct Semiprime Egyptian Fractions for Rationals with Squarefree Denominator”**, or use a shorter theorem-forward title mentioning Erdős Problem 306?
2. Should the subtitle or abstract say “a machine-checked proof” when the paper itself is a paper-level reconstruction and the machine authority is the companion release?
3. Should the structural theorem `D + M → Erdős 306` be advertised in the title/abstract, or remain the internal proof architecture?
4. Should “squarefree semiprime” be introduced immediately, or should the title say “products of two distinct primes” for broader accessibility?

## 2. Author identity and metadata

1. Exact author line, affiliation, postal address, email, and ORCID.
2. Whether to list the Zenodo DOI in the abstract, footnote, data/code statement, or only bibliography.
3. arXiv primary and secondary categories. Plausible candidates require author/Director decision; this worker does not select them.
4. Exact comments field: page count, companion Lean release, and machine-checking qualification.
5. License for arXiv and source repository.

## 3. Abstract and claim hierarchy

1. Preferred balance among:
   - the characterization theorem;
   - the structural analytic conditions;
   - the finite spectral/circle-method mechanism;
   - the machine-checked companion release.
2. Whether the abstract should name Rosser–Schoenfeld or say only “two explicit prime estimates.”
3. Whether to say the proof is “constructive in the existential sense.” The current proof selects finite objects noncomputably and is not an efficient algorithm.
4. Whether to mention the frozen refactor at all in the public paper. Recommendation: keep it out of the reader-facing narrative and cite it only in reproducibility notes if a stable public ref is desired.

## 4. Structural theorem presentation

1. Should conditions `D` and `M` be numbered as hypotheses, a named “dyadic supply package,” or two separate propositions?
2. Should the paper emphasize that many analytic backends could prove `D` and `M`, while the present formal backend is Rosser–Schoenfeld?
3. Is the historical Mertens 1874 reference useful as context, or should it be removed because it is not a direct proof input?
4. Should a future version formulate a more general abstract theorem with arbitrary block scales or constants? Recommendation: not in arXiv v1 unless it materially shortens the proof or broadens the theorem.

## 5. Global-control exposition

1. The current revision gives a complete logical chain but compresses the single-block CRT decoding and entropy bookkeeping into explicit mechanism proofs. Does arXiv v1 require a longer technical appendix with every local constant and finite encoding map?
2. Should hot blocks, boundary blocks, shells, and cold labels be illustrated by a diagram? A figure could help but is not necessary for correctness.
3. Should the exact functions `R_k`, `Π_k`, and the block admissibility ranges be printed, or left as internally proved forcing scales with exact formal counterparts in the correspondence file?
4. Should the global-control theorem be promoted as an independent analytic/combinatorial result? Recommendation: no independent novelty claim until literature comparison and independent review.
5. Independent reviewer assignment for:
   - cold-block decoding;
   - boundary mismatch penalty;
   - level-set entropy aggregation;
   - floor absorption quantifier order;
   - diagonal Gaussian tail.

## 6. Block-minor and reservoir exposition

1. Should the block-minor proof use only the transparent `b`-to-1 fiber count, or retain the stronger `Qextra` fiber-tail formulation in the main text? Current revision states both, with the stronger form motivating the reindexing.
2. Should the exact count `b(2N+1)` be kept in the main text or moved to an appendix?
3. Should the reservoir edges be called “gadgets,” “denominator reservoirs,” or “CRT damping edges”? Current recommendation: reader-facing text uses “denominator-sensitive reservoir”; correspondence may retain formal “gadget” names.
4. Should the squarefree CRT use be highlighted in the introduction as a second, genuinely structural use of squarefreeness? Current recommendation: yes.
5. Independent reviewer assignment for the residue-offset Bernoulli bound and the monotonic worst-case replacement `r≤b`.

## 7. Parameter and constant policy

1. Retain the explicit equal-quarter budget allocation, or state a qualitative small-constant hierarchy and put the exact allocation in an appendix?
2. Keep the constants `16/9`, `21/20`, `3/(2b)`, `3/b`, and the explicit `c3`; these are structurally useful and already retained.
3. Decide whether to print the formal witness `k1=20` for the reciprocal-window backend in the theorem statement or only in the proof.
4. Decide whether exact formal threshold names should appear in a supplementary table. Recommendation: correspondence file only, unless independent review requests them.

## 8. Formalization and reproducibility wording

1. Exact phrase for the relationship between paper and software. Suggested wording:
   > “The immutable release v0.0.3 is the current machine-checked proof evidence; the article gives a self-contained mathematical reconstruction organized by a later, non-authoritative refactor.”
2. Whether to cite the frozen `codex/pushlinter` commit publicly. It is useful for architecture provenance but not necessary for theorem trust.
3. Whether arXiv v1 should wait for a future cleaned formal release. This is an author/Director publication-mode decision, not a mathematical necessity if the paper proof receives independent review.
4. Whether to include the exact five-item axiom audit in the abstract, introduction, trust section, or only a reproducibility appendix.
5. A fresh release build/audit log is still required for submission packaging. Do not wake/query the quota-exhausted L1 worker under the current restriction.

## 9. Source verification

1. Final visual comparison of the Lean transcription with the publisher scan:
   - Corollary 3, equation (3.8), p. 69;
   - Theorem 5, equations (3.17)–(3.18), p. 70.
2. Whether to quote the original Rosser–Schoenfeld notation or retain modern prime-counting notation.
3. Verify whether the historical Erdős–Graham book is the preferred primary problem citation and whether a problem-number source should be added.
4. Complete novelty/literature search for:
   - semiprime Egyptian fractions;
   - weighted subset-sum circle methods with CRT block control;
   - related solutions or announcements for Erdős Problem 306.
5. No priority language stronger than public repository/DOI evidence until this search is complete.

## 10. AI assistance and acknowledgements

1. Exact disclosure of AI roles in:
   - mathematical exploration;
   - Lean proof development;
   - remote review and architecture refactoring;
   - manuscript drafting and source control.
2. Whether to name individual systems/models and versions, or use a technology-neutral statement.
3. Contributor acknowledgements, including any independent mathematical reviewers and software reviewers.
4. Responsibility statement: the author retains responsibility for claims, sources, and final text.
5. Whether to include an explicit human-verification statement for the paper proof after independent review.

## 11. Submission decision checklist for the author/Director

Before authorizing arXiv submission, record durable decisions on:

- [ ] final title;
- [ ] author/affiliation/ORCID/email;
- [ ] abstract emphasis;
- [ ] publication mode relative to future formal refactor verification;
- [ ] AI disclosure and acknowledgements;
- [ ] independent proof reviewers and resolved reports;
- [ ] publisher-scan comparison;
- [ ] arXiv categories, comments, license;
- [ ] final source archive and release citation;
- [ ] E306-DIR approval to submit.

No item in this file authorizes a merge, release, DOI change, or arXiv submission.
