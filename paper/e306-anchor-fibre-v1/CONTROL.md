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

## Mathematical source hierarchy

### Preferred ordinary proof

- source: `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`
- audit source: `review/e306-one-anchor-proof-audit-v1@1d63273ede93e1b83abf1ab9073d91b76600c23c`
- disposition: `PASS / GENUINE STRICT SIMPLIFICATION`

### General anchor--fibre structures

- original source: `research/e306-anchor-fibre-transference-v1@2f49ab25c36326e9ea39e3fc0ed1d22a22b11693`
- adoption audit: `E306-AFT-AUDIT-02`
- repair verification: `E306-AFT-REPAIR-VERIFY-01`
- verified repair head: `5945a2b9d3c596bed13f42201be11a39d4a0068c`
- disposition: all bounded statement and specialization-bridge repairs passed.

### Formal lineage

The headline theorem was first obtained in the author's archived Lean 4 release `0.0.3`. The present article grew out of that formal work and develops the same Fourier-analytic lineage into a conceptually refined one-anchor exposition. The archived code does not formalize the article line by line.

## Governing mathematical disposition

1. The direct analytic theorem fixes a reduced target `t=a/b in (0,1)` with squarefree `b` and a fixed exponent `gamma>1`.
2. Put `Z=X^gamma`; the sharp admissible region is `t<(log gamma)^2/2<1`, with exact centring `theta Lambda=t` and limiting parameter `2t/(log gamma)^2`.
3. Target rows are indexed by the prime-divisor set `S_b`, with `tau(b)=sum_(r in S_b)1/r^2`.
4. The total actual-family variance contains both prime-pair and target-row square loads. Its leading provider changes at `gamma=2`.
5. The multiplicity-sensitive cyclic-energy lemma is the explicit lower-prime row-distance provider.
6. The universal full-coordinate cutoff is `T_0=kappa_0 min(X^2,Z)`.
7. One pairwise-disjoint exhaustive six-sector architecture applies for every fixed `gamma>1`.
8. Quotient positivity is followed by deterministic no-wrap to give direct fixed-target exactness.
9. The full characterization follows by prime dilution, not by avoiding-unit representation, numerator induction or special denominators `1,2`.
10. Finite prescription includes the zero-residual case explicitly.
11. Local one-block replacement is distinguished from simultaneous globally proper replacement; common refinement and countably infinite proper refinement remain valid.
12. The retained coefficient supplies the total-variance asymptotic, explicit regime corollaries, entropy optimization, exponential multiplicity, exact-cardinality extraction, diversity, balanced relations, height bounds, globally proper refinement branching and global transfer with leading rate `2 log 2`.

## Maintained manuscript architecture

The live manuscript remains an eleven-section article:

1. Introduction.
2. Finite Fourier selection and exactness.
3. Structural tools.
4. The parameterized semiprime denominator system.
5. The anchor block.
6. Fibre decoding and target observability.
7. The decoded skeleton and its universal minor ranges.
8. The major contribution and terminal budget.
9. Exact representation, extension and refinement.
10. Quantitative multiplicity, optimization and transfer.
11. Discussion and conclusion.

The detailed architecture and theorem dependencies are controlled by `ARTICLE_ARCHITECTURE.md` and `THEOREM_DAG.md`.

## Recovered-source integration and comparative audit

The historical parameterized manuscript baseline

```text
544d42d510bcab3ad0ddd7855525770e0d4b0926
```

was independently verified before the loss and recovery episode. The recovered holistic manuscript source was subsequently integrated on the sole article branch at

```text
c2dfc5120eec017718ef07cbe43f9c151803769c
```

with detailed provenance in `RECOVERED_SOURCE_PROVENANCE.md`. Under the recorded reconstruction environment, the integrated source reproduces the surviving 42-page evidence PDF byte-for-byte. This is a forensic reconstruction of the rendered evidence, not a certification that invisible historical source details such as comments, whitespace or equivalent TeX spellings are identical to the lost working tree.

The exact-head comparative mathematical-value and architecture audit at `#issuecomment-5141204793` retained the integrated manuscript as the mathematical and expository successor to the historical source. It found no mathematical manuscript repair necessary and returned

```text
[BOUNDED-RESTORATION E306-MANUSCRIPT-COMPARATIVE-VALUE-ARCHITECTURE-AUDIT-02]
```

with only BR-01--BR-03 provenance and control repairs.

## Exact-head build assurance at the recovery checkpoint

At `c2dfc5120eec017718ef07cbe43f9c151803769c`:

