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
- **C2 ✓ Mass window — done, split into 3 nodes, not 1.** Residual mass
  batch `D.Q` selection now lives in three files, each with one motivating
  question, replacing the ~19 original adapter files (a fourth
  abandoned-strategy cluster was found and deleted along the way — see
  "Merged/eliminated outright" below):
  - `Construction/MassPool.lean` — *how is `Q` chosen?* Candidate pool,
    `blockPrimes` density bridge, greedy-selection reduction
    (`R2ConcreteData.exists_residual_subset_recip_window`), forbidden-budget
    bookkeeping. This is the actual C2 mechanism.
  - `Construction/BaseLoadBudget.lean` — *how much load do the other two
    edge sets (control, gadget) spend before `Q` is chosen?*
    Control/gadget disjointness, the dyadic control-load analytic estimate
    (a genuinely separate asymptotic fact from pool selection), the gadget
    cardinality bound. Depends on `MassPool` (for `R2ForbiddenBudget`), not
    the reverse.
  - `Construction/MassBatchSupply.lean` — *once `R2MassBatchSupply` exists,
    what follows for free?* Semiprimality/period-divisibility, the
    `Weights` package consumed directly by `R2Certificates`.
  Consumed by `R2TopAssembly`'s `exists_r2_massBatch` /
  `exists_r2_data_of_numerics_set` / `r2_getQ` (the single downstream entry
  point, called from `R2Certificates`).

  **First attempt at this batch got it wrong**: merged all 12 remaining
  live files into one 1100-line `Construction/MassWindow.lean`, organized by
  "which files feed the same downstream consumer" rather than by
  mathematical mechanism — the exact "mechanism stew" anti-pattern this
  document warns against, repeated one level up instead of avoided. Caught
  by the user, not self-caught; concrete tell in hindsight: two
  near-identical lemmas (`blockSupport_ge_k0`/`blockSupport_ge_pow_k0`,
  from different source files) sat 700 lines apart in the merged file,
  unmerged and unnoticed — proof it was assembled by concatenation, not by
  reading for mathematical content. Re-deriving the 3-way split (by asking
  "what is the one question this content answers") also surfaced dead code
  the mechanical merge had papered over:
  `exists_arcConstruction_of_massBatchSupply` and
  `R2MassBatchSupply.q_pos` had zero live callers (their only caller,
  `R2ComponentSupply.lean`'s `exists_arcConstruction_of_componentSupplies`,
  was deleted in the fourth-cluster sweep but not traced far enough at the
  time), which in turn orphaned `R2MinorSupportBudget.lean`'s
  `exists_arcConstruction_of_component_rho_numeric_minor_budget` — all
  three now removed, `R2MinorSupportBudgetData` (still genuinely live)
  kept.

  One known, deliberately deferred residual redundancy: `blockSupport_ge_k0`
  (`MassPool`) and `blockSupport_ge_pow_k0` (`BaseLoadBudget`) are still
  near-duplicate proofs of the same fact, now in different files for a
  principled reason (different consumers) rather than by accident — a
  genuine micro-cleanup candidate for the reverse-math pass (batch 7).

  `R2ComponentCoreSupply`'s `R2ComponentScaleCoreSupply` struct is NOT
  part of this node at all — it's shared C5/C6 minor-arc content (see C6)
  that had been mis-filed next to the mass-batch family; left where it is,
  to move with C6 if that batch is ever executed.
- **C3 ▽ Weights.** Uniform-window weights from the load window
  (`weights_of_recipLoad_window`, `R2Weights`;
  `R2MassBatchSupply.weights`, `R2MassBatchWeights`). One short node.
- **C4 ✗ Frequency classification — re-examined, merge declined.** Read all
  three files in full before touching anything (per the standing
  discipline). They do not actually share a motivating question:
  `FiberCount`'s CRT fiber-cardinality bound (`mainArc_fiber_card_le`) has a
  single, distinct consumer (`ArcConstructionExtra`) and no code overlap
  with the other two beyond the shared theme of "frequency"; `MainArcFields`
  lives in `R2AssemblyFields` (already distributed into C7/A1) and doesn't
  belong here at all. More importantly, `R2MainArcClassification`
  (`mainArcClassificationData`) is the concrete global-control-main-arc
  instantiation of `R2MinorSupportPipeline`'s abstract
  `R2MinorClassificationData` interface — the same abstract-principle /
  concrete-instantiation shape as `SpectralCannon`/`CannonBridge`. Merging
  it into the file that defines the abstract interface would collapse that
  deliberate split. Declined as a merge candidate; each file already sits at
  the right granularity. (Original grouping was by loose theme, not real
  coupling — the kind of premature-merge risk worth naming explicitly
  rather than executing mechanically.)
