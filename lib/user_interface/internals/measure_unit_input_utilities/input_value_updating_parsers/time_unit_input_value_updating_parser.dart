import "package:flutter/widgets.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/year_unit_entity.dart";
import "package:nove/domain/time_unit_converter/week_unit_entity.dart";
import "package:nove/domain/time_unit_converter/day_unit_entity.dart";
import "package:nove/domain/time_unit_converter/hour_unit_entity.dart";
import "package:nove/domain/time_unit_converter/minute_unit_entity.dart";
import "package:nove/domain/time_unit_converter/second_unit_entity.dart";
import "package:nove/domain/time_unit_converter/millisecond_unit_entity.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class TimeUnitInputValueUpdatingParser {
  TimeUnitInputValueUpdatingParser._();

  static void updateTimeUnitValue(
    TextEditingController controller,
    TimeUnit selectedTimeUnit,
    void Function(TimeUnitEntity updatedTimeUnit) setTimeUnitValue,
  ) {
    try {
      final parsedUpdatedValue = double.parse(controller.text).toString();
      late final TimeUnitEntity updatedTimeUnit;

      switch (selectedTimeUnit) {
        case TimeUnit.YEAR:
          updatedTimeUnit = YearUnitEntity(parsedUpdatedValue);

          break;
        case TimeUnit.WEEK:
          updatedTimeUnit = WeekUnitEntity(parsedUpdatedValue);

          break;
        case TimeUnit.DAY:
          updatedTimeUnit = DayUnitEntity(parsedUpdatedValue);

          break;
        case TimeUnit.HOUR:
          updatedTimeUnit = HourUnitEntity(parsedUpdatedValue);

          break;
        case TimeUnit.MINUTE:
          updatedTimeUnit = MinuteUnitEntity(parsedUpdatedValue);

          break;
        case TimeUnit.SECOND:
          updatedTimeUnit = SecondUnitEntity(parsedUpdatedValue);

          break;
        case TimeUnit.MILLISECOND:
          updatedTimeUnit = MillisecondUnitEntity(parsedUpdatedValue);

          break;
      }

      setTimeUnitValue(updatedTimeUnit);
    } catch (_) {
      if (controller.text.isNotEmpty &&
          isCharacterNotAllowed(controller.text)) {
        controller.text = controller.text.substring(
          0,
          controller.text.length - 1,
        );
      }
    }
  }
}
