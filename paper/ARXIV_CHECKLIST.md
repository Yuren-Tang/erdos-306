# Erdős 306 — objective arXiv v1 checklist after bounded major revision

## 0. Gate rule

A submission recommendation requires every mandatory gate below to be `PASS`. Possible states:

- `PASS`: objective evidence exists at an immutable ref;
- `FAIL`: the criterion is presently unmet;
- `BLOCKED`: an upstream decision or evidence packet is missing;
- `N/A`: explicitly excluded by the author and Director.

Current overall result: **FAIL — NOT YET ARXIV-READY**.

The manuscript is now a substantive paper-level proof workspace. The remaining failures are independent-review, source-comparison, fresh formal-verification, and author/publication decisions; they are not hidden by the rewrite.

## 1. Scope and theorem gate

### G1.1 Exact theorem

- **Criterion:** title, abstract, theorem, conclusion, and metadata agree that the represented rationals are exactly the positive rationals with squarefree reduced denominator.
- **Current state:** `PASS` for the manuscript source.
- **Evidence:** `main.tex`, Theorem 1.1 and Sections 1–3, 11–12.

### G1.2 Semiprime convention

- **Criterion:** every denominator is a product of two distinct primes; no `p²` case is admitted; distinctness of denominators is literal.
- **Current state:** `PASS`.

### G1.3 Avoiding formulation and numerator reduction

- **Criterion:** the paper explicitly explains why finite avoidance is needed and proves the `1/b → a/b` reduction without denominator reuse.
- **Current state:** `PASS`.

## 2. Analytic trust-boundary gate

### G2.1 Structural conditions separated

- **Criterion:** dyadic prime density and reciprocal-window mass are stated separately, with distinct downstream roles.
- **Current state:** `PASS`.
- **Checks:** condition `D` is used for block/reservoir cardinality; condition `M` is used for pair-pool reciprocal mass.

### G2.2 Inclusive reciprocal window

- **Criterion:** the union is `k0,…,3*k0` inclusive and the actual interval is `[2^k0,2^(3*k0+1))`.
- **Current state:** `PASS`.

### G2.3 Structural theorem before backend

- **Criterion:** the paper first proves `D + M → avoiding 1/b → Erdős 306`, then derives `D` and `M` from Rosser–Schoenfeld.
- **Current state:** `PASS`.

### G2.4 Released axiom set exact

- **Criterion:** v0.0.3 is described as depending on only `propext`, `Classical.choice`, `Quot.sound`, and the two named Rosser–Schoenfeld axioms.
- **Current state:** `PASS` for wording and correspondence.

### G2.5 No frozen-ref overclaim

- **Criterion:** `codex/pushlinter` is described only as frozen architecture/exposition context, not as released, publication-cleared, or DOI authority.
- **Current state:** `PASS`.

## 3. Paper-level proof-closure gate

### G3.1 Finite spectral principle

- **Criterion:** finite Fourier orthogonality, no-wrap, the main/minor gap, and subset extraction are proved in the manuscript.
- **Current state:** `PASS`.

### G3.2 Reciprocal-mass construction

- **Criterion:** pair-pool identity, reciprocal-square tail, forbidden-load subtraction, greedy window, load window, weight window, and no-wrap are exposed.
- **Current state:** `PASS` for the manuscript proof architecture.
- **Independent review:** `FAIL` until reviewed.

### G3.3 Main-arc estimate

- **Criterion:** variance comparison, window geometry, Bernoulli log expansion, phase cancellation, Gaussian lower bound, and symmetry are exposed.
- **Current state:** `PASS` for manuscript completeness.
- **Independent review:** `FAIL` until reviewed.

### G3.4 Global-control partition

- **Criterion:** the paper exposes cold-block decoding, adjacent mismatch energy, the encoded level-set bound, localization, high-floor absorption, and diagonal Gaussian tail, including quantifier order.
- **Current state:** `PASS` for substantive exposition.
- **Independent review:** `FAIL`; this is a principal mathematical-review gate.

### G3.5 Block-minor transfer

- **Criterion:** exact frequency-to-assignment reindexing, `Qextra`, fiber-tail inequality, and the factor `b` are explicit.
- **Current state:** `PASS` for exposition.
- **Independent review:** `FAIL`.

### G3.6 Squarefree CRT reservoir

- **Criterion:** prime-divisor congruence lift, mismatch prime, label gap, count `≤b(2N+1)`, one-factor damping, and `G`-factor aggregation are explicit.
- **Current state:** `PASS` for exposition.
- **Independent review:** `FAIL`.

### G3.7 Terminal parameter compatibility

- **Criterion:** `η`, `Ctail`, `C`, `Dmp`, `G`, and `k0` are chosen in a noncircular order, and the single terminal inequality is stated.
- **Current state:** `PASS` for exposition.
- **Independent review:** `FAIL`.

### G3.8 Proof ledger

- **Criterion:** every load-bearing node has statement, source/evidence layer, dependencies, status, and blocker.
- **Current state:** `PASS` for this revision; `PROOF_LEDGER.md` contains P0–P39.

## 4. Formal verification gate

### G4.1 Immutable released proof evidence

- **Criterion:** release `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe` and DOI `10.5281/zenodo.20767390` remain unchanged and are cited correctly.
- **Current state:** `PASS`.

### G4.2 Fresh release build

- **Criterion:** a clean checkout of the immutable release reruns `lake build` and `RequestProject/Audit.lean`, with saved logs tied to the exact commit.
- **Current state:** `FAIL` for submission packaging. The existing release is public evidence, but no fresh build log was generated in this remote manuscript work unit.
- **Restriction:** do not wake/query the quota-exhausted local L1 worker.

