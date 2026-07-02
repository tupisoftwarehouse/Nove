import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class SquareCentimeterUnitEntity extends AreaUnitEntity {
  SquareCentimeterUnitEntity(String value)
    : super(value, AreaUnit.SQUARE_CENTIMETER);

  @override
  void convertTo(MeasureUnitEntity<AreaUnit> areaUnitToConvertTo) {
    late final double convertedToAreaUnitValue;

    switch (areaUnitToConvertTo.measureUnit) {
      case AreaUnit.ACRE:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            ACRE_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.HECTARE:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            HECTARE_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.SQUARE_INCH:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            SQUARE_INCH_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.SQUARE_YARD:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            SQUARE_YARD_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.SQUARE_FOOT:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            SQUARE_FOOT_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.SQUARE_METER:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            SQUARE_METER_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.SQUARE_KILOMETER:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            SQUARE_KILOMETER_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.SQUARE_MILE:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            SQUARE_MILE_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.SQUARE_MILLIMETER:
        convertedToAreaUnitValue =
            double.parse(areaUnitToConvertTo.value) *
            SQUARE_MILLIMETER_IN_SQUARE_CENTIMETER_CONVERSION_MULTIPLIER;

        break;
      case AreaUnit.SQUARE_CENTIMETER:
        convertedToAreaUnitValue = double.parse(areaUnitToConvertTo.value);

        break;
    }

    value = convertedToAreaUnitValue.toString();
  }
}
