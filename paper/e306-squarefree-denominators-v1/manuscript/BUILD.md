# Build

The manuscript uses standard TeX Live packages and Biber.

```sh
cd paper/e306-squarefree-denominators-v1/manuscript
make clean
make pdf
```

The build gate rejects unresolved references or citations, missing glyphs, unembedded fonts, and Type 3 fonts.
