# Proof ledger — Erdős 306 major-revision manuscript

## 0. Authority, scope, and status classes

- **Immutable released proof authority:** `Yuren-Tang/erdos-306:v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`
- **Archived proof DOI:** `10.5281/zenodo.20767390`
- **Manuscript branch:** `Yuren-Tang/erdos-306:paper/arxiv-v1`
- **Major-revision control tip:** `b94b9f7535f671caeb3abe430b70838dd1457441`
- **Accepted remote review packet:** `review/e306-rv1-v1@15ff9ac024efce3f2d5d6482dea168dc32e31d50`
- **Frozen architecture/exposition context only:** `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`

Status classes used below:

- **RELEASE-CHECKED:** an exact declaration is present at v0.0.3 and kernel checked in that environment.
- **SOURCE-TRANSCRIBED:** an external mathematical statement is an axiom in v0.0.3, with its source location recorded.
- **PAPER-PROVED:** the manuscript contains the mathematical statement and argument; the prose is not itself a Lean term.
- **RELEASE-COMPOSITE:** the released declaration graph checks the result, while the manuscript reorganizes several released modules into a principle/handoff theorem.
- **FROZEN-CONTEXT:** the cleaned refactor supplies a clearer object, theorem name, or dependency boundary, but is not released formal authority.
- **REVIEW-GATED:** independent mathematical review, source comparison, or Director disposition remains outstanding.

The released headline audit is exactly:

1. `propext`;
2. `Classical.choice`;
3. `Quot.sound`;
4. `RosserSchoenfeld.rosser_schoenfeld_cor3`;
5. `RosserSchoenfeld.rosser_schoenfeld_thm5`.

No structural PNT axiom, asymptotic Mertens axiom, SBEE axiom, or construction-local prime-distribution axiom occurs in the released audit.

## 1. Statement and arithmetic closure

### P0. Squarefree semiprimes

- **Statement:** `n` is a squarefree semiprime iff `n = p q` for distinct primes `p < q`; then `n > 1`, `Squarefree n`, and `ω(n)=Ω(n)=2`.
- **Manuscript:** Sections 1, 12.
- **Release evidence:** `IsSemiprime`, `IsSemiprime.pos`, `IsSemiprime.squarefree`; `isSemiprime_omega_Omega`, `isSemiprime_one_lt`.
- **Release modules:** `Defs.lean`, `Erdos306FormalConjectures.lean`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.
- **External input:** none.
- **Blocker:** none.

### P1. Necessity of a squarefree reduced denominator

- **Statement:** a finite sum of reciprocals of squarefree integers has squarefree reduced denominator.
- **Manuscript:** Section 1.
- **Release evidence:** `necessity_squarefree_denom` in `Defs.lean`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.
- **Dependencies:** common denominator divides a squarefree lcm/product.
- **Blocker:** none.

### P2. Avoiding unit-numerator reduction

- **Statement:** avoiding representations of `1/b` for every finite obstruction set imply avoiding representations of `a/b` for every positive numerator.
- **Manuscript:** Lemma 2.1.
- **Release evidence:** `reduction_to_unit_numerator_avoiding` and the unit-numerator interfaces in `MainTheorem.lean` / final modules.
- **Frozen context:** `Core/UnitNumeratorReduction.lean`; `hasEgyptianSemiprimeRepr_div_of_squarefree`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED; FROZEN-CONTEXT map only.
- **Blocker:** none.

### P3. Denominators `b=2` and `b=1`

- **Statement:** use `1/2=1/3+1/6` and `1=1/2+1/3+1/6`, choosing component representations successively with enlarged obstruction sets.
- **Manuscript:** Lemma 2.2.
- **Release evidence:** `egyptian_rep_b2_R2`, `egyptian_rep_b1_R2`, `circle_method_positivity_R2`.
- **Frozen context:** `hasEgyptianSemiprimeReprAvoiding_one_div_two`, `exists_semiprime_reciprocal_sum_one_avoiding`, `hasEgyptianSemiprimeReprAvoiding_one_div`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.
- **Blocker:** none.

### P4. Exact benchmark theorem

