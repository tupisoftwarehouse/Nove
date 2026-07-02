import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/number_system_dropdown_menu_description_selector.dart";

void main() {
  group("Test \"NumberSystemDropdownMenuDescriptionSelector\" Class", () {
    test(
      "Test If Method \"getNumberSystemDropdownMenuDescription\" Returns \"DropdownMenuDescriptionEntity\" Of Corresponding Number System",
      () {
        final decimalInstance =
            NumberSystemDropdownMenuDescriptionSelector.getNumberSystemDropdownMenuDescription(
              NumberSystem.DECIMAL,
              APPLICATION_LANGUAGE,
            );
        final binaryInstance =
            NumberSystemDropdownMenuDescriptionSelector.getNumberSystemDropdownMenuDescription(
              NumberSystem.BINARY,
              APPLICATION_LANGUAGE,
            );
        final octalInstance =
            NumberSystemDropdownMenuDescriptionSelector.getNumberSystemDropdownMenuDescription(
              NumberSystem.OCTAL,
              APPLICATION_LANGUAGE,
            );
        final hexadecimalInstance =
            NumberSystemDropdownMenuDescriptionSelector.getNumberSystemDropdownMenuDescription(
              NumberSystem.HEXADECIMAL,
              APPLICATION_LANGUAGE,
            );

        expect(
          decimalInstance.label,
          APPLICATION_LANGUAGE.DECIMAL_NUMBER_SYSTEM_LABEL,
        );
        expect(
          decimalInstance.abbreviation,
          APPLICATION_LANGUAGE.DECIMAL_NUMBER_SYSTEM_ABBREVIATION,
        );
        expect(
          binaryInstance.label,
          APPLICATION_LANGUAGE.BINARY_NUMBER_SYSTEM_LABEL,
        );
        expect(
          binaryInstance.abbreviation,
          APPLICATION_LANGUAGE.BINARY_NUMBER_SYSTEM_ABBREVIATION,
        );
        expect(
          octalInstance.label,
          APPLICATION_LANGUAGE.OCTAL_NUMBER_SYSTEM_LABEL,
        );
        expect(
          octalInstance.abbreviation,
          APPLICATION_LANGUAGE.OCTAL_NUMBER_SYSTEM_ABBREVIATION,
        );
        expect(
          hexadecimalInstance.label,
          APPLICATION_LANGUAGE.HEXADECIMAL_NUMBER_SYSTEM_LABEL,
        );
        expect(
          hexadecimalInstance.abbreviation,
          APPLICATION_LANGUAGE.HEXADECIMAL_NUMBER_SYSTEM_ABBREVIATION,
        );
      },
    );
  });
}
