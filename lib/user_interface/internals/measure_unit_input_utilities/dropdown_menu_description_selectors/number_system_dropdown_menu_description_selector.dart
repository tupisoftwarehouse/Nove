import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/dropdown_menu_description_holder_value_object.dart";
import "package:nove/domain/number_system_converter/number_system.dart";

class NumberSystemDropdownMenuDescriptionSelector {
  NumberSystemDropdownMenuDescriptionSelector._();

  static DropdownMenuDescriptionHolderValueObject
  getNumberSystemDropdownMenuDescription<T>(
    NumberSystem selectedNumberSystem,
    DeviceLanguageStringsValueObject deviceLanguageStrings,
  ) {
    late final DropdownMenuDescriptionHolderValueObject
    dropdownMenuItemDescriptionHolder;

    switch (selectedNumberSystem) {
      case NumberSystem.BINARY:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.BINARY_NUMBER_SYSTEM_LABEL,
              deviceLanguageStrings.BINARY_NUMBER_SYSTEM_ABBREVIATION,
            );

        break;
      case NumberSystem.OCTAL:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.OCTAL_NUMBER_SYSTEM_LABEL,
              deviceLanguageStrings.OCTAL_NUMBER_SYSTEM_ABBREVIATION,
            );

        break;
      case NumberSystem.DECIMAL:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.DECIMAL_NUMBER_SYSTEM_LABEL,
              deviceLanguageStrings.DECIMAL_NUMBER_SYSTEM_ABBREVIATION,
            );

        break;
      case NumberSystem.HEXADECIMAL:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.HEXADECIMAL_NUMBER_SYSTEM_LABEL,
              deviceLanguageStrings.HEXADECIMAL_NUMBER_SYSTEM_ABBREVIATION,
            );

        break;
    }

    return dropdownMenuItemDescriptionHolder;
  }
}
