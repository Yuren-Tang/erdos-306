# Proof ledger — Erdős 306 arXiv manuscript v1

## Scope and authority

- **Immutable proof authority:** `Yuren-Tang/erdos-306:v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`
- **Archived DOI:** `10.5281/zenodo.20767390`
- **Manuscript branch:** `paper/arxiv-v1`
- **Context-only frozen development ref:** `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff`
- **Status vocabulary**
  - **Kernel checked:** the named declaration and its imported dependencies are accepted by the released Lean kernel environment.
  - **Source-transcribed:** an external statement is represented as an axiom in Lean; the source location is recorded, but the mathematical proof is external to the kernel.
  - **Expository reconstruction:** prose assembles or interprets kernel-checked declarations; the prose itself is not kernel checked.

## Exact released trust boundary

`lean/RequestProject/Audit.lean` prints the axioms of the headline theorem. The exact audit is:

1. `propext`
2. `Classical.choice`
3. `Quot.sound`
4. `RosserSchoenfeld.rosser_schoenfeld_cor3`
5. `RosserSchoenfeld.rosser_schoenfeld_thm5`

Items 1–3 are standard Lean foundations. Items 4–5 are the only nonstandard mathematical assumptions. No structural PNT axiom, asymptotic Mertens axiom, SBEE axiom, or construction-local prime-distribution axiom occurs in the released audit.

## Ledger

### P0. Semiprime definition and elementary properties

- **Mathematical statement:** `IsSemiprime n` means `n = p q` for distinct primes `p < q`; such an `n` is positive and squarefree.
- **Lean declarations:** `IsSemiprime`, `IsSemiprime.pos`, `IsSemiprime.squarefree`.
- **Module:** `lean/RequestProject/Defs.lean`.
- **Dependencies:** Mathlib primality, multiplication, and squarefree lemmas.
- **External analytic input:** none.
- **Human-readable proof:** present in `paper/main.tex`, Sections 1–2.
- **Status:** kernel checked; exposition reconstructed.
- **Gap:** none.

### P1. Necessary squarefree denominator

- **Mathematical statement:** if a rational is a finite sum of unit fractions with squarefree denominators, then its reduced denominator is squarefree.
- **Lean declaration:** `necessity_squarefree_denom`.
- **Module:** `lean/RequestProject/Defs.lean`.
- **Dependencies:** denominator of a sum divides a common squarefree product/lcm; finite-set arithmetic.
- **External analytic input:** none.
- **Human-readable proof:** present in `paper/main.tex`, Section 1.
- **Status:** kernel checked; exposition reconstructed.
- **Gap:** none.

### P2. Rosser–Schoenfeld dyadic-prime input

- **Mathematical statement:** for real `x ≥ 41/2`,
  `3*x/(5*log x) < π(⌊2x⌋) - π(⌊x⌋)`.
- **Lean declaration:** `RosserSchoenfeld.rosser_schoenfeld_cor3`.
- **Module:** `lean/RequestProject/RSPrimeSums.lean`.
- **Primary source:** J. B. Rosser and L. Schoenfeld, *Approximate formulas for some functions of prime numbers*, Illinois J. Math. 6 (1962), Corollary 3, equation (3.8), p. 69; DOI `10.1215/ijm/1255631807`.
- **Dependencies:** accepted as an axiom.
- **External analytic input:** this is external input 1 of 2.
- **Human-readable proof:** the external proof is not reproduced; the exact statement and its use are present in Section 3.
- **Status:** source-transcribed axiom; downstream uses kernel checked.
- **Gap:** before arXiv submission, perform a final visual comparison against the publisher scan; automated publisher access was blocked during this work unit.

### P3. Rosser–Schoenfeld reciprocal-prime-sum input

- **Mathematical statement:** there is one real constant `B` giving the lower bound for `x > 1` and upper bound for `x ≥ 286`,
  with errors `1/(2(log x)^2)`, for the sum of `1/p` over primes `p ≤ ⌊x⌋`.
- **Lean declaration:** `RosserSchoenfeld.rosser_schoenfeld_thm5`.
- **Module:** `lean/RequestProject/RSPrimeSums.lean`.
- **Primary source:** Rosser–Schoenfeld (1962), Theorem 5, equations (3.17)–(3.18), p. 70; same DOI.
- **Dependencies:** accepted as an axiom.
- **External analytic input:** this is external input 2 of 2.
- **Human-readable proof:** the external proof is not reproduced; the exact statement and endpoint subtraction are present in Section 3.
- **Status:** source-transcribed axiom; downstream uses kernel checked.
- **Gap:** same final publisher-scan comparison as P2.

