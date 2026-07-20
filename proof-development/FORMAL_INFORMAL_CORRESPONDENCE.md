# Erdős 306 formal/informal proposition correspondence

**Formal authority:** `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
**Human baseline:** `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
**Proof-development checkpoint:** `proof-development/e306-rigour-v1`  
**Status:** `COMPLETE-DRAFT`

## 1. Evidence classes

- `HUMAN-PROVED` — a complete conceptual derivation is present in the
  proof-development units.
- `LEAN-CLOSED` — the declaration is accepted by the kernel at the immutable
  release.
- `FINITE-RESIDUAL` — the mathematical implication is explicit, while a long
  finite constant, cast, floor, or polynomial inequality remains delegated to a
  named Lean declaration.
- `EXTERNAL-RS` — one of the two exact released Rosser–Schoenfeld assumptions.
- `EXTERNAL-PNT` — the separate paper backend's prime number theorem.
- `SOURCE-GATED` — primary-source symbol-by-symbol human comparison remains open.
- `NO-RELEASED-DECLARATION` — human mathematics not packaged as a named theorem
  in the released tree; this is not a missing assumption when the released
  headline proves only the sufficiency direction.

## 2. Statement and analytic spine

| Ledger | Human proposition | Released locator | Status / exact boundary |
|---|---|---|---|
| P0 | A squarefree semiprime is a product of two distinct primes and has `omega = Omega = 2`. | `Erdos306.isSemiprime_omega_Omega`, `Erdos306.isSemiprime_one_lt` in `Erdos306FormalConjectures.lean` | `HUMAN-PROVED / LEAN-CLOSED` |
| P1 | A reciprocal sum of squarefree integers has squarefree reduced denominator. | none required by the released one-way theorem | `HUMAN-PROVED / NO-RELEASED-DECLARATION` |
| P2 | Avoiding representations of `1/b` imply avoiding representations of `a/b`. | `reduction_to_unit_numerator_avoiding` in `MainTheorem.lean`; consumed by `erdos_306_unconditional` | `HUMAN-PROVED / LEAN-CLOSED` |
| P3 | The cases `b=2` and `b=1` reduce to denominators `3,6`. | `egyptian_rep_eq2_R2`, `exists_semiprime_egyptian_one_R2`, `circle_method_positivity_R2` in `Erdos306Final.lean` | `HUMAN-PROVED / LEAN-CLOSED` |
| P4 | `pi(x) ~ x/log x`. | no released declaration or axiom | `EXTERNAL-PNT`, paper backend only |
| P5 | Abel summation on `(x,2x]`. | no released PNT bridge | `HUMAN-PROVED`, paper backend |
| P6 | `sum_{x<=p<2x} 1/p = log 2/log x + o(1/log x)`. | no released PNT bridge | `HUMAN-PROVED`, including uniform tail error and endpoints |
| P7 | `A_k = 1/k + o(1/k)`. | no released PNT bridge | `HUMAN-PROVED` |
| P8 | Eventual dyadic density. | `GlobalControl.dyadic_prime_density` in `RSPrimeSums.lean` | `LEAN-CLOSED` from `EXTERNAL-RS` Cor. 3; separate PNT proof supplied |
| P9 | Inclusive window mass on `k0,...,3k0`. | `GlobalControl.dyadic_mertens_cumulative` in `RSPrimeSums.lean` | `LEAN-CLOSED` from `EXTERNAL-RS` Thm. 5; separate PNT proof supplied |
| P10 | The construction consumes only those eventual supplies and chooses the scale last. | block-system and R2 threshold assembly ending in `exists_arcConstruction_final` | `HUMAN-PROVED / LEAN-CLOSED`; no single released `AnalyticInputs` structure |

The backend-independent extraction is
`units/E306-PD-B1-B3-ANALYTIC-INTERFACE.md`.

## 3. Finite spectral construction

