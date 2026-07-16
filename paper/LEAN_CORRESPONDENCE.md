# Erdős 306 paper / Lean correspondence

Workstream: `E306-P1-01`  
Paper branch checkpoint before this revision: `paper/arxiv-v1@c264d00a722364c777d89e4438aadc7babfcdbe0`  
Immutable formal evidence: `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`, DOI `10.5281/zenodo.20767390`  
Frozen architecture context: `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`

## 1. Three layers that must not be conflated

### Layer A — Paper mathematics

The article uses the prime number theorem

`π(x) ~ x/log x`

as its sole load-bearing external analytic theorem. It then proves by Abel/partial summation

`A_k := Σ_{2^k≤p<2^(k+1)} 1/p = 1/k + o(1/k)`

and derives the two eventual construction supplies. This bridge is ordinary mathematical prose, not a Lean declaration in the current project. The paper therefore does **not** claim that PNT has been imported, assumed, or proved in `v0.0.3` or at the frozen development checkpoint.

### Layer B — Frozen architecture context

At `codex/pushlinter@e55ef359...`, the downstream construction is organized around:

- `GlobalControl.pnt_dyadic_prime_density`;
- `GlobalControl.mertens_dyadic_window_mass`.

These are construction-shaped axioms at that checkpoint. The first has the explicit fixed hypothesis `5 ≤ k`; the second has an eventual witness and the inclusive block union `Finset.Icc k0 (3*k0)`. The paper replaces the fixed-cutoff **expository interface** by eventual statements because the construction chooses its bottom scale last. This is a paper-level mathematical rephrasing; it is not a claim that the Lean source has been edited or that a new formal bridge exists.

### Layer C — Immutable released evidence

At `v0.0.3`, the headline theorem is kernel checked and its exact axiom audit is:

1. `propext`;
2. `Classical.choice`;
3. `Quot.sound`;
4. `RosserSchoenfeld.rosser_schoenfeld_cor3`;
5. `RosserSchoenfeld.rosser_schoenfeld_thm5`.

The last two are exact source-transcribed inputs from Rosser--Schoenfeld (1962), Corollary 3, equation (3.8), p. 69, and Theorem 5, equations (3.17)--(3.18), p. 70. They remain the current formal backend. The paper's PNT proof does not retroactively change this audit.

## 2. Public theorem statement

The paper theorem says that a positive rational `q=a/b` in lowest terms is a finite sum of reciprocals of distinct squarefree semiprimes if and only if `b` is squarefree.

The exact released Lean conclusion has the shape

```lean
∀ (q : Rat), 0 < q → Squarefree q.den →
  ∃ k : Nat, ∃ n : Fin (k + 1) → Nat,
    n 0 = 1 ∧ StrictMono n ∧
    (∀ i ∈ Finset.Icc 1 (Fin.last k),
      Nat.omega (n i) = 2 ∧ Nat.Omega (n i) = 2) ∧
    q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : Rat) / n i
```

The value `n 0=1` is a dummy anchor. Strict monotonicity makes the remaining denominators distinct. The equalities `ω=Ω=2` identify products of two distinct primes.

At the frozen architecture checkpoint this proposition is isolated as `_root_.Erdos306`, with the proof exposed through `Erdos306.erdos_306`. The proposition itself is unchanged from the released formulation.

## 3. Analytic correspondence

| Paper object | Paper status | Frozen architecture object | Released counterpart |
|---|---|---|---|
| PNT `π(x)~x/log x` | external theorem | no imported/proved PNT theorem claimed | no PNT axiom |
| Abel/partial-summation bridge | proved in paper | Mathlib has Abel-summation infrastructure, but the project does not contain this bridge theorem | none |
| `A_k=1/k+o(1/k)` | proved in paper | no named project theorem | none |
| eventual dyadic cardinality | proved from local law | wrapper `GlobalControl.dyadic_prime_density`, backed by fixed-cutoff axiom `pnt_dyadic_prime_density` | derived from `rosser_schoenfeld_cor3` in the released source graph |
| eventual inclusive-window mass | proved from local law | wrapper `GlobalControl.dyadic_mertens_cumulative`, backed by `mertens_dyadic_window_mass` | derived from `rosser_schoenfeld_thm5` in the released source graph |