- **Statement:** the `Fin (k+1)` increasing-sequence formulation of Erdős 306, with dummy anchor `n 0 = 1` and `ω=Ω=2` on the remaining interval.
- **Manuscript:** Section 12.
- **Release evidence:** `erdos_306` in `Erdos306FormalConjectures.lean`.
- **Frozen context:** definition `Erdos306` in `Statement/Erdos306.lean` is statement-only and not authority for the release proof.
- **Status:** RELEASE-CHECKED.
- **Blocker:** none for the formal statement; author must approve final public wording.

## 2. Structural analytic supply

### P5. Structural dyadic density condition `D`

- **Statement:** for every `k ≥ 5`, the prime block `[2^k,2^(k+1))` has cardinality at least `2^k/(2 log(2^k))`.
- **Manuscript:** Definition 3.1.
- **Release evidence:** theorem `GlobalControl.dyadic_prime_density` derived in `RSPrimeSums.lean`.
- **Frozen context:** axiom/interface `pnt_dyadic_prime_density`; exported theorem `dyadic_prime_density` in `GlobalControl/AnalyticInputs.lean`.
- **Status:** RELEASE-CHECKED as a theorem from P7; FROZEN-CONTEXT as an abstract interface.
- **Role:** cardinality supply for control blocks, high reservoir primes, and finite block selection.
- **Blocker:** none mathematically; terminology must not suggest an additional release axiom.

### P6. Structural reciprocal-window condition `M`

- **Statement:** eventually the inclusive union of dyadic blocks `k0,…,3k0` has reciprocal-prime mass at least `21/20`; the actual interval is `[2^k0,2^(3k0+1))`.
- **Manuscript:** Definition 3.2.
- **Release evidence:** theorem `GlobalControl.dyadic_mertens_cumulative` in `RSPrimeSums.lean`, with explicit witness `k1=20`.
- **Frozen context:** axiom/interface `mertens_dyadic_window_mass`; exported theorem `dyadic_mertens_cumulative` in `GlobalControl/AnalyticInputs.lean`.
- **Status:** RELEASE-CHECKED as a theorem from P8; FROZEN-CONTEXT as an abstract interface.
- **Role:** reciprocal-mass supply only; not used in global-control cardinality or reservoir population.
- **Blocker:** none mathematically; preserve inclusive endpoint wording.

### P7. Rosser–Schoenfeld dyadic-prime backend

- **Statement:** for `x ≥ 41/2`, `3x/(5 log x) < π(⌊2x⌋)-π(⌊x⌋)`.
- **Manuscript:** Proposition 11.1 and its derivation of P5.
- **Release declaration:** `RosserSchoenfeld.rosser_schoenfeld_cor3`.
- **Source:** Rosser–Schoenfeld (1962), Corollary 3, equation (3.8), p. 69, DOI `10.1215/ijm/1255631807`.
- **Status:** SOURCE-TRANSCRIBED; downstream derivation RELEASE-CHECKED.
- **Review gate:** final visual comparison against the publisher scan remains required.

### P8. Rosser–Schoenfeld reciprocal-prime backend

- **Statement:** one constant `B` gives the lower bound for `x>1` and upper bound for `x≥286`, each with error `1/(2 log²x)`.
- **Manuscript:** Proposition 11.2 and its derivation of P6.
- **Release declaration:** `RosserSchoenfeld.rosser_schoenfeld_thm5`.
- **Source:** Rosser–Schoenfeld (1962), Theorem 5, equations (3.17)–(3.18), p. 70.
- **Status:** SOURCE-TRANSCRIBED; endpoint subtraction RELEASE-CHECKED.
- **Review gate:** same publisher-scan comparison.

### P9. Separation of analytic roles

- **Statement:** P5 supplies block cardinalities; P6 supplies reciprocal mass. Neither is silently substituted for the other.
- **Manuscript:** Section 3 and Section 7.
- **Release evidence:** follows from the uses of `dyadic_prime_density` and `dyadic_mertens_cumulative` across `RSPrimeSums.lean`, `BlockMassPool.lean`, `R2TopAssembly.lean`.
- **Frozen context:** explicit module boundary `GlobalControl/AnalyticInputs.lean` and `Construction/BlockPrimePool.lean`.
- **Status:** PAPER-PROVED dependency audit; RELEASE-COMPOSITE.
- **Review gate:** verify every manuscript invocation against this division.

## 3. Abstract spectral selection

### P10. Weighted reciprocal family and no-wrap

