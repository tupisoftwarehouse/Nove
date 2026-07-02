import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class MileUnitEntity extends LengthUnitEntity {
  MileUnitEntity(String value) : super(value, LengthUnit.MILE);

  @override
  void convertTo(MeasureUnitEntity<LengthUnit> lengthUnitToConvertTo) {
    late final double convertedToLengthUnitValue;

    switch (lengthUnitToConvertTo.measureUnit) {
      case LengthUnit.MILLIMETER:
        convertedToLengthUnitValue =
            double.parse(lengthUnitToConvertTo.value) *
            MILLIMETER_IN_MILE_CONVERSION_MULTIPLIER;

        break;
      case LengthUnit.CENTIMETER:
        convertedToLengthUnitValue =
            double.parse(lengthUnitToConvertTo.value) *
            CENTIMETER_IN_MILE_CONVERSION_MULTIPLIER;

        break;
      case LengthUnit.METER:
        convertedToLengthUnitValue =
            double.parse(lengthUnitToConvertTo.value) *
            METER_IN_MILE_CONVERSION_MULTIPLIER;

        break;
      case LengthUnit.KILOMETER:
        convertedToLengthUnitValue =
            double.parse(lengthUnitToConvertTo.value) *
            KILOMETER_IN_MILE_CONVERSION_MULTIPLIER;

        break;
      case LengthUnit.INCH:
        convertedToLengthUnitValue =
            double.parse(lengthUnitToConvertTo.value) *
            INCH_IN_MILE_CONVERSION_MULTIPLIER;

        break;
      case LengthUnit.FOOT:
        convertedToLengthUnitValue =
            double.parse(lengthUnitToConvertTo.value) *
            FOOT_IN_MILE_CONVERSION_MULTIPLIER;

        break;
      case LengthUnit.YARD:
        convertedToLengthUnitValue =
            double.parse(lengthUnitToConvertTo.value) *
            YARD_IN_MILE_CONVERSION_MULTIPLIER;

        break;
      case LengthUnit.NAUTICAL_MILE:
        convertedToLengthUnitValue =
            double.parse(lengthUnitToConvertTo.value) *
            NAUTICAL_MILE_IN_MILE_CONVERSION_MULTIPLIER;

        break;
      case LengthUnit.MILE:
        convertedToLengthUnitValue = double.parse(lengthUnitToConvertTo.value);

        break;
    }

    value = convertedToLengthUnitValue.toString();
  }
}
