import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";

class FahrenheitUnitEntity extends TemperatureUnitEntity {
  FahrenheitUnitEntity(String value) : super(value, TemperatureUnit.FAHRENHEIT);

  @override
  void convertTo(
    MeasureUnitEntity<TemperatureUnit> temperatureUnitToConvertTo,
  ) {
    late final double convertedToTemperatureUnitValue;

    switch (temperatureUnitToConvertTo.measureUnit) {
      case TemperatureUnit.CELSIUS:
        convertedToTemperatureUnitValue =
            CELSIUS_IN_FAHRENHEIT_CONVERSION_FORMULA(
              temperatureUnitToConvertTo.value,
            );
        break;
      case TemperatureUnit.KELVIN:
        convertedToTemperatureUnitValue =
            KELVIN_IN_FAHRENHEIT_CONVERSION_FORMULA(
              temperatureUnitToConvertTo.value,
            );
        break;
      case TemperatureUnit.FAHRENHEIT:
        convertedToTemperatureUnitValue = double.parse(
          temperatureUnitToConvertTo.value,
        );
        break;
    }

    value = convertedToTemperatureUnitValue.toString();
  }
}
