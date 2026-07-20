# Erdős 306 — Review B claim trace

Fixed candidate: `f04a7ac7064877920890b282c246ffe6867f58bb`  
Release authority: `4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
Secondary decomposition source: `e55ef359a8b98525f0bac6c7a510fcad94469bff`

Status vocabulary:

- **VERIFIED**: the implication was independently reconstructed and is supplied by active release declarations.
- **ACCEPTED-A**: analytic supply layer accepted from Review A; checked here only at the downstream interface.
- **REVISION**: mathematics is available and reconstructible, but the candidate needs bounded human-proof or translation repair.
- **DOC**: documentation/status correction only.

## Arithmetic and analytic interface

| ID | Exact claim and hypotheses | Candidate treatment | Active formal evidence / actual consumer | Review result |
|---|---|---|---|---|
| P0 | `IsSemiprime n` means `n=pq` for distinct primes; such an `n` is squarefree and has `omega n = Omega n = 2`. | Definition and equivalence stated. | `Defs.IsSemiprime`; `IsSemiprime.squarefree`; `Erdos306.isSemiprime_omega_Omega`. | **VERIFIED / REVISION**: consumed direction is exact. Add a one-line converse factorisation argument if “equivalently” is retained as a biconditional. `TRANSLATION-FIDELITY`. |
| P1 | A finite reciprocal sum of positive squarefree integers has squarefree reduced denominator. | LCM argument. | `Defs.necessity_squarefree_denom`. | **VERIFIED**. |
| P2 | If every finite obstruction set admits an avoiding representation of `1/b`, then every numerator `a` admits a representation of `a/b`, using pairwise fresh denominators. | Induction outlined and proved. | `MainTheorem.reduction_to_unit_numerator_avoiding`; consumed by `erdos_306_unconditional`. | **VERIFIED**. |
| P3 | `b=2` and `b=1` reduce to targets with denominators at least `3`, while preserving avoidance and disjointness. | Uses `1/2=1/3+1/6` and `1=1/2+1/3+1/6`. | `egyptian_rep_eq2_R2`, `exists_semiprime_egyptian_one_R2`, `circle_method_positivity_R2`. | **VERIFIED**. Clarify that `1/3`, `1/6`, etc. are target rationals represented by new semiprimes, not admissible denominators themselves. |
| P4–P7 | PNT, partial summation, local reciprocal-prime law, and `A_k=1/k+o(1/k)`. | Full paper layer. | No released PNT declaration; intentionally separate from release. | **ACCEPTED-A**; not reopened. |
| P8 | For all sufficiently large `k`, the dyadic block contains at least the required number of primes. | Derived from local law. | Release consumers use the dyadic density consequence ultimately derived from `rosser_schoenfeld_cor3`; `BlockSystem.hdensity`; `exists_block_primes`. | **ACCEPTED-A / VERIFIED interface**. |
| P9 | For all sufficiently large `k0`, the inclusive blocks `k0,...,3k0` have reciprocal-prime mass at least `21/20`. | Derived from local law; endpoint `[2^k0,2^(3k0+1))`. | `blockPrimes_product_load_ge` and its mass-pool consumers; release backend ultimately uses `rosser_schoenfeld_thm5`. | **ACCEPTED-A / VERIFIED interface**. |
| P10 | The construction needs only eventual supply statements because all constants are fixed before `k0`. | Asserted in supply and terminal sections. | `exists_arcConstruction_final` chooses `eta,C,G` and all thresholds before `exists_r2_foundation_dyadic`. | **VERIFIED**. |

## Finite Fourier selection

| ID | Exact claim and hypotheses | Candidate treatment | Active formal evidence / actual consumer | Review result |
|---|---|---|---|---|
| P11 | Eventual supplies imply an avoiding representation of `1/b` for squarefree `b>=3`. | Structural construction theorem, with compressed subproofs. | `exists_arcConstruction_final` -> `exists_pos_weighted_ge3_R2` -> `egyptian_rep_ge3_R2`. | **VERIFIED theorem / REVISION exposition**. This is the aggregate claim whose internal repairs are P16–P32. |
| P12 | If `b|L`, every `e|L`, all are positive, and `sum_E L/e < L`, then the Bernoulli subset count satisfies the stated finite Fourier identity. | Formula and expansion given. | `fourier_orthogonality`, `fourier_indicator`, `charterm_expand`, `wcount_fourier_identity`. | **VERIFIED**. Character signs and coefficients match. |
| P13 | If the main Fourier sum is real positive and exceeds the norm of the minor sum, then the weighted count is positive. | Elementary lemma. | `positivity_from_arcs`; consumed in `exists_pos_weighted_of_construction`. | **VERIFIED**. |
| P14 | The modular subset condition implies exact reciprocal equality when the total load is below one. | Stated. | `fourier_indicator` requires the exact integer inequality `sum L/e < L`; construction supplies `recipLoad E < 3/b <= 1`. | **VERIFIED**. Add precise hypotheses locally. |

## Control system and global control

| ID | Exact claim and hypotheses | Candidate treatment | Active formal evidence / actual consumer | Review result |
|---|---|---|---|---|
| P15 | The control graph consists of internal block pairs and adjacent bipartite pairs; centred CRT representatives define `Qctrl`; a globally constant sufficiently small integer label gives `Qctrl=m^2 sigmaCtrl^2`. | Defines the energy schematically and states the diagonal identity. | `GlobalControl.ctrlPairs`, `Qctrl`, `energy_splits`; `GlobalControlG6.crtRepr_eq_label_of_small`, `diagonal_Qctrl`; consumed by `g6_localization` and G7. | **VERIFIED / REVISION**: exact graph, centred representative convention, and smallness range must be written. `HUMAN-EXPOSITION-GAP`. |
| P16 | Control reciprocal load is eventually small, while `sigmaCtrl` has the lower scale needed later; all dependencies are uniform over the terminal block range. | Attributes small load mainly to quadratic denominator growth and states scale comparisons. | `R2BaseLoadUpper.block_recip_sum_le_four_div`, `ctrl_recipLoad_le_tail` (`<=512/(k0-1)`), `dyadic_control_recipLoad_eventually_small`; terminal `sigmaCtrl_ge_strong` consumer in `R2TopAssembly`; exact identity `sum_inv_sq_ctrlEdges_eq_sigmaCtrl_sq`. | **REVISION**. Quadratic size alone is insufficient because edge multiplicity grows. Supply the dyadic reciprocal-prime upper bound and tail summation, and separate it from the `sigmaCtrl` lower bound. `TRANSLATION-FIDELITY`, `HUMAN-EXPOSITION-GAP`. |
| P17 | A cold block has a dominant integer residue label after deleting a controlled exceptional set; dominance, uniqueness, label size, and exception charge hold under quantitative density/cardinality and energy hypotheses. | Gives mechanism-level prose and an unquantified lemma. | Release G5 consumers `cold_master`, `cold_count_large`; exception charging through the cold-dominance data. Secondary exact local statement `LocalEnergy.cold_residue_unique_of_card_sq`: window, cardinality, `kappa`, energy, and external-prime hypotheses are explicit. | **REVISION**. State exact thresholds, exceptional-set bound, wrapped-label alternative, and uniqueness hypotheses. `TRANSLATION-FIDELITY`, `HUMAN-EXPOSITION-GAP`, `ALTERNATIVE-HUMAN-PROOF-REVIEW`. |
| P18 | If adjacent cold blocks have different dominant labels, their bipartite energy pays a boundary floor after accounting for exceptional vertices. | States an unqualified distinct-label penalty and says exceptions were already paid. | `GlobalControl.mismatch_penalty_with_exceptions` requires explicit `Ek,Ek1`, residue agreement off them, cardinality lower bounds, label-size constraints, and distinct labels; consumed by `boundary_penalty_per_k`/`cold_master`. | **REVISION**. The manuscript theorem is too strong without the omitted hypotheses. Replace it by the exception-aware theorem and its deduction of the displayed floor. `TRANSLATION-FIDELITY`. |
| P19 | For fixed `0<eps<1`, low-energy global assignments satisfy `# {Qctrl<=R} <= exp(A nblocks) exp(8 eps R)(1+sqrt(R)/sigmaCtrl)` after a sufficiently large bottom scale. | Short coding/entropy synopsis. | `GlobalControl.global_levelset_final`; proof uses `cold_master`, admissible-label bounds, wrapped/huge-label estimates, injective reconstruction, and `hrhs_final`. | **REVISION**. Correct statement, insufficient proof. Expose the coding variables, exception/hot/boundary charges, large-label treatment, and fixed-`A` quantifier order. `HUMAN-EXPOSITION-GAP`, `ALTERNATIVE-HUMAN-PROOF-REVIEW`. |
| P20 | An assignment outside `mainArc(C)` either has `Qctrl` above the global forcing floor or is globally diagonal with an exact large label. | Claimed with a brief propagation argument. | `GlobalControl.globalControlFloor`, `diagSector`, `Rw_mono`, `Rw_le_Pifloor`, CRT small-label lemmas, and `g6_localization`. | **REVISION**. State the floor, monotonicity, elimination of exceptions, propagation of labels, CRT size condition, and exact energy identity. `HUMAN-EXPOSITION-GAP`. |
| P21 | The Laplace mass above the forcing floor is at most `eta/sigmaCtrl` once `k0` is large. | Shell-summation sentence. | `global_levelset_finset_bound`; `sectorI_absorption'`; consumed by `global_control_partition_final`. | **REVISION**. Give the dyadic/integer shell sum, the exponent inequality `8 eps0<c`, and absorption of `A*numBlocks` by the growing floor. `HUMAN-EXPOSITION-GAP`. |
| P22 | The exact diagonal sector outside `|m|<=C/sigmaCtrl` has Gaussian mass `<=Ctail exp(-cC^2/2)/sigmaCtrl`. | Standard Gaussian-tail assertion. | `sectorII_gaussian`; injectivity of the common-label map and exact substitution `Qctrl=m^2 sigmaCtrl^2`. | **REVISION**. Supply the label injection and elementary integer-Gaussian tail estimate, including the small-`sigmaCtrl` threshold. `HUMAN-EXPOSITION-GAP`. |
| P23 | Combining P20–P22 gives the global partition, uniformly for admissible block systems. | Assembled theorem. | `global_control_partition_final`, whose exact quantifier order fixes `A` before `k0min`. | **VERIFIED theorem / REVISION proof**. The paper's `PAPER-ASSEMBLED` status overstates the displayed human derivation. |

