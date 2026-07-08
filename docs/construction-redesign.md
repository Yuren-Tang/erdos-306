# The resonant construction: mathematical redesign

This is the macro-level design for replacing the flat `R2*` file family
(plus its circle-method periphery) with a tree that grows from minimal
mathematical motivations, in the sense fixed by `docs/architecture.md`'s
"Proof-graph discipline": every node is either a *principle* (smallest
natural mechanism, no project types) or a *handoff* (one instantiation of a
principle for the next layer), instantiation is single-line, and merges are
few-armed. It was produced by actually reading the code (see
`docs/cleanup-handoff.md` for the survey trail), so each node below lists
the existing declarations that realize it — execution is mechanical given
this map.

## The mathematical content, stated once

For `b ≥ 3` squarefree and a finite obstruction set `T`, we must produce an
`ArcConstruction T b` (`CircleMethodAssembly.lean`): semiprime edges `E`
avoiding `T`, weights `θ_e ∈ [1/3,2/3]` with mass `∑ θ_e/e = 1/b`, a common
period `L`, and a main-arc/minor-arc analysis in which the Gaussian main
term `≍ 1/σ_E` strictly beats the summed minor-arc norms. The spectral
existence principle then produces a subset `S ⊆ E` with `∑_{e∈S} 1/e = 1/b`.

The construction takes `E = ctrl ∪ Q ∪ gadgets`:

- **ctrl**: products of primes from consecutive dyadic blocks — these give
  `σ_E ≍ σ_ctrl` and couple the minor arc to the global-control partition
  theorem via the CRT bijection `h ↔ (h mod p)_p` and the energy identity
  `Q_E(h) = Q_ctrl(a(h))` (per-pair form: `‖h/(pq)‖ = |crtRepr|/(pq)`).
- **Q** (reciprocal-mass reservoir): products of two block primes chosen
  greedily so the total reciprocal load lands in `[3/(2b), 3/b)` — this is
  what lets uniform-window weights realize the exact mass `1/b`. Supply
  comes from the Mertens axiom; feasibility from the base-load bound
  (ctrl+gadget loads `< 3/(4b) + tiny`).
- **gadgets**: `r·s` with `r ∣ b` prime and `s` a huge block prime. They
  damp the *b-fiber siblings*: minor frequencies that agree with a main-arc
  frequency on every block prime but differ mod `b`. Each such `h` differs
  from its label mod some `r ∣ b` (squarefree CRT), so the gadget factor at
  `r·s` has norm `≤ √(1−(8/9)/r²) < 1`; `G ≈ log C` gadgets per `r` beat
  the `(2N+1)·(b−1)` sibling count.

The minor arc `Sm` splits accordingly (disjointized two-set cover):
`Sblock` (block-assignment off the global-control main arc → fiber-tail
estimate, ≤ b frequencies per assignment fiber) and `Sextra` (the b-fiber
siblings → gadget damping).

## Node tree

Nodes marked ✓ already exist in essentially the right shape (possibly in
the wrong file); nodes marked ⊕ are new abstractions that *replace* several
existing proofs; nodes marked ▽ are handoffs whose current realization is
smeared across adapter files and should be re-stated once.

### Level 0 — principles (no project types)

- **P1 ✓ Finite-sum split over a disjointized cover.**
  `sum_le_of_minor_split_bounds` (`R2MinorAssembly`). Generic `α`.
- **P2 ⊕ Subset domination for products of contractions.** If `‖F e‖ ≤ 1`
  on `E` and `‖F e‖ ≤ g e` on `S ⊆ E`, then `‖∏_E F‖ ≤ ∏_S g e`.
  *Replaces three separately-proved instances*:
  `norm_prod_le_pow_of_subset_bound` (`R2ExtraMultiGadget`, constant `g`),
  `norm_prod_le_norm_of_mem` (`R2FourierFactor`, singleton `S`), and the
  inline re-proof of the split in
  `fourierNormWeight_le_multi_gadget_product` (`R2ExtraMultiGadget`, which
  does NOT even call the general lemma sitting directly above it). Also
  subsumes the skeleton of `product_charFun_bound` (`BernoulliFourier`,
  `S = E`). Home: `Core/FiniteProducts.lean`.
