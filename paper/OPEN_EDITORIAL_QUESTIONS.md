# Erdős 306 open editorial questions

Workstream: `E306-P1-01`  
Scope: genuine retained author, presentation, packaging, and submission decisions only. Mathematical or formal work that remains to be proved or reviewed belongs in the proof ledger and checklist, not here.

## 1. Decisions already closed for this manuscript line

The following are no longer editorial questions:

1. **Paper analytic backend.** The prime number theorem is the sole load-bearing external analytic theorem.
2. **Paper bridge.** The local reciprocal-prime law is proved self-containedly by Abel/partial summation.
3. **Construction interfaces.** Dyadic cardinality and inclusive-window mass are eventual conditions; fixed cutoffs in the current formal implementations are not paper essentials.
4. **Construction body.** Preserve the existing architecture-led reconstruction; do not perform another wholesale construction rewrite.
5. **Formal evidence.** `v0.0.3` and DOI `10.5281/zenodo.20767390` remain the current archived machine evidence, with the exact Rosser--Schoenfeld backend.
6. **Frozen refactor.** `codex/pushlinter@e55ef359...` supplies architecture context only until its own verification, repair, integration, and release gates close.
7. **Submission status.** No arXiv submission is authorized by this bounded revision.

## 2. Title

Current working title:

> Distinct Semiprime Egyptian Fractions for Rationals with Squarefree Denominator

Author decision retained:

- keep this descriptive title;
- shorten to “Semiprime Egyptian Fractions and Squarefree Denominators”;
- mention Erdős Problem 306 explicitly in the title;
- choose another final title after independent review.

The mathematical content does not require “Lean” or “machine-checked” in the title.

## 3. Author line and affiliation

Decide:

- exact romanization and ordering of the author name;
- institutional affiliation, if any;
- whether to state “Independent researcher” or omit affiliation;
- contact email to display, if any;
- whether to include ORCID `0009-0006-0847-3330` in the source and/or arXiv metadata.

## 4. Abstract emphasis

The current abstract leads with the theorem, then the PNT-to-local-law analytic handoff, then the construction mechanisms, and closes with formal-version separation.

Decide whether to:

- retain this balance;
- shorten the construction description for a broader number-theory audience;
- emphasize the solution of Erdős Problem 306 more explicitly;
- mention machine verification only in the final sentence, as currently structured;
- remove the formal-version sentence from the abstract and leave it to the introduction.

## 5. Classification and arXiv comments

Decide:

- primary arXiv category, likely `math.NT`;
- whether `math.CO` or `math.HO` is an appropriate secondary category;
- comments-field wording, including page count and companion software/DOI;
- whether to mention the Formal Conjectures benchmark in the comments field.

## 6. Acknowledgements and historical attribution

Decide:

- how to acknowledge the Erdős Problems database and any direct correspondence;
- whether to acknowledge the Formal Conjectures project in prose beyond the citation;
- whether to include a short historical note on Hadamard/de la Vallée Poussin or leave the PNT history to the bibliography;
- whether to thank independent reviewers by name after review;
- exact wording for AI-assisted exploration and drafting acknowledgements.

No acknowledgement should imply peer review, institutional sponsorship, or endorsement that has not occurred.

## 7. AI-assistance disclosure

Current conservative draft position:

> The project used AI-assisted mathematical exploration, Lean development, source organization, and manuscript drafting. Responsibility for the mathematical claims, source selection, and final submitted text remains with the author.

Author decision retained:

- use this wording;
- expand it to identify tools or systems;
- split acknowledgements from a separate disclosure statement;
- adapt it to the policy of a later journal while retaining an accurate arXiv disclosure.

## 8. Software and version citation placement

Decide whether the DOI/software citation belongs:

- only in the formal-verification section;
- also in the introduction;
- also in the arXiv comments field;
- in a dedicated “Data and code availability” paragraph.

The text must preserve the distinction between:

- paper proof: PNT plus partial summation;
- current released formal proof: Rosser--Schoenfeld inputs;
- frozen architecture checkpoint: unreleased structural-input refactor.

## 9. Ancillary materials

Decide whether to submit:

- only `main.tex` and `references.bib`;
- the proof ledger and Lean correspondence as arXiv ancillary files;
- shortened versions of those documents as appendices;
- the full review documents only through the repository.

The checklist should remain internal/repository material unless the author specifically wants it public as an ancillary audit record.

## 10. Licence and source packaging

Decide:

- arXiv licence;
- whether the GitHub manuscript source receives a separate licence notice;
- whether the final PDF is tracked in the repository or generated only for releases/submission;
- whether a later cleaned Lean release triggers an arXiv version update and, if so, how the companion-version note is worded.

## 11. Submission timing

Retained author/Director decision:

- submit only after independent mathematical review, final TeX/source audit, author metadata/disclosure decisions, and explicit `E306-DIR` authorization;
- or defer until a later cleaned formal release, despite the current strategy allowing the paper to proceed before that release.

The present bounded revision does not decide or perform submission.
