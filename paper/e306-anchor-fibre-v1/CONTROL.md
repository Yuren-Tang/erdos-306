# E306-PAPER-01 — control surface

## Product identity

- **Repository:** `Yuren-Tang/erdos-306`
- **Controlling issue:** `#8`
- **Draft PR:** `#9`
- **Lifecycle:** persistent single-product manuscript lane
- **Sole branch:** `paper/e306-anchor-fibre-v1`
- **Exact base:** `main@5a6207a493067f02c67b1cfa69fa8c5498f2c005`
- **Writer capacity:** one writer at a time
- **Audit capacity:** one-off read-only roles with no branch ownership
- **Shared writer allocation:** none
- **Publication state:** Owner hold

The exact current branch head is recorded in PR `#9` and the latest durable issue return. A committed control document does not attempt to contain its own commit hash.

## Current writer disposition

Authorized role:

```text
E306 — Native Fixed-Ratio Anchor Whole-Article Reparameterization Writer 01
E306-NATIVE-FIXED-RATIO-ANCHOR-WHOLE-ARTICLE-REPARAMETERIZATION-WRITER-01
```

Authorization: `#issuecomment-5150232754`.

Exact authorized starting head:

```text
b64bac1f9426cbeb60090a6dbdc147c5e67386ac
```

That starting head contained an append-only fixed-ratio proposition whose architecture was rejected by the Director correction at `#issuecomment-5150229586`. The current writer successor removes the standalone annex and makes the fixed anchor ratio native throughout the article. It is a writer result, not an independent audit or certification.

## Mathematical source hierarchy

### Preferred ordinary proof

- source: `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`
- audit source: `review/e306-one-anchor-proof-audit-v1@1d63273ede93e1b83abf1ab9073d91b76600c23c`
- disposition: `PASS / GENUINE STRICT SIMPLIFICATION`

### General anchor–fibre structures

- original source: `research/e306-anchor-fibre-transference-v1@2f49ab25c36326e9ea39e3fc0ed1d22a22b11693`
- adoption audit: `E306-AFT-AUDIT-02`
- repair verification: `E306-AFT-REPAIR-VERIFY-01`
- verified repair head: `5945a2b9d3c596bed13f42201be11a39d4a0068c`
- disposition: all bounded statement and specialization-bridge repairs passed.

### Fixed-ratio source and value boundary

The accepted fixed-ratio research and value audit establish that the existing one-anchor/fingerprint proof works for every fixed `eta in (0,1)` with constants depending on `eta`, uniformly on compact subsets of `(0,1)`. They also establish that a shrinking-width terminal block and reciprocal-flow machinery form a second anchor theory and are not load-bearing for this article.

### Formal lineage

The headline theorem was first obtained in the author's archived Lean 4 release `0.0.3`. The present article grew out of that formal work and develops the same Fourier-analytic lineage into a conceptually refined one-anchor exposition. The archived code does not formalize the article line by line.

## Governing mathematical disposition

1. Fix a reduced target `t=a/b in (0,1)` with squarefree `b`, a fixed exponent `gamma>1`, a fixed anchor ratio `eta in (0,1)`, finite forbidden data, and `Z=X^gamma`.
2. The native anchor is `B={q prime: eta Z<=q<Z}`.
3. The exact fixed-ratio moments are

   ```text
   |B|=(1-eta+o_eta(1)) Z/log Z,
   sum_(q in B)1/q=(log(1/eta)+o_eta(1))/log Z,
   sum_(q in B)1/q^2=(eta^(-1)-1+o_eta(1))/(Z log Z).
   ```

4. The sharp admissible region is `t<(log gamma)^2/2<1`, with exact centring `theta Lambda=t` and limiting parameter `2t/(log gamma)^2`.
5. Target rows are indexed by `S_b`, with `tau(b)=sum_(r in S_b)1/r^2`.
6. The total actual-family variance is

   ```text
   sigma_E^2
    ~ alpha_(t,gamma)(1-alpha_(t,gamma))
      {1/(2X^2 log^2 X)
       +(eta^(-1)-1)tau(b)/(Z log Z)}.
   ```

