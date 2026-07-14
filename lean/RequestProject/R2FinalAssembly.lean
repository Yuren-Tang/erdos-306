import RequestProject.Core.ReciprocalPeriod
import RequestProject.CircleMethod.MainArcPeriodicity
import RequestProject.CircleMethodAssembly
import RequestProject.Construction.Edges
import RequestProject.Spectral.BernoulliVariance

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# R2 final assembly spine

This file records the exact data that, once supplied, constructs an
`ArcConstruction`. It neither chooses the block system nor proves the
independent main- and minor-arc estimates.
-/

/-- The final collection of structural, main-arc, and minor-arc facts needed
to construct an `ArcConstruction`. -/
structure R2FinalSupply (T : Finset ℕ) (b : ℕ) where
  D : R2ConcreteData T b
  W : R2ConcreteData.Weights D
  N : ℤ
  MA : MainArcFields D.E W.theta (D.L / b) D.L N
  Bm : ℝ
  hsemi : ∀ e ∈ D.E, IsSemiprime e
  havoid : ∀ e ∈ D.E, e ∉ T
  hne : D.E.Nonempty
  heL : ∀ e ∈ D.E, e ∣ D.L
  he0 : ∀ e ∈ D.E, 0 < e
  hloadUpper : R2ConcreteData.recipLoad D.E < 3 / (b : ℝ)
  hN : (1 : ℝ) / Real.sqrt (sigmaE2 D.E W.theta) ≤ (N : ℝ)
  htw : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ D.E,
    |(m : ℝ) / (e : ℝ)| ≤ 1 / 10
  hsmall : ∀ m ∈ Finset.Icc (-N) N,
    (∑ e ∈ D.E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤ 1 / 10
  hminor : (∑ h ∈ MA.Sm, ‖fourierTerm D.E W.theta (D.L / b) D.L h‖) ≤ Bm
  hbeat : Bm < bernoulliMainTermConstant /
    Real.sqrt (sigmaE2 D.E W.theta)

/-- Assemble an `ArcConstruction` from the final supply package. -/
def R2FinalSupply.toArcConstruction {T : Finset ℕ} {b : ℕ}
    (hb : 3 ≤ b) (S : R2FinalSupply T b) : ArcConstruction T b where
  family := {
    E := S.D.E
    theta := S.W.theta
    L := S.D.L
    hsemi := S.hsemi
    havoid := S.havoid
    hne := S.hne
    hL := S.D.period_pos (Nat.lt_of_lt_of_le (by norm_num) hb)
    hbL := S.D.base_dvd_period
    heL := S.heL
    he0 := S.he0
    hbound := ReciprocalPeriod.period_div_sum_lt_of_recip_sum_lt S.D.E S.D.L
      (S.D.period_pos (Nat.lt_of_lt_of_le (by norm_num) hb)) S.he0 S.heL (by
        have hbR : (3 : ℝ) ≤ (b : ℝ) := by exact_mod_cast hb
        have hbpos : (0 : ℝ) < (b : ℝ) := by positivity
        have hthree : 3 / (b : ℝ) ≤ 1 := by
          rw [div_le_one hbpos]
          exact hbR
        exact lt_of_lt_of_le S.hloadUpper hthree)
    hlb := S.W.hlb
    hub := S.W.hub
    hmass := S.W.hmass
  }
  main := {
    N := S.N
    fields := S.MA
    hN := S.hN
    htw := S.htw
    hsmall := S.hsmall
  }
  minor := {
    Bm := S.Bm
    hminor := S.hminor
    hbeat := S.hbeat
  }

/-- The final assembly theorem in hypothesis-heavy form. -/
theorem exists_arcConstruction_of_R2FinalSupply
    (T : Finset ℕ) (b : ℕ) (hb : 3 ≤ b)
    (S : R2FinalSupply T b) :
    Nonempty (ArcConstruction T b) :=
  ⟨S.toArcConstruction hb⟩

/-- Construct the final supply package and its main-arc finite data from the
period inequality. -/
theorem exists_R2FinalSupply_of_mainArcParams
    {T : Finset ℕ} {b : ℕ}
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ) (Bm : ℝ)
    (hL : 0 < D.L)
    (hNnonneg : 0 ≤ N)
    (hNL : 2 * N + 1 ≤ (D.L : ℤ))
    (hsemi : ∀ e ∈ D.E, IsSemiprime e)
    (havoid : ∀ e ∈ D.E, e ∉ T)
    (hne : D.E.Nonempty)
    (heL : ∀ e ∈ D.E, e ∣ D.L)
    (he0 : ∀ e ∈ D.E, 0 < e)
    (hloadUpper : R2ConcreteData.recipLoad D.E < 3 / (b : ℝ))
    (hN : (1 : ℝ) / Real.sqrt (sigmaE2 D.E W.theta) ≤ (N : ℝ))
    (htw : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ D.E,
      |(m : ℝ) / (e : ℝ)| ≤ 1 / 10)
    (hsmall : ∀ m ∈ Finset.Icc (-N) N,
      (∑ e ∈ D.E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤ 1 / 10)
    (hminor : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
      (∑ h ∈ MA.Sm, ‖fourierTerm D.E W.theta (D.L / b) D.L h‖) ≤ Bm)
    (hbeat : Bm < bernoulliMainTermConstant /
      Real.sqrt (sigmaE2 D.E W.theta)) :
    Nonempty (R2FinalSupply T b) := by
  obtain ⟨MA⟩ := exists_mainArcFields D.E W.theta (D.L / b) D.L N
    hL he0 heL hNnonneg hNL
  exact ⟨{
    D := D
    W := W
    N := N
    MA := MA
    Bm := Bm
    hsemi := hsemi
    havoid := havoid
    hne := hne
    heL := heL
    he0 := he0
    hloadUpper := hloadUpper
    hN := hN
    htw := htw
    hsmall := hsmall
    hminor := hminor MA
    hbeat := hbeat
  }⟩

/-- Direct final assembly from concrete data plus main-arc parameters. -/
theorem exists_arcConstruction_of_mainArcParams
    {T : Finset ℕ} {b : ℕ}
    (hb : 3 ≤ b)
    (D : R2ConcreteData T b) (W : R2ConcreteData.Weights D) (N : ℤ) (Bm : ℝ)
    (hNnonneg : 0 ≤ N)
    (hNL : 2 * N + 1 ≤ (D.L : ℤ))
    (hsemi : ∀ e ∈ D.E, IsSemiprime e)
    (havoid : ∀ e ∈ D.E, e ∉ T)
    (hne : D.E.Nonempty)
    (heL : ∀ e ∈ D.E, e ∣ D.L)
    (he0 : ∀ e ∈ D.E, 0 < e)
    (hloadUpper : R2ConcreteData.recipLoad D.E < 3 / (b : ℝ))
    (hN : (1 : ℝ) / Real.sqrt (sigmaE2 D.E W.theta) ≤ (N : ℝ))
    (htw : ∀ m ∈ Finset.Icc (-N) N, ∀ e ∈ D.E,
      |(m : ℝ) / (e : ℝ)| ≤ 1 / 10)
    (hsmall : ∀ m ∈ Finset.Icc (-N) N,
      (∑ e ∈ D.E, bernoulliTaylorRemainderConstant * |(m : ℝ) / (e : ℝ)| ^ 3) ≤ 1 / 10)
    (hminor : ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
      (∑ h ∈ MA.Sm, ‖fourierTerm D.E W.theta (D.L / b) D.L h‖) ≤ Bm)
    (hbeat : Bm < bernoulliMainTermConstant /
      Real.sqrt (sigmaE2 D.E W.theta)) :
    Nonempty (ArcConstruction T b) := by
  have hbpos : 0 < b := Nat.lt_of_lt_of_le (by norm_num) hb
  have hL : 0 < D.L := D.period_pos hbpos
  obtain ⟨S⟩ := exists_R2FinalSupply_of_mainArcParams D W N Bm
    hL hNnonneg hNL hsemi havoid hne heL he0 hloadUpper
    hN htw hsmall hminor hbeat
  exact exists_arcConstruction_of_R2FinalSupply T b hb S

end CircleMethod

end
