import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Algebra.Homology.Ext

namespace HautevilleHouse
namespace CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean

noncomputable section

universe u

structure ExtAlgebra (R : Type u) [CommRing R] (n : ℕ) where
  underlying : Type u
  add : underlying → underlying → underlying
  zero : underlying
  neg : underlying → underlying
  add_assoc : ∀ a b c : underlying, add (add a b) c = add a (add b c)
  add_comm : ∀ a b c : underlying, add a b = add b a
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

def yonedaProduct (R : Type u) [CommRing R] (A : Type u) [AddCommGroup A] (B : Type u) [AddCommGroup B] (C : Type u) [AddCommGroup C] (f : A →ₗ[R] B) (g : B →ₗ[R] C) : A →ₗ[R] C :=
  g ∘ₗ f

structure YonedaPairing (R : Type u) [CommRing R] where
  bilinear : Bool
  associative : Bool

def defaultYonedaPairing (R : Type u) [CommRing R] : YonedaPairing R :=
  { bilinear := true, associative := true }

theorem yoneda_product_bilinear (R : Type u) [CommRing R] (A B C : Type u) [AddCommGroup A] [AddCommGroup B] [AddCommGroup C] (f f' : A →ₗ[R] B) (g g' : B →ₗ[R] C) (a : A) :
    yonedaProduct R A B C (f + f') (g + g') a = yonedaProduct R A B C f g a + yonedaProduct R A B C f g' a + yonedaProduct R A B C f' g a + yonedaProduct R A B C f' g' a := by
  simp [yonedaProduct, add_comm, add_left_comm, add_assoc]

theorem yoneda_product_associative (R : Type u) [CommRing R] (A B C D : Type u) [AddCommGroup A] [AddCommGroup B] [AddCommGroup C] [AddCommGroup D] (f : A →ₗ[R] B) (g : B →ₗ[R] C) (h : C →ₗ[R] D) (a : A) :
    yonedaProduct R A C D (yonedaProduct R A B C f g) h a = yonedaProduct R A B D f (yonedaProduct R B C D g h) a := by
  simp [yonedaProduct]

end CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean
end HautevilleHouse