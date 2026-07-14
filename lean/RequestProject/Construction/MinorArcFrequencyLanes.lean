import RequestProject.CircleMethod.QuadraticEnergy
import RequestProject.Construction.ControlEdges
import RequestProject.Construction.MainArcClassification

open Finset BigOperators GlobalControl
open scoped Classical

noncomputable section

namespace CircleMethod

/-!
# Minor-arc frequency lanes

The block-minor fiber estimate and the extra-minor integer-label, counting,
and gadget-damping estimates are assembled into the frequency lanes consumed
by the minor-arc endgame.
-/

/-- Block-minor lane: the block-fiber-tail data, with `K = b` and `Qextra = quadraticEnergy − Qctrl`
(so `hQE` is an equality and `Qextra ≥ 0`, making `hfiber` the `b`-to-1 fiber count). -/
def blockMinorFiberTailData {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock : Finset ℕ) (C η Ctail Bblock : ℝ) (hC : 1 ≤ C)
    (heL : ∀ e ∈ D.E, e ∣ D.L) (he0 : ∀ e ∈ D.E, 0 < e) (hL : 0 < D.L)
    (hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p)
    (hsubMA : blockMinorPart MA.Sm Sblock ⊆ Finset.range D.L)
    (hnotmain : ∀ h ∈ blockMinorPart MA.Sm Sblock,
      (fun p => ((h : ZMod p.1)) : GlobalAssignment D.BS) ∉ mainArc D.BS C)
    (hbudget : (b : ℝ) * ((η + Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2)) / sigmaCtrl D.BS)
        ≤ Bblock) :
    BlockMinorFiberTail D W N MA Sblock Bblock η Ctail where
  C := C
  K := b
  Qextra := fun h => quadraticEnergy D.E h - Qctrl D.BS (fun p => ((h : ZMod p.1)))
  hC := hC
  hK := by positivity
  heL := heL
  he0 := he0
  hL := hL
  hQE := fun h _ => le_of_eq (by ring)
  hnotmain := hnotmain
  hbudget := hbudget
  hfiber := fun a => by
    have hsubset : (blockMinorPart MA.Sm Sblock).filter
        (fun h => (fun p => ((h : ZMod p.1)) : GlobalAssignment D.BS) = a) ⊆
        (Finset.range D.L).filter
        (fun h => (fun p : {p // p ∈ blockSupport D.BS} => ((h : ZMod p.1))) = a) := by
      intro h hh
      rw [Finset.mem_filter] at hh ⊢
      exact ⟨hsubMA hh.1, hh.2⟩
    refine le_trans (Finset.sum_le_card_nsmul _ _ 1 ?_) ?_
    · intro h _
      refine Real.exp_le_one_iff.mpr ?_
      have hnn : 0 ≤ quadraticEnergy D.E h - Qctrl D.BS (fun p => ((h : ZMod p.1))) :=
        sub_nonneg.mpr (controlEnergy_le_quadraticEnergy D.BS D.E D.ctrlEdges_subset_E h)
      nlinarith [hnn]
    · simp only [nsmul_eq_mul, mul_one]
      exact_mod_cast le_trans (Finset.card_le_card hsubset)
        (mainArc_fiber_card_le D.BS D.L b hLeq a)

/-
Count bound for the extra-minor frequencies: a main-arc frequency is a CRT
constant assignment `a_m` for a single label `m` with `|m| ≤ C/σ ≤ N`, and each
label-fiber has `≤ b` frequencies in `range L`.  Hence at most `b·(2N+1)`.
-/
lemma extraMinor_card_le {T : Finset ℕ} {b : ℕ} (D : ConstructionData T b)
    (W : ConstructionData.Weights D) (N : ℤ) (C : ℝ)
    (hN : 0 ≤ N)
    (hCN : C / sigmaCtrl D.BS ≤ (N : ℝ))
    (hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N) :
    ((extraMinorPart MA.Sm ((mainArcClassificationData D W N C).Sblock MA)
        ((mainArcClassificationData D W N C).Sextra MA)).card : ℝ)
      ≤ (b : ℝ) * (2 * (N : ℝ) + 1) := by
  refine' le_trans ( Nat.cast_le.mpr ( Finset.card_le_card _ ) ) _;
  exact Finset.biUnion ( Finset.Icc ( -N ) N ) fun m => Finset.filter ( fun h => ( fun p : { p // p ∈ blockSupport D.BS } => ( h : ZMod p.1 ) ) = ( fun p : { p // p ∈ blockSupport D.BS } => ( m : ZMod p.1 ) ) ) ( Finset.range D.L );
  · intro h hh; simp_all +decide [ extraMinorPart, mainArcClassificationData ] ;
    unfold mainArcBlockSet mainArcExtraSet at hh; simp_all +decide [ funext_iff ] ;
    obtain ⟨ m, hm₁, hm₂ ⟩ := hh.2.2.2; use m; simp_all +decide [ freqAssignmentOf ] ;
    exact ⟨ ⟨ by exact_mod_cast neg_le_of_abs_le ( hm₁.trans hCN ), by exact_mod_cast le_of_abs_le ( hm₁.trans hCN ) ⟩, by linarith [ Finset.mem_range.mp ( mainArcFields_mem_range_of_mem_Sm MA hh.1 ) ] ⟩;
  · refine' le_trans ( Nat.cast_le.mpr <| Finset.card_biUnion_le ) _;
    refine' le_trans ( Nat.cast_le.mpr <| Finset.sum_le_sum fun x hx => mainArc_fiber_card_le D.BS D.L b hLeq _ ) _ ; norm_num [ Int.card_Icc ] ; ring_nf ; norm_cast ; norm_num [ hN ] ;
    rw [ max_eq_left ] <;> linarith

/-- **Main-arc CRT label lane.** Every extra-minor frequency `h` lies on the main
arc, hence carries an integer block-label `m = mainArcWitnessLabel D C h` with
`|m| ≤ C/σ ≤ N`. This packages that label data as
`ExtraIntegerFrequencyLabelData`, the input the gadget reservoir reads when damping
each extra frequency. -/
def extraMinorIntegerLabels {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ) (C : ℝ)
    (hCN : C / sigmaCtrl D.BS ≤ (N : ℝ)) :
    ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
      ExtraIntegerFrequencyLabelData D W N MA
        ((mainArcClassificationData D W N C).Sblock MA)
        ((mainArcClassificationData D W N C).Sextra MA) :=
  fun MA => intFrequencyLabelData_of_mainArcClassification D W N C MA (by
    intro m hm
    exact Finset.mem_Icc.mpr
      ⟨by exact_mod_cast neg_le_of_abs_le <| hm.trans hCN,
        by exact_mod_cast le_of_abs_le <| hm.trans hCN⟩)

/-- **Block-lane fibre-tail certificate.** On the block-minor part the
frequency-to-assignment map is `b`-to-1 (bounded multiplicity from the chosen
period `L = b · ∏ blockSupport`), so the block fibre tail is controlled by
`Bblock = b · (η + Ctail·exp(-8C²/9))/σ_ctrl`.  This is the block lane of the
frequency endgame, produced for every main-arc field `MA`. -/
def blockMinorFrequencyLane {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ)
    (C η Ctail : ℝ) (hC : 1 ≤ C)
    (heL : ∀ e ∈ D.E, e ∣ D.L) (he0 : ∀ e ∈ D.E, 0 < e) (hL : 0 < D.L)
    (hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p) :
    ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
      BlockMinorFiberTail D W N MA
        ((mainArcClassificationData D W N C).Sblock MA)
        ((b : ℝ) * (η + Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2)) / sigmaCtrl D.BS)
        η Ctail :=
  fun MA => by
    apply blockMinorFiberTailData D W N MA ((mainArcClassificationData D W N C).Sblock MA) C η Ctail
      ((b:ℝ)*(η+Ctail*Real.exp (-C^2*(16/9)/2))/sigmaCtrl D.BS) hC heL he0 hL hLeq (by
      exact fun x hx => mainArcFields_mem_range_of_mem_Sm MA ( mem_blockMinorPart.mp hx |>.1 )) (by
      intro h hh; exact (by
      exact Finset.mem_filter.mp ( Finset.mem_filter.mp hh |>.2 ) |>.2)) (by
      grind +extAll)

/-- **Extra-frequency count certificate.** Each extra-minor frequency is the CRT
constant assignment of a single label `m` with `|m| ≤ N`, and every label fibre
has at most `b` frequencies in `range L`; hence at most `b·(2N+1)` extra
frequencies.  Multiplying by the per-frequency damping budget `Dmp` gives the
uniform extra-count budget `Bextra = b·(2N+1)·Dmp`. -/
lemma extraMinorCountBound {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ)
    (C Dmp : ℝ) (hNnonneg : 0 ≤ N) (hDmpnn : 0 ≤ Dmp)
    (hCN : C / sigmaCtrl D.BS ≤ (N : ℝ))
    (hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p) :
    ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
      ((extraMinorPart MA.Sm ((mainArcClassificationData D W N C).Sblock MA)
          ((mainArcClassificationData D W N C).Sextra MA)).card : ℝ) * Dmp
        ≤ (b : ℝ) * (2 * (N : ℝ) + 1) * Dmp :=
  fun MA => by
    gcongr
    convert extraMinor_card_le D W N C hNnonneg hCN hLeq MA using 1

/-- **Gadget pointwise damping certificate.** For every extra-minor frequency the
chosen `R`-prime sibling has `rfun h ∣ b`, so `1 ≤ rfun h ≤ b`, and damping by
the `G = |S|` gadget primes drives the per-frequency factor
`√(1-(8/9)/rfun²)^G` below the worst-case bound `√(1-(8/9)/b²)^G ≤ Dmp`.  This is
the gadget lane of the frequency endgame, using the labels from
`extraMinorIntegerLabels`. -/
lemma gadgetDampingBound {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ)
    (C Dmp : ℝ) (G : ℕ)
    (hbpos : 0 < b) (hsqfree : Squarefree b)
    (hcovR : CoversPrimeDivisors D.R b) (hcopB : BlockSupportCoprimeWith D.BS b)
    (hCN : C / sigmaCtrl D.BS ≤ (N : ℝ))
    (hScard : D.S.card = G)
    (hG : (Real.sqrt (1 - (8 / 9) / (b : ℝ) ^ 2)) ^ G ≤ Dmp) :
    ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
      ∀ h ∈ extraMinorPart MA.Sm ((mainArcClassificationData D W N C).Sblock MA)
          ((mainArcClassificationData D W N C).Sextra MA),
        (Real.sqrt (1 - (8 / 9) /
          (((extraSiblingChoice_of_integerLabelData D W N MA
            ((mainArcClassificationData D W N C).Sblock MA)
            ((mainArcClassificationData D W N C).Sextra MA)
            (extraMinorIntegerLabels D W N C hCN MA) hbpos hsqfree hcovR hcopB).rfun h : ℝ) ^ 2))) ^
              D.S.card ≤ Dmp :=
  fun MA h hh => by
    refine' le_trans _ hG
    rw [ hScard ]
    gcongr
    · exact sq_pos_of_pos ( Nat.cast_pos.mpr ( Nat.Prime.pos ( by exact ( extraSiblingChoice_of_integerLabelData D W N MA _ _ _ hbpos hsqfree hcovR hcopB ).hrprime h hh ) ) )
    · exact Nat.le_of_dvd hbpos ( extraSiblingChoice_of_integerLabelData D W N MA _ _ _ hbpos hsqfree hcovR hcopB |>.hrdvd h hh )

/-- **Small-label gap certificate.** Every extra-minor frequency carries a label
`m` with `|m| ≤ C/σ ≤ N`, while each gadget prime `s ∈ S` satisfies
`2^{2k₀} ≤ s`; combined with `2N < 2^{2k₀}` this gives the gap `2|m| < s` the
gadget reservoir needs to read each label modulo `s`. -/
lemma extraMinorLabelGap {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ) (C : ℝ)
    (hCN : C / sigmaCtrl D.BS ≤ (N : ℝ))
    (hN2 : 2 * N < (2 : ℤ) ^ (2 * D.BS.k0))
    (hSge : ∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s) :
    ∀ MA : MainArcFields D.E W.theta (D.L / b) D.L N,
      ∀ h ∈ extraMinorPart MA.Sm ((mainArcClassificationData D W N C).Sblock MA)
          ((mainArcClassificationData D W N C).Sextra MA),
        ∀ s ∈ D.S, 2 * |(extraMinorIntegerLabels D W N C hCN MA).mfun h| < (s : ℤ) := by
  intro MA h hh s hs
  -- the label is the main-arc witness, with `|label| ≤ C/σ ≤ N`
  rw [mem_extraMinorPart] at hh
  have hmain : freqAssignmentOf D h ∈ mainArc D.BS C := by
    have h22 := hh.2.2
    simp only [mainArcClassificationData, mainArcExtraSet, Finset.mem_filter] at h22
    exact h22.2
  have hspec := Classical.choose_spec hmain
  have hlblval : (extraMinorIntegerLabels D W N C hCN MA).mfun h = Classical.choose hmain := by
    simp [extraMinorIntegerLabels, intFrequencyLabelData_of_mainArcClassification,
      mainArcWitnessLabel, hmain]
  have hlabel_le : |((Classical.choose hmain : ℤ) : ℝ)| ≤ (N : ℝ) := hspec.1.trans hCN
  have hlabel_leN : |Classical.choose hmain| ≤ N := by
    have := hlabel_le
    rw [← Int.cast_abs] at this
    exact_mod_cast this
  have hsge2 : (2 : ℤ) ^ (2 * D.BS.k0) ≤ (s : ℤ) := by exact_mod_cast hSge s hs
  rw [hlblval]
  have := abs_le.mp hlabel_leN
  omega

/-
Assemble the frequency-minor endgame lanes from the foundation/gadget data and
the parameter choices: the component scale (ρ = N), the block fiber-tail lane
(`blockMinorFrequencyLane`), the main-arc CRT label lane (`extraMinorIntegerLabels`), the
small-label gap (`extraMinorLabelGap`), the extra-frequency count budget
(`extraMinorCountBound`), and the `G`-gadget per-frequency damping
(`gadgetDampingBound`).
-/
lemma minorArcFrequencyLanes {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (W : ConstructionData.Weights D) (N : ℤ)
    (C η Ctail Dmp : ℝ) (G : ℕ)
    (hbpos : 0 < b) (hsqfree : Squarefree b)
    (hcovR : CoversPrimeDivisors D.R b) (hcopB : BlockSupportCoprimeWith D.BS b)
    (hRprime : ∀ r ∈ D.R, Nat.Prime r) (hSprime : ∀ s ∈ D.S, Nat.Prime s)
    (hRdvd : ∀ r ∈ D.R, r ∣ b) (hSblock : D.S ⊆ blockSupport D.BS)
    (hlt : ∀ r ∈ D.R, ∀ s ∈ D.S, r < s)
    (hctrlAvoid : ∀ e ∈ ctrlEdges D.BS, e ∉ T)
    (hgadgetAvoid : ∀ e ∈ gadgetEdges D.R D.S, e ∉ T)
    (heL : ∀ e ∈ D.E, e ∣ D.L) (he0 : ∀ e ∈ D.E, 0 < e) (hL : 0 < D.L)
    (hLeq : D.L = b * ∏ p ∈ blockSupport D.BS, p)
    (hC : 1 ≤ C) (hNnonneg : 0 ≤ N)
    (hSge : ∀ s ∈ D.S, 2 ^ (2 * D.BS.k0) ≤ s) (hScard : D.S.card = G)
    (hCN : C / sigmaCtrl D.BS ≤ (N : ℝ))
    (hN2 : 2 * N < (2 : ℤ) ^ (2 * D.BS.k0))
    (hDmpnn : 0 ≤ Dmp)
    (hG : (Real.sqrt (1 - (8 / 9) / (b : ℝ) ^ 2)) ^ G ≤ Dmp) :
    Nonempty (MinorArcFrequencyLanes D W N
      ((b : ℝ) * (η + Ctail * Real.exp (-C ^ 2 * (16 / 9) / 2)) / sigmaCtrl D.BS)
      ((b : ℝ) * (2 * (N : ℝ) + 1) * Dmp) η Ctail (N : ℝ) Dmp
      (mainArcClassificationData D W N C)) := by
  constructor;
  apply_rules [ MinorArcFrequencyLanes.mk ];
  use by norm_cast;
  exact le_mul_of_one_le_right ( by positivity ) ( mod_cast Nat.one_le_iff_ne_zero.mpr <| by positivity );
  exact 1;
  exact le_mul_of_one_le_right ( by positivity ) ( mod_cast Nat.one_le_iff_ne_zero.mpr <| by positivity );
  exact fun r hr => Nat.Prime.pos ( hRprime r hr );
  -- block lane: block-fibre-tail certificate
  exact blockMinorFrequencyLane D W N C η Ctail hC heL he0 hL hLeq;
  exact fun MA h hh => Finset.Subset.refl _;
  rotate_right;
  -- main-arc CRT label lane
  exact extraMinorIntegerLabels D W N C hCN;
  · -- small-label gap `2|m| < s` for the gadget primes
    exact extraMinorLabelGap D W N C hCN hN2 hSge;
  · -- extra-frequency count budget
    exact extraMinorCountBound D W N C Dmp hNnonneg hDmpnn hCN hLeq;
  · -- gadget pointwise damping
    exact gadgetDampingBound D W N C Dmp G hbpos hsqfree hcovR hcopB hCN hScard hG

end CircleMethod

end
