import RequestProject.Spectral.BernoulliSum
import RequestProject.Core.EgyptianRepresentation
import RequestProject.Spectral.Selection
import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar

/-!
# Spectral selection for reciprocal subset sums

This file specializes the finite spectral-gap existence principle
`exists_eq_of_spectral_gap` to Bernoulli subset sums of divisors of a common
period.

The specialization uses:
* index set `J = {e // e ∈ E}` (the semiprime edges) with `A j = Bool` (each edge
  chosen or not);
* the additive group `X = ℤ` with an integer target `t = q` and
  `S a = ∑_{e chosen} L/e` (no wraparound thanks to `∑_E L/e < L`);
* frequency set `Ω = Fin L` and the additive characters `cyclicCharacter`;
* local spectral factors `bernoulliSpectralFactor`, so that `bernoulliFourierTerm = fourierTerm`.
-/

open Complex Finset BigOperators Real

noncomputable section

namespace CircleMethod

/-- The additive character `n ↦ exp(2πi·ω·n/L)` on `ℤ`, indexed by `ω : Fin L`. -/
def cyclicCharacter (L : ℕ) (ω : Fin L) (n : ℤ) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * (ω : ℂ) * (n : ℂ) / (L : ℂ))

/-- The explicit cyclic character is Mathlib's standard additive character on
`ZMod L`, evaluated at the product of the frequency and the integer argument. -/
lemma cyclicCharacter_eq_stdAddChar (L : ℕ) [NeZero L] (ω : Fin L) (n : ℤ) :
    cyclicCharacter L ω n =
      ZMod.stdAddChar (((((ω : ℕ) : ℤ) * n : ℤ) : ZMod L)) := by
  rw [cyclicCharacter, ZMod.stdAddChar_coe]
  congr 1
  push_cast
  ring

