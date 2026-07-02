import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/length_unit_dropdown_menu_description_selector.dart";

void main() {
  group("Test \"LengthUnitDropdownMenuDescriptionSelector\" Class", () {
    test(
      "Test If Method \"getLengthUnitDropdownMenuDescription\" Returns \"DropdownMenuDescriptionEntity\" Of Corresponding Length Unit",
      () {
        final kilometerInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.KILOMETER,
              APPLICATION_LANGUAGE,
            );
        final meterInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.METER,
              APPLICATION_LANGUAGE,
            );
        final centimeterInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.CENTIMETER,
              APPLICATION_LANGUAGE,
            );
        final millimeterInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.MILLIMETER,
              APPLICATION_LANGUAGE,
            );
        final mileInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.MILE,
              APPLICATION_LANGUAGE,
            );
        final yardInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.YARD,
              APPLICATION_LANGUAGE,
            );
        final footInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.FOOT,
              APPLICATION_LANGUAGE,
            );
        final inchInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.INCH,
              APPLICATION_LANGUAGE,
            );
        final nauticalMileInstance =
            LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
              LengthUnit.NAUTICAL_MILE,
              APPLICATION_LANGUAGE,
            );

        expect(
          kilometerInstance.label,
          APPLICATION_LANGUAGE.KILOMETER_UNIT_LABEL,
        );
        expect(
          kilometerInstance.abbreviation,
          APPLICATION_LANGUAGE.KILOMETER_UNIT_ABBREVIATION,
        );
        expect(meterInstance.label, APPLICATION_LANGUAGE.METER_UNIT_LABEL);
        expect(
          meterInstance.abbreviation,
          APPLICATION_LANGUAGE.METER_UNIT_ABBREVIATION,
        );
        expect(
          centimeterInstance.label,
          APPLICATION_LANGUAGE.CENTIMETER_UNIT_LABEL,
        );
        expect(
          centimeterInstance.abbreviation,
          APPLICATION_LANGUAGE.CENTIMETER_UNIT_ABBREVIATION,
        );
        expect(
          millimeterInstance.label,
          APPLICATION_LANGUAGE.MILLIMETER_UNIT_LABEL,
        );
        expect(
          millimeterInstance.abbreviation,
          APPLICATION_LANGUAGE.MILLIMETER_UNIT_ABBREVIATION,
        );
        expect(mileInstance.label, APPLICATION_LANGUAGE.MILE_UNIT_LABEL);
        expect(
          mileInstance.abbreviation,
          APPLICATION_LANGUAGE.MILE_UNIT_ABBREVIATION,
        );
        expect(yardInstance.label, APPLICATION_LANGUAGE.YARD_UNIT_LABEL);
        expect(
          yardInstance.abbreviation,
          APPLICATION_LANGUAGE.YARD_UNIT_ABBREVIATION,
        );
        expect(footInstance.label, APPLICATION_LANGUAGE.FOOT_UNIT_LABEL);
        expect(
          footInstance.abbreviation,
          APPLICATION_LANGUAGE.FOOT_UNIT_ABBREVIATION,
        );
        expect(inchInstance.label, APPLICATION_LANGUAGE.INCH_UNIT_LABEL);
        expect(
          inchInstance.abbreviation,
          APPLICATION_LANGUAGE.INCH_UNIT_ABBREVIATION,
        );
        expect(
          nauticalMileInstance.label,
          APPLICATION_LANGUAGE.NAUTICAL_MILE_UNIT_LABEL,
        );
        expect(
          nauticalMileInstance.abbreviation,
          APPLICATION_LANGUAGE.NAUTICAL_MILE_UNIT_ABBREVIATION,
        );
      },
    );
  });
}
