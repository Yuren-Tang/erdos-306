# Manuscript build

## Local build

Run all commands from this directory:

```bash
cd paper/e306-anchor-fibre-v1/manuscript
make clean
make pdf
```

The build entrypoint executes:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex
```

`latexmk` runs the configured Biber cycle and repeats LaTeX to stabilization.

Expected product:

```text
main.pdf
```

## Pull-request build

The workflow

```text
.github/workflows/manuscript.yml
```

runs for pull requests that change the manuscript paths or the workflow itself; PR #9 is the present instance.  It installs a clean standard TeX Live toolchain, executes the same clean build, fails on unresolved citations or cross-references, verifies that `main.pdf` is nonempty, and uploads the PDF as a thirty-day GitHub Actions artifact.

The workflow is a reproducibility gate.  It does not replace mathematical review or source-preservation review.

## Validation boundary

A successful build must establish:

1. every `\input` target is present;
2. Biber completes;
3. no undefined control sequence occurs;
4. no undefined citation remains after the final pass;
5. no undefined cross-reference remains after the final pass;
6. the generated PDF is nonempty and readable.

Warnings about overfull boxes, line breaks or bibliography style are recorded separately from fatal build failures.

The PDF is a review artifact only. Its existence does not mark PR #9 ready for review and does not authorize merge, release, DOI creation, arXiv or journal submission.
