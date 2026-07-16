# E306-RV1 complete change map

Exact interval: `d3a8dcfb9c0c9bf0e0ad25e1da81b7b12e83e628..e55ef359a8b98525f0bac6c7a510fcad94469bff`  
Exact size: **40 commits**  
Comparison status: head is 40 commits ahead, 0 behind; merge base is the exact review base.  
Purpose of this document: file-complete and semantic map of the corrected review interval. “Added”, “removed”, “renamed”, and “modified” below are GitHub exact-comparison classifications, not guesses from filenames.

## 1. Top-level semantic map

| Area | What changed | Review classification |
|---|---|---|
| Mathematics | New/reworked circle-method, local-energy, global-control, and semiprime-construction lemmas; tightened private constants at the frozen tip | Mostly proof-content and internal mathematical architecture; some constants require exact build verification |
| Public theorem/API | Statement separated into `Statement.Erdos306`; proof moved to `Erdos306`; facade retained at `Public.Erdos306` | Publication-grade improvement; public proposition unchanged |
| Trust boundary | Rosser--Schoenfeld-facing route replaced by two structural PNT/Mertens axioms under `GlobalControl.AnalyticInputs` | Material trust-boundary change |
| Imports | Large aggregate/flat imports replaced with mathematical paths; per-module import audit added | Publication/engineering improvement with migration risk |
| Module movement | Extensive deletion, rename, and redistribution of `R2*`, aggregate, circle-method, construction, and local-energy files | High-risk architecture migration |
| Proof scripts | Numerous theorem-body edits, arithmetic normalization changes, private numerical witness tightening, and signature adaptation | Engineering or internal mathematical change depending on declaration |
| CI/audit | One build job, artifact reuse, exact axiom gate, four linter shards, four import-audit shards, `actionlint`, dependency graph target update | Engineering improvement; latest run still red because linter shards cancelled/failed |
| Workflows | Main CI and lean-graph import target updated | Engineering-only unless gate semantics change; axiom allowlist change is trust-boundary-sensitive |
| Documentation | README and architecture/refactor maps substantially rewritten; cleanup handoff deleted | Useful but not synchronized completely with tip |

## 2. Theorem and API surface

### 2.1 Stable proposition

New file:

- **added** `lean/RequestProject/Statement/Erdos306.lean` (`+20`)

It contains only the public `def Erdos306 : Prop`, importing Mathlib arithmetic-function material rather than the proof implementation.

Exact-base source placed the same proposition inline as the type of `Erdos306.erdos_306`. The frozen-tip proposition is textually the same in logical content:

- `q : ℚ`;
- positivity hypothesis;
- squarefree reduced denominator;
- finite strictly increasing sequence with dummy `n 0 = 1`;
- `ω = Ω = 2` on non-initial entries;
- exact reciprocal sum.

### 2.2 Headline proof

- **renamed/edited** `lean/RequestProject/Erdos306FormalConjectures.lean` -> `lean/RequestProject/Erdos306.lean` (`+14/-21`)
- **removed** `lean/RequestProject/Erdos306Final.lean` (`-143`)
- **modified** `lean/RequestProject/Public/Erdos306.lean` (`+4/-4`)

New public path:

```text
RequestProject.Public.Erdos306
  -> RequestProject.Erdos306
     -> RequestProject.Statement.Erdos306
     -> RequestProject.Construction.SemiprimeRepresentation
```

The final bridge now invokes `hasEgyptianSemiprimeRepr_div_of_squarefree`, not `erdos_306_unconditional` from the removed final module.

### 2.3 Project-native construction API

- **added** `lean/RequestProject/Construction/SemiprimeRepresentation.lean` (`+116`)

This module exposes the construction-facing theorems for avoiding representations, treats denominators `1`, `2`, and `>=3`, builds `1 = 1/2 + 1/3 + 1/6` through avoiding semiprime representations, and applies `Core.UnitNumeratorReduction` to general numerators.

### 2.4 Audit surface

- **modified** `lean/RequestProject/Audit.lean` (`+6/-4`)

The audit now imports `RequestProject.Public.Erdos306`, checks `_root_.Erdos306` and `Erdos306.erdos_306`, prints its axioms, and prints the two structural analytic axiom declarations.

