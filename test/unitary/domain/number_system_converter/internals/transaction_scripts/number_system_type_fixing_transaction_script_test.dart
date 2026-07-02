import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/binary_number_system_entity.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/domain/number_system_converter/octal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/decimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/hexadecimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/internals/transaction_scripts/number_system_type_fixing_transaction_script.dart";

void main() {
  group("Test \"NumberSystemTypeFixingTransactionScript\" Class", () {
    test(
      "Test If Method \"getTypeFixedInstanceFromMarshalledData\" Returns A Type Fixed Instance Of Instance From Marshalled Data",
      () {
        final binaryNumberSystemInstanceFromMarshalledData = NumberSystemEntity(
          ZEROED_NUMBER_SYSTEM_VALUE,
          NumberSystem.BINARY,
        );
        final octalNumberSystemInstanceFromMarshalledData = NumberSystemEntity(
          ZEROED_NUMBER_SYSTEM_VALUE,
          NumberSystem.OCTAL,
        );
        final decimalNumberSystemInstanceFromMarshalledData =
            NumberSystemEntity(
              ZEROED_NUMBER_SYSTEM_VALUE,
              NumberSystem.DECIMAL,
            );
        final hexadecimalNumberSystemInstanceFromMarshalledData =
            NumberSystemEntity(
              ZEROED_NUMBER_SYSTEM_VALUE,
              NumberSystem.HEXADECIMAL,
            );
        final binaryNumberSystemFixedInstance =
            NumberSystemTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              binaryNumberSystemInstanceFromMarshalledData,
            );
        final octalNumberSystemFixedInstance =
            NumberSystemTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              octalNumberSystemInstanceFromMarshalledData,
            );
        final decimalNumberSystemFixedInstance =
            NumberSystemTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              decimalNumberSystemInstanceFromMarshalledData,
            );
        final hexadecimalNumberSystemFixedInstance =
            NumberSystemTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              hexadecimalNumberSystemInstanceFromMarshalledData,
            );

        expect(
          binaryNumberSystemFixedInstance,
          isA<BinaryNumberSystemEntity>(),
        );
        expect(octalNumberSystemFixedInstance, isA<OctalNumberSystemEntity>());
        expect(
          decimalNumberSystemFixedInstance,
          isA<DecimalNumberSystemEntity>(),
        );
        expect(
          hexadecimalNumberSystemFixedInstance,
          isA<HexadecimalNumberSystemEntity>(),
        );
      },
    );
  });
}