| Ledger | Human proposition | Released locator | Status / exact boundary |
|---|---|---|---|
| P11 | The two analytic supplies imply an avoiding representation of `1/b` for squarefree `b>=3`. | `exists_arcConstruction_final` -> `exists_pos_weighted_ge3_R2` -> `egyptian_rep_ge3_R2` | `HUMAN-PROVED / LEAN-CLOSED` |
| P12 | Finite Fourier identity for the weighted subset count. | `CircleMethod.lean` / `CircleMethodAssembly.lean` weighted-count Fourier chain | `HUMAN-PROVED / LEAN-CLOSED`; character conventions fixed by `L/e` and `L/b` |
| P13 | Real main sum greater than total minor norm implies positive weighted count. | positivity assembly consumed by `exists_pos_weighted_of_construction` | `HUMAN-PROVED / LEAN-CLOSED` |
| P14 | Total load below one converts the congruence to exact equality. | `Wcount_pos_imp_repr` and construction load fields | `HUMAN-PROVED / LEAN-CLOSED` |
| P15 | Centered CRT representatives give the exact control-energy identity. | `Hglob`, `Qctrl`, CRT lemmas in `GlobalControl.lean`; control/full-energy bridge in R2 classification | `HUMAN-PROVED / LEAN-CLOSED` |
| P16 | Control deviation lower bound and control reciprocal-load upper bound. | `sigmaCtrl_ge_strong`; `ctrl_recipLoad_le_tail`; `dyadic_control_recipLoad_eventually_small`; `exists_k0_controlLoad_lt` | `HUMAN-PROVED / LEAN-CLOSED`; stronger human load bound recorded |
| P17 | Cold blocks have a unique dominant label with charged exceptions. | `SBEEForcing.theorem_B_nondominant_forcing`; `dominant_label_unique`; `exception_count_bound`; `GlobalControl.cold_isDominant`; `cold_master` | `HUMAN-PROVED / LEAN-CLOSED`; chase arithmetic `FINITE-RESIDUAL` |
| P18 | Distinct adjacent cold labels force boundary energy. | `crossblock_dispersion`; `crossblock_phase_bridge`; `mismatch_per_q`; corrected `mismatch_penalty`; `mismatch_penalty_with_exceptions` | `HUMAN-PROVED / LEAN-CLOSED`; original hypothesis-free statement is false |
| P19 | Global level-set estimate. | `GlobalControlG5Assembly.global_levelset_final` | `HUMAN-PROVED / LEAN-CLOSED`; label/shell charge algebra partly `FINITE-RESIDUAL` |
| P20 | Off-main assignment is above the floor or diagonal. | `GlobalControlG6.g6_localization`; `diagonal_Qctrl` | `HUMAN-PROVED / LEAN-CLOSED` |
| P21 | High-floor Laplace mass is absorbed into `eta/sigmaCtrl`. | `GlobalControlSectorI.sectorI_absorption'` | `HUMAN-PROVED / LEAN-CLOSED`; eventual domination thresholds `FINITE-RESIDUAL` |
| P22 | Diagonal tail is Gaussian. | `GlobalControlG7.sectorII_gaussian` | `HUMAN-PROVED / LEAN-CLOSED`; explicit tail constant available |
| P23 | Global control partition. | `GlobalControlG7.global_control_partition_final` | `HUMAN-PROVED / LEAN-CLOSED`; correct fixed `exp(A*numBlocks)` route |
| P24 | Pair-pool load is `(S1^2-S2)/2` and at least `1/2`. | `sq_sum_eq_sum_sq_add_two_sum_lt`; `blockPrimes_sub_sq_tail`; `blockPrimes_product_load_ge_of`; `blockPrimes_product_load_ge` | `HUMAN-PROVED / LEAN-CLOSED`; positive analytic premise isolated |
| P25 | Greedy reciprocal window. | `exists_subset_recip_window_strict_upper` | `HUMAN-PROVED / LEAN-CLOSED` |
| P26 | Load, weight and variance window. | `R2MassBatchSupply.weights`; `sigmaE2_ge_ctrl`; `r2_extra_inv_sq_le`; final `hsumE` / `hsigmaE_ub` assembly in `R2TopAssembly.lean` | `HUMAN-PROVED / LEAN-CLOSED`; inverse-square constants `FINITE-RESIDUAL` |
| P27 | Taylor main arcs and Gaussian lower bound. | `MainArcNumericFields`; `r2_numericFields`; `r2_close_numericFields`; R2 main-arc fields | `HUMAN-PROVED / LEAN-CLOSED`; aggregate cubic bound `FINITE-RESIDUAL` |
| P28 | Universal Fourier-energy upper bound. | Fourier-energy lemmas consumed by the R2 minor-support lane | `HUMAN-PROVED / LEAN-CLOSED` |
| P29 | Block-minor CRT fibre has multiplicity at most `b`. | `r2_blockFiberTail` | `HUMAN-PROVED / LEAN-CLOSED`; factor `b` explicit |
| P30 | A nonmain sibling differs modulo a prime divisor of squarefree `b`. | `r2ExtraSiblingChoice` / integer-label sibling-choice chain | `HUMAN-PROVED / LEAN-CLOSED`; second use of squarefreeness |
| P31 | A common `G`-prime reservoir gives `beta_b^G` damping. | R2 multi-gadget frequency lane; `r2_extra_count_le`; `r2_buildFreqLanes` | `HUMAN-PROVED / LEAN-CLOSED`; pointwise and count constants explicit |
| P32 | Constant-first choices make main exceed both minor sectors. | `exists_arcConstruction_final` in `R2TopAssembly.lean` | `HUMAN-PROVED / LEAN-CLOSED`; final numeric certificate `FINITE-RESIDUAL` |
| P33 | Headline theorem and public tuple formulation. | `erdos_306_unconditional`; `Erdos306.erdos_306` | `HUMAN-PROVED / LEAN-CLOSED` |

