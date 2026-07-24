# E306 Research Lead bounded curation handoff

**From:** `Erdős 306 — Research Lead` (`E306-RL`)  
**Receivers:** `E306-DIR`, `MATH-CUR`  
**Date:** 2026-07-24  
**Purpose:** exact source-slice handoff for canonical corpus realignment  
**Role disposition:** bounded handoff only; the standing `E306-RL` role remains active

## 1. Exact provenance and authority boundary

- Repository/branch: `Yuren-Tang/erdos-306:research/e306-frontier-v1`.
- Immutable release/base: `4582185de1e0e27416e9362e0cc7943c3d2fb4fe`.
- Frozen full Research Lead source slice covered by this handoff:
  `6e2352eeccec3686e9c167cf2cd6c47c152e5560`.
- The branch was exactly identical to that SHA immediately before this handoff commit.
- The final handoff commit is reported separately in issue #9 because a file cannot contain its own final commit SHA without creating another commit.
- Permitted source surface remains `research/**` only.

This document does not curate, merge, promote, rewrite, or alter assurance. It is a classification and routing authority for the frozen Research Lead slice. Released theorem authority, ordinary-proof assurance, Curator integration, manuscript, Lean, release, DOI, arXiv, and publication authority remain external to this handoff.

## 2. Status vocabulary used here

- `THEOREM-PROVED`: a complete theorem was proved in the stated source; this does not imply independent audit unless separately stated.
- `PROVED-ARGUMENT`: the mathematical derivation is complete at Research Lead argument level but is not itself an assurance artifact.
- `COMPLETE-AUTHORIAL-CANDIDATE`: expanded into a complete authorial proof candidate, awaiting or undergoing independent assurance.
- `AUDITED`: independently audited, or fully subsumed in an independently audited exact consumer. When the latter applies, the audited consumer—not the research file—is the assurance authority.
- `ARGUMENT`: substantial mechanism or theorem candidate with remaining provider, endpoint, or proof-development obligations.
- `IDEA`: exploratory architecture, map, or conjectural provider direction.
- `COUNTEREXAMPLE`: explicit counterexample or complete failure-mode construction.
- `METHOD-CLASS-BARRIER`: proved obstruction to a specified proof architecture, not a lower bound for the mathematical problem.
- `SUPERSEDED`: no longer controlling; retained only for genealogy, failed-route history, or reusable local lemmas.

## 3. Canonical intake disposition in one page

### 3.1 First E306 core theorem corpus

The first E306 core corpus should not ingest the moving Research Lead branch as theorem authority. It should use:

1. **Released formal authority**  
   `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe` — `THEOREM-PROVED`.

2. **Audited repaired multiblock ordinary proof fallback**  
   repaired proof-development candidate based at `proof-development/e306-rigour-v1@2817986c38a884c921dca1a5be256d28b0865769`; independent repair verification candidate `review/e306-paper-first-repair-verification-v1@95a2ede1d40dae41a17fe26e4fe4b491bd94e947`; issue #59 returned `[PASS E306-PF-REPAIR-VERIFY-01]` — `AUDITED`.

3. **Audited one-anchor ordinary proof**  
   `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`; issue #58 returned `[PASS E306-OA-AUDIT-01]` — `AUDITED`. This is the current assured strict-simplification candidate. E306-DIR still controls route disposition relative to the multiblock fallback.

4. **Sparse-anchor proof packet only as a candidate layer**  
   frozen RL source `fed38b7d79b2b037ca1d3521a53b2c61c007867d`; issue #60 returned `[READY-FOR-INDEPENDENT-SPARSE-ROUTE-AUDIT E306-PD-SAS-01]` — `COMPLETE-AUTHORIAL-CANDIDATE`, not yet `AUDITED`.

### 3.2 Research-source role

The files on `research/e306-frontier-v1` are the exact genealogy and reusable-mechanism layer. For the first core corpus:

- use the audited proof packets for the theorem spine;
- use the controlling Research Lead files below only to explain source genealogy, discarded architectures, general lemmas, and future work;
- do not infer assurance from an RL status label;
- do not import GFF, sparse-anchor, AFT generalization, or adjacent E307 working-ahead results into the theorem-assurance layer.

### 3.3 General theorem layer