The paper's inclusive blocks `k_0,...,3k_0` correspond to the exact prime interval `[2^{k_0},2^{3k_0+1})`.

## 4. Construction correspondence

The names below are architecture/exposition locators at `e55ef359...`; they are not presented as released formal authority.

| Manuscript section or handoff | Frozen architecture context | Role |
|---|---|---|
| avoiding representation and numerator closure | `Core.UnitNumeratorReduction`; `Construction.SemiprimeRepresentation` | converts unit-numerator avoiding representations into the headline rational theorem |
| finite Fourier identity and spectral selection | `CircleMethod.ReciprocalSelection` | turns a strict main/minor Fourier gap into an exact subset |
| control CRT geometry | `GlobalControl` and construction control modules | encodes residue assignments and quadratic phase energy |
| cold blocks and level-set encoding | `GlobalControl.Partition`, `GlobalControl.LevelSetAssembly` | bounds the number of low-energy assignments |
| localization dichotomy | `GlobalControl.Localization` | separates high-floor and diagonal off-main assignments |
| high-floor absorption | `GlobalControl.LaplaceAboveFloor` | absorbs the encoded level sets in a Laplace sum |
| diagonal Gaussian tail | `GlobalControl.DiagonalGaussianTail` | controls large diagonal labels |
| mass pool and edge selection | `Construction.BlockPrimePool`, `Construction.MassPool` | supplies reciprocal load and selects the weighted denominator family |
| main arcs | `Certificates.MainArcWindow` and circle-method certificate modules | gives the centered Bernoulli/Gaussian lower bound |
| block-minor estimate | `Construction.MinorArc.BlockEstimate`, `FrequencyLanes` | reindexes by assignments with exact fiber multiplicity at most `b` |
| squarefree CRT reservoir damping | `Construction.MinorArc.ExtraSiblingChoice`, `ExtraGadgetDamping` | finds a prime divisor mismatch and multiplies uniform contractions |
| terminal parameter order | `Construction.ParameterSelection`, `Construction.MinorArc.Endgame` | chooses constants first and the base scale last |
| final assembly | `Construction.Certificates.Assembly`, `Construction.SemiprimeRepresentation` | combines all certificates into the avoiding theorem |

## 5. Released correspondence

The immutable release uses older module paths and an explicit Rosser--Schoenfeld analytic backend. The exact headline theorem lives under the released `RequestProject.Erdos306FormalConjectures` path, and `RequestProject.Audit` prints its dependencies. The paper cites the release and DOI as the current archived machine evidence; it does not require a reader to traverse the released file topology.

The downstream construction mechanisms in the article are reconstructed in mathematical language. Their clean names come from the frozen architecture context, while their current kernel-check evidence remains the released theorem. This is a versioned correspondence, not a claim that the two source trees are textually identical.

## 6. Trust-boundary wording approved for the manuscript

Accurate:

- “The paper proof invokes PNT and proves the local reciprocal-prime law by partial summation.”
- “The current archived Lean release uses two exact Rosser--Schoenfeld inputs.”
- “A later frozen refactor organizes the construction around two structural analytic interfaces.”
- “The frozen checkpoint is unreleased and still awaits its separate verification/disposition gates.”

Inaccurate and prohibited:

- “The released Lean theorem depends on PNT.”
- “The PNT-to-local-law bridge is already formalized in this repository.”
- “The structural axioms at `e55ef359...` are proved consequences in Lean.”
- “The frozen refactor is the current released proof authority.”
- “The paper's eventual interfaces change the source statement of either formal checkpoint.”

## 7. Remaining formal and correspondence gates

1. Detached exact-tip verification of `e55ef359...` and Director disposition.
2. Any later source repair or analytic bridge must be separately authorized.
3. Human-visible comparison of the released Rosser--Schoenfeld axiom transcriptions with the publisher scan.
4. Final check that manuscript theorem wording, released statement, and frozen public proposition remain extensionally identical.
5. A future PNT-based Lean backend, if pursued, is a separate workstream and release decision.