### P4. Dyadic prime density

- **Mathematical statement:** for `k ≥ 5`, the dyadic block `[2^k,2^(k+1))` contains at least `2^k/(2 log(2^k))` primes.
- **Lean declaration:** `GlobalControl.dyadic_prime_density`.
- **Module:** `lean/RequestProject/RSPrimeSums.lean`; compatibility import `DyadicPrimes.lean`.
- **Dependencies:** P2 plus elementary floor and logarithm inequalities.
- **External analytic input:** P2 only.
- **Human-readable proof:** present in Section 3.
- **Status:** kernel checked.
- **Gap:** none.

### P5. Cumulative dyadic reciprocal mass

- **Mathematical statement:** for all sufficiently large `k0`,
  the reciprocal-prime sum over dyadic blocks `k0,…,3k0` is at least `21/20`.
- **Lean declaration:** `GlobalControl.dyadic_mertens_cumulative`.
- **Module:** `lean/RequestProject/RSPrimeSums.lean`.
- **Dependencies:** P3 at the two endpoints; cancellation of the common constant `B`; verified numerical logarithm/error estimates.
- **External analytic input:** P3 only.
- **Human-readable proof:** present in Section 3.
- **Status:** kernel checked.
- **Gap:** none.

### P6. Semiprime pair-pool mass

- **Mathematical statement:** if the reciprocal-prime sum of the block pool is at least `21/20`, then the reciprocal sum over products `p q`, `p < q`, is at least `1/2`.
- **Lean declarations:** `sq_sum_eq_sum_sq_add_two_sum_lt`, `blockPrimes_sub_sq_tail`, `blockPrimes_product_load_ge_of`, `blockPrimes_product_load_ge`.
- **Module:** `lean/RequestProject/BlockMassPool.lean`.
- **Dependencies:** P5; identity `(Σ1/p)^2 = Σ1/p^2 + 2Σ_{p<q}1/(pq)`; telescoping reciprocal-square bound; unique factorization/injectivity.
- **External analytic input:** indirect use of P3 through P5.
- **Human-readable proof:** present in Section 3.
- **Status:** kernel checked.
- **Gap:** none.

### P7. Greedy reciprocal window and mass batch

- **Mathematical statement:** from a finite positive reciprocal pool of sufficient total load and sufficiently small individual terms, select a subset with load in a prescribed interval; in particular obtain a block-aligned batch of distinct semiprimes avoiding a finite set.
- **Lean declarations:** `exists_subset_recip_window_strict_upper`, `exists_subset_recip_window`, `exists_blockAligned_mass_batch_of`, `exists_blockAligned_mass_batch`; later strengthened through `R2MassBatchSupply`.
- **Modules:** `BlockMassPool.lean`, `R2MassBatchFinalBudget.lean`, `R2MassBatchPoolSupply.lean`, and imports used by `R2TopAssembly.lean`.
- **Dependencies:** P6; finite minimal-cardinality/greedy argument; forbidden-budget estimates.
- **External analytic input:** indirect P3.
- **Human-readable proof:** present in Section 4.4.
- **Status:** kernel checked; exposition compresses several budget modules without changing the logical interface.
- **Gap:** none material; exact conservative constants remain in Lean rather than being recopied in full.

### P8. Control-edge system

- **Mathematical statement:** products attached to the block control pairs are distinct squarefree semiprimes; their energy is dominated by the full edge energy.
- **Lean declarations:** `ctrlEdges`, `ctrlPairs_lt`, `ctrlEdges_semiprime`, `ctrlPairs_prod_injOn`, `QE_ge_Qctrl`.
- **Module:** `lean/RequestProject/ArcConstruction.lean`.
- **Dependencies:** block-system construction, control pairs, unique factorization, Fourier-energy definitions.
- **External analytic input:** P4 enters the construction of sufficiently populated blocks.
- **Human-readable proof:** present in Sections 4.2 and 5.3.
- **Status:** kernel checked.
- **Gap:** none.

### P9. Block-system existence and separation from `b` and `T`

