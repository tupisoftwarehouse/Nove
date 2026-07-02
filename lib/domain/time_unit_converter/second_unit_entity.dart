import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";

class SecondUnitEntity extends TimeUnitEntity {
  SecondUnitEntity(String value) : super(value, TimeUnit.SECOND);

  @override
  void convertTo(MeasureUnitEntity<TimeUnit> timeUnitToConvertTo) {
    late final double convertedToTimeUnitValue;

    switch (timeUnitToConvertTo.measureUnit) {
      case TimeUnit.DAY:
        convertedToTimeUnitValue =
            double.parse(timeUnitToConvertTo.value) *
            DAY_IN_SECOND_CONVERSION_MULTIPLIER;

        break;
      case TimeUnit.HOUR:
        convertedToTimeUnitValue =
            double.parse(timeUnitToConvertTo.value) *
            HOUR_IN_SECOND_CONVERSION_MULTIPLIER;

        break;
      case TimeUnit.MILLISECOND:
        convertedToTimeUnitValue =
            double.parse(timeUnitToConvertTo.value) *
            MILLISECOND_IN_SECOND_CONVERSION_MULTIPLIER;

        break;
      case TimeUnit.MINUTE:
        convertedToTimeUnitValue =
            double.parse(timeUnitToConvertTo.value) *
            MINUTE_IN_SECOND_CONVERSION_MULTIPLIER;

        break;
      case TimeUnit.WEEK:
        convertedToTimeUnitValue =
            double.parse(timeUnitToConvertTo.value) *
            WEEK_IN_SECOND_CONVERSION_MULTIPLIER;

        break;
      case TimeUnit.YEAR:
        convertedToTimeUnitValue =
            double.parse(timeUnitToConvertTo.value) *
            YEAR_IN_SECOND_CONVERSION_MULTIPLIER;

        break;
      case TimeUnit.SECOND:
        convertedToTimeUnitValue = double.parse(timeUnitToConvertTo.value);

        break;
    }

    value = convertedToTimeUnitValue.toString();
  }
}
