# E306 manuscript style profile

Status: controlling project profile for the current E306 article branch.

## Authority

This profile specializes the authorial portfolio manuscript standard at `Yuren-Tang/research-workbench@3b34de193647335c1c8ddfb3974554b76c21bbe5`. E306-specific Owner decisions and accepted publication-style checkpoints take precedence where more specific.

## Language and prose

- British English with Oxford spelling.
- Prefer etymologically appropriate `-ize` / `-ization` forms while retaining British forms such as `analyse`, `centred`, and `fibre`.
- Treat Greek/Latin terminology philologically; do not substitute faux-Latin forms merely because common.
- Prefer mathematical mechanism to project-management prose.
- Retain the proof-bearing vocabulary `anchor`, `row observability`, and `decoder`, but avoid gratuitous engineering metaphors where plain arithmetic language is more exact.

## Page and typography

- `amsart`, 11 pt, A4, `reqno`.
- ETbb OpenType text; NewTX mathematics.
- `microtype`; `hidelinks`; URL/DOI material inherits surrounding roman face.
- Bibliography in `\small`.
- No decorative boxes, colour coding, drop capitals, ornaments, or pseudo-antique devices in the mathematical body.

## Dedication

The controlling E306 dedication typography is **EB Garamond Regular**, used for the dedication only.

The current exact visible dedication is

`ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ`

`ΚΑΙ ΟΙΣ ΦΙΛΩ`

in two centred uppercase lines without diacritics, upright, 10 pt on a 15 pt baseline, with 8 pt space above and 12 pt below and no added tracking.

This completes an earlier Owner condition that dedication-only EB Garamond should be used if it compiles, embeds, and extracts cleanly in the retained toolchain. The previous landed comparison had moved GFS Didot to the calmer GFS Artemisia; after the Owner explicitly recalled the EB Garamond condition, the current XeLaTeX/OpenType path was tested directly. GitHub Actions run `31303386599` confirms the EB Garamond OpenType file is available, embedded, and compatible with exact Unicode Greek extraction. Equal-scale first-page renders of the Artemisia and EB Garamond builds were inspected; EB Garamond is retained as the quieter and more texturally consonant title-page face.

The first independent review suggested changing `ΟΙΣ` to `ΟΥΣ`; that suggestion remains not adopted because classical relative attraction supports the dative relative when the dative antecedent is omitted. Do not alter the Greek text without a new explicit philological disposition.

Final validation must check both visual glyphs and Unicode extraction; no `Missing character:` diagnostic is allowed.

## Front matter

- Title: **Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem**.
- The abstract describes the result as a **self-contained analytic resolution** of Erdős Problem 306.
- `Erdős Problem 306` remains prominent in abstract/introduction/keywords/metadata rather than governing the title.
- Author: Yuren Tang.
- No institutional affiliation or email in arXiv v1.
- Linked compact ORCID `0009-0006-0847-3330` in the `amsart` author footnote; arXiv metadata should also carry it.

## Acknowledgements and AI disclosure

Keep the concise function-based disclosure:

> Generative AI systems assisted mathematical exploration, proof development, source and citation checking, and editorial revision. The author takes full responsibility for the mathematics, citations, and text.

Do not invent personal acknowledgements or misdescribe the role of AI assistance.

## Citations and bibliography

- `biblatex` + Biber, numeric style, `nyt` sorting.
- Show DOI and arXiv/eprint metadata where available; suppress redundant bare URLs.
- References follow continuously; no forced bibliography page break.
- Butler--Erdős--Graham A51 uses DOI `10.5281/zenodo.10456673`.

## Current exact review source and equation references

The second-independent-review manuscript source is

`20fd8c774397faf14208fcdce550b344a6e9b77b`.

Visible equation numbering remains the reviewed explicit `\tag{section.number}` scheme. Source references are now ordinary LaTeX/hyperref references:

- 190 tagged displays;
- 190 unique equation labels, exactly one per tagged display;
- 94 equation references;
- descriptive labels `eq:unit-character` and `eq:moving-profile` retained where they pre-existed;
- `eq:section.number` fallback labels elsewhere;
- no global `\eqref` override and no bare numeric `\eqref{n.m}` calls.

This is a maintenance-only navigation refactor: the visible equation numbers are unchanged. The workflow rejects duplicate tags/labels, missing reference targets, multiple equation labels on a tagged display, legacy numeric references, and leaked internal labels in extracted PDF text.

## Validated second-review PDF

GitHub Actions run `31303386599` / run number 196 clean-built exact source `20fd8c77...` into a **35-page A4 PDF** and passed:

1. frozen-source identity;
2. Oxford-spelling guard;
3. semantic equation-reference surface gate;
4. clean XeLaTeX/Biber build;
5. no unresolved or multiply defined references/citations/labels;
6. no missing glyphs;
7. no overfull hbox;
8. Biber warning/error gate;
9. all fonts embedded, no Type 3;
10. EB Garamond dedication face present and embedded;
11. Unicode extraction of both dedication lines;
12. ORCID and `Erdős` extraction;
13. internal-label leak gate;
14. PDF artifact upload (`artifact 9035208730`).

This build is presentation/execution evidence, not a substitute for the second independent mathematical review.

## Review state

The first independent full reader reviewed preceding source `654189fe...`, found no fatal mathematical defect, and advised bounded revision. Those revisions were applied before the present maintenance pass. The Owner has chosen a **clean second independent full review** of current source `20fd8c77...`, rather than relying on a narrow delta recheck. The visual design and equation-reference infrastructure are now frozen absent a concrete defect found by that reviewer or the Owner.