- **Mathematical statement:** at a sufficiently large dyadic scale there is a block system whose support primes are larger than `b`, coprime to `b`, include the required block-prime pool, and can be placed above all finite obstructions.
- **Lean declarations:** `exists_r2_foundation`, `exists_r2_foundation_dyadic`, `exists_block_primes`.
- **Module:** `lean/RequestProject/R2TopAssembly.lean`.
- **Dependencies:** block-system construction; P4; elementary inequalities `k < 2^k`.
- **External analytic input:** P2 through P4.
- **Human-readable proof:** present in Sections 4.1 and 4.3.
- **Status:** kernel checked.
- **Gap:** none.

### P10. Concrete edge data, divisibility, semiprimality, and avoidance

- **Mathematical statement:** for data `D = (BS,Q,R,S)`, the final edge set is the union of control, mass-batch, and gadget edges; under the supplied hypotheses every edge is a squarefree semiprime, divides the common period, is positive, and avoids `T`.
- **Lean declarations:** `R2ConcreteData`, `R2ConcreteData.E`, `R2ConcreteData.L`, `R2ConcreteData.period_pos`, `R2ConcreteData.semiprime`, `R2ConcreteData.dvd_period`, `R2ConcreteData.edges_pos`, and the avoidance fields assembled in `exists_arcConstruction_final`.
- **Modules:** `lean/RequestProject/R2ConcreteData.lean`, `R2TopAssembly.lean`.
- **Dependencies:** P7–P9; prime-factor facts for `b`; pair-product injectivity and disjointness lemmas.
- **External analytic input:** indirect P2–P3.
- **Human-readable proof:** present in Section 4.
- **Status:** kernel checked.
- **Gap:** none.

### P11. Uniform weights and exact expected mass

- **Mathematical statement:** if total reciprocal load lies in `[3/(2b),3/b)`, then the uniform parameter
  `θ = (1/b)/load` lies in `[1/3,2/3]` and satisfies `Σ θ/e = 1/b`.
- **Lean declarations:** the `R2ConcreteData.Weights` package and its `hlb`, `hub`, `hmass` fields; construction through `QB.weights` and `R2Weights.lean`.
- **Modules:** `lean/RequestProject/R2Weights.lean`, `R2ConcreteData.lean`, `R2TopAssembly.lean`.
- **Dependencies:** P7 and elementary field arithmetic.
- **External analytic input:** none beyond the supplied load window.
- **Human-readable proof:** present in Section 4.4.
- **Status:** kernel checked.
- **Gap:** none.

### P12. Weighted subset count and extraction

- **Mathematical statement:** `Wcount E θ b` is the total Bernoulli weight of subsets with reciprocal sum `1/b`; positivity yields a semiprime representation avoiding `T`.
- **Lean declarations:** `Wcount`, `exists_subset_of_Wcount_pos`, `Wcount_pos_imp_repr`.
- **Module:** `lean/RequestProject/CircleMethod.lean`.
- **Dependencies:** finite products/sums and positivity.
- **External analytic input:** none.
- **Human-readable proof:** present in Section 5.1.
- **Status:** kernel checked.
- **Gap:** none.

### P13. No-wrap congruence and exact finite Fourier identity

- **Mathematical statement:** when every edge divides `L` and `Σ1/e < 1`, the reciprocal equality is equivalent to one congruence modulo `L`; finite Fourier orthogonality gives the exact identity for `L·Wcount`.
- **Lean declarations:** `fourier_indicator`, `charterm_expand`, `wcount_fourier_identity`.
- **Module:** `lean/RequestProject/CircleMethod.lean`.
- **Dependencies:** ZMod orthogonality, divisibility, rational arithmetic, no-wrap inequality.
- **External analytic input:** none.
- **Human-readable proof:** present in Sections 4.4 and 5.1.
- **Status:** kernel checked.
- **Gap:** none.

### P14. Main-term Taylor expansion

- **Mathematical statement:** the log of the Bernoulli product at label `m` equals the linear phase minus `2π²m²σ_E²` up to an explicit cubic error; the exact mass identity cancels the linear phase against the target.
- **Lean declarations:** `sigmaE2`, `sum_logphi_bound`, `term_label`, `term_label_eq`, `term_label_re_lower`.
- **Module:** `lean/RequestProject/CircleMethodMainTerm.lean`.
- **Dependencies:** per-edge lemma `bernoulli_log_taylor`, complex logarithm/exponential identities, P11.
- **External analytic input:** none.
- **Human-readable proof:** present in Section 5.2.
- **Status:** kernel checked.
- **Gap:** none.

