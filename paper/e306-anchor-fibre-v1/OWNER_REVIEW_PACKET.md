# E306 Owner review packet

**Current manuscript source:** `Yuren-Tang/erdos-306:paper/e306-anchor-fibre-v1@20fd8c774397faf14208fcdce550b344a6e9b77b`  
**Title:** *Squarefree Semiprime Unit Fractions: A Characterization and a Local Limit Theorem*  
**Status:** first independent full-review return received on earlier source `654189fe...`; bounded revision completed; source-maintenance pass completed; exact current-source clean build PASS; clean second independent full review is next.  
**Clean-build run:** GitHub Actions run `31303386599` (PASS, 35-page A4 PDF).  
**Publication action:** none authorized by this packet.

## 1. Current theorem package

The theorem package is unchanged by the post-review source-maintenance pass:

1. squarefree-denominator characterization with arbitrary finite avoidance;
2. direct proper-target theorem for fixed reduced `t=a/b in (0,1)`, squarefree `b`, fixed `gamma>2` and `t < (log gamma)^2/2 < 1`;
3. compact-uniform Gaussian profile of the Bernoulli-weighted exact coefficients on every fixed standardized target window;
4. entropy-scale multiplicity in a mesoscopic typical-cardinality window, as a lower bound for the whole exact fibre and at at least one exact cardinality;
5. qualitative prime-dilution closure to arbitrary positive squarefree-denominator rationals.

The article still excludes the `gamma<=2` transition regimes, growing standardized windows, bivariate/prescribed-cardinality local limits, full AFT, sparse/multiblock routes, restricted-prime programmes, and deletion resilience.

## 2. First independent review and bounded revision

The Owner supplied an independent review of complete source/PDF object `654189fe67b575bd539092f1700754835ee7ebda`. The reader found no fatal mathematical defect, stress-tested the Sections 4--6 core, and advised bounded revision. The Director disposition is preserved in `INDEPENDENT_REVIEW_DISPOSITION_2026-08-09.md`.

The bounded mathematical/expository revision produced source `3899f40fb493c2e2f2894f432cada64437a0964c`, which clean-built successfully. The first review remains genuine assurance for its reviewed object; it is historical evidence, not an automatic PASS on the current fixed object.

## 3. Final Owner-requested maintenance before second review

The Owner then requested two source-maintenance decisions before arranging a fresh independent review.

### A. Equation references

The earlier explicit equation numbers are preserved exactly, but formula references now use ordinary LaTeX/hyperref infrastructure.

- **190** explicit visible `\tag{section.number}` displays remain.
- Each has exactly one equation label.
- There are **190 unique equation labels** and **94 equation references**.
- Existing descriptive labels `eq:unit-character` for (8.4) and `eq:moving-profile` for (8.15) were retained instead of stacking generated numeric aliases.
- Other displays use `eq:section.number` fallback labels.
- The former global synthetic `\eqref` override is removed.
- The workflow rejects missing targets, duplicate/multiple labels, legacy bare numeric `\eqref`, and internal-label leakage into extracted PDF text.

The visible equation numbers and mathematical formulas are unchanged.

### B. Greek dedication face

The Owner correctly recalled an earlier E306 instruction that the dedication should use **EB Garamond only**, provided it compiled, embedded, and extracted cleanly without disturbing the body typography. That conditional choice had not previously been completed; the landed path had instead gone through GFS Didot and then GFS Artemisia.

The current XeLaTeX/OpenType test succeeded. The final dedication therefore uses EB Garamond Regular, while body text remains ETbb and mathematics remains NewTX. The Greek wording and all dedication spacing/size decisions are unchanged:

`ΤΟΙΣ ΕΜΕ ΦΙΛΟΥΣΙΝ`

`ΚΑΙ ΟΙΣ ΦΙΛΩ`

Equal-scale first-page renders of the Artemisia and EB Garamond builds were visually compared. EB Garamond is retained: it is narrower and quieter and integrates more naturally with the ETbb title page while remaining distinct from the author line and body.

## 4. Current exact source and clean build

The exact second-review manuscript source is

`20fd8c774397faf14208fcdce550b344a6e9b77b`.

GitHub Actions run `31303386599` (run 196; execution head `4bafe3eca68a8a823167e77ba9aeda744a2c9830`) clean-built that source and passed the full source/reference/build/font/extraction gate. The resulting PDF is **35 A4 pages**; EB Garamond is embedded as a subsetted CID OpenType font, with no Type 3 fonts and exact Greek Unicode extraction. PDF artifact: `9035208730`.

No theorem, proof range, construction, estimate, displayed mathematical formula, visible equation number, or quantifier was intentionally changed by the equation-reference/font maintenance pass.

## 5. Greek wording remains fixed

The first independent review suggested `ΟΙΣ -> ΟΥΣ`; this remains not adopted. Classical relative attraction supports the dative relative when the omitted antecedent is dative. The current wording is therefore deliberate, not an unresolved typo.

## 6. Exact next review request

The Owner has chosen a **clean second independent full review**, not a delta-only recheck. The reviewer should assess current source `20fd8c77...` as a fresh fixed object and should not be asked to inherit the first review's conclusions.

The dedicated handoff is:

`SECOND_INDEPENDENT_REVIEW_PACKET_2026-08-09.md`.

The review should cover the full mathematical dependency cone, statement/proof agreement, all Section 4--6 estimates and exhaustion, moving-target transfer, entropy consequences, characterization/finite avoidance closure, citations/provenance, and the integrity of the equation-reference surface. Typography/build correctness should be checked as a secondary fixed-object property.

## 7. Publication gate

A successful second independent review may close the present mathematical review gate, subject to Owner disposition. It does **not** itself authorize merge, tag, release, DOI changes, arXiv upload, journal submission, endorsement requests, or external contact.
