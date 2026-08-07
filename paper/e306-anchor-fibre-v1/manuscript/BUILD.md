# Clean August v1 — build and source boundary

This directory contains the active publication source for the August 2026 clean rewrite of the E306 article.

## Source provenance

The manuscript text was promoted from the independently audited source

```text
Yuren-Tang/research-workbench@43c205356fe5def721d54206af83928e95338fac
intake/2026-08-07-e306-arxiv-v1/latex/
```

The active files on `paper/e306-anchor-fibre-v1` were checked by Git blob identity against that fixed source. The mathematical/source audit chain is recorded in `../CONTROL.md`.

The older 42-page forensic reconstruction remains available in Git history and in its historical provenance records, but its page count, PDF digest, Biber configuration, visual comparison, and byte-exact reproduction claims do **not** transfer to this clean manuscript.

## Active source

The public source package is exactly:

- `main.tex`;
- `references.bib`;
- the ten section files named by the `\input` commands in `main.tex`.

Other legacy `.tex` files still present under `sections/` are historical branch artifacts and are not active inputs. A minimal arXiv source archive should include only the active source plus any build files actually required by arXiv.

## Ordinary build

The manuscript uses PDFLaTeX and BibTeX through `latexmk`.

From this directory run:

```bash
latexmk -C main.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex
```

The included `Makefile` provides the equivalent commands:

```bash
make clean
make pdf
```

## CI environment

The compatibility workflow is

```text
.github/workflows/manuscript.yml
```

It installs the required TeX packages explicitly, including `lmodern`, and checks:

1. clean PDFLaTeX/BibTeX completion through `latexmk`;
2. nonempty `main.pdf` and `main.bbl`;
3. no undefined citations or references;
4. no multiply-defined labels reported by LaTeX;
5. no BibTeX warnings;
6. all PDF fonts embedded;
7. no Type 3 fonts;
8. upload of build diagnostics and the resulting PDF artifact.

The workflow's current Ubuntu/TeX Live environment is a compatibility build. arXiv portability is a separate gate and must be checked against the current arXiv TeX environment before upload.

## Manual engineering gates still required before external publication

A successful CI build is necessary but does not by itself authorize publication. Before an arXiv upload or journal submission, the fixed candidate must also receive the applicable publication-engineering checks, including:

- source-package minimality and arXiv portability;
- PDF metadata/page-size inspection;
- text extraction and glyph sanity;
- visual inspection of every page for clipping, overflow, broken equations, headings, bibliography layout, and obvious typography defects;
- final current-literature/metadata refresh;
- assistance/declaration/licence decisions as required by the selected external route.

Exact run IDs, artifact IDs, PDF hashes, page count, and final engineering disposition are durable run evidence and should be recorded in the controlling issue after the final candidate passes; they are not hard-coded here so this file does not become self-stale after every build.

## Authority boundary

Internal source promotion and build/visual preparation are authorized by the 2026-08-07 supersession disposition on issue `#11`. No merge, licence selection, release, DOI action, arXiv upload, journal submission, or external contact is authorized by this file.
