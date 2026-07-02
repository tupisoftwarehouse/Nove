import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/dropdown_menu_description_holder_value_object.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";

class SpeedUnitDropdownMenuDescriptionSelector {
  SpeedUnitDropdownMenuDescriptionSelector._();

  static DropdownMenuDescriptionHolderValueObject
  getSpeedUnitDropdownMenuDescription<T>(
    SpeedUnit selectedSpeedUnit,
    DeviceLanguageStringsValueObject deviceLanguageStrings,
  ) {
    late final DropdownMenuDescriptionHolderValueObject
    dropdownMenuItemDescriptionHolder;

    switch (selectedSpeedUnit) {
      case SpeedUnit.LIGHTSPEED:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.LIGHTSPEED_UNIT_LABEL,
              deviceLanguageStrings.LIGHTSPEED_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.INCH_PER_SECOND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.INCH_PER_SECOND_UNIT_LABEL,
              deviceLanguageStrings.INCH_PER_SECOND_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.KILOMETER_PER_SECOND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.KILOMETER_PER_SECOND_UNIT_LABEL,
              deviceLanguageStrings.KILOMETER_PER_SECOND_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.FOOT_PER_SECOND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.FOOT_PER_SECOND_UNIT_LABEL,
              deviceLanguageStrings.FOOT_PER_SECOND_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.KNOT:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.KNOT_UNIT_LABEL,
              deviceLanguageStrings.KNOT_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.MACH:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.MACH_UNIT_LABEL,
              deviceLanguageStrings.MACH_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.KILOMETER_PER_HOUR:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.KILOMETER_PER_HOUR_UNIT_LABEL,
              deviceLanguageStrings.KILOMETER_PER_HOUR_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.METER_PER_SECOND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.METER_PER_SECOND_UNIT_LABEL,
              deviceLanguageStrings.METER_PER_SECOND_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.MILE_PER_SECOND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.MILE_PER_SECOND_UNIT_LABEL,
              deviceLanguageStrings.MILE_PER_SECOND_UNIT_ABBREVIATION,
            );

        break;
      case SpeedUnit.MILE_PER_HOUR:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.MILE_PER_HOUR_UNIT_LABEL,
              deviceLanguageStrings.MILE_PER_HOUR_UNIT_ABBREVIATION,
            );

        break;
    }

    return dropdownMenuItemDescriptionHolder;
  }
}
