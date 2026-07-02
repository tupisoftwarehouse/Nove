import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_converting/number_system_input_data_converting/to_binary_value_converting_transaction_script.dart";

void main() {
  group("Test \"ToBinaryValueConvertingTransactionScript\" Class", () {
    test(
      "Test If Method \"getConvertedToBinaryValue\" Returns Converted Value To Binary Value",
      () {
        late String convertedValue;

        convertedValue =
            ToBinaryValueConvertingTransactionScript.getConvertedToBinaryValue(
              NumberSystem.BINARY,
              BINARY_NUMBER,
            );

        expect(convertedValue, BINARY_NUMBER);

        convertedValue =
            ToBinaryValueConvertingTransactionScript.getConvertedToBinaryValue(
              NumberSystem.OCTAL,
              OCTAL_NUMBER,
            );

        expect(convertedValue, BINARY_NUMBER);

        convertedValue =
            ToBinaryValueConvertingTransactionScript.getConvertedToBinaryValue(
              NumberSystem.DECIMAL,
              DECIMAL_NUMBER,
            );

        expect(convertedValue, BINARY_NUMBER);

        convertedValue =
            ToBinaryValueConvertingTransactionScript.getConvertedToBinaryValue(
              NumberSystem.HEXADECIMAL,
              HEXADECIMAL_NUMBER,
            );

        expect(convertedValue, BINARY_NUMBER);
      },
    );
  });
}
