import RequestProject.Core.FiniteWeightSelection
import RequestProject.CircleMethod.PrimeSupportPeriod
import RequestProject.CircleMethod.ControlVarianceComparison

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# Construction edge set and period

What is the concrete construction edge set, and what
structural facts (semiprimality, avoidance, period divisibility) does it
inherit from its three pieces (control edges, mass-batch edges, gadget
edges)? The free-function bookkeeping (`gadgetEdges`, `constructionEdges`, ...) and
the bundled record (`ConstructionData`) that packages it for the rest of the
construction answer the same question at two levels, so they live in one
file.

-/

/-- Gadget edges `r*s`, where `r` is a denominator prime and `s` is a chosen block
support prime. -/
def gadgetEdges (R S : Finset ℕ) : Finset ℕ :=
  (R ×ˢ S).image (fun rs : ℕ × ℕ => rs.1 * rs.2)

lemma mem_gadgetEdges {R S : Finset ℕ} {e : ℕ} :
    e ∈ gadgetEdges R S ↔ ∃ r ∈ R, ∃ s ∈ S, e = r * s := by
  constructor
  · intro he
    rw [gadgetEdges, Finset.mem_image] at he
    obtain ⟨rs, hrs, rfl⟩ := he
    rw [Finset.mem_product] at hrs
    exact ⟨rs.1, hrs.1, rs.2, hrs.2, rfl⟩
  · intro he
    obtain ⟨r, hr, s, hs, rfl⟩ := he
    rw [gadgetEdges, Finset.mem_image]
    exact ⟨(r, s), by simpa [Finset.mem_product] using And.intro hr hs, rfl⟩

lemma gadgetEdges_semiprime {R S : Finset ℕ}
    (hRprime : ∀ r ∈ R, Nat.Prime r)
    (hSprime : ∀ s ∈ S, Nat.Prime s)
    (hlt : ∀ r ∈ R, ∀ s ∈ S, r < s) :
    ∀ e ∈ gadgetEdges R S, IsSemiprime e := by
  intro e he
  rw [mem_gadgetEdges] at he
  obtain ⟨r, hr, s, hs, rfl⟩ := he
  exact ⟨r, s, hRprime r hr, hSprime s hs, hlt r hr s hs, rfl⟩

lemma gadgetEdges_dvd_period {BS : BlockSystem} {R S : Finset ℕ} {b e : ℕ}
    (he : e ∈ gadgetEdges R S)
    (hRdvd : ∀ r ∈ R, r ∣ b)
    (hSblock : S ⊆ blockSupport BS) :
    e ∣ primeSupportPeriod b (blockSupport BS) := by
  rw [mem_gadgetEdges] at he
  obtain ⟨r, hr, s, hs, rfl⟩ := he
  obtain ⟨ar, har⟩ := hRdvd r hr
  have hsblock : s ∈ blockSupport BS := hSblock hs
  have hsdvd : s ∣ ∏ p ∈ blockSupport BS, p := Finset.dvd_prod_of_mem id hsblock
  obtain ⟨as, has⟩ := hsdvd
  refine ⟨ar * as, ?_⟩
  rw [primeSupportPeriod, har, has]
  ring

lemma gadgetEdges_avoid_of_pair_avoid {R S T : Finset ℕ}
    (havoid : ∀ r ∈ R, ∀ s ∈ S, r * s ∉ T) :
    ∀ e ∈ gadgetEdges R S, e ∉ T := by
  intro e he
  rw [mem_gadgetEdges] at he
  obtain ⟨r, hr, s, hs, rfl⟩ := he
  exact havoid r hr s hs

/-- The construction edge set before final parameter choices. -/
def constructionEdges (BS : BlockSystem) (Q R S : Finset ℕ) : Finset ℕ :=
  ctrlEdges BS ∪ Q ∪ gadgetEdges R S

lemma ctrlEdges_subset_constructionEdges (BS : BlockSystem) (Q R S : Finset ℕ) :
    ctrlEdges BS ⊆ constructionEdges BS Q R S := by
  intro e he
  simp [constructionEdges, he]

lemma massBatch_subset_constructionEdges (BS : BlockSystem) (Q R S : Finset ℕ) :
    Q ⊆ constructionEdges BS Q R S := by
  intro e he
  simp [constructionEdges, he]

