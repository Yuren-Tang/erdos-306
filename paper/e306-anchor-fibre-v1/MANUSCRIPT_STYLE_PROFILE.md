# E306 manuscript style profile

Status: controlling project profile for the current E306 article branch.

## Authority

This profile specializes the authorial portfolio manuscript standard at
`Yuren-Tang/research-workbench@3b34de193647335c1c8ddfb3974554b76c21bbe5`.
E306-specific Owner decisions and accepted publication-style checkpoints take precedence where they are more specific. The presentation choices below restore the accepted August E306 defaults while preserving later Unicode-source improvements.

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
- Citation style: numeric, restoring the accepted E306 presentation checkpoint.
- Sorting: author/name–year–title (`nyt`); numeric labels follow that stable bibliography order.
- Rationale: the bibliography is small, and numeric citation marks are visually quieter in dense mathematical prose; author names remain available in prose whenever attribution matters.
- Show DOI and arXiv/eprint metadata where available; suppress redundant bare URLs when a DOI or eprint supplies the stable locator.
- References follow the article continuously. Do not force the bibliography onto a new page; natural pagination is allowed.

## Frozen mathematics during external-review preparation

- The presentation revision may change `main.tex`, this profile, and build/control plumbing.
- `references.bib` and every file under `manuscript/sections/` remain frozen against the independently audited August mathematical checkpoint unless a later mathematical disposition explicitly reopens them.
- No theorem statement, proof, estimate, exponent, scope boundary, or mathematical prose is reopened by the typography revision.

## Validation

An external-review presentation candidate must pass all of the following on one exact manuscript head:

1. `references.bib` and all section files byte-identical to the frozen mathematical baseline;
2. clean XeLaTeX/Biber build;
3. no unresolved or multiply defined symbolic references/citations;
4. no Biber warnings requiring bibliographic repair;
5. no missing-glyph diagnostics in the final TeX pass;
6. all PDF fonts embedded and no Type 3 fonts;
7. Unicode extraction of both inscriptional Greek dedication lines after NFC normalization;
8. extraction of the ORCID compact iD and `Erdős`;
9. PDF metadata check;
10. full-page visual inspection for clipping, overflow, glyph corruption, equation damage, bibliography failure, and front-matter balance;
11. prose audit against the Oxford/philological language rule.

The external-review presentation checkpoint is fixed separately from later governance-only commits. A new arXiv source packet is generated only after external review has returned and any resulting bounded changes are closed.
