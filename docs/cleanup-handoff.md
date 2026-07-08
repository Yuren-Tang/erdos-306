# Post-proof cleanup: handoff brief

This is a status + findings brief for whoever picks up the next pass on
`RequestProject/` — in particular a higher-judgment pass (recognizing shared
abstractions, deciding what a confused construction should really look like,
renaming for publication) rather than mechanical execution. It is written to
be read top-down: map first, then anchored findings, then gotchas, then a
suggested order of attack. Ground truth is the code, not this document —
verify anything build-related before acting on it (see "Known gotchas"
below for why that caveat is not boilerplate).

## Readiness for handoff: NOT YET

As of 2026-07-07, this is **not** ready to hand to Fable 5 — there's still
real "read and understand" territory left that a prep pass, not the
judgment-heavy pass, should cover first: the `R2*` minor-arc/extra-frequency
group (2 of ~25 files read), most of the root-level circle-method spine
(`CircleMethodMainArc`/`CircleMethodMainTerm`/`GlobalPeierlsBookkeeping`/`BernoulliFourier`
unread), and the actual mass-batch-group collapse (diagnosed, not executed).
Handing off now would spend Fable 5's tokens rediscovering structure this
pass should surface first. See "Suggested order of attack" for what's left,
roughly in priority order.

## Standard this pass is aiming for

Optimize the result on three axes, in this priority order: mathematics,
engineering, publication/presentation (the last is half-weight — final
external-interface polish will get a dedicated human review pass later).
Secondarily, optimize engineering time and token spend. Respect for past
decisions/docs in this repo is purely instrumental (avoid redoing work) —
none of `docs/architecture.md`, `docs/refactor-roadmap.md`, or this file
should be treated as binding if the actual code and a clear-eyed re-read
disagree with them. Where a whole stretch of code is just a roundabout path
to something that already exists cleanly elsewhere, prefer discarding the
roundabout path over patching it in place.

## Current state (2026-07-07)

- The theorem itself is done: `erdos_306` / `erdos_306_unconditional` is
  sorry-free, published on `main` (`github.com/Yuren-Tang/Erdos-306`,
  release v0.0.3, CI green there). This cleanup pass is entirely post-proof.
- Working branch `codex/pushlinter` is mid-refactor (see
  `docs/refactor-roadmap.md`'s 5-stage plan — Stage A done, B/C/D in
  progress, D is where most of the still-open work concentrates).
- **RESOLVED (commit 9e56025):** the `R2TopAssembly.lean:255`/`:325`
  `ring`/`convert` break was real and pre-existing (reproduced on a
  from-scratch remote CI checkout, not local cache noise), and turned out to
  be exactly the fragile-`convert`-pattern described below — both spots
  rewritten as explicit `calc` chains, no `convert` needed. Fixing it
  unmasked one more small pre-existing bug (`R2Certificates.lean` never
  imported `R2MassBatchWeights.lean`, so `QB.weights` didn't resolve — always
  broken, just never reached because `R2TopAssembly` failed first). Both
  fixed. **Verified end-to-end locally**: `lake build
  RequestProject.Erdos306FormalConjectures` succeeds (8718 jobs, 0 errors),
  `#print axioms erdos_306_unconditional` shows only
  `propext, Classical.choice, Quot.sound` plus the two named structural
  axioms.