## 4. Kernel-residual ledger

The following residuals are legitimate machine delegation under the Director's
article-core rule. None conceals a hypothesis or a new external theorem.

| Residual | Named released locus | Humanly exposed implication |
|---|---|---|
| Nondominant forcing rational chase | `theoremB_chase_left`, `theoremB_chase_right`, `theoremB_hAR`, `theoremB_hRle` | covering/dispersion dichotomy implies an explicit `X/log^3 X` floor |
| Cold-block threshold and integer rounding | `cold_master`, `cold_no_exceptions_core` | small forcing constant gives bounded, then empty, exception set in the localization regime |
| Label and Peierls charge arithmetic | `pow_beats_poly_log`, label charge lemmas, `hrhs_charge_bound`, `hrhs_final` | fixed local entropy is absorbed by hot/boundary energy charges |
| Sector-I eventual domination | `sectorI_absorption'` and support limit lemmas | growing floor absorbs `exp(AJ)` and `sigmaCtrl^{-1}` factors |
| Mass/gadget inverse-square arithmetic | `r2_extra_inv_sq_le` and final `hsumE` assembly | noncontrol square load is bounded by a fixed multiple of `sigmaCtrl^2` |
| Main-arc numerical fields | `r2_numericFields`, `r2_close_numericFields` | Taylor disk, cubic remainder and Gaussian-window hypotheses hold at large scale |
| Terminal scale/cardinality maximum | `exists_arcConstruction_final` | all previously fixed constants are simultaneously satisfied by one final `k0` |
| Finite-to-tuple casts and index identities | `Erdos306.erdos_306` | increasing enumeration and exclusion of the dummy anchor reproduce the finite set sum |

A manuscript consumer may cite the immutable companion for these residuals only
while retaining the displayed mathematical statements, hypotheses, dependency
locators and trust boundary.

## 5. Exact external audit

The released public theorem has standard Lean foundations

- `propext`;
- `Classical.choice`;
- `Quot.sound`;

plus exactly

- `RosserSchoenfeld.rosser_schoenfeld_cor3`;
- `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The first is used only to derive the dyadic density provider; the second only to
derive the inclusive reciprocal-window provider. The PNT route is not in this
axiom audit.

The human-visible publisher-scan comparison of the two axiom transcriptions is
`SOURCE-GATED`. The formal consequences and the article-core correspondence are
not thereby open proof obligations.

## 6. Version-separation findings

1. `GlobalControl.lean` contains stale header prose claiming G5/G7 remain
   `sorry`; active downstream release modules close them.
2. Frozen refactor declarations are architectural context, not substitutes for
   the released declarations listed above.
3. The paper's PNT provider is mathematical exposition, not a released formal
   dependency.
4. No human unit may silently inherit `LEAN-CLOSED` status from an unreleased
   checkpoint.

`FORMAL_INFORMAL_CORRESPONDENCE.md` is `COMPLETE-DRAFT`.
