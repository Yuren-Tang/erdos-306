# Erdős 306 proof-obligation DAG

This ledger records logical dependence, not source-file import order. A node
marked **Lean-closed** is proved at the immutable release; human proof
development and manuscript translation may nevertheless remain.

## 0. Authority and external boundary

- `F0` — released theorem `Erdos306.erdos_306`. **Lean-closed.**
- `RS1` — `RosserSchoenfeld.rosser_schoenfeld_cor3`. **External formal assumption.**
- `RS2` — `RosserSchoenfeld.rosser_schoenfeld_thm5`. **External formal assumption.**
- `PNT` — `pi(x) ~ x/log x`. **External human-backend theorem; not a released axiom.**
- `RB` — independent Review B at
  `review/e306-p1-construction-v1@0b9c79d8727152d5e2511b39a48bbea0d437487e`.

The analytic backend branches meet only at `AI`. Review B is an assurance input,
not proof authority.

## 1. Completed theorem closure

```text
A0 exact theorem / public target                                  [COMPLETE-DRAFT]
 ├─ A1 necessity via squarefree lcm                              [COMPLETE-DRAFT]
 └─ A1' sufficiency conventions                                  [COMPLETE-DRAFT]
      ├─ A11 b = 1,2 reductions                                  [COMPLETE-DRAFT]
      ├─ A11' numerator induction                                [COMPLETE-DRAFT]
      └─ A12 finite set -> finite increasing tuple               [COMPLETE-DRAFT]
             └─ A13 public theorem / F0 correspondence            [COMPLETE-DRAFT]
```

The semiprime / `omega=Omega=2` equivalence and the finite tuple bridge are
explicit in A11–A13 and the Review B reconciliation supplement.

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
`BLOCKED-SOURCE`; it does not reopen these implications.

## 3. Completed article core

```text
A1' + A2
 ├─ A5 finite Fourier identity and positivity                    [COMPLETE-DRAFT]
 └─ denominator/control family
      ├─ A6.1 exact control graph, sigma and load                [COMPLETE-DRAFT]
      ├─ A6.2 cold forcing, exceptions and boundary penalty      [COMPLETE-DRAFT]
      ├─ A6.3 label-uniform levels/localization/partition         [COMPLETE-DRAFT]
      └─ A6.4 mass pool, weights and variance                    [COMPLETE-DRAFT]

A5 + A6.1–A6.4
 ├─ A7 main arcs and logarithm branch                            [COMPLETE-DRAFT]
 ├─ A8 exact Fourier-minor split and block fibre                 [COMPLETE-DRAFT]
 ├─ A9 squarefree sibling mismatch and common reservoir          [COMPLETE-DRAFT]
 └─ A10 terminal positivity                                      [COMPLETE-DRAFT]
```

The proof sources are the unit files plus
`proof-development/REVIEW_B_RECONCILIATION.md`.

## 4. Review B reconciliation

```text
RB independent review
  ├─ RB-01..RB-17 mathematical/expository findings
  │    -> exact PDL units + reconciliation supplements          [ABSORBED]
  ├─ RB-18 manuscript proof-ledger synchronization
  │    -> next manuscript worker                                [ROUTED]
  ├─ RB-19 stale Lean comments
  │    -> separate documentation authority                      [NOT AUTHORIZED HERE]
  └─ RB-20 no independent kernel/CI rerun
       -> evidence record only                                  [RECORDED]

absorbed proof package
  -> ARTICLE_CORE_CHECKPOINT
  -> READY-FOR-MANUSCRIPT-REVISION                              [CLOSED HANDOFF]
```

Review B found no material mathematical gap, unrecorded downstream input,
circular parameters, or material theorem mismatch. The fixed candidate remains
unrevised; readiness attaches to the proof package, not to the old manuscript.

## 5. Load-bearing corrections

- `CORR-CTRL` — exact faithful assignment space, centred CRT convention, and
  internal/adjacent control graph are stated.
- `CORR-LOAD` — control load uses dyadic reciprocal bounds and a graph-tail sum,
  not denominator growth alone.
- `CORR-BDY` — adjacent-label penalty retains label-size, cardinality, agreement,
  and exception hypotheses.
- `CORR-WRAP` — non-wrapped huge fibres are empty; wrapped fibres inject into a
  fixed small-label fibre.
- `CORR-G5` — level-set factor is `exp(A * numBlocks BS)` with fixed `A`.
- `CORR-MASS` — forbidden pool terms are absorbed by already-spent base load.
- `CORR-VAR` — terminal comparison uses `sigmaE <= 501 * sigmaCtrl`.
- `CORR-LOG` — Bernoulli factors are nonzero in the Taylor disk and the logarithm
  branch is justified.
- `CORR-LANES` — block/extra lanes are a disjoint partition inside the Fourier
  minor set.
- `CORR-FIBRE` — factors `b` and `b(2N+1)` remain explicit.
- `CORR-RES` — one common `G`-prime reservoir supplies distinct selected gadget
  edges with the exact pointwise-to-sum budget.
- `CORR-ORDER` — `eta -> C -> Dmp -> G -> k0`.
- `CORR-ENDPOINT` — analytic mass window is inclusive through `3k0`, ending at
  `2^(3k0+1)`.
- `CORR-UNIFORM` — PNT Abel bridge uses a tail-uniform error.
- `CORR-TUPLE` — the public object is a finite strictly increasing tuple, not an
  infinite sequence.

## 6. Correspondence and residual nodes

- `C1` — P0–P33 proposition/declaration map. **COMPLETE-DRAFT.**
- `C2` — finite/kernel-residual ledger. **COMPLETE-DRAFT.**
- `C3` — RS publisher-scan comparison. **BLOCKED-SOURCE.**
- `C4` — released tree versus frozen refactor architecture. **ACTIVE / NON-BLOCKING.**
- `R1` — Review A threshold/window repairs. **ABSORBED.**
- `R2` — independent Review B findings. **RECONCILED.**
- `DOC1` — stale released comments. **DOCUMENTATION-STATUS DEFECT / SEPARATE.**

Consolidated files:

- `proof-development/FORMAL_INFORMAL_CORRESPONDENCE.md`;
- `proof-development/REVIEW_B_RECONCILIATION.md`;
- `proof-development/ARTICLE_CORE_CHECKPOINT.md`.

## 7. Current handoff and continuing frontier

The exact consumer state is `READY-FOR-MANUSCRIPT-REVISION`. The manuscript
worker must revise the fixed candidate and only then synchronize its proof
ledger and seek renewed assurance.

The persistent programme remains open. Its non-blocking active frontier is C4
and future returned defects, source checks, and interface generalizations.

## 8. Genuine stop test

Return to `E306-RL` only if a required implication needs new mathematics not
supplied by the released proof, the accepted PNT premise, or a named finite
residual. No such obstruction is presently visible.