lemma gadgetEdges_subset_constructionEdges (BS : BlockSystem) (Q R S : Finset ℕ) :
    gadgetEdges R S ⊆ constructionEdges BS Q R S := by
  intro e he
  simp [constructionEdges, he]

lemma constructionEdges_semiprime {BS : BlockSystem} {Q R S : Finset ℕ}
    (hQsemi : ∀ e ∈ Q, IsSemiprime e)
    (hRprime : ∀ r ∈ R, Nat.Prime r)
    (hSprime : ∀ s ∈ S, Nat.Prime s)
    (hlt : ∀ r ∈ R, ∀ s ∈ S, r < s) :
    ∀ e ∈ constructionEdges BS Q R S, IsSemiprime e := by
  intro e he
  rw [constructionEdges, Finset.mem_union] at he
  rcases he with hctrlQ | hgadget
  · rw [Finset.mem_union] at hctrlQ
    rcases hctrlQ with hctrl | hQ
    · exact ctrlEdges_semiprime BS hctrl
    · exact hQsemi e hQ
  · exact gadgetEdges_semiprime hRprime hSprime hlt e hgadget

lemma constructionEdges_avoid {BS : BlockSystem} {Q R S T : Finset ℕ}
    (hctrl : ∀ e ∈ ctrlEdges BS, e ∉ T)
    (hQ : ∀ e ∈ Q, e ∉ T)
    (hgadget : ∀ e ∈ gadgetEdges R S, e ∉ T) :
    ∀ e ∈ constructionEdges BS Q R S, e ∉ T := by
  intro e he
  rw [constructionEdges, Finset.mem_union] at he
  rcases he with hctrlQ | hg
  · rw [Finset.mem_union] at hctrlQ
    rcases hctrlQ with hc | hq
    · exact hctrl e hc
    · exact hQ e hq
  · exact hgadget e hg

lemma constructionEdges_dvd_period {BS : BlockSystem} {Q R S : Finset ℕ} {b e : ℕ}
    (he : e ∈ constructionEdges BS Q R S)
    (hQdvd : ∀ e ∈ Q, e ∣ primeSupportPeriod b (blockSupport BS))
    (hRdvd : ∀ r ∈ R, r ∣ b)
    (hSblock : S ⊆ blockSupport BS) :
    e ∣ primeSupportPeriod b (blockSupport BS) := by
  rw [constructionEdges, Finset.mem_union] at he
  rcases he with hctrlQ | hgadget
  · rw [Finset.mem_union] at hctrlQ
    rcases hctrlQ with hctrl | hQ
    · have hctrlSupport :
          e ∣ ∏ p ∈ blockSupport BS, p := by
        exact semiprime_dvd_edgePrimeSupport_prod hctrl (ctrlEdges_semiprime BS hctrl) |>.trans
          (Finset.prod_dvd_prod_of_subset (edgePrimeSupport (ctrlEdges BS)) (blockSupport BS) id
            (edgePrimeSupport_ctrlEdges_subset_blockSupport BS))
      exact edge_dvd_primeSupportPeriod_of_mem_support hctrlSupport
    · exact hQdvd e hQ
  · exact gadgetEdges_dvd_period hgadget hRdvd hSblock

/-- The concrete edge data before the final analytic and CRT choices. -/
structure ConstructionData (T : Finset ℕ) (b : ℕ) where
  BS : BlockSystem
  Q : Finset ℕ
  R : Finset ℕ
  S : Finset ℕ

namespace ConstructionData

variable {T : Finset ℕ} {b : ℕ}

/-- The concrete edge set: control edges, mass-batch edges, and gadget edges. -/
def E (D : ConstructionData T b) : Finset ℕ :=
  constructionEdges D.BS D.Q D.R D.S

/-- The block-support period used by the construction. -/
def L (D : ConstructionData T b) : ℕ :=
  primeSupportPeriod b (blockSupport D.BS)

/-- Reciprocal load of an edge set. -/
def recipLoad (E : Finset ℕ) : ℝ :=
  ∑ e ∈ E, (1 : ℝ) / (e : ℝ)

/-- The already-fixed load, before adding the residual mass batch. -/
def baseLoad (D : ConstructionData T b) : ℝ :=
  recipLoad (ctrlEdges D.BS ∪ gadgetEdges D.R D.S)

