import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/internals/test_utilities/test_temperature_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/celsius_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";

const TEMPERATURE_UNIT_VALUE = "1";

TemperatureUnitEntity TEMPERATURE_UNIT_TO_CONVERT_TO(
  void Function(MeasureUnitEntity<TemperatureUnit>) convertToImplementation,
) {
  return TestTemperatureUnitEntity(
    TEMPERATURE_UNIT_VALUE,
    TemperatureUnit.CELSIUS,
    convertToImplementation,
  );
}

TemperatureUnitEntity UPDATED_TEMPERATURE_UNIT(
  void Function(MeasureUnitEntity<TemperatureUnit>) convertToImplementation,
) {
  return TestTemperatureUnitEntity(
    TEMPERATURE_UNIT_VALUE + TEMPERATURE_UNIT_VALUE,
    TemperatureUnit.CELSIUS,
    convertToImplementation,
  );
}

const ZEROED_TEMPERATURE_UNIT_VALUE = "0";

final ZEROED_TEMPERATURE_UNIT = CelsiusUnitEntity(
  ZEROED_TEMPERATURE_UNIT_VALUE,
);

TemperatureUnitEntity RESET_TEMPERATURE_UNIT() {
  return CelsiusUnitEntity(ZEROED_TEMPERATURE_UNIT_VALUE);
}

double FAHRENHEIT_IN_CELSIUS_CONVERSION_FORMULA(String valueToBeConverted) {
  return ((double.parse(valueToBeConverted) - 32) * 5) / 9;
}

double KELVIN_IN_CELSIUS_CONVERSION_FORMULA(String valueToBeConverted) {
  return double.parse(valueToBeConverted) - 273.15;
}

double CELSIUS_IN_FAHRENHEIT_CONVERSION_FORMULA(String valueToBeConverted) {
  return (double.parse(valueToBeConverted) * 9) / 5 + 32;
}

double KELVIN_IN_FAHRENHEIT_CONVERSION_FORMULA(String valueToBeConverted) {
  return ((double.parse(valueToBeConverted) - 273.15) * 9) / 5 + 32;
}

double CELSIUS_IN_KELVIN_CONVERSION_FORMULA(String valueToBeConverted) {
  return double.parse(valueToBeConverted) + 273.15;
}

double FAHRENHEIT_IN_KELVIN_CONVERSION_FORMULA(String valueToBeConverted) {
  return ((double.parse(valueToBeConverted) - 32) * 5) / 9 + 273.15;
}

final MARSHALLED_TEMPERATURE_UNIT =
    "{\"measureUnit\":\"${TemperatureUnit.CELSIUS.name}\",\"value\":\"$ZEROED_TEMPERATURE_UNIT_VALUE\"}";

final MARSHALLED_LIST_OF_TEMPERATURE_UNIT = "[$MARSHALLED_TEMPERATURE_UNIT]";
