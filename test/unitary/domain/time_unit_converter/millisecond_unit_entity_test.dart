import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/time_unit_converter/day_unit_entity.dart";
import "package:nove/domain/time_unit_converter/hour_unit_entity.dart";
import "package:nove/domain/time_unit_converter/millisecond_unit_entity.dart";
import "package:nove/domain/time_unit_converter/minute_unit_entity.dart";
import "package:nove/domain/time_unit_converter/second_unit_entity.dart";
import "package:nove/domain/time_unit_converter/week_unit_entity.dart";
import "package:nove/domain/time_unit_converter/year_unit_entity.dart";
import "../../../concerns/measure_unit_value_formatter.dart";

void main() {
  group("Test \"MillisecondUnitEntity\" Entity", () {
    test(
      "Test If Method \"convertTo\" Converts To Time Unit Value But Keeping Current Time Unit",
      () {
        late MillisecondUnitEntity instance = MillisecondUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
        );
        late String formattedValue;
        final yearUnit = YearUnitEntity(TIME_UNIT_VALUE);
        final weekUnit = WeekUnitEntity(TIME_UNIT_VALUE);
        final dayUnit = DayUnitEntity(TIME_UNIT_VALUE);
        final hourUnit = HourUnitEntity(TIME_UNIT_VALUE);
        final minuteUnit = MinuteUnitEntity(TIME_UNIT_VALUE);
        final secondUnit = SecondUnitEntity(TIME_UNIT_VALUE);
        final millisecondUnit = MillisecondUnitEntity(TIME_UNIT_VALUE);

        instance.convertTo(yearUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          TIME_UNIT_VALUE,
          YEAR_IN_MILLISECOND_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(weekUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          TIME_UNIT_VALUE,
          WEEK_IN_MILLISECOND_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(dayUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          TIME_UNIT_VALUE,
          DAY_IN_MILLISECOND_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(hourUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          TIME_UNIT_VALUE,
          HOUR_IN_MILLISECOND_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(minuteUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          TIME_UNIT_VALUE,
          MINUTE_IN_MILLISECOND_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(secondUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          TIME_UNIT_VALUE,
          SECOND_IN_MILLISECOND_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(millisecondUnit);

        expect(instance.value, TIME_UNIT_VALUE);
      },
    );
  });
}
