import "package:nove/constants/domains/time_calculator_constants.dart";

bool isCycleClosed(int calculatedTimeUnit) {
  return calculatedTimeUnit < MINIMAL_CYCLE_VALUE;
}
