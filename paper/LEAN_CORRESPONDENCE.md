# Erdős 306 paper / Lean correspondence

Workstream: `E306-P1-RECOVERY`

Recovery base: `paper/arxiv-v1@c264d00a722364c777d89e4438aadc7babfcdbe0`

Successor: `paper/arxiv-v1-recovery-v1`

Immutable evidence: `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`, DOI `10.5281/zenodo.20767390`

Frozen architecture context: `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`

## Three layers that must remain separate

### A. Paper mathematics

The paper uses PNT `π(x)~x/log x` as its sole load-bearing external analytic theorem. It proves by Abel/partial summation

`A_k := Σ_{2^k≤p<2^(k+1)} 1/p = 1/k + o(1/k)`

and derives eventual dyadic cardinality and eventual inclusive-window mass. This bridge is paper mathematics, not a current project Lean declaration.

### B. Frozen architecture context

At `codex/pushlinter@e55ef359...`, the downstream construction is organized around structural analytic inputs, finite spectral selection, global control, construction certificates, and numerator reduction. Its structural analytic declarations are not claimed to be proved at that checkpoint. The paper's eventual interfaces are a mathematical rephrasing justified by choosing the bottom scale last; they are not edits to the frozen Lean source.

### C. Immutable released evidence

At `v0.0.3`, the headline theorem is kernel checked and its exact audit is:

1. `propext`;
2. `Classical.choice`;
3. `Quot.sound`;
4. `RosserSchoenfeld.rosser_schoenfeld_cor3`;
5. `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The last two remain the exact formal backend. The PNT paper proof does not change that audit.

## Public theorem statement

The paper theorem says that a positive rational `q=a/b` in lowest terms is a finite sum of reciprocals of distinct squarefree semiprimes exactly when `b` is squarefree.

The released Lean conclusion has the shape:

```lean
∀ (q : Rat), 0 < q → Squarefree q.den →
  ∃ k : Nat, ∃ n : Fin (k + 1) → Nat,
    n 0 = 1 ∧ StrictMono n ∧
    (∀ i ∈ Finset.Icc 1 (Fin.last k),
      Nat.omega (n i) = 2 ∧ Nat.Omega (n i) = 2) ∧
    q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : Rat) / n i
```

The value `n 0=1` is a dummy anchor. Strict monotonicity gives distinct remaining denominators; `ω=Ω=2` identifies products of two distinct primes.

## Analytic correspondence

| Paper object | Paper status | Frozen context | Released counterpart |
|---|---|---|---|
| PNT | external theorem | no imported/proved PNT theorem claimed | no PNT axiom |
| Abel/partial-summation bridge | proved in paper | no project bridge theorem claimed | none |
| `A_k=1/k+o(1/k)` | proved in paper | no named project theorem | none |
| eventual dyadic cardinality | proved from local law | construction-facing structural density interface | derived in the release from `rosser_schoenfeld_cor3` |
| eventual inclusive-window mass | proved from local law | inclusive structural mass interface | derived in the release from `rosser_schoenfeld_thm5` |

Inclusive blocks `k_0,...,3k_0` correspond exactly to `[2^{k_0},2^{3k_0+1})`.

## Construction correspondence

The following are architecture/exposition locators, not released authority:

| Paper handoff | Frozen architecture role |
|---|---|
| avoiding representation / numerator closure | unit-numerator reduction and semiprime representation |
| finite Fourier selection | reciprocal-selection principle |
| CRT control geometry | global-control and construction-control modules |
| cold blocks / level sets | partition and level-set assembly |
| localization / high-floor / diagonal tail | global-control subcertificates |
| mass pool and weights | block-prime and mass-pool construction |
| block-minor fibre | minor-arc block estimate and frequency lanes |
| squarefree reservoir damping | sibling choice and extra-gadget damping |
| terminal parameter order | parameter selection and minor-arc endgame |
| final assembly | construction certificates and semiprime representation |

The clean names inform exposition; current kernel-check evidence remains the released theorem.

## Approved wording

Accurate:

- The paper proof invokes PNT and proves the local reciprocal-prime law.
- The archived Lean release uses two exact Rosser--Schoenfeld inputs.
- The frozen refactor organizes the downstream construction around structural interfaces.
- The PNT bridge is not currently part of the released Lean theorem.

Prohibited:

- The released Lean theorem depends on PNT.
- The PNT bridge is already formalized in this repository.
- The frozen structural axioms are proved Lean consequences.
- The frozen checkpoint is the current released proof authority.
- Completion of the recovery makes the manuscript independently reviewed or arXiv-ready.

## Remaining formal gates

1. Separate exact-tip verification and disposition of the frozen checkpoint.
2. Any PNT formalization or analytic bridge requires a separately authorized workstream.
3. Human-visible source comparison for the two released Rosser--Schoenfeld transcriptions.
4. Final extensional comparison of paper theorem wording and released proposition.
