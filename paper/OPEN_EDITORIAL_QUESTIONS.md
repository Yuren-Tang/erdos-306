# Open editorial questions — manuscript v1

These questions require an author or Director decision. None changes the released proof authority.

## Author decisions

1. **Title.** The draft uses:
   `Distinct Semiprime Egyptian Fractions for Rationals with Squarefree Denominator`.
   Confirm, replace, or add the historical label “Erdős Problem 306”.

2. **Authorship.** The draft currently names `Yuren Tang`, matching `CITATION.cff`.
   Confirm the author list, order, contribution threshold, and whether any formalization
   collaborators should be acknowledged rather than listed as authors.

3. **Affiliation and contact.** Supply the final affiliation, postal address if desired,
   email, and ORCID presentation.

4. **AI-assistance disclosure.** Approve exact wording. The present draft says only that
   AI-assisted theorem-proving and software-engineering workflows were used. The release
   README contains more specific model/tool information; decide how much belongs in the
   article, acknowledgements, or an ancillary statement.

5. **Abstract emphasis.** Decide whether the abstract should lead with the mathematical
   theorem, the machine-checked status, or the resolution of the numbered problem.

6. **Classification.** Choose arXiv primary/secondary classes. Plausible candidates are
   `math.NT`, `math.CO`, and `cs.LO`, but this workstream does not decide among them.

7. **Problem provenance.** Decide whether the article should cite or discuss the current
   online Erdős-problem page in addition to Erdős–Graham and Formal Conjectures. No web
   entry has been added to `references.bib` pending that decision.

8. **Acknowledgements.** Decide whether to acknowledge benchmark authors, theorem-proving
   systems, reviewers of the repository, or discussion participants by name.

9. **Ancillary files.** Decide whether `PROOF_LEDGER.md` and `LEAN_CORRESPONDENCE.md`
   should be included as arXiv ancillary files, converted into appendices, or retained
   only in the repository.

10. **Length and audience.** The draft is a complete first proof narrative, but it is
    intentionally architecture-forward. Decide whether v1 should expand the global-control
    block lemma internally, or instead keep that machinery in the formal correspondence.

## Director decisions

1. **Novelty and priority language.** The current wording claims only that release v0.0.3
   contains a machine-checked proof of the stated formulation modulo two named external
   inputs. Confirm whether any stronger claim is warranted by the portfolio record.

2. **Primary-source gate.** Bibliographic metadata and source locations for the two
   Rosser–Schoenfeld inputs were verified, but automated Project Euclid access blocked a
   direct visual comparison of pages 69–70. Decide whether a human screenshot/scan check
   is mandatory before the manuscript is marked submission-ready. The checklist treats
   it as mandatory before submission.

3. **Expository granularity.** Confirm that the paper may cite the released declaration
   graph for the numerous explicit terminal inequalities while giving their roles and
   parameter order in prose, rather than reproducing several pages of constant chasing.

4. **Software citation form.** Confirm whether the Zenodo release should be cited in the
   bibliography, a data/software-availability section, or both.

5. **Formal Conjectures wording.** Confirm the exact description of statement alignment.
   The manuscript says “aligned with the Formal Conjectures benchmark” and does not claim
   that the benchmark validates the proof.

6. **Future refactor note.** Confirm that later PNT/Mertens replacement or architectural
   refactors should be mentioned only as possible future work, without affecting v0.0.3.

## Citation verification not promoted to bibliography

No unresolved or guessed bibliographic entry has been placed in `references.bib`.
Possible later additions, only after a decision and verification, include:

- the canonical current webpage for Erdős Problem 306;
- a formal-methods reference explaining Lean’s kernel/trust model;
- a standard circle-method or probabilistic subset-sum reference, if the author wants
  broader context rather than a self-contained proof architecture;
- a permanent repository citation for the exact Formal Conjectures source file.

## Non-questions fixed by authority

The following are not open for editorial alteration in manuscript v1:

- proof authority is `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`;
- DOI is `10.5281/zenodo.20767390`;
- the released nonstandard assumptions are exactly
  `rosser_schoenfeld_cor3` and `rosser_schoenfeld_thm5`;
- the frozen refactor is contextual only;
- no arXiv submission, tag, release, DOI mutation, Lean edit, or release-ref edit belongs
  to this workstream.
