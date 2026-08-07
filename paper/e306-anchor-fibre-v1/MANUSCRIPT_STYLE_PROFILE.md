# E306 manuscript style profile

Status: controlling project profile for the current E306 article branch.

## Authority

This profile specializes the authorial portfolio manuscript standard at
`Yuren-Tang/research-workbench@3b34de193647335c1c8ddfb3974554b76c21bbe5`.
That portfolio standard is authorially complete but, at the time this profile was adopted, its independent cross-project audit remained pending. E306-specific publication-style decisions already accepted on the E306 control thread take precedence where they are more specific. A contemporaneous Owner decision overrides either source.

## Language and prose

- Use British English with Oxford spelling, not generic British spelling.
- Prefer etymologically appropriate `-ize` / `-ization` forms (`characterize`, `normalization`) while retaining British forms such as `analyse`, `centred`, and `fibre`.
- Treat Greek- and Latin-derived terminology philologically: verify spelling, morphology, diacritics, transliteration when genuinely needed, and classical plurals when deliberately retained. Do not substitute faux-Latin forms merely because they are common; for example, where the classical plural is intended, use `octopodes`, not `octopi`.
- Prefer mathematical mechanism to project-management or manuscript-aware prose. No internal roles, packets, audits, branch language, or publication strategy belongs in the article.

## Page and typography

- Class: `amsart`.
- Body: 11 pt, A4 paper.
- Display equation numbers: right aligned (`reqno`).
- Text: TeX Gyre Pagella.
- Mathematics: NewPX math.
- Monospace: Inconsolata.
- Microtypography: `microtype`.
- Links: functional but visually quiet (`hidelinks`).
- No decorative boxes, colour coding, pseudo-antique ornaments, or display devices without mathematical function.

## Engine, font lookup, and Unicode

- Engine: XeLaTeX. The reason is semantic Unicode handling for the Greek dedication while retaining the Pagella/NewPX mathematical design.
- Font lookup is deliberately dual-path for portability: `fontspec` first uses the standard family name when the platform exposes the font through fontconfig, and otherwise falls back to the canonical TeX Live OpenType filename. This avoids binding the source either to Ubuntu filesystem paths or to one font-discovery mechanism.
- Greek prose is Unicode text, never Latin transliteration or an LGR encoding surrogate.
- The dedication is exactly

  `τοῖς ἐμὲ φιλοῦσιν`

  `καὶ οἷς φιλῶ`

  and is set in GFS Porson.
- Final validation must check both visual glyphs and Unicode text extraction from the generated PDF.

## Front matter

- Working title: **Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem**.
- `Erdős Problem 306` remains prominent in the abstract, introduction, keywords, and discovery metadata rather than governing the mathematical title.
- Author: Yuren Tang.
- No institutional affiliation in arXiv v1.
- No email address in the PDF for arXiv v1.
- ORCID is displayed visibly and unobtrusively immediately with the author identity as the full linked URI `https://orcid.org/0009-0006-0847-3330`; it is not relegated solely to an end address or hidden metadata.
- Preserve the Unicode Greek dedication above.

## Acknowledgements and AI disclosure

- Keep a concise public disclosure of generative AI assistance by function, not a model-by-model inventory.
- The E306 article contains no Lean material; do not list Lean development as a function of AI assistance in this paper's acknowledgement.
- Current text: “Generative AI systems assisted mathematical exploration, proof development, source and citation checking, and editorial revision. The author takes full responsibility for the mathematics, citations, and text.”
- Personal acknowledgements must not be invented.

## Citations and bibliography

- Backend: `biblatex` + Biber.
- Citation style: alphabetic labels appropriate for pure mathematics.
- Sorting: author/name–year–title (`nyt`).
- Show DOI and arXiv/eprint metadata where available; suppress redundant bare URLs when a DOI or eprint supplies the stable locator.
- References follow the article continuously. Do not force the bibliography onto a new page; natural pagination is allowed.

## Validation

A release candidate must pass all of the following on one exact head:

1. clean XeLaTeX/Biber build;
2. no unresolved or multiply defined symbolic references/citations;
3. no Biber warnings requiring bibliographic repair;
4. all PDF fonts embedded and no Type 3 fonts;
5. Unicode extraction of both Greek dedication lines after NFC normalization;
6. PDF metadata check;
7. full-page visual inspection for clipping, overflow, glyph corruption, equation damage, bibliography failure, and front-matter balance;
8. prose audit against the Oxford/philological language rule;
9. arXiv source-minimality check: only files actually needed by the submission build are packaged.
