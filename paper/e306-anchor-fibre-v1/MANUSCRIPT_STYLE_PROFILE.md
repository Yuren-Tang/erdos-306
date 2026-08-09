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

The controlling E306 dedication typography is **GFS Artemisia Regular**, not EB Garamond.

The durable front-matter record is issue #8 comment `5109693351`: the dedication-only face was deliberately changed from GFS Didot to GFS Artemisia, with 10 pt type on a 15 pt baseline, 8 pt space above and 12 pt below, upright and without added tracking.

The current exact visible dedication is

`ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ`

`ΚΑΙ ΟΙΣ ΦΙΛΩ`

in two centred uppercase lines without diacritics. The independent review suggested changing `ΟΙΣ` to `ΟΥΣ`; that suggestion is not adopted because classical relative attraction supports the dative relative when the dative antecedent is omitted. Do not alter the Greek text without a new explicit philological disposition.

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

The revised exact manuscript source is

`3899f40fb493c2e2f2894f432cada64437a0964c`.

The source retains explicit numeric `\tag{section.number}` equation numbers and matching numeric equation references. The first clean-review build of the preceding object exposed that an attempted synthetic label bridge did not create the intended labels under `amsmath` and leaked internal names into PDF text. The bounded repair removed that broken mechanism.

A full migration to semantic `\label`/`\eqref` is desirable source hygiene but is **not** authorized as an opportunistic pre-arXiv refactor: it would reopen a large formula-reference surface for no mathematical gain. Reconsider it in a separately audited maintenance pass, naturally before or during journal-source preparation.

## Validated revised PDF

GitHub Actions run `31292599279` / run number 191 clean-built exact source `3899f40...` into a **35-page A4 PDF** and passed:

1. frozen-source identity;
2. Oxford-spelling guard;
3. clean XeLaTeX/Biber build;
4. no unresolved or multiply defined references/citations/labels;
5. no Biber warning/error requiring repair;
6. no missing glyphs;
7. **no overfull hbox**;
8. all fonts embedded, no Type 3;
9. Unicode extraction of both dedication lines;
10. ORCID and `Erdős` extraction;
11. internal-label leak gate;
12. PDF artifact upload.

One mild underfull box remains in the log. It is not treated as a publication defect absent a visible layout problem.

This build is presentation/execution evidence, not a replacement for the independent delta recheck.

## Review state

The independent full reader reviewed preceding source `654189fe...`, found no fatal mathematical defect, and advised bounded revision. Those revisions produced `3899f40...`. The next assurance action is an independent delta recheck of that change set. The selected visual design remains frozen absent a concrete defect.
