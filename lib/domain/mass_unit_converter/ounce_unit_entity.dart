import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class OunceUnitEntity extends MassUnitEntity {
  OunceUnitEntity(String value) : super(value, MassUnit.OUNCE);

  @override
  void convertTo(MeasureUnitEntity<MassUnit> massUnitToConvertTo) {
    late final double convertedToMassUnitValue;

    switch (massUnitToConvertTo.measureUnit) {
      case MassUnit.GRAM:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            GRAM_IN_OUNCE_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.KILOGRAM:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            KILOGRAM_IN_OUNCE_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.MILLIGRAM:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            MILLIGRAM_IN_OUNCE_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.POUND:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            POUND_IN_OUNCE_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.TONNE:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            TONNE_IN_OUNCE_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.OUNCE:
        convertedToMassUnitValue = double.parse(massUnitToConvertTo.value);

        break;
    }

    value = convertedToMassUnitValue.toString();
  }
}
