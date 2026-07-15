import Mathlib.Algebra.Order.Star.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.LinearCombination
import RequestProject.Core.UnitCircleResidue
import RequestProject.LocalEnergy.CRTRepresentation
import RequestProject.LocalEnergy.ReciprocalPhase
import RequestProject.LocalEnergy.ReciprocalDispersion

/-!
# Fingerprint energy

Fingerprint energy compares candidate residues with a fixed prime sample; reciprocal dispersion makes every sufficiently cold residue unique.
-/

open Finset

namespace LocalEnergy

open scoped Classical

/-! ## The per-vertex fingerprint energy -/

/-- The per-prime term of the vertex–fingerprint energy:
    `t^{(p)}_q(w) = (H_{pq}(a_p, w) / (p q))²`. -/
noncomputable def fingerprintEnergyTerm (a : (p : ℕ) → ZMod p) (q : ℕ) (w : ZMod q) (p : ℕ) : ℝ :=
  ((crtRepr p q (a p) w : ℝ) / ((p : ℝ) * q)) ^ 2

/-- The vertex–fingerprint energy `t_q(w) = ∑_{p∈F} (H_{pq}(a_p, w)/(pq))²`. -/
noncomputable def fingerprintEnergy (F : Finset ℕ) (a : (p : ℕ) → ZMod p)
    (q : ℕ) (w : ZMod q) : ℝ :=
  ∑ p ∈ F, fingerprintEnergyTerm a q w p

private lemma fingerprintEnergyTerm_nonneg (a : (p : ℕ) → ZMod p) (q : ℕ) (w : ZMod q) (p : ℕ) :
    0 ≤ fingerprintEnergyTerm a q w p := by
  unfold fingerprintEnergyTerm; positivity

lemma fingerprintEnergy_nonneg (F : Finset ℕ) (a : (p : ℕ) → ZMod p)
    (q : ℕ) (w : ZMod q) : 0 ≤ fingerprintEnergy F a q w :=
  Finset.sum_nonneg fun _ _ => fingerprintEnergyTerm_nonneg _ _ _ _

/-! ## Comparison with reciprocal phase

For primes `p ≠ q`, with centered integer reps `ã_p = valMinAbs (a p)` and
`w̃ = valMinAbs w`, the reciprocal phase of `ã_p − w̃` is controlled by
`|H_{pq}|/(pq)`:
`reciprocalPhase (ã_p − w̃) q p ≤ |H_{pq}(a_p,w)|/(pq) + 1/(2p)`.

The lift `H := crtRepr p q (a p) w` satisfies `H ≡ w̃ (mod q)`, so
`H = w̃ + v q` for an integer `v`; and `H ≡ ã_p (mod p)`, giving
`v ≡ (ã_p − w̃) q̄ (mod p)`.  Since `reciprocalPhase E q p = ‖E q̄ / p‖` depends only on
`E mod p`, `reciprocalPhase (ã_p − w̃) q p = ‖v/p‖`.  Finally
`v/p = H/(pq) − w̃/(pq)`, so `‖v/p‖ ≤ |H|/(pq) + |w̃|/(pq) ≤ |H|/(pq) + 1/(2p)`
using `|w̃| ≤ q/2`. -/

