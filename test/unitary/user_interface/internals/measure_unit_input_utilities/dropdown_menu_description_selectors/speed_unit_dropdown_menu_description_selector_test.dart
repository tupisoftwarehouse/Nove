import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/speed_unit_dropdown_menu_description_selector.dart";

void main() {
  group("Test \"SpeedUnitDropdownMenuDescriptionSelector\" Class", () {
    test(
      "Test If Method \"getSpeedUnitDropdownMenuDescription\" Returns \"DropdownMenuDescriptionEntity\" Of Corresponding Speed Unit",
      () {
        final lightspeedInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.LIGHTSPEED,
              APPLICATION_LANGUAGE,
            );
        final inchPerSecondInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.INCH_PER_SECOND,
              APPLICATION_LANGUAGE,
            );
        final kilometerPerSecondInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.KILOMETER_PER_SECOND,
              APPLICATION_LANGUAGE,
            );
        final footPerSecondInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.FOOT_PER_SECOND,
              APPLICATION_LANGUAGE,
            );
        final knotInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.KNOT,
              APPLICATION_LANGUAGE,
            );
        final machInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.MACH,
              APPLICATION_LANGUAGE,
            );
        final kilometerPerHourInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.KILOMETER_PER_HOUR,
              APPLICATION_LANGUAGE,
            );
        final meterPerSecondInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.METER_PER_SECOND,
              APPLICATION_LANGUAGE,
            );
        final milePerSecondInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.MILE_PER_SECOND,
              APPLICATION_LANGUAGE,
            );
        final milePerHourInstance =
            SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
              SpeedUnit.MILE_PER_HOUR,
              APPLICATION_LANGUAGE,
            );

        expect(
          lightspeedInstance.label,
          APPLICATION_LANGUAGE.LIGHTSPEED_UNIT_LABEL,
        );
        expect(
          lightspeedInstance.abbreviation,
          APPLICATION_LANGUAGE.LIGHTSPEED_UNIT_ABBREVIATION,
        );
        expect(
          inchPerSecondInstance.label,
          APPLICATION_LANGUAGE.INCH_PER_SECOND_UNIT_LABEL,
        );
        expect(
          inchPerSecondInstance.abbreviation,
          APPLICATION_LANGUAGE.INCH_PER_SECOND_UNIT_ABBREVIATION,
        );
        expect(
          kilometerPerSecondInstance.label,
          APPLICATION_LANGUAGE.KILOMETER_PER_SECOND_UNIT_LABEL,
        );
        expect(
          kilometerPerSecondInstance.abbreviation,
          APPLICATION_LANGUAGE.KILOMETER_PER_SECOND_UNIT_ABBREVIATION,
        );
        expect(
          footPerSecondInstance.label,
          APPLICATION_LANGUAGE.FOOT_PER_SECOND_UNIT_LABEL,
        );
        expect(
          footPerSecondInstance.abbreviation,
          APPLICATION_LANGUAGE.FOOT_PER_SECOND_UNIT_ABBREVIATION,
        );
        expect(knotInstance.label, APPLICATION_LANGUAGE.KNOT_UNIT_LABEL);
        expect(
          knotInstance.abbreviation,
          APPLICATION_LANGUAGE.KNOT_UNIT_ABBREVIATION,
        );
        expect(machInstance.label, APPLICATION_LANGUAGE.MACH_UNIT_LABEL);
        expect(
          machInstance.abbreviation,
          APPLICATION_LANGUAGE.MACH_UNIT_ABBREVIATION,
        );
        expect(
          kilometerPerHourInstance.label,
          APPLICATION_LANGUAGE.KILOMETER_PER_HOUR_UNIT_LABEL,
        );
        expect(
          kilometerPerHourInstance.abbreviation,
          APPLICATION_LANGUAGE.KILOMETER_PER_HOUR_UNIT_ABBREVIATION,
        );
        expect(
          meterPerSecondInstance.label,
          APPLICATION_LANGUAGE.METER_PER_SECOND_UNIT_LABEL,
        );
        expect(
          meterPerSecondInstance.abbreviation,
          APPLICATION_LANGUAGE.METER_PER_SECOND_UNIT_ABBREVIATION,
        );
        expect(
          milePerSecondInstance.label,
          APPLICATION_LANGUAGE.MILE_PER_SECOND_UNIT_LABEL,
        );
        expect(
          milePerSecondInstance.abbreviation,
          APPLICATION_LANGUAGE.MILE_PER_SECOND_UNIT_ABBREVIATION,
        );
        expect(
          milePerHourInstance.label,
          APPLICATION_LANGUAGE.MILE_PER_HOUR_UNIT_LABEL,
        );
        expect(
          milePerHourInstance.abbreviation,
          APPLICATION_LANGUAGE.MILE_PER_HOUR_UNIT_ABBREVIATION,
        );
      },
    );
  });
}