### G4.3 RV1 frozen-ref verification

- **Criterion:** if any formal claim is made about `codex/pushlinter`, the accepted RV1 local verification plan must be run at the exact tip, including build, audit, scans, tests, and repository-state checks.
- **Current state:** `BLOCKED` / not part of this manuscript revision.
- **Publication consequence:** no claim that the frozen ref is a replacement verified release.

### G4.4 Exact correspondence table

- **Criterion:** release declarations and frozen-context declarations are displayed in separate columns with explicit authority labels.
- **Current state:** `PASS`.

### G4.5 No Lean source change

- **Criterion:** branch diff contains no `.lean` modification.
- **Current state:** to be verified after final push.

## 5. Source and bibliography gate

### G5.1 Rosser–Schoenfeld metadata

- **Criterion:** article metadata and DOI resolve; exact theorem/equation/page references are retained.
- **Current state:** `PASS` for recorded metadata.

### G5.2 Publisher scan comparison

- **Criterion:** compare the released Lean statements visually with Corollary 3 (3.8), p. 69, and Theorem 5 (3.17)–(3.18), p. 70, in the publisher scan.
- **Current state:** `FAIL` / pending. Previous automated access was blocked; do not claim visual verification.

### G5.3 Historical and priority claims

- **Criterion:** every precise historical attribution is supported, or the wording stays conservative.
- **Current state:** `PASS` for the conservative current text; deeper priority review remains desirable.

### G5.4 No invented references

- **Criterion:** every bibliography entry has checked metadata and is actually cited or deliberately retained as historical context.
- **Current state:** `PASS` for present entries, subject to final copyedit.

## 6. LaTeX and source-package gate

### G6.1 Clean compilation

- **Criterion:** repeated `pdflatex`/BibTeX sequence completes with no errors, undefined references/citations, missing glyphs, or overfull boxes.
- **Current state:** `PASS` for this revision.
- **Evidence:** `pdflatex`, `bibtex8`, and repeated `pdflatex` passes produced a 17-page PDF. The final log contains no LaTeX warnings, undefined references/citations, overfull/underfull boxes, or missing-glyph reports.

### G6.2 Visual PDF inspection

- **Criterion:** render every page and inspect for clipping, overlap, broken glyphs, table overflow, and unreadable URLs/code.
- **Current state:** `PASS` for this revision.
- **Evidence:** all 17 pages were rendered at 150 dpi and inspected in a full contact sheet, with detailed checks of the title/abstract page and the trust-boundary page containing long refs and declaration names. No clipping, overlap, broken glyph, or overflow was found.

### G6.3 Portable source

- **Criterion:** source uses arXiv-supported packages, no shell escape, no local absolute paths, no external fonts or inaccessible figures.
- **Current state:** `PASS` by source inspection; rerun in isolated build directory before submission.

### G6.4 Source archive

- **Criterion:** final bundle contains `main.tex`, `references.bib`, required appendices, and no build artifacts.
- **Current state:** `FAIL`; no arXiv package is authorized in this work unit.

## 7. Author and Director gate

### G7.1 Title and author line

- **Criterion:** exact title, author spelling, affiliation, ORCID, and contact line approved.
- **Current state:** `FAIL` / author decision required.

### G7.2 Abstract emphasis

- **Criterion:** author decides the balance among the number-theoretic theorem, structural analytic theorem, and machine-checked evidence.
- **Current state:** `FAIL` / author decision required.

### G7.3 AI disclosure and acknowledgements

- **Criterion:** exact wording approved, including systems/contributor roles and responsibility statement.
- **Current state:** `FAIL` / author decision required.

### G7.4 Independent mathematical review

- **Criterion:** at least one independent reviewer checks the global-control, block-minor, CRT/reservoir, terminal compatibility, and Rosser–Schoenfeld bridge sections, with comments resolved.
- **Current state:** `FAIL`.

### G7.5 Director disposition

- **Criterion:** E306-DIR accepts this bounded major revision or issues exact corrections.
- **Current state:** `BLOCKED` pending return disposition.

### G7.6 Publication mode

- **Criterion:** decide whether arXiv v1 presents a complete paper proof with v0.0.3 as companion formal evidence, or waits for a future cleaned formal release.
- **Current state:** `FAIL` / author and Director decision required.

## 8. Branch and action boundary

### G8.1 Same authorized branch

- **Criterion:** all changes are on `paper/arxiv-v1`, descended from control tip `b94b9f7535f671caeb3abe430b70838dd1457441`.
- **Current state:** verify after final push.

### G8.2 Exactly six authorized files

- **Criterion:** diff changes only:
  - `paper/main.tex`;
  - `paper/references.bib`;
  - `paper/PROOF_LEDGER.md`;
  - `paper/LEAN_CORRESPONDENCE.md`;
  - `paper/ARXIV_CHECKLIST.md`;
  - `paper/OPEN_EDITORIAL_QUESTIONS.md`.
- **Current state:** verify after final push.

### G8.3 Prohibited actions

- **Criterion:** no Lean edit, release/tag/DOI mutation, merge, release, arXiv submission, or L1 wake/query.
- **Current state:** `PASS` so far; verify in final handoff.

## 9. Objective current decision

```text
ARXIV_V1_READY = false

OPEN_MANDATORY_GATES =
  independent mathematical review;
  publisher-scan comparison for the two RS statements;
  fresh release build/audit evidence for submission packaging;
  author decisions on title/metadata/disclosure/publication mode;
  E306-DIR disposition;
  final arXiv source and metadata audit.
```