The bounded AFT child produced a separate exact theorem packet:

`Yuren-Tang/erdos-306:research/e306-anchor-fibre-transference-v1@2f49ab25c36326e9ea39e3fc0ed1d22a22b11693`.

Its seven files under `research/anchor-fibre-transference/**` are `THEOREM-PROVED` at authorial research level. The E306 arithmetic corollary remains conditional on route-specific providers and the packet was not independently audited by that unit. It should enter a general-mechanism candidate layer, not silently replace the audited E306 proof packet.

## 4. Exact downstream consumption ledger

| Consumer | Exact RL source | Research files actually consumed | Result |
|---|---|---|---|
| One-anchor PDL, issue #55 | initial `74a68bef4778f15bb818c804d9c5fb0040660246`, controlling addendum `55b05ee5ca7e0c2f47ba4f17c6773defa5ac3951` | `PAPER_FIRST_FRONTIER_REALIGNMENT_AND_ONE_ANCHOR_ROUTE_V1.md`; `PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_01.md`; controlling corrections `PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_02.md`, `PAPER_FIRST_ONE_ANCHOR_MAJOR_ARC_AND_TERMINAL_BUDGET.md`, `CURRENT_STATE_2026-07-22_WEIGHTED_FIBRE.md` | complete one-anchor packet `07ed8d...`; later independent audit PASS |
| Sparse PDL, issue #60 | `fed38b7d79b2b037ca1d3521a53b2c61c007867d` | `SPARSE_TOP_SYNCHRONIZATION_CORE_V1.md`; `SPARSE_ARITHMETIC_SYNCHRONIZATION_CLUSTER_EXPANSION_V1.md`; dense one-anchor and repaired multiblock packets only as read-only providers/fallbacks | complete authorial sparse packet; ready for independent sparse-route audit |
| AFT child, issue #54 | `55b05ee5ca7e0c2f47ba4f17c6773defa5ac3951` | `PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_02.md`; `PAPER_FIRST_ONE_ANCHOR_MAJOR_ARC_AND_TERMINAL_BUDGET.md`; `CURRENT_STATE_2026-07-22_WEIGHTED_FIBRE.md` | general weighted anchor–fibre theorem proved on separate branch `2f49ab...` |
| Paper-first independent audit, issues #53/#59 | proof-development candidates, not RL files as authority | RL branch not consumed as correctness authority | multiblock fallback passed after bounded repairs |
| One-anchor independent audit, issue #58 | proof-development candidate `07ed8d...`, not RL assertions as authority | RL files only genealogical through the PDL packet | `[PASS E306-OA-AUDIT-01]` |

## 5. Controlling source and supersession map

### 5.1 Original E306 theorem route

- `PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_02.md`, `PAPER_FIRST_ONE_ANCHOR_MAJOR_ARC_AND_TERMINAL_BUDGET.md`, and `CURRENT_STATE_2026-07-22_WEIGHTED_FIBRE.md` supersede inconsistent statements in `PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_01.md`.
- The independently audited one-anchor proof packet `07ed8d...` supersedes the RL one-anchor files as ordinary-proof authority, while retaining them as exact source genealogy.
- The sparse pair `SPARSE_TOP_SYNCHRONIZATION_CORE_V1.md` + `SPARSE_ARITHMETIC_SYNCHRONIZATION_CLUSTER_EXPANSION_V1.md` supersedes the dense one-anchor route only as the newest claimed simplification. It does not supersede the audited one-anchor packet in assurance until independent sparse-route audit and E306-DIR disposition.
- The repaired audited multiblock packet remains the assured fallback and is not invalidated by either shorter route.

### 5.2 Finite-prefix/GFF route

- `GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md` controls the alias/Linnik corrections to `GLOBAL_FINITE_PREFIX_TRANSFER_V1.md`.
- `HC_RATE_DYADIC_GFF_AUDIT_ADDENDUM_01.md` controls the coherent-label terminal partition of `HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md`.
- `SPARSE_GIBBS_ANCHOR_AUDIT_ADDENDUM_01.md` controls the sparse-Gibbs theorem candidate.
- `TWO_ANCHOR_LOCAL_PARTITION_CLOSURE_ERRATUM.md` controls the earlier two-anchor local-partition addendum.
- The current strongest GFF candidate is the small-theta complete-pair chain:
  `SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_V1.md` + central-band addendum + no-wrap addendum + `RECIPROCAL_LABEL_POPULATION_FULL_RANGE_V1.md`.