- **P3 ✓ Fiber-sum domination for composed sums.**
  `sum_comp_mul_le_of_fiber_sum_le` (`Core/FiniteSums`).
- **P4 ✓ Greedy reciprocal-window selection.**
  `exists_subset_recip_window_strict_upper` (`BlockMassPool`). Generic in
  the target/gap.
- **P5 ✓ Weighted subset entropy.** `weighted_subset_entropy`
  (`GlobalPeierlsBookkeeping`).
- **P6 ✓ Finite spectral existence.** `spectral_existence` (`SpectralCannon`).
- **P7 ✓ Exponential-beats-polynomial thresholds.** `geom_div_pow_tendsto`,
  `beats_affine_of_tendsto` (`Core/Asymptotics`). The three fully-re-proved
  specializations in the same file (`exp1_model_div_succ_pow_tendsto`,
  `exp2_model_div_linear_tendsto`, `exp2_affine_lower`) should become
  one-line compositions or be inlined at their call sites.

### Level 1 — Bernoulli characteristic function theory

One coherent module family (`Bernoulli/` or kept inside `CircleMethod/`),
today spread over `BernoulliFourier`, `CircleMethodArcs`,
`CircleMethodMainArc`, `CircleMethodMainTerm`, `R2FourierFactor`,
`ExtraMinorDamping`:

- **B1 ✓ The function and its modulus.** `bernoulliCharFun`,
  `bernoulliCharFun_normSq(_le)`, plus `bernoulliCharFun_norm_le_one`
  (currently misplaced in `R2FourierFactor`; it is a fact about the
  function, not about R2).
- **B2 ✓ The Fourier-term bridge.** `charfactor_eq` (`CircleMethodArcs`):
  the Fourier-identity factor at `h` equals `bernoulliCharFun θ (h/e)` under
  `e ∣ L`. On top of it, ⊕ one lemma
  `fourierNormWeight_eq_prod_norm : fourierNormWeight E θ b L h = ∏_e ‖bernoulliCharFun (θ e) (h/e)‖`
  — the "phase has norm 1 + rewrite every factor" step currently
  copy-pasted in `minor_arc_norm_le` (`CircleMethodArcs`),
  `fourierNormWeight_le_factor_of_mem` (`R2FourierFactor`), and
  `fourierNormWeight_le_multi_gadget_product` (`R2ExtraMultiGadget`).
  With B2 + P2, all three named lemmas become 2–3-line corollaries.
- **B3 ✓ Minor-arc decay.** `QE`, Jordan bridge
  `sin_sq_pi_ge_four_unitCircleNorm_sq`, `product_charFun_bound_QE`
  (`CircleMethodArcs`).
- **B4 ✓ Main-term Taylor theory.** `bernoulli_log_taylor` →
  `sum_logphi_bound` → `term_label_re_lower` → `main_sum_re_lower`
  (`CircleMethodMainArc`/`MainTerm`). Already a clean L1→L4 chain.
- **B5 ✓ Gadget damping.** `gadget_unitCircleNorm_lower`,
  `gadget_charFun_damp` (`ExtraMinorDamping`). Clean.
- **B6 ✓ CRT energy identity.** `unitCircleNorm_eq_crtRepr_div`
  (`CircleMethodArcs`), the per-pair `Q_E ↔ Q_ctrl` bridge.

### Level 2 — the construction's data and estimates

- **C1 ▽ Edge sets and period.** `gadgetEdges`, `r2Edges`,
  `primeSupportPeriod`, semiprimality/avoidance/divisibility bookkeeping
  (`R2AssemblySkeleton` + `R2ConcreteData`). Right content, two files, fine
  as one node `Construction/Edges.lean`.
