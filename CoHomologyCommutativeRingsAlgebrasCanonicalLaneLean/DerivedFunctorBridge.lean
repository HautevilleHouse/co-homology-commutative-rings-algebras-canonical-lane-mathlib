import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean

structure DerivedFunctorBridgeData where
  functorDomain : Type
  functorCodomain : Type
  derivedDegree : ℕ
  bridgeActive : Bool

default derivedFunctorBridgeData : DerivedFunctorBridgeData := {
  functorDomain := ℤ,
  functorCodomain := ℤ,
  derivedDegree := 0,
  bridgeActive := true
}

theorem derived_functor_bridge_active : derivedFunctorBridgeData.bridgeActive := by
  unfold derivedFunctorBridgeData
  rfl

end CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean
end HautevilleHouse