lemma ctrlEdges_subset_E (D : ConstructionData T b) :
    ctrlEdges D.BS ⊆ D.E := by
  exact ctrlEdges_subset_constructionEdges D.BS D.Q D.R D.S

lemma massBatch_subset_E (D : ConstructionData T b) :
    D.Q ⊆ D.E := by
  exact massBatch_subset_constructionEdges D.BS D.Q D.R D.S

lemma gadgetEdges_subset_E (D : ConstructionData T b) :
    gadgetEdges D.R D.S ⊆ D.E := by
  exact gadgetEdges_subset_constructionEdges D.BS D.Q D.R D.S

/-- Semiprimality of the concrete edge set. -/
lemma semiprime (D : ConstructionData T b)
    (hQsemi : ∀ e ∈ D.Q, IsSemiprime e)
    (hRprime : ∀ r ∈ D.R, Nat.Prime r)
    (hSprime : ∀ s ∈ D.S, Nat.Prime s)
    (hlt : ∀ r ∈ D.R, ∀ s ∈ D.S, r < s) :
    ∀ e ∈ D.E, IsSemiprime e := by
  exact constructionEdges_semiprime hQsemi hRprime hSprime hlt

/-- Wrapper for avoidance of the obstruction set. -/
lemma avoid (D : ConstructionData T b)
    (hctrl : ∀ e ∈ ctrlEdges D.BS, e ∉ T)
    (hQ : ∀ e ∈ D.Q, e ∉ T)
    (hgadget : ∀ e ∈ gadgetEdges D.R D.S, e ∉ T) :
    ∀ e ∈ D.E, e ∉ T := by
  exact constructionEdges_avoid hctrl hQ hgadget

/-- Period divisibility of every concrete edge. -/
lemma dvd_period (D : ConstructionData T b)
    (hQdvd : ∀ e ∈ D.Q, e ∣ D.L)
    (hRdvd : ∀ r ∈ D.R, r ∣ b)
    (hSblock : D.S ⊆ blockSupport D.BS) :
    ∀ e ∈ D.E, e ∣ D.L := by
  intro e he
  exact constructionEdges_dvd_period (b := b) (Q := D.Q) (R := D.R) (S := D.S)
    (BS := D.BS) (by simpa [E] using he)
    (hQdvd := by simpa [L] using hQdvd) (hRdvd := hRdvd) (hSblock := hSblock)

/-- The base denominator divides the construction period. -/
lemma base_dvd_period (D : ConstructionData T b) :
    b ∣ D.L := by
  refine ⟨∏ p ∈ blockSupport D.BS, p, ?_⟩
  rfl

/-- The concrete period is positive once the base denominator is positive. -/
lemma period_pos (D : ConstructionData T b) (hb : 0 < b) :
    0 < D.L := by
  unfold L primeSupportPeriod
  exact Nat.mul_pos hb (Finset.prod_pos fun p hp => (blockSupport_prime D.BS hp).pos)

/-- Positivity of all concrete edges, as consumed by the circle-method core. -/
lemma edges_pos (D : ConstructionData T b)
    (hsemi : ∀ e ∈ D.E, IsSemiprime e) :
    ∀ e ∈ D.E, 0 < e := by
  intro e he
  exact (hsemi e he).pos

/-- Non-emptiness inherited from a non-empty mass batch. -/
lemma nonempty_of_massBatch_nonempty (D : ConstructionData T b)
    (hQne : D.Q.Nonempty) :
    D.E.Nonempty := by
  obtain ⟨e, he⟩ := hQne
  exact ⟨e, D.massBatch_subset_E he⟩

/-- Non-emptiness inherited from a non-empty control-edge set. -/
lemma nonempty_of_ctrlEdges_nonempty (D : ConstructionData T b)
    (hctrlne : (ctrlEdges D.BS).Nonempty) :
    D.E.Nonempty := by
  obtain ⟨e, he⟩ := hctrlne
  exact ⟨e, D.ctrlEdges_subset_E he⟩

/-- The light-extra wrapper used to feed `hbeat`: for the concrete edge set,
`σ_E ≤ σ_ctrl` follows from the explicit extra inverse-square hypothesis. -/
lemma sigma_le_sigmaCtrl_of_light (D : ConstructionData T b) (theta : ℕ → ℝ)
    (hextra : ∑ e ∈ D.E \ ctrlEdges D.BS, 1 / (e : ℝ) ^ 2
        ≤ 3 * (sigmaCtrl D.BS) ^ 2) :
    Real.sqrt (sigmaE2 D.E theta) ≤ sigmaCtrl D.BS := by
  exact sigmaE_le_sigmaCtrl_of_extra_light D.BS D.E theta D.ctrlEdges_subset_E hextra

