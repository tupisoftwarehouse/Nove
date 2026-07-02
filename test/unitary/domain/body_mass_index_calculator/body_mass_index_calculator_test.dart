import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculator.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculation_candidate_value_object.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";

void main() {
  group("Test \"BodyMassIndexCalculator\" Class", () {
    test(
      "Test If Method \"getBodyMassIndex\" Returns Body Mass Index For Candidate",
      () {
        final underweightBodyMassIndexCalculationCandidate =
            BodyMassIndexCalculationCandidateValueObject(
              UNDERWEIGHT_HEIGHT_IN_CENTIMETERS,
              UNDERWEIGHT_WEIGHT_IN_KILOGRAMS,
            );
        final normalBodyMassIndexCalculationCandidate =
            BodyMassIndexCalculationCandidateValueObject(
              NORMAL_HEIGHT_IN_CENTIMETERS,
              NORMAL_WEIGHT_IN_KILOGRAMS,
            );
        final overweightBodyMassIndexCalculationCandidate =
            BodyMassIndexCalculationCandidateValueObject(
              OVERWEIGHT_HEIGHT_IN_CENTIMETERS,
              OVERWEIGHT_WEIGHT_IN_KILOGRAMS,
            );
        final obeseBodyMassIndexCalculationCandidate =
            BodyMassIndexCalculationCandidateValueObject(
              OBESE_HEIGHT_IN_CENTIMETERS,
              OBESE_WEIGHT_IN_KILOGRAMS,
            );
        final underweightBodyMassIndex =
            BodyMassIndexCalculator.getBodyMassIndex(
              underweightBodyMassIndexCalculationCandidate,
            );
        final normalBodyMassIndex = BodyMassIndexCalculator.getBodyMassIndex(
          normalBodyMassIndexCalculationCandidate,
        );
        final overweightBodyMassIndex =
            BodyMassIndexCalculator.getBodyMassIndex(
              overweightBodyMassIndexCalculationCandidate,
            );
        final obeseBodyMassIndex = BodyMassIndexCalculator.getBodyMassIndex(
          obeseBodyMassIndexCalculationCandidate,
        );

        expect(
          underweightBodyMassIndex.value,
          UNDERWEIGHT_BODY_MASS_INDEX_VALUE,
        );
        expect(
          underweightBodyMassIndex.category,
          BodyMassIndexCategory.UNDERWEIGHT,
        );

        expect(normalBodyMassIndex.value, NORMAL_WEIGHT_BODY_MASS_INDEX_VALUE);
        expect(
          normalBodyMassIndex.category,
          BodyMassIndexCategory.NORMAL_WEIGHT,
        );

        expect(overweightBodyMassIndex.value, OVERWEIGHT_BODY_MASS_INDEX_VALUE);
        expect(
          overweightBodyMassIndex.category,
          BodyMassIndexCategory.OVERWEIGHT,
        );

        expect(obeseBodyMassIndex.value, OBESE_BODY_MASS_INDEX_VALUE);
        expect(obeseBodyMassIndex.category, BodyMassIndexCategory.OBESE);
      },
    );
  });
}