- **CI's core `verify` job (the actual sorry-free + axiom-gate check) is
  confirmed green** as of commit 28896321615 (run on 7766e73) — 13m12s, no
  cache/race ambiguity, nothing pushed after it to muddy the signal. Getting
  here took three rounds of finding independent, pre-existing bugs (see the
  "already fixed" list below: the ring/convert break, `ci.yml`'s build-target
  mismatch, `Audit.lean`'s `open GlobalControl` prefix issue) — each one only
  visible by reading the *literal* CI failure output, not by local
  `lake build` success (see "Known gotchas" below, first bullet).
- The secondary `Audit all imports (1-4/4)` and `Lint Lean sources` jobs are
  still failing as of this writing, but every failure seen so far shows the
  actual build/lint completing in full first (`8724/8724` built), then the
  job dying with "the runner has received a shutdown signal" — this is
  because `ci.yml` had no `concurrency` group, so every push spawned its own
  independent full 6-job run with nothing to cancel a stale one once a newer
  commit landed; pushing several commits in quick succession (which happened
  repeatedly this pass) piled up simultaneous runs competing for the runner
  pool. Fixed (commit a265b58, not yet confirmed green) by adding a standard
  `group: workflow-ref` / `cancel-in-progress` block. If this still recurs
  after that fix with commits pushed one at a time, treat it as a genuine
  runner/quota issue, not something to wave away — check `gh run list`
  before assuming either way.

## Map: what's already in reasonable shape vs. what needs work

| Region | Size | Status |
|---|---|---|
| `GlobalControl/*` | 44 files / 4623 lines | Already reorganized by module; imports form a sensible DAG; no orphans found. |
| `LocalEnergy/*` (incl. `DominantLabel/`) | 17 files / ~2400 lines | Same — already reorganized, wiring checked clean (`Definition → Energy → Encoding → {FixedLabel, Threshold → Covering} → ColdRange`). |
| `Core/*` | 14 files / 921 lines | Structurally fine (small, focused files), but see finding 3b below — at least one clear over-specialization pattern. |
| `Spectral/*` | 2 files / 22 lines | Not surveyed beyond size; likely fine given size. |
| `R2*` (flat, root of `RequestProject/`) | 58 files / ~8500 lines | **The concentrated problem area.** Never went through the per-folder reorganization the other regions got. Roughly a third of the whole `RequestProject/` codebase by line count. |

`R2*`'s 58 files break down mathematically into four groups (not yet reflected
in the file layout):
1. Foundation (`R2AssemblySkeleton`, `R2ConcreteData`) — fine as-is.
2. Residual reciprocal-mass-batch selection (~11 files now, down from ~19:
   `R2MassBatch*`, `R2Forbidden*`, `R2BaseLoadUpper`/`R2BaseBudgetAssembly`,
   `R2ComponentDisjoint`/`R2ComponentScaleCard` (trimmed)) — **now fully
   read and the dead half already deleted this pass**, see finding 3c.
   Still the next consolidation target (batch 4), just a much smaller one.
3. Minor-arc / extra-frequency damping estimate (~25 files: `R2Minor*`,
   `R2Extra*`, `R2BlockMinorLane`) — **now fully read** (see
   `docs/construction-redesign.md` C4–C7). Unlike group 2, this group is NOT
   mostly adapter shell — the live content (`R2ExtraCRTSibling.lean`'s
   squarefree-CRT mismatch argument, `R2ExtraMultiGadget.lean`'s product
   damping) is genuine, reasonably well-organized math. It did have the
   *abandoned-alternative-strategy* problem in three separate places, all
   confirmed dead by the zero-reference check and deleted:
   `R2MinorEndgameGadget.lean` (single-gadget damping), `R2MinorReadyArc.lean`
   (an abandoned `exists_arcConstruction` endpoint), and — what first looked
   like a "legitimate two-generation API bridge" but on full read turned out
   to be entirely dead — `R2FourierFactor.lean` + `R2ExtraMinorLane.lean`
   (the single-gadget-witness budget path, `R2ExtraMinorWitnessData` →
   `R2ExtraMinorGadgetMemData`; superseded by the multi-gadget chain in
   `R2ExtraMultiGadget.lean`). The remaining `R2MinorEndgame*` family
   (`Frequency`, `MultiGadget`) is NOT a dead-strategy duplicate despite the
   similar naming — `R2MinorEndgameFrequency` genuinely reduces to
   `R2MinorEndgameMultiGadget` via `.toMultiGadget` (a real two-step
   refinement), both are live and consumed by `R2Certificates.lean`.
4. Final numeric closure and assembly (~8 files: `R2NumericFields`,
   `R2AssemblyFields`, `R2LargeK0`, `R2FinalAssembly*`, `R2TopAssembly`,
   `R2Certificates`).

## Anchored findings

### Already fixed (mechanical, done this pass, no judgment needed from here)