/-- If the residual batch is disjoint from the fixed base edges, the concrete
load splits as `baseLoad + recipLoad Q`. -/
lemma recipLoad_E_eq_baseLoad_add_Q (D : ConstructionData T b)
    (hdisj : Disjoint D.Q (ctrlEdges D.BS ∪ gadgetEdges D.R D.S)) :
    recipLoad D.E = D.baseLoad + recipLoad D.Q := by
  unfold recipLoad baseLoad E constructionEdges
  have hset :
      ctrlEdges D.BS ∪ D.Q ∪ gadgetEdges D.R D.S =
        D.Q ∪ (ctrlEdges D.BS ∪ gadgetEdges D.R D.S) := by
    ext e
    simp only [Finset.mem_union]
    tauto
  rw [hset, Finset.sum_union hdisj]
  rw [recipLoad]
  ring

/-- Residual reciprocal-window extraction after a fixed nonnegative base load.

This is the mass-correction wrapper: the mass batch is chosen to fill the
remaining gap below `3/(2b)`, rather than using the standalone block-aligned
batch as the final load. -/
lemma exists_residual_subset_recip_window
    (P : Finset ℕ) (base : ℝ) (b : ℕ)
    (hb : 0 < b)
    (hbase : base < 3 / (2 * (b : ℝ)))
    (hsmall : ∀ e ∈ P, (1 : ℝ) / (e : ℝ) < 3 / (2 * (b : ℝ)))
    (hsum : 3 / (2 * (b : ℝ)) - base ≤ recipLoad P) :
    ∃ Q : Finset ℕ,
      Q ⊆ P ∧
      3 / (2 * (b : ℝ)) ≤ base + recipLoad Q ∧
      base + recipLoad Q < 3 / (b : ℝ) := by
  have hgap_pos : 0 < 3 / (2 * (b : ℝ)) := by
    positivity
  have hbR : (b : ℝ) ≠ 0 := by exact_mod_cast hb.ne'
  have hgap_eq : 3 / (2 * (b : ℝ)) = 3 / (b : ℝ) - 3 / (2 * (b : ℝ)) := by
    field_simp [hbR]
    ring
  obtain ⟨Q, hQsub, hQlb, hQub⟩ :=
    RequestProject.exists_subset_sum_in_residual_window P
      (fun e => (1 : ℝ) / (e : ℝ)) base (3 / (2 * (b : ℝ))) (3 / (b : ℝ))
      (3 / (2 * (b : ℝ))) (le_of_lt hbase) hgap_eq hgap_pos hsmall
      (by simpa [recipLoad] using hsum)
  exact ⟨Q, hQsub, hQlb, by simpa [recipLoad] using hQub⟩

/-- Convert residual base-plus-batch load bounds into the concrete edge-load
window for `D.E`. -/
lemma total_recipLoad_window_of_residual (D : ConstructionData T b)
    (hdisj : Disjoint D.Q (ctrlEdges D.BS ∪ gadgetEdges D.R D.S))
    (hlb : 3 / (2 * (b : ℝ)) ≤ D.baseLoad + recipLoad D.Q)
    (hub : D.baseLoad + recipLoad D.Q < 3 / (b : ℝ)) :
    3 / (2 * (b : ℝ)) ≤ recipLoad D.E ∧
      recipLoad D.E < 3 / (b : ℝ) := by
  rw [D.recipLoad_E_eq_baseLoad_add_Q hdisj]
  exact ⟨hlb, hub⟩

/-- Abstract weight package for the final `ArcConstruction` assembly.  This names
exactly the common-window and mass hypotheses without forcing the final mass-tuning
choices into this structural file. -/
structure Weights (D : ConstructionData T b) where
  theta : ℕ → ℝ
  hlb : ∀ e ∈ D.E, 1 / 3 ≤ theta e
  hub : ∀ e ∈ D.E, theta e ≤ 2 / 3
  hmass : (∑ e ∈ D.E, theta e / (e : ℝ)) = 1 / (b : ℝ)

end ConstructionData

end CircleMethod

end