## 3. Trust-boundary map

### 3.1 Analytic leaf

- **renamed/edited** `lean/RequestProject/AnalyticInputs.lean` -> `lean/RequestProject/GlobalControl/AnalyticInputs.lean` (`+2/-1`)
- **removed** `lean/RequestProject/DyadicPrimes.lean` (`-18`)

Frozen-tip raw axioms:

```text
GlobalControl.pnt_dyadic_prime_density
GlobalControl.mertens_dyadic_window_mass
```

Stable wrappers:

```text
GlobalControl.dyadic_prime_density
GlobalControl.dyadic_mertens_cumulative
```

The current audit allowlist is:

```text
propext
Classical.choice
Quot.sound
GlobalControl.pnt_dyadic_prime_density
GlobalControl.mertens_dyadic_window_mass
```

This differs materially from the immutable release's Rosser--Schoenfeld boundary.

### 3.2 Where the trust-boundary change appears

- source declarations in `GlobalControl/AnalyticInputs.lean`;
- audit prints in `Audit.lean`;
- required/allowed names in `.github/workflows/ci.yml`;
- public description in `README.md`;
- environment and roadmap prose.

The boundary is therefore consistently wired in active code, but not yet supported by an exact source bridge.

## 4. File-complete exact comparison inventory

### 4.1 Workflows, scripts, and audit infrastructure

- **modified** `.github/workflows/ci.yml` (`+2/-2` in this exact 40-commit interval; broader PR changes predate the review base)
- **modified** `.github/workflows/lean-graph.yml` (`+2/-2`)
- **modified** `lean/RequestProject/Audit.lean` (`+6/-4`)
- **modified** `lean/scripts/audit_imports.sh` (`+7/-1`)
- **modified** `lean/scripts/dep_graph.py` (`+2/-3`)

Semantic effect:

- build target and graph target use the new public/audit paths;
- axiom gate names are structural PNT/Mertens names;
- import audit is sharded and treats missing imports/elaboration failure as fatal while reporting redundant imports informationally;
- graph reconnaissance follows the public root.

### 4.2 Documentation

- **modified** `README.md` (`+9/-6`)
- **modified** `docs/architecture.md` (`+2/-2`)
- **modified** `docs/circle-method-map.md` (`+43/-31`)
- **removed** `docs/cleanup-handoff.md` (`-547`)
- **modified** `docs/construction-redesign.md` (`+26/-13`)
- **modified** `docs/environment.md` (`+3/-5`)
- **modified** `docs/global-control-map.md` (`+11/-11`)
- **modified** `docs/r2-numeric-abstraction.md` (`+4/-3`)
- **modified** `docs/refactor-roadmap.md` (`+12/-17`)

Semantic effect:

- documents are reoriented toward mathematical paths and the new public spine;
- historical cleanup handoff is deleted;
- construction/circle/global maps are updated for redistributed modules;
- some stale paths and aggregate descriptions remain, identified in the main report.

### 4.3 Removed flat or aggregate route files

- **removed** `lean/RequestProject/ArcConstruction.lean` (`-232`)
- **removed** `lean/RequestProject/ArcConstructionSigma.lean` (`-83`)
- **removed** `lean/RequestProject/BlockCRTEnergy.lean` (`-198`)
- **removed** `lean/RequestProject/BlockMassPool.lean` (`-321`)
- **removed** `lean/RequestProject/BlockSystemConstruction.lean` (`-49`)
- **removed** `lean/RequestProject/CircleMethodArcs.lean` (`-323`)
- **removed** `lean/RequestProject/CircleMethodAssembly.lean` (`-73`)
- **removed** `lean/RequestProject/DyadicPrimes.lean` (`-18`)
- **removed** `lean/RequestProject/Erdos306Final.lean` (`-143`)
- **removed** `lean/RequestProject/FiberCount.lean` (`-116`)
- **removed** `lean/RequestProject/GlobalControl.lean` (`-30`)

These removals eliminate broad historical entry points. Their mathematical replacements are listed in the next sections.

### 4.4 Circle-method modules

