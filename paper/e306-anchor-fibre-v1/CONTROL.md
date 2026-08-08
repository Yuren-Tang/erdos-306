# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **Publication state:** frozen Owner-review candidate; exact-source clean build PASS; independent mathematical/source review remains required after Owner disposition.

## Current exact manuscript source

The manuscript handed to the Owner is exactly

```text
654189fe67b575bd539092f1700754835ee7ebda
```

The branch may be ahead of this SHA only through workflow/control/profile/review-packet commits. `main.tex`, `references.bib`, and `sections/` are frozen against this source by the manuscript workflow.

The earlier proper-target checkpoints remain provenance only. The bounded source sequence after the substantive rewrite includes:

1. moving-target no-wrap generalized to every lattice target actually used;
2. problem/formal-proof provenance repaired and minimized;
3. the stale Section 3--4 damping interface `kappa_b -> kappa` repaired;
4. empty-forbidden-set `max T` wording removed;
5. Butler--Erdős--Graham A51 DOI corrected to `10.5281/zenodo.10456673`;
6. **review-build equation-reference repair:** Action exposed that the synthetic legacy equation-label shim did not create labels under `amsmath`, so internal names leaked into PDF text. The manuscript now keeps its explicit historical `\tag{section.number}` values and renders the matching numeric equation references directly; the sole named equation reference in Section 8 was changed to its stable numeric key `(8.4)`. No theorem, displayed formula, proof range, estimate, construction, or quantifier changed.

The last source-changing commit above is `654189fe67b575bd539092f1700754835ee7ebda`.

## Current theorem package

1. **Characterization with finite avoidance.** A positive reduced rational `a/b` is a finite sum of reciprocals of distinct squarefree semiprimes iff `b` is squarefree, with arbitrary finite avoidance.
2. **Direct proper-target theorem.** Fix reduced `t=a/b in (0,1)` with squarefree `b`, and fixed `gamma>2` satisfying `t < (log gamma)^2/2 < 1`. With `Z=X^gamma`, the direct pair family plus target rows represents `t` for all sufficiently large `X`.
3. **Local Gaussian profile.** The Bernoulli-weighted exact coefficients of the same target-adapted family satisfy the compact-uniform Gaussian profile on every fixed standardized target window.
4. **Multiplicity and entropy.** With `alpha=2t/(log gamma)^2`, the typical-cardinality window contains at least `exp([H(alpha)-o(1)]M_X)` exact representations; the total fibre and at least one exact cardinality inherit the same lower bound. No matching total-fibre upper bound is asserted.
5. **Prime-dilution closure.** Arbitrary positive squarefree-denominator rationals follow from finitely many pairwise disjoint proper-target representations obtained by successive finite avoidance.

Every fixed `0<t<1` admits a pair-dominant exponent because

```text
max(2, exp(sqrt(2t))) < gamma < exp(sqrt(2)).
```

## Deliberate exclusions

Article 1 does not restore the `1<gamma<=2` target-row-dominant regimes, arbitrary/varying anchors, entropy optimization, full AFT, multiblock/sparse alternative routes, restricted-prime programmes, finite-prefix CRT, growing standardized windows, bivariate/prescribed-cardinality local limits, or deletion resilience.

## Clean-build checkpoint

GitHub Actions run

```text
31256191144
```

on branch head `ee6ab5c42f6334f621c650bd304e92a5cf2061ec` clean-built manuscript source `654189fe...` and **passed all configured gates**:

- source freeze and Oxford spelling;
- XeLaTeX/Biber build;
- bibliography/reference/label/missing-glyph checks;
- Biber warning/error gate;
- embedded fonts and no Type 3;
- Unicode Greek dedication, ORCID, and `Erdős` extraction;
- internal-label leak gate;
- 34-page PDF artifact upload.

This is presentation/execution evidence only. It is not independent mathematical review.

## Presentation profile

Retain, absent a concrete review defect:

- British English with Oxford spelling;
- `amsart`, A4, 11 pt, right equation numbers;
- ETbb OpenType text with NewTX mathematics;
- XeLaTeX;
- numeric `biblatex`/Biber citations sorted `nyt`;
- no affiliation or email;
- compact linked ORCID;
- two-line upright GFS Artemisia inscriptional dedication;
- concise generative-AI disclosure.

## Formal Lean axis

The archived Lean release is orthogonal evidence for the headline characterization only. The article does not depend on it and the local-limit theorem is not claimed formalized.

## Next gate

**Owner read is now the active gate.** The Owner-review brief is `paper/e306-anchor-fibre-v1/OWNER_REVIEW_PACKET.md` and the review PDF is the artifact of Action run `31256191144`.

After Owner disposition, commission one independent mathematical/source review of exact source `654189fe67b575bd539092f1700754835ee7ebda`. Special attention should go to `gamma>2` transport, target-row decoder ratio, normalized tails/order of limits, moving-target no-wrap, `H(alpha)` multiplicity, `h_m^*` bookkeeping, prime dilution, and source/provenance scope.

If either the Owner or independent reader finds a concrete defect, reopen only its dependency cone and freeze a new SHA. Otherwise proceed to publication preparation only after explicit Owner authorization.

Do **not** mark PR #9 ready, merge, tag, release, alter DOI metadata, upload to arXiv, or submit to a journal without that authorization.

## Current state

```text
[PROPER-TARGET SCOPE ELEVATION — WHOLE-PLANE-AUDITED OWNER-REVIEW CANDIDATE]
[MANUSCRIPT SOURCE 654189fe67b575bd539092f1700754835ee7ebda]
[CLEAN XELATEX/BIBER REVIEW BUILD PASS — ACTION 31256191144]
[34-PAGE OWNER-REVIEW PDF AVAILABLE]
[OWNER READ NEXT]
[INDEPENDENT REVIEW AFTER OWNER DISPOSITION]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO PUBLICATION SUBMISSION AUTHORIZED]
```
