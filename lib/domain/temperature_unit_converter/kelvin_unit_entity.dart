import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";

class KelvinUnitEntity extends TemperatureUnitEntity {
  KelvinUnitEntity(String value) : super(value, TemperatureUnit.KELVIN);

  @override
  void convertTo(
    MeasureUnitEntity<TemperatureUnit> temperatureUnitToConvertTo,
  ) {
    late final double convertedToTemperatureUnitValue;

    switch (temperatureUnitToConvertTo.measureUnit) {
      case TemperatureUnit.FAHRENHEIT:
        convertedToTemperatureUnitValue =
            FAHRENHEIT_IN_KELVIN_CONVERSION_FORMULA(
              temperatureUnitToConvertTo.value,
            );

        break;
      case TemperatureUnit.CELSIUS:
        convertedToTemperatureUnitValue = CELSIUS_IN_KELVIN_CONVERSION_FORMULA(
          temperatureUnitToConvertTo.value,
        );

        break;
      case TemperatureUnit.KELVIN:
        convertedToTemperatureUnitValue = double.parse(
          temperatureUnitToConvertTo.value,
        );

        break;
    }

    value = convertedToTemperatureUnitValue.toString();
  }
}
