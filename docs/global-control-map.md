# The GlobalControl/LocalEnergy stream: map and verdicts

Date: 2026-07-12. Author: Fable 5 pass. Method: full skeleton extraction (all ~9600
lines, 60 files: every declaration signature + module docstring), full reads of the
summit (`Partition.lean`), the definitional base, and targeted drill-downs.
Companion to `docs/circle-method-map.md` (same program, other stream).

## 1. The map

```
DEFINITIONAL BASE
  BlockCRTEnergy.lean        crtRepr (centered CRT representative), BlockAssignment,
                             QP (single-block quadratic energy), sigmaP, blockPartFun
  LocalEnergy/CRTModel       thin lemma layer over the base
  GlobalControl/BlockSystem  BlockSystem, blockSupport, GlobalAssignment,
                             admissibleGlobalRange
  GlobalControl/ControlEnergy Hglob, internal/bipartite/ctrlPairs, Qctrl, sigmaCtrl

LOCAL STRATUM (single prime block) — LocalEnergy/
  ReciprocalDispersion       THE ENGINE: linear-congruence fiber counting →
                             small-ball and energy lower bounds for reciprocal
                             phases (deterministic dispersion; NOT probabilistic)
  CrossLabelEnergy           two distinct labels force quadratic energy
  DominantLabel/             Definition → Covering (sparse basepoint, label cover,
                             dichotomy) → Threshold (nondominant ⇒ energy ≳ X/log³X)
                             → Energy → Encoding → FixedLabel → ColdRange
  Fingerprint{Energy,Decoding,Entropy,LevelSet}
                             high-energy branch: fingerprint injection + entropy
  LevelSet                   joins both branches → block_level_set_bound →
                             single_block_partition_bound

GLOBAL STRATUM — GlobalControl/
  Encoding/                  blockEnergy, forcing floor Rw = c2·2^k/log³2^k, hotSet,
                             shellVec, Pifloor, coldLabel, boundarySet, fiber
  Level-set machine          LevelSetParameters (admH/admB/shells/labels) →
                             LevelSetCover → Cold{Dominance,LabelReduction,
                             FiberCounting} → ChargeAggregation/ShellEntropy/
                             SubsetCharge → LevelSetAssembly.global_levelset
  Floors & growth            BoundaryPenalty/Charge/FloorGrowth,
                             ForcingFloorComparison, ControlFloorGrowth
  Laplace                    Core.LevelSetLaplace → GlobalLaplaceBound →
                             LaplaceAboveFloor
  Localization               localization_dichotomy: off-main ⇒ energy ≥ floor
                             OR globally diagonal with exact quadratic energy
  Diagonal                   DiagonalGaussianTail: diagonal sector → 1D Gaussian sum
  SUMMIT                     Partition.global_control_partition
  ABSTRACT ENTROPY ENGINE    GlobalPeierlsBookkeeping (weighted_subset_entropy,
                             shell_sum_bound) — self-declared CRT-free; correct
                             stratification already
```

The mathematical shape: a **localization/large-deviation argument**. Off the main
arc, an assignment either pays energy above a growing floor (killed by counting:
`global_levelset` bounds level sets by `exp(A·numBlocks)`-type entropy, converted by
Laplace and absorbed by the floor's superlinear growth) or is globally diagonal
(killed by a one-dimensional Gaussian tail in its single integer label). The engine
underneath everything is deterministic reciprocal-phase dispersion via linear
congruence counting — genuinely number-theoretic, *not* an instance of an abstract
probabilistic large-deviation principle; forcing it into one would be fake
abstraction.

## 2. Verdicts

**G1. The global stratum is ALREADY at the terminal standard.** All its analytic
constants are existentially supplied and quantified away at the summit:
`localization_dichotomy` *produces* `(k0loc, c2, e0)`; `global_levelset` *produces*
`(levelScale, A)`; `diagonal_sector_gaussian_bound` *produces* `(Ctail, k0II)`;
`global_control_partition` is parametric in the decay rate `c` and its statement is
witness-free. The quantifier-order soundness is even documented against an earlier
unsound route. No action.

**G2. Dead cluster (executed this pass).** `BlockCRTEnergy.lean`'s primed labeling
family (`BlockLabeling'`, `labelClass'`, `activeLabels'`, `isDominantLabel'`,
`isSubstantialClass'`, `substantialCoverage'`) and `SBEESavingBound` (self-labelled
"VACUOUS — DO NOT use", referring to a successor that no longer exists): zero
consumers, deleted. `blockPartFun` is live (LevelSet) and stays.

**G3. The middle-stratum constant family (168, 64, 16, 20/3, 20, 2^21, ρ ≤ 1/4) —
document, do not parametrize.** These are the single-block theory's interface
constants (label-window coefficient `labelRange = ⌈168·√c2·…⌉`, the cold-label
bounds `/64`, `/16`, `(20/3)·√E/σ`, the level-set prefactor `20`, the cold-collapse
threshold `c2 ≤ 1/2^21`, the dominance proportion `ρ ≤ 1/4`). Two reasons they stay:
(i) their interlocks (e.g. 168 must dominate the 20/3-chain through the floor
scales) are machine-checked in `coldLabel_mem_labelFin` etc. — a change alarms as a
proof failure, which is the correct alarm; (ii) decisive: the summit quantifies
every one of them away, so parametrizing the middle stratum enlarges **no**
downstream conclusion — this is precisely the boundary where abstraction stops
paying (the "categorified 1+1" line). The `X/log³X` floor shape and `ρ ≤ 1/4` are
structural (the dispersion mechanism's true output and the dominance model's design
constant). What IS owed is documentation: a one-line role note at each definition
that carries one of these constants (delegation item G-D2).

**G4. LocalEnergy stratification is sound.** The dominant-label chain is already
factored by mechanism, and `Threshold.cutoff_energy_quadratic_lower_bound` already
carries the right doctrine in its docstring ("numerical choices belong only in its
specialization"). `GlobalPeierlsBookkeeping` is the correct CRT-free abstract
entropy engine. No structural surgery warranted.

**G5. Residual duplication audit (G-D1, complete):** the two deviation estimates
are genuinely different: `CRTModel.block_deviation_upper_bound` is an upper bound
from a prime window, whereas `HotBlockCount.block_deviation_reciprocal_bound`
combines the lower deviation estimate with block density.  The assignment-space
duplication was real: `BlockCRTEnergy.blockAssignment_card` now assumes only
nonzero moduli, and `CRTModel.levelset_card_le_pow` is a direct corollary.  The
cross-scale theorem belongs in `ScaleComparison`.  Finally, the three cold-label
bounds have distinct roles: `20/3` is the raw pointwise energy bound, while `/16`
and `/64` are two downstream window specializations of the already shared
`cold_label_bound_with_divisor`; all three have live consumers.

**A1(ii) closed (trace executed, `docs/construction-redesign.md` updated):** the
certificate stages do not reach into adapter internals; the R2TopAssembly middle
layer (`r2_getQ` → `exists_r2_data_of_numerics_set` → `exists_r2_massBatch` →
MassPool entry point) is a chain of genuine side-condition discharges, not
pass-through adapters. The residual crud in that chain (inline `k0³·2 < 2^k0`
inductions) is exactly D2's scope.

## 3. Delegation queue for this stream

- **G-D1**: complete; see G5.
- **G-D2**: role-note docstrings for the G3 constant family, citing this document.
  Sonnet 5, doc-only.
- Existing D1/D2/D3/D4 (circle-method map §3) unchanged; D2 = the hk0mass bundle
  also covers `r2_getQ`'s inline inductions noted in A1(ii) above.
