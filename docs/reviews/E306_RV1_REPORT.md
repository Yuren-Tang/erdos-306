# E306-RV1 review report

Workstream: `E306-RV1-01`  
Role: bounded remote source, architecture, trust-boundary, and migration reviewer  
Reviewed repository: `Yuren-Tang/erdos-306`  
Immutable release reference: `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
Exact review base: `d3a8dcfb9c0c9bf0e0ad25e1da81b7b12e83e628`  
Frozen development tip: `e55ef359a8b98525f0bac6c7a510fcad94469bff`  
Exact interval: `d3a8dcfb9c0c9bf0e0ad25e1da81b7b12e83e628..e55ef359a8b98525f0bac6c7a510fcad94469bff`  
Interval size: **40 commits** (`ahead_by = 40`, `behind_by = 0`, merge base equal to the exact review base)  
Draft PR: `#1`, `clear-up <- codex/pushlinter`

## 1. Executive finding

**Recommended disposition: bounded revision.**

The frozen tip contains substantial publication-grade architectural improvement: the public proposition is separated from its implementation; `RequestProject.Public.Erdos306` is a short stable facade; the proof now terminates through a named construction theorem; the old flat `R2*`, aggregate, and conditional routes have been replaced by mathematical module paths; the audit entry point imports the public facade; and the workflow has explicit build, axiom, import, linter, and workflow-lint stages.

Immediate acceptance is nevertheless not responsible for four independent reasons.

1. **The interval changes the non-standard mathematical trust boundary.** The released Rosser--Schoenfeld axioms are replaced by `GlobalControl.pnt_dyadic_prime_density` and `GlobalControl.mertens_dyadic_window_mass`. This is not a rename or an engineering refactor. The new statements are mathematically plausible and precise enough to audit, but they are not verbatim source theorems, and the repository does not yet contain a proved bridge from a cited PNT/Mertens formulation or from the released explicit estimates.
2. **The latest workflow run is red.** For the run associated with the frozen head, the build, theorem/axiom gate, all four import-audit shards, and `actionlint` succeeded, but all four Lean-linter shards ended failed/cancelled. The overall workflow conclusion is therefore `failure`.
3. **Several public and architectural documents are stale relative to the source tree.** The README links the analytic boundary at `lean/RequestProject/AnalyticInputs.lean`, while the actual module is `lean/RequestProject/GlobalControl/AnalyticInputs.lean`; it also says CI runs on every push although `.github/workflows/ci.yml` restricts push runs to `main`. `docs/refactor-roadmap.md` likewise names `RequestProject.AnalyticInputs` as the intended leaf. `docs/architecture.md` still shows a `GlobalControl` aggregate handoff although `lean/RequestProject/GlobalControl.lean` was deleted in this interval.
4. **The interval is too broad to merge as a publication trust-boundary change without a clean exact-tip verification packet.** It mixes trust-boundary replacement, headline-module migration, proof-body changes, large-scale file movement/deletion, CI redesign, and documentation updates. Remote evidence is strong, but a clean local exact-SHA build, full linter completion, source import audit, and reproduced axiom output remain required.

No material change to the public mathematical proposition was found. The old theorem statement in `RequestProject.Erdos306FormalConjectures` and the new `def Erdos306 : Prop` have the same binders, hypotheses, witness shape, monotonicity condition, `omega/Omega` condition, and reciprocal-sum conclusion. The implementation bridge changed from `erdos_306_unconditional` to `hasEgyptianSemiprimeRepr_div_of_squarefree`.

## 2. Review method and evidence classes

This was a remote review only. No Lean command, Lake command, linter, or local compilation was run by this reviewer.

### 2.1 Remote evidence inspected

- GitHub exact comparison metadata for the corrected 40-commit interval, including ancestry and the complete changed-file list.
- Draft PR metadata and its declared base/head.
- Frozen-tip source for:
  - `RequestProject.Statement.Erdos306`;
  - `RequestProject.Public.Erdos306`;
  - `RequestProject.Erdos306`;
  - `RequestProject.Construction.SemiprimeRepresentation`;
  - `RequestProject.GlobalControl.AnalyticInputs`;
  - `RequestProject.Audit`;
  - `.github/workflows/ci.yml`;
  - `scripts/audit_imports.sh` and `scripts/dep_graph.py`;
  - `README.md`, `docs/environment.md`, `docs/refactor-roadmap.md`, and `docs/architecture.md`;
  - the pinned `lean-toolchain` and `lakefile.toml`.
