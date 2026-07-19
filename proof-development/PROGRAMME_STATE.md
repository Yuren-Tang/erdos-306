# Erdős 306 proof-development programme state

**Role:** `Erdős 306 — Proof Development Lead` (`E306-PDL`)  
**Standing issue:** `Yuren-Tang/research-workbench#38`  
**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Initial human-proof input:** `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
**Owned branch:** `proof-development/e306-rigour-v1`, created from the exact formal authority  
**Initialized:** 2026-07-19 (Europe/Berlin)

## Trust-boundary rule

The released theorem is the immutable mathematical authority. Its nonstandard formal assumptions are exactly

- `RosserSchoenfeld.rosser_schoenfeld_cor3`;
- `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The PNT-first human proof is a separate backend. The frozen `codex/pushlinter@e55ef359...` checkpoint may supply architecture and declaration locators, but it is not released theorem authority. Proof development does not transfer status silently among these layers.

## Normalized initial queue

| Unit | State | Present disposition |
|---|---|---|
| `E306-PD-A0` | `ARGUMENT` | The human and formal headline statements are visible; exact necessity/sufficiency and tuple/set correspondence remain to be assembled into one proof unit. |
| `E306-PD-A1` | `ARGUMENT` | Squarefree denominator, semiprime, distinctness, avoidance and both uses of squarefreeness are distributed across the manuscript and release; dependency consolidation remains. |
| `E306-PD-A2` | `ARGUMENT` | Eventual density and inclusive reciprocal-window inputs are stated; the minimal construction-facing interface is not yet isolated. |
| `E306-PD-A3` | `QUEUED` | Released Rosser–Schoenfeld backend is formally closed; exact human source transcription remains gated by the publisher scan. |
| `E306-PD-A4 / R1` | `REPAIR` | PNT/partial-summation route exists; one common threshold and scale-last quantifier order must be stated at first use. |
| `E306-PD-A5` | `ARGUMENT` | Finite Fourier identity and positivity implication are present; full convention/dependency dossier remains. |
| `E306-PD-A6.1 / P16` | `ACTIVE` | Expand the control graph, `sigmaCtrl` lower bound and control reciprocal-load upper bound. This is the first manuscript handoff that suppresses a load-bearing derivation. |
| `E306-PD-A6.2` | `QUEUED` | Mass and gadget construction after A6.1 and the abstract supply interface. |
| `E306-PD-A7`–`A10` | `QUEUED` | Main arcs, two minor sectors and terminal compatibility. Several central nodes are already Lean-closed but humanly compressed. |
| `E306-PD-A11`–`A13` | `QUEUED` | Exceptional cases, finite-to-infinite bridge and final assembly. |
| `E306-PD-B1`–`B5` | `QUEUED/ARGUMENT` | Minimal `AnalyticInputs -> Erdos306` theorem and separate analytic backends. |
| `E306-PD-C1`–`C2`, `C4` | `QUEUED` | Formal/informal map, kernel-residual inequalities and architecture comparison. |
| `E306-PD-C3` | `BLOCKED-SOURCE` | Human-visible Rosser–Schoenfeld pp. 69–70 transcription check unavailable. |

## Immediate formal/informal status correction

The header prose in `lean/RequestProject/GlobalControl.lean` describes `global_levelset` and `global_control_partition` as remaining named `sorry`s. That description is stale at the released checkpoint. The downstream released modules contain the completed route, including:

- `GlobalControlG5Assembly.global_levelset_final`;
- the G6 localization chain in `GlobalControlG6`;
- the G7 global-partition assembly in `GlobalControlG7`.

This is a documentation/correspondence defect, not a contradiction in the released theorem. The exact axiom audit of `erdos_306` remains controlling.

## Operating rule

For every unit, record separately:

1. mathematical statement and all quantifiers;
2. complete human derivation;
3. exact released declarations and dependency path;
4. external assumptions, if any;
5. finite or kernel-checked residual inequalities;
6. edge cases and parameter order;
7. status (`ARGUMENT`, `COMPLETE-DRAFT`, `READY-FOR-CONSUMER`, or an exact block).

Only an implication requiring genuinely new mathematics is returned to `E306-RL`.