- **added** `lean/RequestProject/CircleMethod/ArcConstruction.lean` (`+76`)
- **renamed/edited** `lean/RequestProject/CircleMethodMainArc.lean` -> `lean/RequestProject/CircleMethod/BernoulliLogExpansion.lean` (`+42/-10`)
- **added** `lean/RequestProject/CircleMethod/BlockSupportFrequencyFibers.lean` (`+55`)
- **added** `lean/RequestProject/CircleMethod/ControlVarianceComparison.lean` (`+223`)
- **added** `lean/RequestProject/CircleMethod/FrequencyControlEnergy.lean` (`+128`)
- **renamed/edited** `lean/RequestProject/CircleMethodMainTerm.lean` -> `lean/RequestProject/CircleMethod/MainArcLowerBound.lean` (`+4/-4`)
- **renamed/edited** `lean/RequestProject/R2NumericFields.lean` -> `lean/RequestProject/CircleMethod/MainArcNumericBounds.lean` (`+7/-6`)
- **added** `lean/RequestProject/CircleMethod/MainArcPeriodicity.lean` (`+197`)
- **renamed/edited** `lean/RequestProject/R2MinorCover.lean` -> `lean/RequestProject/CircleMethod/MinorArcCover.lean` (`+10/-8`)
- **renamed/edited** `lean/RequestProject/R2MinorAssembly.lean` -> `lean/RequestProject/CircleMethod/MinorArcDecomposition.lean` (`+5/-5`)
- **renamed/edited** `lean/RequestProject/R2MinorEstimateInterface.lean` -> `lean/RequestProject/CircleMethod/MinorArcEstimates.lean` (`+15/-11`)
- **renamed/edited** `lean/RequestProject/ExtraEnergyMinorArc.lean` -> `lean/RequestProject/CircleMethod/MinorArcFiberTail.lean` (`+10/-8`)
- **renamed/edited** `lean/RequestProject/ArcConstructionExtra.lean` -> `lean/RequestProject/CircleMethod/PrimeSupportPeriod.lean` (`+4/-16`)
- **added** `lean/RequestProject/CircleMethod/QuadraticEnergy.lean` (`+130`)
- **added** `lean/RequestProject/CircleMethod/ReciprocalSelection.lean` (`+51`)
- **renamed/edited** `lean/RequestProject/ExtraMinorDamping.lean` -> `lean/RequestProject/CircleMethod/ResidueOffsetDamping.lean` (`+7/-5`)

Semantic grouping:

1. Bernoulli logarithmic expansion and main-arc lower bounds;
2. periodicity and prime-support period;
3. quadratic/control-frequency energy;
4. minor-arc cover, decomposition, estimates, and fiber tail;
5. final arc construction and reciprocal-selection abstraction.

Frozen-tip last commit tightens a private Bernoulli Taylor remainder witness from `100000` to `2880` and corresponding intermediate bounds. This is internal mathematical/proof content, not a public theorem change.

### 4.5 Construction modules