- Exact-base source for the old `RequestProject.Erdos306FormalConjectures` theorem.
- GitHub Actions run metadata and job conclusions associated with the frozen head.

### 2.2 What remote inspection can establish

Remote inspection establishes source identity, ancestry, file-level movement, declaration text, explicit imports, workflow text, and the reported results of remote jobs. It also establishes that the PR base SHA `63801a68...` is an ancestor of the head (`ahead_by = 167`, `behind_by = 0`), so the pull-request synthetic merge tests the head tree without a competing base-side source change.

### 2.3 What remote inspection cannot establish alone

Remote inspection does not independently reproduce elaboration, invalidate local `.olean` files, prove that every direct import is complete under a fresh project build, finish the cancelled Lean-linter shards, or establish the mathematical derivation of the two new analytic axioms from a named primary source. Those checks are specified in `E306_RV1_LOCAL_VERIFICATION_PLAN.md`.

## 3. Public theorem and claimed source graph

### 3.1 Public proposition

At the frozen tip, `RequestProject.Statement.Erdos306` imports only Mathlib's arithmetic-function material and defines:

```lean
def Erdos306 : Prop :=
  forall (q : Rat), 0 < q -> Squarefree q.den ->
    exists k : Nat, exists (n : Fin (k + 1) -> Nat), n 0 = 1 and StrictMono n and
      (forall i in Finset.Icc 1 (Fin.last k), omega (n i) = 2 and Omega (n i) = 2) and
      q = sum i in Finset.Icc 1 (Fin.last k), (1 : Rat) / (n i)
```

The exact-base `RequestProject.Erdos306FormalConjectures.erdos_306` states the same proposition inline. I found no theorem-statement change. The new separation is a publication-grade improvement because it makes statement review independent of the proof graph.

### 3.2 Public facade and proof leaf

The public facade is intentionally minimal:

```text
RequestProject.Public.Erdos306
  imports RequestProject.Erdos306
```

The proof leaf imports:

```text
RequestProject.Erdos306
  imports RequestProject.Statement.Erdos306
  imports RequestProject.Construction.SemiprimeRepresentation
```

The short bridge in `Erdos306.lean` converts a positive rational to natural numerator/denominator data, invokes `hasEgyptianSemiprimeRepr_div_of_squarefree`, orders the finite semiprime set, proves `omega = Omega = 2`, and reconstructs the exact Formal Conjectures tuple.

### 3.3 Construction-facing leaf

`Construction.SemiprimeRepresentation` imports:

```text
Construction.Certificates.Assembly
CircleMethod.ReciprocalSelection
Core.UnitNumeratorReduction
```

It exposes the concrete route from `exists_arcConstruction` to avoiding reciprocal representations, handles denominators `1` and `2`, and then applies the pure unit-numerator reduction. This is materially clearer than the old `Erdos306Final -> erdos_306_unconditional` route.

### 3.4 Does the theorem still follow from the claimed graph?

**Remote answer: apparently yes, with strong but not final evidence.**

Evidence:

- the exact public statement is unchanged;
- the explicit source imports form a coherent path from statement to construction;
- the remote `build` job succeeded;
- the remote `verify` job successfully elaborated `RequestProject/Audit.lean` and passed the exact allowed-axiom gate;
- all four remote import-audit shards succeeded.

Qualification:

- the workflow overall is red because all four Lean-linter shards failed/cancelled;
- no clean local build at the exact SHA was run by this reviewer;
- source-level static inspection cannot exclude a stale artifact in an arbitrary local workspace;
- the GitHub build used the pull-request synthetic merge ref, although the PR base is an ancestor of the head and therefore there is no observed base-side tree conflict.

Accordingly, the source graph is not rejected, but it is not yet publication-cleared.

## 4. Trust boundary

### 4.1 Intended boundary at the frozen tip

The source, audit, workflow gate, README, and environment notes agree on the intended logical boundary:

- Lean standard axioms:
  - `propext`;
  - `Classical.choice`;
  - `Quot.sound`.
- Non-standard project axioms:
  - `GlobalControl.pnt_dyadic_prime_density`;
  - `GlobalControl.mertens_dyadic_window_mass`.

`RequestProject.Audit` prints the theorem, `#print axioms erdos_306`, and the two axiom declarations. The workflow parses the emitted axiom list, rejects `sorryAx`, requires both analytic names, and rejects anything outside the five-name allowlist.

### 4.2 Apparent boundary from remote verification