/-- The local spectral factor of edge `j` at frequency `ω`:
`(1-θ_e) + θ_e·exp(2πi·ω·(L/e)/L)`, written as the Bernoulli expectation
`∑_{a∈Bool} p(a)·char(x(a))`. -/
def bernoulliSpectralFactor (E : Finset ℕ) (theta : ℕ → ℝ) (L : ℕ)
    (j : {e // e ∈ E}) (ω : Fin L) : ℂ :=
  ∑ a : Bool, ((if a then theta j.1 else 1 - theta j.1 : ℝ) : ℂ)
      * cyclicCharacter L ω (if a then ((L / j.1 : ℕ) : ℤ) else 0)

/-- The spectral term at frequency `ω`: the product of the local factors times
the conjugate target phase.  Equal to `fourierTerm` (`bernoulliFourierTerm_eq_fourierTerm`). -/
def bernoulliFourierTerm (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ) (ω : Fin L) : ℂ :=
  (∏ j : {e // e ∈ E}, bernoulliSpectralFactor E theta L j ω)
    * (starRingEnd ℂ) (cyclicCharacter L ω (q : ℤ))

/-- `cyclicCharacter` has unit norm. -/
lemma norm_cyclicCharacter (L : ℕ) (ω : Fin L) (n : ℤ) : ‖cyclicCharacter L ω n‖ = 1 := by
  unfold cyclicCharacter; norm_num [ Complex.norm_exp ]

/-- Multiplying an additive character by the conjugate character at the target
evaluates the same character on the difference. -/
lemma cyclicCharacter_mul_star (L : ℕ) (ω : Fin L) (m q : ℤ) :
    cyclicCharacter L ω m * (starRingEnd ℂ) (cyclicCharacter L ω q) =
      cyclicCharacter L ω (m - q) := by
  unfold cyclicCharacter
  rw [← Complex.exp_conj, ← Complex.exp_add]
  congr 1
  apply Complex.ext
  · norm_num [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im]
  · norm_num [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im]
    ring

/-- The local factor equals the Bernoulli factor used in `fourierTerm`. -/
lemma bernoulliSpectralFactor_eq (E : Finset ℕ) (theta : ℕ → ℝ) (L : ℕ)
    (j : {e // e ∈ E}) (ω : Fin L) :
    bernoulliSpectralFactor E theta L j ω
      = (theta j.1 : ℂ)
          * Complex.exp (2 * Real.pi * Complex.I * (ω : ℂ) * ((L / j.1 : ℕ) : ℂ) / (L : ℂ))
        + (1 - theta j.1) := by
  unfold bernoulliSpectralFactor; simp +decide;
  unfold cyclicCharacter; norm_num;
  norm_cast ; aesop

/-- The norm of the local factor is `≤ 1` when `0 ≤ θ ≤ 1`. -/
lemma norm_bernoulliSpectralFactor_le_one (E : Finset ℕ) (theta : ℕ → ℝ) (L : ℕ)
    (j : {e // e ∈ E}) (ω : Fin L)
    (h0 : 0 ≤ theta j.1) (h1 : theta j.1 ≤ 1) :
    ‖bernoulliSpectralFactor E theta L j ω‖ ≤ 1 := by
  rw [ bernoulliSpectralFactor_eq ];
  convert norm_add_le ( ( theta j : ℂ ) * Complex.exp ( 2 * Real.pi * Complex.I * ( ω : ℂ ) * ( L / j : ℕ ) / L ) ) ( 1 - ( theta j : ℂ ) ) using 2 ; norm_num [ Complex.norm_exp ];
  norm_cast ; rw [ abs_of_nonneg h0 ] ; rw [ Real.norm_of_nonneg ] <;> linarith

/-- **Key correspondence.**  The Bernoulli spectral term equals the circle method's
`fourierTerm` at the underlying natural-number frequency. -/
lemma bernoulliFourierTerm_eq_fourierTerm (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ) (ω : Fin L) :
    bernoulliFourierTerm E theta q L ω = fourierTerm E theta q L (ω : ℕ) := by
  unfold bernoulliFourierTerm fourierTerm;
  congr! 1;
  · refine' Finset.prod_bij ( fun j _ => j.val ) _ _ _ _ <;> simp +decide [ bernoulliSpectralFactor_eq ]
  · unfold cyclicCharacter
    rw [← Complex.exp_conj]
    congr 1
    apply Complex.ext
    · norm_num [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im]
    · norm_num [Complex.mul_re, Complex.mul_im, Complex.div_re, Complex.div_im]
      ring

/-- **Character orthogonality on `Fin L`.**  Recast of `fourier_orthogonality`
over the finite type `Fin L`. -/
lemma charsum_orth (L : ℕ) (hL : 0 < L) (n : ℤ) :
    (∑ ω : Fin L, cyclicCharacter L ω n)
      = if (L : ℤ) ∣ n then (L : ℂ) else 0 := by
  letI : NeZero L := ⟨hL.ne'⟩
  let ψ := (ZMod.stdAddChar (N := L)).mulShift (n : ZMod L)
  have hsum : ∑ x : ZMod L, ψ x = if ψ = 0 then (L : ℂ) else 0 := by
    simpa [ZMod.card] using AddChar.sum_eq_ite ψ
  have hψ : ψ = 0 ↔ (n : ZMod L) = 0 := by
    constructor
    · intro h
      by_contra hn
      exact (ZMod.isPrimitive_stdAddChar L hn) (h.trans AddChar.one_eq_zero.symm)
    · intro h
      calc
        ψ = 1 := by simp [ψ, h]
        _ = 0 := AddChar.one_eq_zero
  have hfin : ∀ ω : Fin L, ZMod.finEquiv L ω = (ω : ZMod L) := by
    intro ω
    cases L with
    | zero => exact Fin.elim0 ω
    | succ L =>
        change (ω : ZMod (L + 1)) = (ω.val : ZMod (L + 1))
        exact (ZMod.natCast_zmod_val (show ZMod (L + 1) from ω)).symm
  rw [← (ZMod.finEquiv L).sum_comp] at hsum
  simpa [ψ, cyclicCharacter_eq_stdAddChar, AddChar.mulShift_apply, mul_comm, hψ, hfin,
    ZMod.intCast_zmod_eq_zero_iff_dvd] using hsum

/-- For a finite count `m` and a positive slack `d`, some nonnegative exponential
decay makes `m·exp(-K)` fit within `d`. -/
private lemma exists_K_tail (m : ℕ) (d : ℝ) (hd : 0 < d) :
    ∃ K : ℝ, 0 ≤ K ∧ (m : ℝ) * Real.exp (-K) ≤ d := by
  refine ⟨ Real.log ( m / d + 1 ), Real.log_nonneg (by linarith [div_nonneg (Nat.cast_nonneg m) hd.le]), ?_ ⟩
  rw [ Real.exp_neg, Real.exp_log ( by positivity ) ]
  rw [ mul_inv_le_iff₀ ( by positivity ) ]
  nlinarith [ Real.log_le_sub_one_of_pos ( by positivity : 0 < ( m : ℝ ) / d + 1 ), mul_div_cancel₀ ( m : ℝ ) hd.ne' ]

/-
**Additive characters turn sums into products** (over any `Fintype` index).
-/
lemma cyclicCharacter_sum_eq_prod (L : ℕ) (ω : Fin L) {ι : Type*} [Fintype ι] (g : ι → ℤ) :
    cyclicCharacter L ω (∑ i, g i) = ∏ i, cyclicCharacter L ω (g i) := by
  unfold cyclicCharacter; simp +decide [← Complex.exp_sum]; ring_nf
  simp +decide [mul_assoc, mul_comm, mul_left_comm, Finset.mul_sum _ _ _]

/-
Reindexing a sum over `s.attachFin` back to a sum over `s` (the summand only
depends on the underlying natural number).
-/
private lemma sum_attachFin {β : Type*} [AddCommMonoid β] (L : ℕ) (SS : Finset ℕ)
    (h : ∀ m ∈ SS, m < L) (g : ℕ → β) :
    ∑ ω ∈ SS.attachFin h, g (ω : ℕ) = ∑ m ∈ SS, g m := by
  refine' Finset.sum_bij ( fun ω _ => ω ) _ _ _ _ <;> simp +decide [ Finset.mem_attachFin ];
  · exact fun a₁ ha₁ a₂ ha₂ h => Fin.ext h;
  · exact fun m hm => ⟨ ⟨ m, h m hm ⟩, hm, rfl ⟩

/-- `bernoulliFourierTerm` summed over `SS.attachFin` equals `fourierTerm` summed over `SS`. -/
private lemma bernoulliFourierTerm_attachFin_sum (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ)
    (SS : Finset ℕ) (h : ∀ m ∈ SS, m < L) :
    ∑ ω ∈ SS.attachFin h, bernoulliFourierTerm E theta q L ω
      = ∑ m ∈ SS, fourierTerm E theta q L m := by
  rw [Finset.sum_congr rfl (fun ω _ => bernoulliFourierTerm_eq_fourierTerm E theta q L ω)]
  exact sum_attachFin L SS h (fun m => fourierTerm E theta q L m)

/-
**Pointwise tail bound.**  With `Δ ω j = -log‖bernoulliSpectralFactor‖` (and a nonnegative
fallback `Ktail` at the zeros), `exp(-∑_j Δ ω j)` is bounded by the norm of the
spectral term plus `exp(-Ktail)`.
-/
private lemma bernoulliSpectralTail_pointwise (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ)
    (hthlb : ∀ e ∈ E, 0 ≤ theta e) (hthub : ∀ e ∈ E, theta e ≤ 1)
    (Ktail : ℝ) (hK0 : 0 ≤ Ktail) (ω : Fin L) :
    Real.exp (-(∑ j : {e // e ∈ E},
        (if ‖bernoulliSpectralFactor E theta L j ω‖ = 0 then Ktail
         else - Real.log ‖bernoulliSpectralFactor E theta L j ω‖)))
      ≤ ‖fourierTerm E theta q L (ω : ℕ)‖ + Real.exp (-Ktail) := by
  by_cases h : ∃ j : { e // e ∈ E }, ‖bernoulliSpectralFactor E theta L j ω‖ = 0;
  · obtain ⟨ j, hj ⟩ := h; simp_all +decide;
    refine' le_trans _ ( le_add_of_nonneg_left <| norm_nonneg _ );
    rw [ Finset.sum_eq_add_sum_sdiff_singleton_of_mem ( Finset.mem_attach _ j ) ];
    simp [hj];
    exact le_trans ( by aesop ) ( Finset.single_le_sum ( fun x _ => by split_ifs <;> first | positivity | exact neg_nonneg_of_nonpos <| Real.log_nonpos ( norm_nonneg _ ) <| by exact le_trans ( norm_bernoulliSpectralFactor_le_one E theta L x ω ( hthlb _ <| x.2 ) ( hthub _ <| x.2 ) ) <| by norm_num ) <| Finset.mem_attach _ j );
  · simp_all +decide;
    rw [ Real.exp_sum, Finset.prod_congr rfl fun x hx => Real.exp_log ( norm_pos_iff.mpr ( h _ x.2 ) ) ];
    rw [ show fourierTerm E theta q L ω = bernoulliFourierTerm E theta q L ω by rw [ bernoulliFourierTerm_eq_fourierTerm ] ];
    unfold bernoulliFourierTerm;
    norm_num [ norm_mul, norm_cyclicCharacter ];
    positivity

/-
**Decode.**  A hitting configuration `a` decodes to a subset of `E` with the
exact reciprocal identity.
-/
lemma decode_subset_sum (E : Finset ℕ) (q L : ℕ) (hL : 0 < L)
    (heL : ∀ e ∈ E, e ∣ L)
    (a : {e // e ∈ E} → Bool)
    (ha : (∑ j : {e // e ∈ E}, (if a j then ((L / j.1 : ℕ) : ℤ) else 0))
            = (q : ℤ)) :
    (∑ e ∈ (Finset.univ.filter (fun j : {e // e ∈ E} => a j)).image Subtype.val,
        (1 : ℚ) / (e : ℚ)) = (q : ℚ) / (L : ℚ) := by
  rw [ Finset.sum_image ];
  · convert congr_arg ( fun x : ℤ => (x : ℚ) / (L : ℚ) ) ha using 1;
    · push_cast [ Finset.sum_filter ];
      rw [ Finset.sum_div _ _ _ ] ; congr ; ext ; split_ifs <;> simp +decide [ * ];
      rw [ eq_div_iff ( by positivity ) ] ; ring;
    · norm_num
  · exact fun x hx y hy hxy => Subtype.ext hxy

set_option maxHeartbeats 2000000 in
/-- **Spectral selection for reciprocal subset sums.**  From the finite-Fourier
data of a circle-method construction — the no-wraparound hypotheses,
a frequency partition `range L = SM ∪ Sm`, a low-frequency real-part lower bound
`M`, and a (summed-norm) high-frequency tail bound `Bm < M` — the abstract
`exists_eq_of_spectral_gap` principle yields a subset `S ⊆ E` whose reciprocal
sum is `q/L`. -/
theorem exists_subset_sum_eq_of_fourier_gap
    (E : Finset ℕ) (theta : ℕ → ℝ) (q L : ℕ) (SM Sm : Finset ℕ) (Bm M : ℝ)
    (hq : q < L) (hL : 0 < L) (heL : ∀ e ∈ E, e ∣ L)
    (hbound : (∑ e ∈ E, (L / e : ℕ)) < L)
    (hthlb : ∀ e ∈ E, 0 ≤ theta e) (hthub : ∀ e ∈ E, theta e ≤ 1)
    (hpart : Finset.range L = SM ∪ Sm) (hdisj : Disjoint SM Sm)
    (hmain : M ≤ (∑ h ∈ SM, fourierTerm E theta q L h).re)
    (hminorSum : (∑ h ∈ Sm, ‖fourierTerm E theta q L h‖) ≤ Bm)
    (hbeat : Bm < M) :
    ∃ S ⊆ E, (∑ e ∈ S, (1 : ℚ) / (e : ℚ)) = (q : ℚ) / (L : ℚ) := by
  classical
  have hSML : ∀ m ∈ SM, m < L := by
    intro m hm; exact Finset.mem_range.mp (hpart ▸ Finset.mem_union_left _ hm)
  have hSmL : ∀ m ∈ Sm, m < L := by
    intro m hm; exact Finset.mem_range.mp (hpart ▸ Finset.mem_union_right _ hm)
  obtain ⟨Ktail, hK0, hKtail⟩ := exists_K_tail Sm.card ((M - Bm) / 2) (by linarith)
  obtain ⟨a, ha⟩ := exists_eq_of_spectral_gap
      (J := {e // e ∈ E}) (Ω := Fin L) (X := ℤ) (A := fun _ => Bool)
      (p := fun j a => if a then theta j.1 else 1 - theta j.1)
      (t := (q : ℤ))
      (S := fun a => ∑ j : {e // e ∈ E}, (if a j then ((L / j.1 : ℕ) : ℤ) else 0))
      (N := (L : ℝ)) (hN := by exact_mod_cast hL)
      (k := fun ω n => cyclicCharacter L ω n)
      (hspec := by
        intro a;
        have h_no_wraparound : |(∑ j : {e // e ∈ E}, (if a j then ((L / j.1 : ℕ) : ℤ) else 0)) - (q : ℤ)| < L := by
          refine' abs_sub_lt_iff.mpr ⟨ _, _ ⟩;
          · refine' lt_of_le_of_lt ( sub_le_self _ <| Nat.cast_nonneg _ ) _;
            refine' lt_of_le_of_lt _ ( Nat.cast_lt.mpr hbound );
            norm_num [ Finset.sum_ite ];
            refine' le_trans ( Finset.sum_le_sum_of_subset_of_nonneg _ _ ) _;
            exact Finset.attach E;
            · exact Finset.filter_subset _ _;
            · exact fun _ _ _ => Nat.cast_nonneg _;
            · refine' le_of_eq _;
              refine' Finset.sum_bij ( fun x hx => x.val ) _ _ _ _ <;> aesop;
          · refine' lt_of_le_of_lt ( sub_le_self _ <| Finset.sum_nonneg fun _ _ => by positivity ) _;
            exact_mod_cast hq;
        have h_charsum :
            (∑ ω : Fin L, cyclicCharacter L ω
              ((∑ j : {e // e ∈ E}, if a j then ((L / j.1 : ℕ) : ℤ) else 0) - (q : ℤ)))
              = if (L : ℤ) ∣ ((∑ j : {e // e ∈ E},
                if a j then ((L / j.1 : ℕ) : ℤ) else 0) - (q : ℤ)) then (L : ℂ) else 0 := by
          exact charsum_orth L hL _
        convert congr_arg ( fun x : ℂ => ( 1 / L : ℂ ) * x ) h_charsum.symm using 1;
        · split_ifs <;> norm_num [ hL.ne' ];
          · aesop;
          · exact ‹¬_› ( by obtain ⟨ k, hk ⟩ := ‹_›; nlinarith [ show k = 0 by nlinarith [ abs_lt.mp h_no_wraparound ] ] );
        · congr 1
          exact Finset.sum_congr rfl (fun ω _ => cyclicCharacter_mul_star L ω
              (∑ j : {e // e ∈ E}, if a j then ((L / j.1 : ℕ) : ℤ) else 0)
              (q : ℤ)))
      (x := fun j a => if a then ((L / j.1 : ℕ) : ℤ) else 0)
      (b := fun j ω => bernoulliSpectralFactor E theta L j ω)
      (hb_def := by intro j ω; rfl)
      (hfact := fun a ω =>
        cyclicCharacter_sum_eq_prod L ω (fun j => if a j then ((L / j.1 : ℕ) : ℤ) else 0))
      (F := fun ω => bernoulliFourierTerm E theta q L ω)
      (hF_def := by intro ω; rfl)
      (L := SM.attachFin hSML) (H := Sm.attachFin hSmL)
      (hdisj := by
        rw [Finset.disjoint_left]
        intro ω hω hω'
        exact Finset.disjoint_left.mp hdisj
          ((Finset.mem_attachFin hSML).mp hω) ((Finset.mem_attachFin hSmL).mp hω'))
      (hcover := by
        ext ω
        simp only [Finset.mem_union, Finset.mem_attachFin, Finset.mem_univ, iff_true]
        have hmem : (ω : ℕ) ∈ Finset.range L := Finset.mem_range.mpr ω.is_lt
        rw [hpart] at hmem
        exact Finset.mem_union.mp hmem)
      (M := M) (R := Bm + (M - Bm) / 2)
      (hM := by
        show M ≤ (∑ ω ∈ SM.attachFin hSML, bernoulliFourierTerm E theta q L ω).re
        rw [bernoulliFourierTerm_attachFin_sum E theta q L SM hSML]; exact hmain)
      (Δ := fun ω j => if ‖bernoulliSpectralFactor E theta L j ω‖ = 0 then Ktail
                       else - Real.log ‖bernoulliSpectralFactor E theta L j ω‖)
      (C := fun _ => 1)
      (hb := by
        intro ω _ j
        show ‖bernoulliSpectralFactor E theta L j ω‖ ≤ Real.exp (-(if ‖bernoulliSpectralFactor E theta L j ω‖ = 0
          then Ktail else -Real.log ‖bernoulliSpectralFactor E theta L j ω‖))
        rcases eq_or_ne ‖bernoulliSpectralFactor E theta L j ω‖ 0 with hz | hz
        · rw [if_pos hz, hz]; exact (Real.exp_pos _).le
        · apply le_of_eq
          rw [if_neg hz, neg_neg,
            Real.exp_log (lt_of_le_of_ne (norm_nonneg _) (Ne.symm hz))])
      (hk := fun ω _ => le_of_eq (norm_cyclicCharacter L ω _))
      (hR := by
        have hre : (∑ ω ∈ Sm.attachFin hSmL, ‖fourierTerm E theta q L (ω : ℕ)‖)
            = ∑ m ∈ Sm, ‖fourierTerm E theta q L m‖ :=
          sum_attachFin L Sm hSmL (fun m => ‖fourierTerm E theta q L m‖)
        have hstep : (∑ ω ∈ Sm.attachFin hSmL,
              (‖fourierTerm E theta q L (ω : ℕ)‖ + Real.exp (-Ktail)))
            ≤ Bm + (M - Bm) / 2 := by
          rw [Finset.sum_add_distrib, Finset.sum_const, Finset.card_attachFin, nsmul_eq_mul, hre]
          linarith [hminorSum, hKtail]
        refine le_trans (Finset.sum_le_sum (fun ω _ => ?_)) hstep
        show (1 : ℝ) * Real.exp (-(∑ j : {e // e ∈ E},
            if ‖bernoulliSpectralFactor E theta L j ω‖ = 0 then Ktail
            else -Real.log ‖bernoulliSpectralFactor E theta L j ω‖)) ≤ _
        rw [one_mul]
        exact bernoulliSpectralTail_pointwise E theta q L hthlb hthub Ktail hK0 ω)
      (hMR := by linarith)
  -- Decode `∃ a, S a = t` into the subset and the reciprocal identity.
  refine ⟨(Finset.univ.filter (fun j : {e // e ∈ E} => a j)).image Subtype.val, ?_, ?_⟩
  · intro e he
    rw [Finset.mem_image] at he
    obtain ⟨j, _, rfl⟩ := he
    exact j.2
  · exact decode_subset_sum E q L hL heL a ha

/-- **Representation from a hitting subset.**  Bundles a subset `S ⊆ E` with the
reciprocal identity into an Egyptian semiprime representation avoiding `T`. -/
theorem repr_of_subset (T E : Finset ℕ) (b : ℕ)
    (hsemi : ∀ e ∈ E, IsSemiprime e) (hdisj : ∀ e ∈ E, e ∉ T)
    (S : Finset ℕ) (hSE : S ⊆ E)
    (hSsum : (∑ e ∈ S, (1 : ℚ) / (e : ℚ)) = (1 : ℚ) / (b : ℚ)) :
    HasEgyptianSemiprimeReprAvoiding T ((1 : ℚ) / (b : ℚ)) := by
  refine ⟨S, fun n hn => hsemi n (hSE hn), ?_, hSsum⟩
  rw [Finset.disjoint_left]
  exact fun a haS haT => hdisj a (hSE haS) haT

end CircleMethod

end