- **C2 ✓ Mass window.** P4 → residual window with a spent base load
  (`exists_subset_recip_residual_window`, `BlockMassPool`;
  `exists_residual_subset_recip_window`, `R2ConcreteData`) → block-aligned
  batch from the Mertens axiom (`exists_blockAligned_mass_batch`,
  `BlockMassPool`) → base-load accounting (ctrl-load bound from
  `R2BaseLoadUpper`, gadget-load bound) → `R2MassBatchSupply` construction,
  consumed directly by `R2TopAssembly`'s `exists_r2_massBatch` /
  `exists_r2_data_of_numerics_set` / `r2_getQ` (the single downstream entry
  point, called from `R2Certificates`). Read to completion this pass: a
  whole second abandoned-strategy cluster found and deleted (see
  "Merged/eliminated outright" below) — **7 whole files deleted**
  (`R2MassBatch{Ready,Scale,BaseLoadBudget}`,
  `R2Component{Supply,SupplyReady,MassReady}`, `R2SelectedQReady`) plus
  5 files trimmed to their live core (`R2ForbiddenBaseBudget`,
  `R2MassBatchFinalBudget`, `R2ComponentScaleCard`, `R2ComponentCoreSupply`,
  `R2MassBatchWeights`). What remains genuinely live — `R2MassBatchSupply`,
  `R2MassBatchCandidatePool`, `R2MassBatchPoolSupply`,
  `R2MassBatchFinalBudget` (trimmed), `R2ForbiddenPoolBudget`,
  `R2ForbiddenBaseBudget` (trimmed), `R2BaseLoadUpper`,
  `R2BaseBudgetAssembly`, `R2ComponentDisjoint`,
  `R2ComponentScaleCard` (trimmed), `R2MassBatchWeights` (trimmed to just
  `weights`) — is now a manageable ~11-file group, still worth collapsing
  into one `Construction/MassWindow.lean` (batch 4), but far smaller than
  the ~19 files this doc originally estimated. `R2ComponentCoreSupply`'s
  `R2ComponentScaleCoreSupply` struct is NOT part of this node at all —
  it's shared C5/C6 minor-arc content (see C6) that had been mis-filed
  next to the mass-batch family; keep it where it is or move it with C6,
  not with C2.
- **C3 ▽ Weights.** Uniform-window weights from the load window
  (`weights_of_recipLoad_window`, `R2Weights`;
  `R2MassBatchSupply.weights`, `R2MassBatchWeights`). One short node.
- **C4 ▽ Frequency classification.** `MainArcFields`, `blockMinorPart` /
  `extraMinorPart` cover, the fiber count `≤ b`
  (`mainArc_fiber_card_le`, `FiberCount`), and the concrete classification
  (`R2MainArcClassification`, `R2MinorSupportPipeline`'s
  `R2MinorClassificationData`). One node.
- **C5 ✓ Block-minor estimate.** Fiber-tail reindex (P3 instantiation in
  `ArcConstruction`/`ExtraEnergyMinorArc`) + global-control partition ⇒
  `block_part_bound` (`R2MinorEstimateInterface`) ⇒ the `Bblock` budget
  (`R2BlockMinorLane`, 3 escalating theorems) ⇒ shared per-main-arc packaging
  `R2BlockFiberTailData` (`R2MinorEndgameLanes`). Read in full this pass;
  content is already a clean short chain, no smearing found. One node.
- **C6 ▽ Extra-minor estimate.** Sibling existence
  (`exists_R_mismatch_of_block_eq_not_global`, `R2ExtraCRTSibling`) +
  gadget selection (`ExtraFrequencyChoice(Int)`,
  `ExtraMultiGadget`, `ExtraMultiGadgetReservoir`,
  `ExtraReservoir{Selection,UniformBudget}`) + B5/B2/P2 ⇒
  `R2ExtraMinorMultiGadgetBoundData` (`R2ExtraMultiGadget`) ⇒ the `Bextra`
  budget, consumed by two convergent endgame strategies
  (`R2MinorEndgameMultiGadget` direct, `R2MinorEndgameFrequency` reducing to
  it via `.toMultiGadget` — a legitimate two-step refinement, not
  duplication) ⇒ `R2MinorReadyData` (`R2MinorReady`). *The choice packaging
  is a ~9-file chain of record conversions*; its live content is: choose a
  sibling prime per frequency (`Classical.choose`), choose gadget sets,
  verify the pointwise damping bound, multiply out, package per-frequency
  budgets into the two endgame shapes. One node `Construction/ExtraMinor.lean`.
  Open question found this pass, not yet resolved: `ExtraFrequencyChoiceInt`
  mirrors `ExtraFrequencyChoice` (`Int`- vs `Nat`-labelled) closely enough to
  look collapsible, but the hypothesis transport needs care — medium risk,
  left for whoever executes this batch to verify before merging.
