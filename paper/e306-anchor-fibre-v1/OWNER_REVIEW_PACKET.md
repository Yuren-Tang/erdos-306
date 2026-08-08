# E306 Owner review packet

**Review object:** `Yuren-Tang/erdos-306:paper/e306-anchor-fibre-v1@0157295776c404f73fbc8e4c45883457c047132f`  
**Title:** *Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem*  
**Status:** frozen Owner-review candidate; not yet independently reviewed at this theorem scope; exact-source clean build still required.  
**Publication action:** none authorized by this packet.

## 1. What the paper claims

The article has one qualitative theorem package and one direct quantitative package.

1. **Exact characterization with finite avoidance.** A positive rational has a representation as a finite sum of reciprocals of pairwise distinct squarefree semiprimes exactly when its reduced denominator is squarefree. Any prescribed finite set of denominators may be avoided.
2. **Direct proper-target theorem.** Fix a reduced `t=a/b in (0,1)` with squarefree `b`, and fix `gamma>2` with
   `t < (log gamma)^2/2 < 1`.  The target-adapted complete-pair family plus denominator rows represents `t` for all sufficiently large `X`.
3. **Compact-uniform local Gaussian profile.** For the same fixed family and Bernoulli law, the exact coefficient at `t+j/L_X` has a Gaussian profile uniformly on every fixed standardized window `|j| <= U L_X sigma_X`.
4. **Entropy-scale multiplicity.** The exact fibre contains `exp([H(alpha)-o(1)]M_X)` representations in a mesoscopic typical-cardinality window, where `alpha=2t/(log gamma)^2`; the same exponential lower bound holds for the whole exact fibre and for at least one exact cardinality in the window.
5. **Prime-dilution closure.** An arbitrary positive rational with squarefree reduced denominator is obtained by representing one proper target on finitely many pairwise disjoint supports and taking their union.

## 2. What the paper deliberately does not claim

The current article does **not** claim:

- the `1<gamma<=2` target-row-dominant variance regimes;
- a theorem with arbitrary or varying terminal anchor ratio;
- a growing standardized target radius `U_X -> infinity`;
- a bivariate local limit or prescribed-cardinality local asymptotic;
- a matching upper bound for the total exact fibre;
- adversarial deletion resilience of one already constructed family;
- a target-independent primorial/fixed-prefix gap-free theorem;
- restricted-prime / progression / Chebotarev variants;
- the full abstract anchor--fibre transference framework as part of the paper;
- multiblock or sparse-sensor alternative proof routes.

The point of the present scope is to give one clean, self-contained arithmetic realization whose local coefficient geometry is fully visible.

## 3. Recommended reading order

### Pass A — decide whether this is the right paper

Read:

1. abstract and Section 1;
2. the theorem statements in Sections 7--9;
3. Section 10.

Questions for this pass:

- Is the theorem package the paper you want to publish?
- Is the distinction between the qualitative characterization and the proper-target quantitative theorem immediately clear?
- Is `gamma>2` presented as a clean proof regime rather than as an artificial restriction on the target set?
- Is the local-limit theorem described correctly as a statement about **Bernoulli-weighted exact coefficients**, not about a uniform distribution on representations?
- Are the exclusions in Section 10 sufficient and appropriately prominent?

### Pass B — read the proof spine as mathematics

Read:

4. Section 2 — direct family, reciprocal load, variance, lattice scale;
5. Section 3 — finite Fourier coefficient, CRT factor partition, exact centring, no-wrap;
6. Section 4 — reciprocal dispersion, one-anchor rigidity, zero-exception, fingerprint count;
7. Section 5 — row observability, decoder ranges, weighted fibre compression, retained damping;
8. Section 6 — Gaussian major, coherent tails, incoherent remainder, normalized assembly;
9. Section 8 — moving-target character twist and compact-uniform transfer.

Questions for this pass:

- Does every transition from a weighted Fourier statement to an existence statement have an explicit logical gate?
- Does no-wrap appear only after quotient positivity, rather than being smuggled into the Fourier calculation?
- Are `h_m` and the large-label distinguished state used only in their proved ranges?
- Is the factor partition exhaustive, with no denominator silently used twice or discarded before it is needed for damping?
- Does the order of parameters remain fixed data, then fixed `C`, then `X -> infinity`, and only afterwards `C -> infinity`?
- Is the moving-target theorem visibly the same modulus problem plus a unit character, rather than a new unproved minor-arc assertion?

