import "package:nove/user_interface/internals/value_objects/device_language_strings_value_objects/abstract/device_language_strings_value_object.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/dropdown_menu_description_holder_value_object.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";

class TimeUnitDropdownMenuDescriptionSelector {
  TimeUnitDropdownMenuDescriptionSelector._();

  static DropdownMenuDescriptionHolderValueObject
  getTimeUnitDropdownMenuDescription<T>(
    TimeUnit selectedTimeUnit,
    DeviceLanguageStringsValueObject deviceLanguageStrings,
  ) {
    late final DropdownMenuDescriptionHolderValueObject
    dropdownMenuItemDescriptionHolder;

    switch (selectedTimeUnit) {
      case TimeUnit.YEAR:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.YEAR_UNIT_LABEL,
              deviceLanguageStrings.YEAR_UNIT_ABBREVIATION,
            );

        break;
      case TimeUnit.WEEK:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.WEEK_UNIT_LABEL,
              deviceLanguageStrings.WEEK_UNIT_ABBREVIATION,
            );

        break;
      case TimeUnit.DAY:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.DAY_UNIT_LABEL,
              deviceLanguageStrings.DAY_UNIT_ABBREVIATION,
            );

        break;
      case TimeUnit.HOUR:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.HOUR_UNIT_LABEL,
              deviceLanguageStrings.HOUR_UNIT_ABBREVIATION,
            );

        break;
      case TimeUnit.MINUTE:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.MINUTE_UNIT_LABEL,
              deviceLanguageStrings.MINUTE_UNIT_ABBREVIATION,
            );

        break;
      case TimeUnit.SECOND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.SECOND_UNIT_LABEL,
              deviceLanguageStrings.SECOND_UNIT_ABBREVIATION,
            );

        break;
      case TimeUnit.MILLISECOND:
        dropdownMenuItemDescriptionHolder =
            DropdownMenuDescriptionHolderValueObject(
              deviceLanguageStrings.MILLISECOND_UNIT_LABEL,
              deviceLanguageStrings.MILLISECOND_UNIT_ABBREVIATION,
            );

        break;
    }

    return dropdownMenuItemDescriptionHolder;
  }
}
