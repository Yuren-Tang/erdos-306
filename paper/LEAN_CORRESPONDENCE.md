# Lean correspondence — manuscript v1 to release v0.0.3

## Controlling release

All paths and declarations below refer to:

`Yuren-Tang/erdos-306:v0.0.3@4582185de1e0e27416e9362e0cc7943c3d2fb4fe`

The branch `codex/pushlinter@e55ef359a8b98525f0bac6c7a510fcad94469bff` is not used as proof authority.

## Headline statement

### Paper notation

The paper states:

> If `q = a/b > 0` is reduced and `b` is squarefree, then
> `q = Σ_{j=1}^k 1/n_j` for distinct increasing squarefree semiprimes `n_j`.

### Exact Lean declaration

File: `lean/RequestProject/Erdos306FormalConjectures.lean`

```lean
theorem erdos_306 :
    ∀ (q : ℚ), 0 < q → Squarefree q.den →
      ∃ k : ℕ, ∃ (n : Fin (k + 1) → ℕ), n 0 = 1 ∧ StrictMono n ∧
        (∀ i ∈ Finset.Icc 1 (Fin.last k), ω (n i) = 2 ∧ Ω (n i) = 2) ∧
        q = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i)
```

The paper's `n_1 < … < n_k` is the restriction of Lean's `n : Fin (k+1) → ℕ`
to the interval `Finset.Icc 1 (Fin.last k)`. Lean's `n 0 = 1` is the dummy
anchor used to package a nonempty strictly increasing finite sequence.

## Notation and declaration map

