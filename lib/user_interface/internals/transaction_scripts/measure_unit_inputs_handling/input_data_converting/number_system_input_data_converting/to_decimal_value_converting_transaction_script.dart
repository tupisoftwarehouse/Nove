import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";

class ToDecimalValueConvertingTransactionScript {
  ToDecimalValueConvertingTransactionScript._();

  static String getConvertedToDecimalValue(
    NumberSystem numberSystem,
    String value,
  ) {
    late final String convertedNumberSystemValue;

    switch (numberSystem) {
      case NumberSystem.BINARY:
        convertedNumberSystemValue = int.parse(
          value,
          radix: BINARY_NUMBER_SYSTEM_BASE,
        ).toRadixString(DECIMAL_NUMBER_SYSTEM_BASE);

        break;
      case NumberSystem.OCTAL:
        convertedNumberSystemValue = int.parse(
          value,
          radix: OCTAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(DECIMAL_NUMBER_SYSTEM_BASE);

        break;
      case NumberSystem.DECIMAL:
        convertedNumberSystemValue = value;

        break;
      case NumberSystem.HEXADECIMAL:
        convertedNumberSystemValue = int.parse(
          value,
          radix: HEXADECIMAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(DECIMAL_NUMBER_SYSTEM_BASE);

        break;
    }

    return convertedNumberSystemValue;
  }
}
