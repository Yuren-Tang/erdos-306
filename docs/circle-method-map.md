# The circle-method stream: complete map and unification design

Date: 2026-07-09. Author: Fable 5 pass, full read of all 17 core files (~2400 lines).
Companion to `docs/r2-numeric-abstraction.md` (the R2 numeric-chase cleanup) and
`docs/construction-redesign.md` (the R2 construction nodes).

## 1. The map (as it actually is)

```
LEVEL 0 — abstract existence principle (no project types)
  spectral_existence                          [SpectralCannon.lean]
    finite J (coordinates), Ω (frequencies), X (values); weights p (not even
    required to be probabilities); spectrally-represented indicator +
    coordinate factorization + (L,H) split with Re∑_L F ≥ M, tail ≤ R < M
    ⇒ ∃ configuration hitting the target.

LEVEL 1 — Fourier instantiation on ℤ/L (generic in E, θ, b, L)
  fourierTerm                                 [CircleMethodMainTerm.lean]
  cannonChar/cannonB/cannonF, charsum_orth,
  cannon_tail_pointwise (Δ/Ktail slack),
  decode_subset_sum,
  exists_subset_of_fourier_arcs  ← THE junction to level 0
  repr_of_subset                              [CannonBridge.lean]
  fourier_indicator (no-wraparound decode)    [CircleMethod.lean]

LEVEL 2a — main-arc analysis (generic in E, θ, b; no BlockSystem)
  bernoulliCharFun, normSq, contraction       [BernoulliFourier.lean]
  bernoulli_log_taylor  (THE Taylor leaf: constant 100000 at radius 1/10,
    window [1/3,2/3]; internal chain 8,13,9,80,21,114,512,1680,729,10,
    1000,99000 all leaf-internal)             [CircleMethodMainArc.lean]
  term_label, term_label_re_lower (0.8 = 1 − 2·(1/10): DERIVED from the
    budget target, not independent), main_re_lower, main_sum_re_lower
                                              [CircleMethodMainTerm.lean]
  main_arc_gaussian_lower (e^{−π²/2}/2/σ: half the window [0,⌊1/(2σ)⌋]
    at the worst Gaussian value; π²/2 = 2π²σ²m² at σm ≤ 1/2)
                                              [CircleMethodArcs.lean]
  hterm periodicity core, exists_mainArc_bijection
                                              [ArcConstruction.lean (file)]

LEVEL 2b — minor-arc analysis (couples to the GlobalControl CRT stream)
  product_charFun_bound (ALREADY parametric in θ₀: rate 2θ₀(1−θ₀))
                                              [BernoulliFourier.lean]
  QE, Jordan bridge sin²(πx) ≥ 4‖x‖², product_charFun_bound_QE (rate
    8θ₀(1−θ₀); 16/9 = its value at θ₀ = 1/3, instantiated at the junctions)
  Qctrl_freq_eq (per-pair CRT identity ‖h/pq‖ = |crtRepr|/pq)
                                              [CircleMethodArcs.lean]
  ctrlEdges, QE_ge_Qctrl                      [ArcConstruction.lean (file)]
  minor_energy_sum_le_fiber_tail, minor_arc_bound_fiber_tail
    (the ONE live minor-arc ladder)           [ExtraEnergyMinorArc.lean]
  ← global_control_partition                  [GlobalControl/Partition.lean]
    (the summit of the other stream: CRT energy ⇒ off-arc mass bound)

LEVEL 3 — the interface record
  ArcConstruction (record)                    [CircleMethodAssembly.lean]
  consumed by R2FinalAssemblyRaw/R2FinalAssembly/Erdos306Final via
  exists_subset_of_fourier_arcs + main_sum_re_lower.
```

Confluences (junction points, each a deliberate two-stream meeting):
- `exists_subset_of_fourier_arcs`: level-1 Fourier data ⊗ level-0 principle.
- `hQE`/`Qctrl_freq_eq`: circle-method energy ⊗ GlobalControl CRT energy.
- `θ₀ := 1/3` in the two `_fiber_tail` theorems: parametric decay ⊗ the θ-window choice.
- `r2_numericFields`: R2 numeric chase ⊗ the core's Taylor budget (100000, 1/10).

## 2. Verdicts

**V1. The cannon is already at the right abstraction.** `spectral_existence` has no
project types, no probability assumption, and one clean M>R interface. Do not touch.

