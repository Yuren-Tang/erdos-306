import RequestProject.Construction.MassPool
import RequestProject.CircleMethod.PrimeSupportPeriod

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# Consequences of a mass-batch supply

Single motivating question: **once `MassBatchSupply D` is in hand
(`Construction.MassPool`), what do we get for free?**  Two immediate
consequences (every batch edge is a semiprime, hence a period divisor) and
the canonical uniform `Weights` package generated from the load window
(folded in here rather than kept as its own file, since its sole
consumer is `weights` below and its own motivating question, "build the
weight package once the reciprocal-load window is known," is the same
question this file already answers), consumed by the weighted-edge certificate.

-/

namespace ConstructionData

variable {T : Finset ℕ} {b : ℕ}

/-- Uniform Bernoulli parameter tuned to make the expected reciprocal mass
exactly `1/b`. -/
def uniformTheta (D : ConstructionData T b) : ℕ → ℝ :=
  fun _ => (1 / (b : ℝ)) / recipLoad D.E

lemma recipLoad_pos_of_window (D : ConstructionData T b) (hb : 0 < b)
    (hlb : 3 / (2 * (b : ℝ)) ≤ recipLoad D.E) :
    0 < recipLoad D.E := by
  have hbR : (0 : ℝ) < (b : ℝ) := by exact_mod_cast hb
  have hgap : 0 < 3 / (2 * (b : ℝ)) := by positivity
  exact lt_of_lt_of_le hgap hlb

lemma uniformTheta_lower_of_window (D : ConstructionData T b) (hb : 0 < b)
    (hlb : 3 / (2 * (b : ℝ)) ≤ recipLoad D.E)
    (hub : recipLoad D.E < 3 / (b : ℝ)) :
    1 / 3 ≤ (1 / (b : ℝ)) / recipLoad D.E := by
  have hbR : (0 : ℝ) < (b : ℝ) := by exact_mod_cast hb
  have hSpos : 0 < recipLoad D.E := recipLoad_pos_of_window D hb hlb
  have hc :
      (1 / (b : ℝ)) / recipLoad D.E =
        1 / ((b : ℝ) * recipLoad D.E) := by
    field_simp [hbR.ne', hSpos.ne']
  rw [hc]
  have hle : (b : ℝ) * recipLoad D.E ≤ 3 := by
    have hmul := mul_lt_mul_of_pos_left hub hbR
    field_simp [hbR.ne'] at hmul
    exact le_of_lt hmul
  exact one_div_le_one_div_of_le (mul_pos hbR hSpos) hle

lemma uniformTheta_upper_of_window (D : ConstructionData T b) (hb : 0 < b)
    (hlb : 3 / (2 * (b : ℝ)) ≤ recipLoad D.E) :
    (1 / (b : ℝ)) / recipLoad D.E ≤ 2 / 3 := by
  have hbR : (0 : ℝ) < (b : ℝ) := by exact_mod_cast hb
  have hSpos : 0 < recipLoad D.E := recipLoad_pos_of_window D hb hlb
  have hc :
      (1 / (b : ℝ)) / recipLoad D.E =
        1 / ((b : ℝ) * recipLoad D.E) := by
    field_simp [hbR.ne', hSpos.ne']
  rw [hc]
  have hge : 3 ≤ 2 * ((b : ℝ) * recipLoad D.E) := by
    have hmul := mul_le_mul_of_nonneg_left hlb
      (by positivity : (0 : ℝ) ≤ 2 * (b : ℝ))
    field_simp [hbR.ne'] at hmul
    nlinarith
  rw [div_le_div_iff₀ (mul_pos hbR hSpos) (by norm_num : (0 : ℝ) < 3)]
  nlinarith

lemma uniformTheta_mass (D : ConstructionData T b) (hb : 0 < b)
    (hlb : 3 / (2 * (b : ℝ)) ≤ recipLoad D.E) :
    (∑ e ∈ D.E, uniformTheta D e / (e : ℝ)) = 1 / (b : ℝ) := by
  have hSpos : 0 < recipLoad D.E := recipLoad_pos_of_window D hb hlb
  have hSpos' : 0 < ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) := by
    simpa [recipLoad] using hSpos
  unfold uniformTheta recipLoad
  calc
    (∑ e ∈ D.E,
        ((1 / (b : ℝ)) / ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ)) / (e : ℝ))
        = ∑ e ∈ D.E,
            ((1 / (b : ℝ)) / ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ)) *
              ((1 : ℝ) / (e : ℝ)) := by
          refine Finset.sum_congr rfl ?_
          intro e he
          ring
    _ = ((1 / (b : ℝ)) / ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ)) *
          ∑ e ∈ D.E, (1 : ℝ) / (e : ℝ) := by
          rw [Finset.mul_sum]
    _ = 1 / (b : ℝ) := by
          rw [div_mul_cancel₀ _ hSpos'.ne']

