import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_calculator/internals/checker/time_calculator_checker.dart";

void main() {
  group("Test \"TimeCalculatorChecker\" Module", () {
    test(
      "Test If Function \"isCycleClosed\" Returns True When Calculated Time Unit Is In Closed Cycle",
      () {
        final cycleIsClosed = isCycleClosed(MINIMAL_CYCLE_VALUE - 1);
        final cycleIsNotClosed = isCycleClosed(MINIMAL_CYCLE_VALUE);

        expect(cycleIsClosed, true);
        expect(cycleIsNotClosed, false);
      },
    );
  });
}
