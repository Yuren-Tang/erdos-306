# Erdős 306 proof-obligation DAG

This ledger records logical dependence, not source-file import order. A node
marked **Lean-closed** is already proved at the immutable release; proof
development may nevertheless remain necessary to make its human proof explicit.

## 0. Authority and external boundary

- `F0` — released formal theorem `Erdos306.erdos_306`. **Lean-closed.**
- `RS1` — `RosserSchoenfeld.rosser_schoenfeld_cor3`. **External formal assumption.**
- `RS2` — `RosserSchoenfeld.rosser_schoenfeld_thm5`. **External formal assumption.**
- `PNT` — `pi(x) ~ x/log x`. **External human-backend theorem; not a released axiom.**

The formal branch uses `RS1, RS2`; the PNT-first human branch uses `PNT`. They
meet only at the construction-facing analytic interface.

## 1. Completed theorem and arithmetic closure

```text
A0 exact theorem / formal target correspondence                 [COMPLETE-DRAFT]
 ├─ A1 necessity via squarefree lcm                             [COMPLETE-DRAFT]
 └─ A1' sufficiency conventions                                 [COMPLETE-DRAFT]
      ├─ A11 b = 1,2 reductions                                 [COMPLETE-DRAFT]
      ├─ A11' numerator induction with enlarged obstructions     [COMPLETE-DRAFT]
      └─ A12 finite set -> strictly increasing formal tuple      [COMPLETE-DRAFT]
             └─ A13 public theorem / F0 correspondence           [COMPLETE-DRAFT]
```

Proof unit: `units/E306-PD-A11-A13-ARITHMETIC-CLOSURE.md`.

## 2. Analytic supply fork — current frontier

Define the common-threshold construction interface `AI` by:

```text
for every k0 >= K_AI:
  D(k0): density holds for every k in [k0,3k0];
  M(k0): reciprocal-prime mass on inclusive blocks k0,...,3k0 is >= 21/20.
```

The logical fork is

```text
RS1 ──> RS-D eventual dyadic density
RS2 ──> RS-M inclusive reciprocal window
(RS-D,RS-M) ──> AI_RS

PNT ──> PNT-L local reciprocal-prime law
             ├─> PNT-D eventual dyadic density
             └─> PNT-M inclusive reciprocal window
(PNT-D,PNT-M) ──> AI_PNT

AI_RS or AI_PNT
  └─> A2 backend-independent AnalyticInputs
       └─> article core
            └─> A13/F0
```

Active obligations:

1. state `AI` with one common threshold and exact inclusive endpoint;
2. prove `AI -> structural avoiding representation -> Erdos306` without naming a backend;
3. derive `AI_RS` from the two exact released axioms/declarations;
4. derive `AI_PNT` through Abel summation with uniform error and endpoint control;
5. distinguish source certification of RS1/RS2 from the kernel-checked consequences already in the release.

`C3`, the human-visible publisher-scan comparison, remains `BLOCKED-SOURCE` but
is not a block on items 1–4.

## 3. Completed article core

```text
A1' + A2
 ├─ A5 finite Fourier identity and positivity                    [COMPLETE-DRAFT]
 └─ denominator/control family
      ├─ A6.1 control graph, sigma and reciprocal load           [COMPLETE-DRAFT]
      ├─ A6.2 cold forcing and corrected boundary penalty        [COMPLETE-DRAFT]
      ├─ A6.3 global level sets/localization/partition            [COMPLETE-DRAFT]
      └─ A6.4 mass pool, weights and variance                    [COMPLETE-DRAFT]

A5 + A6.1–A6.4
 ├─ A7 main-arc Taylor/Gaussian lower bound                      [COMPLETE-DRAFT]
 ├─ A8 block-minor fibre transfer                                [COMPLETE-DRAFT]
 ├─ A9 squarefree-CRT sibling suppression                        [COMPLETE-DRAFT]
 └─ A10 terminal parameter compatibility and positivity          [COMPLETE-DRAFT]

A10 + A11 + A11' + A12
 └─ A13 complete human theorem                                   [COMPLETE-DRAFT]
      └─ F0 formal theorem correspondence                        [Lean-closed]
```

Unit files:

- `E306-PD-A6-1-CONTROL-GEOMETRY.md`;
- `E306-PD-A6-2-COLD-BLOCK-BOUNDARY.md`;
- `E306-PD-A6-3-GLOBAL-CONTROL.md`;
- `E306-PD-A6-4-MASS-WEIGHTS-VARIANCE.md`;
- `E306-PD-A7-A10-SPECTRAL-ENDGAME.md`;
- `E306-PD-A11-A13-ARITHMETIC-CLOSURE.md`.

The coherent consumer packet is `proof-development/ARTICLE_CORE_CHECKPOINT.md`.

## 4. Load-bearing corrections in the completed spine

- `CORR-BDY` — the original adjacent-label statement without label-size
  hypotheses is false. The active route uses the exception-aware corrected
  theorem.
- `CORR-G5` — the global level-set factor is
  `exp(A * numBlocks BS)` with fixed `A`; a free post hoc `Cglob` is unsound.
- `CORR-MASS` — forbidden control/gadget pool terms are absorbed by the fixed
  base load; no unrecorded surplus beyond the `1/2` pool lower bound is used.
- `CORR-FIBRE` — block-minor and sibling counts retain the explicit factors `b`
  and `b(2N+1)`.
- `CORR-VAR` — the terminal comparison needs the upper variance bridge
  `sigmaE <= 501 * sigmaCtrl`.
- `CORR-ORDER` — constants are chosen in the order
  `eta -> C -> Dmp -> G -> k0`.

Each correction is now integrated into the dependency-respecting proof units.

## 5. Cross-cutting correspondence and residual nodes

- `C1` — proposition/declaration map. **Article core complete; analytic map active.**
- `C2` — reproducible finite/kernel residual ledger. **Article core complete-draft.**
- `C3` — Rosser–Schoenfeld publisher-scan comparison. **BLOCKED-SOURCE.**
- `C4` — released tree versus frozen refactor architecture. **QUEUED.**
- `R1` — Review A threshold/window/quantifier-order repairs. **Active in PNT provider.**
- `R2` — dispositioned Review B defects. **Awaiting return.**
- `DOC1` — stale `GlobalControl.lean` status prose. **Recorded documentation defect.**

## 6. Genuine stop test

Return to `E306-RL` only if the active implication requires a new mathematical
theorem not supplied by the released proof, the accepted PNT premise, or a named
finite/kernel residual. No such obstruction is presently visible.