- **modified** `lean/RequestProject/Construction/BaseLoadBudget.lean` (`+63/-63`)
- **added** `lean/RequestProject/Construction/BlockPrimePool.lean` (`+132`)
- **added** `lean/RequestProject/Construction/BlockSupportCompatibility.lean` (`+20`)
- **added** `lean/RequestProject/Construction/BlockSystemSelection.lean` (`+123`)
- **added** `lean/RequestProject/Construction/Certificates/Assembly.lean` (`+86`)
- **added** `lean/RequestProject/Construction/Certificates/Foundation.lean` (`+307`)
- **added** `lean/RequestProject/Construction/Certificates/GadgetEdges.lean` (`+59`)
- **added** `lean/RequestProject/Construction/Certificates/MainArcWindow.lean` (`+249`)
- **added** `lean/RequestProject/Construction/Certificates/MinorArcEstimate.lean` (`+189`)
- **added** `lean/RequestProject/Construction/Certificates/WeightedEdges.lean` (`+111`)
- **added** `lean/RequestProject/Construction/ControlEdges.lean` (`+90`)
- **added** `lean/RequestProject/Construction/EdgeSquareLoad.lean` (`+227`)
- **modified** `lean/RequestProject/Construction/Edges.lean` (`+67/-69`)
- **renamed/edited** `lean/RequestProject/R2MainArcClassification.lean` -> `lean/RequestProject/Construction/MainArcClassification.lean` (`+10/-10`)
- **added** `lean/RequestProject/Construction/MainArcNumericClosure.lean` (`+200`)
- **added** `lean/RequestProject/Construction/MassBatchCompletion.lean` (`+109`)
- **modified** `lean/RequestProject/Construction/MassBatchSupply.lean` (`+22/-23`)
- **modified** `lean/RequestProject/Construction/MassPool.lean` (`+106/-106`)
- **renamed/edited** `lean/RequestProject/R2BlockMinorLane.lean` -> `lean/RequestProject/Construction/MinorArc/BlockEstimate.lean` (`+54/-27`)
- **renamed/edited** `lean/RequestProject/R2ComponentCoreSupply.lean` -> `lean/RequestProject/Construction/MinorArc/ControlGadgetScale.lean` (`+4/-8`)
- **added** `lean/RequestProject/Construction/MinorArc/Endgame.lean` (`+143`)
- **renamed/edited** `lean/RequestProject/Construction/ExtraGadgetDamping.lean` -> `lean/RequestProject/Construction/MinorArc/ExtraGadgetDamping.lean` (`+16/-14`)
- **renamed/edited** `lean/RequestProject/Construction/ExtraReservoir.lean` -> `lean/RequestProject/Construction/MinorArc/ExtraReservoir.lean` (`+32/-32`)
- **renamed/edited** `lean/RequestProject/Construction/ExtraSiblingChoice.lean` -> `lean/RequestProject/Construction/MinorArc/ExtraSiblingChoice.lean` (`+69/-75`)
- **added** `lean/RequestProject/Construction/MinorArc/SupportBudget.lean` (`+76`)
- **added** `lean/RequestProject/Construction/MinorArcFrequencyLanes.lean` (`+264`)
- **removed** `lean/RequestProject/Construction/MinorEndgame.lean` (`-197`)
- **added** `lean/RequestProject/Construction/ParameterSelection.lean` (`+63`)
- **added** `lean/RequestProject/Construction/SemiprimeRepresentation.lean` (`+116`)

Semantic grouping:

1. prime/mass pools and block-system selection;
2. edge data, control edges, weighted edges, and square-load bounds;
3. certificate foundation, main-arc window, minor-arc estimate, and assembly;
4. minor-arc support, reservoir, sibling, damping, frequency-lane, and terminal estimates;
5. parameter selection and final semiprime representation.

The file movement is not a pure rename pass: many new certificate and handoff modules split old monoliths by theorem ownership.

### 4.6 Core modules

- **modified** `lean/RequestProject/Core/Asymptotics.lean` (`+65/-16`)
- **added** `lean/RequestProject/Core/CoprimeResidueFibers.lean` (`+93`)
- **added** `lean/RequestProject/Core/DyadicPrimeDivisors.lean` (`+47`)
- **added** `lean/RequestProject/Core/ExponentialDomination.lean` (`+35`)
- **modified** `lean/RequestProject/Core/FiniteProducts.lean` (`+1/-1`)
- **added** `lean/RequestProject/Core/FiniteWeightSelection.lean` (`+81`)
- **modified** `lean/RequestProject/Core/GaussianIntegerSum.lean` (`+60/-1`)
- **added** `lean/RequestProject/Core/IncreasingPairs.lean` (`+58`)
- **added** `lean/RequestProject/Core/LinearCongruenceCounting.lean` (`+75`)
- **added** `lean/RequestProject/Core/OrderedPairSum.lean` (`+51`)
- **modified** `lean/RequestProject/Core/ReciprocalPeriod.lean` (`+30`)

These changes move reusable finite, congruence, asymptotic, and Gaussian arguments out of construction/global monoliths. This is architectural improvement provided direct imports remain correct.

### 4.7 Global-control modules

