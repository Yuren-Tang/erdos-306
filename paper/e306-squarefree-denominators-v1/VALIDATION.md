# Validation record

The local clean build used TeX Live 2025 and Biber:

```sh
cd manuscript
make clean
make pdf
```

Required gates:

- no unresolved citations or references;
- no duplicate labels;
- no overfull boxes;
- A4 geometry;
- all fonts embedded;
- no Type 3 fonts;
- extractable text on every page;
- no prohibited manuscript vocabulary;
- full-page visual inspection.

The writer return records the exact PDF digest and CI run identifiers.
