import RequestProject.Construction.ControlEdges
import RequestProject.Spectral.BernoulliSum
import Mathlib.Analysis.Complex.ExponentialBounds

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# Bernoulli variance comparison from control edges

The minor-arc bound (`minor_arc_bound_fiber_tail`) is measured against `sigmaCtrl BS`,
while the main term (`main_re_lower`) is measured against `√(sigmaE2 E θ) = σ_E`.  The
`hbeat` separation `Bm < c₃/σ_E` therefore needs `σ_E ≲ σ_ctrl`.

The key elementary facts proved here:
* `sigmaE2_le_quarter_sum_inv_sq`: `σ_E² ≤ ¼ ∑_{e∈E} 1/e²` (since `θ(1-θ) ≤ ¼`).
* `sum_inv_sq_ctrlEdges_eq_sigmaCtrl_sq`: `∑_{e∈ctrlEdges} 1/e² = σ_ctrl²`
  (reindex by the injective product map `(p,q) ↦ pq`).
* `sigmaE2_le_of_ctrlEdges_subset`: for `ctrlEdges BS ⊆ E`,
  `σ_E² ≤ ¼(σ_ctrl² + ∑_{extra} 1/e²)`.

Hence whenever the extra (mass/gadget) edges carry `∑ 1/e² ≤ 3 σ_ctrl²`, we get
`σ_E² ≤ σ_ctrl²`, i.e. `σ_E ≤ σ_ctrl` — exactly what `hbeat` consumes.
-/

/-- `θ(1-θ) ≤ 1/4` for every real `θ`, so the per-edge variance is at most a quarter
of the inverse-square weight. -/
lemma sigmaE2_le_quarter_sum_inv_sq (E : Finset ℕ) (θ : ℕ → ℝ) :
    sigmaE2 E θ ≤ (1 / 4 : ℝ) * ∑ e ∈ E, 1 / (e : ℝ) ^ 2 := by
  unfold sigmaE2
  rw [Finset.mul_sum]
  refine Finset.sum_le_sum (fun e _ => ?_)
  have h1 : θ e * (1 - θ e) ≤ 1 / 4 := by nlinarith [sq_nonneg (θ e - 1 / 2)]
  have h2 : (0 : ℝ) ≤ 1 / (e : ℝ) ^ 2 := by positivity
  rw [div_eq_mul_one_div (θ e * (1 - θ e)) ((e : ℝ) ^ 2)]
  exact mul_le_mul_of_nonneg_right h1 h2

/-- The control-edge inverse-square sum equals `σ_ctrl²` (reindex the control pairs by
their injective product map). -/
lemma sum_inv_sq_ctrlEdges_eq_sigmaCtrl_sq (BS : BlockSystem) :
    ∑ e ∈ ctrlEdges BS, 1 / (e : ℝ) ^ 2 = (sigmaCtrl BS) ^ 2 := by
  rw [sigmaCtrl, Real.sq_sqrt (Finset.sum_nonneg fun _ _ => by positivity)]
  rw [ctrlEdges, Finset.sum_image
    (fun a ha b hb hab => ctrlPairs_prod_injOn BS ha hb hab)]
  refine Finset.sum_congr rfl (fun pq _ => ?_)
  rw [Nat.cast_mul]

