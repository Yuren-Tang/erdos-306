# Forensic reconstruction build

This directory contains the recovered manuscript source integrated into GitHub on `paper/e306-anchor-fibre-v1` at recovery checkpoint `c2dfc5120eec017718ef07cbe43f9c151803769c`. It is a forensic reconstruction: under the recorded reproducible-build environment it reproduces the surviving 42-page evidence PDF byte-for-byte, but it does not certify invisible historical source identity such as comments, whitespace or equivalent TeX syntax.

## Ordinary build

The source uses PDFLaTeX with Biber. From this directory run:

```bash
latexmk -C main.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex
```

The included `Makefile` provides the equivalent `make clean` / `make pdf` entrypoints.

## Byte-exact forensic reproduction

The surviving 42-page evidence PDF records the creation/modification time
`2026-07-30 23:38:20 UTC`, whose Unix epoch is `1785454700`.
With the recovered source candidate and the original toolchain, the following reproducible build produces a PDF byte-for-byte identical to the evidence object:

```bash
export SOURCE_DATE_EPOCH=1785454700
export FORCE_SOURCE_DATE=1
latexmk -C main.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex
sha256sum main.pdf
```

Expected SHA-256:

```text
d0bc466283dc591b90e7039bb6461ecaa040d6a80b63d7270c1211e7377992c2  main.pdf
```

This equality establishes exact recovery of the compiled evidence object. It does not prove that invisible source details such as comments, harmless blank lines or equivalent TeX spellings are identical to the lost source.

## Validation performed

1. every `\input` target is present;
2. Biber completes without warnings or errors;
3. there are no undefined citations or cross-references;
4. there are no duplicate labels;
5. all PDF fonts are embedded and no Type 3 font occurs;
6. the dedication extracts literally as `ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ` / `ΚΑΙ ΟΙΣ ΦΙΛΩ`;
7. the bibliography begins on a separate page;
8. the output has 42 pages;
9. normalized full text agrees token-for-token with the evidence PDF;
10. all 42 pages agree pixel-for-pixel at 200 dpi;
11. the evidence-timestamp build agrees byte-for-byte with the evidence PDF.

The final build records one nonfatal underfull box and no overfull box.

## Authority boundary

This candidate is for independent mathematical-content preservation review. It authorizes no branch change, commit, push, PR transition, merge, release, licence selection, DOI action, arXiv upload or journal submission.