| Paper object or statement | Exact Lean declaration | Released module |
|---|---|---|
| squarefree semiprime `n = p q`, `p < q` prime | `IsSemiprime` | `Defs.lean` |
| semiprime positivity | `IsSemiprime.pos` | `Defs.lean` |
| semiprime squarefreeness | `IsSemiprime.squarefree` | `Defs.lean` |
| finite semiprime representation | `HasEgyptianSemiprimeRepr` | `Defs.lean` |
| representation avoiding finite `T` | `HasEgyptianSemiprimeReprAvoiding` | `Defs.lean` |
| necessity of squarefree reduced denominator | `necessity_squarefree_denom` | `Defs.lean` |
| `ω(n)=Ω(n)=2` for a semiprime | `isSemiprime_omega_Omega` | `Erdos306FormalConjectures.lean` |
| semiprime is greater than `1` | `isSemiprime_one_lt` | `Erdos306FormalConjectures.lean` |
| Rosser–Schoenfeld dyadic-prime input | `RosserSchoenfeld.rosser_schoenfeld_cor3` | `RSPrimeSums.lean` |
| Rosser–Schoenfeld reciprocal-prime-sum input | `RosserSchoenfeld.rosser_schoenfeld_thm5` | `RSPrimeSums.lean` |
| dyadic prime block `P_k` | `GlobalControl.dyadicBlock` | imported by `RSPrimeSums.lean` |
| dyadic block cardinality lower bound | `GlobalControl.dyadic_prime_density` | `RSPrimeSums.lean` |
| cumulative reciprocal-prime lower bound | `GlobalControl.dyadic_mertens_cumulative` | `RSPrimeSums.lean` |
| union of blocks from `k0` to `3*k0` | `blockPrimes` | `BlockMassPool.lean` |
| pair-sum algebra identity | `sq_sum_eq_sum_sq_add_two_sum_lt` | `BlockMassPool.lean` |
| reciprocal-square tail | `blockPrimes_sub_sq_tail` | `BlockMassPool.lean` |
| semiprime pair-product injectivity | `blockPrimes_pair_prod_injOn` | `BlockMassPool.lean` |
| pair-pool load `≥ 1/2` under prime mass | `blockPrimes_product_load_ge_of` | `BlockMassPool.lean` |
| unconditional eventual pair-pool load | `blockPrimes_product_load_ge` | `BlockMassPool.lean` |
| finite reciprocal-window selector | `exists_subset_recip_window_strict_upper`, `exists_subset_recip_window` | `BlockMassPool.lean` |
| block-aligned mass batch | `exists_blockAligned_mass_batch` | `BlockMassPool.lean` |
| block system | `BlockSystem` | `BlockSystem.lean` and construction imports |
| block support | `blockSupport` | global-control modules |
| control pairs | `ctrlPairs` | global-control modules |
| control edges | `ctrlEdges` | `ArcConstruction.lean` |
| control edges are semiprime | `ctrlEdges_semiprime` | `ArcConstruction.lean` |
| control product injectivity | `ctrlPairs_prod_injOn` | `ArcConstruction.lean` |
| control energy dominated by full energy | `QE_ge_Qctrl` | `ArcConstruction.lean` |
| concrete data `(BS,Q,R,S)` | `R2ConcreteData` | `R2ConcreteData.lean` |
| final edge set `E` | `R2ConcreteData.E` | `R2ConcreteData.lean` |
| common period `L = b * ∏ blockSupport` | `R2ConcreteData.L`, `R2ConcreteData.base_dvd_period`, `R2ConcreteData.period_pos` | `R2ConcreteData.lean`, `R2TopAssembly.lean` |
| control reciprocal load | `R2ConcreteData.recipLoad (ctrlEdges BS)` | `R2ConcreteData.lean` |
| final edge semiprimality | `R2ConcreteData.semiprime` and assembly fields | `R2ConcreteData.lean`, `R2TopAssembly.lean` |
| final edge divisibility by `L` | `R2ConcreteData.dvd_period` and assembly fields | `R2ConcreteData.lean`, `R2TopAssembly.lean` |
| final edge positivity | `R2ConcreteData.edges_pos` and assembly fields | `R2ConcreteData.lean`, `R2TopAssembly.lean` |
| uniform weight `θ` | `R2ConcreteData.Weights`, constructed by the mass/load package | `R2Weights.lean` |
| `1/3 ≤ θ ≤ 2/3` | `Weights.hlb`, `Weights.hub` | `R2Weights.lean` |
| exact weighted mass `Σ θ/e = 1/b` | `Weights.hmass` | `R2Weights.lean` |
| weighted exact-subset count | `Wcount` | `CircleMethod.lean` |
| positivity gives a subset | `exists_subset_of_Wcount_pos` | `CircleMethod.lean` |
| positivity gives an avoiding representation | `Wcount_pos_imp_repr` | `CircleMethod.lean` |
| no-wrap indicator | `fourier_indicator` | `CircleMethod.lean` |
| Fourier product expansion | `charterm_expand` | `CircleMethod.lean` |
| exact finite Fourier identity | `wcount_fourier_identity` | `CircleMethod.lean` |
| Bernoulli characteristic factor | `bernoulliCharFun` | circle-method modules |
| variance `σ_E²` | `sigmaE2` | `CircleMethodMainTerm.lean` |
| summed log expansion | `sum_logphi_bound` | `CircleMethodMainTerm.lean` |
| labelled main term `T_m` | `term_label` | `CircleMethodMainTerm.lean` |
| Gaussian times cubic error | `term_label_eq` | `CircleMethodMainTerm.lean` |
| per-label real lower bound | `term_label_re_lower` | `CircleMethodMainTerm.lean` |
| main-label Gaussian lower bound | `main_re_lower` | `CircleMethodMainTerm.lean` |
| conjugate symmetry | `term_label_conj` | `CircleMethodMainTerm.lean` |
| main sum has zero imaginary part | `term_label_sum_im_zero`, `main_sum_im_zero` | `CircleMethodMainTerm.lean` |
| reindexed main Fourier lower bound | `main_sum_re_lower` | `CircleMethodMainTerm.lean` |
| arc-construction interface | `ArcConstruction` | `CircleMethodAssembly.lean` |
| positivity from arc separation | `positivity_from_arcs` | `CircleMethod.lean` |
| positivity from construction | `exists_pos_weighted_of_construction` | `CircleMethodAssembly.lean` |
| assignment from a frequency | `freqAssignmentOf` | `R2MainArcClassification.lean` |
| block/extra minor split | `mainArcBlockSet`, `mainArcExtraSet`, `mainArcClassificationData` | `R2MainArcClassification.lean` |
| main-arc witness label | `mainArcWitnessLabel` | `R2MainArcClassification.lean` |
| label data for extra lane | `intFrequencyLabelData_of_mainArcClassification` | `R2MainArcClassification.lean` |
| prime divisors covered by `R` | `CoversPrimeDivisors` | `R2ExtraCRTSibling.lean` |
| block support coprime to `b` | `BlockSupportCoprimeWith` | `R2ExtraCRTSibling.lean` |
| squarefree prime-divisor congruence lift | `modEq_of_modEq_primeDivisors` | `R2ExtraCRTSibling.lean` |
| find an `r | b` mismatch | `exists_R_mismatch_of_block_eq_not_global` | `R2ExtraCRTSibling.lean` |
| extra siblings per block fiber | `extra_sibling_card_le_pred_b` | `R2ExtraCRTSibling.lean` |
| total extra count `≤ b(2N+1)` | `r2_extra_count_le` | `R2TopAssembly.lean` |
| multi-gadget reservoir | `R2MultiGadgetReservoir` | `R2ExtraMultiGadgetReservoir.lean` |
| gadget damping bound interface | `multiGadgetBoundData_of_reservoir` | `R2ExtraMultiGadgetReservoir.lean` |
| control-to-full variance lower bound | `sigmaE2_ge_ctrl` | `R2TopAssembly.lean` |
| quantitative control variance lower bound | `sigmaCtrl_ge_strong` | `R2TopAssembly.lean` |
| block-minor bounded-multiplicity estimate | `minor_arc_bound_mult` | `ArcConstruction.lean` |
| final foundation | `exists_r2_foundation_dyadic` | `R2TopAssembly.lean` |
| choose `G` high-block gadget primes | `exists_block_primes` | `R2TopAssembly.lean` |
| final arc construction | `exists_arcConstruction_final` | `R2TopAssembly.lean` |
| positive weighted count for `b ≥ 3` | `exists_pos_weighted_ge3_R2` | `Erdos306Final.lean` |
| avoiding representation for `b ≥ 3` | `egyptian_rep_ge3_R2` | `Erdos306Final.lean` |
| denominator `2` reduction | `egyptian_rep_b2_R2` | `Erdos306Final.lean` |
| denominator `1` reduction | `egyptian_rep_b1_R2` | `Erdos306Final.lean` |
| all squarefree denominators | `circle_method_positivity_R2` | `Erdos306Final.lean` |
| numerator induction | `reduction_to_unit_numerator_avoiding` | `MainTheorem.lean` |
| final finite-set theorem | `erdos_306_unconditional` | `Erdos306Final.lean` |
| exact benchmark theorem | `erdos_306` | `Erdos306FormalConjectures.lean` |

