import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/binary_number_system_entity.dart";
import "package:nove/domain/number_system_converter/decimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/hexadecimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/octal_number_system_entity.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/number_system_input_value_updating_parser.dart";

void main() {
  group("Test \"NumberSystemInputValueUpdatingParser\" Class", () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController(text: NUMBER_SYSTEM_VALUE);
    });

    test(
      "Test If Method \"updateNumberSystemValue\" Updates Number System Value On Controller",
      () {
        late final BinaryNumberSystemEntity updatedBinaryInstance;
        late final DecimalNumberSystemEntity updatedDecimalInstance;
        late final HexadecimalNumberSystemEntity updatedHexInstance;
        late final OctalNumberSystemEntity updatedOctalInstance;

        NumberSystemInputValueUpdatingParser.updateNumberSystemValue(
          controller,
          NumberSystem.BINARY,
          (updatedNumberSystem) {
            updatedBinaryInstance =
                updatedNumberSystem as BinaryNumberSystemEntity;
          },
        );

        NumberSystemInputValueUpdatingParser.updateNumberSystemValue(
          controller,
          NumberSystem.DECIMAL,
          (updatedNumberSystem) {
            updatedDecimalInstance =
                updatedNumberSystem as DecimalNumberSystemEntity;
          },
        );

        NumberSystemInputValueUpdatingParser.updateNumberSystemValue(
          controller,
          NumberSystem.HEXADECIMAL,
          (updatedNumberSystem) {
            updatedHexInstance =
                updatedNumberSystem as HexadecimalNumberSystemEntity;
          },
        );

        NumberSystemInputValueUpdatingParser.updateNumberSystemValue(
          controller,
          NumberSystem.OCTAL,
          (updatedNumberSystem) {
            updatedOctalInstance =
                updatedNumberSystem as OctalNumberSystemEntity;
          },
        );

        expect(updatedBinaryInstance.value, NUMBER_SYSTEM_VALUE);
        expect(updatedBinaryInstance.measureUnit, NumberSystem.BINARY);

        expect(updatedDecimalInstance.value, NUMBER_SYSTEM_VALUE);
        expect(updatedDecimalInstance.measureUnit, NumberSystem.DECIMAL);

        expect(updatedHexInstance.value, NUMBER_SYSTEM_VALUE);
        expect(updatedHexInstance.measureUnit, NumberSystem.HEXADECIMAL);

        expect(updatedOctalInstance.value, NUMBER_SYSTEM_VALUE);
        expect(updatedOctalInstance.measureUnit, NumberSystem.OCTAL);
      },
    );

    test(
      "Test If Method \"updateNumberSystemValue\" Removes Last Character If \"updatedInputValue\" Casting Fails With Value Not Empty And Last Character Is Not Allowed",
      () {
        controller.text = NUMBER_SYSTEM_VALUE + NON_NUMERIC_CHARACTER;

        NumberSystemInputValueUpdatingParser.updateNumberSystemValue(
          controller,
          NumberSystem.BINARY,
          (updatedNumberSystem) {},
        );

        expect(controller.text, NUMBER_SYSTEM_VALUE);
      },
    );
  });
}