- **Statement:** finite semiprime set `E`, weights in `[1/3,2/3]`, common period `L`, exact expected reciprocal mass `1/b`, and total unweighted load `<1`.
- **Manuscript:** Sections 4 and 7.
- **Release evidence:** `R2ConcreteData`, `R2ConcreteData.Weights`, period/divisibility/load fields, and assembly in `R2TopAssembly.lean`.
- **Frozen context:** `WeightedReciprocalFamily` in `CircleMethod/ArcConstruction.lean`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED; FROZEN-CONTEXT naming only.
- **Blocker:** none.

### P11. Finite Fourier identity

- **Statement:** finite cyclic orthogonality expresses `L` times the weighted admissible-subset count as the Fourier sum of Bernoulli factors.
- **Manuscript:** equation (4.1).
- **Release evidence:** `fourier_indicator`, `charterm_expand`, `wcount_fourier_identity` in `CircleMethod.lean`.
- **Frozen context:** Bernoulli cyclic Fourier and `Spectral/CircleMethodBridge.lean`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.
- **Blocker:** none.

### P12. Spectral gap implies exact reciprocal subset

- **Statement:** if the real main sum strictly exceeds the minor norm sum and its imaginary part vanishes, then the weighted count is positive and a subset has exact reciprocal sum `1/b`.
- **Manuscript:** Lemma 4.1.
- **Release evidence:** `exists_subset_of_Wcount_pos`, `positivity_from_arcs`, `exists_pos_weighted_of_construction`, and related release glue.
- **Frozen context:** `exists_subset_sum_eq_of_fourier_gap`; `ArcConstruction.exists_reciprocal_subset`; `ArcConstruction.hasEgyptianSemiprimeReprAvoiding`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED; FROZEN-CONTEXT refactoring only.
- **Blocker:** none.

## 4. Control geometry and global partition

### P13. Dyadic block system and control semiprimes

- **Statement:** select prime blocks, internal/adjacent control pairs, distinct semiprime products, and a common block support above `b` and `T`.
- **Manuscript:** Section 5.
- **Release evidence:** `BlockSystem`, `ctrlPairs`, `ctrlEdges`, `ctrlEdges_semiprime`, `ctrlPairs_prod_injOn`, foundation fields in `R2TopAssembly.lean`.
- **Frozen context:** `GlobalControl/BlockSystem*`, `Construction/ControlEdges.lean`, `Construction/BlockSystemSelection.lean`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED at the interface level.
- **Input:** P5 only.
- **Review gate:** independent review of the exact control-pair coverage convention.

### P14. Control energy and variance

- **Statement:** a frequency induces a residue assignment; control CRT energy is bounded by the full quadratic energy; `σ_ctrl` has an eventual lower bound and control reciprocal load is small.
- **Manuscript:** equations (5.1)–(5.4).
- **Release evidence:** `QE_ge_Qctrl`, `sigmaE2_ge_ctrl`, `sigmaCtrl_ge_strong`, load bounds in release construction.
- **Frozen context:** `Qctrl`, `sigmaCtrl`, `controlEnergy_le_quadraticEnergy`, `exists_sigmaCtrl_lower_bound`, `exists_k0_controlLoad_lt`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED reconstruction.
- **Blocker:** independent line-by-line audit of constants.

### P15. Cold-block decoding

- **Statement:** below a local energy threshold, one dominant integer label explains all but an energy-charged exceptional set of residues.
- **Manuscript:** Lemma 6.2.
- **Release evidence:** corresponding results are distributed through the released global-control and R2 construction chain.
- **Frozen context:** `GlobalControl/Cold*`, `Encoding/*`, `Local*`, `ColdFiberCounting.lean`.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED at the mechanism level; FROZEN-CONTEXT supplies the clean theorem graph.
- **Review gate:** high-priority independent review; manuscript proof should be compared with the exact release declarations.

### P16. Boundary mismatch penalty

- **Statement:** distinct labels on adjacent cold blocks force a quantitative boundary energy floor.
- **Manuscript:** Lemma 6.3.
- **Release evidence:** distributed global-control interface used by the released partition.
- **Frozen context:** `BoundaryPenalty.lean`, `ForcingFloorComparison.lean`, `Localization.lean`.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED mechanism; REVIEW-GATED.

### P17. Global level-set cardinality