- Dead pre-R2 placeholder chain deleted: `FourierPositivity.lean` +
  `CrossLabelEnergy.lean` (root copy, not the live `LocalEnergy.CrossLabelEnergy`)
  + `LatticeSpan.lean` + `SemiprimeInfinity.lean` — superseded when the R2 arc
  construction closed and `Erdos306Final.lean` re-derived the chain against it
  (suffix `_R2`) instead of patching the old placeholder-based theorems in place.
- `R2ConcreteData.lean`: deleted 8 `r2Concrete_*` free-function duplicates of
  the `namespace R2ConcreteData` dot-notation methods directly above them,
  plus an unused `R2ConcreteWeights` alias — pure copy-paste, zero callers anywhere.
- `R2MinorReadyArc.lean`: one confirmed-dead parallel `exists_arcConstruction`
  endpoint (an abandoned alternative to the one actually wired into
  `R2Certificates.lean`), deleted after empirical build verification (not just
  static analysis — see gotcha below).
- `R2TopAssembly.lean`: fixed the real CI-blocking `ring`/`convert` break
  (see "Current state" above); unmasked and fixed a second pre-existing bug
  (`R2Certificates.lean` missing an import). Whole project now builds
  end-to-end (`Erdos306FormalConjectures`, 8718 jobs) with the expected axiom
  set.
- `.github/workflows/ci.yml`: fixed a genuine, independent CI-workflow bug —
  the "Build" step only built `RequestProject.Erdos306FormalConjectures`,
  but the next step (`lake env lean RequestProject/Audit.lean`) needs
  `RequestProject.Public.Erdos306` (an outward-facing facade that imports
  the FormalConjectures chain, so it sits outside that chain's own
  dependency closure). `lake env lean` doesn't auto-build missing
  dependencies, so that `.olean` genuinely never existed going into the
  step — reproduced identically on every run/rerun. (Initially misdiagnosed
  as a cache-key race between this workflow's 5 parallel jobs sharing one
  cache-save key, since a "Failed to save... another job may be creating
  this cache" warning appears right before the real error every time —
  that warning is real but unrelated.) Fix: build `RequestProject.Audit`
  instead, which covers everything downstream needs.
- `RequestProject/Audit.lean`: a third independent, pre-existing CI bug,
  found only after the previous two fixes let CI get this far: the file had
  `open Erdos306 GlobalControl`, which makes Lean's pretty-printer drop the
  `GlobalControl.` prefix from `#print axioms erdos_306`'s output (in-scope
  names print unqualified). `ci.yml`'s gate script greps for the
  fully-qualified axiom names exactly, so it reported both as "missing"
  even though they were right there, just unprefixed — and this reproduced
  locally too (same `open`), it just wasn't being checked against the gate
  script's literal string match when verifying locally. Fixed by dropping
  `GlobalControl` from the `open` and printing the two axioms via their
  fully-qualified names directly.
- `R2MinorEndgameGadget.lean`: another confirmed-dead abandoned strategy
  (single-gadget damping, superseded by frequency-lanes/multi-gadget),
  deleted after both a zero-importers and zero-content-references check.