private lemma reciprocalPhase_le_crtEnergy (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (a : (p : ℕ) → ZMod p) (w : ZMod q) :
    reciprocalPhase (ZMod.valMinAbs (a p) - ZMod.valMinAbs w) q p
      ≤ |(crtRepr p q (a p) w : ℝ)| / ((p : ℝ) * q) + 1 / (2 * p) := by
  haveI := Fact.mk hp
  haveI := Fact.mk hq;
  -- Let H := crtRepr p q (a p) w, ãp := ZMod.valMinAbs (a p), w̃ := ZMod.valMinAbs w, E := ãp - w̃, and q̄ := ((q : ZMod p)⁻¹).val.
  set H := crtRepr p q (a p) w
  set ap := (a p).valMinAbs
  set wtilde := w.valMinAbs
  set E := ap - wtilde
  set qbar := ((q : ZMod p)⁻¹).val;
  -- From v*q ≡ E (mod p): multiply both sides by (q:ZMod p)⁻¹: v ≡ E * (q:ZMod p)⁻¹ (mod p).
  obtain ⟨k, hk⟩ : ∃ k : ℤ, E * qbar - (H - wtilde) / q = p * k := by
    have h_mod : (H - wtilde) / q * q ≡ E [ZMOD p] := by
      have h_mod : (H : ZMod p) = ap := by
        convert crtRepr_congr_left p q ( a p ) w _;
        · convert ZMod.coe_valMinAbs ( a p );
        · exact hp.coprime_iff_not_dvd.mpr fun h => hpq <| Nat.prime_dvd_prime_iff_eq hp hq |>.1 h;
      rw [ Int.ediv_mul_cancel ];
      · simp_all +decide [ ← ZMod.intCast_eq_intCast_iff ];
        grind;
      · have h_mod : (H : ZMod q) = w := by
          convert crtRepr_congr_right p q ( a p ) w _ using 1;
          · exact hp.coprime_iff_not_dvd.mpr fun h => hpq <| Nat.prime_dvd_prime_iff_eq hp hq |>.1 h;
        rw [ ← ZMod.intCast_zmod_eq_zero_iff_dvd ] ; aesop;
    letI : NeZero p := ⟨hp.ne_zero⟩
    letI : Fact (Nat.Prime p) := ⟨hp⟩
    have h_mod : (H - wtilde) / q ≡ E * qbar [ZMOD p] := by
      simp_all +decide [ ← ZMod.intCast_eq_intCast_iff ];
      simp +zetaDelta at *;
      have hqinv : (q : ZMod p) * (q : ZMod p)⁻¹ = 1 :=
        ZMod.coe_mul_inv_eq_one q ((Nat.coprime_primes hq hp).2 (Ne.symm hpq))
      rw [← h_mod, mul_assoc, hqinv, mul_one]
    exact h_mod.dvd;
  -- So |x - round x| = |(v:ℝ)/p - round ((v:ℝ)/p)|.
  have h_abs : reciprocalPhase E q p = |(H - wtilde : ℝ) / (p * q) - round ((H - wtilde : ℝ) / (p * q))| := by
    -- Substitute hk into the expression for x - round x.
    have h_subst : (E : ℝ) * qbar / p = (H - wtilde : ℝ) / (p * q) + k := by
      rw [ div_add', div_eq_div_iff ] <;> norm_cast <;> simp_all +decide [ hp.ne_zero, hq.ne_zero ];
      rw [ ← Int.ediv_mul_cancel ( show ( q : ℤ ) ∣ H - wtilde from ?_ ) ] ; linear_combination hk * p * q;
      have h_div : (crtRepr p q (a p) w : ZMod q) = w := by
        convert crtRepr_congr_right p q ( a p ) w _ using 1;
        · exact hp.coprime_iff_not_dvd.mpr fun h => hpq <| Nat.prime_dvd_prime_iff_eq hp hq |>.1 h;
      haveI := Fact.mk hq; simp_all +decide [ ← ZMod.intCast_zmod_eq_zero_iff_dvd ] ;
      aesop;
    unfold reciprocalPhase
    rw [h_subst]
    simp [UnitAddCircle.norm_eq]
  -- So |(v:ℝ)/p - round ((v:ℝ)/p)| ≤ |(v:ℝ)/p|.
  have h_abs_le : |(H - wtilde : ℝ) / (p * q) - round ((H - wtilde : ℝ) / (p * q))| ≤ |(H - wtilde : ℝ) / (p * q)| := by
    simpa using (round_le ((H - wtilde : ℝ) / (p * q)) 0)
  -- So |(H - w̃)/(p*q)| ≤ |H|/(p*q) + |w̃|/(p*q).
  have h_abs_le' : |(H - wtilde : ℝ) / (p * q)| ≤ |(H : ℝ)| / (p * q) + |(wtilde : ℝ)| / (p * q) := by
    rw [ abs_div, abs_of_nonneg ( by positivity : ( 0 : ℝ ) ≤ p * q ) ];
    rw [ ← add_div ] ; gcongr ; exact abs_sub _ _;
  -- Since |w̃| ≤ q/2, we have |w̃|/(p*q) ≤ 1/(2*p).
  have h_wtilde_le : |(wtilde : ℝ)| / (p * q) ≤ 1 / (2 * p) := by
    have h_wtilde_le : |(wtilde : ℝ)| ≤ q / 2 := by
      have := ZMod.valMinAbs_mem_Ioc w;
      rw [ le_div_iff₀ ] <;> norm_cast;
      grind;
    rw [ div_le_div_iff₀ ] <;> nlinarith [ show ( p : ℝ ) > 0 by exact Nat.cast_pos.mpr hp.pos, show ( q : ℝ ) > 0 by exact Nat.cast_pos.mpr hq.pos ];
  linarith

/-! ## The squared triangle bound

Combining `reciprocalPhase_sub_le` with `reciprocalPhase_le_crtEnergy` applied to `w` and `w'`:
`reciprocalPhase (w̃' − w̃) q p ≤ |H_w|/(pq) + |H_{w'}|/(pq) + 1/p`, and then
`(α+β+γ)² ≤ 3(α²+β²+γ²)` gives the per-prime squared bound. -/

private lemma reciprocalPhase_sq_le_crtEnergy (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (a : (p : ℕ) → ZMod p) (w w' : ZMod q) :
    (reciprocalPhase (ZMod.valMinAbs w' - ZMod.valMinAbs w) q p) ^ 2
      ≤ 3 * fingerprintEnergyTerm a q w p + 3 * fingerprintEnergyTerm a q w' p + 3 / (p : ℝ) ^ 2 := by
  -- Apply `reciprocalPhase_sub_le` with A := ZMod.valMinAbs (a p) - ZMod.valMinAbs w and B := ZMod.valMinAbs (a p) - ZMod.valMinAbs w'.
  have h_reciprocalPhase_sub_le : reciprocalPhase (w'.valMinAbs - w.valMinAbs) q p ≤ reciprocalPhase (ZMod.valMinAbs (a p) - ZMod.valMinAbs w) q p + reciprocalPhase (ZMod.valMinAbs (a p) - ZMod.valMinAbs w') q p := by
    convert reciprocalPhase_sub_le ((a p).valMinAbs - w.valMinAbs)
      ((a p).valMinAbs - w'.valMinAbs) q p using 1
    ring_nf
  -- Apply `reciprocalPhase_le_crtEnergy` to w and w'.
  have hphase_w : reciprocalPhase (ZMod.valMinAbs (a p) - ZMod.valMinAbs w) q p ≤ |(crtRepr p q (a p) w : ℝ)| / ((p : ℝ) * q) + 1 / (2 * p) := by
    exact reciprocalPhase_le_crtEnergy p q hp hq hpq a w
  have hphase_w' : reciprocalPhase (ZMod.valMinAbs (a p) - ZMod.valMinAbs w') q p ≤ |(crtRepr p q (a p) w' : ℝ)| / ((p : ℝ) * q) + 1 / (2 * p) := by
    exact reciprocalPhase_le_crtEnergy p q hp hq hpq a w'
  -- Set bw := |(crtRepr p q (a p) w : ℝ)|/((p:ℝ)*q) and bw' := |(crtRepr p q (a p) w' : ℝ)|/((p:ℝ)*q).
  set bw := |(crtRepr p q (a p) w : ℝ)| / ((p : ℝ) * q)
  set bw' := |(crtRepr p q (a p) w' : ℝ)| / ((p : ℝ) * q);
  -- By definition of $fingerprintEnergyTerm$, we have $fingerprintEnergyTerm a q w p = bw^2$ and $fingerprintEnergyTerm a q w' p = bw'^2$.
  have henergy : fingerprintEnergyTerm a q w p = bw^2 ∧ fingerprintEnergyTerm a q w' p = bw'^2 := by
    constructor <;> simp only [fingerprintEnergyTerm, bw, bw'] <;>
      rw [div_pow, div_pow, sq_abs]
  -- Combine the reciprocal-phase triangle inequality with the two CRT comparisons.
  have h_combined : reciprocalPhase (w'.valMinAbs - w.valMinAbs) q p ≤ bw + bw' + 1 / (p : ℝ) := by
    calc
      reciprocalPhase (w'.valMinAbs - w.valMinAbs) q p
          ≤ (bw + 1 / (2 * p)) + (bw' + 1 / (2 * p)) :=
        h_reciprocalPhase_sub_le.trans (add_le_add hphase_w hphase_w')
      _ = bw + bw' + 1 / (p : ℝ) := by
        field_simp [Nat.cast_ne_zero.mpr hp.ne_zero]
        ring
  -- By squaring both sides of the inequality from `h_combined`, we get:
  have h_squared : reciprocalPhase (w'.valMinAbs - w.valMinAbs) q p ^ 2 ≤ (bw + bw' + 1 / (p : ℝ)) ^ 2 := by
    exact pow_le_pow_left₀ ( reciprocalPhase_nonneg _ _ _ ) h_combined 2;
  refine le_trans h_squared ?_;
  rw [henergy.1, henergy.2]
  simp only [div_eq_mul_inv, one_mul]
  rw [← inv_pow]
  nlinarith only [ sq_nonneg ( bw - bw' ), sq_nonneg ( bw - ( p : ℝ ) ⁻¹ ), sq_nonneg ( bw' - ( p : ℝ ) ⁻¹ ) ]

/-! ## Uniqueness below the dispersion threshold

For `q ∉ F`, suppose two residues both have energy below `G_F / κ`, where
`G_F = |F|³/(2¹¹ X²)`. The two CRT comparisons consume `6G_F / κ`; the
remaining error is impossible when `κ > 6` and
`3κ2¹¹ ≤ (κ - 6)|F|²`. Taking `κ = 7` gives the convenient sufficient
condition `3·7·2¹¹ ≤ |F|²`, hence `|F| ≥ 208`. -/

/-- General uniqueness criterion below the reciprocal-dispersion scale. -/
lemma cold_residue_unique_of_card_sq (X : ℕ) (hX : 1 ≤ X) (F : Finset ℕ)
    (hF : ∀ p ∈ F, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X)
    (hFcard8 : 8 ≤ F.card)
    (κ : ℝ) (hκ : 6 < κ)
    (hFcard : 3 * κ * 2 ^ 11 ≤ (κ - 6) * (F.card : ℝ) ^ 2)
    (a : (p : ℕ) → ZMod p)
    (q : ℕ) (hq : q.Prime) (hqF : q ∉ F) (hq2X : q ≤ 2 * X)
    (w w' : ZMod q)
    (hw : fingerprintEnergy F a q w < reciprocalPhaseEnergyScale X F / κ)
    (hw' : fingerprintEnergy F a q w' < reciprocalPhaseEnergyScale X F / κ) :
    w = w' := by
  by_contra h_neq
  set E := (ZMod.valMinAbs w' - ZMod.valMinAbs w) with hE_def
  have hE_zero : ¬ (q : ℤ) ∣ E := by
    haveI := Fact.mk hq; simp_all +decide [ ← ZMod.intCast_zmod_eq_zero_iff_dvd ] ;
    exact sub_ne_zero_of_ne <| Ne.symm h_neq
  have hE_abs : 0 < |E| ∧ |E| < q := by
    have hE_abs : -(q : ℤ) < 2 * w'.valMinAbs ∧ 2 * w'.valMinAbs ≤ q ∧ -(q : ℤ) < 2 * w.valMinAbs ∧ 2 * w.valMinAbs ≤ q := by
      haveI := Fact.mk hq; exact ⟨ by linarith [ ZMod.valMinAbs_mem_Ioc w' |>.1 ], by linarith [ ZMod.valMinAbs_mem_Ioc w' |>.2 ], by linarith [ ZMod.valMinAbs_mem_Ioc w |>.1 ], by linarith [ ZMod.valMinAbs_mem_Ioc w |>.2 ] ⟩ ;
    exact ⟨ abs_pos.mpr ( show E ≠ 0 from sub_ne_zero.mpr <| by aesop ), abs_lt.mpr ⟨ by linarith, by linarith ⟩ ⟩;
  have h_sum_bound : ∑ p ∈ F, (reciprocalPhase E q p) ^ 2 ≤ 3 * fingerprintEnergy F a q w + 3 * fingerprintEnergy F a q w' + 3 * (F.card : ℝ) / (X : ℝ) ^ 2 := by
    have h_sum_bound : ∀ p ∈ F, (reciprocalPhase E q p) ^ 2 ≤ 3 * fingerprintEnergyTerm a q w p + 3 * fingerprintEnergyTerm a q w' p + 3 / (p : ℝ) ^ 2 := by
      grind +suggestions;
    refine le_trans ( Finset.sum_le_sum h_sum_bound ) ?_;
    norm_num [ Finset.sum_add_distrib, Finset.mul_sum _ _ _, Finset.sum_mul, fingerprintEnergy ];
    exact le_trans ( Finset.sum_le_sum fun x hx => show ( 3 : ℝ ) / x ^ 2 ≤ 3 / X ^ 2 by gcongr ; linarith [ hF x hx ] ) ( by norm_num; ring_nf; norm_num );
  have h_sum_bound : reciprocalPhaseEnergyScale X F ≤
      3 * fingerprintEnergy F a q w + 3 * fingerprintEnergy F a q w' +
        3 * (F.card : ℝ) / (X : ℝ) ^ 2 := by
    convert reciprocalPhase_energy_lower_bound X F hF hFcard8 q hq hqF hq2X E hE_zero hE_abs.1 hE_abs.2 |> le_trans <| h_sum_bound using 1;
  -- Simplify the inequality obtained from the sum bound.
  have hFpos : 0 < (F.card : ℝ) := by positivity
  have hκpos : 0 < κ := by linarith
  have hκne : κ ≠ 0 := hκpos.ne'
  have h_sum_scaled := mul_le_mul_of_nonneg_right h_sum_bound hκpos.le
  have hw_scaled : fingerprintEnergy F a q w * κ <
      reciprocalPhaseEnergyScale X F := by
    calc
      fingerprintEnergy F a q w * κ <
          (reciprocalPhaseEnergyScale X F / κ) * κ :=
        mul_lt_mul_of_pos_right hw hκpos
      _ = _ := div_mul_cancel₀ _ hκne
  have hw'_scaled : fingerprintEnergy F a q w' * κ <
      reciprocalPhaseEnergyScale X F := by
    calc
      fingerprintEnergy F a q w' * κ <
          (reciprocalPhaseEnergyScale X F / κ) * κ :=
        mul_lt_mul_of_pos_right hw' hκpos
      _ = _ := div_mul_cancel₀ _ hκne
  have h_simplified : (κ - 6) * (F.card : ℝ) ^ 2 < 3 * κ * 2 ^ 11 := by
    simp only [reciprocalPhaseEnergyScale] at h_sum_scaled hw_scaled hw'_scaled
    ring_nf at h_sum_scaled hw_scaled hw'_scaled ⊢
    nlinarith [ show ( 0 : ℝ ) < ( X : ℝ ) ⁻¹ ^ 2 by positivity,
      mul_pos hFpos (show (0 : ℝ) < (X : ℝ)⁻¹ ^ 2 by positivity) ];
  exact (not_lt_of_ge hFcard) h_simplified

/-- With threshold `G_F / 7`, cardinality `208` is sufficient for uniqueness. -/
lemma cold_residue_unique (X : ℕ) (hX : 1 ≤ X) (F : Finset ℕ)
    (hF : ∀ p ∈ F, Nat.Prime p ∧ X ≤ p ∧ p ≤ 2 * X)
    (hFcard : 208 ≤ F.card)
    (a : (p : ℕ) → ZMod p)
    (q : ℕ) (hq : q.Prime) (hqF : q ∉ F) (hq2X : q ≤ 2 * X)
    (w w' : ZMod q)
    (hw : fingerprintEnergy F a q w < reciprocalPhaseEnergyScale X F / 7)
    (hw' : fingerprintEnergy F a q w' < reciprocalPhaseEnergyScale X F / 7) :
    w = w' := by
  apply cold_residue_unique_of_card_sq X hX F hF (by linarith) 7 (by norm_num) ?_
    a q hq hqF hq2X w w' hw hw'
  norm_num
  have hFcard' : (208 : ℝ) ≤ F.card := by exact_mod_cast hFcard
  nlinarith [sq_nonneg ((F.card : ℝ) - 208)]

end LocalEnergy
