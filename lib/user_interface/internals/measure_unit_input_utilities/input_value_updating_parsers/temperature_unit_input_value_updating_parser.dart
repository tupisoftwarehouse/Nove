import "package:flutter/widgets.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/celsius_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/fahrenheit_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/kelvin_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class TemperatureUnitInputValueUpdatingParser {
  TemperatureUnitInputValueUpdatingParser._();

  static void updateTemperatureUnitValue(
    TextEditingController controller,
    TemperatureUnit selectedTemperatureUnit,
    void Function(TemperatureUnitEntity updatedTemperatureUnit)
    setTemperatureUnitValue,
  ) {
    try {
      final parsedUpdatedValue = double.parse(controller.text).toString();
      late final TemperatureUnitEntity updatedTemperatureUnit;

      switch (selectedTemperatureUnit) {
        case TemperatureUnit.CELSIUS:
          updatedTemperatureUnit = CelsiusUnitEntity(parsedUpdatedValue);
          break;

        case TemperatureUnit.FAHRENHEIT:
          updatedTemperatureUnit = FahrenheitUnitEntity(parsedUpdatedValue);
          break;

        case TemperatureUnit.KELVIN:
          updatedTemperatureUnit = KelvinUnitEntity(parsedUpdatedValue);
          break;
      }

      setTemperatureUnitValue(updatedTemperatureUnit);
    } catch (_) {
      if (controller.text.isNotEmpty &&
          isCharacterNotAllowed(controller.text)) {
        controller.text = controller.text.substring(
          0,
          controller.text.length - 1,
        );
      }
    }
  }
}
