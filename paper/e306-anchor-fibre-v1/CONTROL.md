# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **Publication state:** frozen authorial theorem-scope candidate; Owner read and independent mathematical/source review remain before publication action.

## Reopened theorem scope

The former 33-page ETbb/NewTX external-review checkpoint at

```text
bb94f26fa9a33cf7df8ceda7beaeae9f4f129a14
```

was independently sound in its narrower audited scope. It was explicitly reopened after an external read and a connected-neighbourhood mathematical audit showed that the same clean proof spine naturally extends from the unit target `1/b`, `gamma=3`, to every fixed proper rational target in the pair-dominant regime. The Owner-authorized reopening is recorded in issue `#8`, comment `5225095307`.

The former PDF and all earlier arXiv source packets are historical only and must not be submitted or treated as the current review object.

## Exact manuscript-source checkpoint

The whole-plane reread and source/citation audit now freeze the manuscript source at

```text
0157295776c404f73fbc8e4c45883457c047132f
```

relative to the former branch head

```text
751fb07f120c6892fedbfc2b736fbba12282f284.
```

The structural proper-target rewrite was first provisionally checkpointed at `f6a3d388c358679c93b25f3900f0783bcb6299f2`. Before final Owner-review freeze, it was superseded by the following bounded source repairs:

1. `e4a7b08925762a9f2855bb08e4e7188d9bb5d48a` generalized no-wrap from the centre target to every lattice target in `[0,Lambda]`, matching the moving-target theorem actually used;
2. `ec6df1face83653b77b6c1ef4f9cb39fc4017059` and `8cf83598e9cb282d7fb84b02ccced318d3dfb997` repaired and minimized problem/formal-proof provenance;
3. `03f073b2c1a21f88883598796f8e01d6ee5f8d34` repaired the stale Section 3--4 Bernoulli damping interface name `kappa_b -> kappa`; no rigidity, fingerprint, energy, or range statement changed;
4. `eec3e6798ed86845ec42fd599aab6748bb08979a` removed the expository `max T` edge case when the forbidden set is empty, replacing it by direct eventual avoidance of fixed finite `T`; no theorem, estimate, construction, or quantifier changed;
5. `0157295776c404f73fbc8e4c45883457c047132f` corrected the Butler--Erdős--Graham A51 DOI from the locator of A52 (`10.5281/zenodo.10456687`) to the Integers-listed A51 DOI (`10.5281/zenodo.10456673`). This is citation metadata only.

The substantive proper-target rewrite changes `main.tex` and Sections 1, 2, 3, 5, 6, 7, 8, 9, and 10. Section 4's independently audited rigidity mathematics remains byte-identical to the clean manuscript except for the three-symbol damping-interface repair. Any commit after `01572957...` must leave `manuscript/main.tex`, `manuscript/references.bib`, and `manuscript/sections/` byte-identical unless a new mathematical/source disposition explicitly reopens the freeze.

No independent audit or exact-source clean-build PASS is claimed for this source. Remote workflows remain manual-only. The manuscript workflow guards the complete frozen source surface (`main.tex`, `references.bib`, and `sections/`) against `01572957...`.

## Current theorem package

1. **Characterization with finite avoidance.** A positive reduced rational `a/b` is a finite sum of reciprocals of distinct squarefree semiprimes iff `b` is squarefree, with arbitrary finite avoidance.
2. **Direct proper-target theorem.** Fix reduced `t=a/b in (0,1)` with squarefree `b`, and fixed `gamma>2` satisfying `t < (log gamma)^2/2 < 1`. With `Z=X^gamma`, the direct pair family plus target rows represents `t` for all sufficiently large `X`.
3. **Local Gaussian profile.** The Bernoulli-weighted exact coefficients of the same target-adapted family satisfy the compact-uniform Gaussian profile on every fixed standardized target window.
4. **Multiplicity and entropy.** With `alpha=2t/(log gamma)^2`, the typical-cardinality window contains at least `exp([H(alpha)-o(1)]M_X)` exact representations; the total fibre and at least one exact cardinality inherit the same lower bound. No matching total-fibre upper bound is asserted.
5. **Prime-dilution closure.** For arbitrary positive `a/b`, choose a prime `p>a`, `p` not dividing `b`, represent the proper target `a/(bp)` on `p` fresh disjoint supports, and take their union. This treats reduced denominators `1` and `2` without special cases.