- **C5 ✓ Block-minor estimate.** Fiber-tail reindex (P3 instantiation in
  `ArcConstruction`/`ExtraEnergyMinorArc`) + global-control partition ⇒
  `block_part_bound` (`R2MinorEstimateInterface`) ⇒ the `Bblock` budget
  (`R2BlockMinorLane`, 3 escalating theorems) ⇒ shared per-main-arc packaging
  `R2BlockFiberTailData` (`R2MinorEndgameLanes`). Read in full this pass;
  content is already a clean short chain, no smearing found. One node.
- **C6 ✓ Extra-minor estimate — done, split into 4 files by mechanism**
  (applying batch 4's lesson from the start this time — read all 9 files
  fully before writing anything, mapped to distinct motivating questions,
  wrote that many files):
  - `Construction/ExtraGadgetDamping.lean` — given a fixed denominator prime
    and chosen gadget primes, how much do their Fourier factors damp the
    Bernoulli summand? (B5/B2/P2 instantiated: `gadget_charFun_damp` raised
    to the gadget count.)
  - `Construction/ExtraReservoir.lean` — how are per-frequency gadget
    choices packaged into one object and their damping budgets summed,
    independent of how the choices are produced? Depends on
    `ExtraGadgetDamping`.
  - `Construction/ExtraSiblingChoice.lean` — why does a CRT sibling prime
    exist for each extra-minor frequency (`exists_R_mismatch_of_block_eq_not_global`,
    squarefree-CRT mismatch), and how is that choice packaged
    (`Classical.choose`)? Depends on `ExtraReservoir` — it *instantiates*
    the generic prepared-choice constructor with concrete CRT witnesses, a
    real Bourbaki general-to-concrete direction (not the "B feeds D" order
    first guessed before reading the files fully).
  - `Construction/MinorEndgame.lean` — how do the block-minor and
    extra-minor lanes combine into the final minor-support-budget /
    minor-ready record? Two lane shapes
    (`R2MinorEndgameMultiGadgetLanes` direct, `R2MinorEndgameFrequencyLanes`
    reducing to it via `.toMultiGadget`) are a genuine two-step refinement,
    not duplication — confirmed by tracing `R2Certificates.lean`'s actual
    call path (it consumes the frequency-label shape).

  **The flagged `ExtraFrequencyChoiceInt` vs `ExtraFrequencyChoice` risk is
  now resolved, not just noted.** They are not true duplicates:
  `ExtraFrequencyChoiceInt` delegates sibling existence/choice to the
  `Nat`-labelled version via a bridge (`intLabelDataToNat`, converting an
  integer label to its nonnegative residue mod `D.L`), but reproves the
  downstream "prepared choice" step directly on `Int` data instead of
  delegating. This left two `Nat`-specific downstream declarations dead
  (`preparedChoice_of_extraFrequencyLabelData`,
  `r2MultiGadgetReservoir_of_extraFrequencyLabelData` — nothing calls them,
  since only the `Int` path is consumed downstream) — deleted, along with a
  third unrelated dead declaration found by the same trace-every-caller
  sweep (`r2MultiGadgetReservoir_of_pointwise_budget`, a full-pipeline
  convenience wrapper nothing uses).

  Built green on the first attempt — no import-gap fix cycle needed, unlike
  batch 4, evidence the "map mechanisms before writing files" discipline
  works when applied from the start rather than as a correction.
