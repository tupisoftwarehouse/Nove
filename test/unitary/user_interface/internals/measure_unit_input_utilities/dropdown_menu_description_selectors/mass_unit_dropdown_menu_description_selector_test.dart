import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/mass_unit_dropdown_menu_description_selector.dart";

void main() {
  group("Test \"MassUnitDropdownMenuDescriptionSelector\" Class", () {
    test(
      "Test If Method \"getMassUnitDropdownMenuDescription\" Returns \"DropdownMenuDescriptionEntity\" Of Corresponding Mass Unit",
      () {
        final kilogramInstance =
            MassUnitDropdownMenuDescriptionSelector.getMassUnitDropdownMenuDescription(
              MassUnit.KILOGRAM,
              APPLICATION_LANGUAGE,
            );
        final gramInstance =
            MassUnitDropdownMenuDescriptionSelector.getMassUnitDropdownMenuDescription(
              MassUnit.GRAM,
              APPLICATION_LANGUAGE,
            );
        final milligramInstance =
            MassUnitDropdownMenuDescriptionSelector.getMassUnitDropdownMenuDescription(
              MassUnit.MILLIGRAM,
              APPLICATION_LANGUAGE,
            );
        final poundInstance =
            MassUnitDropdownMenuDescriptionSelector.getMassUnitDropdownMenuDescription(
              MassUnit.POUND,
              APPLICATION_LANGUAGE,
            );
        final ounceInstance =
            MassUnitDropdownMenuDescriptionSelector.getMassUnitDropdownMenuDescription(
              MassUnit.OUNCE,
              APPLICATION_LANGUAGE,
            );

        expect(
          kilogramInstance.label,
          APPLICATION_LANGUAGE.KILOGRAM_UNIT_LABEL,
        );
        expect(
          kilogramInstance.abbreviation,
          APPLICATION_LANGUAGE.KILOGRAM_UNIT_ABBREVIATION,
        );
        expect(gramInstance.label, APPLICATION_LANGUAGE.GRAM_UNIT_LABEL);
        expect(
          gramInstance.abbreviation,
          APPLICATION_LANGUAGE.GRAM_UNIT_ABBREVIATION,
        );
        expect(
          milligramInstance.label,
          APPLICATION_LANGUAGE.MILLIGRAM_UNIT_LABEL,
        );
        expect(
          milligramInstance.abbreviation,
          APPLICATION_LANGUAGE.MILLIGRAM_UNIT_ABBREVIATION,
        );
        expect(poundInstance.label, APPLICATION_LANGUAGE.POUND_UNIT_LABEL);
        expect(
          poundInstance.abbreviation,
          APPLICATION_LANGUAGE.POUND_UNIT_ABBREVIATION,
        );
        expect(ounceInstance.label, APPLICATION_LANGUAGE.OUNCE_UNIT_LABEL);
        expect(
          ounceInstance.abbreviation,
          APPLICATION_LANGUAGE.OUNCE_UNIT_ABBREVIATION,
        );
      },
    );
  });
}