- `.github/workflows/ci.yml`: added a `concurrency` group (see "Current
  state" above) so overlapping pushes stop racing each other's CI runs.
- Two dependent-rewrite/defeq breaks fixed (`R2ExtraFrequencyChoice.lean`'s
  `hm_r` field, `R2MassBatchPoolSupply.lean`'s `withQ` unfolding) plus one
  regression this pass introduced and then fixed (`R2MinorEstimateInterface.lean`).
- **Full minor-arc/extra-frequency group now read to completion** (all ~25
  files; see `docs/construction-redesign.md` C4–C7 for the confirmed map).
  Found and deleted a third dead parallel strategy from an earlier
  proof-discovery stage, same pattern as `R2MinorReadyArc.lean` and
  `R2MinorEndgameGadget.lean` above: `R2FourierFactor.lean` and
  `R2ExtraMinorLane.lean` (both whole files — an abandoned
  single-gadget-witness extra-minor budget path, confirmed zero references
  anywhere outside their own mutually-dead cluster) deleted outright;
  `R2MinorEndgameLanes.lean` and `R2MinorReady.lean` each had one dead
  theorem trimmed while keeping their live shared structs
  (`R2BlockFiberTailData`, `R2MinorReadyData`). Verified via
  `lake build RequestProject.Audit` before committing, per the gotcha below.
  Everything else in the group (C4 classification, C5 block-minor, C6
  extra-minor's live multi-gadget/frequency chain, C7 numerics) read clean —
  no more smearing found beyond what's already flagged in 3c/batch 4-5 below.

### 3b. Over-specialization instead of composing the general lemma (Core)

`RequestProject/Core/Asymptotics.lean` has two genuinely general, clean
lemmas — `geom_div_pow_tendsto` (rⁿ/nᵐ → ∞ for any `r > 1`) and
`beats_affine_of_tendsto` (a generic "eventually beats any affine function"
wrapper from a `Tendsto` fact) — followed by three fully-reproved specific
instances (`exp1_model_div_succ_pow_tendsto`, `exp2_model_div_linear_tendsto`,
`exp2_affine_lower`) that just plug in concrete constants (`r=2`, `r=4`,
an index shift by 1, `2^(2k) = 4^k`) with a full second copy of the
`.comp`/`.congr'`/`field_simp`/`ring_nf` proof machinery, instead of a
one-line composition at each call site. Likely collapsible to nothing (call
the two general lemmas directly wherever the specific ones are currently
used — probably inside the R2* large-`k0` parameter chase; call sites not
yet traced).

### 3c. Clean abstraction already exists elsewhere; shell around it should go (R2 mass-batch)

`RequestProject/BlockMassPool.lean` (NOT part of the `R2*` file family) is a
clean, Bourbaki-shaped development: a fully general greedy-subset-selection
lemma (`exists_subset_recip_window_strict_upper` / `exists_subset_recip_window`,
pure finite-combinatorics, no primes/blocks involved) → one natural
specialization with a fixed base already spent
(`exists_subset_recip_residual_window`) → the one domain-specific
instantiation (`exists_blockAligned_mass_batch`, using the Mertens axiom).
`R2ConcreteData.lean`'s own `exists_residual_subset_recip_window` is a clean
second-level instantiation of the same general lemma (fixing the R2 window
bounds) — this part is fine.

Downstream of that, ~19 `R2*` files built a long chain of small
"socket"/"ready"/"budget" adapter structures on top of this. **Now fully
read and resolved this pass** (was previously a "first attempt found it
more tangled than it looks, needs full read" open item — that full read
has now happened): the chain splits cleanly into two parts once you trace
actual callers instead of just import shape. `R2TopAssembly.lean`'s
`r2_getQ`/`exists_r2_data_of_numerics_set`/`exists_r2_massBatch` reach
directly into `R2BaseLoadUpper`, `R2BaseBudgetAssembly`,
`R2ComponentDisjoint`, the live parts of `R2ForbiddenBaseBudget` and
`R2MassBatchFinalBudget`, and (via `R2MassBatchCandidatePool`/
`R2MassBatchPoolSupply`) the pool-selection theorems above — this part is
genuinely live and needed. But a second, entirely separate escalation
chain built for a *different, more complex* assembly strategy
(`R2MassBatchReady`/`R2MassBatchBaseLoadBudget`'s "eventual ∃k0min"
existential wrapper, and `R2ComponentSupply`/`R2ComponentSupplyReady`/
`R2ComponentMassReady`/`R2SelectedQReady`'s "ScaleCard → SupplyReady →
MassReady → SelectedQ" packaging escalation) turned out to have **zero
live callers anywhere** — confirmed by tracing every declaration's callers
by hand, the same discipline used for the minor-arc dead clusters. Deleted
outright: 7 whole files. Trimmed to their live core: `R2ForbiddenBaseBudget`,
`R2MassBatchFinalBudget`, `R2ComponentScaleCard`, `R2ComponentCoreSupply`,
`R2MassBatchWeights` (each had one or more dead declarations mixed in with
genuinely live ones — see `docs/construction-redesign.md`'s C2 node for
the exact split). One real bug this surfaced: `R2ComponentCoreSupply.lean`'s
base struct `R2ComponentScaleCoreSupply` is actually live *C5/C6 minor-arc*
content (consumed by `R2MinorEndgameMultiGadget`/`R2MinorEndgameFrequency`),
mis-filed next to the mass-batch family — its own `.toScaleCardSupply`/
`.withQ` methods were the dead part.

**Batch 4 done, but not on the first attempt.** The remaining ~11-file
mass-batch group got merged into one 1100-line `Construction/MassWindow.lean`
first, organized by "these all feed the same downstream call" rather than
by mathematical mechanism — the user caught this immediately as a "一鍋粥"
(porridge) and it was: two near-identical lemmas
(`blockSupport_ge_k0`/`blockSupport_ge_pow_k0`) ended up 700 lines apart in
the merged file, unmerged and unnoticed, which is the concrete tell that
concatenation happened instead of reading for content. **Lesson for the
remaining batches**: "mechanical given the redesign doc" describes the
*mathematical content* (nothing left to re-derive), not the file count —
how many files a node splits into still needs the same "ask what single
question this content answers" judgment applied at write time, every time,
not defaulted to one file per doc-node. Re-split into three files by
mechanism (`Construction/MassPool.lean` — how `Q` is chosen;
`Construction/BaseLoadBudget.lean` — how much load the *other* two edge
sets spend first; `Construction/MassBatchSupply.lean` — what follows once
`R2MassBatchSupply` exists) — see `docs/construction-redesign.md`'s C2 for
the full rationale. Doing the split properly also surfaced a fifth dead
fragment the mechanical merge had hidden:
`exists_arcConstruction_of_massBatchSupply`, `R2MassBatchSupply.q_pos`, and
`R2MinorSupportBudget.lean`'s
`exists_arcConstruction_of_component_rho_numeric_minor_budget` were all
dead — orphaned when `R2ComponentSupply.lean` was deleted in the batch-3
sweep but not traced far enough at the time. Now removed.

### Flagged, unresolved, needs judgment (not attempted)

- `GlobalControl.BlockVarianceComparison` (`sigmaP_block_le`,
  `sigmaP_sq_eq_internal`) vs `GlobalControl.ControlVarianceBounds` — two
  routes to what looks like the same kind of "block deviation vs global
  deviation" fact; `BlockVarianceComparison`'s version is unused and more
  tactic-heavy (`grind +qlia`-style). Possibly redundant, possibly genuinely
  different — not verified either way.
- `GlobalControl.Encoding.TotalEntropy` — `docs/architecture.md` documents
  it as load-bearing target architecture, but nothing currently imports it.
  Looks more like an unfinished migration wire-up than dead code (the
  aggregate `GlobalControl.lean`'s own docstring still lists
  `BlockVarianceComparison` too, contradicting an earlier roadmap note that
  claimed the aggregate "only re-exports Partition" — that roadmap claim is
  stale, corrected in this pass, see the refactor-roadmap.md diff).

### A positive exemplar: the circle-method spine is already close to the target standard

`SpectralCannon.lean`'s `spectral_existence` is a genuinely clean, maximally
general finite-spectral existence principle — fully decoupled from
primes/semiprimes/anything project-specific (abstract types `J`, `Ω`, `X`;
a spectral representation hypothesis; a low-frequency-mass-beats-high-frequency-tail
conclusion). `CannonBridge.lean` is exactly the right shape of bridge:
define the concrete spectral data (`cannonChar`, `cannonB`, `cannonF`), prove
the correspondence with the project's own notions (`cannonF_eq_fourierTerm`),
then instantiate the general theorem (`exists_subset_of_fourier_arcs`) and
convert to the domain conclusion (`repr_of_subset`). `CircleMethod.lean` is
a small, independent, self-contained bridge lemma (`fourier_indicator`).
**This is the target Bourbaki shape** (general principle → concrete bridge →
domain instantiation) already realized somewhere in this codebase — worth
pointing Fable 5 at directly as the model to hold the rest of `R2*` to,
rather than only describing the target in the abstract.
`CircleMethodMainArc.lean`/`CircleMethodMainTerm.lean`/`GlobalPeierlsBookkeeping.lean`/
`BernoulliFourier.lean` not yet read — worth checking whether they hold to
the same standard or look more like the `R2*` shape.

### Not yet surveyed

- `CircleMethodMainArc.lean`, `CircleMethodMainTerm.lean`,
  `GlobalPeierlsBookkeeping.lean`, `BernoulliFourier.lean` (read
  `SpectralCannon.lean`/`CannonBridge.lean`/`CircleMethod.lean` this round,
  see exemplar note above — the rest of the circle-method spine is still open).
- The two axioms in `AnalyticInputs.lean`: `pnt_dyadic_prime_density` is
  Chebyshev-strength and *might* be provable outright from Mathlib's existing
  `NumberTheory/Chebyshev.lean` + `NumberTheory/Bertrand.lean` (which has the
  central-binomial-coefficient machinery, but only proves prime *existence*
  in a doubling range, not a *count* — turning it into a count bound is a
  real, self-contained, classical formalization project). `mertens_dyadic_window_mass`
  has no Mathlib support at all (confirmed by search) and must stay a cited
  external axiom, but currently bakes project-specific numerology (`21/20`,
  the `[k0,3k0]` window) into the axiom statement itself rather than citing
  the primitive Mertens asymptotic and proving the numerology as a Lean
  corollary — matches `docs/refactor-roadmap.md` Stage A's already-planned
  but not-yet-done "bridge layer." Per explicit user direction, neither is a
  current priority — noted here only so it isn't rediscovered from scratch.

## Known gotchas (read before touching more of R2*)

- **"Consolidate this node into one file" is not a license to concatenate.**
  Batch 4's first attempt merged 12 files into one 1100-line
  `Construction/MassWindow.lean` because they all fed the same downstream
  caller — a "which files feed the same consumer" grouping, not a
  "what mathematical question does this content answer" grouping. That is
  the exact "mechanism stew" anti-pattern `docs/construction-redesign.md`
  warns against, just re-committed one level up (whole-node instead of
  single-adapter-file). The tell that this had happened, in hindsight: two
  near-duplicate lemmas from different source files ended up 700 lines
  apart in the merged file, unnoticed. **Before writing a consolidated
  file, ask "how many distinct motivating questions does this content
  answer" and write that many files** — a doc node like C2 is a unit of
  *mathematical content*, not a mandate for exactly one physical file.
  Splitting properly (by mechanism, not by history) also tends to surface
  additional dead code that a mechanical merge papers over, because
  reading for the actual motivating question forces tracing what each
  piece is really for.
- **"Builds with zero errors" is not the same as "passes CI's actual
  checks."** All three of the CI-blocking bugs found and fixed this pass
  (the `ring`/`convert` break, the `ci.yml` build-target mismatch, and
  `Audit.lean`'s missing-prefix printing) were only found by reading CI's
  literal failure output, not by local `lake build` success — the last one
  in particular printed identically both locally and in CI, and only failed
  because `ci.yml`'s gate script does an exact string match against output
  that a local run never checked that precisely. When "it builds clean
  locally" and "CI is still red" disagree, don't assume the CI failure is
  infrastructure noise (cache races, flakiness) until you've actually read
  what the failing CI step's script is checking for and compared it
  character-for-character against local output.
- **Static reachability/dead-code heuristics have real false positives on
  this codebase.** A declaration-level "is this reachable from `erdos_306`"
  script (regex-based, checking which declared names' bodies textually
  reference which other declared names) looked convincing but had several
  false positives when checked against an actual build — genuinely
  load-bearing declarations it flagged as dead. Root causes seen: references
  living in a *different* declaration in the same file than the one the
  script attributed the reference to; multi-line signatures it didn't parse
  correctly. **Treat any such script's output as a lead to verify by
  building the actual downstream closure, never as grounds for deletion on
  its own.** `lean/scripts/dep_graph.py` (added this pass) does the same
  kind of file-level static analysis and inherits the same limitation —
  it's useful for orientation (import hubs, coarse reachability) but not a
  deletion oracle.
- The `R2TopAssembly.lean:255`/`:325` `ring`/`convert` failures (now fixed,
  see above) were real and reproduced on a clean CI checkout — not a caching
  artifact, despite looking exactly like one at first (this pass burned
  real time confirming that before concluding it was genuine). The general
  shape worth remembering: `convert foo using 1; ring` (single semicolon,
  not `<;>`) is fragile whenever `convert` produces more than one goal —
  only the first goal gets `ring`, the rest are silently left unsolved or
  `ring` is run against the wrong goal. Prefer an explicit `calc` chain over
  `convert ...; ring` in general; it's not meaningfully longer and doesn't
  silently break when Mathlib's exact lemma shape shifts.
- Local machine is memory/compute constrained. A single `lake build` of one
  file's dependency closure can take several minutes; prefer
  `lake env lean <file>` for fast single-file iteration once dependencies
  are already built, and lean on remote CI (a clean checkout every time,
  no local-cache ambiguity) for full-closure verification rather than
  repeated local full rebuilds.
- A dependent-type rewrite that fails with "motive is not type correct"
  (typically: rewriting a `let`-bound term that appears inside a `ZMod`
  modulus or similar dependent position) has a standard robust fix:
  `clear_value` the `let`-bound name first (turning it into an opaque local
  constant) so the subsequent `rw` no longer fights the unfolding. Plain
  `rw [dif_pos h]`, `show ... ` (defeq), and `simp only [defn, dif_pos h]`
  all failed on one such case in `R2ExtraFrequencyChoice.lean` before
  `clear_value` + `rw` worked cleanly and robustly.

## Tools available

- `lean/scripts/dep_graph.py` — reads `import RequestProject.*` lines as
  plain text (no build needed), reports reachability from a root module,
  import hubs, and per-module sorry/axiom/line counts. Run from `lean/`:
  `python3 scripts/dep_graph.py [root_module]`. See gotcha above on its limits.
- `lean/scripts/audit_imports.sh` — build-time redundant-import /
  `#min_imports` audit per file (needs a green build to be useful).
- `.github/workflows/lean-graph.yml` — manual (`workflow_dispatch`)
  declaration-level dependency graph extraction via CI; requires
  `RequestProject.Erdos306FormalConjectures` to build first, so currently
  blocked on the `R2TopAssembly.lean` break above.

## Suggested order of attack

Following the "repair the earliest non-clean confluence, don't skip ahead to
polish a downstream bridge" discipline already in `docs/refactor-roadmap.md`:

1. ~~Fix the real `R2TopAssembly.lean:255`/`:325` break~~ — done (commit
   9e56025). The `.github/workflows/lean-graph.yml` declaration-level
   dependency-graph tool should now be unblockable if useful.
2. ~~Read the ~26-file minor-arc/extra-frequency group the same way this
   pass read the mass-batch group~~ — done, see `docs/construction-redesign.md`
   C4–C7 and the "Already fixed" entry above for the resulting map and the
   third dead cluster it turned up.
3. Collapse the mass-batch (~11 files, down from ~19 — see finding 3c: the
   dead half of the group is already deleted this pass) and minor-arc
   (~9 files feeding `Construction/ExtraMinor.lean`, per
   `docs/construction-redesign.md` C6) groups by mathematical role rather
   than pipeline-stage — this is where the real Bourbaki-style win is:
   identify the true minimal mechanism(s) each group is really computing,
   state them at their natural generality once, and discard the remaining
   per-stage adapter files. No further judgment calls needed first — both
   groups are now fully read and mapped; this is mechanical execution
   given `docs/construction-redesign.md`.
4. Apply the naming policy already written in `docs/architecture.md`
   (`R2`/`gadget`/`lane`/`supply`/`certificate` → mathematical names) as part
   of the same pass, not as a separate renaming sweep — renaming without
   also fixing the structure just moves the mess.
5. Survey and apply the same treatment to the root-level circle-method files.
