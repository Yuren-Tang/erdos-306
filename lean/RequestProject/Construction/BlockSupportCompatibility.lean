import RequestProject.GlobalControl.BlockSystem
import Mathlib.Data.Nat.Prime.Basic

open Finset GlobalControl

namespace CircleMethod

/-!
# Compatibility of denominator primes and block support
-/

/-- `R` contains every prime divisor of `b`. -/
def CoversPrimeDivisors (R : Finset ℕ) (b : ℕ) : Prop :=
  ∀ r, Nat.Prime r → r ∣ b → r ∈ R

/-- Every block-support prime is coprime to the denominator `b`. -/
def BlockSupportCoprimeWith (BS : BlockSystem) (b : ℕ) : Prop :=
  ∀ s ∈ blockSupport BS, Nat.Coprime s b

end CircleMethod
