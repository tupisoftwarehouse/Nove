import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/time_input_value_updating_parsers/time_calculator_input_value_updating_parser.dart";

void main() {
  group("Test \"TimeCalculatorInputValueUpdatingParser\" Class", () {
    late TextEditingController timeHoursInputController;
    late TextEditingController timeMinutesInputController;
    late TextEditingController timeSecondsInputController;
    TimeValueObject? timeToBeUpdated;

    setUp(() {
      timeHoursInputController = TextEditingController();

      timeMinutesInputController = TextEditingController();

      timeSecondsInputController = TextEditingController();

      timeToBeUpdated = null;
    });

    test(
      "Test If Method \"updateHoursFromTime\" Turns Controller Text Empty If \"updatedInputValue\" Casting Fails And Controller Text Is Empty",
      () {
        TimeCalculatorInputValueUpdatingParser.updateHoursFromTime(
          NON_NUMERIC_CHARACTER,
          timeHoursInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(timeHoursInputController.text, "");
      },
    );

    test(
      "Test If Method \"updateHoursFromTime\" Removes Last Character If \"updatedInputValue\" Casting Fails And Controller Text Is Not Empty",
      () {
        timeHoursInputController.text =
            TIME_TO_BE_CALCULATED.hours.toString() + NON_NUMERIC_CHARACTER;

        TimeCalculatorInputValueUpdatingParser.updateHoursFromTime(
          TIME_TO_BE_CALCULATED.hours.toString() + NON_NUMERIC_CHARACTER,
          timeHoursInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(
          timeHoursInputController.text,
          TIME_TO_BE_CALCULATED.hours.toString(),
        );
      },
    );

    test(
      "Test If Method \"updateHoursFromTime\" Removes Last Character If \"updatedInputValue\" Is Bigger Than Time Hour Number Threshold Length",
      () {
        TimeCalculatorInputValueUpdatingParser.updateHoursFromTime(
          TIME_TO_BE_CALCULATED.hours.toString() *
              (TIME_HOUR_NUMBER_LENGTH + 1),
          timeHoursInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(timeHoursInputController.text.length, TIME_HOUR_NUMBER_LENGTH);
      },
    );

    test("Test If Method \"updateHoursFromTime\" Sets Updated Time", () {
      TimeCalculatorInputValueUpdatingParser.updateHoursFromTime(
        TIME_TO_BE_CALCULATED.hours.toString(),
        timeHoursInputController,
        ZEROED_TIME,
        (updatedTime) {
          timeToBeUpdated = updatedTime;
        },
      );

      expect(timeToBeUpdated!.hours, TIME_TO_BE_CALCULATED.hours);
      expect(timeToBeUpdated!.minutes, ZEROED_TIME.minutes);
      expect(timeToBeUpdated!.seconds, ZEROED_TIME.seconds);
    });

    test(
      "Test If Method \"updateMinutesFromTime\" Turns Controller Text Empty If \"updatedInputValue\" Casting Fails And Controller Text Is Empty",
      () {
        TimeCalculatorInputValueUpdatingParser.updateMinutesFromTime(
          NON_NUMERIC_CHARACTER,
          timeMinutesInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(timeMinutesInputController.text, "");
      },
    );

    test(
      "Test If Method \"updateMinutesFromTime\" Removes Last Character If \"updatedInputValue\" Casting Fails And Controller Text Is Not Empty",
      () {
        timeMinutesInputController.text =
            TIME_TO_BE_CALCULATED.minutes.toString() + NON_NUMERIC_CHARACTER;

        TimeCalculatorInputValueUpdatingParser.updateMinutesFromTime(
          TIME_TO_BE_CALCULATED.minutes.toString() + NON_NUMERIC_CHARACTER,
          timeMinutesInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(
          timeMinutesInputController.text,
          TIME_TO_BE_CALCULATED.minutes.toString(),
        );
      },
    );

    test(
      "Test If Method \"updateMinutesFromTime\" Removes Last Character If \"updatedInputValue\" Is Bigger Than Time Minutes Number Threshold Length",
      () {
        TimeCalculatorInputValueUpdatingParser.updateMinutesFromTime(
          TIME_TO_BE_CALCULATED.minutes.toString() *
              (TIME_CYCLE_NUMBER_LENGTH + 1),
          timeMinutesInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(
          timeMinutesInputController.text.length,
          TIME_CYCLE_NUMBER_LENGTH,
        );
      },
    );

    test(
      "Test If Method \"updateMinutesFromTime\" Turns To Greatest Number In To Cycle If \"updatedInputValue\" Is Greater Than Time Cycle Number",
      () {
        late TimeValueObject timeToBeUpdated;

        TimeCalculatorInputValueUpdatingParser.updateMinutesFromTime(
          (TIME_CYCLE_HIGHEST_NUMBER + 1).toString(),
          timeMinutesInputController,
          ZEROED_TIME,
          (updatedTime) {
            timeToBeUpdated = updatedTime;
          },
        );

        expect(
          timeMinutesInputController.text,
          TIME_CYCLE_HIGHEST_NUMBER.toString(),
        );

        expect(timeToBeUpdated.hours, ZEROED_TIME.hours);
        expect(timeToBeUpdated.minutes, TIME_CYCLE_HIGHEST_NUMBER);
        expect(timeToBeUpdated.seconds, ZEROED_TIME.seconds);
      },
    );

    test("Test If Method \"updateMinutesFromTime\" Sets Updated Time", () {
      TimeCalculatorInputValueUpdatingParser.updateMinutesFromTime(
        TIME_TO_BE_CALCULATED.minutes.toString(),
        timeMinutesInputController,
        ZEROED_TIME,
        (updatedTime) {
          timeToBeUpdated = updatedTime;
        },
      );

      expect(timeToBeUpdated!.hours, ZEROED_TIME.hours);
      expect(timeToBeUpdated!.minutes, TIME_TO_BE_CALCULATED.minutes);
      expect(timeToBeUpdated!.seconds, ZEROED_TIME.hours);
    });

    test(
      "Test If Method \"updateSecondsFromTime\" Turns Controller Text Empty If \"updatedInputValue\" Casting Fails And Controller Text Is Empty",
      () {
        TimeCalculatorInputValueUpdatingParser.updateSecondsFromTime(
          NON_NUMERIC_CHARACTER,
          timeSecondsInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(timeSecondsInputController.text, "");
      },
    );

    test(
      "Test If Method \"updateSecondsFromTime\" Removes Last Character If \"updatedInputValue\" Casting Fails And Controller Text Is Not Empty",
      () {
        timeSecondsInputController.text =
            TIME_TO_BE_CALCULATED.seconds.toString() + NON_NUMERIC_CHARACTER;

        TimeCalculatorInputValueUpdatingParser.updateSecondsFromTime(
          TIME_TO_BE_CALCULATED.seconds.toString() + NON_NUMERIC_CHARACTER,
          timeSecondsInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(
          timeSecondsInputController.text,
          TIME_TO_BE_CALCULATED.seconds.toString(),
        );
      },
    );

    test(
      "Test If Method \"updateSecondsFromTime\" Removes Last Character If \"updatedInputValue\" Is Bigger Than Time Seconds Number Threshold Length",
      () {
        TimeCalculatorInputValueUpdatingParser.updateSecondsFromTime(
          TIME_TO_BE_CALCULATED.seconds.toString() *
              (TIME_CYCLE_NUMBER_LENGTH + 1),
          timeSecondsInputController,
          ZEROED_TIME,
          (_) {},
        );

        expect(
          timeSecondsInputController.text.length,
          TIME_CYCLE_NUMBER_LENGTH,
        );
      },
    );

    test(
      "Test If Method \"updateSecondsFromTime\" Turns To Greatest Number In To Cycle If \"updatedInputValue\" Is Greater Than Time Cycle Number",
      () {
        late TimeValueObject timeToBeUpdated;

        TimeCalculatorInputValueUpdatingParser.updateSecondsFromTime(
          (TIME_CYCLE_HIGHEST_NUMBER + 1).toString(),
          timeSecondsInputController,
          ZEROED_TIME,
          (updatedTime) {
            timeToBeUpdated = updatedTime;
          },
        );

        expect(
          timeSecondsInputController.text,
          TIME_CYCLE_HIGHEST_NUMBER.toString(),
        );

        expect(timeToBeUpdated.hours, ZEROED_TIME.hours);
        expect(timeToBeUpdated.minutes, ZEROED_TIME.minutes);
        expect(timeToBeUpdated.seconds, TIME_CYCLE_HIGHEST_NUMBER);
      },
    );

    test("Test If Method \"updateSecondsFromTime\" Sets Updated Time", () {
      TimeCalculatorInputValueUpdatingParser.updateSecondsFromTime(
        TIME_TO_BE_CALCULATED.seconds.toString(),
        timeSecondsInputController,
        ZEROED_TIME,
        (updatedTime) {
          timeToBeUpdated = updatedTime;
        },
      );

      expect(timeToBeUpdated!.hours, ZEROED_TIME.hours);
      expect(timeToBeUpdated!.minutes, ZEROED_TIME.minutes);
      expect(timeToBeUpdated!.seconds, TIME_TO_BE_CALCULATED.seconds);
    });
  });
}
