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
- [x] V4 Taylor parametrization — done *up to one caveat* (Codex pass,
      `86fbda3`..`d30ab88`): roles named in `Spectral/MainArcParameters.lean`
      (`bernoulliTaylorRadius`, `bernoulliMainTermRemainderBudget` — genuine design
      constants, correctly kept concrete; `bernoulliMainTermRetention = 1 − 2·budget`,
      `bernoulliMainTermConstant` — correctly derived) and threaded through the whole
      spine (record fields, R2 chase, ledger). **Caveat = D1 below**:
      `bernoulliTaylorRemainderConstant : ℝ := 100000` is a *witness named as a def* —
      the halfway form the standing standard rejects. Terminal form: make it opaque via
      the supply leaf (`Classical.choose` of `∃ cT, 0 ≤ cT ∧ ∀ θ ∈ [1/3,2/3], |t| ≤
      radius → ‖log φ_θ(t) − (2πiθt − 2π²θ(1−θ)t²)‖ ≤ cT·|t|³`, proved by the existing
      `bernoulli_log_taylor` with 100000 inside), export only the spec lemma +
      nonnegativity, and re-route any proof that currently unfolds the def numerically.
- [x] V3 circle-method file moves — done (Codex pass): `SpectralCannon`/`CannonBridge`/
      `CircleMethod`/`BernoulliFourier` retired into `Spectral/{Selection,
      CircleMethodBridge, CyclicCharacter, BernoulliCyclicFourier, BernoulliSum,
      BernoulliVariance, BernoulliCharacteristic, MainArcParameters}`, zero stale
      references; `exists_eq_of_spectral_gap`'s monolithic proof factored into three
      named mechanism lemmas and the 8M-heartbeat override removed (statement
      unchanged — proof-structure pure gain). Remaining: the `ArcConstruction.lean`
      file-vs-record naming mismatch, and the `docs/architecture.md` vocabulary sweep
      over the `R2*` files (part of D3).
- [ ] **D1** (delegatable, precise spec above): opaque-constant completion of V4.
      Acceptance: `grep -rn "100000" lean/RequestProject/` hits only inside the supply
      leaf's existence proof; full `lake build RequestProject.Audit` green; axiom set
      unchanged.
- [ ] **D2 = V7** hk0mass bundle (delegatable; pattern established twice — see
      `exists_edge_square_load_supply`): wrap `hk0big`'s `1000·G + 1000·b + 100000`
      and `r2_getQ`'s inline `k0³·2 < 2^k0` inductions.
- [ ] **D3** naming/file sweep remainder (delegatable, last).

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