- **Statement:** `#{a:Qctrl(a)≤R} ≤ exp(A·numBlocks) exp(8εR)(1+√R/σ_ctrl)`.
- **Manuscript:** Lemma 6.4.
- **Release evidence:** the released proof contains the global-control estimate consumed by the R2 block minor.
- **Frozen context:** exact theorem `global_levelset` in `GlobalControl/LevelSetAssembly.lean`.
- **Mechanism:** encode by hot blocks, boundary set, shells, cold-segment labels, and bounded fibers; aggregate energy charges.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED architecture; REVIEW-GATED.

### P18. Localization dichotomy

- **Statement:** an off-main assignment either lies above the global energy floor or is globally diagonal with label outside the main window and exact energy `m²σ_ctrl²`.
- **Manuscript:** Lemma 6.5.
- **Frozen context exact theorem:** `localization_dichotomy`; `globalControlFloor`; `diagSector`.
- **Release evidence:** equivalent partition mechanism in the released global-control chain.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED; FROZEN-CONTEXT exact clean statement.
- **Review gate:** verify no exceptional cold fiber is omitted.

### P19. High-floor Laplace absorption

- **Statement:** after the level-set estimate, the sum over `Qctrl≥floor` is at most `η/σ_ctrl` for large bottom scale.
- **Manuscript:** Lemma 6.6.
- **Frozen context exact theorem:** `laplace_above_control_floor`.
- **Mechanism:** choose `cbar`, sum energy shells, factor floor decay, absorb fixed entropy `exp(A·numBlocks)`, use `σ_ctrl≤1`.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED; REVIEW-GATED for constant order.

### P20. Diagonal Gaussian tail

- **Statement:** globally diagonal assignments outside `|m|≤C/σ_ctrl` contribute at most `Ctail exp(-cC²/2)/σ_ctrl`.
- **Manuscript:** Lemma 6.7.
- **Frozen context exact theorem:** `diagonal_sector_gaussian_bound`.
- **Release evidence:** Gaussian tail lane used in released global control.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED.
- **Blocker:** none material after independent arithmetic check.

### P21. Global control partition

- **Statement:** off-main assignment Laplace mass is at most `(η+Ctail exp(-cC²/2))/σ_ctrl`.
- **Manuscript:** Theorem 6.1.
- **Frozen context exact theorem:** `global_control_partition`.
- **Dependencies:** P17–P20.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED; FROZEN-CONTEXT exact handoff.
- **Review gate:** principal independent-review gate for the paper.

## 5. Reciprocal mass and weighted family

### P22. Semiprime pair-pool mass

- **Statement:** `Σ_{p<q}1/(pq)=(S1²-S2)/2≥1/2` when `S1≥21/20` and `S2≤1/(2^k0-1)`.
- **Manuscript:** Section 7.
- **Release evidence:** `blockPrimes_sub_sq_tail`, `blockPrimes_pair_prod_injOn`, `blockPrimes_product_load_ge_of`, `blockPrimes_product_load_ge` in release mass modules.
- **Frozen context:** same clean declarations in `Construction/BlockPrimePool.lean`.
- **Input:** P6 only.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.

### P23. Residual pool and forbidden-load subtraction

- **Statement:** remove `T`, control products, and reservoir products from the pair pool; enough reciprocal load remains to fill the residual target.
- **Manuscript:** Section 7.
- **Release evidence:** R2 mass-pool/final-budget modules and `exists_blockAligned_mass_batch` chain.
- **Frozen context:** `residualForbidden`, `residualPairPool`, `residualPairPool_load_lower_of_forbidden_budget`, `MassBatchSupply`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED at the principle level; REVIEW-GATED for exact forbidden constants.

### P24. Greedy reciprocal window

- **Statement:** a finite positive pool of total mass at least `t` and individual terms below `g` has a subset with sum in `[t,t+g)`.
- **Manuscript:** Lemma 7.1.
- **Release evidence:** `exists_subset_recip_window_strict_upper`, `exists_subset_recip_window`, mass-batch selectors.
- **Frozen context:** `exists_massBatchSupply_of_pool` and generic residual-window selector.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.

### P25. Load window and weights

