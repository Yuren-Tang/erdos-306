# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **Publication state:** two independent reviews have been returned on earlier fixed objects; the second review triggered a substantive but simplifying theorem-scope revision. The resulting sparse-target `gamma>1` object is author/Director-complete and clean-built, but still requires a focused independent dependency-cone review before publication disposition.

No merge, tag, release, DOI mutation, arXiv upload, journal submission, endorsement request, or external contact is authorized by this file.

## Current exact manuscript source

The current fixed manuscript source is exactly

```text
8024ff325f454e1fc52c280ac65bab0c48315e96
```

The branch may be ahead of this SHA only through workflow/control/review-record commits. `main.tex`, `references.bib`, and `sections/` are frozen against this source by the manuscript workflow.

The immediately preceding blind-review object was

```text
20fd8c774397faf14208fcdce550b344a6e9b77b.
```

That blind reader found no fatal objection in the full manuscript, specifically read the load-bearing Sections 4--8, and recommended substantive but non-foundational revision. The reader also proposed sparsifying only the target rows and observed that this might remove the apparent `gamma>2` threshold. The Director independently rechecked that suggestion against the current proof spine and the existing sparse-sensor mathematics before admitting it to the manuscript.

## Current theorem package

1. **Squarefree-denominator characterization with arbitrary finite avoidance.** A reduced positive rational is a finite sum of reciprocals of pairwise distinct squarefree semiprimes if and only if its denominator is squarefree.
2. **Direct proper-target theorem.** Fix reduced `t=a/b in (0,1)` with squarefree `b` and fixed `gamma>1` satisfying
   ```text
   t < (log gamma)^2/2 < 1.
   ```
   Put `Z=X^gamma`, use the complete prime-pair family from `[X,Z)`, and for each prime `r|b` retain only
   ```text
   K_* = ceil((log Z)^2)
   ```
   target sensors `rq` with `q` in a fixed subset `B_*` of the top block. Then the target is represented for all sufficiently large `X`.
3. **Compact-uniform local Gaussian profile.** The Bernoulli-weighted exact coefficients of that same sparse-target family have the stated Gaussian profile on every fixed standardized target window.
4. **Multiplicity and entropy.** With `alpha=2t/(log gamma)^2`, the mesoscopic typical-cardinality window contains at least `exp([H(alpha)-o(1)]M_X)` exact representations; the whole exact fibre and some exact cardinality inherit that lower bound. For `0<t<1/2`, the choice `gamma=exp(2 sqrt(t))` gives the full binary entropy rate `log 2` per denominator. No matching global upper bound is asserted.
5. **Prime-dilution closure.** Arbitrary positive squarefree-denominator rationals follow from finitely many pairwise disjoint proper-target representations obtained by finite avoidance.

Every fixed `0<t<1` admits an exponent because

```text
exp(sqrt(2t)) < gamma < exp(sqrt(2)).
```

## Why the `gamma>2` boundary disappeared

The old Article-1 family attached every top prime to every fixed coordinate `r|b`. Those full target rows had square mass `O_b(1/(Z log Z))`, which was lower order than the pair variance only for `gamma>2` in the clean five-sector proof.

The current family retains only `K_*=ceil((log Z)^2)` target sensors per fixed coordinate. Then

```text
target reciprocal load = O_b(K_*/Z) = o(1),
target square load     = O_b(K_*/Z^2),
```

which is lower order than the pair square mass for every fixed `gamma>1`.

For `r|b`, every retained sensor contributes at least `1/r^2` to the row-code distance, so

```text
D_r >= K_*/r^2 >>_b (log Z)^2.
```

The corresponding off-minimizer row mass is `exp(-c_b (log Z)^2)`, still superpolynomially small after multiplication by the complete weighted anchor partition.

For a coherent label `m`, target-candidate energy divided by target-row distance is `O_b(m^2/Z^2)`. Exact target-coordinate decoding is therefore required and obtained only on the Gaussian range `|m|=O(X log X)=o(Z)`. The first coherent tail uses the complete pair factors in modulus and does not require fixed-coordinate decoding; the intermediate tail uses the unchanged lower-prime decoder and retained complete-pair damping. If `M_dec` exceeds the maximal low-energy anchor-label scale, the nominal large coherent range is empty; otherwise the previous anchor damping closes it. The major-arc cubic remainder is split between pair and sparse-target factors and tends to zero for every fixed `gamma>1`.

This is a simpler family, not a resurrection of the historical multi-regime `gamma<=2` architecture.

## Bounded review repairs applied at the same time

The second blind review also led to four local exposition repairs without changing their mathematical statements:

- the fingerprint-rigidity contradiction is written quantitatively, including the explicit comparison with `4g<c_D`;
- label classes are defined at first use;
- Section 5 states explicitly that a fixed anchor assignment plus row tuple determines a unique CRT frequency `h mod L`, so the source character may be absorbed into the bounded row factor;
- Section 7 now says “uniform upper bound for an atom in the window”, and the temporary lcm variable in Section 9 no longer collides with the global family-size notation.

The peripheral common-proper-refinement proposition was condensed to a remark in order to keep the strengthened article at 35 pages; its mathematical observation and transportation-matrix proof idea remain visible.

