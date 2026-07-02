import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";

bool isBodyMassIndexUnderweight(double bodyMassIndex) {
  return bodyMassIndex < UNDERWEIGHT_BODY_MASS_INDEX_THRESHOLD;
}

bool isBodyMassIndexNormalWeight(double bodyMassIndex) {
  return bodyMassIndex < NORMAL_WEIGHT_BODY_MASS_INDEX_THRESHOLD;
}

bool isBodyMassIndexOverweight(double bodyMassIndex) {
  return bodyMassIndex < OVERWEIGHT_BODY_MASS_INDEX_THRESHOLD;
}
