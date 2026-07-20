# Erdős 306 — Review B report

Role: `Erdős 306 — Review B` (`E306-REVIEW-B`)  
Review class: bounded independent mathematical assurance  
Fixed manuscript candidate: `paper/arxiv-v1-recovery-v1@f04a7ac7064877920890b282c246ffe6867f58bb`  
Controlling formal authority: `v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`  
Secondary read-only source: `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`

## Final classification

**BOUNDED MATHEMATICAL REVISION REQUIRED**

I found no `MATERIAL-MATHEMATICAL-GAP` in the implication from the accepted eventual prime supplies to the released headline theorem. The finite construction, spectral positivity argument, global-control theorem, component separation, small-denominator reductions, numerator induction, and finite ordered-sequence bridge can all be reconstructed from the fixed candidate together with exact declarations in the released source. The parameter order is non-circular, and the final inequalities can be simultaneously satisfied.

The manuscript is nevertheless not yet a journal-referee-depth human proof of this downstream implication. Several load-bearing passages—especially P16–P23 and P27–P32—are theorem-shaped summaries of a much longer argument. Some omit exact hypotheses or exception terms; one control-load explanation is mathematically insufficient as stated; and the terminal construction suppresses definitions and inequalities needed to verify the claimed minor-arc partition independently. These are bounded manuscript repairs, not a new proof programme and not a defect in the released theorem.

## Scope and evidence discipline

I audited the complete downstream route beginning with the two accepted eventual supply interfaces and ending with the public finite-tuple theorem. I did not reopen Review A's PNT-to-supply analysis except to verify that the downstream construction consumes only eventual thresholds and chooses the bottom scale last.

The evidence order used was:

1. exact declarations, signatures, proof bodies, imports, and actual consumers at `v0.0.3`;
2. the reorganized proof graph at `codex/pushlinter` where it clarifies decomposition;
3. comments and architecture prose only as search leads.

The released audit entry point `lean/RequestProject/Audit.lean` imports the public theorem, checks `Erdos306.erdos_306`, and requests its axiom audit against the two Rosser–Schoenfeld declarations. The exact source chain inspected is consistent with the manuscript's five-item audit statement. The connected GitHub interface did not expose a workflow run or permit a fresh local Lean build in this review, so this report does not claim to have independently rerun the kernel or CI. It verifies declarations and consumers at the immutable release ref and records that execution limitation separately from the mathematical findings.

## Independent mathematical reconstruction

### 1. Components, distinctness, squarefreeness, and avoidance

For squarefree `b >= 3`, take the obstruction-prime set `R = b.primeFactors` and a dyadic block support `B` beginning above both `b` and the finite forbidden denominator set `T`. The released construction chooses the block system only after all fixed constants and thresholds have been selected. Consequently every block prime exceeds `b`, is coprime to `b`, and lies outside `R`.

The denominator set is the union of three types:

- control denominators, products of two distinct block primes along the internal and adjacent-block control graph;
- a residual mass batch, selected from unused products `p q` with distinct block primes;
- gadget denominators `r s`, with `r in R` and a high-block prime `s` in the gadget set.

Unique factorisation gives injectivity of the product map on ordered distinct-prime pairs. Control products are removed before the mass batch is selected. A gadget product has one prime factor in `R` and one outside `R`, whereas control and mass products have both factors in the block support; hence the gadget family is disjoint from both two-block-prime families. Distinct gadget pairs also have distinct products. Every denominator is therefore a product of two distinct primes and hence is a squarefree semiprime.

Avoidance is obtained by choosing the bottom scale above `T.sup`. The release proves lower bounds of the form `2^(2 k0) <= e` for control and gadget denominators and selects the mass batch from the same large pair pool. Thus no selected denominator belongs to `T`. The exact released assembly is in `R2TopAssembly.exists_r2_foundation_dyadic`, `exists_r2_data_of_numerics_set`, the semiprime and avoidance fields consumed by `exists_arcConstruction_final`, and finally `CircleMethod.Wcount_pos_imp_repr`.

