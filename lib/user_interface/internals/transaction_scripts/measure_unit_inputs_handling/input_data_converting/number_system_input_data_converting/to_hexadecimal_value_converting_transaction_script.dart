import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";

class ToHexadecimalValueConvertingTransactionScript {
  ToHexadecimalValueConvertingTransactionScript._();

  static String getConvertedToHexadecimalValue(
    NumberSystem numberSystem,
    String value,
  ) {
    late final String convertedNumberSystemValue;

    switch (numberSystem) {
      case NumberSystem.BINARY:
        convertedNumberSystemValue = int.parse(
          value,
          radix: BINARY_NUMBER_SYSTEM_BASE,
        ).toRadixString(HEXADECIMAL_NUMBER_SYSTEM_BASE);

        break;
      case NumberSystem.OCTAL:
        convertedNumberSystemValue = int.parse(
          value,
          radix: OCTAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(HEXADECIMAL_NUMBER_SYSTEM_BASE);

        break;
      case NumberSystem.DECIMAL:
        convertedNumberSystemValue = int.parse(
          value,
          radix: DECIMAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(HEXADECIMAL_NUMBER_SYSTEM_BASE);

        break;
      case NumberSystem.HEXADECIMAL:
        convertedNumberSystemValue = value;

        break;
    }

    return convertedNumberSystemValue;
  }
}