### Pass C — multiplicity and closure

Read:

10. Section 7 — entropy and exact-cardinality extraction;
11. Section 9 — direct proper-target existence, prime dilution, finite prescription, common refinement.

Questions for this pass:

- Is the conversion from Bernoulli target mass to the **unweighted** number of representations transparent?
- Is it clear that `H(alpha)` is a lower bound for the exact fibre and a matching exponent only for the ambient mesoscopic window, not a global exact-fibre asymptotic?
- Is the one-exact-cardinality conclusion correctly weaker than a prescribed-cardinality theorem?
- In prime dilution, is it clear why `a/(bp)` is reduced, why the denominator is squarefree, and why successive finite avoidance makes the `p` supports pairwise disjoint?
- Are the qualitative consequences of finite avoidance worth retaining at their present length?

## 4. Source and proof-assurance boundaries

This object is an **authorial/Director-audited fixed source**, not an independently reviewed proof at the new proper-target scope.

The old independently reviewed clean manuscript certified a narrower specialization (`t=1/b`, `gamma=3`, top block `[Z/2,Z)`) and remains genuine assurance for that specialization and for the characterization via the old closure route.  It does not automatically certify the present proper-target transport.

The Lean 4 release is another separate assurance object for the headline existence characterization.  It is not a formalization of this article's one-anchor proof and does not formalize the local-limit or multiplicity results.

The current article was stress-tested against the wider research-workbench mathematical plane.  That reread found no mature general theorem which should replace the present arithmetic proof by an abstract citation.  The reusable finite-Fourier/anchor--fibre theorem is best regarded here as the logical skeleton; reciprocal rigidity, row observability, decoder separation, and retained damping remain the substantive problem-specific mathematics.

## 5. Bounded repairs since the proper-target rewrite

The exact source history is recorded so that later review can distinguish theorem changes from repair noise.

- generalized no-wrap to all lattice targets actually used by the moving-target theorem;
- repaired problem/formal-proof provenance wording;
- changed three stale `kappa_b` occurrences in the unchanged anchor section to the proper-target Section 3 constant `kappa`;
- removed the undefined `max T` wording when the finite forbidden set is empty;
- corrected the Butler--Erdős--Graham A51 DOI from the A52 locator to `10.5281/zenodo.10456673`.

The last three changes are respectively an interface-name repair, an empty-set wording repair, and citation metadata.  None changes a theorem, asymptotic, proof range, or construction.

## 6. Clean-build status

The manuscript workflow is manual-only and is configured to reject any difference between the review source

`0157295776c404f73fbc8e4c45883457c047132f`

and the current `main.tex`, `references.bib`, or `sections/` tree.  It also performs XeLaTeX/Biber compilation, reference/label/glyph checks, font embedding checks, Unicode dedication/ORCID extraction, and PDF artifact upload.

There is **no exact-source successful workflow run yet**.  Historical manuscript runs were green on earlier sources and are not counted as evidence for this object.  The exact-source clean build remains a required execution gate after, or in parallel with, the Owner read.

## 7. Suggested independent-review brief after Owner disposition

Give the independent reader the exact source SHA above and ask for a fixed-object review, with special attention to:

1. proper-target `gamma>2` transport and pair-dominant variance;
2. target-coordinate decoder ratio `O_b(X^{4-2gamma})`;
3. reciprocal-dispersion / zero-exception / fingerprint interfaces after the `kappa` parameter transport;
4. all normalized tail estimates and the order of limits;
5. complete row-minimizer / off-minimizer bookkeeping;
6. moving-target unit-character transfer and generalized no-wrap;
7. entropy-window argument, total-fibre lower bound, and one-exact-cardinality extraction;
8. prime-dilution closure and finite-avoidance quantifiers;
9. equation-label bridge and clean compilation;
10. bibliography/source claims and absence of accidental import from the excluded `gamma<=2` architecture.

A PASS should be attached to this exact source object.  If a defect is found, repair only its declared dependency cone, freeze a new source SHA, and recheck that bounded delta.

## 8. Owner disposition requested

After reading, the useful outcomes are simply:

- **accept the mathematical/expository scope as the publication candidate**, subject to clean build and independent review; or
- identify concrete changes you want before external review.

No merge, tag, release, DOI metadata change, arXiv upload, or journal submission is implied by either outcome.
