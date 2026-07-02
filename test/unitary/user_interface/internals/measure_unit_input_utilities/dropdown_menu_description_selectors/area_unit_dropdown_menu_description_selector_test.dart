import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/area_unit_dropdown_menu_description_selector.dart";

void main() {
  group("Test \"AreaUnitDropdownMenuDescriptionSelector\" Class", () {
    test(
      "Test If Method \"getAreaUnitDropdownMenuDescription\" Returns \"DropdownMenuDescriptionEntity\" Of Corresponding Area Unit",
      () {
        final acreInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.ACRE,
              APPLICATION_LANGUAGE,
            );
        final squareKilometerInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.SQUARE_KILOMETER,
              APPLICATION_LANGUAGE,
            );
        final squareMeterInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.SQUARE_METER,
              APPLICATION_LANGUAGE,
            );
        final squareCentimeterInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.SQUARE_CENTIMETER,
              APPLICATION_LANGUAGE,
            );
        final squareMillimeterInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.SQUARE_MILLIMETER,
              APPLICATION_LANGUAGE,
            );
        final squareMileInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.SQUARE_MILE,
              APPLICATION_LANGUAGE,
            );
        final yardInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.SQUARE_YARD,
              APPLICATION_LANGUAGE,
            );
        final squareFootInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.SQUARE_FOOT,
              APPLICATION_LANGUAGE,
            );
        final squareInchInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.SQUARE_INCH,
              APPLICATION_LANGUAGE,
            );
        final hectareInstance =
            AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
              AreaUnit.HECTARE,
              APPLICATION_LANGUAGE,
            );

        expect(acreInstance.label, APPLICATION_LANGUAGE.ACRE_UNIT_LABEL);
        expect(
          acreInstance.abbreviation,
          APPLICATION_LANGUAGE.ACRE_UNIT_ABBREVIATION,
        );
        expect(
          squareKilometerInstance.label,
          APPLICATION_LANGUAGE.SQUARE_KILOMETER_UNIT_LABEL,
        );
        expect(
          squareKilometerInstance.abbreviation,
          APPLICATION_LANGUAGE.SQUARE_KILOMETER_UNIT_ABBREVIATION,
        );
        expect(
          squareMeterInstance.label,
          APPLICATION_LANGUAGE.SQUARE_METER_UNIT_LABEL,
        );
        expect(
          squareMeterInstance.label,
          APPLICATION_LANGUAGE.SQUARE_METER_UNIT_LABEL,
        );
        expect(
          squareCentimeterInstance.label,
          APPLICATION_LANGUAGE.SQUARE_CENTIMETER_UNIT_LABEL,
        );
        expect(
          squareCentimeterInstance.abbreviation,
          APPLICATION_LANGUAGE.SQUARE_CENTIMETER_UNIT_ABBREVIATION,
        );
        expect(
          squareMillimeterInstance.label,
          APPLICATION_LANGUAGE.SQUARE_MILLIMETER_UNIT_LABEL,
        );
        expect(
          squareMillimeterInstance.abbreviation,
          APPLICATION_LANGUAGE.SQUARE_MILLIMETER_UNIT_ABBREVIATION,
        );
        expect(
          squareMileInstance.label,
          APPLICATION_LANGUAGE.SQUARE_MILE_UNIT_LABEL,
        );
        expect(
          squareMileInstance.abbreviation,
          APPLICATION_LANGUAGE.SQUARE_MILE_UNIT_ABBREVIATION,
        );
        expect(yardInstance.label, APPLICATION_LANGUAGE.SQUARE_YARD_UNIT_LABEL);
        expect(
          yardInstance.abbreviation,
          APPLICATION_LANGUAGE.SQUARE_YARD_UNIT_ABBREVIATION,
        );
        expect(
          squareFootInstance.label,
          APPLICATION_LANGUAGE.SQUARE_FOOT_UNIT_LABEL,
        );
        expect(
          squareFootInstance.abbreviation,
          APPLICATION_LANGUAGE.SQUARE_FOOT_UNIT_ABBREVIATION,
        );
        expect(
          squareInchInstance.label,
          APPLICATION_LANGUAGE.SQUARE_INCH_UNIT_LABEL,
        );
        expect(
          squareInchInstance.abbreviation,
          APPLICATION_LANGUAGE.SQUARE_INCH_UNIT_ABBREVIATION,
        );
        expect(hectareInstance.label, APPLICATION_LANGUAGE.HECTARE_UNIT_LABEL);
        expect(
          hectareInstance.abbreviation,
          APPLICATION_LANGUAGE.HECTARE_UNIT_ABBREVIATION,
        );
      },
    );
  });
}
