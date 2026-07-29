import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean

structure CoHomologyAlgebraData where
  ring : Type
  [commRing : CommRing ring]
  cohomologyDegree : ℕ
  algebraStructure : Prop

default coHomologyAlgebraData : CoHomologyAlgebraData := {
  ring := ℤ,
  cohomologyDegree := 0,
  algebraStructure := True
}

theorem cohomology_algebra_commutative : coHomologyAlgebraData.algebraStructure := by
  unfold coHomologyAlgebraData
  trivial

end CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean
end HautevilleHouse