import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_calculator/time_calculator.dart";

void main() {
  group("Test \"TimeCalculator\" Component", () {
    test("Test Getting Added Time", () {
      final addedTime = TimeCalculator.getAddedTime(
        TIME_TO_BE_CALCULATED,
        TIME_TO_BE_CALCULATED,
      );

      expect(addedTime.hours, CALCULATED_TIME.hours);
      expect(addedTime.minutes, CALCULATED_TIME.minutes);
      expect(addedTime.seconds, CALCULATED_TIME.seconds);
    });

    test("Test Getting Subtracted Time", () {
      final subtractedTime = TimeCalculator.getSubtractedTime(
        TIME_TO_BE_CALCULATED,
        TIME_TO_BE_CALCULATED,
      );

      expect(subtractedTime.hours, ZEROED_TIME.hours);
      expect(subtractedTime.minutes, ZEROED_TIME.minutes);
      expect(subtractedTime.seconds, ZEROED_TIME.seconds);
    });
  });
}