Every fixed `0<t<1` admits a `gamma>2` in the pair-dominant regime because

```text
max(2, exp(sqrt(2t))) < gamma < exp(sqrt(2)).
```

## Deliberate exclusions

Article 1 does not restore the older `1<gamma<=2` target-row-dominant variance regimes, arbitrary fixed anchor ratio as standing notation, varying/thin anchors, entropy optimization over `gamma`, the full AFT framework, alternative multiblock/sparse routes, restricted-prime programmes, finite-prefix CRT, growing standardized windows, bivariate/prescribed-cardinality local limits, or deletion resilience.

## Bounded review repairs absorbed

- `b=2` is included naturally by the proper-target theorem rather than patched separately.
- `h_m` is used only inside its proved decoder range; large coherent labels use a separate distinguished state `h_m^*` with no decoder claim.
- Section 6 explicitly accounts for noncoherent distinguished states and all off-minimizer row states.
- `H(alpha)` is the primary multiplicity lower bound; no matching total-fibre upper bound is asserted.
- The abstract/introduction say that the **Bernoulli-weighted exact coefficients** have the Gaussian profile.
- Lean provenance is non-load-bearing; the article is self-contained.
- Secondary MSC `11L07` was replaced by `60F05`.
- No-wrap is stated at the moving-target scope actually used.
- The damping constant is consistently `kappa` across Sections 3 and 4.
- Finite avoidance covers `T = emptyset` without an unstated `max emptyset` convention.
- Butler--Erdős--Graham A51 now carries the correct Integers/Zenodo DOI.

## Equation-reference maintenance

The old source used explicit numeric `\tag{section.number}` keys and numeric `\eqref` calls. In `main.tex` these strings survive only as stable internal label keys: visible equation numbers are generated by LaTeX's sectioned counter, and numeric `\eqref` calls resolve through genuine labels/hyperlinks. The mechanism remains part of the clean-build/source-review gate.

## Presentation profile

Retain, absent a concrete review defect:

- British English with Oxford spelling;
- `amsart`, A4, 11 pt, right equation numbers;
- ETbb OpenType text with NewTX mathematics;
- XeLaTeX;
- numeric `biblatex`/Biber citations sorted `nyt`;
- no affiliation or email;
- compact linked ORCID in the `amsart` author footnote;
- the two-line upright GFS Artemisia inscriptional dedication;
- the concise generative-AI disclosure.

## Formal Lean axis

The archived Lean release is orthogonal evidence for the headline existence statement only. The article does not depend on it, and no claim is made that the local-limit theorem has been formalized.

## Owner-review and independent-review gate

The source to read is exactly `0157295776c404f73fbc8e4c45883457c047132f`. The Owner review should read the article as mathematics, with particular attention to theorem scope, exposition, source comparison, and whether any authorial change is still desired. Any requested change reopens only its declared dependency cone and creates a new exact source checkpoint.

After Owner disposition, one independent mathematical/source review and an exact-source clean XeLaTeX/Biber build are required. Review should especially check:

- `gamma>2` transport and variance dominance;
- target-coordinate decoder ratio `X^{4-2gamma}`;
- normalized tail bounds and parameter order;
- prime-dilution closure;
- `H(alpha)` multiplicity;
- `h_m^*` / Section 6 bookkeeping;
- moving-target no-wrap;
- Section 3--4 damping interface;
- finite-avoidance quantifiers;
- equation-label generation/cross-references;
- citations/provenance and absence of accidental import from the excluded `gamma<=2` architecture.

Until those gates return, do not declare an external-review PDF, create an arXiv packet, mark PR #9 ready, merge, tag, release, alter DOI metadata, upload to arXiv, or submit to a journal.

## Current state

```text
[PROPER-TARGET SCOPE ELEVATION — WHOLE-PLANE-AUDITED OWNER-REVIEW CANDIDATE]
[MANUSCRIPT SOURCE 0157295776c404f73fbc8e4c45883457c047132f]
[OWNER READ NEXT]
[INDEPENDENT REVIEW AFTER OWNER DISPOSITION]
[EXACT-SOURCE CLEAN BUILD STILL REQUIRED]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO PUBLICATION SUBMISSION AUTHORIZED]
```
