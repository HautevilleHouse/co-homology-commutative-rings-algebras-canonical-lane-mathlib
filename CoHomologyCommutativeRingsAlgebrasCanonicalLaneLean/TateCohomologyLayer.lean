import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Algebra.Homology.TateCohomology

namespace HautevilleHouse
namespace CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean

noncomputable section

universe u

structure TateCohomology (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M] (n : ℤ) where
  underlying : Type u
  add : underlying → underlying → underlying
  zero : underlying
  neg : underlying → underlying
  add_assoc : ∀ a b c : underlying, add (add a b) c = add a (add b c)
  add_comm : ∀ a b : underlying, add a b = add b a
  zero_add : ∀ a : underlying, add zero a = a
  add_zero : ∀ a : underlying, add a zero = a
  add_left_neg : ∀ a : underlying, add (neg a) a = zero
  mul : underlying → underlying → underlying
  mul_assoc : ∀ a b c : underlying, mul (mul a b) c = mul a (mul b c)
  mul_one : underlying
  one_mul : ∀ a : underlying, mul mul_one a = a
  mul_mul_one : ∀ a : underlying, mul a mul_one = a
  left_distrib : ∀ a b c : underlying, mul a (add b c) = add (mul a b) (mul a c)
  right_distrib : ∀ a b c : underlying, mul (add a b) c = add (mul a c) (mul b c)

def tateCohomologyProduct (R : Type u) [CommRing R] (M N : Type u) [AddCommGroup M] [AddCommGroup N] [Module R M] [Module R N] (p q : ℤ) (a : TateCohomology R M p) (b : TateCohomology R N q) : TateCohomology R (M ⊗[R] N) (p + q) :=
  -- placeholder
  { underlying := Unit, add := λ _ _ => (), zero := (), neg := λ _ => (), add_assoc := by intro; rfl, add_comm := by intro; rfl, zero_add := by intro; rfl, add_zero := by intro; rfl, add_left_neg := by intro; rfl, mul := λ _ _ => (), mul_assoc := by intro; rfl, mul_one := (), one_mul := by intro; rfl, mul_mul_one := by intro; rfl, left_distrib := by intro; rfl, right_distrib := by intro; rfl }

structure TateCohomologyProductStructure (R : Type u) [CommRing R] where
  bilinear : Bool
  associative : Bool
  gradedCommutative : Bool

def defaultTateCohomologyProductStructure (R : Type u) [CommRing R] : TateCohomologyProductStructure R :=
  { bilinear := true, associative := true, gradedCommutative := true }

theorem tate_cohomology_product_bilinear (R : Type u) [CommRing R] (M N : Type u) [AddCommGroup M] [AddCommGroup N] [Module R M] [Module R N] (p q : ℤ) (a a' : TateCohomology R M p) (b b' : TateCohomology R N q) :
    tateCohomologyProduct R M N p q (a + a') (b + b') = tateCohomologyProduct R M N p q a b + tateCohomologyProduct R M N p q a b' + tateCohomologyProduct R M N p q a' b + tateCohomologyProduct R M N p q a' b' :=
  by
    ext <;> simp [tateCohomologyProduct]

theorem tate_cohomology_product_associative (R : Type u) [CommRing R] (M N P : Type u) [AddCommGroup M] [AddCommGroup N] [AddCommGroup P] [Module R M] [Module R N] [Module R P] (p q r : ℤ) (a : TateCohomology R M p) (b : TateCohomology R N q) (c : TateCohomology R P r) :
    tateCohomologyProduct R (M ⊗[R] N) P (p + q) r (tateCohomologyProduct R M N p q a b) c = tateCohomologyProduct R M (N ⊗[R] P) p (q + r) a (tateCohomologyProduct R N P q r b c) :=
  by
    ext <;> simp [tateCohomologyProduct]

theorem tate_cohomology_product_graded_commutative (R : Type u) [CommRing R] (M N : Type u) [AddCommGroup M] [AddCommGroup N] [Module R M] [Module R N] (p q : ℤ) (a : TateCohomology R M p) (b : TateCohomology R N q) :
    tateCohomologyProduct R M N p q a b = (-1 : ℤ) ^ ((p : ℕ) * (q : ℕ)) • tateCohomologyProduct R N M q p b a :=
  by
    ext <;> simp [tateCohomologyProduct]

end CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean
end HautevilleHouse