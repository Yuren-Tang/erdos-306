import RequestProject.Construction.MinorArc.ExtraReservoir
import RequestProject.Construction.BlockSupportCompatibility

open Finset BigOperators GlobalControl

noncomputable section

namespace CircleMethod

/-!
# CRT sibling existence and choice

For an extra-minor frequency `h` whose block
label agrees with `h` on every block-support prime but not globally, why does
an `R`-prime sibling exist where they first disagree, and how is that choice
packaged? A squarefree-CRT mismatch argument (`exists_R_mismatch_of_block_eq_not_global`)
gives existence; `Classical.choose` packages it as functions
(`ExtraSiblingChoice`); combined with a chosen gadget set per frequency,
this instantiates `Construction.MinorArc.ExtraReservoir`'s generic
`preparedChoice_of_pointwise_budget`.

Labels arise from the main-arc classification as integers (`ℤ`, since a main
frequency's label is a signed CRT residue); the integer-labelled path
(`ExtraIntegerFrequencyLabelData` onward) is the one actually consumed
downstream (`Construction.MinorArc.Endgame`).  It reduces existence/choice to the
natural-number case via `integerLabelDataToNat`, but proves its own prepared-choice
step directly rather than delegating to a natural-number version — so there
is no natural-number-labelled "prepared choice"/"reservoir" pair to keep here;
only the sibling-choice existence/packaging is shared between the two labels.

-/

/-- For a squarefree modulus `b`, congruence modulo every prime divisor of `b`
implies congruence modulo `b`.  This is the squarefree prime-divisor-to-`b`
step. -/
lemma modEq_of_modEq_primeDivisors {b h m : ℕ} (hsq : Squarefree b)
    (hp : ∀ p, Nat.Prime p → p ∣ b → h ≡ m [MOD p]) :
    h ≡ m [MOD b] := by
  by_contra h_neq;
  -- Since $b$ is squarefree, we can write it as a product of distinct primes.
  obtain ⟨ps, hps⟩ : ∃ ps : Finset ℕ, (∀ p ∈ ps, Nat.Prime p) ∧ b = ps.prod id := by
    exact ⟨ Nat.primeFactors b, fun p hp => Nat.prime_of_mem_primeFactors hp, Eq.symm <| Nat.prod_primeFactors_of_squarefree hsq ⟩;
  simp_all +decide [ Nat.modEq_iff_dvd ];
  exact h_neq <| Finset.prod_dvd_of_coprime ( fun p hp' q hq' hpq => by have := Nat.coprime_primes ( hps.1 p hp' ) ( hps.1 q hq' ) ; aesop ) fun p hp' => hp p ( hps.1 p hp' ) <| Finset.dvd_prod_of_mem _ hp'

/-- If block-support residues agree but the global residue modulo
`b * ∏ blockSupport` does not agree, the mismatch occurs at a prime divisor of
`b`, hence inside `R` under `CoversPrimeDivisors`.