/-- If `E` contains the control edges and all Bernoulli parameters lie in
`[1/3, 2/3]`, then the full variance dominates two ninths of the control
variance. -/
lemma sigmaE2_ge_controlVariance (BS : BlockSystem) (E : Finset ℕ) (θ : ℕ → ℝ)
    (hsub : ctrlEdges BS ⊆ E)
    (hlb : ∀ e ∈ E, (1 / 3 : ℝ) ≤ θ e)
    (hub : ∀ e ∈ E, θ e ≤ (2 / 3 : ℝ)) :
    (2 / 9 : ℝ) * (sigmaCtrl BS) ^ 2 ≤ sigmaE2 E θ := by
  have h_sum_ctrl :
      ∑ e ∈ ctrlEdges BS, (1 : ℝ) / (e : ℝ) ^ 2 = (sigmaCtrl BS) ^ 2 :=
    sum_inv_sq_ctrlEdges_eq_sigmaCtrl_sq BS
  have h_sum_le :
      ∑ e ∈ ctrlEdges BS, (1 : ℝ) / (e : ℝ) ^ 2 ≤
        ∑ e ∈ E, (1 : ℝ) / (e : ℝ) ^ 2 :=
    Finset.sum_le_sum_of_subset_of_nonneg hsub fun _ _ _ => by positivity
  calc
    (2 / 9 : ℝ) * (sigmaCtrl BS) ^ 2 =
        (∑ e ∈ ctrlEdges BS, (1 : ℝ) / (e : ℝ) ^ 2) * (2 / 9) := by
          rw [h_sum_ctrl]
          ring
    _ ≤ (∑ e ∈ E, (1 : ℝ) / (e : ℝ) ^ 2) * (2 / 9) :=
      mul_le_mul_of_nonneg_right h_sum_le (by norm_num)
    _ = ∑ e ∈ E, ((1 : ℝ) / (e : ℝ) ^ 2) * (2 / 9) := by
      rw [Finset.sum_mul]
    _ ≤ ∑ e ∈ E, θ e * (1 - θ e) / (e : ℝ) ^ 2 :=
      Finset.sum_le_sum fun e he => by
        have hkey : (2 / 9 : ℝ) ≤ θ e * (1 - θ e) := by
          nlinarith only [sq_nonneg (θ e - 1 / 2), hlb e he, hub e he]
        have he2 : (0 : ℝ) ≤ ((e : ℝ) ^ 2)⁻¹ := inv_nonneg.mpr (sq_nonneg _)
        calc
          (1 : ℝ) / e ^ 2 * (2 / 9) = (2 / 9) * ((e : ℝ) ^ 2)⁻¹ := by ring
          _ ≤ (θ e * (1 - θ e)) * ((e : ℝ) ^ 2)⁻¹ :=
            mul_le_mul_of_nonneg_right hkey he2
          _ = θ e * (1 - θ e) / e ^ 2 := by ring
    _ = sigmaE2 E θ := by rfl

