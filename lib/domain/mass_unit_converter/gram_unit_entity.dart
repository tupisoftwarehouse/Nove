import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class GramUnitEntity extends MassUnitEntity {
  GramUnitEntity(String value) : super(value, MassUnit.GRAM);

  @override
  void convertTo(MeasureUnitEntity<MassUnit> massUnitToConvertTo) {
    late final double convertedToMassUnitValue;

    switch (massUnitToConvertTo.measureUnit) {
      case MassUnit.KILOGRAM:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            KILOGRAM_IN_GRAM_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.MILLIGRAM:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            MILLIGRAM_IN_GRAM_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.OUNCE:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            OUNCE_IN_GRAM_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.POUND:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            POUND_IN_GRAM_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.TONNE:
        convertedToMassUnitValue =
            double.parse(massUnitToConvertTo.value) *
            TONNE_IN_GRAM_CONVERSION_MULTIPLIER;

        break;
      case MassUnit.GRAM:
        convertedToMassUnitValue = double.parse(massUnitToConvertTo.value);

        break;
    }

    value = convertedToMassUnitValue.toString();
  }
}