The statement adds a `Squarefree b` hypothesis: without it the claim is false
(e.g. `b = 4`, `h = 0`, `m = 2` agree modulo the only prime divisor `2` but not
modulo `4`). -/
theorem exists_R_mismatch_of_block_eq_not_global
    (BS : BlockSystem) (R : Finset ℕ) (b L h m : ℕ)
    (hL : L = b * ∏ s ∈ blockSupport BS, s)
    (_hbpos : 0 < b)
    (hsqfree : Squarefree b)
    (hcover : CoversPrimeDivisors R b)
    (hcop : BlockSupportCoprimeWith BS b)
    (hblock : ∀ s ∈ blockSupport BS, (h : ZMod s) = (m : ZMod s))
    (hnot : (h : ZMod L) ≠ (m : ZMod L)) :
    ∃ r ∈ R, Nat.Prime r ∧ r ∣ b ∧ (h : ZMod r) ≠ (m : ZMod r) := by
  contrapose! hnot; simp_all +decide [ ZMod.natCast_eq_natCast_iff' ] ;
  -- Since $b$ is squarefree and coprime to each element in the block-support, we can apply the Chinese Remainder Theorem.
  have h_crt : h ≡ m [MOD b] ∧ h ≡ m [MOD ∏ s ∈ blockSupport BS, s] := by
    refine' ⟨ modEq_of_modEq_primeDivisors hsqfree _, _ ⟩;
    · exact fun p pp dp => hnot p ( hcover p pp dp ) pp dp;
    · convert freq_assignment_eq_modEq_blockSupport_prod BS _;
      ext ⟨ p, hp ⟩ ; specialize hblock p hp; simp_all +decide [ ← ZMod.natCast_eq_natCast_iff' ] ;
  rw [ Nat.ModEq.symm ];
  rw [ ← Nat.modEq_and_modEq_iff_modEq_mul ] ; tauto;
  exact Nat.Coprime.prod_right fun x hx => hcop x hx |> Nat.Coprime.symm

/-- A fiber over one block assignment has at most `b - 1` non-main siblings,
using `mainArc_fiber_card_le`. -/
theorem extra_sibling_card_le_pred_b
    (BS : BlockSystem) (L b : ℕ)
    (hL : L = b * ∏ p ∈ blockSupport BS, p)
    (a : GlobalAssignment BS)
    (main : ℕ)
    (hmain :
      main ∈ (Finset.range L).filter
        (fun h => (fun p : {p : ℕ // p ∈ blockSupport BS} =>
          (h : ZMod p.1)) = a)) :
    (((Finset.range L).filter
        (fun h => (fun p : {p : ℕ // p ∈ blockSupport BS} =>
          (h : ZMod p.1)) = a)).erase main).card ≤ b - 1 := by
  convert Nat.sub_le_sub_right ( CircleMethod.mainArc_fiber_card_le BS L b hL a ) 1 using 1;
  exact Finset.card_erase_of_mem hmain

/-- Block-label data for the extra-minor frequencies. -/
structure ExtraFrequencyLabelData
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ) where
  mfun : ℕ → ℕ
  hblock : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ blockSupport D.BS,
    (h : ZMod s) = (mfun h : ZMod s)
  hnotGlobal : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    (h : ZMod D.L) ≠ (mfun h : ZMod D.L)

/-- From block-label data, every extra frequency has an `R`-prime sibling where
the global congruence fails. -/
theorem exists_r_sibling_of_extraFrequencyLabelData
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (X : ExtraFrequencyLabelData D W N MA Sblock Sextra)
    (hbpos : 0 < b)
    (hsqfree : Squarefree b)
    (hcover : CoversPrimeDivisors D.R b)
    (hcop : BlockSupportCoprimeWith D.BS b) :
    ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      ∃ r ∈ D.R, Nat.Prime r ∧ r ∣ b ∧
        (h : ZMod r) ≠ (X.mfun h : ZMod r) := by
  intro h hh
  exact exists_R_mismatch_of_block_eq_not_global D.BS D.R b D.L h (X.mfun h)
    (by rfl) hbpos hsqfree hcover hcop (X.hblock h hh) (X.hnotGlobal h hh)

/-- Package the noncomputable sibling choice as functions `rfun`, with its
membership and mismatch certificates. -/
structure ExtraSiblingChoice
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (X : ExtraFrequencyLabelData D W N MA Sblock Sextra) where
  rfun : ℕ → ℕ
  hRmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, rfun h ∈ D.R
  hrprime : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Nat.Prime (rfun h)
  hrdvd : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, rfun h ∣ b
  hm_r : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    (h : ZMod (rfun h)) ≠ (X.mfun h : ZMod (rfun h))

/-- Choose an `R`-prime sibling for every extra frequency. -/
def extraSiblingChoice_of_labelData
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (X : ExtraFrequencyLabelData D W N MA Sblock Sextra)
    (hbpos : 0 < b)
    (hsqfree : Squarefree b)
    (hcover : CoversPrimeDivisors D.R b)
    (hcop : BlockSupportCoprimeWith D.BS b) :
    ExtraSiblingChoice D W N MA Sblock Sextra X := by
  classical
  let extra := extraMinorPart MA.Sm Sblock Sextra
  have hex :
      ∀ h ∈ extra, ∃ r, r ∈ D.R ∧ Nat.Prime r ∧ r ∣ b ∧
        (h : ZMod r) ≠ (X.mfun h : ZMod r) := by
    intro h hh
    obtain ⟨r, hr, hprime, hdvd, hneq⟩ :=
      exists_r_sibling_of_extraFrequencyLabelData D W N MA Sblock Sextra X
        hbpos hsqfree hcover hcop h hh
    exact ⟨r, hr, hprime, hdvd, hneq⟩
  let rfun : ℕ → ℕ := fun h =>
    if hh : h ∈ extra then Classical.choose (hex h hh) else 0
  refine {
    rfun := rfun
    hRmem := ?_
    hrprime := ?_
    hrdvd := ?_
    hm_r := ?_
  }
  · intro h hh
    have hchoose := Classical.choose_spec (hex h hh)
    simpa [rfun, extra, hh] using hchoose.1
  · intro h hh
    have hchoose := Classical.choose_spec (hex h hh)
    simpa [rfun, extra, hh] using hchoose.2.1
  · intro h hh
    have hchoose := Classical.choose_spec (hex h hh)
    simpa [rfun, extra, hh] using hchoose.2.2.1
  · intro h hh
    have hchoose := Classical.choose_spec (hex h hh)
    have hval : rfun h = Classical.choose (hex h hh) := dif_pos hh
    clear_value rfun
    rw [hval]
    exact hchoose.2.2.2

lemma constructionPeriod_pos {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b) (hbpos : 0 < b) : 0 < D.L := by
  rw [ConstructionData.L]
  refine Nat.mul_pos hbpos ?_
  exact Finset.prod_pos (fun s hs => (blockSupport_prime D.BS hs).pos)

/-- Integer block-label data for the extra-minor frequencies. -/
structure ExtraIntegerFrequencyLabelData
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ) where
  mfun : ℕ → ℤ
  hblock : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ blockSupport D.BS,
    (h : ZMod s) = (mfun h : ZMod s)
  hnotGlobal : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
    (h : ZMod D.L) ≠ (mfun h : ZMod D.L)

/-- Replace an integer label by its nonnegative representative modulo `D.L`.
This lets us reuse the already-proved natural-number CRT sibling lemma, while
preserving all congruences needed downstream. -/
def integerLabelDataToNat
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (X : ExtraIntegerFrequencyLabelData D W N MA Sblock Sextra)
    (hbpos : 0 < b) :
    ExtraFrequencyLabelData D W N MA Sblock Sextra where
  mfun := fun h => Int.toNat (X.mfun h % D.L)
  hblock := by
    intro h hh s hs
    have hmod := X.hblock h hh s hs
    have hsdvd : (s : ℤ) ∣ (D.L : ℤ) := by
      have hsprod : s ∣ ∏ t ∈ blockSupport D.BS, t := Finset.dvd_prod_of_mem id hs
      have hsL : s ∣ D.L := by
        rw [ConstructionData.L]
        exact dvd_mul_of_dvd_right hsprod b
      exact_mod_cast hsL
    have hLpos : 0 < D.L := by
      exact constructionPeriod_pos D hbpos
    have hrep : ((Int.toNat (X.mfun h % D.L) : ℤ) : ZMod s) =
        ((X.mfun h % D.L : ℤ) : ZMod s) := by
      rw [Int.toNat_of_nonneg (Int.emod_nonneg _ (by exact_mod_cast hLpos.ne'))]
    have hm : (X.mfun h % D.L : ℤ) ≡ X.mfun h [ZMOD s] := by
      have hDL : (X.mfun h % D.L : ℤ) ≡ X.mfun h [ZMOD D.L] := by
        simp [Int.ModEq]
      exact Int.ModEq.of_dvd hsdvd hDL
    have hcast : ((Int.toNat (X.mfun h % D.L) : ℤ) : ZMod s) =
        (X.mfun h : ZMod s) := by
      rw [hrep]
      exact (ZMod.intCast_eq_intCast_iff _ _ s).mpr hm
    have hcastNat : ((Int.toNat (X.mfun h % D.L) : ℕ) : ZMod s) =
        (X.mfun h : ZMod s) := by
      exact_mod_cast hcast
    exact hmod.trans hcastNat.symm
  hnotGlobal := by
    intro h hh hglob
    apply X.hnotGlobal h hh
    have hLpos : 0 < D.L := by
      exact constructionPeriod_pos D hbpos
    have hrep : ((Int.toNat (X.mfun h % D.L) : ℤ) : ZMod D.L) =
        ((X.mfun h % D.L : ℤ) : ZMod D.L) := by
      rw [Int.toNat_of_nonneg (Int.emod_nonneg _ (by exact_mod_cast hLpos.ne'))]
    have hcast : ((Int.toNat (X.mfun h % D.L) : ℤ) : ZMod D.L) =
        (X.mfun h : ZMod D.L) := by
      rw [hrep]
      exact ZMod.intCast_mod (X.mfun h) D.L
    have hcastNat : ((Int.toNat (X.mfun h % D.L) : ℕ) : ZMod D.L) =
        (X.mfun h : ZMod D.L) := by
      exact_mod_cast hcast
    exact hglob.trans hcastNat

/-- Choose an `R`-prime sibling for every integer-labelled extra frequency. -/
def extraSiblingChoice_of_integerLabelData
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (X : ExtraIntegerFrequencyLabelData D W N MA Sblock Sextra)
    (hbpos : 0 < b)
    (hsqfree : Squarefree b)
    (hcover : CoversPrimeDivisors D.R b)
    (hcop : BlockSupportCoprimeWith D.BS b) :
    ExtraSiblingChoice D W N MA Sblock Sextra
      (integerLabelDataToNat D W N MA Sblock Sextra X hbpos) :=
  extraSiblingChoice_of_labelData D W N MA Sblock Sextra
    (integerLabelDataToNat D W N MA Sblock Sextra X hbpos)
    hbpos hsqfree hcover hcop

/-- Integer-label data plus gadget sets and a uniform damping budget produce the
prepared reservoir choice. -/
def preparedReservoir_of_integerLabelData
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (C Bextra : ℝ)
    (X : ExtraIntegerFrequencyLabelData D W N MA Sblock Sextra)
    (Gset : ℕ → Finset ℕ)
    (hbpos : 0 < b)
    (hsqfree : Squarefree b)
    (hcover : CoversPrimeDivisors D.R b)
    (hcop : BlockSupportCoprimeWith D.BS b)
    (hSblock : D.S ⊆ blockSupport D.BS)
    (hSmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Gset h ⊆ D.S)
    (hm_small : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
      2 * |X.mfun h| < (s : ℤ))
    (hcard :
      ((extraMinorPart MA.Sm Sblock Sextra).card : ℝ) * C ≤ Bextra)
    (hpt : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      (Real.sqrt (1 - (8 / 9) /
        (((extraSiblingChoice_of_integerLabelData D W N MA Sblock Sextra X
          hbpos hsqfree hcover hcop).rfun h : ℝ) ^ 2))) ^ (Gset h).card ≤ C) :
    PreparedExtraReservoir D W N MA Sblock Sextra Bextra := by
  classical
  let Sibling :=
    extraSiblingChoice_of_integerLabelData D W N MA Sblock Sextra X
      hbpos hsqfree hcover hcop
  refine preparedChoice_of_pointwise_budget D W N MA Sblock Sextra C Bextra
    Sibling.rfun Gset X.mfun Sibling.hRmem hSmem ?_ ?_ hm_small hcard ?_
  · intro h hh s hs
    exact X.hblock h hh s (hSblock (hSmem h hh hs))
  · intro h hh hEq
    have hNat := Sibling.hm_r h hh
    apply hNat
    have hrdvdL : Sibling.rfun h ∣ D.L := by
      rw [ConstructionData.L]
      exact dvd_mul_of_dvd_left (Sibling.hrdvd h hh) (∏ s ∈ blockSupport D.BS, s)
    have hrdvdLZ : (Sibling.rfun h : ℤ) ∣ (D.L : ℤ) := by exact_mod_cast hrdvdL
    have hLpos : 0 < D.L := by
      exact constructionPeriod_pos D hbpos
    have hrep : ((Int.toNat (X.mfun h % D.L) : ℤ) : ZMod (Sibling.rfun h)) =
        ((X.mfun h % D.L : ℤ) : ZMod (Sibling.rfun h)) := by
      rw [Int.toNat_of_nonneg (Int.emod_nonneg _ (by exact_mod_cast hLpos.ne'))]
    have hcast : ((Int.toNat (X.mfun h % D.L) : ℤ) : ZMod (Sibling.rfun h)) =
        (X.mfun h : ZMod (Sibling.rfun h)) := by
      rw [hrep]
      have hm : (X.mfun h % D.L : ℤ) ≡ X.mfun h [ZMOD Sibling.rfun h] := by
        have hDL : (X.mfun h % D.L : ℤ) ≡ X.mfun h [ZMOD D.L] := by
          simp [Int.ModEq]
        exact Int.ModEq.of_dvd hrdvdLZ hDL
      exact (ZMod.intCast_eq_intCast_iff _ _ (Sibling.rfun h)).mpr hm
    have hcastNat : ((Int.toNat (X.mfun h % D.L) : ℕ) : ZMod (Sibling.rfun h)) =
        (X.mfun h : ZMod (Sibling.rfun h)) := by
      exact_mod_cast hcast
    exact hEq.trans hcastNat.symm
  · intro h hh
    simpa [Sibling] using hpt h hh

/-- Direct downstream multi-gadget reservoir from integer-labelled frequency
data. -/
def multiGadgetReservoir_of_integerLabelData
    {T : Finset ℕ} {b : ℕ}
    (D : ConstructionData T b)
    (W : ConstructionData.Weights D)
    (N : ℤ)
    (MA : MainArcFields D.E W.theta (D.L / b) D.L N)
    (Sblock Sextra : Finset ℕ)
    (C Bextra : ℝ)
    (X : ExtraIntegerFrequencyLabelData D W N MA Sblock Sextra)
    (Gset : ℕ → Finset ℕ)
    (hbpos : 0 < b)
    (hsqfree : Squarefree b)
    (hcover : CoversPrimeDivisors D.R b)
    (hcop : BlockSupportCoprimeWith D.BS b)
    (hSblock : D.S ⊆ blockSupport D.BS)
    (hSmem : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, Gset h ⊆ D.S)
    (hm_small : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra, ∀ s ∈ Gset h,
      2 * |X.mfun h| < (s : ℤ))
    (hcard :
      ((extraMinorPart MA.Sm Sblock Sextra).card : ℝ) * C ≤ Bextra)
    (hpt : ∀ h ∈ extraMinorPart MA.Sm Sblock Sextra,
      (Real.sqrt (1 - (8 / 9) /
        (((extraSiblingChoice_of_integerLabelData D W N MA Sblock Sextra X
          hbpos hsqfree hcover hcop).rfun h : ℝ) ^ 2))) ^ (Gset h).card ≤ C) :
    MultiGadgetReservoir D W N MA Sblock Sextra Bextra := by
  exact multiGadgetReservoir_of_prepared D W N MA Sblock Sextra Bextra
    (preparedReservoir_of_integerLabelData D W N MA Sblock Sextra C Bextra
      X Gset hbpos hsqfree hcover hcop hSblock hSmem hm_small hcard hpt)

end CircleMethod

end
