import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculation_candidate_value_object.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_value_object.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_category.dart";
import "package:nove/domain/body_mass_index_calculator/internals/checker/body_mass_index_calculator_checker.dart";

class BodyMassIndexCalculator {
  static BodyMassIndexValueObject getBodyMassIndex(
    BodyMassIndexCalculationCandidateValueObject candidate,
  ) {
    final heightInMeters = candidate.height / CENTIMETER_TO_METER_DIVISOR;
    final calculatedBodyMassIndex =
        candidate.weight / (heightInMeters * heightInMeters);
    final fixedCalculatedBodyMassIndex = double.parse(
      calculatedBodyMassIndex.toStringAsFixed(
        BODY_MASS_INDEX_PRECISION_FACTOR_DIGIT,
      ),
    );

    if (isBodyMassIndexUnderweight(fixedCalculatedBodyMassIndex)) {
      return BodyMassIndexValueObject(
        fixedCalculatedBodyMassIndex,
        BodyMassIndexCategory.UNDERWEIGHT,
      );
    }
    if (isBodyMassIndexNormalWeight(fixedCalculatedBodyMassIndex)) {
      return BodyMassIndexValueObject(
        fixedCalculatedBodyMassIndex,
        BodyMassIndexCategory.NORMAL_WEIGHT,
      );
    }
    if (isBodyMassIndexOverweight(fixedCalculatedBodyMassIndex)) {
      return BodyMassIndexValueObject(
        fixedCalculatedBodyMassIndex,
        BodyMassIndexCategory.OVERWEIGHT,
      );
    }

    return BodyMassIndexValueObject(
      fixedCalculatedBodyMassIndex,
      BodyMassIndexCategory.OBESE,
    );
  }
}
