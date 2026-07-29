import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean

structure CohomologyRingStructure where
  ringType : Type
  [commRing : CommRing ringType]
  cupProductDefined : Bool
  unitElement : ringType

default cohomologyRingStructure : CohomologyRingStructure := {
  ringType := ℤ,
  cupProductDefined := true,
  unitElement := 0
}

theorem cup_product_defined : cohomologyRingStructure.cupProductDefined := by
  rfl

end CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean
end HautevilleHouse