- Older global-control, two-anchor, critical sparse-Gibbs, and one-anchor sparse-Gibbs rates are quantitatively superseded but retain reusable local lemmas.

### 5.3 Programme-state files

- This handoff supersedes `research/PROGRAMME_STATE.md` only as the curation navigation map. It does not declare every mathematical statement in that file false.
- The three E307 programme addenda are chronological summaries and are superseded for current E307 navigation by the latest E307 synthesis files and the present transfer recommendation.

## 6. Complete Research Lead file classification

### 6.1 Programme control and E306-wide addenda

| File | Status | Curation disposition |
|---|---|---|
| `research/PROGRAMME_STATE.md` | `SUPERSEDED` | historical state map; replaced for curation by this handoff |
| `research/PROGRAMME_STATE_ADDENDUM_2026-07-23_KLOOSTERMAN_MULTISCALE.md` | `PROVED-ARGUMENT` | GFF/general-mechanism layer, not first theorem core |
| `research/PROGRAMME_STATE_ADDENDUM_2026-07-23_LOCAL_LIMIT_HOT_COLD.md` | `ARGUMENT` | working-ahead GFF layer |
| `research/PROGRAMME_STATE_ADDENDUM_2026-07-23_TRANSFERENCE_AND_POSITIVE_SLICING.md` | `PROVED-ARGUMENT` | general mechanism layer |
| `research/PROGRAMME_STATE_ADDENDUM_2026-07-23_E307_JET_PORT_AND_DIVISOR_REDUCTION.md` | `SUPERSEDED` | transfer to E307 chronology |
| `research/PROGRAMME_STATE_ADDENDUM_2026-07-23_E307_PORT_SONDOW_NORM_SYNTHESIS.md` | `SUPERSEDED` | transfer to E307 chronology |
| `research/PROGRAMME_STATE_ADDENDUM_2026-07-23_E307_REBOUND_BLOCK_CODE_AND_DEFECT_SPECTRUM.md` | `PROVED-ARGUMENT` | latest broad E307 state summary; transfer |

### 6.2 Original E306 theorem-route research

| File | Status | Control/use |
|---|---|---|
| `research/paper-first-one-anchor/PAPER_FIRST_FRONTIER_REALIGNMENT_AND_ONE_ANCHOR_ROUTE_V1.md` | `SUPERSEDED` | route genealogy only |
| `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_01.md` | `SUPERSEDED` | corrected by Addendum 02 |
| `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_ROUTE_AUDIT_ADDENDUM_02.md` | `AUDITED` | mathematical content subsumed in audited one-anchor consumer; use consumer as assurance authority |
| `research/paper-first-one-anchor/PAPER_FIRST_ONE_ANCHOR_MAJOR_ARC_AND_TERMINAL_BUDGET.md` | `AUDITED` | subsumed in audited one-anchor consumer |
| `research/paper-first-one-anchor/CURRENT_STATE_2026-07-22_WEIGHTED_FIBRE.md` | `AUDITED` | controlling RL correction consumed by one-anchor PDL and AFT; audited consumer controls theorem assurance |
| `research/paper-first-one-anchor/SPARSE_TOP_SYNCHRONIZATION_CORE_V1.md` | `COMPLETE-AUTHORIAL-CANDIDATE` | consumed by sparse PDL; awaiting independent sparse audit |
| `research/paper-first-one-anchor/SPARSE_ARITHMETIC_SYNCHRONIZATION_CLUSTER_EXPANSION_V1.md` | `COMPLETE-AUTHORIAL-CANDIDATE` | consumed by sparse PDL; awaiting independent sparse audit |
| `research/paper-first-one-anchor/ARITHMETIC_CYCLE_SPACE_RIGIDITY_FRONTIER_V1.md` | `IDEA` | non-controlling research frontier |
| `research/paper-first-one-anchor/BIPARTITE_PLAQUETTE_METASTABILITY_COUNTEREXAMPLE_V1.md` | `COUNTEREXAMPLE` | retain in failure-mode/barrier appendix, not theorem spine |

