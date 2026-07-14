import RequestProject.CircleMethod.MainArcNumericBounds
import RequestProject.Construction.BaseLoadBudget

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Closing the concrete main-arc numeric bounds

Edge-scale, window-scale, and reciprocal-square estimates are combined here
into the Taylor bounds required by the main-arc construction.
-/

/-
Fine main-arc numeric fields for the concrete edge set: with all edges
`≥ Emin`, the label window `N` small relative to `Emin`, and the quadratic
reciprocal-square control `N^2 · ∑ 1/e^2 ≤ 18`, the Taylor conditions `htw`/`hsmall`
hold via the *actual* per-edge sum (not the lossy `card·ρ^3` bound).
-/
lemma mainArcNumericBounds_of_edgeScale {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (W : ConstructionData.Weights D) (N : ℤ) (Emin B : ℝ)
    (hB : 0 < B)
    (he0 : ∀ e ∈ D.E, 0 < e)
    (hEmin0 : 0 < Emin)
    (hEmin : ∀ e ∈ D.E, Emin ≤ (e : ℝ))
    (hN : (1 : ℝ) / Real.sqrt (sigmaE2 D.E W.theta) ≤ (N : ℝ))
    (hNnonneg : 0 ≤ N)
    (h10N : 10 * (N : ℝ) ≤ Emin)
    (hsumsq : (N : ℝ) ^ 2 * (∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2) ≤ B)
    (hsmallN : (N : ℝ) / Emin ≤
      1 / (10 * bernoulliTaylorRemainderConstant * B)) :
    MainArcNumericBounds D.E W.theta N := by
  refine' ⟨ hN, hNnonneg, _, _ ⟩;
  · intro m hm e he
    change |(m : ℝ) / (e : ℝ)| ≤ 1 / 10
    rw [ abs_div, abs_of_nonneg ( by positivity : ( 0 : ℝ ) ≤ e ) ] ; rw [ div_le_iff₀ ( by norm_cast; linarith [ he0 e he ] ) ] ; ring_nf at *; norm_num at *;
    cases abs_cases ( m : ℝ ) <;> nlinarith [ show ( m : ℝ ) ≥ -N by exact_mod_cast hm.1, show ( m : ℝ ) ≤ N by exact_mod_cast hm.2, show ( e : ℝ ) ≥ Emin by exact_mod_cast hEmin e he ];
  · intro m hm
    change (∑ e ∈ D.E,
      bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤ 1 / 10
    -- For each edge e, |(m:ℝ)/e|^3 ≤ N/Emin * (m^2 * 1/e^2).
    have h_edge_bound : ∀ e ∈ D.E, |(m : ℝ) / e| ^ 3 ≤ (N / Emin) * ((m : ℝ) ^ 2 * (1 / e ^ 2 : ℝ)) := by
      intros e he
      have h_abs : |(m : ℝ) / e| ≤ N / Emin := by
        rw [ abs_div, abs_of_nonneg ( by positivity : ( 0 : ℝ ) ≤ e ) ];
        gcongr <;> norm_cast;
        · exact abs_le.mpr ⟨ by linarith [ Finset.mem_Icc.mp hm ], by linarith [ Finset.mem_Icc.mp hm ] ⟩;
        · exact hEmin e he;
      have hnonneg : (0 : ℝ) ≤ (m : ℝ) ^ 2 * (1 / e ^ 2 : ℝ) := by positivity
      calc |(m : ℝ) / e| ^ 3 = |(m : ℝ) / e| * |(m : ℝ) / e| ^ 2 := by ring
        _ = |(m : ℝ) / e| * ((m : ℝ) / e) ^ 2 := by rw [sq_abs]
        _ = |(m : ℝ) / e| * ((m : ℝ) ^ 2 * (1 / e ^ 2 : ℝ)) := by rw [div_pow]; ring
        _ ≤ (N / Emin) * ((m : ℝ) ^ 2 * (1 / e ^ 2 : ℝ)) :=
          mul_le_mul_of_nonneg_right h_abs hnonneg
    refine' le_trans ( Finset.sum_le_sum fun e he => mul_le_mul_of_nonneg_left
      (h_edge_bound e he) bernoulliTaylorRemainderConstant_nonneg ) _;
    norm_num [← Finset.mul_sum _ _ _, ← Finset.sum_mul] at *;
    refine' le_trans (mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left
      (mul_le_mul_of_nonneg_right (show (m : ℝ) ^ 2 ≤ N ^ 2 by
        norm_cast; nlinarith) <| Finset.sum_nonneg fun _ _ => inv_nonneg.2 <| sq_nonneg _)
      (by positivity)) bernoulliTaylorRemainderConstant_nonneg) _
    have hsmallN' : (N : ℝ) / Emin ≤
        1 / (10 * bernoulliTaylorRemainderConstant * B) := by
      simpa [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm] using hsmallN
    have hbudget_nonneg : (0 : ℝ) ≤
        1 / (10 * bernoulliTaylorRemainderConstant * B) :=
      one_div_nonneg.mpr <| mul_nonneg
        (mul_nonneg (show (0 : ℝ) ≤ 10 by norm_num)
          bernoulliTaylorRemainderConstant_nonneg) hB.le
    have hprod : (N : ℝ) / Emin *
        ((N : ℝ) ^ 2 * ∑ e ∈ D.E, ((e : ℝ) ^ 2)⁻¹) ≤
        (1 / (10 * bernoulliTaylorRemainderConstant * B)) * B := by
      calc
        (N : ℝ) / Emin * ((N : ℝ) ^ 2 * ∑ e ∈ D.E, ((e : ℝ) ^ 2)⁻¹)
            ≤ (1 / (10 * bernoulliTaylorRemainderConstant * B)) *
                ((N : ℝ) ^ 2 * ∑ e ∈ D.E, ((e : ℝ) ^ 2)⁻¹) :=
              mul_le_mul_of_nonneg_right hsmallN' (by positivity)
        _ ≤ (1 / (10 * bernoulliTaylorRemainderConstant * B)) * B :=
              mul_le_mul_of_nonneg_left hsumsq hbudget_nonneg
    calc
      bernoulliTaylorRemainderConstant *
          ((N : ℝ) / Emin * ((N : ℝ) ^ 2 * ∑ e ∈ D.E, ((e : ℝ) ^ 2)⁻¹))
          ≤ bernoulliTaylorRemainderConstant *
              ((1 / (10 * bernoulliTaylorRemainderConstant * B)) * B) :=
            mul_le_mul_of_nonneg_left hprod bernoulliTaylorRemainderConstant_nonneg
      _ = 1 / 10 := by
        field_simp [bernoulliTaylorRemainderConstant_pos.ne']

/-- Numeric main-arc bounds for the concrete construction, extracted as its own
declaration so `D` stays opaque (no `Classical.choose` unfolding / `isDefEq`
blow-up) and it gets its own elaboration budget.

Parametric in the abstract analytic constants: `cS` (the `σ_ctrl` lower-bound
coefficient) and `S` (the edge square-load slack).  The two domination
hypotheses `hwindow`/`hcubic` are instances at `k₀ = D.BS.k0` of the ledger's
eventual polynomial≪exponential facts; no witness value of any constant or
threshold is visible here.  The literals that do appear are structural:
the Taylor coefficient and radius budget enter only through the supplied
`bernoulliTaylorRemainderConstant`; the `40 = 4·10` below combines the budget
factor with `(k₀+1)² ≤ (2k₀)²`. -/
lemma mainArcNumericBounds_of_constructionScales {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ) (σ C cS S : ℝ)
    (hσpos : 0 < σ)
    (he0 : ∀ e ∈ D.E, 0 < e)
    (QB : MassBatchSupply D)
    (hSge : ∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s)
    (hRpos' : ∀ r ∈ D.R, 2 ≤ r)
    (hcS1 : 1 ≤ cS) (hS1 : 1 ≤ S)
    (hsumE : ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2 ≤ S * σ ^ 2)
    (hsigmaE_lb : Real.sqrt (2 / 9) * σ ≤ Real.sqrt (sigmaE2 D.E W.theta))
    (hNnonneg : 0 ≤ N) (hCge3 : (3 : ℝ) ≤ C)
    (hNlo : C / σ ≤ (N : ℝ)) (hNsigma : (N : ℝ) * σ ≤ C + 1)
    (hk0pos : 1 ≤ D.BS.k0) (hCk0 : C ≤ (D.BS.k0 : ℝ))
    (hwindow : 10 * (cS * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 + 1)
        ≤ (2 : ℝ) ^ (2 * D.BS.k0))
    (hcubic : (40 * bernoulliTaylorRemainderConstant * S * (cS + 1)) *
      (D.BS.k0 : ℝ) ^ 4 ≤ (2 : ℝ) ^ D.BS.k0)
    (hNreal : (N : ℝ) ≤ cS * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 + 1) :
    MainArcNumericBounds D.E W.theta N := by
  have hS0 : (0 : ℝ) < S := lt_of_lt_of_le one_pos hS1
  have hcS0 : (0 : ℝ) < cS := lt_of_lt_of_le one_pos hcS1
  have hNpos : (0 : ℝ) < (N : ℝ) := lt_of_lt_of_le (by positivity) hNlo
  have hEminN : ∀ e ∈ D.E, 2 ^ (2 * D.BS.k0) ≤ e := by
    intro e he
    rw [ConstructionData.E, constructionEdges] at he
    have hpoweq : (2 : ℕ) ^ (2 * D.BS.k0) = 2 ^ D.BS.k0 * 2 ^ D.BS.k0 := by rw [two_mul, pow_add]
    rcases Finset.mem_union.mp he with hcQ | hg
    · rcases Finset.mem_union.mp hcQ with hc | hq
      · rw [hpoweq]; exact ctrlEdges_ge_k0_square D.BS hc
      · obtain ⟨p, q, hp, hq', _, rfl⟩ := QB.hQpair e hq
        rw [hpoweq]
        exact Nat.mul_le_mul (blockSupport_ge_pow_k0 D.BS hp) (blockSupport_ge_pow_k0 D.BS hq')
    · rw [mem_gadgetEdges] at hg
      obtain ⟨r, hr, s, hs, rfl⟩ := hg
      exact le_trans (hSge s hs) (Nat.le_mul_of_pos_left _ (by have := hRpos' r hr; omega))
  have hEmin : ∀ e ∈ D.E, (2 : ℝ) ^ (2 * D.BS.k0) ≤ (e : ℝ) := by
    intro e he; exact_mod_cast hEminN e he
  have h10N : 10 * (N : ℝ) ≤ (2 : ℝ) ^ (2 * D.BS.k0) := by
    linarith [hNreal, hwindow]
  have hN : (1 : ℝ) / Real.sqrt (sigmaE2 D.E W.theta) ≤ (N : ℝ) := by
    have hlb : (1 : ℝ) / Real.sqrt (sigmaE2 D.E W.theta) ≤ 1 / (Real.sqrt (2 / 9) * σ) :=
      one_div_le_one_div_of_le (by positivity) hsigmaE_lb
    have hsq : (1 : ℝ) / 3 ≤ Real.sqrt (2 / 9) := by
      rw [show (1 : ℝ) / 3 = Real.sqrt (1 / 9) by
        rw [show (1 : ℝ) / 9 = (1 / 3) ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
      apply Real.sqrt_le_sqrt; norm_num
    have h2 : 1 / (Real.sqrt (2 / 9) * σ) ≤ 3 / σ := by
      rw [div_le_div_iff₀ (by positivity) hσpos, one_mul]
      nlinarith only [hsq, hσpos]
    have h3 : (3 : ℝ) / σ ≤ (N : ℝ) := by
      rw [div_le_iff₀ hσpos]
      have hh := hNlo; rw [div_le_iff₀ hσpos] at hh
      nlinarith only [hh, hCge3]
    linarith [hlb, h2, h3]
  have hsumsq : (N : ℝ) ^ 2 * (∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) ^ 2)
      ≤ (N : ℝ) ^ 2 * (S * σ ^ 2) :=
    mul_le_mul_of_nonneg_left hsumE (by positivity)
  have hsmallN : (N : ℝ) / (2 : ℝ) ^ (2 * D.BS.k0)
      ≤ 1 / (10 * bernoulliTaylorRemainderConstant *
        ((N : ℝ) ^ 2 * (S * σ ^ 2))) := by
    have hk0R : (1 : ℝ) ≤ (D.BS.k0 : ℝ) := by exact_mod_cast hk0pos
    have htwo : (1 : ℝ) ≤ (2 : ℝ) ^ D.BS.k0 := one_le_pow₀ (by norm_num)
    have hNσ : (N : ℝ) * σ ≤ (D.BS.k0 : ℝ) + 1 := le_trans hNsigma (by linarith [hCk0])
    have hNσ2 : ((N : ℝ) * σ) ^ 2 ≤ 4 * (D.BS.k0 : ℝ) ^ 2 := by
      have hnn : (0 : ℝ) ≤ (N : ℝ) * σ := by positivity
      nlinarith only [hNσ, hnn, hk0R]
    have hNle : (N : ℝ) ≤ (cS + 1) * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 := by
      have hone : (1 : ℝ) ≤ (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0 := by
        have hk2 : (1 : ℝ) ≤ (D.BS.k0 : ℝ) ^ 2 := one_le_pow₀ hk0R
        exact le_trans hk2 (le_mul_of_one_le_right (by positivity) htwo)
      nlinarith [hNreal, hone]
    rw [div_le_div_iff₀ (by positivity)
      (mul_pos (mul_pos (by norm_num) bernoulliTaylorRemainderConstant_pos)
        (by positivity)), one_mul]
    calc (N : ℝ) * (10 * bernoulliTaylorRemainderConstant *
          ((N : ℝ) ^ 2 * (S * σ ^ 2)))
        = 10 * bernoulliTaylorRemainderConstant * S *
            ((N : ℝ) * ((N : ℝ) * σ) ^ 2) := by ring
      _ ≤ 10 * bernoulliTaylorRemainderConstant * S *
            (((cS + 1) * (D.BS.k0 : ℝ) ^ 2 * (2 : ℝ) ^ D.BS.k0) * (4 * (D.BS.k0 : ℝ) ^ 2)) := by
          refine mul_le_mul_of_nonneg_left ?_
            (mul_nonneg (mul_nonneg (by norm_num) bernoulliTaylorRemainderConstant_nonneg)
              (by positivity))
          exact mul_le_mul hNle hNσ2 (sq_nonneg _) (by positivity)
      _ = (40 * bernoulliTaylorRemainderConstant * S * (cS + 1)) *
          (D.BS.k0 : ℝ) ^ 4 * (2 : ℝ) ^ D.BS.k0 := by ring
      _ ≤ (2 : ℝ) ^ D.BS.k0 * (2 : ℝ) ^ D.BS.k0 :=
          mul_le_mul_of_nonneg_right hcubic (by positivity)
      _ = (2 : ℝ) ^ (2 * D.BS.k0) := by rw [two_mul, pow_add]
  exact mainArcNumericBounds_of_edgeScale D W N ((2 : ℝ) ^ (2 * D.BS.k0)) ((N : ℝ) ^ 2 * (S * σ ^ 2))
    (by positivity) he0 (by positivity) hEmin hN hNnonneg h10N hsumsq hsmallN


end CircleMethod

end
