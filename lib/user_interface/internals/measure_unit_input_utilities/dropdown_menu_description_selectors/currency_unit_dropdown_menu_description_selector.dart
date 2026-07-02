import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/dropdown_menu_description_holder_value_object.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";

class CurrencyUnitDropdownMenuDescriptionSelector {
  CurrencyUnitDropdownMenuDescriptionSelector._();

  static DropdownMenuDescriptionHolderValueObject
  getCurrencyUnitDropdownMenuDescription<T>(
    CurrencyUnit selectedCurrencyUnit,
    DeviceLanguageStringsValueObject deviceLanguageStrings,
  ) {
    late final DropdownMenuDescriptionHolderValueObject
    dropdownMenuItemDescriptionHolder;

    switch (selectedCurrencyUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.UNITED_STATES_DOLLAR_UNIT_LABEL,
              deviceLanguageStrings.UNITED_STATES_DOLLAR_UNIT_ABBREVIATION,
            );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.UNITED_KINGDOM_POUND_UNIT_LABEL,
              deviceLanguageStrings.UNITED_KINGDOM_POUND_UNIT_ABBREVIATION,
            );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SWITZERLAND_FRANC_UNIT_LABEL,
              deviceLanguageStrings.SWITZERLAND_FRANC_UNIT_ABBREVIATION,
            );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.AUSTRALIA_DOLLAR_UNIT_LABEL,
              deviceLanguageStrings.AUSTRALIA_DOLLAR_UNIT_ABBREVIATION,
            );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.BRAZIL_REAL_UNIT_LABEL,
              deviceLanguageStrings.BRAZIL_REAL_UNIT_ABBREVIATION,
            );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.CANADA_DOLLAR_UNIT_LABEL,
              deviceLanguageStrings.CANADA_DOLLAR_UNIT_ABBREVIATION,
            );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.NEW_ZEALAND_DOLLAR_UNIT_LABEL,
              deviceLanguageStrings.NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION,
            );

        break;
      case CurrencyUnit.EURO:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.EURO_UNIT_LABEL,
              deviceLanguageStrings.EURO_UNIT_ABBREVIATION,
            );

        break;
    }

    return dropdownMenuItemDescriptionHolder;
  }
}
