import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/year_unit_entity.dart";
import "package:nove/domain/time_unit_converter/week_unit_entity.dart";
import "package:nove/domain/time_unit_converter/day_unit_entity.dart";
import "package:nove/domain/time_unit_converter/hour_unit_entity.dart";
import "package:nove/domain/time_unit_converter/minute_unit_entity.dart";
import "package:nove/domain/time_unit_converter/second_unit_entity.dart";
import "package:nove/domain/time_unit_converter/millisecond_unit_entity.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/time_unit_input_value_updating_parser.dart";

void main() {
  group("Test \"TimeUnitInputValueUpdatingParser\" Class", () {
    late TextEditingController controller;
    late String updatedTimeUnitValue;

    setUp(() {
      controller = TextEditingController(text: TIME_UNIT_VALUE);

      updatedTimeUnitValue = double.parse(TIME_UNIT_VALUE).toString();
    });

    test(
      "Test If Method \"updateTimeUnitValue\" Updates Time Unit Value On Controller",
      () {
        late final YearUnitEntity updatedYearInstance;
        late final WeekUnitEntity updatedWeekInstance;
        late final DayUnitEntity updatedDayInstance;
        late final HourUnitEntity updatedHourInstance;
        late final MinuteUnitEntity updatedMinuteInstance;
        late final SecondUnitEntity updatedSecondInstance;
        late final MillisecondUnitEntity updatedMillisecondInstance;

        TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
          controller,
          TimeUnit.YEAR,
          (updatedTimeUnit) {
            updatedYearInstance = updatedTimeUnit as YearUnitEntity;
          },
        );

        TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
          controller,
          TimeUnit.WEEK,
          (updatedTimeUnit) {
            updatedWeekInstance = updatedTimeUnit as WeekUnitEntity;
          },
        );

        TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
          controller,
          TimeUnit.DAY,
          (updatedTimeUnit) {
            updatedDayInstance = updatedTimeUnit as DayUnitEntity;
          },
        );

        TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
          controller,
          TimeUnit.HOUR,
          (updatedTimeUnit) {
            updatedHourInstance = updatedTimeUnit as HourUnitEntity;
          },
        );

        TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
          controller,
          TimeUnit.MINUTE,
          (updatedTimeUnit) {
            updatedMinuteInstance = updatedTimeUnit as MinuteUnitEntity;
          },
        );

        TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
          controller,
          TimeUnit.SECOND,
          (updatedTimeUnit) {
            updatedSecondInstance = updatedTimeUnit as SecondUnitEntity;
          },
        );

        TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
          controller,
          TimeUnit.MILLISECOND,
          (updatedTimeUnit) {
            updatedMillisecondInstance =
                updatedTimeUnit as MillisecondUnitEntity;
          },
        );

        expect(updatedYearInstance.value, updatedTimeUnitValue);
        expect(updatedYearInstance.measureUnit, TimeUnit.YEAR);

        expect(updatedWeekInstance.value, updatedTimeUnitValue);
        expect(updatedWeekInstance.measureUnit, TimeUnit.WEEK);

        expect(updatedDayInstance.value, updatedTimeUnitValue);
        expect(updatedDayInstance.measureUnit, TimeUnit.DAY);

        expect(updatedHourInstance.value, updatedTimeUnitValue);
        expect(updatedHourInstance.measureUnit, TimeUnit.HOUR);

        expect(updatedMinuteInstance.value, updatedTimeUnitValue);
        expect(updatedMinuteInstance.measureUnit, TimeUnit.MINUTE);

        expect(updatedSecondInstance.value, updatedTimeUnitValue);
        expect(updatedSecondInstance.measureUnit, TimeUnit.SECOND);

        expect(updatedMillisecondInstance.value, updatedTimeUnitValue);
        expect(updatedMillisecondInstance.measureUnit, TimeUnit.MILLISECOND);
      },
    );

    test(
      "Test If Method \"updateTimeUnitValue\" Removes Last Character If \"updatedInputValue\" Casting Fails With Value Not Empty And Last Character Is Not Allowed",
      () {
        controller.text = TIME_UNIT_VALUE + NON_NUMERIC_CHARACTER;

        TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
          controller,
          TimeUnit.SECOND,
          (updatedTimeUnit) {},
        );

        expect(controller.text, TIME_UNIT_VALUE);
      },
    );
  });
}