- **C7 ▽ Main-arc numerics and σ-comparison.** `r2_numericFields`,
  `sigmaE2_ge_ctrl`, `r2_main_arc_sigmaE_compare`, the `k0`-largeness facts
  (`R2LargeK0`, parts of `R2TopAssembly`), `σ_E ≤ σ_ctrl` from the
  extra-light bound (`ArcConstructionSigma`). One node.

### Level 3 — assembly

- **A1 ▽ The certificate chain.** `R2Certificates`' five-stage chain
  (foundation → concrete → mass → main-arc window → minor) is the right
  *shape*; two fixes: (i) the foundation stage is stated twice — the
  scaffolding pair `R2NumericLedger`/`R2BlockSystemCertificate` (which is
  the mathematically correct split: scale parameters are chosen before and
  independently of the block system) versus the flat
  `R2FoundationCertificate` that duplicates all their fields; keep the
  split pair as primary and make the flat record their join without field
  duplication. (ii) the stage records should consume the C-nodes'
  single entry points rather than reaching into adapter files.
- **A2 ✓ The interface.** `ArcConstruction` (`CircleMethodAssembly`) —
  already the single consumed record; `Erdos306Final` wires it through
  P6/`CannonBridge` (`exists_subset_of_fourier_arcs`, `repr_of_subset`).

### Merged/eliminated outright

Beyond the C2/C6 adapter chains: the `R2MinorEndgame*` family collapses
into C5+C6's budgets feeding `R2MinorSupportBudgetData` (whose
classification/budget split, `R2MinorSupportPipeline`, is C4+C5/C6's
natural join and stays); `R2Minor{Ready,BudgetNumerics}` and
`R2{Assembly,Numeric}Fields` distribute into C7/A1;
`R2Component{ScaleCard,Disjoint,Numeric*,Bounds}` distribute into C1/C7.

**Third dead cluster found and deleted this pass** (a full parallel
extra-minor strategy from an earlier proof-discovery stage that never got
wired into the live chain, confirmed via exhaustive zero-reference grep
before deletion): `R2FourierFactor.lean` (whole file —
`fourierNormWeight_le_factor_of_mem`, `r2_extra_hfactor_of_gadget_mem`,
`R2ExtraMinorGadgetMemData`, and their consumers) and
`R2ExtraMinorLane.lean` (whole file — the single-gadget-witness budget
path, `R2ExtraMinorWitnessData`). `R2MinorEndgameLanes.lean` and
`R2MinorReady.lean` each had one dead theorem trimmed
(`exists_r2_minorSupportBudget_from_endgame_lanes`,
`exists_r2_minorReady_from_endgame_lanes`) while keeping their live shared
structs (`R2BlockFiberTailData`, `R2MinorReadyData`). This closes the
minor-arc region read: every file in it is now either confirmed live (C4–C7
above) or deleted.