### P15. Gaussian main-arc lower bound and symmetry

- **Mathematical statement:** the symmetric label sum has real part at least
  `0.8*(exp(-π²/2)/2)/sqrt(sigmaE2)` and imaginary part zero.
- **Lean declarations:** `main_re_lower`, `term_label_conj`, `term_label_sum_im_zero`, `main_sum_re_lower`, `main_sum_im_zero`.
- **Module:** `lean/RequestProject/CircleMethodMainTerm.lean`.
- **Dependencies:** P14, finite Gaussian lower bound, symmetric reindexing.
- **External analytic input:** none.
- **Human-readable proof:** present in Section 5.2.
- **Status:** kernel checked.
- **Gap:** none.

### P16. Block-minor energy bound

- **Mathematical statement:** Bernoulli Fourier norms are exponentially controlled by edge energy; outside the global-control main arc, the total is bounded by a tail of size
  `(η + Ctail exp(-C²(16/9)/2))/sigmaCtrl`, with an explicit multiplicity factor.
- **Lean declarations:** `minor_energy_sum_le_mult`, `minor_arc_bound_mult`; global input `global_control_partition_final`.
- **Modules:** `lean/RequestProject/ArcConstruction.lean`, `GlobalControlG7.lean`, `R2BlockMinorLane.lean`.
- **Dependencies:** P8; global control partition; norm estimate for Bernoulli characteristic factors; finite-fiber reindexing.
- **External analytic input:** P4 enters the block-system/global-control construction.
- **Human-readable proof:** present in Section 5.3.
- **Status:** kernel checked; exposition states the proved interface and mechanism, not every internal global-control lemma.
- **Gap:** none material.

### P17. Squarefree CRT mismatch

- **Mathematical statement:** congruence modulo every prime divisor of squarefree `b` implies congruence modulo `b`; therefore a block-compatible but non-global frequency differs from its main label modulo some `r | b`.
- **Lean declarations:** `modEq_of_modEq_primeDivisors`, `exists_R_mismatch_of_block_eq_not_global`.
- **Module:** `lean/RequestProject/R2ExtraCRTSibling.lean`.
- **Dependencies:** product of distinct prime factors of a squarefree integer; CRT/coprimality of block support and `b`.
- **External analytic input:** none.
- **Human-readable proof:** present in Sections 4.3 and 5.4.
- **Status:** kernel checked.
- **Gap:** none.

### P18. CRT fiber count

- **Mathematical statement:** a block-support residue assignment has at most `b` lifts modulo
  `L = b∏blockSupport`; after removing the genuine main lift, at most `b-1` siblings remain. Consequently the extra-frequency count is at most `b(2N+1)`.
- **Lean declarations:** `mainArc_fiber_card_le`, `extra_sibling_card_le_pred_b`, `r2_extra_count_le`.
- **Modules:** `lean/RequestProject/FiberCount.lean`, `R2ExtraCRTSibling.lean`, `R2TopAssembly.lean`.
- **Dependencies:** period factorization, CRT fiber calculation, main-label window.
- **External analytic input:** none.
- **Human-readable proof:** present in Section 5.4.
- **Status:** kernel checked.
- **Gap:** none.

### P19. Multi-gadget extra-minor damping

- **Mathematical statement:** for a frequency mismatching modulo `r` but matching its label modulo each gadget prime, the Fourier product over gadget edges is bounded by
  `(sqrt(1 - (8/9)/r²))^G`; a reservoir budget controls the full extra-minor sum.
- **Lean declarations:** `R2MultiGadgetReservoir`, `multiGadgetBoundData_of_reservoir`, `fourierNormWeight_le_multi_gadget_damp`, and the reservoir assembled through the extra-minor modules imported by `R2TopAssembly.lean`.
- **Modules:** `lean/RequestProject/R2ExtraMultiGadgetReservoir.lean`, `R2ExtraMultiGadget.lean`, `R2ExtraMinorMultiGadget.lean`, `R2TopAssembly.lean`.
- **Dependencies:** P11, P17–P18, semiprimality/divisibility of gadgets, trigonometric Bernoulli norm bound.
- **External analytic input:** P4 supplies `G` distinct high-block primes.
- **Human-readable proof:** present in Section 5.4.
- **Status:** kernel checked.
- **Gap:** none.