- **renamed/edited** `lean/RequestProject/AnalyticInputs.lean` -> `lean/RequestProject/GlobalControl/AnalyticInputs.lean` (`+2/-1`)
- **modified** `lean/RequestProject/GlobalControl/BlockRestriction.lean` (`+1/-1`)
- **modified** `lean/RequestProject/GlobalControl/ColdDominance.lean` (`+21/-11`)
- **modified** `lean/RequestProject/GlobalControl/ControlEnergy.lean` (`+1/-1`)
- **modified** `lean/RequestProject/GlobalControl/DiagonalControlEnergy.lean` (`+9/-4`)
- **renamed/edited** `lean/RequestProject/DyadicBlockDef.lean` -> `lean/RequestProject/GlobalControl/DyadicPrimeBlock.lean` (`+4/-9`)
- **renamed/edited** `lean/RequestProject/DyadicBlockUpper.lean` -> `lean/RequestProject/GlobalControl/DyadicPrimeBlockBounds.lean` (`+3/-1`)
- **modified** `lean/RequestProject/GlobalControl/Encoding/HotBlockCount.lean` (`+56/-48`)
- **modified** `lean/RequestProject/GlobalControl/EnergyDecomposition.lean` (`+2/-2`)
- **renamed/edited** `lean/RequestProject/GlobalPeierlsBookkeeping.lean` -> `lean/RequestProject/GlobalControl/FiniteEntropyBounds.lean` (`+13/-14`)
- **modified** `lean/RequestProject/GlobalControl/LevelSetAssembly.lean` (`+2/-5`)
- **modified** `lean/RequestProject/GlobalControl/Partition.lean` (`+2/-2`)
- **modified** `lean/RequestProject/GlobalControl/ShellEntropy.lean` (`+2/-2`)
- **modified** `lean/RequestProject/GlobalControl/SubsetCharge.lean` (`+3/-4`)
- **removed** `lean/RequestProject/GlobalControl.lean` (`-30`)

The aggregate removal is significant. Active consumers are intended to import mathematical submodules directly. Documentation still contains one aggregate reference and must be synchronized.

### 4.8 Local-energy modules

- **modified** `lean/RequestProject/LocalEnergy/AdjacentScaleEnergy.lean` (`+1/-1`)
- **added** `lean/RequestProject/LocalEnergy/BlockEnergy.lean` (`+91`)
- **added** `lean/RequestProject/LocalEnergy/BlockEnergyBounds.lean` (`+49`)
- **removed** `lean/RequestProject/LocalEnergy/CRTModel.lean` (`-63`)
- **added** `lean/RequestProject/LocalEnergy/CRTRepresentation.lean` (`+82`)
- **modified** `lean/RequestProject/LocalEnergy/CrossLabelEnergy.lean` (`+25/-8`)
- **modified** `lean/RequestProject/LocalEnergy/DominantLabel/ColdRange.lean` (`+1/-1`)
- **modified** `lean/RequestProject/LocalEnergy/DominantLabel/Covering.lean` (`+34/-25`)
- **modified** `lean/RequestProject/LocalEnergy/DominantLabel/Definition.lean` (`+1/-2`)
- **modified** `lean/RequestProject/LocalEnergy/DominantLabel/Encoding.lean` (`+39/-23`)
- **modified** `lean/RequestProject/LocalEnergy/DominantLabel/Energy.lean` (`+30/-26`)
- **modified** `lean/RequestProject/LocalEnergy/DominantLabel/Threshold.lean` (`+8/-16`)
- **modified** `lean/RequestProject/LocalEnergy/FingerprintDecoding.lean` (`+40/-23`)
- **modified** `lean/RequestProject/LocalEnergy/FingerprintEnergy.lean` (`+61/-17`)
- **modified** `lean/RequestProject/LocalEnergy/FingerprintEntropy.lean` (`+1`)
- **modified** `lean/RequestProject/LocalEnergy/FingerprintLevelSet.lean` (`+12/-9`)
- **modified** `lean/RequestProject/LocalEnergy/LevelSet.lean` (`+42/-22`)
- **modified** `lean/RequestProject/LocalEnergy/ReciprocalDispersion.lean` (`+89/-167`)
- **added** `lean/RequestProject/LocalEnergy/ReciprocalPhase.lean` (`+38`)

The old CRT model is split into representation, phase, energy, and bounds modules. Reciprocal dispersion is substantially reduced/reworked. Dominant-label and fingerprint files receive nontrivial proof edits; they are not mere path changes.

