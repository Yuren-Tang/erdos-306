# Manuscript build

Run all commands from this directory:

```bash
cd paper/e306-anchor-fibre-v1/manuscript
make pdf
```

The build entrypoint executes:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex
```

Expected product:

```text
main.pdf
```

## Validation boundary

A successful build must establish:

1. every `\input` target is present;
2. BibTeX completes;
3. no undefined control sequence occurs;
4. no undefined citation remains after the final pass;
5. no undefined cross-reference remains after the final pass;
6. the generated PDF is nonempty and readable.

Warnings about overfull boxes, line breaks or bibliography style are recorded separately from fatal build failures.

The PDF is a review artifact only. Its existence does not mark PR #9 ready for review and does not authorize merge, release, DOI creation, arXiv or journal submission.