- `verify-e306-manuscript` run `30608129577` concluded successfully;
- `verify-erdos-306` run `30608129625` concluded successfully;
- the generated manuscript has 42 pages;
- artifact ID `8784435185` has current Actions API/download ZIP SHA-256 `1733faced92fd22e91427ffe7f1ebbbb074ff6aca8740bf61d1a1a5255b2e8e0`;
- the contained `main.pdf` has SHA-256 `b894be102bfe1af03ff491dec7e59936192f883ce5d38ff055914f19bf38d052`.

The distinct local evidence object remains identified by SHA-256 `d0bc466283dc591b90e7039bb6461ecaa040d6a80b63d7270c1211e7377992c2` and is not mislabeled as the current GitHub Actions artifact.

## Bounded provenance and control repair

Role `E306-MANUSCRIPT-BOUNDED-PROVENANCE-CONTROL-REPAIR-01` changes only the six authorized prose/control files and PR metadata needed to close BR-01--BR-03. It changes no manuscript mathematical section, theorem, proof, reference database, workflow, Lean source or publication surface.

The repair successor's exact head, workflow results and generated artifact metadata are recorded in PR `#9` and the durable issue return. That successor requires a narrow independent exact-diff re-check before any readiness transition. No previous refreeze or publication gate transfers automatically.

## Source and build assurance

- manuscript entry point: `paper/e306-anchor-fibre-v1/manuscript/main.tex`;
- local entry point: `make clean && make pdf`;
- bibliography backend: Biber through the configured `latexmk` cycle;
- controlling arXiv environment: TeX Live 2025;
- TeX Live 2023/Debian workflow: secondary compatibility check;
- reproducibility workflow: `.github/workflows/manuscript.yml`;
- recovery provenance: `paper/e306-anchor-fibre-v1/RECOVERED_SOURCE_PROVENANCE.md`;
- exact-head comparative audit: `#issuecomment-5141204793`.

## Product rules

- One article, one branch, one draft PR.
- No task-, auditor-, repair-, review- or revision-specific branches.
- Mathematical changes require an explicit `PROOF_CHANGE_LEDGER.md` entry and independent verification.
- Source obligations are tracked in `PROOF_OBLIGATION_LEDGER.md`.
- Read-only reviewers do not write to the branch.
- Owner approval is required before ready-for-review, merge, refreeze, release, DOI action, licence selection, arXiv upload or journal submission.
- `lean-graph.yml`, Lean analytic-provider refactoring, E307 and a future general transference project remain outside this workstream.

## Milestones

- `M0` control and source freeze — **COMPLETE**
- `M1` bounded structural repair and specialization bridge — **COMPLETE / VERIFIED / MANUSCRIPT-ADOPTED**
- `M2` theorem DAG and article architecture — **MATHEMATICALLY PRESERVED / CONTROL PROSE SYNCHRONIZED TO RECOVERED INTEGRATION**
- `M3` general structural tools — **COMPLETE / MANUSCRIPT-ADOPTED**
- `M4` E306 arithmetic providers — **COMPLETE / PARAMETERIZED REPAIR VERIFIED**
- `M5` full manuscript assembly — **COMPLETE / RECOVERED SOURCE INTEGRATED**
- `M6` mathematical, source, build, bibliography, font and visual review — **COMPLETE AT RECOVERY CHECKPOINT `c2dfc512...` SUBJECT ONLY TO BR-01--BR-03**
- `M7` revision and publication disposition — **BOUNDED PROVENANCE/CONTROL REPAIR / NARROW EXACT-DIFF RE-CHECK REQUIRED / OWNER HOLD**

## Historical gate boundary

The refrozen candidate `79a43178bdc4919677375362ef58b9c127da18b0` and its 44-page technical publication gate are historical. That gate does not transfer to the later parameterized manuscript, the recovered-source integration at `c2dfc5120eec017718ef07cbe43f9c151803769c`, or its bounded provenance/control repair successor.

## Current state

```text
[RECOVERED SOURCE INTEGRATED @ c2dfc5120eec017718ef07cbe43f9c151803769c]
[42-PAGE EXACT-HEAD MANUSCRIPT AND LEAN WORKFLOWS SUCCESSFUL]
[COMPARATIVE AUDIT: BOUNDED RESTORATION BR-01--BR-03 ONLY]
[BOUNDED REPAIR SUCCESSOR REQUIRES NARROW EXACT-DIFF RE-CHECK]
[OWNER HOLD / PR #9 REMAINS OPEN, DRAFT AND UNMERGED]
[NO LICENCE, UPLOAD OR SUBMISSION AUTHORIZED]
```

This control state does not mark PR `#9` ready, authorize merge, create or move a tag, authorize a release or DOI action, invoke Zenodo, select a licence, authorize arXiv upload or journal submission, or authorize external contact.
