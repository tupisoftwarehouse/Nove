import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/dropdown_menu_description_holder_value_object.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";

class AreaUnitDropdownMenuDescriptionSelector {
  AreaUnitDropdownMenuDescriptionSelector._();

  static DropdownMenuDescriptionHolderValueObject
  getAreaUnitDropdownMenuDescription<T>(
    AreaUnit selectedAreaUnit,
    DeviceLanguageStringsValueObject deviceLanguageStrings,
  ) {
    late final DropdownMenuDescriptionHolderValueObject
    dropdownMenuItemDescriptionHolder;

    switch (selectedAreaUnit) {
      case AreaUnit.ACRE:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.ACRE_UNIT_LABEL,
              deviceLanguageStrings.ACRE_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.SQUARE_KILOMETER:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SQUARE_KILOMETER_UNIT_LABEL,
              deviceLanguageStrings.SQUARE_KILOMETER_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.SQUARE_METER:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SQUARE_METER_UNIT_LABEL,
              deviceLanguageStrings.SQUARE_METER_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.SQUARE_CENTIMETER:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SQUARE_CENTIMETER_UNIT_LABEL,
              deviceLanguageStrings.SQUARE_CENTIMETER_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.SQUARE_MILLIMETER:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SQUARE_MILLIMETER_UNIT_LABEL,
              deviceLanguageStrings.SQUARE_MILLIMETER_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.SQUARE_MILE:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SQUARE_MILE_UNIT_LABEL,
              deviceLanguageStrings.SQUARE_MILE_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.SQUARE_YARD:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SQUARE_YARD_UNIT_LABEL,
              deviceLanguageStrings.SQUARE_YARD_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.SQUARE_FOOT:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SQUARE_FOOT_UNIT_LABEL,
              deviceLanguageStrings.SQUARE_FOOT_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.SQUARE_INCH:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SQUARE_INCH_UNIT_LABEL,
              deviceLanguageStrings.SQUARE_INCH_UNIT_ABBREVIATION,
            );

        break;
      case AreaUnit.HECTARE:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.HECTARE_UNIT_LABEL,
              deviceLanguageStrings.HECTARE_UNIT_ABBREVIATION,
            );

        break;
    }

    return dropdownMenuItemDescriptionHolder;
  }
}
