# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **Publication state:** frozen authorial theorem-scope candidate; independent mathematical/source review required before a new external-review or submission checkpoint.

## Reopened theorem scope

The former 33-page ETbb/NewTX external-review checkpoint at

```text
bb94f26fa9a33cf7df8ceda7beaeae9f4f129a14
```

was independently sound in its narrower audited scope. It was explicitly reopened after an external read and a connected-neighbourhood mathematical audit showed that the same clean proof spine naturally extends from the unit target `1/b`, `gamma=3`, to every fixed proper rational target in the pair-dominant regime. The Owner-authorized reopening is recorded in issue `#8`, comment `5225095307`.

The former PDF and all earlier arXiv source packets are historical only and must not be submitted or treated as the current review object.

## Exact manuscript-source checkpoint

The reconciled theorem-scope source is frozen at

```text
8cf83598e9cb282d7fb84b02ccced318d3dfb997
```

relative to the former branch head

```text
751fb07f120c6892fedbfc2b736fbba12282f284.
```

The structural proper-target rewrite was first provisionally checkpointed at `f6a3d388c358679c93b25f3900f0783bcb6299f2`. Before review freeze, that provisional checkpoint was intentionally superseded by three bounded source changes:

1. `e4a7b08925762a9f2855bb08e4e7188d9bb5d48a` generalized the no-wrap lemma from the centre target to every lattice target in `[0,Lambda]`, so the moving-target exactness step is actually covered by the stated lemma;
2. `ec6df1face83653b77b6c1ef4f9cb39fc4017059` added the Erdős Problems record and Zenodo formal-proof provenance citations;
3. `8cf83598e9cb282d7fb84b02ccced318d3dfb997` reduced the formal-proof sentence to a non-load-bearing provenance statement.

The mathematical rewrite changes `main.tex` and Sections 1, 2, 3, 5, 6, 7, 8, 9, and 10. Section 4, the one-anchor rigidity proof, is unchanged from the independently audited clean manuscript. Any commit after `8cf83598...` must leave `manuscript/main.tex`, `manuscript/references.bib`, and `manuscript/sections/` byte-identical unless a new mathematical/source disposition explicitly reopens the freeze.

No independent audit or clean-build PASS is claimed for this exact new source. Remote workflows remain manual-only. The manuscript workflow now guards the complete frozen source surface (`main.tex`, `references.bib`, and `sections/`) against `8cf83598...`.

## Current theorem package

1. **Characterization with finite avoidance.** A positive reduced rational `a/b` is a finite sum of reciprocals of distinct squarefree semiprimes iff `b` is squarefree, with arbitrary finite avoidance.
2. **Direct proper-target theorem.** Fix reduced `t=a/b in (0,1)` with squarefree `b`, and fixed `gamma>2` satisfying
   ```text
   t < (log gamma)^2/2 < 1.
   ```
   With `Z=X^gamma`, the direct pair family plus target rows represents `t` for all sufficiently large `X`.
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
- Section 6 explicitly accounts for noncoherent distinguished states and all off-minimizer row states, so no row fibre is left implicit.
- The weaker `-log q` multiplicity clause is removed; `H(alpha)` is the primary lower bound.
- Abstract/introduction say that the **Bernoulli-weighted exact coefficients** have the Gaussian profile.
- Engineering terminology is reduced where ordinary mathematical language is clearer.
- Lean provenance is one non-load-bearing sentence; the article remains self-contained.
- Secondary MSC `11L07` is replaced by `60F05`.
- The no-wrap lemma is stated at the exact moving-target scope actually used in Section 8.

## Equation-reference maintenance

The old source used explicit numeric `\tag{section.number}` keys and numeric `\eqref` calls. In the current `main.tex`, those strings survive only as stable internal label keys: visible equation numbers are generated by LaTeX's sectioned counter, and numeric `\eqref` calls resolve through genuine labels/hyperlinks. The mechanism must be included in the next clean compile/source review; no build PASS is claimed here.

## Presentation profile

The theorem rewrite does not reopen the selected visual design. Retain, absent a concrete review defect:

- British English with Oxford spelling;
- `amsart`, A4, 11 pt, right equation numbers;
- ETbb OpenType text with NewTX mathematics;
- XeLaTeX;
- numeric `biblatex`/Biber citations sorted `nyt`;
- no affiliation or email;
- compact linked ORCID in the `amsart` author footnote;
- the two-line upright GFS Artemisia inscriptional dedication;
- the existing concise generative-AI disclosure.

## Formal Lean axis

The archived Lean release is orthogonal evidence for the headline existence statement only. The article does not depend on it, and the present rewrite makes no claim that the local-limit theorem has been formalized.

## Next gate

The next permissible product action is one independent mathematical/source review of exact manuscript checkpoint `8cf83598e9cb282d7fb84b02ccced318d3dfb997`, including a clean compile. The review should especially check:

- the `gamma>2` transport and variance dominance;
- target-coordinate decoder ratio `X^{4-2gamma}`;
- all normalized tail bounds and parameter order;
- prime-dilution closure;
- the `H(alpha)` multiplicity statement;
- `h_m^*` and the complete Section 6 bookkeeping;
- the generalized no-wrap lemma for moving targets;
- the equation-label mechanism and generated cross-references;
- source/provenance citations and absence of accidental import from the older `gamma<=2` architecture.

Until that review returns, do not declare a new external-review PDF, create an arXiv packet, mark PR #9 ready, merge, tag, release, alter DOI metadata, upload to arXiv, or submit to a journal.

## Current state

```text
[PROPER-TARGET SCOPE ELEVATION — FROZEN AUTHORIAL CANDIDATE]
[MANUSCRIPT SOURCE 8cf83598e9cb282d7fb84b02ccced318d3dfb997]
[ONE-ANCHOR RIGIDITY CORE UNCHANGED]
[INDEPENDENT REVIEW REQUIRED]
[REMOTE CI MANUAL-ONLY / CLEAN BUILD NOT YET CLAIMED]
[OLD 33-PAGE REVIEW PDF SUPERSEDED]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO PUBLICATION SUBMISSION AUTHORIZED]
```