/-- Build the final weight package from the concrete reciprocal-load window. -/
def weights_of_recipLoad_window (D : ConstructionData T b) (hb : 0 < b)
    (hlb : 3 / (2 * (b : ℝ)) ≤ recipLoad D.E)
    (hub : recipLoad D.E < 3 / (b : ℝ)) :
    Weights D where
  theta := uniformTheta D
  hlb := by
    intro e he
    exact uniformTheta_lower_of_window D hb hlb hub
  hub := by
    intro e he
    exact uniformTheta_upper_of_window D hb hlb
  hmass := uniformTheta_mass D hb hlb

end ConstructionData

namespace MassBatchSupply

variable {T : Finset ℕ} {b : ℕ} {D : ConstructionData T b}

/-- Products of two ordered block-support primes are semiprimes. -/
lemma q_semiprime (S : MassBatchSupply D) :
    ∀ e ∈ D.Q, IsSemiprime e := by
  intro e he
  obtain ⟨p, q, hp, hq, hpq, rfl⟩ := S.hQpair e he
  exact ⟨p, q, blockSupport_prime D.BS hp, blockSupport_prime D.BS hq, hpq, rfl⟩

/-- Every mass-batch edge divides the concrete period. -/
lemma q_dvd_period (S : MassBatchSupply D) :
    ∀ e ∈ D.Q, e ∣ D.L := by
  intro e he
  obtain ⟨p, q, hp, hq, hpq, rfl⟩ := S.hQpair e he
  have hpprime : Nat.Prime p := blockSupport_prime D.BS hp
  have hqprime : Nat.Prime q := blockSupport_prime D.BS hq
  have hpdvd : p ∣ ∏ r ∈ blockSupport D.BS, r :=
    Finset.dvd_prod_of_mem id hp
  have hqdvd : q ∣ ∏ r ∈ blockSupport D.BS, r :=
    Finset.dvd_prod_of_mem id hq
  have hcop : Nat.Coprime p q := by
    exact hpprime.coprime_iff_not_dvd.mpr fun hdiv => by
      have hp_eq_q : p = q := (Nat.prime_dvd_prime_iff_eq hpprime hqprime).mp hdiv
      omega
  have hpq_dvd : p * q ∣ ∏ r ∈ blockSupport D.BS, r :=
    hcop.mul_dvd_of_dvd_of_dvd hpdvd hqdvd
  rw [ConstructionData.L]
  exact edge_dvd_primeSupportPeriod_of_mem_support hpq_dvd

/-- The canonical uniform weight package generated by the mass-batch load
window. -/
def weights (QB : MassBatchSupply D) (hb : 0 < b) :
    ConstructionData.Weights D :=
  let hwindow := D.total_recipLoad_window_of_residual
    QB.hloadDisj QB.hloadLower QB.hloadUpper
  ConstructionData.weights_of_recipLoad_window D hb hwindow.1 hwindow.2

end MassBatchSupply

end CircleMethod

end
