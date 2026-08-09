# E306 manuscript style profile

Status: controlling project profile for the current E306 article branch.

## Language and prose

- British English with Oxford spelling.
- Prefer etymologically appropriate `-ize` / `-ization` forms while retaining British forms such as `analyse`, `centred`, and `fibre`.
- Treat Greek/Latin terminology philologically.
- Prefer mathematical mechanism to project-management prose.
- Retain the proof-bearing vocabulary `anchor`, `row observability`, and `decoder`, but avoid gratuitous engineering metaphors.

## Page and typography

- `amsart`, 11 pt, A4, `reqno`.
- ETbb OpenType body text; NewTX mathematics.
- `microtype`; `hidelinks`; URL/DOI material inherits surrounding roman face.
- Bibliography in `\small`.
- No decorative boxes, colour coding, drop capitals, ornaments, or pseudo-antique devices in the mathematical body.
- Current validated arXiv-v1 length: **36 A4 pages**. Page 36 contains only the last three bibliography entries. Do not manipulate margins, body font size, or bibliography readability merely to preserve a former page count.

## Dedication

The controlling dedication is exactly

```text
ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ
ΚΑΙ ΟΙΣ ΦΙΛΩ
```

in two centred uppercase lines without diacritics.

Current typography:

```text
face:        STIX Two Text Medium
use:         dedication only
setting:     upright
size:        10.5 pt
baseline:    16 pt
tracking:    fontspec LetterSpace=9
space above: 8 pt
space below: 12 pt
```

The choice followed equal-context tests of EB Garamond, GFS Didot Classic, GFS Bodoni, Old Standard, Junicode, Libertinus Serif Display, STIX Two Text, and other available TeX Live candidates. The successful change was not simply another regular face: a true medium weight plus open tracking gives the uppercase Greek a clearer inscriptional silhouette.

Do **not** apply fake bold. Bold was deliberately not selected because it competes with the title. Do not manually kern individual pairs without a concrete visual defect; native kerning remains in force and inscriptional openness is supplied by global tracking.

The remaining slight mismatch with the ETbb title is understood: ETbb supplies the Latin title/body family but does not provide a corresponding Greek inscriptional/display cut in the retained setup. If typography is revisited after v1, the only next comparison worth prioritizing is Gentium Book Medium or Gentium Medium with the same inscriptional treatment (medium weight plus restrained positive tracking). This is optional and must not trigger a whole-body or title-family redesign merely to match the dedication.

The proposed `ΟΙΣ -> ΟΥΣ` change remains not adopted. Classical relative attraction supports the dative relative with an omitted dative antecedent; the intended reading is `ΚΑΙ [ΤΟΙΣ] ΟΙΣ ΦΙΛΩ`. Do not alter the Greek text without a new explicit philological disposition.

Final validation must check both rendered glyphs and Unicode extraction; no `Missing character:` diagnostic is allowed.

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
- Include the Bloom--Elsholtz broad Egyptian-fractions survey as the general-entry reference.
- Butler--Erdős--Graham A51 uses DOI `10.5281/zenodo.10456673`.

## Equation references

The visible explicit equation numbers remain stable for arXiv v1, while source references use ordinary LaTeX/hyperref infrastructure:

- 190 tagged displays;
- 190 unique equation labels, exactly one per tagged display;
- 94 equation references;
- descriptive labels `eq:unit-character` and `eq:moving-profile` retained;
- `eq:section.number` fallback labels elsewhere;
- no global `\eqref` override and no bare numeric `\eqref{n.m}` calls.

Automatic visible equation numbering may replace the explicit tags during journal revision, after the arXiv-v1 citation surface is frozen.

## Current exact arXiv-v1 source

```text
d21c612be5c3534b3b2b40361c4a861f40969565
```

GitHub Actions run `31326307200` / run number 213 clean-built this source into a 36-page A4 PDF and passed the full source-freeze, sparse-target theorem-surface, equation-reference, XeLaTeX/Biber, glyph, no-overfull, embedded-font/no-Type-3, Unicode dedication, ORCID, and extraction gates. PDF artifact: `9041654586`.

The sparse-target `gamma>1` object has received an independent hostile review with no fatal objection. The present v1 source differs from that reviewed object only by bounded editorial microrepairs recorded in `CURRENT_OBJECT_INDEPENDENT_REVIEW_DISPOSITION_2026-08-09.md`.
