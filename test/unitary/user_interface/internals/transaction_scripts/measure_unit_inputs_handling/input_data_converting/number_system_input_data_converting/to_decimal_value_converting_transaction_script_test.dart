import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_converting/number_system_input_data_converting/to_decimal_value_converting_transaction_script.dart";

void main() {
  group("Test \"ToDecimalValueConvertingTransactionScript\" Class", () {
    test(
      "Test If Method \"getConvertedToDecimalValue\" Returns Converted Value To Decimal Value",
      () {
        late String convertedValue;

        convertedValue =
            ToDecimalValueConvertingTransactionScript.getConvertedToDecimalValue(
              NumberSystem.BINARY,
              BINARY_NUMBER,
            );

        expect(convertedValue, DECIMAL_NUMBER);

        convertedValue =
            ToDecimalValueConvertingTransactionScript.getConvertedToDecimalValue(
              NumberSystem.OCTAL,
              OCTAL_NUMBER,
            );

        expect(convertedValue, DECIMAL_NUMBER);

        convertedValue =
            ToDecimalValueConvertingTransactionScript.getConvertedToDecimalValue(
              NumberSystem.DECIMAL,
              DECIMAL_NUMBER,
            );

        expect(convertedValue, DECIMAL_NUMBER);

        convertedValue =
            ToDecimalValueConvertingTransactionScript.getConvertedToDecimalValue(
              NumberSystem.HEXADECIMAL,
              HEXADECIMAL_NUMBER,
            );

        expect(convertedValue, DECIMAL_NUMBER);
      },
    );
  });
}