**V2. Dead ladder (grep-verified 2026-07-09, zero external consumers):**
`minor_energy_sum_le` + `minor_arc_bound` (injective; CircleMethodArcs.lean) and
`minor_energy_sum_le_mult` + `minor_arc_bound_mult` (M-to-1; ArcConstruction.lean file)
are superseded by the fiber-tail pair (with `Qextra := QE − Qctrl ≥ 0`, `K := M` the
fiber-tail recovers `_mult`; with injectivity it recovers the plain one). Delete all
four; the fiber-tail pair is the single node. (Executed in this pass.)

**V3. File organization (mechanical, delegatable):**
- The `ArcConstruction` *record* lives in `CircleMethodAssembly.lean` while the *file*
  `ArcConstruction.lean` holds ctrl-edge/CRT/periodicity material — misleading pair.
- `Spectral/Selection.lean` and `Spectral/CircleMethodBridge.lean` are self-declared
  temporary re-export stubs for `SpectralCannon`/`CannonBridge`.
Plan: move content into the `Spectral/` names, retire the stubs and the old names;
rename the `ArcConstruction.lean` file by its real content (control edges + CRT
main-arc identities), leave the record where the assembly is. Pure moves, no proofs.

**V4. The Taylor interface CAN be made parametric (the real remaining abstraction).**
All of `100000`, `1/10`, `0.8`, and `r2MinorMainCtrlConstant = 0.8·e^{−π²/2}/2` trace
to exactly two seeds: the Taylor radius `ρ = 1/10` and the θ-window `[1/3, 2/3]`
(`100000` is the leaf-proof's honest crude constant at those seeds; `0.8 = 1 − 2δ`
with budget target `δ = 1/10`; `e^{−π²/2}/2` is the Gaussian window constant, genuinely
structural). Design:
  - Leaf supply: `∃ cT, ∀ θ ∈ [1/3,2/3], ∀ |t| ≤ 1/10, ‖log φ_θ(t) − (2πiθt −
    2π²θ(1−θ)t²)‖ ≤ cT·|t|³` (witness 100000 inside; the 1/10 radius and window stay
    as the mechanism's stated regime — they are design constants of the weight model,
    like the load windows; see V6).
  - Thread `cT` (abstract) through `sum_logphi_bound → term_label_re_lower →
    main_re_lower → main_sum_re_lower → ArcConstruction.hsmall →
    MainArcNumericFields.hsmall → r2_numericFields → r2_close_numericFields →
    R2NumericLedger.hk0cubicFact` (replacing the literal 100000·10 product there).
  - `0.8` becomes `1 − 2δ` with `δ` the budget field (kept at 1/10 by the ledger).
  This eliminates the last hard-coded analytic constants from all *statements* between
  the Taylor leaf and the ledger. Medium-size, touches the published ArcConstruction
  record's field types (safe: `erdos_306`'s statement is downstream and unchanged).

**V5. General target (the "for all admissible t" strengthening — cheap, real math gain).**
The core currently hard-codes target `1/b` (phase `e(−m/b)`, decode to `∑1/e = 1/b`,
mass `∑θ/e = 1/b`). Inspection of every use shows the mechanism only needs:
target residue `t` with `0 ≤ t < L` (no-wraparound), mass identity `∑_E θ_e·(L/e) = t`
(as the linear Taylor term pins the phase), and the decode equivalence
`L ∣ (∑_S L/e − t) ↔ ∑_S L/e = t`. Generalizing `fourier_indicator`,
`term_label`, `sum_logphi_bound`, `exists_subset_of_fourier_arcs` from `L/b` to
abstract `t` is nearly verbatim and yields the user's "arbitrary admissible target"
form of the core: *E ⊂ ℕ, w_e = L/e, adequate weights + spectral window ⇒ every
admissible t is hit*. The R2 side keeps instantiating `t := L/b`. This makes the
core reusable beyond unit fractions (e.g. arbitrary `a/b` targets) at essentially
zero proof cost. Recommended to do TOGETHER with V4 (same files, one build cycle).

**V6. Numbers that stay (structural, documented):**
- `2/9`, `16/9`, `8/9`, `8θ₀(1−θ₀)`, `e^{−π²/2}/2`, Jordan's `4`, `k+1 ≤ 2k`'s 4.
- θ-window `[1/3,2/3]`, Taylor radius/budget `1/10`: design constants of the weight
  model (analogous to the mass-load windows), stated once at the mechanism.
- Load windows `3/(4b), 3/(2b), 3/b` and `b ≥ 3`: the mass-architecture design (the 3
  interlocks with `b ≥ 3` to give `∑1/e < 1` = no-wraparound). Document, don't abstract.
