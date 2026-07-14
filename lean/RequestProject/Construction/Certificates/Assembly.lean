import RequestProject.Construction.Certificates.MinorArcEstimate
import RequestProject.CircleMethodAssembly
import RequestProject.Core.ReciprocalPeriod

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Circle-method certificate assembly
-/

/-! ## Final assembly -/

/-- Assemble the weighted family and the main- and minor-arc certificates from
the five construction certificates. This definition chooses no parameters and
proves no new estimates. -/
def arcConstructionOfCertificates {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) (A : MainArcWindowCertificate F Cc M)
    (R : MinorArcEstimateCertificate F Cc M A) : ArcConstruction T b where
  family := {
    E := M.D.E
    theta := M.W.theta
    L := M.D.L
    hsemi := M.hsemi
    havoid := M.havoid
    hne := M.hne
    hL := M.D.period_pos F.ledger.hbpos
    hbL := M.D.base_dvd_period
    heL := M.heL
    he0 := M.he0
    hbound := ReciprocalPeriod.period_div_sum_lt_of_recip_sum_lt M.D.E M.D.L
      (M.D.period_pos F.ledger.hbpos) M.he0 M.heL (by
        have hbR : (3 : ℝ) ≤ (b : ℝ) := by exact_mod_cast F.ledger.hb3
        have hbpos : (0 : ℝ) < (b : ℝ) := by positivity
        have hthree : 3 / (b : ℝ) ≤ 1 := by
          rw [div_le_one hbpos]
          exact hbR
        exact lt_of_lt_of_le M.hloadUpper hthree)
    hlb := M.W.hlb
    hub := M.W.hub
    hmass := M.W.hmass
  }
  main := {
    N := A.N
    fields := Classical.choice <| exists_mainArcFields M.D.E M.W.theta
      (M.D.L / b) M.D.L A.N (M.D.period_pos F.ledger.hbpos)
      M.he0 M.heL A.hNnonneg A.hNL
    hN := A.hNF.hN
    htw := A.hNF.htw
    hsmall := A.hNF.hsmall
  }
  minor := {
    Bm := R.Bm
    hminor := R.hminor _
    hbeat := R.hbeat
  }

/-- The five construction certificates directly supply an `ArcConstruction`. -/
lemma assemble_arcConstruction {T : Finset ℕ} {b : ℕ}
    (F : ConstructionFoundation T b) (Cc : GadgetEdgeCertificate F)
    (M : WeightedEdgeCertificate F Cc) (A : MainArcWindowCertificate F Cc M)
    (R : MinorArcEstimateCertificate F Cc M A) :
    Nonempty (ArcConstruction T b) :=
  ⟨arcConstructionOfCertificates F Cc M A R⟩

/-- The arc construction exists
for squarefree `b ≥ 3`, assembled through the explicit certificate chain
`foundation → concrete → mass → main-arc → minor → final`. -/
theorem exists_arcConstruction (T : Finset ℕ) (b : ℕ)
    (hb : 3 ≤ b) (hbsf : Squarefree b) :
    Nonempty (ArcConstruction T b) := by
  obtain ⟨F⟩ := exists_construction_foundation T b hb hbsf
  obtain ⟨Cc⟩ := exists_gadget_edge_certificate F
  obtain ⟨M⟩ := exists_weighted_edge_certificate F Cc
  obtain ⟨A⟩ := exists_main_arc_window_certificate F Cc M
  obtain ⟨Rm⟩ := exists_minor_arc_estimate_certificate F Cc M A
  exact assemble_arcConstruction F Cc M A Rm

end CircleMethod

end
