import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/celsius_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/fahrenheit_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/kelvin_unit_entity.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/temperature_unit_input_value_updating_parser.dart";

void main() {
  group("Test \"TemperatureUnitInputValueUpdatingParser\" Class", () {
    late TextEditingController controller;
    late String updatedTemperatureUnitValue;

    setUp(() {
      controller = TextEditingController(text: TEMPERATURE_UNIT_VALUE);

      updatedTemperatureUnitValue = double.parse(
        TEMPERATURE_UNIT_VALUE,
      ).toString();
    });

    test(
      "Test If Method \"updateTemperatureUnitValue\" Updates Temperature Unit Value On Controller",
      () {
        late final CelsiusUnitEntity updatedCelsiusInstance;
        late final FahrenheitUnitEntity updatedFahrenheitInstance;
        late final KelvinUnitEntity updatedKelvinInstance;

        TemperatureUnitInputValueUpdatingParser.updateTemperatureUnitValue(
          controller,
          TemperatureUnit.CELSIUS,
          (updatedTemperatureUnit) {
            updatedCelsiusInstance =
                updatedTemperatureUnit as CelsiusUnitEntity;
          },
        );

        TemperatureUnitInputValueUpdatingParser.updateTemperatureUnitValue(
          controller,
          TemperatureUnit.FAHRENHEIT,
          (updatedTemperatureUnit) {
            updatedFahrenheitInstance =
                updatedTemperatureUnit as FahrenheitUnitEntity;
          },
        );

        TemperatureUnitInputValueUpdatingParser.updateTemperatureUnitValue(
          controller,
          TemperatureUnit.KELVIN,
          (updatedTemperatureUnit) {
            updatedKelvinInstance = updatedTemperatureUnit as KelvinUnitEntity;
          },
        );

        expect(updatedCelsiusInstance.value, updatedTemperatureUnitValue);
        expect(updatedCelsiusInstance.measureUnit, TemperatureUnit.CELSIUS);

        expect(updatedFahrenheitInstance.value, updatedTemperatureUnitValue);
        expect(
          updatedFahrenheitInstance.measureUnit,
          TemperatureUnit.FAHRENHEIT,
        );

        expect(updatedKelvinInstance.value, updatedTemperatureUnitValue);
        expect(updatedKelvinInstance.measureUnit, TemperatureUnit.KELVIN);
      },
    );

    test(
      "Test If Method \"updateTemperatureUnitValue\" Removes Last Character If \"updatedInputValue\" Casting Fails With Value Not Empty And Last Character Is Not Allowed",
      () {
        controller.text = TEMPERATURE_UNIT_VALUE + NON_NUMERIC_CHARACTER;

        TemperatureUnitInputValueUpdatingParser.updateTemperatureUnitValue(
          controller,
          TemperatureUnit.CELSIUS,
          (updatedTemperatureUnit) {},
        );

        expect(controller.text, TEMPERATURE_UNIT_VALUE);
      },
    );
  });
}
