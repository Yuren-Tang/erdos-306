# Erdős 306 proof-obligation DAG

This ledger records logical dependence, not source-file import order. A node
marked **Lean-closed** is already proved at the immutable release; human proof
development may nevertheless be required.

## 0. Authority and external boundary

- `F0` — released theorem `Erdos306.erdos_306`. **Lean-closed.**
- `RS1` — `RosserSchoenfeld.rosser_schoenfeld_cor3`. **External formal assumption.**
- `RS2` — `RosserSchoenfeld.rosser_schoenfeld_thm5`. **External formal assumption.**
- `PNT` — `pi(x) ~ x/log x`. **External human-backend theorem; not a released axiom.**

The two backend branches meet only at `AI`.

## 1. Completed theorem closure

```text
A0 exact theorem / public target                                  [COMPLETE-DRAFT]
 ├─ A1 necessity via squarefree lcm                              [COMPLETE-DRAFT]
 └─ A1' sufficiency conventions                                  [COMPLETE-DRAFT]
      ├─ A11 b = 1,2 reductions                                  [COMPLETE-DRAFT]
      ├─ A11' numerator induction                                [COMPLETE-DRAFT]
      └─ A12 finite set -> increasing tuple                      [COMPLETE-DRAFT]
             └─ A13 public theorem / F0 correspondence            [COMPLETE-DRAFT]
```

## 2. Completed analytic fork

`AI` is the existence of one threshold `K_AI` such that every `k0 >= K_AI`
has:

```text
D(k0): dyadic density on every k in [k0,3k0];
M(k0): inclusive reciprocal-prime mass >= 21/20 on k0,...,3k0.
```

```text
RS1 -> RS-D
RS2 -> RS-M
(RS-D,RS-M) -> AI_RS                         [COMPLETE-DRAFT / LEAN-CLOSED]

PNT -> PNT-L local reciprocal law
          ├─> PNT-D
          └─> PNT-M
(PNT-D,PNT-M) -> AI_PNT                      [COMPLETE-DRAFT]

AI_RS or AI_PNT
  -> A2 backend-independent interface
  -> article core
  -> A13/F0                                  [COMPLETE-DRAFT]
```

Unit: `units/E306-PD-B1-B3-ANALYTIC-INTERFACE.md`.

The human-visible publisher-scan comparison for RS1/RS2 remains
`BLOCKED-SOURCE`; it does not reopen the mathematical implications above.

## 3. Completed article core

```text
A1' + A2
 ├─ A5 finite Fourier identity and positivity                    [COMPLETE-DRAFT]
 └─ denominator/control family
      ├─ A6.1 control graph, sigma and reciprocal load           [COMPLETE-DRAFT]
      ├─ A6.2 cold forcing and corrected boundary penalty        [COMPLETE-DRAFT]
      ├─ A6.3 level sets, localization and partition             [COMPLETE-DRAFT]
      └─ A6.4 mass pool, weights and variance                    [COMPLETE-DRAFT]

A5 + A6.1–A6.4
 ├─ A7 main arcs                                                 [COMPLETE-DRAFT]
 ├─ A8 block-minor fibre                                         [COMPLETE-DRAFT]
 ├─ A9 squarefree sibling suppression                            [COMPLETE-DRAFT]
 └─ A10 terminal positivity                                      [COMPLETE-DRAFT]
```

Consumer packet: `proof-development/ARTICLE_CORE_CHECKPOINT.md`.

## 4. Load-bearing corrections

- `CORR-BDY` — active adjacent-label theorem requires label-size, cardinality
  and exception hypotheses; the original unqualified statement is false.
- `CORR-G5` — the level-set factor is `exp(A * numBlocks BS)` with fixed `A`.
- `CORR-MASS` — forbidden pool terms are absorbed by the already-spent base load.
- `CORR-FIBRE` — factors `b` and `b(2N+1)` remain explicit.
- `CORR-VAR` — terminal comparison uses `sigmaE <= 501 * sigmaCtrl`.
- `CORR-ORDER` — `eta -> C -> Dmp -> G -> k0`.
- `CORR-ENDPOINT` — the analytic mass window is inclusive through `3k0`, hence
  ends at `2^(3k0+1)`.
- `CORR-UNIFORM` — the PNT Abel bridge uses a tail-uniform error, not pointwise
  substitution under the integral.

## 5. Correspondence and residual nodes

- `C1` — P0–P33 proposition/declaration map. **COMPLETE-DRAFT.**
- `C2` — finite/kernel-residual ledger. **COMPLETE-DRAFT.**
- `C3` — RS publisher-scan comparison. **BLOCKED-SOURCE.**
- `C4` — released tree versus frozen refactor architecture. **ACTIVE.**
- `R1` — Review A threshold/window repairs. **ABSORBED.**
- `R2` — independent Review B findings. **AWAITING RETURN.**
- `DOC1` — stale `GlobalControl.lean` header. **DOCUMENTATION-STATUS DEFECT.**

Consolidated file: `proof-development/FORMAL_INFORMAL_CORRESPONDENCE.md`.

## 6. Current active frontier

```text
C4:
  release declarations and actual consumers
    <-> reorganized read-only refactor graph
    <-> manuscript architecture
```

The comparison may supply better theorem decomposition and locators. It may not
transfer proof status, analytic premises or authority from the unreleased
refactor.

## 7. Genuine stop test

Return to `E306-RL` only if a required implication needs new mathematics not
supplied by the released proof, the accepted PNT premise, or a named finite
residual. No such obstruction is presently visible.
