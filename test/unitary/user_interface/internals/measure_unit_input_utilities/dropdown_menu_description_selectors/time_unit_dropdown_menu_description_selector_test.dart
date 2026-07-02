import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/time_unit_dropdown_menu_description_selector.dart";

void main() {
  group("Test \"TimeUnitDropdownMenuDescriptionSelector\" Class", () {
    test(
      "Test If Method \"getTimeUnitDropdownMenuDescription\" Returns \"DropdownMenuDescriptionEntity\" Of Corresponding Time Unit",
      () {
        final secondInstance =
            TimeUnitDropdownMenuDescriptionSelector.getTimeUnitDropdownMenuDescription(
              TimeUnit.SECOND,
              APPLICATION_LANGUAGE,
            );
        final millisecondInstance =
            TimeUnitDropdownMenuDescriptionSelector.getTimeUnitDropdownMenuDescription(
              TimeUnit.MILLISECOND,
              APPLICATION_LANGUAGE,
            );
        final minuteInstance =
            TimeUnitDropdownMenuDescriptionSelector.getTimeUnitDropdownMenuDescription(
              TimeUnit.MINUTE,
              APPLICATION_LANGUAGE,
            );
        final hourInstance =
            TimeUnitDropdownMenuDescriptionSelector.getTimeUnitDropdownMenuDescription(
              TimeUnit.HOUR,
              APPLICATION_LANGUAGE,
            );
        final dayInstance =
            TimeUnitDropdownMenuDescriptionSelector.getTimeUnitDropdownMenuDescription(
              TimeUnit.DAY,
              APPLICATION_LANGUAGE,
            );
        final weekInstance =
            TimeUnitDropdownMenuDescriptionSelector.getTimeUnitDropdownMenuDescription(
              TimeUnit.WEEK,
              APPLICATION_LANGUAGE,
            );

        final yearInstance =
            TimeUnitDropdownMenuDescriptionSelector.getTimeUnitDropdownMenuDescription(
              TimeUnit.YEAR,
              APPLICATION_LANGUAGE,
            );

        expect(secondInstance.label, APPLICATION_LANGUAGE.SECOND_UNIT_LABEL);
        expect(
          secondInstance.abbreviation,
          APPLICATION_LANGUAGE.SECOND_UNIT_ABBREVIATION,
        );
        expect(
          millisecondInstance.label,
          APPLICATION_LANGUAGE.MILLISECOND_UNIT_LABEL,
        );
        expect(
          millisecondInstance.abbreviation,
          APPLICATION_LANGUAGE.MILLISECOND_UNIT_ABBREVIATION,
        );
        expect(minuteInstance.label, APPLICATION_LANGUAGE.MINUTE_UNIT_LABEL);
        expect(
          minuteInstance.abbreviation,
          APPLICATION_LANGUAGE.MINUTE_UNIT_ABBREVIATION,
        );
        expect(hourInstance.label, APPLICATION_LANGUAGE.HOUR_UNIT_LABEL);
        expect(
          hourInstance.abbreviation,
          APPLICATION_LANGUAGE.HOUR_UNIT_ABBREVIATION,
        );
        expect(dayInstance.label, APPLICATION_LANGUAGE.DAY_UNIT_LABEL);
        expect(
          dayInstance.abbreviation,
          APPLICATION_LANGUAGE.DAY_UNIT_ABBREVIATION,
        );
        expect(weekInstance.label, APPLICATION_LANGUAGE.WEEK_UNIT_LABEL);
        expect(
          weekInstance.abbreviation,
          APPLICATION_LANGUAGE.WEEK_UNIT_ABBREVIATION,
        );
        expect(yearInstance.label, APPLICATION_LANGUAGE.YEAR_UNIT_LABEL);
        expect(
          yearInstance.abbreviation,
          APPLICATION_LANGUAGE.YEAR_UNIT_ABBREVIATION,
        );
      },
    );
  });
}
