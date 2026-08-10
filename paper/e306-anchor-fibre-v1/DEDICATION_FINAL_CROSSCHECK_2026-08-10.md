# E306 dedication final cross-check

**Date:** 2026-08-10, Europe/Berlin  
**Manuscript object:** `d21c612be5c3534b3b2b40361c4a861f40969565`  
**Disposition:** typography comparison only; no manuscript byte changed

This record closes the Owner's final question whether the Greek dedication should use a face more natively aligned with the ETbb/Bembo-like body rather than the retained STIX Two Text Medium setting.

## 1. ETbb itself is not a Greek candidate

The article body uses the TeX Live ET Bembo (`ETbb`) OpenType family.  ETbb supplies the Latin text faces used by the paper but does not supply the Greek capitals needed for

```text
ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ
ΚΑΙ ΟΙΣ ΦΙΛΩ
```

and there is no separate `ETbb Greek Medium` companion face to enable.  Therefore a literal same-family Greek comparison does not exist.  Any replacement must be an honestly distinct Greek-capable family chosen for optical compatibility rather than called an ETbb native Greek.

## 2. Specialist control

GFS Porson was previously built in the full 36-page manuscript at the same 10.5/16 pt and open-tracking treatment.  It is a useful Greek-specialist control, but its dedication is markedly finer and more edition-text-like than the desired inscriptional layer.  It was therefore rejected before the final tuned ladder.

## 3. Tuned Gentium ladder

The first final preflight compared STIX Two Text Medium and Gentium Book Medium at identical settings.  Because identical nominal size/tracking can unfairly penalize a narrower face, a second full-page optical ladder was run with Gentium itself tuned as an inscription.

Every variant was built from the exact frozen manuscript source and retained the same title, body, abstract, vertical dedication spacing, and Greek text.  Only the dedication face/size/tracking changed:

```text
A  STIX Two Text Medium      10.5 pt   LetterSpace 9   [current]
B  Gentium Book Medium      10.75 pt  LetterSpace 11
C  Gentium Book Medium      11 pt     LetterSpace 12
D  Gentium Book SemiBold    10.25 pt  LetterSpace 10
```

All four complete manuscripts compiled successfully to 36 pages.  The successful comparison is GitHub Actions run

```text
31346565247
```

at verification head

```text
3902d278f3a12a6cd457543ca82556ace6352fd6.
```

The preceding run `31346407915` stopped before comparison because the temporary workflow guessed an unavailable TeX Live filename for the already-rejected Porson control.  The manuscript freeze had passed; that runner failure is not manuscript evidence.

## 4. Optical disposition

The tuned Gentium Medium variants become much more viable than the equal-settings challenger and confirm that tracking/size treatment matters.  They still do not clearly improve the complete title-page hierarchy:

- Medium 10.75/LS11 remains somewhat more book-text-like and narrower than the retained inscription;
- Medium 11/LS12 is the strongest Gentium candidate and is closer to the humanist/Bembo-like body, but this produces an especially close *near-match without family identity*: it looks as though title/body and dedication are trying to be one family while remaining visibly different;
- SemiBold 10.25/LS10 supplies enough inscriptional weight but begins to compete with the article title.

STIX Two Text Medium 10.5/16 pt with `LetterSpace=9` remains the strongest complete-page solution.  Its difference from ETbb reads as an intentional inscriptional layer rather than an unsuccessful same-family match, while its width and weight remain subordinate to the title and clearly separate from body text.

Hence the retained setting is now an affirmative final design decision after both equal-settings and tuned-face comparisons:

```text
[ETBB NATIVE GREEK: DOES NOT EXIST]
[GFS PORSON SPECIALIST CONTROL: REJECTED]
[TUNED GENTIUM MEDIUM / SEMIBOLD LADDER: NO CLEAR IMPROVEMENT]
[STIX TWO TEXT MEDIUM 10.5/16 / LETTERSPACE 9: RETAINED]
[NO KNOWN DEDICATION-TYPOGRAPHY DEBT DEFERRED TO V2]
```

No article source file was modified by this cross-check.  The arXiv-v1 source remains exactly `d21c612...`; the already verified minimal source archive and archive-only rebuilt PDF remain the upload artifacts.