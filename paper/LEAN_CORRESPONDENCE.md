# Lean correspondence — structural manuscript, released proof, and frozen architecture

## 0. Three layers that must not be conflated

### A. Released proof authority

`Yuren-Tang/erdos-306:v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

Archived DOI: `10.5281/zenodo.20767390`.

This is the current machine-checked evidence cited by the manuscript. Its exact headline axiom audit is:

```text
[propext,
 Classical.choice,
 Quot.sound,
 RosserSchoenfeld.rosser_schoenfeld_cor3,
 RosserSchoenfeld.rosser_schoenfeld_thm5]
```

### B. Frozen architecture/exposition context

`Yuren-Tang/erdos-306:codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`

This ref reorganizes the development into stable statements, structural analytic inputs, finite spectral selection, global control, construction certificates, and theorem assembly. RV1 found the architecture valuable but did not clear it as a replacement release: its structural analytic axioms, stale aggregate docs, red linter, and unexecuted local verification packet remain explicit boundaries.

### C. Paper-level reconstruction

The manuscript states an abstract theorem from two structural conditions, proves the concrete construction in principle/handoff order, then derives the two conditions from the released Rosser–Schoenfeld backend. This prose is neither a new Lean release nor an assertion that every cleaned module has passed the RV1 local plan.

## 1. Exact headline statement

### Paper form

If `q=a/b>0` is reduced and `b` is squarefree, then `q` is a sum of reciprocals of distinct squarefree semiprimes. Conversely, such a sum has squarefree reduced denominator.

### Released exact declaration

File: `lean/RequestProject/Erdos306FormalConjectures.lean`

```lean
theorem erdos_306 :
    ∀ (q : ℚ), 0 < q → Squarefree q.den →
      ∃ k : ℕ, ∃ (n : Fin (k + 1) → ℕ), n 0 = 1 ∧ StrictMono n ∧
        (∀ i ∈ Finset.Icc 1 (Fin.last k), ω (n i) = 2 ∧ Ω (n i) = 2) ∧
        q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i)
```

The paper's increasing list is the restriction to `Finset.Icc 1 (Fin.last k)`. `n 0 = 1` is a dummy anchor.

### Frozen statement-only declaration

File: `lean/RequestProject/Statement/Erdos306.lean`

```lean
def Erdos306 : Prop :=
  ∀ (q : ℚ), 0 < q → Squarefree q.den →
    ∃ k : ℕ, ∃ (n : Fin (k + 1) → ℕ), n 0 = 1 ∧ StrictMono n ∧
      (∀ i ∈ Finset.Icc 1 (Fin.last k), ω (n i) = 2 ∧ Ω (n i) = 2) ∧
      q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i)
```

This confirms statement stability but does not itself prove the proposition.

## 2. Structural analytic inputs

| Paper object | Released v0.0.3 authority | Frozen architecture counterpart | Correct status |
|---|---|---|---|
| dyadic prime block `P_k` | `GlobalControl.dyadicBlock` imported by `RSPrimeSums.lean` | `GlobalControl.dyadicBlock` / `DyadicPrimeBlock.lean` | exact shared definition |
| condition `D` | theorem `GlobalControl.dyadic_prime_density` derived in `RSPrimeSums.lean` | axiom `pnt_dyadic_prime_density`, exported theorem `dyadic_prime_density` | release theorem; frozen structural interface only |
| condition `M` | theorem `GlobalControl.dyadic_mertens_cumulative` derived in `RSPrimeSums.lean` | axiom `mertens_dyadic_window_mass`, exported theorem `dyadic_mertens_cumulative` | release theorem; frozen structural interface only |
| inclusive block union | release union used by cumulative theorem | `(Finset.Icc k0 (3*k0)).biUnion dyadicBlock` | endpoint must remain inclusive |
| actual interval | `[2^k0,2^(3*k0+1))` | same via `blockPrimes` | paper spelling is exact |
| RS density backend | `RosserSchoenfeld.rosser_schoenfeld_cor3` | no cleared proof replacing the structural axiom | source-transcribed release axiom |
| RS reciprocal backend | `RosserSchoenfeld.rosser_schoenfeld_thm5` | no cleared proof replacing the structural axiom | source-transcribed release axiom |

### Exact released source declarations

```lean
axiom rosser_schoenfeld_cor3 (x : ℝ) (hx : (41 : ℝ) / 2 ≤ x) :
    3 * x / (5 * Real.log x) <
      (Nat.primeCounting ⌊2 * x⌋₊ : ℝ) -
      (Nat.primeCounting ⌊x⌋₊ : ℝ)