The manuscript conveys the intended separation, but it must define the actual control graph and the order in which products are deleted and selected. “Choose sufficiently many pairs” is not enough to recover the energy identity or the load estimates.

### 2. Finite Fourier identity, no-wrap, and positivity

Let

`L = b * product_{p in B} p`.

Each selected denominator divides `L`: control and mass denominators divide the block-prime product, and `r s` divides `L` because `r | b` and `s in B`. For Bernoulli weights `theta_e`, the deterministic weighted count is

`W = sum_{S subset E, sum_{e in S} 1/e = 1/b} product_{e in S} theta_e product_{e in E\S}(1-theta_e)`.

Expanding the product at each frequency and applying finite character orthogonality yields the manuscript's Fourier identity with phase

`exp(2 pi i h (L/e)/L)`

and target phase

`exp(-2 pi i h (L/b)/L)`.

The conventions agree with `CircleMethod.charterm_expand`, `fourier_orthogonality`, `fourier_indicator`, and `wcount_fourier_identity`. The released no-wrap lemma requires `b >= 2`, positivity and divisibility of every edge, and

`sum_{e in E} L/e < L`.

The construction gives the stronger real load inequality

`sum_{e in E} 1/e < 3/b <= 1`

for `b >= 3`, so congruence modulo `1` is exact equality. A positive main real part exceeding the norm of the complementary sum forces `W > 0` by `CircleMethod.positivity_from_arcs`; `W > 0` then supplies an exact subset by `exists_subset_of_Wcount_pos` and `Wcount_pos_imp_repr`.

This part of the manuscript is mathematically sound. It would benefit from stating the precise no-wrap hypotheses next to the identity rather than referring only to “load below one.”

### 3. Control geometry and global control

For a frequency `h`, its residues on block primes define a global assignment. The control energy is the sum, over internal and adjacent-block control pairs, of the squared centred CRT representative divided by the squared prime product. The exact decomposition into internal and bipartite energies is what permits local cold-block analysis and gives the exact quadratic identity for a globally constant small label.

The released global-control route is substantially more detailed than the manuscript synopsis:

- low block energy gives a dominant residue label only under explicit density, cardinality, dominance, and scale hypotheses;
- a small exceptional set is retained and charged;
- the adjacent-label penalty is an exception-aware theorem with lower bounds on the reduced block cardinalities and upper bounds on the integer labels;
- cold labels outside the initial small window require non-wrapped and wrapped large-label arguments;
- admissible extended labels, hot blocks, boundary blocks, segment starts, and an injective reconstruction of the assignment are needed for the level-set count;
- the fixed factor `exp(A * numBlocks)` is chosen before the bottom-scale threshold so that the global forcing floor can absorb it.

The exact released level-set theorem is `GlobalControl.global_levelset_final`: for every `0 < eps < 1`, there are fixed `k0min` and `A > 0` such that, for admissible `BS` and `R >= 1`,

`#{a : Qctrl(a) <= R} <= exp(A numBlocks) exp(8 eps R) (1 + sqrt(R)/sigmaCtrl)`.

The localization theorem `GlobalControl.g6_localization` proves that an assignment outside the global main arc is either above the fixed forcing floor or belongs to the exact diagonal sector, where a common integer label `m` satisfies both the residue identities and

`Qctrl(a) = m^2 sigmaCtrl^2`.

The high-floor sector is summed by the level-set Laplace estimate, and the diagonal sector is injected into the integer labels and bounded by a Gaussian tail. Their released assembly is `GlobalControl.global_control_partition_final`:

`sum_{a notin mainArc(C)} exp(-c Qctrl(a))
 <= (eta + Ctail exp(-c C^2/2))/sigmaCtrl`.

No circular quantifier was found: `A`, the forcing constants, and the tail constant are fixed before the final bottom-scale threshold. This closes a quantifier-order issue that would arise if an arbitrary later global constant were allowed.

The manuscript's P17–P23 treatment is not sufficient for an independent human verification. In particular, the unqualified assertion that distinct adjacent labels force the displayed penalty is stronger than the actual exception-aware theorem unless its omitted hypotheses are restored. The correct implication is available and used in the release, so the repair is to state and prove the right human lemmas, not to change the theorem.

