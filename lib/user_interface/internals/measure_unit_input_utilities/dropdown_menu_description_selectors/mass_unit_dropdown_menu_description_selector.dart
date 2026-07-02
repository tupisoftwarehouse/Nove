import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/dropdown_menu_description_holder_value_object.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";

class MassUnitDropdownMenuDescriptionSelector {
  MassUnitDropdownMenuDescriptionSelector._();

  static DropdownMenuDescriptionHolderValueObject
  getMassUnitDropdownMenuDescription<T>(
    MassUnit selectedMassUnit,
    DeviceLanguageStringsValueObject deviceLanguageStrings,
  ) {
    late final DropdownMenuDescriptionHolderValueObject
    dropdownMenuItemDescriptionHolder;

    switch (selectedMassUnit) {
      case MassUnit.TONNE:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.TONNE_UNIT_LABEL,
              deviceLanguageStrings.TONNE_UNIT_ABBREVIATION,
            );

        break;
      case MassUnit.KILOGRAM:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.KILOGRAM_UNIT_LABEL,
              deviceLanguageStrings.KILOGRAM_UNIT_ABBREVIATION,
            );

        break;
      case MassUnit.GRAM:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.GRAM_UNIT_LABEL,
              deviceLanguageStrings.GRAM_UNIT_ABBREVIATION,
            );

        break;
      case MassUnit.MILLIGRAM:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.MILLIGRAM_UNIT_LABEL,
              deviceLanguageStrings.MILLIGRAM_UNIT_ABBREVIATION,
            );

        break;
      case MassUnit.POUND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.POUND_UNIT_LABEL,
              deviceLanguageStrings.POUND_UNIT_ABBREVIATION,
            );

        break;
      case MassUnit.OUNCE:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.OUNCE_UNIT_LABEL,
              deviceLanguageStrings.OUNCE_UNIT_ABBREVIATION,
            );

        break;
    }

    return dropdownMenuItemDescriptionHolder;
  }
}
