import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/temperature_unit_dropdown_menu_description_selector.dart";

void main() {
  group("Test \"TemperatureUnitDropdownMenuDescriptionSelector\" Class", () {
    test(
      "Test If Method \"getTemperatureUnitDropdownMenuDescription\" Returns \"DropdownMenuDescriptionEntity\" Of Corresponding Temperature Unit",
      () {
        final celsiusInstance =
            TemperatureUnitDropdownMenuDescriptionSelector.getTemperatureUnitDropdownMenuDescription(
              TemperatureUnit.CELSIUS,
              APPLICATION_LANGUAGE,
            );
        final fahrenheitInstance =
            TemperatureUnitDropdownMenuDescriptionSelector.getTemperatureUnitDropdownMenuDescription(
              TemperatureUnit.FAHRENHEIT,
              APPLICATION_LANGUAGE,
            );
        final kelvinInstance =
            TemperatureUnitDropdownMenuDescriptionSelector.getTemperatureUnitDropdownMenuDescription(
              TemperatureUnit.KELVIN,
              APPLICATION_LANGUAGE,
            );

        expect(celsiusInstance.label, APPLICATION_LANGUAGE.CELSIUS_UNIT_LABEL);
        expect(
          celsiusInstance.abbreviation,
          APPLICATION_LANGUAGE.CELSIUS_UNIT_ABBREVIATION,
        );

        expect(
          fahrenheitInstance.label,
          APPLICATION_LANGUAGE.FAHRENHEIT_UNIT_LABEL,
        );
        expect(
          fahrenheitInstance.abbreviation,
          APPLICATION_LANGUAGE.FAHRENHEIT_UNIT_ABBREVIATION,
        );

        expect(kelvinInstance.label, APPLICATION_LANGUAGE.KELVIN_UNIT_LABEL);
        expect(
          kelvinInstance.abbreviation,
          APPLICATION_LANGUAGE.KELVIN_UNIT_ABBREVIATION,
        );
      },
    );
  });
}