### 4. Control load, mass pool, weights, and variance

The mass-pool identity is correct:

`sum_{p<q} 1/(p q) = ((sum_p 1/p)^2 - sum_p 1/p^2)/2`.

The accepted inclusive-window prime mass and the reciprocal-square tail imply that this pool has load at least `1/2`. Since `3/(2b) <= 1/2` for `b >= 3`, and the control products have already been removed, the remaining pool can fill the residual target. The greedy reciprocal-window lemma selects a finite set whose load falls in the required half-open interval.

If `Lambda = sum_{e in E} 1/e` and `theta_e = 1/(b Lambda)`, then

`3/(2b) <= Lambda < 3/b`

implies

`1/3 < theta_e <= 2/3`

and gives the exact mass identity `sum theta_e/e = 1/b`.

The control-load sentence in the manuscript is not a proof. Quadratic size of individual semiprime denominators does not by itself control the total reciprocal load because the number of edges grows. The released proof first establishes a dyadic reciprocal-prime upper bound, sums the internal and adjacent complete bipartite edge loads, and obtains

`recipLoad(ctrlEdges BS) <= 512/(k0-1)`

in `R2BaseLoadUpper.ctrl_recipLoad_le_tail`; hence the load is eventually smaller than any fixed positive budget by `dyadic_control_recipLoad_eventually_small`. This argument must replace the manuscript's present heuristic.

For the variance, the control edges supply

`(2/9) sigmaCtrl^2 <= sigmaE2`,

while the mass and gadget inverse-square contributions are made small by the final scale choice. The released terminal assembly proves

`sum_{e in E} 1/e^2 <= 1000001 sigmaCtrl^2`

and therefore

`sqrt(sigmaE2) <= 501 sigmaCtrl`,

as well as the lower comparison

`sqrt(2/9) sigmaCtrl <= sqrt(sigmaE2)`.

The manuscript states the comparison but does not reproduce the componentwise inverse-square bounds or a usable constant. This is a bounded but load-bearing exposition repair.

### 5. Main arc

With `sigmaE2 = sum theta_e(1-theta_e)/e^2`, the linear term in the Bernoulli logarithm cancels the target phase by the exact mass identity. The released proof also establishes the conditions needed to use the complex logarithm: the factors are nonzero on the small arc, each `|m/e| <= 1/10`, and the total cubic remainder is at most `1/10`. It then obtains a per-label real lower bound of `0.8` times the Gaussian, pairs `m` with `-m` to make the main sum real, and applies a finite Gaussian-window lower bound. The exact declarations are `sum_logphi_bound`, `term_label_eq`, `term_label_re_lower`, `main_re_lower`, `main_sum_re_lower`, and `main_sum_im_zero` in `CircleMethodMainTerm.lean`.

Writing

`c3 = 0.8 * exp(-pi^2/2)/2`,

the main contribution is at least

`c3/sqrt(sigmaE2) >= c3/(501 sigmaCtrl)`.

The manuscript gives the architecture and correct main constant, but it omits the log-branch/nonvanishing argument and the exact smallness hypotheses used to justify the expansion. Those conditions must be visible in a journal-depth proof.

### 6. Block-minor fibre and extra gadget reservoir

The minor frequencies are partitioned, not all frequencies. The precise sets are

- `Sm ∩ {h : a(h) notin mainArc(C)}` for the block lane;
- `Sm ∩ {h : a(h) in mainArc(C)}` for the extra lane.

This intersection matters because the integer label window is `[-N,N]` with `N = ceil(C/sigmaCtrl)`; the endpoint `N` may lie outside the strict global main-arc inequality. The release defines the two sets correctly in `R2MainArcClassification.mainArcBlockSet` and `mainArcExtraSet`. The manuscript wording is ambiguous and should be repaired.

For a fixed block assignment, equality of the residues modulo every block-support prime fixes `h` modulo the block-prime product `P`. Since `0 <= h < L = b P`, each fibre has at most `b` elements. This is the exact content consumed by `R2TopAssembly.r2_blockFiberTail`, through `mainArc_fiber_card_le`; the extra energy is `QE - Qctrl >= 0`. Thus the block lane contributes at most `b` times the global-control tail.