7. The structural factor `1/2` in the complete-pair identity is preserved; it is unrelated to the former dyadic anchor endpoint.
8. Fixed-ratio reciprocal dispersion, exact anchor rigidity, fingerprint entropy and the weighted anchor partition use `eta`-dependent constants.
9. The lower-prime row distance is supplied by the multiplicity-sensitive cyclic-energy lemma with interval multiplicity `1+(1-eta)Z/r`.
10. The universal full-coordinate cutoff is `T_0=kappa_0(t,gamma,eta,b) min(X^2,Z)`.
11. The adaptive retained-prime interval lies below `eta Z` for sufficiently large `X`.
12. One pairwise-disjoint exhaustive six-sector architecture applies for every fixed `(gamma,eta)`.
13. Quotient positivity is followed by deterministic no-wrap to give direct fixed-target exactness.
14. The full characterization follows by prime dilution.
15. The quantitative branch uses the native total variance and preserves the leading entropy and height rates; the former Hamming exponent notation is renamed so that `eta` denotes only the anchor ratio.
16. A varying `eta=eta(X)->1`, shrinking terminal width, thin-anchor exponent theorem and reciprocal-flow machinery are outside the article.

## Maintained manuscript architecture

The live manuscript remains an eleven-section Architecture-E article:

1. Introduction and main results.
2. Composition interface.
3. Reciprocal-semiprime system.
4. One anchor and rigidity.
5. Rows, observability and fibres.
6. Decoded tail.
7. Actual local well.
8. Positive coefficient, realization and no-wrap.
9. Characterization and refinement.
10. Compact fixed-family saturation and quantitative consequences.
11. Scope, boundaries and future interfaces.

The detailed architecture and dependencies are controlled by `ARTICLE_ARCHITECTURE.md` and `THEOREM_DAG.md`. Mathematical changes are recorded in `PROOF_CHANGE_LEDGER.md`; current obligations are recorded in `PROOF_OBLIGATION_LEDGER.md`.

## Recovery and historical boundary

The recovered holistic manuscript source was integrated at `c2dfc5120eec017718ef07cbe43f9c151803769c`, with provenance in `RECOVERED_SOURCE_PROVENANCE.md`. The comparative audit at `#issuecomment-5141204793` retained that manuscript as the mathematical and expository successor to the historical source and authorized only bounded provenance/control repair.

The later Architecture-E migration, coherence audit, BCR-01 repair and narrow re-audit were accepted before the fixed-ratio work. Their dependency and cross-reference locks remain controlling. The append-only fixed-ratio absorption at `b64bac1f...` was subsequently rejected only as article architecture; its fixed-ratio mathematics was not rejected.

The historical fixed-`Z=X^3`, five-sector candidate and its publication gate are nontransferable. No earlier refreeze or publication gate transfers to the native fixed-ratio writer successor.

## Source and build assurance

- manuscript entry point: `paper/e306-anchor-fibre-v1/manuscript/main.tex`;
- local entry point: `make clean && make pdf`;
- bibliography backend: Biber through the configured `latexmk` cycle;
- controlling arXiv environment: TeX Live 2025;
- TeX Live 2023/Debian workflow: secondary compatibility check;
- reproducibility workflow: `.github/workflows/manuscript.yml`;
- recovery provenance: `paper/e306-anchor-fibre-v1/RECOVERED_SOURCE_PROVENANCE.md`.

## Product rules

- One article, one branch, one draft PR.
- No task-, auditor-, repair-, review- or revision-specific branches.
- Mathematical changes require an explicit `PROOF_CHANGE_LEDGER.md` entry and independent verification.
- Read-only reviewers do not write to the branch.
- Owner approval is required before ready-for-review, merge, refreeze, release, DOI action, licence selection, arXiv upload or journal submission.
- `lean-graph.yml`, Lean analytic-provider refactoring, E307 and a future thin-anchor/reciprocal-flow project remain outside this workstream.

## Current state

```text
[NATIVE FIXED-RATIO WHOLE-ARTICLE WRITER SUCCESSOR]
[APPEND-ONLY ANNEX REMOVED]
[DEFAULT TYPOGRAPHY PRESERVED]
[FINAL EXACT-HEAD WORKFLOWS REQUIRED]
[SEPARATE INDEPENDENT WHOLE-ARTICLE AUDIT REQUIRED]
[OWNER HOLD / PR #9 OPEN, DRAFT AND UNMERGED]
[NO LICENCE, RELEASE, DOI, UPLOAD OR SUBMISSION AUTHORIZED]
```
