import RequestProject.CircleMethodAssembly
import RequestProject.CircleMethodMainTerm
import RequestProject.Spectral.CircleMethodBridge

/-!
# Exact reciprocal selection from arc estimates

This module is the mathematical handoff from a completed circle-method
construction to an exact reciprocal subset. The main-arc lower bound and the
minor-arc norm bound combine through abstract spectral selection; semiprimality
and avoidance are used only afterwards to interpret the selected subset.
-/

open scoped BigOperators

namespace CircleMethod

/-- A circle-method construction whose target denominator is nontrivial
selects a subset with reciprocal sum exactly `1 / b`. -/
theorem ArcConstruction.exists_reciprocal_subset
    {T : Finset ℕ} {b : ℕ} (c : ArcConstruction T b) (hb : 1 < b) :
    ∃ S ⊆ c.family.E, (∑ e ∈ S, (1 : ℚ) / (e : ℚ)) = (1 : ℚ) / (b : ℚ) := by
  let F := c.family
  let M := c.main
  let A := c.minor
  obtain ⟨S, hSE, hSsum⟩ :=
    exists_subset_sum_eq_of_fourier_gap F.E F.theta (F.L / b) F.L
      M.fields.SM M.fields.Sm A.Bm
      (bernoulliMainTermConstant / Real.sqrt (sigmaE2 F.E F.theta))
      (Nat.div_lt_self F.hL hb) F.hL F.heL F.hbound
      (fun e he => by linarith [F.hlb e he])
      (fun e he => by linarith [F.hub e he])
      M.fields.hpart M.fields.hdisj
      (main_sum_re_lower F.E F.theta (F.L / b) F.L M.N M.fields.SM M.fields.lbl
        F.hne F.he0 F.hlb F.hub
        (F.hmass.trans (ReciprocalPeriod.one_div_eq_period_div_real
          b F.L (by omega) F.hL F.hbL))
        M.hN M.htw M.hsmall M.fields.hmaps M.fields.hinj M.fields.hsurj M.fields.hterm)
      A.hminor A.hbeat
  exact ⟨S, hSE, hSsum.trans (ReciprocalPeriod.one_div_eq_period_div
    b F.L (by omega) F.hL F.hbL).symm⟩

/-- Interpreting the selected subset through the arithmetic edge conditions
gives a semiprime Egyptian representation avoiding the prescribed set. -/
theorem ArcConstruction.hasEgyptianSemiprimeReprAvoiding
    {T : Finset ℕ} {b : ℕ} (c : ArcConstruction T b) (hb : 1 < b) :
    HasEgyptianSemiprimeReprAvoiding T ((1 : ℚ) / (b : ℚ)) := by
  obtain ⟨S, hSE, hsum⟩ := c.exists_reciprocal_subset hb
  exact repr_of_subset T c.family.E b c.family.hsemi c.family.havoid S hSE hsum

end CircleMethod