The remote `verify` job succeeded, including the gate labelled “sorry-free and exactly the two structural analytic axioms”. Thus the apparent elaborated boundary at the tested tree is exactly the intended set.

This is stronger than a source grep: it is Lean-generated `#print axioms` output checked by the workflow. It is still to be reproduced locally at the frozen SHA as part of release review.

### 4.3 Nature of the boundary change

The interval replaces source-specific explicit inputs with stronger construction-shaped inputs. That may be a good long-term architecture, but it changes what a reader must verify by hand.

The released boundary had a primary-source identity: named Rosser--Schoenfeld results with exact equation references. The frozen boundary instead states two consequences tailored to the dyadic construction. Their comments cite PNT and Mertens conceptually, not as exact formal source transcriptions. Therefore:

- the Lean theorem may be logically cleaner downstream;
- the mathematical audit burden moves upstream into proving these structural statements;
- publication prose must not describe them as verbatim Rosser--Schoenfeld results;
- a future release should either prove bridge lemmas from accepted source statements or document an exact paper proof with finite-cutoff verification.

## 5. Mathematical review of the two analytic inputs

### 5.1 `pnt_dyadic_prime_density`

Statement:

```lean
axiom pnt_dyadic_prime_density (k : Nat) (hk : 5 <= k) :
  (2 ^ k : Real) / (2 * Real.log (2 ^ k)) <= ((dyadicBlock k).card : Real)
```

Assessment:

- **Precision:** formally precise; the dyadic block object fixes the prime interval and the inequality has an explicit cutoff and constant.
- **Sufficiency:** evidently sufficient for downstream prime-cardinality supply, because the remote axiom audit reports it as a dependency and the proof graph builds at the tested tree.
- **Mathematical status:** a PNT asymptotic gives the inequality only for sufficiently large `k`. The asserted universal cutoff `k >= 5` additionally requires a finite explicit check between `5` and the asymptotic threshold, or an explicit estimate strong enough to cover the whole range.
- **Documentation issue:** the comment says the cutoff is “part of this formal structural input”, which is honest, but README prose calls the claim a coarse eventual consequence while displaying the fixed cutoff. A publication source must account for that fixed cutoff.
- **Recommendation:** retain the stable downstream wrapper, but place the raw axiom behind a proved bridge. A clean option is: primitive PNT theorem -> eventual dyadic bound -> finite verification for the remaining values -> current wrapper theorem. An alternative is a direct Rosser--Schoenfeld bridge proving the exact current inequality.

### 5.2 `mertens_dyadic_window_mass`

Statement:

```lean
axiom mertens_dyadic_window_mass :
  exists k1 : Nat, 5 <= k1 and forall k0 : Nat, k1 <= k0 ->
    (21 : Real) / 20 <=
      sum p in (Finset.Icc k0 (3 * k0)).biUnion dyadicBlock, (1 : Real) / (p : Real)
```

Assessment:

- **Precision:** formally precise; the statement quantifies an eventual cutoff and fixes the mass threshold.
- **Sufficiency:** sufficient for the downstream reciprocal-prime mass route at the tested tree.
- **Mathematical status:** Mertens' reciprocal-prime theorem implies that the reciprocal mass in a multiplicative window from roughly `X` to `X^3` tends to `log 3`, which exceeds `21/20`. Hence the existence of `k1` is mathematically natural.
- **Endpoint mismatch in prose:** `Finset.Icc k0 (3*k0)` includes the block at index `3*k0`. If `dyadicBlock j` is `[2^j, 2^(j+1))`, the union extends to approximately `2^(3*k0+1)`, not exactly `[X, X^3)`. This does not damage the asymptotic implication, but the comment and README should describe the actual union or change the index interval only after a separate mathematical decision.
- **Recommendation:** prove the wrapper from a primitive Mertens asymptotic theorem and an explicit eventual-inequality lemma; correct the window prose to match the inclusive block endpoint.

### 5.3 Joint assessment

The pair is mathematically coherent and construction-appropriate. Neither statement is unexplained in the sense of being arbitrary: each has a clear classical analytic origin. However, they remain **unproved non-standard axioms with only conceptual citations**. For publication-grade trust accounting, that is a boundary change requiring explicit Director approval and a bridge plan, not an automatic improvement over the released boundary.

## 6. Stale-olean, transitive-import, hidden-dependency, and migration risks

### 6.1 Stale `.olean` risk

The roadmap itself records the correct warning: a cached `.olean` is not a source check. This interval changes declaration paths, deletes aggregates, renames the headline module, and changes many imports. Such changes are exactly those most likely to be masked by a dirty project build.