- **C7 ✗ Main-arc numerics and σ-comparison — re-examined, merge declined.**
  Same re-examination as C4, same outcome. `R2NumericFields`
  (`MainArcNumericFields`, single consumer `R2FinalAssembly`),
  `ArcConstructionSigma` (`σ_E ≤ σ_ctrl` from the extra-light bound, single
  consumer `Construction/Edges`), and `R2LargeK0` (pure-`ℕ` exponential-vs-
  polynomial lemmas, single consumer `R2TopAssembly`) are three genuinely
  separate motivating questions — a numeric-fields packaging record, a
  σ-comparison analytic fact, and general-purpose scale arithmetic —
  grouped only by the loose theme "numerics feeding the final assembly."
  `R2LargeK0` additionally states its own reason to stay isolated (its
  docstring: pure `Mathlib` import, "fast to recompile," deliberately no
  project dependencies) — merging it into a heavy project file would
  actively work against that. `ArcConstructionSigma`'s single consumer is
  `Construction/Edges` (C1), but its motivating question — a quantitative
  Gaussian-scale comparison — is not C1's (structural edge-set facts:
  semiprimality/avoidance/divisibility), so single-consumer alone doesn't
  justify folding it in either. Declined as a merge candidate. The
  "k0-largeness facts...parts of `R2TopAssembly`" this node named were
  never isolated to begin with; extracting a coherent chunk from that
  793-line assembly file is real line-level surgery with its own risk
  profile, not a same-pass batch-6 task — left for a dedicated future pass
  if it turns out to matter, not forced here.

### Level 3 — assembly

- **A1 ▽ The certificate chain.** `R2Certificates`' five-stage chain
  (foundation → concrete → mass → main-arc window → minor) is the right
  *shape*. Re-checked both named fixes against the current file:
  (i) **already resolved** — `R2FoundationCertificate` is currently exactly
  the clean two-field join `{ ledger : R2NumericLedger b, bsCert :
  R2BlockSystemCertificate T b ledger }` (`R2Certificates.lean:120-124`),
  not a flat duplicate of both stages' fields. Whatever earlier draft this
  entry described no longer matches the file; no action needed.
  (ii) **closed (2026-07-12, trace executed)** — the five certificate
  stages consume C-node/mechanism entry points; the R2TopAssembly middle
  layer between them and `Construction/MassPool` (`r2_getQ` →
  `exists_r2_data_of_numerics_set` → `exists_r2_massBatch`) is a chain of
  genuine side-condition discharges (k0-largeness, base-load budget,
  forbidden-budget inequality), not pass-through adapters. Verdict: no
  surgery; the residual inline inductions in `r2_getQ` are D2's scope. See
  `docs/global-control-map.md`.
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
4. **(done)** ~~C2 mass-window consolidation~~ — done as *three* files, not
   one (`Construction/{MassPool,BaseLoadBudget,MassBatchSupply}.lean`), by
   mathematical mechanism rather than by shared downstream consumer; see
   the C2 entry above for why one file was rejected mid-execution and what
   it cost to get this "mechanical" batch right anyway. A caution for
   batch 5: "mechanical given this document" describes the *content*
   (nothing left to re-derive mathematically), not the *file count* —
   how many files a node becomes still needs the same few-armed-tree
   judgment applied at consolidation time, not assumed to be "1" by
   default.
5. **(done)** ~~C6 extra-minor consolidation~~ — done as *four* files
   (`Construction/{ExtraGadgetDamping,ExtraReservoir,ExtraSiblingChoice,
   MinorEndgame}.lean`), applying batch 4's lesson from the start: mapped
   to 5 distinct mechanisms before writing anything, built green on the
   first attempt. The `ExtraFrequencyChoiceInt`/`ExtraFrequencyChoice` risk
   item is resolved (not a true duplicate; see C6 above) plus three more
   dead declarations found and removed.
6. **Physical tree + renaming**: create `Construction/`, move the C/A
   nodes, apply `docs/architecture.md`'s naming table (`R2` → resonant
   construction vocabulary), leave `abbrev` shims for one migration
   interval, update `docs/architecture.md`'s module list. `Construction/`
   already exists and holds C2 and C6's nodes; this batch is what remains
   of C1/C4/C5/C7/A1's physical moves plus the naming sweep.
7. **Reverse-mathematics pass**: `#min_imports` every consolidated module;
   strip hypotheses nothing uses (the `Squarefree b` already flagged
   unused in `exists_blockAligned_mass_batch` is the model case); resolve
   the `blockSupport_ge_k0`/`blockSupport_ge_pow_k0` near-duplicate flagged
   in C2.

**(done)** Batches 1–5, plus the full minor-arc and mass-batch discovery
reads (C2, C4–C7 above are all confirmed-clean or
confirmed-dead-and-deleted, no remaining unread files in either region).
Batch 6 (physical tree + renaming) and batch 7 (reverse-math pass) are
next; both are mechanical *at the content level* given this document —
apply batch 4/5's lesson (map before writing) to batch 6's file moves too,
since "which physical folder" is exactly the same kind of judgment as
"how many files."