- `5 ≤ k` in the two analytic axioms: anchor of the axiomatized inputs; untouchable.

**V7. Remaining witness bundles (mechanical by the established ledger pattern,
delegatable with this spec):**
- `hk0big : 1000·G + 1000·b + 100000 ≤ BS.k0` (R2Certificates/BS-cert) and its
  consumers `r2_getQ`/`exists_r2_data_of_numerics_set` (R2TopAssembly): wrap as an
  existential threshold leaf (`∃ k0mass, ∀ …`) exactly like
  `exists_edge_square_load_supply`; ledger field `k0mass` + fact; BS-cert domination
  `k0mass ≤ k0`; witnesses (1000, 100000, and r2_getQ's inline `k0³·2 < 2^k0`-style
  inductions — replace with `exists_threshold_mul_pow_le_two_pow`) go leaf-internal.
- `max (max k0min 5) (b+1)` inside `exists_r2_foundation_dyadic`: already leaf-internal.
- `sigmaCtrl_le_one`'s `2 ≤ k0` / `hk05`: threshold already carried by `hk05`; fine.

## 3. Execution state and order

- [x] V2 dead-ladder deletion (Fable pass, commit `f8ed0fb` landed it).
- [x] V5 general target — done (Codex pass, `9f05ff4`/`eb5bf7d`):
      `Spectral/CircleMethodBridge.exists_subset_of_fourier_arcs` now concludes
      `∑_S 1/e = q/L` for an arbitrary admissible residue `q`; the `ArcConstruction`
      record stays instantiated at `q := L/b` — the junction in the right place.
- [x] V4 Taylor parametrization — complete (Codex passes,
      `86fbda3`..`d30ab88`): roles named in `Spectral/MainArcParameters.lean`
      (`bernoulliTaylorRadius`, `bernoulliMainTermRemainderBudget` — genuine design
      constants, correctly kept concrete; `bernoulliMainTermRetention = 1 − 2·budget`,
      `bernoulliMainTermConstant` — correctly derived) and threaded through the whole
      spine (record fields, R2 chase, ledger). D1 completed the last caveat: the
      explicit estimate is now private to `CircleMethodMainArc`; the public constant
      is selected from the existence theorem with `Classical.choose`, and downstream
      statements use only its nonnegativity and Taylor specification.
- [x] V3 circle-method file moves — done (Codex pass): `SpectralCannon`/`CannonBridge`/
      `CircleMethod`/`BernoulliFourier` retired into `Spectral/{Selection,
      CircleMethodBridge, CyclicCharacter, BernoulliCyclicFourier, BernoulliSum,
      BernoulliVariance, BernoulliCharacteristic, MainArcParameters}`, zero stale
      references; `exists_eq_of_spectral_gap`'s monolithic proof factored into three
      named mechanism lemmas and the 8M-heartbeat override removed (statement
      unchanged — proof-structure pure gain). Remaining: the `ArcConstruction.lean`
      file-vs-record naming mismatch, and the `docs/architecture.md` vocabulary sweep
      over the `R2*` files (part of D3).
- [x] **D1**: opaque-constant completion of V4.  Literal `100000` remains only in
      the private analytic witness proof among Taylor-remainder statements; equal
      numerals in the independent `k₀`/mass thresholds belong to D2.
- [ ] **D2 = V7** hk0mass bundle (delegatable; pattern established twice — see
      `exists_edge_square_load_supply`): wrap `hk0big`'s `1000·G + 1000·b + 100000`
      and `r2_getQ`'s inline `k0³·2 < 2^k0` inductions.
- [ ] **D3** naming/file sweep remainder (delegatable, last).
- [x] **D4** import-audit policy fix: the audit previously
      fails on "transitively redundant imports". But an import line is a *direct-
      dependency statement*, not a hypothesis: if a file directly uses `Aesop`,
      `Mathlib.Tactic.LinearCombination.Lemmas`, or `ZMod` (the three currently
      flagged cases are exactly of this kind — mostly tactic modules used invisibly
      by proofs), the explicit import is honest and *protective*: it is what keeps
      the file alive when an upstream file stops relaying the module (the precise
      failure that broke `FingerprintLevelSet` and `LevelSet` this week). Policy,
      now standing: **redundancy at the DAG-edge level is not an error; the import
      list must state direct uses truthfully.** Change `lean/scripts/audit_imports.sh`
      to report the redundant category as info without failing (keep failing on
      build breaks and on `missing imports`), then judge the 3 flagged files
      individually: direct-use imports stay; genuine leftovers (imports naming
      modules the file does not use at all) go.  Implemented in
      `lean/scripts/audit_imports.sh`: transitive redundancy is informational;
      elaboration failures and missing imports remain fatal.  The flagged `ZMod`,
      `LinearCombination`, and local theorem imports were confirmed as direct uses.