### 6.3 Finite-prefix/GFF and reusable coding mechanisms

| File | Status | Curation disposition |
|---|---|---|
| `research/finite-prefix-crt/CRT_SUPPRESSION_THEOREMS_V1.md` | `PROVED-ARGUMENT` | reusable shifted-code theorem layer |
| `research/finite-prefix-crt/PRODUCT_CODE_PEIERLS_TRANSFER_THEOREM_V1.md` | `PROVED-ARGUMENT` | reusable general coding layer |
| `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1.md` | `SUPERSEDED` | retain only with errata and genealogy |
| `research/finite-prefix-crt/GLOBAL_FINITE_PREFIX_TRANSFER_V1_ERRATA.md` | `PROVED-ARGUMENT` | controls corrections to preceding file |
| `research/finite-prefix-crt/HC_RATE_AND_DYADIC_GFF_TRANSFER_V1.md` | `SUPERSEDED` | earlier complete authorial GFF route |
| `research/finite-prefix-crt/HC_RATE_DYADIC_GFF_AUDIT_ADDENDUM_01.md` | `SUPERSEDED` | corrected historical provider ledger |
| `research/finite-prefix-crt/SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_V1.md` | `PROVED-ARGUMENT` | reusable sensor theorem candidate |
| `research/finite-prefix-crt/SPARSE_ACTUAL_PRIME_SENSOR_SAMPLING_ADDENDUM_ROW_ADAPTIVE.md` | `PROVED-ARGUMENT` | row-adaptive strengthening |
| `research/finite-prefix-crt/ONE_ANCHOR_RECIPROCAL_LABEL_SENSOR_V1.md` | `PROVED-ARGUMENT` | consumed by earlier PDL handoff; reusable |
| `research/finite-prefix-crt/PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_V1.md` | `PROVED-ARGUMENT` | reusable load-distance theorem candidate |
| `research/finite-prefix-crt/PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_IRREGULAR.md` | `PROVED-ARGUMENT` | controls irregular-block extension |
| `research/finite-prefix-crt/PRIME_BLOCK_LOAD_DISTANCE_OPTIMALITY_ADDENDUM_PREFIX_BOUNDED.md` | `PROVED-ARGUMENT` | controls prefix-bounded extension |
| `research/finite-prefix-crt/SPARSE_GIBBS_ANCHOR_AND_CRITICAL_SCALE_V1.md` | `SUPERSEDED` | earlier rate route; local theorem components retained |
| `research/finite-prefix-crt/SPARSE_GIBBS_ANCHOR_AUDIT_ADDENDUM_01.md` | `SUPERSEDED` | corrected historical route |
| `research/finite-prefix-crt/TWO_ANCHOR_CROSS_SCALE_CONTROL_V1.md` | `SUPERSEDED` | earlier rate route |
| `research/finite-prefix-crt/TWO_ANCHOR_LOCAL_PARTITION_CLOSURE_ADDENDUM.md` | `SUPERSEDED` | historical corrected interface |
| `research/finite-prefix-crt/TWO_ANCHOR_LOCAL_PARTITION_CLOSURE_ERRATUM.md` | `SUPERSEDED` | final historical correction |
| `research/finite-prefix-crt/SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_V1.md` | `COMPLETE-AUTHORIAL-CANDIDATE` | strongest current GFF theorem candidate; no independent audit |
| `research/finite-prefix-crt/SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_ADDENDUM_CENTRAL_BAND.md` | `PROVED-ARGUMENT` | controlling central-band repair |
| `research/finite-prefix-crt/SMALL_THETA_COMPLETE_PAIR_DEFECT_EXPANSION_GFF_ADDENDUM_NO_WRAP_INTERVAL.md` | `PROVED-ARGUMENT` | controlling no-wrap/power-interval correction |
| `research/finite-prefix-crt/RECIPROCAL_LABEL_POPULATION_FULL_RANGE_V1.md` | `PROVED-ARGUMENT` | controlling outer-label endpoint provider |
| `research/finite-prefix-crt/ARITHMETIC_BERNOULLI_LOCAL_LIMIT_AND_HEAT_KERNEL_V1.md` | `PROVED-ARGUMENT` | working-ahead local-limit mechanism |
| `research/finite-prefix-crt/HOT_COLD_SMOOTHING_ENSEMBLE_AND_MICROCANONICAL_FRONTIER_V1.md` | `ARGUMENT` | working-ahead microcanonical frontier |
| `research/finite-prefix-crt/KLOOSTERMAN_MULTISCALE_SENSOR_GFF_V1.md` | `PROVED-ARGUMENT` | working-ahead spectral mechanism |
| `research/finite-prefix-crt/COHERENT_SPECTRAL_AMPLIFICATION_AND_COLLISION_FLATTENING_V1.md` | `PROVED-ARGUMENT` | working-ahead general mechanism |
| `research/finite-prefix-crt/POSITIVE_MEASURE_FIBRE_SLICING_AND_JOINT_MIXING_FRONTIER_V1.md` | `PROVED-ARGUMENT` | working-ahead slicing/transference mechanism |
| `research/finite-prefix-crt/LITERATURE_POSITIONING_PRODUCT_CODE_PEIERLS_V1.md` | `IDEA` | comparison only; novelty not certified |
| `research/finite-prefix-crt/LITERATURE_POSITIONING_ADDENDUM_PREFIX_OPTIMALITY.md` | `IDEA` | comparison only; novelty not certified |
| `research/finite-prefix-crt/CONVERSATION_RECOVERY_2026-07-22.md` | `SUPERSEDED` | recovery/provenance only |
| `research/finite-prefix-crt/FPCRT02_RL_TO_PDL_HANDOFF_2026-07-22.md` | `SUPERSEDED` | historical handoff; later addenda/control packets supersede |
| `research/finite-prefix-crt/FPCRT02_RL_TO_PDL_HANDOFF_ADDENDUM_ONE_ANCHOR.md` | `SUPERSEDED` | historical consumer handoff |
| `research/finite-prefix-crt/FPCRT02_RL_TO_PDL_HANDOFF_ADDENDUM_SPARSE_TWO_ANCHOR.md` | `SUPERSEDED` | historical consumer handoff |