- **Statement:** final `E=Ectrl ⊔ Emass ⊔ Eres` has load in `[3/(2b),3/b)`; uniform `θ=(1/b)/load` lies in `[1/3,2/3]`, has exact weighted mass `1/b`, and gives no-wrap.
- **Manuscript:** equations (7.5)–(7.7).
- **Release evidence:** `R2ConcreteData.Weights` / `R2Weights.lean` and final assembly.
- **Frozen context:** `MassBatchSupply`, `WeightedEdgeCertificate`, `ConstructionData.Weights`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.

### P26. Variance comparison and inverse-square load

- **Statement:** `sqrt(2/9) σ_ctrl ≤ σ_E ≤ Kσ σ_ctrl` and `σ_E>0`.
- **Manuscript:** equation (7.9).
- **Release evidence:** `sigmaE2_ge_ctrl`, edge-square-load bounds, quantitative final assembly.
- **Frozen context:** `main_arc_variance_comparison`, `exists_edge_square_load_bound`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED; REVIEW-GATED for constants.

## 6. Main and minor Fourier sectors

### P27. Main-window geometry

- **Statement:** with `N=ceil(C/σ_ctrl)`, eventually `2N<2^(2k0)`, `2N+1≤L`, `1/σ_E≤N`, and `(2N+1)σ_ctrl≤2C+3`.
- **Manuscript:** equations (8.1)–(8.2), (10.6).
- **Release evidence:** final R2 parameter closure.
- **Frozen context:** `MainArcWindowCertificate`, `main_arc_window_scale_period`, `exists_main_arc_window_certificate`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED terminal asymptotics.
- **Review gate:** verify all quantifiers follow constant-first/scale-last order.

### P28. Bernoulli Taylor expansion and Gaussian main lower bound

- **Statement:** linear phase cancels; cubic remainder is small; main term real part is at least `c3/σ_E`; conjugate symmetry kills its imaginary part.
- **Manuscript:** Section 8.
- **Release evidence:** `sum_logphi_bound`, `term_label_eq`, `term_label_re_lower`, `main_re_lower`, `term_label_conj`, `main_sum_re_lower`, `main_sum_im_zero`.
- **Frozen context:** `BernoulliLogExpansion`, `MainArcLowerBound`, `MainArcNumericBounds`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.

### P29. Fourier norm to quadratic energy

- **Statement:** for weights in `[1/3,2/3]`, `|F(h)|≤exp(-(16/9) Q_E(h))`.
- **Manuscript:** equation (8.7).
- **Release evidence:** released minor-arc factor bound.
- **Frozen context:** `fourierNormWeight_le_exp_QE`, `sum_fourierNormWeight_le_exp_QE`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.

### P30. Block-minor fiber transfer

- **Statement:** frequency-to-block-assignment fibers have size at most `b`; more generally the extra-energy fiber tail is at most `b`; hence the block minor is bounded by `b` times P21.
- **Manuscript:** Section 9.
- **Release evidence:** `minor_arc_bound_mult` / R2 block-minor lane.
- **Frozen context:** `minor_energy_sum_le_fiber_tail`, `BlockMinorFiberTail`, `blockMinorFrequencyLane`, `blockSupport_frequency_fiber_card_le`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED; REVIEW-GATED.
- **Important exact factor:** `b`, not an unnamed multiplicity.

### P31. Squarefree CRT mismatch

- **Statement:** block congruence plus failure modulo `L=b·∏blockSupport` yields a mismatch modulo some prime divisor `r|b`; squarefreeness is essential.
- **Manuscript:** Lemma 10.1.
- **Release evidence:** `modEq_of_modEq_primeDivisors`, `exists_R_mismatch_of_block_eq_not_global` in released extra-CRT modules.
- **Frozen context:** same theorem names in `Construction/MinorArc/ExtraSiblingChoice.lean`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.

### P32. Extra-frequency count

- **Statement:** at most `b` frequencies per constant block assignment and at most `2N+1` labels; therefore `|Sextra|≤b(2N+1)`.
- **Manuscript:** equation (10.2).
- **Release evidence:** `extra_sibling_card_le_pred_b`, `r2_extra_count_le`.
- **Frozen context:** `extraMinor_card_le`, `extraMinorCountBound`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.

### P33. Reservoir damping