/-- The control deviation has its natural dyadic lower scale
`1 / (k₀ 2^k₀)`, uniformly over sufficiently large block systems. -/
private lemma sigmaCtrl_lower_bound (BS : BlockSystem) (hk0 : 14 ≤ BS.k0) :
    (1 : ℝ) / (100 * (BS.k0 : ℝ) * (2 : ℝ) ^ BS.k0) ≤ sigmaCtrl BS := by
  refine Real.le_sqrt_of_sq_le ?_
  norm_num [sigmaCtrl]
  ring_nf
  refine' le_trans _ (Finset.sum_le_sum_of_subset_of_nonneg
    (show ctrlPairs BS ⊇ internalPairs BS BS.k0 from ?_) fun _ _ _ => by positivity) <;>
    norm_num [pow_mul']
  · refine' le_trans _ (Finset.sum_le_sum fun x hx =>
      show (x.1 ^ 2 : ℝ)⁻¹ * (x.2 ^ 2 : ℝ)⁻¹ ≥
        (1 / (2 ^ (BS.k0 + 1)) ^ 2) ^ 2 from ?_) <;>
      norm_num [pow_mul'] at *
    · have h_card_internal : (internalPairs BS BS.k0).card ≥
          (2 ^ BS.k0 / (2 * (BS.k0 : ℝ) * Real.log 2)) *
            ((2 ^ BS.k0 / (2 * (BS.k0 : ℝ) * Real.log 2) - 1) / 2) := by
        have h_card_ge : ((internalPairs BS BS.k0).card : ℝ) ≥
            (BS.P BS.k0).card * ((BS.P BS.k0).card - 1) / 2 := by
          have h_card_internal : (internalPairs BS BS.k0).card =
              Finset.card (Finset.powersetCard 2 (BS.P BS.k0)) := by
            refine' Finset.card_bij (fun x hx => {x.1, x.2}) _ _ _ <;>
              simp_all +decide [Finset.mem_powersetCard, Finset.subset_iff]
            · simp +contextual [internalPairs]
              exact fun a b ha hb hab => Finset.card_pair hab.ne
            · simp +contextual [internalPairs]
              grind +suggestions
            · intro b hb hb'
              rw [Finset.card_eq_two] at hb'
              obtain ⟨a, b, hab, rfl⟩ := hb'
              simp_all +decide [internalPairs]
              cases lt_or_gt_of_ne hab <;>
                [exact ⟨a, b, ⟨hb, ‹_›⟩, rfl⟩;
                 exact ⟨b, a, ⟨⟨hb.2, hb.1⟩, ‹_›⟩, by rw [Finset.pair_comm]⟩]
          rcases n : Finset.card (BS.P BS.k0) with (_ | _ | n) <;>
            simp_all +decide [Nat.choose_two_right]
          rw [Nat.cast_div] <;> norm_cast
          exact Nat.dvd_of_mod_eq_zero
            (by norm_num [Nat.add_mod, Nat.mod_two_of_bodd])
        have h_card_ge : ((BS.P BS.k0).card : ℝ) ≥
            2 ^ BS.k0 / (2 * BS.k0 * Real.log 2) := by
          have := BS.hdensity BS.k0 (by linarith) (by linarith [BS.hk])
          simp_all +decide [Real.log_pow]
          simpa only [mul_assoc] using this
        nlinarith [show (2 : ℝ) ^ BS.k0 / (2 * BS.k0 * Real.log 2) ≥ 1 by
          exact one_le_div (by positivity) |>.2 <| by
            nlinarith [Real.log_le_sub_one_of_pos zero_lt_two,
              show (BS.k0 : ℝ) ≥ 14 by norm_cast,
              show (2 : ℝ) ^ BS.k0 ≥ 2 * BS.k0 by
                exact mod_cast Nat.le_induction (by norm_num)
                  (fun k hk ih => by
                    norm_num [Nat.pow_succ] at *
                    nlinarith) _ hk0]]
      refine' le_trans _ (mul_le_mul_of_nonneg_right h_card_internal _) <;>
        norm_num [pow_succ'] at *
      field_simp
      refine' Nat.le_induction _ _ BS.k0 hk0 <;> norm_num [pow_succ'] at *
      · have := Real.log_two_lt_d9
        norm_num at *
        nlinarith [Real.log_nonneg one_le_two]
      · intro n hn ih
        ring_nf at *
        norm_num at *
        nlinarith [Real.log_pos one_lt_two, Real.log_le_sub_one_of_pos zero_lt_two,
          show (n : ℝ) ≥ 14 by norm_cast, pow_pos (zero_lt_two' ℝ) n]
    · rw [← mul_inv]
      gcongr
      norm_cast
      simp_all +decide [internalPairs]
      · exact ⟨pow_pos (Nat.Prime.pos (BS.hprime _ _ hx.1.1)) 2,
          pow_pos (Nat.Prime.pos (BS.hprime _ _ hx.1.2)) 2⟩
      · norm_cast
        exact Nat.le_trans (Nat.mul_le_mul
          (Nat.pow_le_pow_left
            ((BS.hwindow BS.k0 x.1
              (Finset.mem_filter.mp hx |>.1 |> Finset.mem_product.mp |>.1)).2.le) 2)
          (Nat.pow_le_pow_left
            ((BS.hwindow BS.k0 x.2
              (Finset.mem_filter.mp hx |>.1 |> Finset.mem_product.mp |>.2)).2.le) 2))
          (by ring_nf; norm_num)
  · exact Finset.subset_iff.mpr fun x hx => Finset.mem_union_left _ <|
      Finset.mem_biUnion.mpr ⟨BS.k0,
        Finset.mem_Icc.mpr ⟨le_rfl, by linarith [BS.hk]⟩, hx⟩

/-- Existential form of `sigmaCtrl_lower_bound`, hiding the inessential
numerical witness from downstream parameter selection. -/
lemma exists_sigmaCtrl_lower_bound :
    ∃ c : ℝ, 1 ≤ c ∧ ∃ K0 : ℕ, ∀ BS : BlockSystem, K0 ≤ BS.k0 →
      (1 : ℝ) / (c * (BS.k0 : ℝ) * (2 : ℝ) ^ BS.k0) ≤ sigmaCtrl BS :=
  ⟨100, by norm_num, 14, fun BS h => sigmaCtrl_lower_bound BS h⟩

/-- **σ_E² in terms of σ_ctrl² plus the extra-edge inverse-square mass.**  For any edge
set containing the control edges, `σ_E² ≤ ¼(σ_ctrl² + ∑_{extra} 1/e²)`. -/
lemma sigmaE2_le_of_ctrlEdges_subset (BS : BlockSystem) (E : Finset ℕ) (θ : ℕ → ℝ)
    (hsub : ctrlEdges BS ⊆ E) :
    sigmaE2 E θ ≤ (1 / 4 : ℝ) *
      ((sigmaCtrl BS) ^ 2 + ∑ e ∈ E \ ctrlEdges BS, 1 / (e : ℝ) ^ 2) := by
  have hsplit : ∑ e ∈ E, 1 / (e : ℝ) ^ 2
      = (∑ e ∈ ctrlEdges BS, 1 / (e : ℝ) ^ 2)
        + ∑ e ∈ E \ ctrlEdges BS, 1 / (e : ℝ) ^ 2 := by
    rw [← Finset.sum_sdiff hsub]; ring
  calc sigmaE2 E θ ≤ (1 / 4 : ℝ) * ∑ e ∈ E, 1 / (e : ℝ) ^ 2 :=
        sigmaE2_le_quarter_sum_inv_sq E θ
    _ = (1 / 4 : ℝ) * ((∑ e ∈ ctrlEdges BS, 1 / (e : ℝ) ^ 2)
          + ∑ e ∈ E \ ctrlEdges BS, 1 / (e : ℝ) ^ 2) := by rw [hsplit]
    _ = (1 / 4 : ℝ) * ((sigmaCtrl BS) ^ 2 + ∑ e ∈ E \ ctrlEdges BS, 1 / (e : ℝ) ^ 2) := by
        rw [sum_inv_sq_ctrlEdges_eq_sigmaCtrl_sq]

/-- **σ_E ≤ σ_ctrl when the extra edges are light.**  If the mass/gadget edges satisfy
`∑_{extra} 1/e² ≤ 3 σ_ctrl²`, then `σ_E ≤ σ_ctrl`.  This is the clean form fed to the
`hbeat` parameter chase (the ratio `σ_E/σ_ctrl ≤ 1`). -/
lemma sigmaE_le_sigmaCtrl_of_extra_light (BS : BlockSystem) (E : Finset ℕ) (θ : ℕ → ℝ)
    (hsub : ctrlEdges BS ⊆ E)
    (hextra : ∑ e ∈ E \ ctrlEdges BS, 1 / (e : ℝ) ^ 2 ≤ 3 * (sigmaCtrl BS) ^ 2) :
    Real.sqrt (sigmaE2 E θ) ≤ sigmaCtrl BS := by
  have hσ2 : sigmaE2 E θ ≤ (sigmaCtrl BS) ^ 2 := by
    have := sigmaE2_le_of_ctrlEdges_subset BS E θ hsub
    nlinarith [this, hextra]
  calc Real.sqrt (sigmaE2 E θ)
      ≤ Real.sqrt ((sigmaCtrl BS) ^ 2) := Real.sqrt_le_sqrt hσ2
    _ = sigmaCtrl BS := by
        rw [Real.sqrt_sq (sigmaCtrl_nonneg BS)]

end CircleMethod

end
