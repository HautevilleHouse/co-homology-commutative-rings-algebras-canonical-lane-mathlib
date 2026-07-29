import CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean.CohomologyAlgebraLayer

noncomputable section

universe u

namespace HautevilleHouse
namespace CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean

structure CohomologyProjectionState (R : Type u) [CommRing R] (A : Type u) [CommRing A] [Algebra R A] where
  algebraObject : String
  cohomologyProfile : CohomologyAlgebra R A
  projectiveResolutionRecorded : Bool
  spectralSequenceConvergence : Bool
  carriedClassicalBoundary : Bool

def cohomologyProjection (R : Type u) [CommRing R] (A : Type u) [CommRing A] [Algebra R A]
    (S : CohomologyProjectionState R A) : CohomologyProjectionState R A :=
  { S with
    projectiveResolutionRecorded := true
    spectralSequenceConvergence := true
    carriedClassicalBoundary := true }

theorem cohomology_projection_idempotent (R : Type u) [CommRing R] (A : Type u) [CommRing A] [Algebra R A]
    (S : CohomologyProjectionState R A) :
    cohomologyProjection R A (cohomologyProjection R A S) = cohomologyProjection R A S := by
  cases S; rfl

def cohomologyProjectedClosureState (R : Type u) [CommRing R] (A : Type u) [CommRing A] [Algebra R A]
    (H : CohomologyAlgebra R A) : CohomologyProjectionState R A :=
  cohomologyProjection R A {
    algebraObject := "cohomology_algebra",
    cohomologyProfile := H,
    projectiveResolutionRecorded := false,
    spectralSequenceConvergence := false,
    carriedClassicalBoundary := false
  }

theorem cohomology_projected_closure_state_checked (R : Type u) [CommRing R] (A : Type u) [CommRing A] [Algebra R A]
    (H : CohomologyAlgebra R A) :
    (cohomologyProjectedClosureState R A H).projectiveResolutionRecorded = true ∧
    (cohomologyProjectedClosureState R A H).spectralSequenceConvergence = true ∧
    (cohomologyProjectedClosureState R A H).carriedClassicalBoundary = true := by
  exact ⟨rfl, rfl, rfl⟩

end CoHomologyCommutativeRingsAlgebrasCanonicalLaneLean
end HautevilleHouse