- **Statement:** for mismatch prime `r` and each high reservoir prime `s`, the `rs` factor is at most `sqrt(1-(8/9)/r²)`; `G` factors give the `G`th power, bounded by the worst case `r≤b`.
- **Manuscript:** equations (10.4)–(10.5).
- **Release evidence:** released multi-gadget reservoir and damping chain.
- **Frozen context:** `bernoulliCharFun_norm_le_of_residue_offset`, `fourierNormWeight_le_multi_gadget_damp`, `MultiGadgetReservoir`, `gadgetDampingBound`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED; REVIEW-GATED.

### P34. Minor-sector disjoint split

- **Statement:** every minor frequency belongs to the block sector or, after disjointization, the extra sector; the two norm budgets add.
- **Manuscript:** Sections 9–10.
- **Release evidence:** released main-arc classification and final minor assembly.
- **Frozen context:** `mainArcClassificationData`, `blockMinorPart`, `extraMinorPart`, `MinorArcFrequencyLanes`, `Endgame.lean`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED architecture.

## 7. Terminal compatibility and construction closure

### P35. Hierarchical parameter choice

- **Statement:** choose `c3,Kσ`, then `η`, obtain `Ctail`, choose `C`, choose `Dmp`, choose `G`, and only then choose `k0` beyond every threshold.
- **Manuscript:** Section 11.
- **Release evidence:** explicit constant/scale selection in final R2 assembly.
- **Frozen context:** `ConstructionParameters`, `exists_construction_parameters`, `BlockSystemCertificate`.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED; FROZEN-CONTEXT clean certificate.
- **Review gate:** principal constant-order audit.

### P36. Single terminal budget

- **Statement:**
  `bη + b*Ctail*exp(-C²*(16/9)/2) + b*Dmp*(2C+3) < c3/Kσ`.
- **Manuscript:** equation (11.4).
- **Frozen context exact field:** `ConstructionParameters.hbudget`.
- **Release evidence:** equivalent final quantitative assembly proves main domination.
- **Status:** RELEASE-COMPOSITE; PAPER-PROVED.
- **Blocker:** independent arithmetic check; no logical gap identified.

### P37. Existence of an arc construction

- **Statement:** under P5 and P6, for squarefree `b≥3` and finite `T`, an admissible weighted family plus main and minor certificates exists.
- **Manuscript:** proof of Theorem 3.3 through Sections 4–11.
- **Release evidence:** `exists_arcConstruction_final` and associated final release theorem chain.
- **Frozen context:** `ConstructionFoundation → GadgetEdgeCertificate → WeightedEdgeCertificate → MainArcWindowCertificate → MinorArcEstimateCertificate → ArcConstruction`; theorem `exists_arcConstruction`.
- **Status:** RELEASE-CHECKED conclusion; PAPER-PROVED structural reorganization; FROZEN-CONTEXT architecture only.

### P38. Avoiding representation for `b≥3`

- **Statement:** arc construction plus spectral selection yields a finite semiprime set avoiding `T` with sum `1/b`.
- **Manuscript:** Theorem 3.3.
- **Release evidence:** `exists_pos_weighted_ge3_R2`, `egyptian_rep_ge3_R2`.
- **Frozen context:** `hasEgyptianSemiprimeReprAvoiding_one_div_of_three_le`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED.

### P39. Full sufficiency and headline theorem

- **Statement:** P38 + P3 + P2 + ordered-set packaging proves the headline theorem; P1 gives necessity.
- **Manuscript:** Corollary 3.4, Section 11, Section 12.
- **Release evidence:** `erdos_306_unconditional`, `erdos_306`.
- **Status:** RELEASE-CHECKED; PAPER-PROVED assembly.
- **External input:** P7 and P8 only.
- **Blocker:** no mathematical gap identified; publication gates remain below.

## 8. Material gaps and publication gates

The major revision has not identified a contradiction between the released proof, the structural paper theorem, the cleaned architecture, and the RV1 trust-boundary audit. The remaining gates are evidentiary and editorial:

1. independent line-by-line review of P15–P21, P30–P36;
2. final visual comparison of P7–P8 with the publisher scan;
3. fresh release build/audit evidence for submission packaging, without treating the frozen refactor as cleared formal authority;
4. author decisions on title, abstract emphasis, AI disclosure, acknowledgements, category, and publication mode;
5. Director disposition on this major revision;
6. final source archive and arXiv metadata check.

The manuscript may cite v0.0.3 and its DOI now. It must not claim that `codex/pushlinter` has replaced or improved the published formal trust boundary until a separate verified release exists.
