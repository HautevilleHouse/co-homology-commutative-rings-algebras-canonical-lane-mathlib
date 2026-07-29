import CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean.CohomologyCertificate

noncomputable section

namespace HautevilleHouse
namespace CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean

def CohomologyAdmittedClosure (R : Type u) [CommRing R] (A : Type u) [CommRing A] [Algebra R A] (Aclass : AdmissibleClass) : Prop :=
  ConstrainedTheoremClosure Aclass ∧ CohomologyAdmittedCertificateClosed R A

theorem cohomology_admitted_closure_checked (R : Type u) [CommRing R] (A : Type u) [CommRing A] [Algebra R A] (Aclass : AdmissibleClass) :
    CohomologyAdmittedClosure R A Aclass := by
  exact ⟨constrained_theorem_closure Aclass, cohomology_admitted_certificate_checked R A⟩

theorem cohomology_unrestricted_classical_boundary_carried (R : Type u) [CommRing R] (A : Type u) [CommRing A] [Algebra R A] :
    (cohomologyCertificate R A).unrestrictedClassicalCohomologyClosure = false := by
  rfl

end CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean
end HautevilleHouse