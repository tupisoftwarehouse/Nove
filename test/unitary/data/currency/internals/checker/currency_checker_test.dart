import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/internals/checker/currency_checker.dart";

void main() {
  group("Test \"CurrencyChecker\" Module", () {
    test(
      "Test If Function \"isTodaySaturday\" Returns True If Today Is Saturday",
      () {
        final todayIsSaturday = isTodaySaturday(SATURDAY_TIME_OF_THE_DAY);
        final todayIsNotSaturday = isTodaySaturday(WORKING_DAY_TIME_OF_THE_DAY);

        expect(todayIsSaturday, true);
        expect(todayIsNotSaturday, false);
      },
    );

    test(
      "Test If Function \"isTodaySunday\" Returns True If Today Is Sunday",
      () {
        final todayIsSunday = isTodaySunday(SUNDAY_TIME_OF_THE_DAY);
        final todayIsNotSunday = isTodaySunday(WORKING_DAY_TIME_OF_THE_DAY);

        expect(todayIsSunday, true);
        expect(todayIsNotSunday, false);
      },
    );
  });
}
