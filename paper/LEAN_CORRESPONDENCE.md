# Erdős 306 paper / Lean correspondence

Workstream: `E306-P1-REV1`  
Revised manuscript branch: `paper/arxiv-v1-revision-v1`  
Fixed parent: `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
Proof-development source: `proof-development/e306-rigour-v1@2eda43717603877d4c5a879b3103f99e36d5e6d1`  
Immutable evidence: `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`, DOI `10.5281/zenodo.20767390`  
Secondary frozen context: `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`

## Four layers that remain separate

### A. Paper mathematics

The article uses PNT `π(x)~x/log x` as its sole load-bearing external analytic theorem. It proves, by Abel summation with a tail-uniform PNT error,

`A_k := Σ_{2^k≤p<2^(k+1)} 1/p = 1/k + o(1/k)`.

It then fixes one common `K_AI` that supplies both dyadic density and inclusive-window mass for every `k0≥K_AI`. The inclusive blocks `k0,...,3k0` are exactly the prime interval `[2^k0,2^(3k0+1))`. This analytic bridge is paper mathematics, not a released project Lean declaration.

The revised downstream proof now displays the exact control graph, exception-aware cold-block and boundary theorems, label-uniform global encoder, localization, mass cancellation, variance constants, main-arc logarithm branch, exact minor lanes, common reservoir, terminal quarter budgets, and finite tuple bridge.

### B. Immutable released evidence

At `v0.0.3`, the public theorem is kernel checked. Its exact audit is:

1. `propext`;
2. `Classical.choice`;
3. `Quot.sound`;
4. `RosserSchoenfeld.rosser_schoenfeld_cor3`;
5. `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The last two remain the exact formal backend. The PNT paper proof does not alter that audit. Human comparison of their transcriptions with the publisher scan remains source-gated.

### C. Proof-development source

The PDL checkpoint supplies human theorem/proof expansions and the Review B reconciliation consumed by this revision. It is an authorial development source, not an independent review result and not released authority. Named finite/kernel residuals may be delegated to the immutable release only after the manuscript displays the mathematical hypotheses and implication.

### D. Frozen architecture context

The `codex/pushlinter` checkpoint supplies secondary declaration and dependency context. Its structural analytic abstractions are not paper premises, are not silently inherited as proved, and do not replace the released declarations.

## Public theorem and finite tuple

The paper theorem states that a positive rational `q=a/b` in lowest terms is a finite sum of reciprocals of distinct squarefree semiprimes exactly when `b` is squarefree.

The released conclusion has the form:

```lean
∀ (q : Rat), 0 < q → Squarefree q.den →
  ∃ k : Nat, ∃ n : Fin (k + 1) → Nat,
    n 0 = 1 ∧ StrictMono n ∧
    (∀ i ∈ Finset.Icc 1 (Fin.last k),
      Nat.omega (n i) = 2 ∧ Nat.Omega (n i) = 2) ∧
    q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : Rat) / n i
```

The bridge is finite. A nonempty finite denominator set is enumerated increasingly; a dummy anchor `1` is prepended; the anchor is excluded from the sum. A product of two distinct primes implies `ω=Ω=2`, and the manuscript now also proves the converse. No infinite sequence is asserted.

## Proposition correspondence