### 4.9 Removed `R2*` construction routes

- **removed** `lean/RequestProject/R2AssemblyFields.lean` (`-165`)
- **removed** `lean/RequestProject/R2Certificates.lean` (`-870`)
- **removed** `lean/RequestProject/R2ComponentBounds.lean` (`-122`)
- **removed** `lean/RequestProject/R2ComponentNumeric.lean` (`-146`)
- **removed** `lean/RequestProject/R2ComponentNumericAssembly.lean` (`-120`)
- **removed** `lean/RequestProject/R2DyadicBlockSupport.lean` (`-52`)
- **removed** `lean/RequestProject/R2FinalAssembly.lean` (`-399`)
- **removed** `lean/RequestProject/R2FinalAssemblyRaw.lean` (`-134`)
- **removed** `lean/RequestProject/R2LargeK0.lean` (`-33`)
- **removed** `lean/RequestProject/R2MinorBudgetNumerics.lean` (`-106`)
- **removed** `lean/RequestProject/R2MinorEndgameLanes.lean` (`-46`)
- **removed** `lean/RequestProject/R2MinorReady.lean` (`-30`)
- **removed** `lean/RequestProject/R2MinorSupportBudget.lean` (`-36`)
- **removed** `lean/RequestProject/R2MinorSupportPipeline.lean` (`-60`)
- **removed** `lean/RequestProject/R2TopAssembly.lean` (`-782`)

These deletions account for much of the migration's review risk and much of its architectural value. Their replacement material is distributed across `Construction`, `CircleMethod`, and `Core` rather than preserved as one-to-one shims.

### 4.10 Spectral modules

- **modified** `lean/RequestProject/Spectral/BernoulliCyclicFourier.lean` (`+24`)
- **modified** `lean/RequestProject/Spectral/MainArcParameters.lean` (`+1/-8`)

These are proof/interface changes at the spectral-to-circle-method handoff.

## 5. Source-graph confluences requiring exact verification

The most important confluences are:

1. `GlobalControl.AnalyticInputs` -> dyadic prime/mass consumers;
2. local-energy reciprocal phase/dispersion -> cross-label and global control;
3. global-control partition -> circle-method minor-arc estimates;
4. circle-method main/minor arc modules -> construction certificates;
5. certificate assembly + reciprocal selection -> `exists_arcConstruction`;
6. `SemiprimeRepresentation` + `UnitNumeratorReduction` -> headline theorem;
7. `Public.Erdos306` -> `Audit` -> axiom gate.

A green build of only an interior module is not sufficient; each confluence must be exercised by the public/audit build and import audit.

## 6. Remote job evidence at the frozen head

Workflow run associated with `e55ef359...`:

- `build`: success;
- `verify`: success;
- `Audit all imports (1/4)`: success;
- `Audit all imports (2/4)`: success;
- `Audit all imports (3/4)`: success;
- `Audit all imports (4/4)`: success;
- `Lint GitHub Actions workflows`: success;
- `Lint Lean sources (1/4)`: failed, linter step cancelled;
- `Lint Lean sources (2/4)`: failed, linter step cancelled;
- `Lint Lean sources (3/4)`: failed, linter step cancelled;
- `Lint Lean sources (4/4)`: failed, linter step cancelled;
- overall workflow: failure.

The build and trust audit are therefore supported remotely, but the interval is not green as a whole.

## 7. Classification summary

### Publication-grade improvements

- statement/proof/facade separation;
- mathematical module paths and narrower handoff modules;
- removal of obsolete aggregate and `R2*` routes;
- dedicated public audit entry point;
- full import-audit infrastructure.

### Engineering-only changes

- job sharding and build artifact reuse;
- concurrency cancellation;
- actionlint and dependency graph maintenance;
- mechanical proof normalization where signatures are unchanged.

### Trust-boundary changes

- replacement of the released Rosser--Schoenfeld assumptions by the two structural axioms;
- all audit, workflow, and public-prose changes that encode that replacement.

### Release blockers revealed by the map

- red linter matrix;
- no reproduced exact-tip clean-local packet;
- no exact source bridge for the two structural inputs;
- stale README/roadmap/architecture references;
- broad mixed-scope PR history.