## 4. Record: the Codex pass (2026-07-12, 28 commits d362ddb..9d3a697)

Executed V2–V5 of this map plus beyond-scope work (GlobalControl/LocalEnergy
abstractions — e.g. sparse-support counting extracted to generic weighted-powerset ≤
truncated-binomial lemmas in `Core/FiniteSums.lean`, statement quality good; CI lint
job sharded 4-ways mirroring the import-audit, fixing the lint-job timeout flake).

**Two verification failures, same root cause, and it is the *documented* gotcha
recurring** (see `docs/cleanup-handoff.md`, the `#min_imports` saga): import-trim
commits (`9992a3f`, `de77969`, `b5c53d2`) were pushed without a full-tree rebuild.
The pushed tip failed CI's build job (`FingerprintLevelSet.lean`, unknown tactic —
fixed in the then-unpushed HEAD), and HEAD itself still failed locally
(`LocalEnergy/LevelSet.lean`: `interval_cases` lost its transitive import; fixed by
the direct `Mathlib.Tactic.IntervalCases` import, Fable follow-up pass).
**Rule, now standing: any commit that touches an `import` line requires a full
`lake build RequestProject.Audit` before commit, no exceptions** — per-target builds
do not cover transitive relay breakage, and the CI lint shards only catch it after
push.

## 5. Handoff protocol (tiers, escalation, and what stays Fable-level)

**Dispatch tiers.** D1, D2, D3, D4 → Sonnet 5 (Lean proof repair after statement
changes is above Haiku; none of the four needs Fable — every design decision is
pinned above, with acceptance greps). Run D1 → D2 → D3 sequentially (they overlap in
`R2Certificates.lean` / file moves); D4 any time in parallel (CI-only).

**Prompt preamble for every dispatched session** (include verbatim):
1. Read `docs/circle-method-map.md` (your task's section) and
   `docs/cleanup-handoff.md`'s "Known gotchas" before touching anything.
2. Standing rules: any commit touching an `import` line requires a full
   `lake build RequestProject.Audit` first; never push with the build gate red;
   the acceptance greps of your task must pass before you call it done; update the
   task's checkbox in this doc in the same commit.
3. Verify claims against the live code — docs record intent, the tree is the truth.

**Escalation triggers — stop and hand back to Fable 5 when any of these occurs:**
- The pinned spec turns out to require changing a theorem statement it does not
  explicitly list, or you find yourself choosing between two abstraction shapes.
- A proof does not close after ~3 honest attempts. Never `sorry`, never weaken a
  statement, never add hypotheses, never bump `maxHeartbeats`, never delete a
  failing declaration to make the build pass — these are all escalation events,
  not fixes.
- A consumer turns out to use the concrete *value* of a constant the spec treats
  as opaque (this falsifies a design assumption).
- The full-tree build is red in a file your diff does not explain.

**What remains genuinely Fable-level (queue for a fresh Fable session):**
- **The GlobalControl/LocalEnergy stream has never been mapped.** It is the larger
  half of the proof (~40 files: BlockSystem, Qctrl, the level-set/entropy/Laplace
  chain, `global_control_partition` as its summit) and this document's treatment
  stops at its boundary. The same program applies: full read, identify the abstract
  principle behind `global_control_partition` (shape: sub-Gaussian partition bound
  for quadratic CRT energy on a finite product of ZMod p — is it an instance of a
  general independent-coordinate large-deviation mechanism?), find dead ladders and
  witness bundles (known: the level-set `20`, the `hk0big`-adjacent thresholds
  beyond D2's scope), audit the 4 Codex abstraction commits there (only 1 of 4
  sampled so far). Deliverable: `docs/global-control-map.md` in this document's
  format.
- **A1(ii)** from `docs/construction-redesign.md`: the never-executed trace that
  certificate stages consume C-node entry points rather than adapter internals.
- The long-term genuinely-new-math item (unchanged): sufficient dispersion
  conditions on an arbitrary edge set — the "ideal theorem" — is research, not
  refactor; do not let any cleanup session attempt it.
