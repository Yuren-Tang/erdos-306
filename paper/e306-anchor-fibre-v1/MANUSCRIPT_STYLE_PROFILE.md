# E306 manuscript style profile

Status: controlling project profile for the current E306 article branch.

## Authority

This profile specializes the authorial portfolio manuscript standard at `Yuren-Tang/research-workbench@3b34de193647335c1c8ddfb3974554b76c21bbe5`. E306-specific Owner decisions and accepted publication-style checkpoints take precedence where more specific. The 2026-08-08 theorem-scope rewrite reopened the mathematical review object but did not reopen the selected visual design.

## Language and prose

- British English with Oxford spelling.
- Prefer etymologically appropriate `-ize` / `-ization` forms (`characterize`, `normalization`) while retaining British forms such as `analyse`, `centred`, and `fibre`.
- Treat Greek/Latin terminology philologically; do not substitute faux-Latin forms merely because common.
- Prefer mathematical mechanism to project-management prose. No internal roles, packets, audits, branch language, or publication strategy belongs in the article.

## Page and typography

- `amsart`, 11 pt, A4, `reqno`.
- ETbb OpenType text; NewTX mathematics.
- `microtype`; `hidelinks`; URL/DOI material inherits surrounding roman face.
- Garamond is historical comparison only.
- No decorative boxes, colour coding, drop capitals, ornaments, or pseudo-antique devices in the mathematical body.

## Engine, font lookup, and Unicode

- XeLaTeX.
- ETbb from canonical TeX Live OpenType files; NewTX supplies mathematics only.
- Greek source is literal Unicode.
- Dedication is exactly two centred upright GFS Artemisia lines, uppercase without diacritics:

  `ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ`

  `ΚΑΙ ΟΙΣ ΦΙΛΩ`

- Final validation checks both visual glyphs and Unicode extraction; no `Missing character:` diagnostic is allowed.

## Front matter

- Title: **Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem**.
- `Erdős Problem 306` remains prominent in abstract/introduction/keywords/metadata rather than governing the mathematical title.
- Author: Yuren Tang.
- No institutional affiliation or email in arXiv v1.
- Linked compact ORCID `0009-0006-0847-3330` in the `amsart` author footnote; arXiv metadata should also carry it.

## Acknowledgements and AI disclosure

Keep the concise function-based disclosure:

> Generative AI systems assisted mathematical exploration, proof development, source and citation checking, and editorial revision. The author takes full responsibility for the mathematics, citations, and text.

Do not invent personal acknowledgements or list Lean development as an AI-assistance function in this article.

## Citations and bibliography

- `biblatex` + Biber, numeric style, `nyt` sorting.
- Show DOI and arXiv/eprint metadata where available; suppress redundant bare URLs.
- References follow continuously; no forced bibliography page break.
- Butler--Erdős--Graham A51 uses corrected DOI `10.5281/zenodo.10456673`.

## Current exact review source and equation references

The exact Owner-review manuscript source is

`654189fe67b575bd539092f1700754835ee7ebda`.

The source retains the reviewed manuscript's explicit numeric `\tag{section.number}` equation numbers. The first clean-review build exposed that an attempted synthetic label bridge did not in fact create those labels under `amsmath` and caused internal label names to appear in extracted PDF text. The bounded repair therefore renders matching numeric `\eqref` keys directly and uses the stable numeric key `(8.4)` for the one formerly named equation reference. The repair changes no mathematical content or visible numbering.

This is now the controlling equation-reference convention for this review object. Do not reintroduce the synthetic label bridge merely to obtain equation hyperlinks.

## Validated review PDF

GitHub Actions run `31256191144` clean-built exact manuscript source `654189fe...` into a **34-page A4 PDF** and passed:

1. frozen-source identity;
2. Oxford-spelling guard;
3. clean XeLaTeX/Biber build;
4. no unresolved or multiply defined references/citations/labels;
5. no Biber warning/error requiring repair;
6. no missing glyphs;
7. all fonts embedded, no Type 3;
8. Unicode extraction of both dedication lines;
9. ORCID and `Erdős` extraction;
10. internal-label leak gate;
11. PDF artifact upload.

A representative visual inspection after download found no clipping, gross overflow, glyph corruption, equation damage, bibliography failure, or front-matter break. Minor TeX box/font-substitution diagnostics remain non-blocking presentation details and may be considered only if the Owner notices a visible defect.

This build is presentation/execution evidence, not independent mathematical review.

## Review and later validation

The selected typography is frozen absent a concrete Owner or independent-review defect. Owner review comes next. After Owner disposition, obtain an independent mathematical/source review of the same exact source. Any later bounded source repair must create a new SHA and be re-built through the same gates.
