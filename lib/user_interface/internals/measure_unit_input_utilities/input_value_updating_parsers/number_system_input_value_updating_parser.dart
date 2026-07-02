import "package:flutter/widgets.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/binary_number_system_entity.dart";
import "package:nove/domain/number_system_converter/decimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/hexadecimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/domain/number_system_converter/octal_number_system_entity.dart";

class NumberSystemInputValueUpdatingParser {
  NumberSystemInputValueUpdatingParser._();

  static void updateNumberSystemValue(
    TextEditingController controller,
    NumberSystem selectedNumberSystem,
    void Function(NumberSystemEntity updatedNumberSystem) setNumberSystemValue,
  ) {
    try {
      late final String parsedUpdatedValue;
      late final NumberSystemEntity updatedNumberSystem;

      switch (selectedNumberSystem) {
        case NumberSystem.BINARY:
          parsedUpdatedValue = int.parse(
            controller.text,
            radix: BINARY_NUMBER_SYSTEM_BASE,
          ).toString();

          updatedNumberSystem = BinaryNumberSystemEntity(parsedUpdatedValue);

          break;
        case NumberSystem.OCTAL:
          parsedUpdatedValue = int.parse(
            controller.text,
            radix: OCTAL_NUMBER_SYSTEM_BASE,
          ).toString();

          updatedNumberSystem = OctalNumberSystemEntity(parsedUpdatedValue);

          break;
        case NumberSystem.DECIMAL:
          parsedUpdatedValue = int.parse(
            controller.text,
            radix: DECIMAL_NUMBER_SYSTEM_BASE,
          ).toString();

          updatedNumberSystem = DecimalNumberSystemEntity(parsedUpdatedValue);

          break;
        case NumberSystem.HEXADECIMAL:
          parsedUpdatedValue = int.parse(
            controller.text,
            radix: HEXADECIMAL_NUMBER_SYSTEM_BASE,
          ).toString();

          updatedNumberSystem = HexadecimalNumberSystemEntity(
            parsedUpdatedValue,
          );

          break;
      }

      setNumberSystemValue(updatedNumberSystem);
    } catch (_) {
      controller.text = controller.text.substring(
        0,
        controller.text.length - 1,
      );
    }
  }
}