## Current presentation profile

Retain, absent a concrete defect:

- British English with Oxford spelling;
- `amsart`, A4, 11 pt, right equation numbers;
- ETbb OpenType body with NewTX mathematics;
- XeLaTeX;
- numeric `biblatex`/Biber citations sorted `nyt`;
- bibliography in `\small`;
- no affiliation or email;
- compact linked ORCID;
- exact dedication text
  ```text
  ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ
  ΚΑΙ ΟΙΣ ΦΙΛΩ
  ```
- dedication-only **STIX Two Text Medium**, upright, 10.5 pt on 16 pt, `LetterSpace=9`, 8 pt above and 12 pt below;
- concise generative-AI disclosure.

The dedication typography was selected after equal-context comparison of EB Garamond Medium, GFS Didot Classic, GFS Bodoni, Old Standard, Libertinus Serif Display, STIX Two Text, and other available TeX Live candidates. The point of the final setting is not boldness: a true medium weight plus open tracking gives the uppercase Greek a restrained inscriptional presence while remaining compatible with the ETbb title page. Bold/fake-bold and manual pair kerning are not used.

The Greek `ΟΙΣ` remains deliberate. Classical relative attraction permits the relative to be attracted into the case of an omitted dative antecedent; the intended reading is `ΚΑΙ [ΤΟΙΣ] ΟΙΣ ΦΙΛΩ`. Do not alter the wording without a new philological disposition.

## Equation-reference policy

The visible equation numbers remain the stable explicit `\tag{section.number}` values. Source references use ordinary LaTeX/hyperref navigation:

- 190 tagged displays;
- 190 unique equation labels, one per tagged display;
- 94 equation references;
- descriptive labels `eq:unit-character` and `eq:moving-profile` retained;
- `eq:section.number` fallback labels elsewhere;
- no global `\eqref` override and no bare numeric `\eqref{n.m}` calls.

The workflow hard-fails on duplicate tags/labels, missing targets, multiple labels on one tagged display, legacy numeric references, or leaked internal labels.

## Clean-build checkpoint

GitHub Actions run

```text
31320182037
```

(run number 204) on execution head

```text
f0fc3c441b6d614f26270e4fedcc2ae2b10cbd19
```

clean-built exact manuscript source `8024ff32...` and passed all configured gates:

- exact source freeze;
- Oxford-spelling guard;
- sparse-target / `gamma>1` theorem-surface guard;
- semantic equation-reference guard;
- clean XeLaTeX/Biber build;
- no unresolved or multiply defined references/citations/labels;
- no missing glyphs;
- no overfull hbox;
- Biber warning/error gate;
- all fonts embedded and no Type 3;
- STIX Two Text Medium present and embedded for the dedication;
- exact Unicode extraction of both Greek dedication lines, ORCID, and `Erdős`;
- internal-label leak gate;
- **35-page A4 PDF** artifact `9039950866`.

Artifact digest:

```text
sha256:a4bef64c3d9a8ace29a11191f9d843308ab55cce165713f0fee4f92489936b15
```

Build correctness and typography are execution evidence, not theorem assurance.

## Review history and current assurance boundary

- The first independent reader reviewed `654189fe...`, found no fatal defect, and advised bounded revision.
- A later blind reader reviewed `20fd8c77...`, again found no fatal objection and recommended substantive but non-foundational revision; that review generated the sparse-target idea.
- The current source `8024ff32...` has **not** been independently passed. The `gamma>1` theorem is currently author/Director-complete plus clean-build verified.

The correct assurance state is therefore

```text
[TWO INDEPENDENT REVIEWS OF EARLIER FIXED OBJECTS: NO FATAL OBJECTION]
[SPARSE-TARGET GAMMA>1 REVISION: AUTHOR/DIRECTOR-COMPLETE]
[CLEAN CURRENT-SOURCE BUILD PASS — ACTION 31320182037]
[35-PAGE CURRENT PDF]
[FOCUSED INDEPENDENT DEPENDENCY-CONE REVIEW REQUIRED]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO PUBLICATION SUBMISSION AUTHORIZED]
```

## Next gate

The next reviewer need not re-audit every unchanged line of the 35-page paper. The focused review should compare the mathematical object reviewed at `20fd8c77...` with current source `8024ff32...` and independently check the reopened dependency cone:

1. sparse target-row reciprocal and square loads;
2. sparse fixed-coordinate row distance and the weighted off-minimizer sum after the `P_top` factor;
3. target-coordinate decoder only on the major range and why `gamma>1` is enough there;
4. the separate sparse-target cubic Taylor remainder;
5. pair-only damping for the first coherent tail without fixed-coordinate decoding;
6. unchanged lower-prime decoder and retained damping for `gamma>1`;
7. the ordering-free treatment of `M_dec` versus the anchor-label ceiling;
8. moving-target and no-wrap transport;
9. the entropy-saturation corollary;
10. statement/proof agreement and absence of a hidden surviving `gamma>2` hypothesis.

The repaired fingerprint/CRT bookkeeping should also be checked for exposition fidelity, but it does not reopen the underlying theorem architecture unless the reviewer finds a substantive error.
