import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/domain/body_mass_index_calculator/internals/checker/body_mass_index_calculator_checker.dart";

void main() {
  group("Test \"BodyMassIndexCalculatorChecker\" Module", () {
    test(
      "Test If Function \"isBodyMassIndexUnderweight\" Returns True If Body Mass Index Is Underweight",
      () {
        final bodyMassIndexIsUnderweight = isBodyMassIndexUnderweight(
          UNDERWEIGHT_BODY_MASS_INDEX_THRESHOLD - 1,
        );
        final bodyMassIndexIsNotUnderweight = isBodyMassIndexUnderweight(
          UNDERWEIGHT_BODY_MASS_INDEX_THRESHOLD,
        );

        expect(bodyMassIndexIsUnderweight, true);
        expect(bodyMassIndexIsNotUnderweight, false);
      },
    );

    test(
      "Test If Function \"isBodyMassIndexNormalWeight\" Returns True If Body Mass Index Is Normal Weight",
      () {
        final bodyMassIndexIsNormalWeight = isBodyMassIndexNormalWeight(
          NORMAL_WEIGHT_BODY_MASS_INDEX_THRESHOLD - 1,
        );
        final bodyMassIndexIsNotNormalWeight = isBodyMassIndexNormalWeight(
          NORMAL_WEIGHT_BODY_MASS_INDEX_THRESHOLD,
        );

        expect(bodyMassIndexIsNormalWeight, true);
        expect(bodyMassIndexIsNotNormalWeight, false);
      },
    );

    test(
      "Test If Function \"isBodyMassIndexOverweight\" Returns True If Body Mass Index Is Overweight",
      () {
        final bodyMassIndexIsOverweight = isBodyMassIndexOverweight(
          OVERWEIGHT_BODY_MASS_INDEX_THRESHOLD - 1,
        );
        final bodyMassIndexIsNotOverweight = isBodyMassIndexOverweight(
          OVERWEIGHT_BODY_MASS_INDEX_THRESHOLD,
        );

        expect(bodyMassIndexIsOverweight, true);
        expect(bodyMassIndexIsNotOverweight, false);
      },
    );
  });
}
