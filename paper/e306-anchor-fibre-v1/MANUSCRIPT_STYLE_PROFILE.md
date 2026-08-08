# E306 manuscript style profile

Status: controlling project profile for the current E306 article branch.

## Authority

This profile specializes the authorial portfolio manuscript standard at
`Yuren-Tang/research-workbench@3b34de193647335c1c8ddfb3974554b76c21bbe5`.
E306-specific Owner decisions and accepted publication-style checkpoints take precedence where they are more specific. The theorem-scope rewrite of 2026-08-08 reopens the mathematical review object but does not reopen the selected visual design.

## Language and prose

- Use British English with Oxford spelling, not generic British spelling.
- Prefer etymologically appropriate `-ize` / `-ization` forms (`characterize`, `normalization`) while retaining British forms such as `analyse`, `centred`, and `fibre`.
- Treat Greek- and Latin-derived terminology philologically: verify spelling, morphology, diacritics, transliteration when genuinely needed, and classical plurals when deliberately retained. Do not substitute faux-Latin forms merely because they are common; for example, where the classical plural is intended, use `octopodes`, not `octopi`.
- Prefer mathematical mechanism to project-management or manuscript-aware prose. No internal roles, packets, audits, branch language, or publication strategy belongs in the article.

## Page and typography

- Class: `amsart`.
- Body: 11 pt, A4 paper.
- Display equation numbers: right aligned (`reqno`).
- Text: ETbb, the Bembo-derived humanist family used by the accepted E306 presentation checkpoint. The public body is loaded from the OpenType ETbb files so Unicode names and bibliography data remain semantically intact.
- Mathematics: NewTX math, matched to ETbb.
- The current public manuscript contains no semantic need for a separate monospaced face. URL/DOI material inherits the surrounding roman face (`\urlstyle{same}`), avoiding a second T1 text encoding solely for locators.
- Microtypography: `microtype`.
- Links: functional but visually quiet (`hidelinks`).
- The Garamond build is historical comparison material only; it is not the selected body typography.
- No decorative boxes, colour coding, drop capitals, ornaments, or pseudo-antique display devices in the mathematical body.

## Engine, font lookup, and Unicode

- Engine: XeLaTeX. This permits literal Unicode Greek and bibliographic names while keeping the ETbb/NewTX body design.
- ETbb is loaded from canonical TeX Live OpenType filenames. NewTX supplies mathematics only; it does not control the text encoding.
- Greek source is literal Unicode, never Latin transliteration or an LGR encoding surrogate.
- The dedication deliberately uses an inscriptional convention rather than ordinary accented Greek prose. Its exact public text is

  `ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ`

  `ΚΑΙ ΟΙΣ ΦΙΛΩ`

  i.e. two centred lines, uppercase and without diacritics. It is set upright in GFS Artemisia, restoring the accepted E306 dedication family while keeping Unicode source.
- The inscriptional effect comes from capitalization, absence of diacritics, isolation, and spacing; Garamond is not part of the dedication specification.
- Final validation must check both visual glyphs and Unicode text extraction from the generated PDF, and the final TeX pass must contain no `Missing character:` diagnostics.

## Front matter

- Working title: **Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem**.
- `Erdős Problem 306` remains prominent in the abstract, introduction, keywords, and discovery metadata rather than governing the mathematical title.
- Author: Yuren Tang.
- No institutional affiliation in arXiv v1.
- No email address in the PDF for arXiv v1.
- ORCID is placed in the conventional unobtrusive `amsart` author footnote as a linked compact iD: `0009-0006-0847-3330`. The PDF does not place a full URI directly below the author's name.
- The arXiv account/metadata layer should also carry the ORCID when submitted.

## Acknowledgements and AI disclosure

- Keep a concise public disclosure of generative AI assistance by function, not a model-by-model inventory.
- The E306 article contains no Lean material; do not list Lean development as a function of AI assistance in this paper's acknowledgement.
- Current text: “Generative AI systems assisted mathematical exploration, proof development, source and citation checking, and editorial revision. The author takes full responsibility for the mathematics, citations, and text.”
- Personal acknowledgements must not be invented.

## Citations and bibliography

- Backend: `biblatex` + Biber.
- Citation style: numeric.
- Sorting: author/name–year–title (`nyt`); numeric labels follow that stable bibliography order.
- Rationale: the bibliography is small, and numeric citation marks are visually quieter in dense mathematical prose; author names remain available in prose whenever attribution matters.
- Show DOI and arXiv/eprint metadata where available; suppress redundant bare URLs when a DOI or eprint supplies the stable locator.
- References follow the article continuously. Do not force the bibliography onto a new page; natural pagination is allowed.

## Current theorem-scope rewrite

The former external-review presentation checkpoint has been superseded as a current review object by the Owner-authorized theorem-scope rewrite. After the proper-target rewrite, moving-target no-wrap/provenance reconciliation, the bounded `kappa_b -> kappa` interface repair, and the final empty-forbidden-set wording repair, the exact manuscript-source checkpoint is

`eec3e6798ed86845ec42fd599aab6748bb08979a`.

The selected typography above remains controlling, but no current PDF checkpoint is frozen until the new source has passed an independent mathematical/source review and clean compilation. In particular:

- the old byte-identity gate against `dba5400f...` is historical and must not be applied to the new source;
- the current workflow freezes `main.tex`, `references.bib`, and `sections/` against `eec3e679...`;
- the old 33-page PDF and its SHA are archival evidence, not the current review copy;
- the old arXiv packet is superseded and must not be submitted;
- the equation-label mechanism introduced by the scope rewrite is part of the source object and must be clean-compiled and source-reviewed before acceptance.

No typography experiment is authorized merely because the mathematics was reopened. The intended next review should compare mathematical/source correctness, not restart font selection.

## Validation for the next fixed object

Before the rewritten manuscript becomes a new external-review checkpoint, one exact source object must pass:

1. an independent mathematical/source review of the proper-target `gamma>2` transport and all changed theorem statements;
2. clean XeLaTeX/Biber compilation from the exact source;
3. no unresolved, duplicate, or multiply defined labels/citations, including the legacy-key equation-label bridge;
4. no Biber warnings requiring bibliographic repair;
5. no missing-glyph diagnostics in the final TeX pass;
6. all PDF fonts embedded and no Type 3 fonts;
7. Unicode extraction of both inscriptional Greek dedication lines after NFC normalization;
8. extraction of the ORCID compact iD and `Erdős`;
9. PDF metadata check;
10. full-page visual inspection for clipping, overflow, glyph corruption, equation damage, bibliography failure, and front-matter balance;
11. prose audit against the Oxford/philological language rule;
12. an exact comparison confirming that any post-review bounded repairs are limited to their declared dependency cone.

Remote CI remains manual-only. A workflow run is optional execution evidence, not a substitute for the independent mathematical/source review.
