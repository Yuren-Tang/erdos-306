# E306 Owner review packet

**Review object:** `Yuren-Tang/erdos-306:paper/e306-anchor-fibre-v1@654189fe67b575bd539092f1700754835ee7ebda`  
**Title:** *Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem*  
**Status:** frozen Owner-review candidate; exact-source clean build PASS; not yet independently reviewed at the new proper-target theorem scope.  
**Clean-build run:** GitHub Actions run `31256191144` (PASS, 34-page PDF).  
**Publication action:** none authorized by this packet.

## 1. What the paper claims

The article has one qualitative theorem package and one direct quantitative package.

1. **Exact characterization with finite avoidance.** A positive rational is a finite sum of reciprocals of pairwise distinct squarefree semiprimes exactly when its reduced denominator is squarefree; any prescribed finite set of denominators may be avoided.
2. **Direct proper-target theorem.** Fix reduced `t=a/b in (0,1)` with squarefree `b`, and fixed `gamma>2` with `t < (log gamma)^2/2 < 1`. The target-adapted complete-pair family plus target rows represents `t` for all sufficiently large `X`.
3. **Compact-uniform local Gaussian profile.** For that same family and Bernoulli law, the exact coefficient at `t+j/L_X` has the Gaussian profile uniformly on every fixed standardized window `|j| <= U L_X sigma_X`.
4. **Entropy-scale multiplicity.** The exact fibre contains `exp([H(alpha)-o(1)]M_X)` representations in a mesoscopic typical-cardinality window, with `alpha=2t/(log gamma)^2`; the same exponential lower bound holds for the whole exact fibre and for at least one exact cardinality in that window.
5. **Prime-dilution closure.** An arbitrary positive rational with squarefree reduced denominator is obtained by representing one proper target on finitely many pairwise disjoint supports and taking their union.

## 2. What the paper deliberately does not claim

The article does **not** claim the `1<gamma<=2` target-row-dominant regimes, varying/thin anchors, a growing standardized radius `U_X`, a bivariate or prescribed-cardinality local limit, a matching upper bound for the total exact fibre, adversarial deletion resilience, a target-independent primorial gap-free theorem, restricted-prime/Chebotarev variants, or the full AFT/multiblock/sparse-sensor machinery as part of this paper.

The intended scope is one clean, self-contained arithmetic realization whose local coefficient geometry is visible without importing the whole portfolio framework.

## 3. Recommended reading order

### Pass A — decide whether this is the right paper

Read the abstract and Section 1, the theorem statements in Sections 7--9, then Section 10. Ask whether the qualitative characterization and proper-target quantitative theorem are clearly distinguished; whether `gamma>2` reads as a clean proof regime rather than an artificial restriction on targets; whether the local limit is unmistakably about **Bernoulli-weighted exact coefficients**; and whether the exclusions are sufficiently prominent.

### Pass B — read the proof spine as mathematics

Read Sections 2--6 and then Section 8:

- Section 2: direct family, reciprocal load, variance, lattice scale;
- Section 3: finite Fourier coefficient, CRT factor partition, exact centring, no-wrap;
- Section 4: reciprocal dispersion, one-anchor rigidity, zero-exception, fingerprint count;
- Section 5: row observability, decoder ranges, weighted fibre compression, retained damping;
- Section 6: Gaussian major, coherent tails, incoherent remainder, normalized assembly;
- Section 8: moving-target unit-character twist and compact-uniform transfer.

Useful hostile questions: does every weighted-Fourier-to-existence transition have an explicit logical gate? Is no-wrap postponed until after quotient positivity? Are `h_m` and the large-label distinguished state used only in proved ranges? Is the factor partition exhaustive? Is the order fixed data, fixed `C`, `X -> infinity`, then `C -> infinity`? Does moving-target analysis really import no new modulus estimate?

### Pass C — multiplicity and closure

Read Sections 7 and 9. Check that the conversion from Bernoulli mass to **unweighted** representation count is transparent; that `H(alpha)` is not misdescribed as a global exact-fibre asymptotic; that one exact cardinality is not confused with every prescribed cardinality; and that prime dilution really produces reduced proper targets and pairwise disjoint supports through successive finite avoidance.

## 4. Assurance boundaries

This is an **authorial/Director-audited fixed source**, not an independently reviewed proof at the new proper-target scope.

The old independent review remains genuine assurance for the narrower specialization `t=1/b`, `gamma=3`, top block `[Z/2,Z)`. It does not automatically certify the proper-target transport. The Lean 4 release is another separate assurance object for the headline characterization and is not a formalization of this article's local-limit proof.

The whole-plane research-workbench reread found no mature general theorem that should replace the concrete arithmetic argument here. AFT/finite Fourier remains the natural logical skeleton; reciprocal rigidity, row observability, decoder separation, retained damping, and Gaussian assembly remain the substantive problem-specific proof.

## 5. Bounded source repairs before this checkpoint

The proper-target rewrite was followed by bounded repairs only:

- generalized no-wrap to the lattice targets actually used by the moving-target theorem;
- repaired/minimized problem and formal-proof provenance;
- changed three stale `kappa_b` occurrences to the proper-target damping constant `kappa`;
- removed the undefined `max T` wording for `T = emptyset`;
- corrected the Butler--Erdős--Graham A51 DOI to `10.5281/zenodo.10456673`;
- **clean-build repair:** the first review build exposed that the synthetic equation-label shim did not actually create labels under `amsmath`, causing internal names such as `e306eq:6.10` to appear in PDF text. The source now keeps the historically explicit `\tag{section.number}` system and renders its matching numeric equation references directly. The sole named equation reference in Section 8 was replaced by its stable numeric key `(8.4)`. No theorem, formula, proof range, asymptotic, or mathematical argument changed.

The final manuscript-source checkpoint after that bounded rendering repair is

`654189fe67b575bd539092f1700754835ee7ebda`.

## 6. Clean-build status — PASS

GitHub Actions run `31256191144` clean-built the exact frozen source above and passed every configured gate:

- frozen-source identity;
- Oxford spelling;
- XeLaTeX/Biber clean build;
- bibliography/reference/label and missing-glyph checks;
- Biber warning/error gate;
- embedded fonts / no Type 3;
- Unicode extraction of both Greek dedication lines, ORCID, and `Erdős`;
- internal-label leak check;
- PDF artifact upload.

The resulting review PDF is 34 A4 pages. This is execution/presentation evidence, **not** an independent mathematical review.

## 7. Suggested independent-review brief after Owner disposition

Give the independent reader exact source `654189fe67b575bd539092f1700754835ee7ebda` and ask especially about:

1. proper-target `gamma>2` transport and pair-dominant variance;
2. target-coordinate decoder ratio `O_b(X^{4-2gamma})`;
3. reciprocal-dispersion / zero-exception / fingerprint interfaces after the `kappa` transport;
4. all normalized tails and the order of limits;
5. complete row-minimizer / off-minimizer bookkeeping;
6. moving-target unit-character transfer and generalized no-wrap;
7. entropy-window argument, total-fibre lower bound, and one-exact-cardinality extraction;
8. prime-dilution closure and finite-avoidance quantifiers;
9. source/provenance claims and absence of accidental `gamma<=2` imports.

If a defect is found, repair only its declared dependency cone, freeze a new SHA, and recheck that bounded delta.

## 8. Owner disposition requested

After reading, either accept the mathematical/expository scope as the publication candidate subject to independent review, or identify concrete changes desired before that review. No merge, tag, release, DOI metadata change, arXiv upload, or journal submission is implied.