### 6.4 Method barriers and counterexamples

| File | Status | Meaning |
|---|---|---|
| `research/finite-prefix-crt/SAMPLED_CORE_DEFECT_EXPANSION_POWER_BARRIER_V1.md` | `METHOD-CLASS-BARRIER` | conditional square-root barrier for enumerative sampled-core architecture, not a problem lower bound |
| `research/finite-prefix-crt/C4_FREE_SENSOR_SQUARE_ROOT_BARRIER_V1.md` | `METHOD-CLASS-BARRIER` | barrier for specified sensor architecture |
| `research/finite-prefix-crt/SHORT_CYCLE_SENSOR_GIRTH_BARRIER_V1.md` | `METHOD-CLASS-BARRIER` | girth/short-cycle method barrier |
| `research/finite-prefix-crt/SPARSE_BLOCK_ENTROPY_VARIANCE_BARRIER_V1.md` | `METHOD-CLASS-BARRIER` | entropy/variance barrier for sparse-block route |
| `research/paper-first-one-anchor/BIPARTITE_PLAQUETTE_METASTABILITY_COUNTEREXAMPLE_V1.md` | `COUNTEREXAMPLE` | complete failure mode for insufficient local control |

### 6.5 Erdős 307 / adjacent-problem research

The following files are not part of the first E306 core corpus. Unless noted `SUPERSEDED`, their status is authorial research only and they should move as one exact slice to an E307 corpus.

