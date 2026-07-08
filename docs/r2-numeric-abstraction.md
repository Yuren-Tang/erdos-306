# R2 numeric chase — parametric abstraction record

Date: 2026-07-09. Branch `codex/pushlinter`. This documents the *target and rationale* of the
witness-elimination refactor of the R2 main-arc numeric chase, per the standing principle:

> Each proof node demands upstream only the properties it genuinely uses, and yields downstream
> the full generality its proof actually produces. Junctions (instantiations) are confluences of
> two streams and should narrow as little as possible. A number may appear in the main framework
> only if it is a structural extremum; proof witnesses (crude estimates, roundings, eventual
> thresholds) must be confined to leaf constructors.

## Classification of every constant in the chase

| Constant | True role | Disposition |
|---|---|---|
| `2/9` | extremal value of `θ(1−θ)` on `[1/3, 2/3]` | structural — stays as literal at point of use |
| `16/9`, `8/9` | Gaussian tail rate / gadget damping strength | structural mechanism constants — stay |
| `4` in `(k+1)² ≤ 4k²`, `k+1 ≤ 2k` | clean algebraic bound for `k ≥ 1` | structural — stays inside proofs |
| `100000`, `1/10` (`MainArcNumericFields`) | current Taylor interface of the circle-method core | core-interface constants; appear only at the junction `r2_numericFields`. Parametrizing the core itself is a separate, deferred node. |
| `100` (σ_ctrl lower coeff), `14` (its threshold) | witnesses of "∃ c ≥ 1, threshold: σ_ctrl ≥ 1/(c·k₀·2^k₀)" | leaf only (`exists_sigmaCtrl_lower_supply`); ledger holds abstract `cSigma`, `k0sigma` |
| `1000001` (square-load slack), `1000G+1000b+100000+14` | witnesses of "∃ S ≥ 1, threshold: ∑1/e² ≤ S·σ_ctrl²" | leaf only (`exists_edge_square_load_supply`); ledger holds abstract `Sload`, `k0load` |
| `501`, `250001` | witness of the bridge constant K with `Sload ≤ 4K²` | gone entirely; ledger holds abstract `K` with `hK1`, `hKS`; constructor takes `K := max 1 √Sload` |
| `2004`, the 4-way budget split | witness allocation scheme | gone from API; ledger holds ONE inequality `hbudget`; equal quarters is the constructor's private witness |
| `1000000·(⌈C⌉+1)⁴`, `256000000`, `500000000000000` | cascade artifacts of one oversized threshold | gone entirely |
| hand-rolled `n³<2ⁿ` etc. inductions (bases 10, 35, 10⁶) | ad hoc instances of polynomial ≪ exponential | replaced by one lemma from Mathlib asymptotics (`isLittleO_pow_const_const_pow_of_one_lt`) |
| `1000·G+1000·b+100000` (`hk0big`, mass layer / `r2_getQ`) | same disease, different limb | **deferred** to a follow-up pass (kept as-is this round, per scope discipline) |

## The node structure

1. **`R2LargeK0.lean`** → single leaf: `exists_threshold_mul_pow_le_two_pow (A : ℝ) (d : ℕ) :
   ∃ K₀, ∀ k ≥ K₀, A·k^d ≤ 2^k`, from Mathlib's polynomial≪exponential. No inductions, no bases.
2. **`R2TopAssembly.lean`** gains two supply leaves wrapping the existing crude estimates:
   - `exists_sigmaCtrl_lower_supply : ∃ c ≥ 1, ∃ K₀, ∀ BS (K₀ ≤ k₀), 1/(c·k₀·2^k₀) ≤ σ_ctrl`
   - `exists_edge_square_load_supply : ∃ S ≥ 1, ∀ G b, ∃ K₀, ∀ D QB (K₀ ≤ k₀, structural hyps),
     ∑_E 1/e² ≤ S·σ_ctrl²`
   and `r2_close_numericFields` becomes parametric in `(cSigma, Sload)` with hypotheses
   `hwindow : 10(cSigma·k₀²·2^k₀+1) ≤ 2^(2k₀)` and
   `hcubic : (4·1000000·Sload·(cSigma+1))·k₀⁴ ≤ 2^k₀` (all ℝ; `1000000 = 100000·10` is the
   core-interface product surfacing at the junction; `4` from `(Nσ)² ≤ (2k₀)²`).
3. **`R2NumericLedger`** (in `R2Certificates.lean`): abstract fields `cSigma, Sload, K : ℝ` with
   `hcS1, hS1, hK1 : 1 ≤ ·`, `hKS : Sload ≤ 4K²`, `hG1 : 1 ≤ G`; thresholds
   `k0sigma, k0window, k0cubic, k0load : ℕ` with their ∀-facts; and the single budget field
   `hbudget : b·η + b·Ctail·e^(−C²(16/9)/2) + b·Dmp·(2C+3) < c3/K`,
   replacing `hηdef`/`hDmpdef`/`hCbound` (η, Dmp are now pinned only by inequalities+positivity).
4. **`R2BlockSystemCertificate`**: pure domination fields `hk0sigma/hk0window/hk0cubic/hk0load :
   L.· ≤ BS.k0` and `hk0C : ⌈L.C⌉ ≤ BS.k0`; `k0min'` is the SUM of all thresholds (domination by
   summand needs no knowledge of values). `hk0big` retained this round (deferred limb).
5. **Certificate fields**: `R2MassCertificate.hsumE : ∑ ≤ Sload·σ²`;
   `R2MainArcWindow.hsigmaE_ub : σ_E ≤ K·σ_ctrl`; `r2_main_arc_sigmaE_compare` derives the upper
   bound from `hsumE` + `hKS` alone (σ_E² ≤ ¼·Sload·σ² ≤ K²σ²).
6. **Closure**: `Bm ≤ (bη + bCtailE + bDmp(2C+3))/σ < (c3/K)/σ = c3/(Kσ)` then
   `σ_E ≤ Kσ` gives `hbeat`. `r2_close_budget_501` deleted.
7. **`R2NumericConstants.lean` deleted** — naming a witness is still a witness.

## Deferred (recorded, not lost)

- Mass-layer threshold bundle `hk0big` + `r2_getQ`'s inline inductions + the crude support-mass
  constant 8 (in `r2_blockSupport_inv_sq_le`): same treatment, next pass.
- Parametrizing the circle-method core's Taylor constants (`100000`, `1/10` in
  `MainArcNumericFields` / `ArcConstruction.hsmall/htw`): a genuine node of its own — would make
  the whole chase work for any (coeff, target) pair; touches the core's Gaussian-approximation
  lemmas.
- Sharpenable: the honest ratio in `exists_edge_square_load_supply` is ~(8·100)² from two crude
  constants; a density-constant sharpening would shrink S but never to `≤ 3` by these methods
  (mass-batch pairs and control pairs are the same order — K is genuinely a constant > 1).