For the extra lane, global-main-arc membership supplies a small integer label `m` congruent to `h` modulo each block prime. If it were also congruent modulo all prime divisors of squarefree `b`, then it would be congruent modulo `L`, hence would coincide with a main frequency; the minor condition therefore gives at least one mismatch prime `r | b`. Choose `G` distinct high-block primes `s`, all much larger than `2|m|`, and include the sibling denominators `r s`. For each such denominator the phase is separated by more than `1/(2r)`, giving the Bernoulli-factor bound

`|factor_{r s}(h)| <= beta_r := sqrt(1 - (8/9)/r^2) <= beta_b < 1`.

The products over the `G` siblings yield `beta_b^G`. The exact released reservoir interface records `rfun`, `Gset`, `mfun`, the congruence and mismatch conditions, `2|m| < s`, edge membership, weight bounds, and the finite budget. Relevant declarations are `R2MultiGadgetReservoir`, `multiGadgetBoundData_of_reservoir`, `r2MultiGadgetReservoir_of_pointwise_budget`, and `exists_r2_minorReady_from_multiGadget_lanes`.

The manuscript has the correct idea, but it must exhibit the reservoir data and prove availability, edge membership, small-label separation, and the finite count bound rather than treating them as automatic consequences of “many sibling primes.”

### 7. Parameter order and terminal inequalities

The released order is sound and can be reconstructed as follows. Let

`c3 = 0.8 * exp(-pi^2/2)/2`, `Ksigma = 501`.

1. Set `eta = c3/(4 Ksigma b)`.
2. Apply global control and obtain its threshold and `Ctail`.
3. Choose `C >= 3` so that
   `b Ctail exp(-C^2(16/9)/2) < c3/(4 Ksigma)`.
4. Set
   `Dmp = c3/(4 Ksigma b(2C+3))`.
5. Choose `G` with `beta_b^G <= Dmp`.
6. Only then choose `k0` above every global-control, density, control-load, obstruction, gadget, Taylor, and finite-size threshold.
7. Put `N = ceil(C/sigmaCtrl)`.

The terminal assembly proves

`(2N+1) sigmaCtrl <= 2C+3`.

The three minor budgets satisfy

`b eta = c3/(4 Ksigma)`,

`b Ctail exp(-C^2(16/9)/2) < c3/(4 Ksigma)`,

and

`b(2N+1) Dmp sigmaCtrl <= c3/(4 Ksigma)`.

After division by `sigmaCtrl`, their sum is strictly smaller than

`3 c3/(4 Ksigma sigmaCtrl) < c3/(Ksigma sigmaCtrl) <= c3/sqrt(sigmaE2)`.

This proves the required strict main/minor separation. The exact construction theorem is `CircleMethod.exists_arcConstruction_final`. The candidate's constant-first/scale-last description is correct, but the terminal section needs this dependency table and the three displayed budget computations.

### 8. Small denominators, numerator reduction, and the public sequence

The release treats `b = 2` by constructing disjoint avoiding representations of `1/3` and `1/6` and using `1/2 = 1/3 + 1/6`. It treats `b = 1` by constructing mutually disjoint avoiding representations of `1/2`, `1/3`, and `1/6` and using `1 = 1/2 + 1/3 + 1/6`. These are not assertions that `2`, `3`, or `6` themselves are admissible semiprime denominators; they are target-denominator decompositions followed by the `b >= 3` construction. The manuscript's wording is consistent with that interpretation but should make it explicit.

The arbitrary numerator follows by induction: given a representation of `a/b`, call the avoiding unit theorem with the already-used denominator set and adjoin a disjoint representation of `1/b`. This is `reduction_to_unit_numerator_avoiding` and is complete.

