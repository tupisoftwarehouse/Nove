import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/binary_number_system_entity.dart";
import "package:nove/domain/number_system_converter/decimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/hexadecimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/octal_number_system_entity.dart";

void main() {
  group("Test \"HexadecimalNumberSystemEntity\" Entity", () {
    test(
      "Test If Method \"convertTo\" Converts To Number System Value But Keeping Current Number System",
      () {
        final instance = HexadecimalNumberSystemEntity(
          ZEROED_NUMBER_SYSTEM_VALUE,
        );
        final binaryNumberSystem = BinaryNumberSystemEntity(
          NUMBER_SYSTEM_VALUE,
        );
        final octalNumberSystem = OctalNumberSystemEntity(NUMBER_SYSTEM_VALUE);
        final decimalNumberSystem = DecimalNumberSystemEntity(
          NUMBER_SYSTEM_VALUE,
        );
        final hexadecimalNumberSystem = HexadecimalNumberSystemEntity(
          NUMBER_SYSTEM_VALUE,
        );
        late String parsedValue;

        instance.convertTo(binaryNumberSystem);

        parsedValue = int.parse(
          NUMBER_SYSTEM_VALUE,
          radix: BINARY_NUMBER_SYSTEM_BASE,
        ).toRadixString(HEXADECIMAL_NUMBER_SYSTEM_BASE);

        expect(instance.value, parsedValue);

        instance.convertTo(octalNumberSystem);

        parsedValue = int.parse(
          NUMBER_SYSTEM_VALUE,
          radix: OCTAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(HEXADECIMAL_NUMBER_SYSTEM_BASE);

        expect(instance.value, parsedValue);

        instance.convertTo(decimalNumberSystem);

        parsedValue = int.parse(
          NUMBER_SYSTEM_VALUE,
          radix: DECIMAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(HEXADECIMAL_NUMBER_SYSTEM_BASE);

        expect(instance.value, parsedValue);

        instance.convertTo(hexadecimalNumberSystem);

        parsedValue = int.parse(
          NUMBER_SYSTEM_VALUE,
          radix: HEXADECIMAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(HEXADECIMAL_NUMBER_SYSTEM_BASE);

        expect(instance.value, parsedValue);
      },
    );
  });
}
