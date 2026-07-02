import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/dropdown_menu_description_holder_value_object.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";

class TemperatureUnitDropdownMenuDescriptionSelector {
  TemperatureUnitDropdownMenuDescriptionSelector._();

  static DropdownMenuDescriptionHolderValueObject
  getTemperatureUnitDropdownMenuDescription(
    TemperatureUnit selectedTemperatureUnit,
    DeviceLanguageStringsValueObject deviceLanguageStrings,
  ) {
    late final DropdownMenuDescriptionHolderValueObject
    dropdownMenuItemDescriptionHolder;

    switch (selectedTemperatureUnit) {
      case TemperatureUnit.CELSIUS:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.CELSIUS_UNIT_LABEL,
              deviceLanguageStrings.CELSIUS_UNIT_ABBREVIATION,
            );
        break;

      case TemperatureUnit.FAHRENHEIT:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.FAHRENHEIT_UNIT_LABEL,
              deviceLanguageStrings.FAHRENHEIT_UNIT_ABBREVIATION,
            );
        break;

      case TemperatureUnit.KELVIN:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.KELVIN_UNIT_LABEL,
              deviceLanguageStrings.KELVIN_UNIT_ABBREVIATION,
            );
        break;
    }

    return dropdownMenuItemDescriptionHolder;
  }
}
