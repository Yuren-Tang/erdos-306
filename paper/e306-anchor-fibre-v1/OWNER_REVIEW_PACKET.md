# E306 Owner review packet

**Current manuscript source:** `Yuren-Tang/erdos-306:paper/e306-anchor-fibre-v1@3899f40fb493c2e2f2894f432cada64437a0964c`  
**Title:** *Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem*  
**Status:** independent full-review return received on preceding source `654189fe...`; bounded revision applied; exact revised-source clean build PASS; independent delta recheck remains before fixed-object review closure.  
**Clean-build run:** GitHub Actions run `31292599279` (PASS, 35-page PDF).  
**Publication action:** none authorized by this packet.

## 1. Current theorem package

The theorem package is unchanged by the post-review revision:

1. squarefree-denominator characterization with arbitrary finite avoidance;
2. direct proper-target theorem for fixed reduced `t=a/b in (0,1)`, squarefree `b`, fixed `gamma>2` and `t < (log gamma)^2/2 < 1`;
3. compact-uniform Gaussian profile of the Bernoulli-weighted exact coefficients on every fixed standardized target window;
4. entropy-scale multiplicity in a mesoscopic typical-cardinality window, as a lower bound for the whole exact fibre and at at least one exact cardinality;
5. qualitative prime-dilution closure to arbitrary positive squarefree-denominator rationals.

The article still excludes the `gamma<=2` transition regimes, growing standardized windows, bivariate/prescribed-cardinality local limits, full AFT, sparse/multiblock routes, restricted-prime programmes, and deletion resilience.

## 2. Independent review received

The Owner supplied an independent review of the complete TeX/PDF at `654189fe67b575bd539092f1700754835ee7ebda`. The reader:

- found no fatal mathematical defect;
- specifically stress-tested the zero-exception anchor-rigidity and weighted row-compression mechanisms in Sections 4--5;
- found the decoder-range discipline and Section 6 assembly credible and closed;
- judged the paper mature for arXiv and formal journal review after bounded revision;
- identified one genuine local statement-hygiene defect in the no-wrap lemma and several useful expository/typographic improvements.

The Director disposition is recorded in `INDEPENDENT_REVIEW_DISPOSITION_2026-08-09.md`.

This review is genuine assurance for `654189fe...`; it is not silently promoted to a fixed-object PASS on the revised source.

## 3. Bounded revision applied

Exact revised manuscript source:

`3899f40fb493c2e2f2894f432cada64437a0964c`.

Applied changes:

- made the eventual `Lambda<1` hypothesis explicit in No-wrap;
- renamed Section 2 prime-harmonic `S_X` notation to avoid collision with the random reciprocal sum;
- added the Section 6 scale hierarchy;
- moved the Lean-vs-analytic distinction immediately after the headline theorem and described the paper as a self-contained analytic resolution;
- foregrounded the target rows as a negligible-mass/high-observability arithmetic correction;
- added only the elementary `Corr(S_X,K_X)->0` calculation as motivation for later joint statistics, explicitly not as a theorem;
- enlarged the short bibliography to `\small`;
- reflowed the long Introduction display that caused the independent reader's reported overflow;
- replaced one especially engineering-heavy phrase by `detectable`.

No theorem, proof range, construction, estimate, or quantifier was intentionally altered.

## 4. Suggestions not adopted

- **Greek `ΟΙΣ -> ΟΥΣ`: not adopted.** The proposed correction overlooks classical relative attraction: with an omitted dative antecedent, the relative pronoun may be attracted from the accusative required inside its clause into the dative of that antecedent. `ΚΑΙ ΟΙΣ ΦΙΛΩ` is therefore retained.
- **Dedication font: unchanged.** The controlling E306 choice is GFS Artemisia Regular, not EB Garamond. The dedicated microtypography record is issue #8 comment `5109693351`.
- **New Anchor/Row package propositions: not added.** Sections 4 and 5 already collect those interfaces in prose; formal duplication would enlarge the theorem surface without strengthening the argument.
- **Full formula-label refactor: deferred.** The current explicit numeric scheme is clean-built and protected by a leaked-label gate. A complete semantic-label migration is a later, separately audited source-maintenance task.
- **Sparse sensors / critical `gamma` window / growing `U_X` / abstract sensing graph: deferred to later research.** None is allowed to delay Article 1.

## 5. Revised clean-build status — PASS

GitHub Actions run `31292599279` clean-built the exact source above. It passed:

- frozen-source identity and Oxford spelling;
- XeLaTeX/Biber;
- bibliography/reference/label and missing-glyph checks;
- a new hard **overfull-hbox** gate;
- embedded fonts / no Type 3;
- Unicode extraction of both Greek dedication lines, ORCID, and `Erdős`;
- internal-label leak gate;
- PDF artifact upload.

The revised PDF is 35 A4 pages. One mild underfull box remains and is not treated as a visual/correctness defect.

## 6. Exact next review request

The next independent task should be a **delta recheck**, not another open-ended full review:

```text
base: 654189fe67b575bd539092f1700754835ee7ebda
head: 3899f40fb493c2e2f2894f432cada64437a0964c
```

Ask the checker to verify that:

1. the explicit No-wrap hypothesis now matches the proof context;
2. notation renaming is complete and semantic-preserving;
3. the scale hierarchy is correct for every fixed `gamma>2`;
4. the early Lean/analytic clarification makes no stronger provenance claim;
5. the target-row paragraph accurately distinguishes asymptotically negligible mass from arithmetic observability;
6. the `Corr(S_X,K_X)->0` calculation is correct and clearly labelled motivational only;
7. no mathematical statement, estimate, range, construction, or quantifier changed accidentally;
8. the revised PDF/source remains clean and publication-readable.

A delta PASS may then close the current independent-review gate. If the checker finds a substantive new issue, reopen only its dependency cone.

## 7. Owner disposition after delta PASS

After the delta recheck, the remaining Owner decision is publication routing, not another round of scope expansion. No merge, tag, release, DOI metadata change, arXiv upload, journal submission, endorsement request, or external contact follows automatically.