| Paper proposition | Released locator or boundary | Correspondence status |
|---|---|---|
| P0 semiprime criterion | `isSemiprime_omega_Omega`, `isSemiprime_one_lt` | Paper proves both directions; release consumes the forward direction. |
| P1 necessity | no declaration needed by released sufficiency theorem | Paper-only elementary lcm proof. |
| P2 numerator induction | `reduction_to_unit_numerator_avoiding` | Exact conceptual match. |
| P3 `b=1,2` | `egyptian_rep_eq2_R2`, `exists_semiprime_egyptian_one_R2` | Exact conceptual match. |
| P4-P7 PNT/Abel/local law | no released PNT bridge | Paper-only analytic backend. |
| P8 density | `GlobalControl.dyadic_prime_density` | Same construction interface; separate RS provider in release. |
| P9 inclusive mass | `GlobalControl.dyadic_mertens_cumulative` | Same construction interface and endpoint; separate RS provider in release. |
| P10 common threshold | block-system and R2 terminal assembly | Human dependency factorization; no single released `AnalyticInputs` structure. |
| P12-P14 Fourier/no-wrap | finite Fourier and weighted-count chain | Exact finite conventions. |
| P15 control definitions | `BlockSystem`, `ctrlPairs`, `blockSupport`, `GlobalAssignment`, `Hglob`, `Qctrl`, `sigmaCtrl` | Exact definitions exposed in paper. |
| P16 control estimates | `sigmaCtrl_ge_strong`, `ctrl_recipLoad_le_tail`, `exists_k0_controlLoad_lt` | Paper proves stronger human load bound `32/(k0-1)`. |
| P17 dominance/exceptions | `theorem_B_nondominant_forcing`, `dominant_label_unique`, `exception_count_bound`, `cold_master` | Conceptual proof exposed; rational chase finite-residual. |
| P18 boundary | `crossblock_phase_bridge`, `mismatch_per_q`, `mismatch_penalty_with_exceptions` | Revised paper states every active hypothesis; the old unqualified claim is rejected. |
| P19 level set | `global_levelset_final` | Four-layer injective code and fixed `exp(A·numBlocks)` exposed. |
| P20 localization | `g6_localization`, `diagonal_Qctrl` | Exact forcing floor, no-exception route, and quadratic identity exposed. |
| P21 Laplace | `sectorI_absorption'` | Shell argument exposed; terminal limit arithmetic finite-residual. |
| P22 Gaussian tail | `sectorII_gaussian` | Label injection and discrete Gaussian proof exposed. |
| P23 partition | `global_control_partition_final` | Direct assembly. |
| P24 pair pool/cancellation | `sq_sum_eq_sum_sq_add_two_sum_lt`, `blockPrimes_product_load_ge`, `basePieces_forbiddenBudget_final_ineq` | Exact `1/2` pool with no hidden surplus. |
| P25 greedy window | `exists_subset_recip_window_strict_upper` | Exact elementary proof. |
| P26 weights/variance | `R2MassBatchSupply.weights`, `sigmaE2_ge_ctrl`, `r2_extra_inv_sq_le` | Constants `1000001` and `501` recorded; inverse-square arithmetic finite-residual. |
| P27 main arc | `MainArcNumericFields`, `r2_numericFields`, R2 main fields | Nonvanishing/log branch and cubic aggregate exposed. |
| P28 energy majorant | R2 Fourier-energy support | Exact exponent `16/9`. |
| P29 block fibre | `r2_blockFiberTail` | Exact `S_m` intersection and `b`-fibre proof. |
| P30 sibling mismatch | `r2ExtraSiblingChoice` chain | Exact squarefree CRT argument. |
| P31 common reservoir | R2 multi-gadget reservoir, `r2_extra_count_le`, `r2_buildFreqLanes` | Common `G` set, distinct membership, and `b(2N+1)` exposed. |
| P32 terminal positivity | `exists_arcConstruction_final` | `η→C→Dmp→G→k0`, `501`, and `2004` exposed; final maximum finite-residual. |
| P33 headline tuple | `erdos_306_unconditional`, `Erdos306.erdos_306` | Exact finite set/tuple correspondence. |

## Assurance disposition

- Review A passed the analytic bridge with two explicitness repairs; both are incorporated.
- Review B classified the fixed parent as requiring bounded mathematical revision but found no material gap, indispensable unrecorded theorem, circular parameter choice, or material theorem mismatch.
- RB-01-RB-17 are incorporated in the manuscript; RB-18 is reflected in the synchronized ledger and this correspondence file.
- RB-19 remains an unauthorized released-comment cleanup; no Lean file was changed.
- RB-20 records that Review B did not independently rerun kernel/CI.
- The revised candidate awaits a new final fixed-candidate review and is not submission-ready.

## Accurate wording

Accurate:

- The article invokes PNT and proves the local reciprocal-prime law.
- The archived Lean release uses two exact Rosser--Schoenfeld inputs.
- The proof-development checkpoint supplied the human expansions consumed by the revision.
- The frozen refactor is secondary architecture context.
- The public bridge is a finite set to a finite strictly increasing tuple.

Prohibited:

- The released Lean theorem depends on PNT.
- The PNT bridge is already formalized in the release.
- The PDL checkpoint or frozen refactor is released theorem authority.
- Review B independently reran the Lean kernel.
- The revised candidate is peer reviewed, submission-ready, or authorized for arXiv.
- The theorem constructs an infinite sequence.

## Remaining formal and source gates

1. Final extensional and mathematical review of the exact revised candidate tip.
2. Human-visible source comparison for the two released Rosser--Schoenfeld transcriptions.
3. Any PNT formalization or analytic-interface refactor requires a separately authorized workstream.
4. Final companion-code, bibliography, and clean source-package audit before submission.
