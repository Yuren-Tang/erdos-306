# Erdős 306 proof-obligation DAG

This ledger records logical dependence, not source-file import order. A node marked **Lean-closed** is already proved at the immutable release; proof development may nevertheless remain necessary to make its human proof explicit.

## 0. Authority and external boundary

- `F0` — released formal theorem `Erdos306.erdos_306`. **Lean-closed.**
- `RS1` — `RosserSchoenfeld.rosser_schoenfeld_cor3`. **External formal assumption.**
- `RS2` — `RosserSchoenfeld.rosser_schoenfeld_thm5`. **External formal assumption.**
- `PNT` — `π(x) ~ x/log x`. **External human-backend theorem; not a released axiom.**

The formal branch uses `RS1, RS2`; the PNT-first human branch uses `PNT`. They meet only at construction-facing supply statements.

## 1. Statement and arithmetic closure

```text
A0 exact theorem / formal target correspondence
 ├─ A1 necessity: squarefree reciprocal denominators => squarefree reduced denominator
 └─ A1' sufficiency conventions: squarefree semiprime, avoidance, distinctness
      ├─ A11 small b = 1,2 reductions
      ├─ A11' numerator iteration with enlarged obstruction sets
      └─ A12 finite set => strictly increasing formal tuple
```

Formal counterparts for the sufficiency closure are already Lean-closed in `Erdos306Final` and `Erdos306FormalConjectures`. Human assembly remains pending.

## 2. Analytic supply fork

```text
RS1 ──> A3-D  eventual dyadic prime cardinality
RS2 ──> A3-M  inclusive reciprocal-prime window mass

PNT ──> A4-L  local reciprocal-prime law
             ├─> A4-D eventual dyadic prime cardinality
             └─> A4-M inclusive reciprocal-prime window mass

(A3-D,A3-M) or (A4-D,A4-M)
             └─> A2 minimal AnalyticInputs interface
```

Open proof-development obligations:

- common threshold for all eventual estimates;
- exact inclusive window `k0,...,3k0` ↔ `[2^k0,2^(3k0+1))`;
- constants first, bottom scale last;
- distinguish a sufficient interface from the weakest responsible interface.

## 3. Finite spectral construction

```text
A1' + A2
  ├─ A5 finite Fourier identity and positive weighted count
  └─ A6 denominator family
       ├─ A6.1 control graph and control estimates              [ACTIVE]
       ├─ A6.2 mass-pool construction
       └─ A6.3 denominator-sensitive gadget reservoirs

A6.1
  ├─ G5 global control level-set bound                          [Lean-closed]
  ├─ G6 off-main localization dichotomy                        [Lean-closed]
  └─ G7 global control partition                               [Lean-closed]

A5 + A6 + G7
  ├─ A7 main-arc Taylor/Gaussian lower bound                    [Lean-closed]
  ├─ A8 block-minor fibre bound                                 [Lean-closed]
  ├─ A9 squarefree-CRT sibling suppression                     [Lean-closed]
  └─ A10 terminal parameter compatibility and positivity        [Lean-closed]

A10 + A11 + A11' + A12
  └─ A13 complete human theorem
       └─ F0 formal theorem correspondence
```

“Lean-closed” does not mean the present manuscript gives a complete human proof. In particular, the P16–P23 and P27–P32 regions contain compressed handoffs that must be reconstructed from the proved declarations and their mathematical content.

## 4. Current active frontier within proof development

### `E306-PD-A6.1 / P16`

Inputs:

- a block system with dyadic prime windows and lower cardinality density;
- the internal and adjacent-block control-pair graph.

Required outputs:

1. exact definition of `Qctrl` and `sigmaCtrl`;
2. bottom-block count giving
   `1/(100 k0 2^k0) <= sigmaCtrl` for `k0 >= 14`;
3. elementary dyadic reciprocal upper bound `Σ_{p in P_k} 1/p <= 4/k`;
4. summation of internal and adjacent-block pair loads giving
   `controlLoad <= 512/(k0-1)`;
5. for fixed `b`, a bottom-scale threshold giving
   `controlLoad <= 3/(4b)`;
6. exact map to released declarations and the later uses of these inequalities.

No unresolved new-mathematics lemma is presently visible in this unit.

## 5. Cross-cutting correspondence and repair nodes

- `C1` — proposition/declaration map for every node.
- `C2` — reproducible human treatment of kernel-residual finite inequalities.
- `C3` — Rosser–Schoenfeld publisher-scan comparison. **BLOCKED-SOURCE.**
- `C4` — released tree versus frozen refactor architecture.
- `R1` — Review A threshold/window/quantifier-order repairs.
- `R2` — future Review B defects.
- `DOC1` — stale `GlobalControl.lean` status prose versus released G5/G6/G7 closure.

These nodes attach to the mathematical DAG without changing the immutable release authority.