**Fourth dead cluster found and deleted this pass** (the mass-batch group's
own abandoned wrapper-escalation strategy, same shape as the other three:
an "eventual ∃k0min" / "ScaleCard/MassReady/SelectedQ ready" packaging
layer built for a more complex assembly strategy, superseded by
`R2TopAssembly`'s simpler direct construction and never deleted).
**7 whole files deleted**: `R2MassBatchReady.lean`,
`R2MassBatchBaseLoadBudget.lean` (the "eventual" existential wrapper pair —
`R2TopAssembly`'s `exists_r2_massBatch` takes the scale/disjointness facts
directly instead of deriving them via an internal gate);
`R2ComponentSupply.lean`, `R2ComponentSupplyReady.lean`,
`R2ComponentMassReady.lean`, `R2SelectedQReady.lean` (a four-file
"ScaleCard → SupplyReady → MassReady → SelectedQ" escalation for an
`exists_arcConstruction_of_...` variant nothing calls — the live path
builds `R2ComponentScaleCoreSupply` directly and feeds it to
`R2MinorEndgameMultiGadget`/`R2MinorEndgameFrequency` instead, an entirely
different downstream shape); `R2MassBatchScale.lean` (only consumer was
the dead `R2ComponentMassReady.lean`). Plus **5 files trimmed** to their
live core: `R2ForbiddenBaseBudget.lean` and `R2MassBatchFinalBudget.lean`
(one dead theorem each, the tail end of the eventual-wrapper chain);
`R2ComponentScaleCard.lean` (7 of 10 declarations dead — the file mixes
genuinely shared scale lemmas used directly by `R2TopAssembly`/
`R2Certificates` with dead `R2ControlSupply`/`R2GadgetSupply` constructors
for the now-dead `R2ComponentSupply.lean`); `R2ComponentCoreSupply.lean`
(3 of 4 declarations dead — `.toScaleCardSupply`/`.withQ`/
`.toScaleCardSupply_withQ` were only ever called from the now-dead
`R2SelectedQReady.lean`; the base `R2ComponentScaleCoreSupply` struct
itself is live C5/C6 content, kept); `R2MassBatchWeights.lean` (2 of 3
declarations dead — only `R2MassBatchSupply.weights` survives, used
directly by `R2Certificates.lean`). Caught one resulting orphaned import
(`R2TopAssembly.lean` importing the now-deleted
`R2MassBatchBaseLoadBudget.lean` for a transitively-needed `R2BaseLoadUpper`
it already gets via `R2BaseBudgetAssembly`) and three files that needed a
new direct import for what they used to reach transitively through a
deleted file (`R2ComponentScaleCard`, `R2ComponentCoreSupply`,
`R2MassBatchPoolSupply`, `R2MassBatchWeights`) — all fixed and verified by
one `lake build RequestProject.Audit`, same discipline as the third
cluster.

## Execution order (few-build batches)

Each batch ends in exactly one `lake build RequestProject.Audit` (locally
or via CI), per the build-cycle economy this repo needs:

1. **(done, this branch)** Dead alternatives/aliases: `FourierPositivity`
   cluster, `R2MinorReadyArc`, `R2MinorEndgameGadget`, cover-layer
   collapse, `BernoulliFourier` leftovers, alias chain, plus (found in the
   full minor-arc read) the `R2FourierFactor`/`R2ExtraMinorLane`
   single-gadget-witness dead cluster and the two dead endgame-lanes
   theorems, plus (found in the mass-batch read) the seven-file
   `R2MassBatch{Ready,BaseLoadBudget,Scale}`/
   `R2Component{Supply,SupplyReady,MassReady}`/`R2SelectedQReady`
   eventual-wrapper cluster and five partial trims — see "Merged/eliminated
   outright" above.
2. **P2 + B2 unification**: add `Core/FiniteProducts.lean` and
   `fourierNormWeight_eq_prod_norm`; re-derive the three product bounds as
   corollaries; move `bernoulliCharFun_norm_le_one` to `BernoulliFourier`.
3. **A1(i) foundation dedup** in `R2Certificates`.
4. **C2 mass-window consolidation**: write `Construction/MassWindow.lean`
   fresh (move the live theorems, re-prove nothing), repoint `r2_getQ`,
   delete the remaining ~11 adapter files (down from ~19 — the dead
   eventual-wrapper cluster that made up the difference is already gone,
   see batch 1).
5. **C6 extra-minor consolidation**: same method, ~6 files.
6. **Physical tree + renaming**: create `Construction/`, move the C/A
   nodes, apply `docs/architecture.md`'s naming table (`R2` → resonant
   construction vocabulary), leave `abbrev` shims for one migration
   interval, update `docs/architecture.md`'s module list.
7. **Reverse-mathematics pass**: `#min_imports` every consolidated module;
   strip hypotheses nothing uses (the `Squarefree b` already flagged
   unused in `exists_blockAligned_mass_batch` is the model case).

**(done)** Batches 1–3, plus the full minor-arc discovery read (C4–C7
above are now all confirmed-clean or confirmed-dead-and-deleted, no
remaining unread files in that region). Batches 4–6 are mechanical *given
this document* and are the next work; batch 5's one open risk item
(`ExtraFrequencyChoiceInt` vs `ExtraFrequencyChoice` duplication) should be
resolved by whoever executes it, not assumed collapsible without checking
hypothesis transport.