## Mass, weights, and main arc

| ID | Exact claim and hypotheses | Candidate treatment | Active formal evidence / actual consumer | Review result |
|---|---|---|---|---|
| P24 | For block primes, off-diagonal pair load is `(S1^2-S2)/2` and eventually at least `1/2`. | Algebra plus tail estimate. | `sq_sum_eq_sum_sq_add_two_sum_lt`, `blockPrimes_sub_sq_tail`, `blockPrimes_product_load_ge_of`, `blockPrimes_product_load_ge`. | **VERIFIED**. |
| P25 | From a finite positive reciprocal pool of total load at least `target`, with each term below `gap`, a subset has load in `[target,target+gap)`. | Greedy/minimal subset proof. | `exists_subset_recip_window_strict_upper`. | **VERIFIED**. |
| P26 | The residual batch yields `3/(2b)<=Lambda<3/b`, uniform weight `theta=1/(bLambda)` in `[1/3,2/3]`, exact mass `1/b`, and `sqrt(sigmaE2)` comparable to `sigmaCtrl`. | Load and weight algebra shown; variance comparison largely asserted. | `R2MassBatchSupply.weights`; `sigmaE2_ge_ctrl`; `r2_extra_inv_sq_le`; terminal `hsumE`, `hsigmaE2_le`, `hsigmaE_ub`, `hsigmaE_lb` in `R2TopAssembly`. | **VERIFIED / REVISION**. Add the componentwise inverse-square proof and constants `1000001`, `501` (or justified replacements). `HUMAN-EXPOSITION-GAP`. |
| P27 | On the label main arc, nonzero Bernoulli factors admit a logarithmic Taylor expansion; the mass identity cancels the linear phase; cubic error is small; the symmetric label sum is real and at least `c3/sqrt(sigmaE2)`. | Correct conceptual derivation, omitting several analytic side conditions. | `bernoulliCharFun_ne_zero_main`, `sum_logphi_bound`, `term_label_eq`, `term_label_re_lower`, `main_re_lower`, `main_sum_re_lower`, `main_sum_im_zero`. Exact hypotheses include `|m/e|<=1/10` and total cubic error `<=1/10`. | **REVISION**. Restore nonvanishing/log-branch and smallness hypotheses and the finite Gaussian-window proof. `TRANSLATION-FIDELITY`, `HUMAN-EXPOSITION-GAP`. |
| P28 | Each Fourier factor is bounded by an exponential in the edge energy, giving `|mu_hat(h)|<=exp(-(16/9)QE(h))`. | Elementary trigonometric inequality. | Active pointwise-energy declarations in `CircleMethodArcs` and their consumers in `R2BlockMinorLane`/minor-ready assembly. | **VERIFIED**. The constant is used consistently in the terminal Gaussian exponent. |

