import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/dropdown_menu_description_holder_value_object.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";

class LengthUnitDropdownMenuDescriptionSelector {
  LengthUnitDropdownMenuDescriptionSelector._();

  static DropdownMenuDescriptionHolderValueObject
  getLengthUnitDropdownMenuDescription<T>(
    LengthUnit selectedLengthUnit,
    DeviceLanguageStringsValueObject deviceLanguageStrings,
  ) {
    late final DropdownMenuDescriptionHolderValueObject
    dropdownMenuItemDescriptionHolder;

    switch (selectedLengthUnit) {
      case LengthUnit.KILOMETER:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.KILOMETER_UNIT_LABEL,
              deviceLanguageStrings.KILOMETER_UNIT_ABBREVIATION,
            );

        break;
      case LengthUnit.METER:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.METER_UNIT_LABEL,
              deviceLanguageStrings.METER_UNIT_ABBREVIATION,
            );

        break;
      case LengthUnit.CENTIMETER:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.CENTIMETER_UNIT_LABEL,
              deviceLanguageStrings.CENTIMETER_UNIT_ABBREVIATION,
            );

        break;
      case LengthUnit.MILLIMETER:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.MILLIMETER_UNIT_LABEL,
              deviceLanguageStrings.MILLIMETER_UNIT_ABBREVIATION,
            );

        break;
      case LengthUnit.MILE:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.MILE_UNIT_LABEL,
              deviceLanguageStrings.MILE_UNIT_ABBREVIATION,
            );

        break;
      case LengthUnit.YARD:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.YARD_UNIT_LABEL,
              deviceLanguageStrings.YARD_UNIT_ABBREVIATION,
            );

        break;
      case LengthUnit.FOOT:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.FOOT_UNIT_LABEL,
              deviceLanguageStrings.FOOT_UNIT_ABBREVIATION,
            );

        break;
      case LengthUnit.INCH:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.INCH_UNIT_LABEL,
              deviceLanguageStrings.INCH_UNIT_ABBREVIATION,
            );

        break;
      case LengthUnit.NAUTICAL_MILE:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.NAUTICAL_MILE_UNIT_LABEL,
              deviceLanguageStrings.NAUTICAL_MILE_UNIT_ABBREVIATION,
            );

        break;
    }

    return dropdownMenuItemDescriptionHolder;
  }
}