```

```lean
axiom rosser_schoenfeld_thm5 :
    ∃ B : ℝ, ∀ x : ℝ,
      (1 < x →
          Real.log (Real.log x) + B - 1 / (2 * (Real.log x) ^ 2)
            < ∑ p ∈ (Finset.Icc 2 ⌊x⌋₊).filter Nat.Prime,
                (1 : ℝ) / (p : ℝ)) ∧
      (286 ≤ x →
          ∑ p ∈ (Finset.Icc 2 ⌊x⌋₊).filter Nat.Prime,
                (1 : ℝ) / (p : ℝ)
            < Real.log (Real.log x) + B + 1 / (2 * (Real.log x) ^ 2))
```

The released proof derives `D` at every `k≥5` and derives `M` with `k1=20`. The paper must never describe the frozen structural axioms as additional axioms of v0.0.3.

## 3. Principle/handoff map

| Manuscript principle or handoff | Released declaration/module evidence | Frozen clean node | Authority note |
|---|---|---|---|
| semiprime and avoiding representation | `IsSemiprime`, `HasEgyptianSemiprimeRepr`, `HasEgyptianSemiprimeReprAvoiding` in `Defs.lean` | core semiprime / representation modules | release exact |
| unit numerator to arbitrary numerator | `reduction_to_unit_numerator_avoiding` | `Core/UnitNumeratorReduction.lean` | release exact; frozen name clarifies boundary |
| finite spectral selection | `Wcount`, `exists_subset_of_Wcount_pos`, `wcount_fourier_identity`, positivity glue | `Spectral/FiniteWeightSelection.lean`, `CircleMethodBridge.lean`, `ArcConstruction.exists_reciprocal_subset` | released proof is authority; frozen ref gives natural principle |
| weighted reciprocal family | R2 concrete data/weights and final assembly | `WeightedReciprocalFamily` | released data repackaged in paper |
| main certificate | release main-term modules | `MainArcCertificate` | same mathematical content, different architecture |
| minor certificate | release block/extra minor assembly | `MinorArcCertificate` | same role, frozen clean interface |
| complete construction | release `ArcConstruction`/R2 final assembly | `ArcConstruction` = family + main + minor | frozen principle/handoff source only |
| construction from squarefree `b≥3` | `exists_arcConstruction_final`, `exists_pos_weighted_ge3_R2` | `exists_arcConstruction` through five certificates | release conclusion remains authority |
| avoiding representation | `egyptian_rep_ge3_R2` | `hasEgyptianSemiprimeReprAvoiding_one_div_of_three_le` | release exact conclusion |

## 4. Control and mass systems

| Paper notation | Released v0.0.3 | Frozen counterpart | Status/use |
|---|---|---|---|
| block system | `BlockSystem` and R2 foundation modules | `GlobalControl.BlockSystem`, `BlockSystemCertificate` | release checked; frozen certificate clarifies scale order |
| block support `B` | release global-control block support | `blockSupport` | exact concept |
| control pairs | release control-pair modules | `ctrlPairs` | exact concept |
| control edges `E_ctrl` | release `ctrlEdges` / `ArcConstruction.lean` | `Construction/ControlEdges.lean` | release checked |
| control energy `Q_ctrl` | release global-control energy | `GlobalControl.Qctrl` | release checked content |
| full energy `Q_E` | release circle-method energy | `quadraticEnergy` | exact paper map |
| `Q_ctrl≤Q_E` | `QE_ge_Qctrl` | `controlEnergy_le_quadraticEnergy` | release authority |
| control deviation `σ_ctrl` | release control variance modules | `sigmaCtrl` | exact concept |
| lower bound on `σ_ctrl` | `sigmaCtrl_ge_strong` in final release assembly | `exists_sigmaCtrl_lower_bound` | release authority; frozen natural interface |
| control reciprocal load small | release construction budgets | `exists_k0_controlLoad_lt` | release composite |
| block-prime mass pool | `BlockMassPool.lean` | `Construction/BlockPrimePool.lean` | same algebraic principle |
| pair identity | release square-sum lemma | `blockPrimes_product_load_ge_of` proof uses `sq_sum_eq_sum_sq_add_twice_sum_lt` | release checked |
| residual candidate pool | release R2 mass pool modules | `blockSupportPairPool`, `residualPairPool` | frozen naming only |
| forbidden-load subtraction | release final mass budget | `residualPairPool_load_lower_of_forbidden_budget` | release composite |
| greedy selector | `exists_subset_recip_window_strict_upper`, `exists_subset_recip_window` | residual-window selector / `exists_massBatchSupply_of_pool` | release checked |
| mass certificate | release R2 mass-batch supply | `MassBatchSupply` | frozen handoff |
| final weight `θ` | `R2ConcreteData.Weights` / `R2Weights.lean` | `ConstructionData.Weights`, `WeightedEdgeCertificate` | release checked |
| total inverse-square load | release final load lemmas | `exists_edge_square_load_bound`, `WeightedEdgeCertificate.hsumE` | release composite |

## 5. Global-control partition map

The manuscript's Section 6 is organized by the frozen node graph because it exposes the actual mathematical dependencies. The formal authority for the published proof remains the release's global-control chain.

| Manuscript node | Frozen exact declaration/file | Released status statement |
|---|---|---|
| cold block has a dominant label and charged exceptions | cold-control, encoding, fiber modules under `GlobalControl` | equivalent mechanism is imported by release global control; paper reconstruction requires review |
| adjacent cold-label mismatch forces energy | boundary/forcing modules | equivalent released mechanism |
| encoded level-set cardinality | `global_levelset` in `GlobalControl/LevelSetAssembly.lean` | frozen exact theorem; release contains the bound used downstream |
| global floor | `globalControlFloor` | paper notation map |
| diagonal sector | `diagSector` | paper notation map |
| off-main localization | `localization_dichotomy` | clean frozen theorem; release equivalent |
| high-floor absorption | `laplace_above_control_floor` | clean frozen theorem; release equivalent |
| diagonal Gaussian bound | `diagonal_sector_gaussian_bound` | clean frozen theorem; release equivalent |
| final partition | `global_control_partition` | clean frozen theorem; release equivalent global-control input |

The quantifier order in the manuscript follows the clean theorem: after `c` and `η`, choose `k0min` and `Ctail`; then the theorem is uniform in admissible block systems and `C≥1`. The stale “free later `Cglob`” wording identified by the refactor is not used.

## 6. Main-arc map

| Paper object | Released exact evidence | Frozen counterpart | Status |
|---|---|---|---|
| variance `σ_E²` | `sigmaE2` | same | release checked |
| variance lower/upper comparison | `sigmaE2_ge_ctrl` and final R2 bounds | `main_arc_variance_comparison` | release authority |
| window `N≈C/σ_ctrl` | release final parameter assembly | `MainArcWindowCertificate.N` | release composite |
| `2N<2^(2k0)`, `2N+1≤L` | release final scale closure | `main_arc_window_scale_period` | paper reconstruction |
| Bernoulli log expansion | `bernoulli_log_taylor`, `sum_logphi_bound` | `BernoulliLogExpansion.lean` | release checked |
| labelled term | `term_label`, `term_label_eq` | main-arc fields/periodicity | release checked |
| per-label real lower bound | `term_label_re_lower` | `MainArcLowerBound` | release checked |
| Gaussian main sum | `main_re_lower`, `main_sum_re_lower` | `main_sum_re_lower` | release checked |
| zero imaginary part | `term_label_conj`, `term_label_sum_im_zero`, `main_sum_im_zero` | main-arc periodicity | release checked |

## 7. Block-minor map

| Paper step | Released evidence | Frozen exact declaration | Status |
|---|---|---|---|
| Fourier norm `≤exp(-(16/9)Q_E)` | release minor-factor estimate | `fourierNormWeight_le_exp_QE` | release checked |
| frequency assignment | `freqAssignmentOf` | same conceptual map | release checked |
| minor split | release main-arc classification | `mainArcClassificationData`, `blockMinorPart`, `extraMinorPart` | release checked conclusion |
| fiber cardinality `≤b` | release bounded multiplicity theorem | `blockSupport_frequency_fiber_card_le` | release checked |
| extra energy `Q_E-Q_ctrl≥0` | release `Q_E≥Q_ctrl` | `blockMinorFiberTailData.Qextra` | exact algebra |
| fiber-tail reindex | release `minor_arc_bound_mult` / block lane | `minor_energy_sum_le_fiber_tail`, `block_part_bound` | release authority; frozen natural handoff |
| block budget | release final block-minor estimate | `blockMinorFrequencyLane` | release checked conclusion |

The exact paper loss is the real factor `b`, arising from `L=b·∏blockSupport`. It is not hidden as an unspecified bounded multiplicity.

## 8. Extra-minor / reservoir map

| Paper step | Released evidence | Frozen exact declaration | Status |
|---|---|---|---|
| prime divisors cover `b` | `CoversPrimeDivisors` | same | release checked |
| block support coprime to `b` | `BlockSupportCoprimeWith` | same | release checked |
| prime-divisor congruences imply mod-`b` congruence | `modEq_of_modEq_primeDivisors` | same | release checked; squarefree essential |
| find mismatch `r|b` | `exists_R_mismatch_of_block_eq_not_global` | same | release checked |
| choose mismatch sibling | release choice package | `ExtraSiblingChoice` | release checked content |
| number of extra frequencies | `extra_sibling_card_le_pred_b`, `r2_extra_count_le` | `extraMinor_card_le`, `extraMinorCountBound` | release checked |
| label gap `2|m|<s` | release scale closure | `extraMinorLabelGap` | release composite |
| one-edge residue damping | release Bernoulli offset lemma | `bernoulliCharFun_norm_le_of_residue_offset` | release checked |
| `G`-edge product damping | release multi-gadget bound | `fourierNormWeight_le_multi_gadget_damp` | release checked |
| aggregate reservoir | release R2 reservoir | `MultiGadgetReservoir`, `PreparedExtraReservoir` | frozen handoff only |
| worst-case damping via `r≤b` | release final gadget lane | `gadgetDampingBound` | release checked conclusion |

## 9. Terminal parameter and certificate chain

The manuscript's order of choices corresponds to the frozen `ConstructionParameters`, but the released R2 assembly remains the checked evidence.

| Manuscript choice | Frozen exact field/construction | Meaning |
|---|---|---|
| main constant `c3` | `hc3eq` | Bernoulli Gaussian lower constant |
| square-load constant | `Sload` | upper bridge for `σ_E` |
| variance bridge | `K`, `hKS` | `Sload≤4K²` |
| block tolerance | `η=c3/(4Kb)` | private equal-quarter allocation |
| global tail constant | `Ctail` from `global_control_partition` | fixed before choosing `C` |
| main cutoff | `C=max C0 3` | makes Gaussian tail a quarter |
| reservoir base | `base_b=sqrt(1-(8/9)/b²)` | worst per-edge damping |
| pointwise budget | `Dmp=c3/(4Kb(2C+3))` | extra-lane target |
| reservoir size | `G` with `base_b^G≤Dmp` | chosen before scale |
| scale thresholds | `k0minM`, `k0density`, `k0ctrl`, `k1`, `k0mass`, `k0sigma`, `k0window`, `k0cubic`, `k0load`, `ceil C` | all dominated by final `k0` |
| terminal inequality | `ConstructionParameters.hbudget` | block + diagonal tail + extra lane beats `c3/K` |
| foundation | `ConstructionFoundation` | parameters joined with a block system |
| complete certificate chain | `Foundation → GadgetEdges → WeightedEdges → MainArcWindow → MinorArcEstimate → Assembly` | natural construction graph |

The manuscript does not claim that this frozen certificate chain has replaced the v0.0.3 release. It uses the chain to expose the mathematical order already checked, in older topology, by the release.

## 10. Final theorem map

| Paper endpoint | Released v0.0.3 | Frozen counterpart | Status |
|---|---|---|---|
| structural conditions produce avoiding `1/b`, `b≥3` | release chain from RS-derived supply to `egyptian_rep_ge3_R2` | `exists_arcConstruction` then `hasEgyptianSemiprimeReprAvoiding_one_div_of_three_le` | release checked conclusion; paper abstract theorem |
| all squarefree denominators | `circle_method_positivity_R2` | `hasEgyptianSemiprimeReprAvoiding_one_div` | release checked |
| arbitrary numerator | `reduction_to_unit_numerator_avoiding` | `hasEgyptianSemiprimeRepr_div_of_squarefree` | release checked |
| finite-set theorem | `erdos_306_unconditional` | semiprime representation theorem | release checked |
| benchmark theorem | `erdos_306` | statement `Erdos306` plus theorem assembly in cleaned graph | release checked only at v0.0.3 |

## 11. Required wording controls

1. Say “the released proof derives the structural conditions from Rosser–Schoenfeld,” not “the release assumes PNT and Mertens.”
2. Say “the frozen refactor states structural interfaces,” not “the DOI release has those structural axioms.”
3. Keep the reciprocal window inclusive through block `3*k0`, hence upper endpoint `2^(3*k0+1)`.
4. Keep `b` as the exact block-frequency fiber multiplicity.
5. State squarefreeness both as the necessary denominator condition and as the CRT prime-divisor lift in the extra lane.
6. Do not call the frozen refactor release-cleared until the RV1 local verification plan is actually executed and a new release is authorized.
7. Do not mutate the DOI, tag, or release ref in response to manuscript changes.