## Minor arcs, reservoir, and terminal closure

| ID | Exact claim and hypotheses | Candidate treatment | Active formal evidence / actual consumer | Review result |
|---|---|---|---|---|
| P29 | Among Fourier minor frequencies, the block lane is `Sm` intersected with assignments outside `mainArc(C)`; for a fixed block assignment the fibre in `[0,L)` has cardinality at most `b` because `L=bP`. | Says the block-minor sector is `a(h) notin M(C)` and calls the map `b`-to-one. | `mainArcBlockSet`, `mainArcClassificationData`; `r2_blockFiberTail` with `K=b`, `Qextra=QE-Qctrl`; `mainArc_fiber_card_le`. | **REVISION**. Explicitly intersect with `Sm` and prove the fibre bound from the exact period and coprimality. `TRANSLATION-FIDELITY`, `HUMAN-EXPOSITION-GAP`. |
| P30 | A Fourier-minor frequency whose block assignment is globally constant has a mismatch modulo at least one prime divisor `r|b`, using squarefreeness of `b`. | Gives the CRT idea. | `R2MainArcClassification.intFrequencyLabelData_of_mainArcClassification`; integer sibling choice declarations in `R2ExtraFrequencyChoiceInt`; consumed by `r2_buildFreqLanes`. | **VERIFIED / REVISION**. State the congruence-to-`L` contradiction and the role of squarefreeness explicitly. |
| P31 | For each extra-lane frequency choose a mismatch prime and `G` high-block siblings; `2|m|<s` gives per-edge damping `sqrt(1-(8/9)/r^2)`, and the finite reservoir budget beats the extra sector. | Correct idea; availability and record fields compressed. | `R2MultiGadgetReservoir`; `multiGadgetBoundData_of_reservoir`; `preparedChoice_of_pointwise_budget`; `r2MultiGadgetReservoir_of_pointwise_budget`; `r2_extra_count_le`; `r2_buildFreqLanes`; `exists_r2_minorReady_from_multiGadget_lanes`. | **REVISION**. Exhibit `rfun,Gset,mfun`, edge membership, congruences, small-label bound, cardinality bound, and pointwise-to-sum budget. `HUMAN-EXPOSITION-GAP`. |
| P32 | Choose constants first and `k0` last so that the main lower bound strictly exceeds the block and extra minor budgets. | Parameter order stated; final inequalities compressed. | `r2_exists_C`, `r2_exists_pow_le`, `r2_exists_k0_density`, `r2_close_budget_501`, `exists_arcConstruction_final`. Exact choices: `eta=c3/(2004b)`, `Dmp=c3/(2004b(2C+3))`, `sqrt(sigmaE2)<=501 sigmaCtrl`, and three quarter-budgets. | **VERIFIED / REVISION**. Add the dependency table and the three explicit inequalities. No circularity found. `HUMAN-EXPOSITION-GAP`. |
| P33 | Every positive rational with squarefree reduced denominator has the required finite distinct-semiprime representation; the converse follows from squarefreeness. | Headline theorem assembled. | `erdos_306_unconditional`; `Erdos306.erdos_306`; `necessity_squarefree_denom`. | **VERIFIED**. Add the finite-set ordering bridge in the paper. The formal theorem is a finite tuple, not an infinite sequence. |

## Exact final formal chain

The controlling release closes the downstream implication through the following active chain:

1. `CircleMethod.exists_arcConstruction_final` constructs `ArcConstruction T b` for squarefree `b>=3`.
2. `CircleMethod.exists_pos_weighted_ge3_R2` applies the main/minor arc assembly and obtains `Wcount>0`.
3. `CircleMethod.egyptian_rep_ge3_R2` applies `Wcount_pos_imp_repr`.
4. `circle_method_positivity_R2` adds `b=1,2`.
5. `fourier_positivity_unconditional_R2` exposes the avoiding unit theorem.
6. `erdos_306_unconditional` applies the disjoint numerator induction.
7. `Erdos306.erdos_306` orders the finite set, prepends `1`, proves strict monotonicity, and translates `IsSemiprime` to `omega=Omega=2`.

`Audit.lean` identifies the public theorem and the intended exact axiom audit. No structural axiom from the secondary `pushlinter` source was used as authority in this trace.