| File | Status |
|---|---|
| `research/adjacent-problems/ERDOS_307_ARITHMETIC_DERIVATIVE_TWO_CYCLE_V1.md` | `SUPERSEDED` — identity retained, novelty claim corrected by Bado-interface file |
| `research/adjacent-problems/ERDOS_307_LITERATURE_ATTRIBUTION_CORRECTION_AND_BADO_INTERFACE_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/PRIME_SHIFT_HASSE_RECIPROCAL_HYPERGRAPH_CALCULUS_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_BILATERAL_TERMINAL_PORT_AND_ANTI_INHERITANCE_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_BILATERAL_DEFECT_SEMIGROUP_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_SEMIPRIME_JET_TRANSFER_AND_MOBIUS_PORT_INVOLUTION_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_LOCAL_PORT_ORBITS_AND_CRT_DENSITY_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_REAL_MODULAR_PORT_GEOMETRY_AND_DEFICIT_DETERMINANT_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_SEEDED_DIVISOR_PORT_FACTORIZATION_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_DIVISOR_RESIDUE_FOURIER_AND_QUADRATIC_OBSTRUCTION_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_MOVING_GENUS_CHARACTER_OBSTRUCTION_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_PRIMITIVE_NORM_AND_SPLIT_FACTOR_GEOMETRY_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_SEEDED_SCALAR_PORT_COMPOSITION_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_GENERAL_RESIDUAL_PORT_TRANSFER_AND_AUTOMATIC_OUTPUT_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_RESIDUAL_PORT_PENCILS_BLOCK_QUADRATIC_AND_DEFECT_BRIDGE_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_AMBIENT_E313_COLLAPSE_AND_NONAMBIENT_TRANSFER_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_BLOCK_FIRST_TWO_PRIME_CLOSURE_AND_EXACT_PENCIL_INTERSECTION_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_PAIRED_MU_SONDOW_DIAGONAL_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_RETURN_DEFECT_STRATIFICATION_AND_TWO_STEP_CONTRACTION_FRONTIER_V1.md` | `SUPERSEDED` — contraction frontier disproved by explicit rebound counterexamples |
| `research/adjacent-problems/ERDOS_307_DIRECT_GIUGA_CORE_REBOUND_AND_TWO_LINEAR_FORMS_V1.md` | `COUNTEREXAMPLE` |
| `research/adjacent-problems/ERDOS_307_GIUGA_CORE_RELAY_AND_TWO_STEP_CONTRACTION_COUNTEREXAMPLE_V1.md` | `COUNTEREXAMPLE` |
| `research/adjacent-problems/ERDOS_307_GENERAL_GIUGA_CORE_RESIDUAL_SQUARE_PORT_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_CORE30_RESIDUAL_900_PORT_AND_ZERO_DEFECT_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_CORE30_SUPPORT_70_AND_MINIMAL_SIGN_CROSSING_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_CORE858_MINIMAL_SUPPORT_RELAY_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_CORE1722_MINIMAL_SUPPORT_RELAY_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_CORE1722_NEAR_ZERO_MINIMAL_RELAY_REFINEMENT_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_DEFECT900_STANDARDIZATION_AND_NO_ONE_PRIME_INHERITANCE_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_DEFECT_BLOCK_SYNDROME_GLUING_AND_HYBRID_TRANSFERENCE_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_DEFECT_EXCHANGE_DETERMINANT_AND_LOW_SWAP_RIGIDITY_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_DEFECT_SPECTRUM_AND_INTERMEDIATE_SONDOW_LADDER_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_NATURAL_66_CORE_COMPLETE_ONE_REPLACEMENT_EXCLUSION_V1.md` | `ARGUMENT` — complete bounded diagnostic, not a general exclusion |
| `research/adjacent-problems/ERDOS_307_COMPLEMENT_JET_CODE_AND_MEET_IN_THE_MIDDLE_V1.md` | `PROVED-ARGUMENT` |
| `research/adjacent-problems/ERDOS_307_NORMALIZED_JET_GROUP_AND_TARGET_GRAPH_FOURIER_TRANSFERENCE_V1.md` | `PROVED-ARGUMENT` — current E307 analytic frontier |
| `research/adjacent-problems/UNIT_FRACTION_NEIGHBOURHOOD_MINE_MAP_304_313_V1.md` | `IDEA` — neighbourhood map, not theorem authority |

## 7. Working-ahead delta excluded from the first E306 core corpus

The following should not enter the first theorem core during realignment:

1. all `research/adjacent-problems/ERDOS_307_*` files and the three E307 programme addenda;
2. `UNIT_FRACTION_NEIGHBOURHOOD_MINE_MAP_304_313_V1.md`;
3. the small-theta GFF chain until exact proof-development reconstruction and independent finite-prefix audit;
4. Kloosterman multiscale, Bernoulli local limit, hot-cold microcanonical, collision flattening, and positive-measure slicing, except in a clearly labelled working-ahead/general-mechanism layer;
5. the sparse-anchor route until independent sparse-route audit and E306-DIR route comparison;
6. the AFT theorem packet as E306 theorem authority—the theorem may enter a general-mechanism candidate layer, but its E306 corollary remains provider-conditional;
7. literature-positioning files as novelty authority;
8. all superseded handoffs, recovery notes, old rate routes, and failed contraction chronology except in provenance/history appendices.

