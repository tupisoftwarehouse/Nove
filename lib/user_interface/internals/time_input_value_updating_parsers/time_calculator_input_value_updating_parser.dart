import "package:flutter/widgets.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class TimeCalculatorInputValueUpdatingParser {
  TimeCalculatorInputValueUpdatingParser._();

  static void updateHoursFromTime(
    String updatedInputValue,
    TextEditingController controller,
    TimeValueObject previousTime,
    void Function(TimeValueObject updatedTime) setTime,
  ) {
    try {
      final updateTimeHours = int.parse(updatedInputValue);

      if (isTimeHourNumberOverflowing(updatedInputValue.length)) {
        controller.text = updatedInputValue.substring(
          0,
          TIME_HOUR_NUMBER_LENGTH,
        );
      } else {
        final updatedTime = TimeValueObject(
          updateTimeHours,
          previousTime.minutes,
          previousTime.seconds,
        );

        setTime(updatedTime);
      }
    } catch (_) {
      controller.text = controller.text.isEmpty
          ? ""
          : updatedInputValue.substring(0, controller.text.length - 1);
    }
  }

  static void updateMinutesFromTime(
    String updatedInputValue,
    TextEditingController controller,
    TimeValueObject previousTime,
    void Function(TimeValueObject updatedTime) setTime,
  ) {
    try {
      final updatedTimeMinutes = int.parse(updatedInputValue);

      if (isTimeCycleNumberOverflowing(updatedInputValue.length)) {
        controller.text = updatedInputValue.substring(
          0,
          TIME_CYCLE_NUMBER_LENGTH,
        );
      } else if (isTimeCycleHigherThanThreshold(updatedTimeMinutes)) {
        final fixedUpdatedTime = TimeValueObject(
          previousTime.hours,
          TIME_CYCLE_HIGHEST_NUMBER,
          previousTime.seconds,
        );

        controller.text = TIME_CYCLE_HIGHEST_NUMBER.toString();

        setTime(fixedUpdatedTime);
      } else {
        final updatedTime = TimeValueObject(
          previousTime.hours,
          updatedTimeMinutes,
          previousTime.seconds,
        );

        setTime(updatedTime);
      }
    } catch (_) {
      controller.text = controller.text.isEmpty
          ? ""
          : updatedInputValue.substring(0, controller.text.length - 1);
    }
  }

  static void updateSecondsFromTime(
    String updatedInputValue,
    TextEditingController controller,
    TimeValueObject previousTime,
    void Function(TimeValueObject updatedTime) setTime,
  ) {
    try {
      final updatedTimeSeconds = int.tryParse(updatedInputValue);

      if (isTimeCycleNumberOverflowing(updatedInputValue.length)) {
        controller.text = updatedInputValue.substring(
          0,
          TIME_CYCLE_NUMBER_LENGTH,
        );
      } else if (isTimeCycleHigherThanThreshold(updatedTimeSeconds!)) {
        final fixedUpdatedTime = TimeValueObject(
          previousTime.hours,
          previousTime.minutes,
          TIME_CYCLE_HIGHEST_NUMBER,
        );

        controller.text = TIME_CYCLE_HIGHEST_NUMBER.toString();

        setTime(fixedUpdatedTime);
      } else {
        final updatedTime = TimeValueObject(
          previousTime.hours,
          previousTime.minutes,
          updatedTimeSeconds,
        );

        setTime(updatedTime);
      }
    } catch (_) {
      controller.text = controller.text.isEmpty
          ? ""
          : updatedInputValue.substring(0, controller.text.length - 1);
    }
  }
}
