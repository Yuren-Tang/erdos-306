# Erdős 306 proof-development programme state

**Role:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Standing issue:** `Yuren-Tang/research-workbench#38`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Initial human-proof input:** `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
**Owned branch:** `proof-development/e306-rigour-v1`, created from the exact formal authority  
**Updated:** 2026-07-20 (Europe/Berlin)

## Trust-boundary rule

The released theorem is the immutable mathematical authority. Its nonstandard
formal assumptions are exactly

- `RosserSchoenfeld.rosser_schoenfeld_cor3`;
- `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The PNT-first human proof is a separate backend. The frozen
`codex/pushlinter@e55ef359...` checkpoint may supply architecture and declaration
locators, but it is not released theorem authority. Proof development does not
transfer status silently among these layers.

## Normalized queue

| Unit | State | Present disposition |
|---|---|---|
| `E306-PD-A0–A1` | `COMPLETE-DRAFT` | Exact theorem, necessity, semiprime conventions and squarefree roles are consolidated. |
| `E306-PD-A2 / B1` | `COMPLETE-DRAFT` | Backend-independent, common-threshold `AnalyticInputs -> Erdos306` interface completed. |
| `E306-PD-A3 / B2` | `COMPLETE-DRAFT / BLOCKED-SOURCE` | Released RS provider derivation is expounded and Lean-closed; publisher-scan transcription certification remains open. |
| `E306-PD-A4 / B3 / R1` | `COMPLETE-DRAFT` | PNT/Abel provider includes uniform error, endpoint conversion, inclusive window and one common threshold. |
| `E306-PD-A5` | `COMPLETE-DRAFT` | Finite Fourier conventions, positivity criterion and no-wrap conversion are integrated. |
| `E306-PD-A6.1 / P16` | `COMPLETE-DRAFT` | Control graph, `sigmaCtrl` lower bound and reciprocal-load upper bound. |
| `E306-PD-A6.2 / P17–P18` | `COMPLETE-DRAFT` | Nondominant forcing, dominant labels, exceptions and corrected boundary penalty. |
| `E306-PD-A6.3 / P19–P23` | `COMPLETE-DRAFT` | Global level sets, localization and control partition. |
| `E306-PD-A6.4 / P24–P26` | `COMPLETE-DRAFT` | Pair pool, forbidden removal, mass batch, weights and variance. |
| `E306-PD-A7–A10 / P27–P32` | `COMPLETE-DRAFT` | Main arcs, both minor sectors, reservoirs and terminal positivity. |
| `E306-PD-A11–A13 / P0–P3,P33` | `COMPLETE-DRAFT` | Necessity, small denominators, numerator induction and formal tuple bridge. |
| `E306-PD-B4–B5` | `QUEUED` | Compare alternate/future analytic providers without changing released authority. |
| `E306-PD-C1–C2` | `COMPLETE-DRAFT` | Consolidated proposition/declaration map and finite/kernel-residual ledger recorded. |
| `E306-PD-C3` | `BLOCKED-SOURCE` | Human-visible Rosser–Schoenfeld pp. 69–70 comparison unavailable. |
| `E306-PD-C4` | `ACTIVE` | Compare released proof authority with the read-only reorganized refactor, declaration by declaration, without status transfer. |
| `E306-PD-R2` | `QUEUED` | Consume dispositioned independent Review B findings when returned. |

## Material checkpoints

### Article core

`proof-development/ARTICLE_CORE_CHECKPOINT.md` is
`COMPLETE-DRAFT / READY-FOR-INDEPENDENT-REVIEW`. It covers P16–P32 and the
arithmetic closure to the public theorem, preserving all corrected hypotheses,
explicit multiplicities, variance comparison, parameter order and residual
trust boundaries.

### Analytic interface

`units/E306-PD-B1-B3-ANALYTIC-INTERFACE.md` gives:

- one common-threshold construction-facing interface;
- a backend-independent implication to Erdős 306;
- the exact released Rosser–Schoenfeld provider;
- a separate PNT/Abel provider;
- endpoint, uniformity and scale-last repairs.

### Correspondence

`proof-development/FORMAL_INFORMAL_CORRESPONDENCE.md` maps P0–P33 to the
immutable release and inventories every accepted finite/kernel residual.

No conceptual implication required return to `E306-RL`.

## Immediate formal/informal status correction

The header prose in `lean/RequestProject/GlobalControl.lean` describing G5/G7
as unfinished is stale. The active release closes the route through
`global_levelset_final`, `g6_localization`, and
`global_control_partition_final`. This is a documentation-status defect only.

## Current active frontier

`E306-PD-C4` compares:

1. the controlling declarations and actual consumers at `v0.0.3@4582185...`;
2. the reorganized downstream declaration graph at
   `codex/pushlinter@e55ef359...`;
3. the manuscript's architecture-led decomposition.

The comparison may improve locators and exposition architecture, but may not
promote unreleased structural analytic axioms or refactor claims into released
inputs.

## Operating rule

For every unit, record statement and quantifiers, human derivation, released
locator, external assumptions, finite residuals, edge cases, parameter order and
status. Only genuinely new mathematics returns to `E306-RL`.
