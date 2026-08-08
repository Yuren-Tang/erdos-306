# E306-PAPER-01 — controlling publication surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Publication gate:** `#11`
- **Draft PR:** `#9`
- **Sole article branch:** `paper/e306-anchor-fibre-v1`
- **Base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **PR state:** open / draft / unmerged
- **Publication state:** theorem-scope rewrite complete at authorial-candidate level; independent review of the new fixed object is required before a new external-review or submission checkpoint may be declared.

## Why the previous freeze was reopened

The 33-page ETbb/NewTX external-review checkpoint at

```text
bb94f26fa9a33cf7df8ceda7beaeae9f4f129a14
```

was mathematically sound in its audited scope, but an independent external read identified a natural theorem-scope improvement. A connected-neighbourhood audit in `research-workbench` then showed that the clean proof spine extends, without restoring the older six-sector parameterized architecture, from the unit target `1/b` at `gamma=3` to every fixed proper rational target in the pair-dominant regime.

The Owner authorized reopening the freeze. The durable issue record is `#8` comment `5225095307`.

The former 33-page PDF and its presentation PASS remain historical evidence only. They are not the current review object and must not be submitted.

## Current manuscript-source checkpoint

The theorem-scope rewrite is fixed at exact manuscript-source commit

```text
f6a3d388c358679c93b25f3900f0783bcb6299f2
```

relative to the former external-review branch head

```text
751fb07f120c6892fedbfc2b736fbba12282f284.
```

The rewrite changes `main.tex` and Sections 1, 2, 3, 5, 6, 7, 8, 9, and 10. Section 4, the one-anchor rigidity proof, is byte-unchanged. The rewrite therefore changes the theorem language and the interfaces that genuinely depend on the target and exponent while preserving the independently audited rigidity core.

No independent audit of this exact new object has yet returned. No manuscript workflow was dispatched for this rewrite; remote workflows remain manual-only by Owner disposition. A green historical workflow is not evidence for this new checkpoint.

## Current theorem package

1. **Squarefree-denominator characterization with finite avoidance.** A positive reduced rational `a/b` is a finite sum of reciprocals of distinct squarefree semiprimes iff `b` is squarefree; the support can avoid any prescribed finite set.
2. **Direct proper-target theorem.** Fix a reduced `t=a/b in (0,1)` with squarefree `b`, and fixed `gamma>2` satisfying
   ```text
   t < (log gamma)^2/2 < 1.
   ```
   With `Z=X^gamma`, the direct pair family plus target rows represents `t` for all sufficiently large `X` and avoids every prescribed finite set.
3. **Local Gaussian profile.** For the same fixed target-adapted family, the Bernoulli-weighted exact coefficients on every fixed standardized compact target window have the Gaussian profile
   ```text
   L_X sigma_X W_X(t+j/L_X)
     = Phi(j/(L_X sigma_X)) + o_U(1).
   ```
4. **Multiplicity and entropy.** In the mesoscopic typical-cardinality window the exact fibre has at least
   ```text
   exp([H(alpha)-o(1)] M_X),
   alpha = 2t/(log gamma)^2,
   ```
   representations. The whole exact fibre inherits the same lower bound, and at least one exact cardinality has the same exponential rate. No matching upper bound for the total fibre is claimed.
5. **Qualitative closure by prime dilution.** Arbitrary positive rationals with squarefree reduced denominator are reached from the proper-target theorem by replacing `a/b` with `a/(bp)` for a fresh prime `p>a` and taking `p` pairwise disjoint avoiding representations. Reduced denominators `1` and `2` need no special cases.

For every fixed `0<t<1`, an admissible exponent with `gamma>2` exists because

```text
max(2, exp(sqrt(2t))) < gamma < exp(sqrt(2).
```

(The displayed upper endpoint means `exp(sqrt(2))`.)

## Deliberate scope

The article does **not** restore:

- the older `1<gamma<=2` target-row-dominant variance regimes or their extra transition sector;
- arbitrary fixed anchor ratio `eta` as standing notation;
- a varying or shrinking anchor ratio;
- entropy optimization over `gamma`;
- the fully abstract anchor–fibre transference theorem;
- alternative multiblock or sparse-sensor routes;
- restricted-prime / progression / Chebotarev variants;
- finite-prefix CRT or reciprocal-incidence programmes;
- growing standardized target radius;
- prescribed-cardinality asymptotics or a bivariate local limit;
- adversarial deletion resilience.

These remain knowledge-plane mathematics or frontiers rather than Article 1 scope.