The problem statement and released public theorem require a finite strictly increasing tuple, not an infinite sequence. `Erdos306.erdos_306` orders the nonempty finite denominator set with `Finset.orderEmbOfFin`, prepends the dummy anchor `1`, proves strict monotonicity, translates each constructed `IsSemiprime` denominator to `omega = Omega = 2`, and reindexes the finite sum. The manuscript states a finite set theorem but does not display this final indexing bridge. A short paragraph suffices. Issue #34's phrase “finite-to-infinite sequence bridge” is itself a documentation error; no infinite sequence occurs in the controlling formal statement.

## Finding classes

### `TRANSLATION-FIDELITY`

- The adjacent-label penalty is stated without the release's exception sets, reduced-cardinality hypotheses, and label-size hypotheses.
- The control-load conclusion is attributed to denominator growth rather than the required dyadic reciprocal-sum and graph-tail estimate.
- The minor-lane prose does not explicitly intersect the global-main-arc classification with the Fourier minor set.
- The finite ordered-tuple bridge is absent from the manuscript.
- “`omega = Omega = 2` equivalently” is mathematically correct, but the cited bridge declaration proves the direction actually consumed; the converse should be proved in prose or not presented as an exact formal equivalence.

### `HUMAN-EXPOSITION-GAP`

The principal gaps are the exact control graph; P17–P23; the componentwise inverse-square/variance estimates; main-arc analytic side conditions; the bounded-multiplicity proof; the exact reservoir interface; and the final budget chase. All have released formal declarations and can be repaired in bounded manuscript sections or appendices.

### `FINITE/KERNEL-RESIDUAL`

No load-bearing finite computation or unproved kernel residual was found in the released downstream theorem. The final sequence bridge and finite CRT/fibre arguments are proved. The PNT paper bridge remains outside the released Lean theorem, as already disclosed and reviewed separately.

### `ALTERNATIVE-HUMAN-PROOF-REVIEW`

The paper presents an architecture-level human route for P17–P23 rather than reproducing the release's granular G5/G6/G7 chain. That is permissible, but the alternative route must state enough quantitative lemmas to be independently checked. At present it does not.

### `MATERIAL-MATHEMATICAL-GAP`

None found.

### `DOCUMENTATION-STATUS DEFECT`

Several Lean comments retain superseded “sorry”, “in progress”, or old analytic-input descriptions even though the active declarations and consumers are proved. `Erdos306Final.lean` also contains a stale comment listing three analytic inputs, whereas the controlling `Audit.lean` and manuscript audit identify the two Rosser–Schoenfeld inputs. These comments are not formal evidence and do not affect the theorem, but should be cleaned separately. The proof ledger also overstates “PAPER-PROVED” for several claims that are only sketched at mechanism level.

## Formal/manuscript correspondence disposition

- The paper's PNT backend and the release's Rosser–Schoenfeld backend remain correctly separated.
- The downstream construction consumes structural eventual density and cumulative reciprocal-mass interfaces; no additional external theorem was found.
- The released finite theorem is at least as strong as the paper's sufficiency direction and supplies the exact finite ordered-tuple form. The paper's necessity direction is elementary and separate.
- The secondary `pushlinter` source was useful only for decomposition and exact local-energy hypotheses. Its structural analytic assumptions were not treated as paper premises or release authority.
- No active PDL branch was used as authority or as a shortcut.

## Required bounded revision package

Before journal or arXiv readiness is reconsidered, the manuscript should add an exact downstream lemma chain or a detailed appendix covering:

1. the block system, control graph, and control-load proof;
2. exception-aware cold labels, boundary penalties, global level sets, localization, and the two tail estimates;
3. mass-selection and variance constants;
4. main-arc side conditions;
5. the exact minor-frequency split, fibre bound, reservoir construction, and damping budget;
6. the parameter dependency table and terminal strict inequality;
7. the finite-set-to-ordered-tuple bridge;
8. synchronized proof-ledger statuses.

These repairs are bounded because the necessary statements and proofs already exist in the controlling release. They should be routed to E306-PDL/manuscript revision only after E306-DIR disposition.

## Integrity statement

This review added report files only on `review/e306-p1-construction-v1`. It did not modify the fixed candidate, any `paper/` or `lean/` source, released refs, workflows, tags, DOI records, or publication surfaces.