## 8. Next genuine Research Lead frontier

### E306 proper

1. Receive the independent sparse-route audit and answer only the smallest exact new-mathematics gap, if any.
2. Adversarially audit the small-theta complete-pair GFF constants and the corrected central-band/no-wrap bridge.
3. Improve logarithmic losses through stronger reciprocal dispersion or deterministic witness rigidity.
4. Seek non-enumerative synchronization, joint decoding, or complex cancellation capable of crossing the sampled-core power-`1/2` method barrier.
5. Find a second substantive consumer for the AFT theorem before treating it as a standalone publication-level object.

### Adjacent E307 frontier, pending spin-out

The true current adjacent frontier is the prime-jet spectral provider and joint finite/Archimedean local limit:

```text
sum_(p in I) chi(p) e_a(k p^(-1))
```

uniformly for moving derivative modulus, followed by target-graph transference and exact residual closure. This should continue under an E307-specific programme/corpus rather than expanding the E306 canonical core.

## 9. Recommended corpus transfers

### Independent `Erdős 307` corpus

Transfer as one exact source packet:

- all `research/adjacent-problems/ERDOS_307_*` files;
- `research/adjacent-problems/PRIME_SHIFT_HASSE_RECIPROCAL_HYPERGRAPH_CALCULUS_V1.md`;
- the three top-level E307 programme addenda.

Recommended internal layers:

1. prior art and two-cycle formulation;
2. bilateral defect/port calculus;
3. semiprime and scalar jet transfer;
4. divisor/norm/genus obstructions;
5. Sondow/E313 interfaces;
6. Giuga-core residual-square constructions and counterexamples;
7. defect block code and complement jet MITM;
8. normalized jet group and prime-jet spectral frontier;
9. bounded diagnostics and failed routes.

### Unit-fraction-neighbourhood corpus

Transfer:

- `UNIT_FRACTION_NEIGHBOURHOOD_MINE_MAP_304_313_V1.md` as the navigation document;
- cross-link the E307/E313 interface files, especially ambient collapse/nonambient transfer, residual-port pencils, paired Sondow diagonal, and defect-spectrum files;
- optionally cross-link `PRIME_SHIFT_HASSE_RECIPROCAL_HYPERGRAPH_CALCULUS_V1.md` as a shared general mechanism, without duplicating authority.

## 10. Curator operating instruction

For canonical realignment:

1. do not merge the whole RL branch into a core corpus;
2. select theorem authority from exact audited packets;
3. attach this frozen RL slice as genealogy and candidate-mechanism provenance;
4. preserve all status labels and supersession links;
5. keep sparse-anchor, GFF, AFT generalization, and E307 in separate candidate/adjacent layers;
6. require E306-DIR disposition before choosing one-anchor versus sparse-anchor as the preferred human proof;
7. require independent source-fidelity audit after MATH-CUR restructures or deduplicates the material.

## 11. Honest final classification

```text
RELEASED E306 THEOREM                    THEOREM-PROVED
REPAIRED MULTIBLOCK ORDINARY PROOF       AUDITED
DENSE ONE-ANCHOR ORDINARY PROOF          AUDITED
SPARSE-ANCHOR ORDINARY PROOF             COMPLETE-AUTHORIAL-CANDIDATE
WEIGHTED AFT GENERAL THEOREM              THEOREM-PROVED / NOT INDEPENDENTLY AUDITED
SMALL-THETA GFF                           COMPLETE-AUTHORIAL-CANDIDATE
SAMPLED-CORE SQUARE-ROOT OBSTRUCTION      METHOD-CLASS-BARRIER
TWO-STEP CONTRACTION OBSTRUCTION          SUPERSEDED / FALSE BY COUNTEREXAMPLE
E307 NORMALIZED-JET TRANSFERENCE          PROVED-ARGUMENT / ADJACENT FRONTIER
E307 EXISTENCE OR NONEXISTENCE            OPEN
```

No theorem assurance, curation authority, main movement, manuscript, Lean, release, DOI, arXiv, publication, or standing-role status is changed by this handoff.