## Review repairs absorbed in the rewrite

The bounded rewrite also closes the cheap issues identified by the external reader:

- `b=2` is no longer patched separately; it is a special case of the proper-target theorem;
- the large coherent-label range no longer misuses `h_m` outside the decoder theorem: it uses a distinct `h_m^*` distinguished row-minimizer state and explicitly asserts no decoder identification there;
- Section 6 now states the complete bookkeeping: noncoherent distinguished states are controlled by the anchor bound and all off-minimizer row states, over coherent and noncoherent anchors alike, are controlled once by weighted row compression;
- the weaker `-log q` multiplicity theorem clause has been removed in favour of the stronger `H(alpha)` lower bound already implied by the typical-cardinality window;
- the abstract and introduction now say that the **Bernoulli-weighted exact coefficients** have a local Gaussian profile, avoiding an unweighted-cardinality reading;
- engineering terminology has been reduced where ordinary mathematical language is clearer;
- Lean provenance is one non-load-bearing sentence in the introduction;
- the secondary MSC code `11L07` has been replaced by `60F05`.

## Equation-reference maintenance

The reviewed source contained explicit numeric `\tag{section.number}` keys and numeric `\eqref` calls. The current `main.tex` retains those strings only as stable internal label keys. Visible equation numbers now come from LaTeX's sectioned equation counter, and numeric `\eqref` calls resolve through genuine labels and hyperlinks. The mathematical sections therefore no longer require hand-synchronizing displayed numbers after insertions or deletions.

This mechanism is part of the new authorial candidate and must be included in the clean compile and independent source review. No build PASS is claimed here.

## Article architecture

The article retains the clean ten-section architecture:

1. Introduction and main theorems.
2. The direct semiprime family.
3. Fourier inversion and exactness.
4. One-anchor rigidity.
5. Row observability and weighted compression.
6. Local Gaussian analysis.
7. Multiplicity and typical cardinality.
8. Moving-target local saturation.
9. Characterization and finite-avoidance consequences.
10. Further questions and perspective.

Narrative spine:

```text
proper target / arithmetic family
 -> anchor rigidity
 -> row observability
 -> weighted row compression
 -> Gaussian localization
 -> local exact coefficients
 -> prime-dilution characterization.
```

## Presentation profile

The bounded theorem-scope rewrite does not reopen the selected visual design. Unless a new review finds a concrete presentation defect, retain:

- British English with Oxford spelling;
- `amsart`, A4, 11 pt, right equation numbers;
- ETbb OpenType text and NewTX mathematics;
- XeLaTeX;
- numeric `biblatex`/Biber citations sorted `nyt`;
- no affiliation or email;
- compact linked ORCID in the `amsart` author footnote;
- the two-line upright GFS Artemisia inscriptional dedication;
- the existing concise generative-AI disclosure.

The old external-review PDF and all earlier arXiv source packets are superseded as review/submission objects. A fresh PDF and source packet are produced only after the new mathematical review loop closes.

## Formal Lean axis

The archived Lean release remains orthogonal historical/formal evidence for the headline existence statement. The article is self-contained, its analytic proof does not depend on the formal artifact, and the present rewrite makes no claim that the new local-limit theorem has been formalized.

## Next gate

The next permissible product action is a **one-off independent mathematical/source review of the exact manuscript checkpoint `f6a3d388...`**, including a clean compile. That review should especially check the `gamma>2` transport, target-coordinate decoder ratio, tail normalization, prime-dilution closure, `H(alpha)` multiplicity statement, `h_m^*` bookkeeping, and the new equation-label mechanism.

Until that review returns:

- do not treat the new theorem scope as independently certified by this exact manuscript;
- do not declare a new external-review PDF checkpoint;
- do not create an arXiv source packet;
- do not mark PR #9 ready;
- do not merge, tag, release, alter DOI metadata, upload to arXiv, or submit to a journal.

## Current state

```text
[PROPER-TARGET SCOPE ELEVATION — AUTHORIAL CANDIDATE]
[MANUSCRIPT SOURCE f6a3d388c358679c93b25f3900f0783bcb6299f2]
[ONE-ANCHOR RIGIDITY CORE UNCHANGED]
[INDEPENDENT REVIEW REQUIRED]
[REMOTE CI MANUAL-ONLY / NOT DISPATCHED]
[OLD 33-PAGE REVIEW PDF SUPERSEDED]
[PR #9 OPEN / DRAFT / UNMERGED]
[NO PUBLICATION SUBMISSION AUTHORIZED]
```
