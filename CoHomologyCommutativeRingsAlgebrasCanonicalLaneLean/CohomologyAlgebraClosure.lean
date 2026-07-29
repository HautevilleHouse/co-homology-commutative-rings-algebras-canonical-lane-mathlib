import canonicalLaneMathlib.AdmissibleClass
import CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean.CohomologyAlgebraCertificate

namespace HautevilleHouse
namespace CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean

noncomputable section

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_theorem_closure (A : AdmissibleClass) :
    ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

def CohomologyAlgebraAdmittedClosure (A : AdmissibleClass) : Prop :=
  ConstrainedTheoremClosure A ∧ CohomologyAlgebraAdmittedCertificateClosed

theorem cohomology_algebra_admitted_closure_checked (A : AdmissibleClass) :
    CohomologyAlgebraAdmittedClosure A := by
  exact ⟨constrained_theorem_closure A, cohomology_algebra_admitted_certificate_checked⟩

theorem cohomology_algebra_unrestricted_classical_boundary_carried :
    cohomologyAlgebraCertificate.productGradedCommutative = true := by
  rfl

end CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean
end HautevilleHouse