### P20. Terminal arc construction

- **Mathematical statement:** for squarefree `b ≥ 3` and finite `T`, there exists an `ArcConstruction T b` containing all structural, main-arc, and minor-arc fields needed for positivity.
- **Lean declaration:** `exists_arcConstruction_final`.
- **Module:** `lean/RequestProject/R2TopAssembly.lean`.
- **Dependencies:** P4–P19 and the numerical-parameter lemmas in the imported R2 modules.
- **External analytic input:** exactly P2 and P3, only through their proved descendants.
- **Human-readable proof:** Sections 4–5 give the architecture and parameter order.
- **Status:** kernel checked; exposition reconstructed.
- **Gap:** no mathematical gap found. The manuscript does not reproduce every large numerical inequality; those remain exact in the kernel-checked source.

### P21. Positivity from an arc construction

- **Mathematical statement:** an `ArcConstruction` yields positive weighted count and hence an avoiding representation of `1/b`.
- **Lean declarations:** `exists_pos_weighted_of_construction`, `exists_pos_weighted_ge3_R2`, `egyptian_rep_ge3_R2`.
- **Modules:** `lean/RequestProject/CircleMethodAssembly.lean`, `Erdos306Final.lean`.
- **Dependencies:** P12–P16, P19–P20.
- **External analytic input:** inherited P2–P3.
- **Human-readable proof:** Section 5.5.
- **Status:** kernel checked.
- **Gap:** none.

### P22. Denominators `b = 2` and `b = 1`

- **Mathematical statement:** avoiding representations for `1/2` and `1` follow from the identities
  `1/2 = 1/3 + 1/6` and `1 = 1/2 + 1/3 + 1/6`.
- **Lean declarations:** `egyptian_rep_b2_R2`, `egyptian_rep_b1_R2`, `circle_method_positivity_R2`.
- **Module:** `lean/RequestProject/Erdos306Final.lean`.
- **Dependencies:** P21, avoidance/disjoint-union lemmas, rational arithmetic.
- **External analytic input:** inherited through P21 for denominators 3 and 6.
- **Human-readable proof:** Section 6.
- **Status:** kernel checked.
- **Gap:** none.

### P23. General numerator by avoidance induction

- **Mathematical statement:** from an avoiding representation of `1/b`, build one for every `a/b`, preserving distinct denominators.
- **Lean declaration:** `reduction_to_unit_numerator_avoiding`; final application `erdos_306_unconditional`.
- **Modules:** `lean/RequestProject/MainTheorem.lean`, `Erdos306Final.lean`.
- **Dependencies:** P21–P22; induction on `a`; finite-set disjoint union.
- **External analytic input:** inherited P2–P3.
- **Human-readable proof:** Section 6.
- **Status:** kernel checked.
- **Gap:** none.

### P24. Bridge to the exact Formal Conjectures theorem

- **Mathematical statement:** every positive rational with squarefree reduced denominator has a strictly increasing finite denominator sequence, anchored at `1`, whose actual entries satisfy `ω = Ω = 2` and whose unit fractions sum to the rational.
- **Lean declarations:** `isSemiprime_omega_Omega`, `isSemiprime_one_lt`, `erdos_306`.
- **Module:** `lean/RequestProject/Erdos306FormalConjectures.lean`.
- **Dependencies:** P23; rational numerator/denominator API; nonemptiness; ordering a finite set via `orderEmbOfFin`; conversion of set sums to indexed sums.
- **External analytic input:** inherited P2–P3.
- **Human-readable proof:** Sections 1–2 and 6.
- **Status:** kernel checked.
- **Gap:** none.

## Material-gap assessment

No released Lean step was found that required an unrecorded mathematical input, and no material divergence was found between the released formal statement and the prose theorem.

One editorial verification remains: the exact source locations and formulas of the two Rosser–Schoenfeld inputs are consistently recorded in `README.md`, `CITATION.cff`, and `RSPrimeSums.lean`, and the bibliographic record/DOI was externally confirmed, but the Project Euclid publisher scan was blocked by automated access controls during this bounded work unit. A human visual comparison of pages 69–70 is therefore retained as a pre-submission checklist item rather than falsely recorded as completed.
