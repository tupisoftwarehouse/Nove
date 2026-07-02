import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_converting/number_system_input_data_converting/to_octal_value_converting_transaction_script.dart";

void main() {
  group("Test \"ToOctalValueConvertingTransactionScript\" Class", () {
    test(
      "Test If Method \"getConvertedToOctalValue\" Returns Converted Value To Octal Value",
      () {
        late String convertedValue;

        convertedValue =
            ToOctalValueConvertingTransactionScript.getConvertedToOctalValue(
              NumberSystem.BINARY,
              BINARY_NUMBER,
            );

        expect(convertedValue, OCTAL_NUMBER);

        convertedValue =
            ToOctalValueConvertingTransactionScript.getConvertedToOctalValue(
              NumberSystem.OCTAL,
              OCTAL_NUMBER,
            );

        expect(convertedValue, OCTAL_NUMBER);

        convertedValue =
            ToOctalValueConvertingTransactionScript.getConvertedToOctalValue(
              NumberSystem.DECIMAL,
              DECIMAL_NUMBER,
            );

        expect(convertedValue, OCTAL_NUMBER);

        convertedValue =
            ToOctalValueConvertingTransactionScript.getConvertedToOctalValue(
              NumberSystem.HEXADECIMAL,
              HEXADECIMAL_NUMBER,
            );

        expect(convertedValue, OCTAL_NUMBER);
      },
    );
  });
}