The GitHub workflow reduces this risk by compiling from a clean checkout and uploading the project build output from one build job to later jobs. The later jobs restore artifacts produced in the same run. That is acceptable CI engineering, but the release packet still needs a fresh exact-SHA local build after deleting `lean/.lake/build`.

### 6.2 Transitive-import and hidden-dependency risk

Positive evidence:

- all four remote `audit_imports.sh` shards succeeded;
- the script separately builds each module, copies its source, appends `#redundant_imports` and `#min_imports`, and fails on elaboration or “missing imports”;
- many aggregate and historical route files were deleted rather than left as broad imports.

Residual risk:

- the script treats transitive redundancy as informational, so it does not enforce a minimal direct-import graph;
- a direct import can remain merely documentary even when transitive, which is reasonable, but release review must inspect high-level confluences rather than infer minimality from a green job;
- documentation still refers to deleted or moved aggregates, showing that migration state is not fully synchronized.

### 6.3 Migration risk

The interval performs a genuine architecture migration, not a cosmetic move. Major old route files are deleted while replacements are added under `CircleMethod/`, `Construction/`, `Core/`, `GlobalControl/`, and `LocalEnergy/`. Several files are classified by GitHub as renames with nontrivial edits, while many old monoliths are removed and their contents redistributed.

The most important migration risk is not a single missing file but **confluence integrity**: whether the new circle-method, construction-certificate, local-energy, and global-control routes meet with the same theorem statements and constants. The successful build/audit/import jobs are strong evidence, but the failed overall workflow and broad mixed scope justify bounded revision before release.

## 7. Publication-grade improvements, engineering changes, and trust-boundary changes

### 7.1 Publication-grade improvements

- Stable proposition module `Statement/Erdos306.lean` independent of proof architecture.
- Stable public facade `Public/Erdos306.lean`.
- Short visible bridge from project-native semiprime representation to the Formal Conjectures statement.
- Mathematical directory names replacing much of the `R2*` and aggregate topology.
- Dedicated `Audit.lean` importing the public theorem and printing the complete trust boundary.
- Explicit comments distinguishing standard axioms from the two non-standard analytic inputs.
- Removal of the conditional `MainTheorem -> SBEE` route and obsolete final shims from the active graph.

### 7.2 Engineering-only or primarily engineering changes

- Workflow build artifact reuse and job sharding.
- `concurrency` cancellation policy.
- `actionlint` integration.
- Builtin Lean linter matrix.
- Static dependency-graph script and full-library import-audit script.
- Proof-script normalization (`ring_nf`, binder cleanup, small arithmetic/tactic adjustments) where theorem statements are unchanged.
- Pure module renames and documentation map updates.

### 7.3 Trust-boundary changes

- Removal of the Rosser--Schoenfeld axiom leaf from the active route.
- Introduction of `pnt_dyadic_prime_density` and `mertens_dyadic_window_mass` as the two non-standard dependencies.
- README and CI claims rephrased from “verbatim cited explicit estimates” to structural PNT/Mertens inputs.

This third category must be reviewed and approved independently of the first two.

## 8. Compatibility shims, historical names, dead routes, and blockers

### 8.1 Removed or apparently retired routes

The exact interval removes major historical modules including:

- `ArcConstruction.lean`, `ArcConstructionSigma.lean`;
- `BlockCRTEnergy.lean`, `BlockMassPool.lean`, `BlockSystemConstruction.lean`;
- `CircleMethodArcs.lean`, `CircleMethodAssembly.lean`;
- `DyadicPrimes.lean`, `Erdos306Final.lean`, `FiberCount.lean`, `GlobalControl.lean`;
- the large `R2AssemblyFields`, `R2Certificates`, `R2FinalAssembly*`, `R2TopAssembly`, and related minor-arc support files;
- `Construction/MinorEndgame.lean` and `LocalEnergy/CRTModel.lean`, replaced by more specific modules.

That deletion pass is a positive sign: the tip is not merely accumulating aliases.

### 8.2 Historical names still present

Historical vocabulary remains in internal theorem names and files (`gadget`, `endgame`, `lane`, `supply`, `certificate`) under `Construction`. The architecture document explicitly permits internal migration names temporarily but excludes them from new public names. These do not presently alter the headline API, but they should be classified as internal and provisional in release notes.

### 8.3 Stale documentation and dead references

Release-blocking documentation mismatches found remotely:

1. README links a nonexistent/moved `lean/RequestProject/AnalyticInputs.lean`; actual file: `lean/RequestProject/GlobalControl/AnalyticInputs.lean`.
2. README says CI runs “on every push”; workflow push trigger is restricted to `main`.
3. README says linter/actionlint are “on pushes” and sequenced after verification; the YAML has no push-only condition and `workflow-lint` does not depend on `verify`.
4. `docs/refactor-roadmap.md` says `RequestProject.AnalyticInputs` remains the analytic leaf; actual module path is `RequestProject.GlobalControl.AnalyticInputs`.
5. `docs/architecture.md` still presents `GlobalControl.Partition -> GlobalControl (public aggregate only)` and then describes an aggregate re-export, while `lean/RequestProject/GlobalControl.lean` is removed in the exact interval.
6. `docs/environment.md` states the public proof and audit build successfully; remote evidence supports a successful build/audit at the tested tree, but the overall latest workflow is red and this qualification should be recorded.

### 8.4 Release blockers

- unresolved red workflow due to four cancelled/failed Lean-linter shards;
- no exact-tip clean-local verification packet returned with this review;
- structural axioms lack an exact proved or paper-level source bridge;
- public documentation has stale module paths and workflow descriptions;
- one mathematical prose mismatch remains for the inclusive Mertens dyadic endpoint.

## 9. Recommended bounded revision slices

### Slice 1 — exact-tip verification and CI closure

No theorem or architecture edits. Run the clean verification plan at `e55ef359...`; finish all four linter shards; capture audit output; confirm all import-audit shards; run `actionlint`; record exact commands and outputs. If linter cancellation was infrastructure-only, obtain one fully green workflow run. If it exposes source warnings/errors, fix them in a separately approved Lean-edit slice.

### Slice 2 — trust-boundary source bridge

Keep the current stable wrappers and downstream interfaces. Add, under Director-approved mathematical scope, one of:

- primitive PNT/Mertens formal statements plus proved dyadic corollaries; or
- explicit Rosser--Schoenfeld bridge lemmas proving the current structural statements; or
- a publication appendix proving the exact cutoff/window claims, with the Lean axioms explicitly matching that appendix.

This slice must also decide whether `k >= 5` is retained and whether the Mertens union should be `Icc k0 (3*k0)` or a half-open index interval.

### Slice 3 — documentation synchronization

Correct all module paths, CI trigger descriptions, aggregate references, and the Mertens endpoint prose. State clearly that v0.0.3 is the immutable Rosser--Schoenfeld release, whereas the frozen development tip has a different structural boundary.

### Slice 4 — migration residue audit

Run the static graph from both `Public.Erdos306` and `Audit`; inspect all unreachable modules; search for imports/declarations using deleted historical route names; decide which remaining aliases are intentional compatibility shims and assign an expiry. Do not combine this deletion pass with trust-boundary work.

### Slice 5 — PR decomposition decision

Because PR #1 contains 167 commits while this review interval contains 40, the Director should decide whether to:

- split the trust-boundary replacement from the architecture migration and CI changes; or
- supersede PR #1 with a clean branch stack preserving the same final tree.

My recommendation is **split if history is still tractable; otherwise supersede with a short reviewable branch stack**. Merging the present broad PR as one publication-grade change is not recommended.

## 10. Precise disposition

**Disposition: bounded revision; do not merge, tag, release, or make a new publication-grade Lean claim from the frozen tip yet.**

Remote conclusions:

- exact review ancestry is expected and the corrected interval is 40 commits;
- public proposition is unchanged;
- source architecture is materially improved;
- apparent axiom boundary is exactly three Lean standard axioms plus the two named structural inputs;
- remote build, audit gate, import audit, and workflow lint succeeded at the tested pull-request tree;
- latest workflow is nevertheless red because all four Lean-linter shards failed/cancelled;
- the two new analytic inputs are coherent but are a genuine, not-yet-bridged trust-boundary change;
- documentation and architecture maps contain stale references.

Director decisions still required:

1. approve, revise, or reject the structural PNT/Mertens boundary as the next release boundary;
2. choose the exact source/bridge strategy for both analytic inputs;
3. decide the inclusive endpoint of the Mertens dyadic window;
4. decide split versus supersede for PR #1;
5. authorize any Lean edits needed after exact-tip linter verification;
6. decide the expiry policy for remaining internal historical names and compatibility aliases.

The bounded review unit is complete once the three review documents are committed and pushed and the final issue handoff is posted.
