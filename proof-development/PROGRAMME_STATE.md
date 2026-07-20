# Erdős 306 proof-development programme state

**Role:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Standing issue:** `Yuren-Tang/research-workbench#38`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Initial human-proof input:** `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
**Owned branch:** `proof-development/e306-rigour-v1`, created from the exact formal authority  
**Review B source:** `review/e306-p1-construction-v1@0b9c79d8727152d5e2511b39a48bbea0d437487e`  
**Updated:** 2026-07-20 (Europe/Berlin)

## Trust-boundary rule

The released theorem is the immutable mathematical authority. Its nonstandard
formal assumptions are exactly

- `RosserSchoenfeld.rosser_schoenfeld_cor3`;
- `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The PNT-first human proof is a separate backend. The frozen
`codex/pushlinter@e55ef359...` checkpoint may supply architecture and declaration
locators, but it is not released theorem authority. The fixed manuscript and
independent review branch remain read-only inputs. No status is transferred
silently among these layers.

## Normalized queue

| Unit | State | Present disposition |
|---|---|---|
| `E306-PD-A0–A1` | `COMPLETE-DRAFT` | Exact theorem, necessity, semiprime conventions and squarefree roles. |
| `E306-PD-A2 / B1` | `COMPLETE-DRAFT` | Backend-independent common-threshold `AnalyticInputs -> Erdos306` interface. |
| `E306-PD-A3 / B2` | `COMPLETE-DRAFT / BLOCKED-SOURCE` | RS provider derivation is expounded and Lean-closed; publisher-scan certification remains open. |
| `E306-PD-A4 / B3 / R1` | `COMPLETE-DRAFT` | PNT/Abel provider with uniform error, endpoints, inclusive window and common threshold. |
| `E306-PD-A5` | `COMPLETE-DRAFT` | Finite Fourier conventions, positivity and no-wrap conversion. |
| `E306-PD-A6.1 / P16` | `COMPLETE-DRAFT` | Exact control system, `sigmaCtrl` lower bound and quantitative reciprocal-load upper bound. |
| `E306-PD-A6.2 / P17–P18` | `COMPLETE-DRAFT` | Nondominant forcing, dominant labels, exceptions, wrapped labels and corrected boundary penalty. |
| `E306-PD-A6.3 / P19–P23` | `COMPLETE-DRAFT` | Label-uniform global level sets, localization and control partition. |
| `E306-PD-A6.4 / P24–P26` | `COMPLETE-DRAFT` | Pair pool, forbidden removal, mass batch, weights and variance. |
| `E306-PD-A7–A10 / P27–P32` | `COMPLETE-DRAFT` | Main arcs, exact minor split, fibre bound, reservoir and terminal positivity. |
| `E306-PD-A11–A13 / P0–P3,P33` | `COMPLETE-DRAFT` | Necessity, small denominators, numerator induction and finite tuple bridge. |
| `E306-PD-C1–C2` | `COMPLETE-DRAFT` | Proposition/declaration map and finite/kernel-residual ledger. |
| `E306-PD-C3` | `BLOCKED-SOURCE` | Human-visible Rosser–Schoenfeld pp. 69–70 comparison unavailable. |
| `E306-PD-C4` | `ACTIVE / NON-BLOCKING` | Release/refactor/manuscript architecture comparison without authority transfer. |
| `E306-PD-R2` | `RECONCILED` | Review B RB-01–RB-20 dispositioned in `REVIEW_B_RECONCILIATION.md`. |
| `E306-PD-B4–B5` | `QUEUED` | Alternate/future analytic providers. |

## Material checkpoints

### Manuscript-revision checkpoint

`proof-development/ARTICLE_CORE_CHECKPOINT.md` and
`proof-development/REVIEW_B_RECONCILIATION.md` are
`READY-FOR-MANUSCRIPT-REVISION`.

Review B found no material mathematical gap, unrecorded downstream theorem,
circular parameter choice, or material theorem mismatch. Its bounded findings
are reconciled as follows:

- `RB-01`–`RB-17`: absorbed into exact PDL proof sources;
- `RB-18`: manuscript ledger synchronization after the actual rewrite;
- `RB-19`: separately authorized Lean-comment cleanup only;
- `RB-20`: evidence limitation recorded, with no theorem obligation.

The fixed manuscript candidate remains unrevised and retains Review B's
`BOUNDED MATHEMATICAL REVISION REQUIRED` classification until a manuscript
worker consumes the checkpoint and returns a new exact candidate.

### Analytic interface

`units/E306-PD-B1-B3-ANALYTIC-INTERFACE.md` gives one common-threshold
construction interface, the backend-independent implication, the exact released
RS provider, and a separate PNT/Abel provider.

### Correspondence

`proof-development/FORMAL_INFORMAL_CORRESPONDENCE.md` maps P0–P33 to the
immutable release and inventories every accepted finite/kernel residual.

No conceptual implication requires return to `E306-RL`.

## Documentation and source boundaries

The stale G5/G7 and old analytic-input comments in released Lean files are
`DOCUMENTATION-STATUS DEFECT`s only. They are outside present mutation authority.
The human symbol-by-symbol RS publisher-scan comparison remains
`BLOCKED-SOURCE`; neither item reopens the downstream mathematics.

## Current active frontier

The immediate consumer is manuscript revision from the exact Review B
reconciliation checkpoint. The persistent PDL role continues independently;
its non-blocking mathematical frontier remains `E306-PD-C4`, followed by future
returned defects, source certification, and interface generalization.

## Operating rule

For every unit, record statement and quantifiers, human derivation, released
locator, external assumptions, finite residuals, edge cases, parameter order and
status. Only genuinely new mathematics returns to `E306-RL`.
