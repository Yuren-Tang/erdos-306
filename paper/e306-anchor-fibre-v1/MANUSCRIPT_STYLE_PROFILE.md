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
- URL/DOI material inherits the surrounding roman face (`\urlstyle{same}`).
- Microtypography: `microtype`.
- Links: functional but visually quiet (`hidelinks`).
- The Garamond build is historical comparison material only; it is not the selected body typography.
- No decorative boxes, colour coding, drop capitals, ornaments, or pseudo-antique display devices in the mathematical body.

## Engine, font lookup, and Unicode

- Engine: XeLaTeX.
- ETbb is loaded from canonical TeX Live OpenType filenames. NewTX supplies mathematics only.
- Greek source is literal Unicode.
- The dedication deliberately uses an inscriptional convention. Its exact public text is

  `ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ`

  `ΚΑΙ ΟΙΣ ΦΙΛΩ`

  i.e. two centred lines, uppercase and without diacritics, upright in GFS Artemisia.
- Final validation must check both visual glyphs and Unicode text extraction from the PDF, and the final TeX pass must contain no `Missing character:` diagnostics.

## Front matter

- Working title: **Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem**.
- `Erdős Problem 306` remains prominent in the abstract, introduction, keywords, and discovery metadata rather than governing the mathematical title.
- Author: Yuren Tang.
- No institutional affiliation or email address in arXiv v1.
- ORCID appears in the conventional unobtrusive `amsart` author footnote as linked compact iD `0009-0006-0847-3330`; arXiv metadata should also carry it.

## Acknowledgements and AI disclosure

- Keep a concise public disclosure of generative AI assistance by function, not a model-by-model inventory.
- Do not list Lean development as a function of AI assistance in this paper's acknowledgement.
- Current text: “Generative AI systems assisted mathematical exploration, proof development, source and citation checking, and editorial revision. The author takes full responsibility for the mathematics, citations, and text.”
- Personal acknowledgements must not be invented.

## Citations and bibliography

- Backend: `biblatex` + Biber.
- Citation style: numeric.
- Sorting: author/name–year–title (`nyt`).
- Show DOI and arXiv/eprint metadata where available; suppress redundant bare URLs when a DOI or eprint supplies the stable locator.
- References follow the article continuously; do not force the bibliography onto a new page.
- Citation metadata is part of the frozen source surface. The final pre-Owner audit corrected the Butler--Erdős--Graham A51 DOI to `10.5281/zenodo.10456673` from the erroneous A52 locator.

## Current theorem-scope rewrite

The former external-review presentation checkpoint has been superseded by the Owner-authorized theorem-scope rewrite. After the proper-target rewrite, moving-target no-wrap/provenance reconciliation, the bounded `kappa_b -> kappa` interface repair, the empty-forbidden-set wording repair, and the A51 DOI correction, the exact manuscript-source checkpoint is

`0157295776c404f73fbc8e4c45883457c047132f`.

The selected typography above remains controlling, but no current PDF checkpoint is frozen until this exact source has passed clean compilation. In particular:

- the old byte-identity gate against `dba5400f...` is historical;
- the current workflow freezes `main.tex`, `references.bib`, and `sections/` against `01572957...`;
- the old 33-page PDF and its SHA are archival evidence, not the current review copy;
- the old arXiv packet is superseded and must not be submitted;
- the equation-label mechanism is part of the source object and must be clean-compiled and source-reviewed before acceptance.

No typography experiment is authorized merely because the mathematics was reopened. Owner review should judge the mathematical article, not restart font selection.

## Validation for the exact source

Before the rewritten manuscript becomes a new external-review checkpoint, the exact source must pass:

1. Owner mathematical/expository read;
2. an independent mathematical/source review after Owner disposition;
3. clean XeLaTeX/Biber compilation from the exact source;
4. no unresolved, duplicate, or multiply defined labels/citations, including the legacy-key equation-label bridge;
5. no Biber warnings requiring bibliographic repair;
6. no missing-glyph diagnostics;
7. all PDF fonts embedded and no Type 3 fonts;
8. Unicode extraction of both inscriptional Greek dedication lines after NFC normalization;
9. extraction of the ORCID compact iD and `Erdős`;
10. PDF metadata check;
11. full-page visual inspection for clipping, overflow, glyph corruption, equation damage, bibliography failure, and front-matter balance;
12. prose audit against the Oxford/philological language rule;
13. exact comparison confirming that any later bounded repairs are limited to their declared dependency cone.

Remote CI remains manual-only. A workflow run is execution evidence, not a substitute for mathematical/source review.
