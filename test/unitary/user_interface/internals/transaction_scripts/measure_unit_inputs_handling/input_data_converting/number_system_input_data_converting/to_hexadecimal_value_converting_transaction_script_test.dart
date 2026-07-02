import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_converting/number_system_input_data_converting/to_hexadecimal_value_converting_transaction_script.dart";

void main() {
  group("Test \"ToHexadecimalValueConvertingTransactionScript\" Class", () {
    test(
      "Test If Method \"getConvertedToHexadecimalValue\" Returns Converted Value To Hexadecimal Value",
      () {
        late String convertedValue;

        convertedValue =
            ToHexadecimalValueConvertingTransactionScript.getConvertedToHexadecimalValue(
              NumberSystem.BINARY,
              BINARY_NUMBER,
            );

        expect(convertedValue, HEXADECIMAL_NUMBER);

        convertedValue =
            ToHexadecimalValueConvertingTransactionScript.getConvertedToHexadecimalValue(
              NumberSystem.OCTAL,
              OCTAL_NUMBER,
            );

        expect(convertedValue, HEXADECIMAL_NUMBER);

        convertedValue =
            ToHexadecimalValueConvertingTransactionScript.getConvertedToHexadecimalValue(
              NumberSystem.DECIMAL,
              DECIMAL_NUMBER,
            );

        expect(convertedValue, HEXADECIMAL_NUMBER);

        convertedValue =
            ToHexadecimalValueConvertingTransactionScript.getConvertedToHexadecimalValue(
              NumberSystem.HEXADECIMAL,
              HEXADECIMAL_NUMBER,
            );

        expect(convertedValue, HEXADECIMAL_NUMBER);
      },
    );
  });
}
