import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";

class MilePerSecondUnitEntity extends SpeedUnitEntity {
  MilePerSecondUnitEntity(String value)
    : super(value, SpeedUnit.MILE_PER_SECOND);

  @override
  void convertTo(MeasureUnitEntity<SpeedUnit> speedUnitToConvertTo) {
    late final double convertedToSpeedUnitValue;

    switch (speedUnitToConvertTo.measureUnit) {
      case SpeedUnit.LIGHTSPEED:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            LIGHTSPEED_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.FOOT_PER_SECOND:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            FOOT_PER_SECOND_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.INCH_PER_SECOND:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            INCH_PER_SECOND_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.KILOMETER_PER_HOUR:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            KILOMETER_PER_HOUR_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.KILOMETER_PER_SECOND:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            KILOMETER_PER_SECOND_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.KNOT:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            KNOT_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.MACH:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            MACH_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.METER_PER_SECOND:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            METER_PER_SECOND_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.MILE_PER_HOUR:
        convertedToSpeedUnitValue =
            double.parse(speedUnitToConvertTo.value) *
            MILE_PER_HOUR_IN_MILE_PER_SECOND_CONVERSION_MULTIPLIER;

        break;
      case SpeedUnit.MILE_PER_SECOND:
        convertedToSpeedUnitValue = double.parse(speedUnitToConvertTo.value);

        break;
    }

    value = convertedToSpeedUnitValue.toString();
  }
}
