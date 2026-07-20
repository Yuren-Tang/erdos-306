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
| `E306-PD-A0–A1` | `COMPLETE-DRAFT` | Exact theorem, necessity, semiprime conventions and squarefree roles are consolidated in the arithmetic-closure and article-core packets. |
| `E306-PD-A2 / B1` | `ACTIVE` | Isolate one backend-independent, common-threshold `AnalyticInputs -> Erdos306` theorem using exactly the construction-consumed dyadic density and inclusive reciprocal-window supplies. |
| `E306-PD-A3 / B2` | `ARGUMENT / BLOCKED-SOURCE` | The released RS provider is formally closed; exact human source transcription remains gated by the publisher scan, while the derivation from the named axioms can be expounded now. |
| `E306-PD-A4 / B3 / R1` | `ARGUMENT` | Complete the PNT/partial-summation provider with uniform error, endpoint conversion, one common threshold and scale-last quantifier order. |
| `E306-PD-A5` | `COMPLETE-DRAFT` | Finite Fourier conventions, positivity criterion and no-wrap conversion are incorporated in the spectral endgame. |
| `E306-PD-A6.1 / P16` | `COMPLETE-DRAFT` | Control graph, `sigmaCtrl` lower bound and reciprocal-load upper bound. |
| `E306-PD-A6.2 / P17–P18` | `COMPLETE-DRAFT` | Nondominant forcing, dominant labels, exception charging and corrected exception-aware boundary penalty. |
| `E306-PD-A6.3 / P19–P23` | `COMPLETE-DRAFT` | Global level sets, localization, Laplace absorption, Gaussian tail and global partition. |
| `E306-PD-A6.4 / P24–P26` | `COMPLETE-DRAFT` | Pair pool, forbidden removal, greedy mass batch, uniform weights and variance comparison. |
| `E306-PD-A7–A10 / P27–P32` | `COMPLETE-DRAFT` | Main arcs, block-minor transfer, squarefree sibling damping and terminal positivity. |
| `E306-PD-A11–A13 / P0–P3,P33` | `COMPLETE-DRAFT` | Necessity, small denominators, numerator induction, public tuple bridge and exact formal assembly. |
| `E306-PD-B4–B5` | `QUEUED` | Compare backend strength and record alternate/future analytic providers without changing released authority. |
| `E306-PD-C1–C2` | `ARGUMENT` | Article-core declaration maps and kernel-residual ledgers now exist; complete the analytic and top-level correspondence map. |
| `E306-PD-C3` | `BLOCKED-SOURCE` | Human-visible Rosser–Schoenfeld pp. 69–70 comparison unavailable. |
| `E306-PD-C4` | `QUEUED` | Released tree versus frozen refactor architecture. |
| `E306-PD-R2` | `QUEUED` | Consume dispositioned Review B findings when returned. |

## Material checkpoints

### Article core

Checkpoint file: `proof-development/ARTICLE_CORE_CHECKPOINT.md`.

The complete-draft article core now covers P16–P32 and the arithmetic closure to
the public theorem. It preserves:

- the corrected adjacent-label hypotheses and exception budget;
- the fixed `exp(A * numBlocks)` global level-set factor;
- exact forbidden-pool cancellation;
- explicit CRT fibre and sibling multiplicities;
- the variance bridge `sigmaE <= 501 * sigmaCtrl`;
- the constant order `eta -> C -> Dmp -> G -> k0`;
- exact finite/kernel-residual delegation.

No conceptual implication required return to `E306-RL`.

### Unit files

- `units/E306-PD-A6-1-CONTROL-GEOMETRY.md`;
- `units/E306-PD-A6-2-COLD-BLOCK-BOUNDARY.md`;
- `units/E306-PD-A6-3-GLOBAL-CONTROL.md`;
- `units/E306-PD-A6-4-MASS-WEIGHTS-VARIANCE.md`;
- `units/E306-PD-A7-A10-SPECTRAL-ENDGAME.md`;
- `units/E306-PD-A11-A13-ARITHMETIC-CLOSURE.md`.

## Immediate formal/informal status correction

The header prose in `lean/RequestProject/GlobalControl.lean` describes
`global_levelset` and `global_control_partition` as remaining named `sorry`s.
That description is stale at the released checkpoint. The active downstream
release closes the route through:

- `GlobalControlG5Assembly.global_levelset_final`;
- `GlobalControlG6.g6_localization`;
- `GlobalControlG7.global_control_partition_final`.

This is a documentation/correspondence defect, not a contradiction in the
released theorem. The exact axiom audit of `erdos_306` remains controlling.

## Current active frontier

Construct a reusable theorem-level interface with one common eventual threshold:

```text
AnalyticInputs
  = eventual dyadic density on every block in [k0,3k0]
    + inclusive reciprocal-prime mass >= 21/20 on k0,...,3k0

AnalyticInputs -> structural avoiding representation -> Erdos306.
```

Then supply two strictly separated providers:

1. released Rosser–Schoenfeld provider;
2. human PNT plus Abel/partial-summation provider.

The source-scan gate affects exact primary-source certification of provider 1;
it does not block the abstract theorem or the already kernel-checked derivation
from the named axioms.

## Operating rule

For every unit, record separately:

1. mathematical statement and all quantifiers;
2. complete human derivation;
3. exact released declarations and dependency path;
4. external assumptions, if any;
5. finite or kernel-checked residual inequalities;
6. edge cases and parameter order;
7. status (`ARGUMENT`, `COMPLETE-DRAFT`, `READY-FOR-CONSUMER`, or an exact block).

Only an implication requiring genuinely new mathematics is returned to
`E306-RL`.
