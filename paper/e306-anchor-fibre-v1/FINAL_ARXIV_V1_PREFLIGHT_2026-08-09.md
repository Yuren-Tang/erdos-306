# E306 final arXiv-v1 upload preflight

**Date:** 2026-08-09, Europe/Berlin  
**Manuscript remains frozen:** `d21c612be5c3534b3b2b40361c4a861f40969565`

This record closes the last practical pre-submission questions after the independent mathematical review, exact finished-article read, current whole-plane reconciliation, and canonical slow knowledge-plane gate.

## 1. No new manuscript mutation

The final-preflight workflow began by comparing

```text
main.tex
references.bib
sections/*.tex
```

against exact source `d21c612...`.  The comparison passed.  Neither the typography comparison nor the upload-package test changed any manuscript byte.

## 2. Dedication A/B closed

A complete first page was built twice with every setting fixed except the dedication face:

- current: STIX Two Text Medium;
- challenger: Gentium Book Medium 7.000.

Both used the same upright 10.5/16 pt setting, `LetterSpace=9`, Greek text, title, body, and vertical spacing.  The Gentium release archive was downloaded from the SIL upstream release and verified against its published SHA-256 before use.  No font binary was committed or included in any user/arXiv artifact.

The Director compared the rendered full pages and a dedication crop.  Gentium did not outperform STIX in this setting: at the same nominal size/tracking its capitals are narrower and more book-text-like, while STIX gives the two-line inscription a steadier width, weight, and separation from the title.  The current STIX setting is therefore **affirmatively retained**, not merely left unchanged by default.

Disposition:

```text
[DEDICATION A/B CLOSED]
[STIX TWO TEXT MEDIUM RETAINED]
[NO KNOWN TYPOGRAPHY DEBT DEFERRED TO V2]
```

## 3. Minimal arXiv upload archive

A deterministic source archive was constructed directly from the frozen manuscript object.  It contains exactly twelve files:

```text
main.tex
references.bib
sections/01_introduction.tex
sections/02_direct_family.tex
sections/03_fourier_and_no_wrap.tex
sections/04_one_anchor_rigidity.tex
sections/05_row_observability_and_compression.tex
sections/06_local_gaussian_analysis.tex
sections/07_multiplicity_and_entropy.tex
sections/08_moving_target_local_saturation.tex
sections/09_characterization_and_finite_avoidance.tex
sections/10_scope_and_outlook.tex
```

It contains no Makefile, workflow, control/review record, PDF, auxiliary/build file, or font binary.

Archive:

```text
E306-arxiv-v1-source-d21c612.tar.gz
sha256: 8e7a9b3f96322c615d145cbd15f8582c1004ff9202eb735308e6ab5aa8ce5c0b
```

## 4. Archive-only rebuild

The source archive was extracted into an empty directory and built there using only the twelve uploaded source files plus the TeX installation.  The rebuild passed:

- XeLaTeX / Biber / XeLaTeX / XeLaTeX;
- 36 A4 pages;
- bibliography generated;
- no unresolved references or citations;
- no multiply defined labels;
- no missing characters;
- no overfull hboxes;
- no Biber warning/error gate failure;
- no Type-3 font;
- STIX Two Text Medium embedded;
- exact Unicode extraction of both Greek dedication lines, ORCID, and `Erdős`;
- no internal semantic-label leakage;
- extracted full PDF text byte-for-byte identical to the separately rebuilt frozen STIX baseline.

Archive-only rebuilt PDF:

```text
E306-arxiv-v1-rebuilt.pdf
sha256: dcabca83340709f57c277c8c0e922b83ee848147ca3c1331e20a0c8d79402993
pages: 36 A4
```

The Director then rendered all 36 pages from this archive-only PDF and visually inspected them again.  No clipping, collision, broken display, page-transition defect, or bibliography defect was found.  Page 36 intentionally contains only references [7]--[9]; no compression is warranted merely to remove that page.

## 5. Final-preflight workflow

The successful clean-room preflight is GitHub Actions

```text
run:      31330445123
head:     962fab9615b15950c96df0c81a8aec3f0eea1041
artifact: 9042790479
artifact digest: sha256:d8d32c7d663096e8757c928f36faa72ac78613159d91d784ebd429b1d4270a7f
```

The preceding run `31330275057` is not evidence against the manuscript: its exact-source freeze and STIX baseline both passed; it stopped because the temporary A/B script used an obsolete macro name (`dedicationfont` rather than the frozen source's `greekdedicationfont`).  The script alone was repaired and the complete second run passed.

## 6. Final internal gate

Combining the existing records with this preflight:

```text
[CURRENT SPARSE-TARGET OBJECT INDEPENDENTLY HOSTILE-REVIEWED: NO FATAL OBJECTION]
[EXACT FINAL SOURCE d21c612...: DIRECTOR COVER-TO-COVER READ PASS]
[36-PAGE FINAL PDF: DIRECTOR PAGE-BY-PAGE READ PASS]
[CURRENT WHOLE-PLANE MATHEMATICAL ARCHITECTURE RECONCILED]
[E306 CANONICAL KNOWLEDGE DRIFT REPAIRED / RESEARCH-WORKBENCH PR #256 MERGED]
[EXACT-MERGED-MAIN SLOW KNOWLEDGE GATE PASS: 31329335817]
[DEDICATION A/B CLOSED: STIX RETAINED]
[MINIMAL 12-FILE ARXIV SOURCE ARCHIVE: VERIFIED]
[ARCHIVE-ONLY REBUILD: PASS — 31330445123]
[ARCHIVE-ONLY 36-PAGE VISUAL QA: PASS]
[NO KNOWN MATHEMATICAL / STRUCTURAL / WRITING / TYPOGRAPHY V1 BLOCKER]
[NO KNOWN ITEM DELIBERATELY DEFERRED DESPITE A DECISION THAT V2 MUST FIX IT]
[ARXIV V1 UPLOAD PACKAGE READY]
```

The only remaining acts are external submission-interface actions by the Owner: upload the verified archive, confirm the arXiv compiler/bibliography result and metadata/category/license, inspect arXiv's generated PDF, satisfy endorsement if arXiv requires it, and submit.  These are not internal manuscript-development gates.

No journal submission, manuscript PR merge, GitHub release, new DOI, or other publication action is authorized by this record.