## Exact Rosser–Schoenfeld declarations

File: `lean/RequestProject/RSPrimeSums.lean`

```lean
axiom rosser_schoenfeld_cor3 (x : ℝ) (hx : 41 / 2 ≤ x) :
    3 * x / (5 * Real.log x) <
      (Nat.primeCounting ⌊2 * x⌋₊ : ℝ) -
      (Nat.primeCounting ⌊x⌋₊ : ℝ)
```

The released source uses the natural floor API; typographical floor notation in
the paper is the mathematical rendering of that expression.

```lean
axiom rosser_schoenfeld_thm5 :
  ∃ B : ℝ, ∀ x : ℝ,
    (1 < x →
      Real.log (Real.log x) + B - 1 / (2 * (Real.log x) ^ 2) <
        ∑ p ∈ Finset.Icc 2 ⌊x⌋₊,
          if Nat.Prime p then (1 : ℝ) / p else 0) ∧
    (286 ≤ x →
      (∑ p ∈ Finset.Icc 2 ⌊x⌋₊,
          if Nat.Prime p then (1 : ℝ) / p else 0) <
        Real.log (Real.log x) + B + 1 / (2 * (Real.log x) ^ 2))
```

These are the only two nonstandard axioms in the headline theorem's audit.

## Exact axiom audit

File: `lean/RequestProject/Audit.lean`

```lean
#print axioms erdos_306
#print axioms RosserSchoenfeld.rosser_schoenfeld_cor3
#print axioms RosserSchoenfeld.rosser_schoenfeld_thm5
```

Expected headline result at release v0.0.3:

```text
[propext,
 Classical.choice,
 Quot.sound,
 RosserSchoenfeld.rosser_schoenfeld_cor3,
 RosserSchoenfeld.rosser_schoenfeld_thm5]
```

## Formal-to-informal distinctions retained in the paper

1. **`Finset` versus a written set.** Every denominator family in Lean is a
   `Finset ℕ`; distinctness is therefore literal, not inferred from cancellation.
2. **Semiprime convention.** Lean's `IsSemiprime` includes the strict order
   `p < q`; repeated-prime products are excluded.
3. **Rational denominator.** `q.den` is Lean's reduced positive denominator.
4. **No-wrap.** The Fourier congruence is converted to equality only under the
   checked strict reciprocal-load bound.
5. **Squarefree use.** The paper distinguishes the elementary necessary condition
   from the separate CRT use in `modEq_of_modEq_primeDivisors`.
6. **Large constants.** The exposition states their logical roles; exact inequalities
   and numerical constants remain in the named released declarations.
7. **Future refactors.** No declaration from the frozen refactor line is cited as
   authority.
