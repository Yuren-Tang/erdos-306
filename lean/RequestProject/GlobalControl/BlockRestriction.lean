import RequestProject.GlobalControl.GlobalAssignment
import RequestProject.LocalEnergy.BlockEnergy

/-!
# Restriction to prime blocks

A global residue assignment restricts to every dyadic prime block; the family
of restrictions is jointly injective and controls finite assignment counts.
-/

open Finset BigOperators Classical

noncomputable section

namespace GlobalControl

/-- Every modulus occurring in a prime block is nonzero. -/
instance instNeZeroPrimeBlock (BS : BlockSystem) (k : ℕ)
    (p : {p : ℕ // p ∈ BS.P k}) : NeZero p.1 :=
  ⟨(BS.hprime k p.1 p.2).ne_zero⟩

def restrict (BS : BlockSystem) (a : GlobalAssignment BS) (k : ℕ) :
    BlockAssignment (BS.P k) :=
  fun p => if h : (p : ℕ) ∈ blockSupport BS then a ⟨p, h⟩ else 0

/-- Distinct dyadic windows give disjoint prime blocks. -/
lemma blocks_disjoint (BS : BlockSystem) {k k' : ℕ} (hkk : k ≠ k') :
    Disjoint (BS.P k) (BS.P k') := by
  rw [ Finset.disjoint_left ];
  intro p hp hp'; cases lt_or_gt_of_ne hkk <;> have := BS.hwindow k p hp <;> have := BS.hwindow k' p hp' <;> simp_all +decide;
  · linarith [ pow_le_pow_right₀ ( by decide : 1 ≤ 2 ) ( by linarith : k + 1 ≤ k' ) ];
  · linarith [ pow_le_pow_right₀ ( by decide : 1 ≤ 2 ) ( by linarith : k ≥ k' + 1 ) ]

/-- A global assignment is determined by its restrictions to all blocks. -/
lemma restrict_injective (BS : BlockSystem) {a b : GlobalAssignment BS}
    (h : ∀ k ∈ Finset.Icc BS.k0 BS.K, restrict BS a k = restrict BS b k) :
    a = b := by
  -- By definition, we must show that `a p = b p` for every prime `p ∈ blockSupport BS`.
  apply funext
  intro p
  -- Since `p ∈ blockSupport BS`, by definition there is `k ∈ Finset.Icc BS.k0 BS.K` with `p ∈ BS.P k`.
  obtain ⟨k, hk⟩ : ∃ k ∈ Finset.Icc BS.k0 BS.K, p.1 ∈ BS.P k := by
    unfold blockSupport at p; aesop;
  have := congr_fun ( h k hk.1 ) ⟨ p, hk.2 ⟩ ; simp_all +decide [ restrict ] ;

/-- The number of global assignments whose restrictions satisfy `Φ k` is at
most the product of the corresponding per-block counts. -/
lemma restrict_filter_card_le (BS : BlockSystem)
    (Φ : ∀ k, BlockAssignment (BS.P k) → Prop) :
    (Finset.univ.filter
        (fun a : GlobalAssignment BS =>
          ∀ k ∈ Finset.Icc BS.k0 BS.K, Φ k (restrict BS a k))).card
      ≤ ∏ k ∈ Finset.Icc BS.k0 BS.K,
          (Finset.univ.filter (fun b : BlockAssignment (BS.P k) => Φ k b)).card := by
  refine' le_trans _ ( Finset.prod_le_prod' fun k hk => Finset.card_le_card _ );
  rotate_right;
  exact fun k => Finset.image ( fun a => restrict BS a k ) ( Finset.univ.filter fun a => ∀ k ∈ Finset.Icc BS.k0 BS.K, Φ k ( restrict BS a k ) );
  · have h_inj : ∀ a b : GlobalAssignment BS, (∀ k ∈ Finset.Icc BS.k0 BS.K, restrict BS a k = restrict BS b k) → a = b := by
      exact fun a b h => restrict_injective BS h
    have h_card_le : (Finset.univ.filter fun a : GlobalAssignment BS => ∀ k ∈ Finset.Icc BS.k0 BS.K, Φ k (restrict BS a k)).card ≤ (Finset.pi (Finset.Icc BS.k0 BS.K) (fun k => (Finset.univ.filter fun a : GlobalAssignment BS => ∀ k ∈ Finset.Icc BS.k0 BS.K, Φ k (restrict BS a k)).image (fun a => restrict BS a k))).card := by
      refine' le_trans _ ( Finset.card_le_card _ );
      rotate_left;
      exact Finset.image ( fun a => fun k hk => restrict BS a k ) ( Finset.univ.filter fun a : GlobalAssignment BS => ∀ k ∈ Finset.Icc BS.k0 BS.K, Φ k ( restrict BS a k ) );
      · grind +splitImp;
      · rw [ Finset.card_image_of_injOn ];
        exact fun a ha b hb hab => h_inj a b fun k hk => by simpa using congr_fun ( congr_fun hab k ) hk;
    rw [Finset.card_pi] at h_card_le
    exact h_card_le
  · grind

end GlobalControl

end
