import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";

class ToOctalValueConvertingTransactionScript {
  ToOctalValueConvertingTransactionScript._();

  static String getConvertedToOctalValue(
    NumberSystem numberSystem,
    String value,
  ) {
    late final String convertedNumberSystemValue;

    switch (numberSystem) {
      case NumberSystem.BINARY:
        convertedNumberSystemValue = int.parse(
          value,
          radix: BINARY_NUMBER_SYSTEM_BASE,
        ).toRadixString(OCTAL_NUMBER_SYSTEM_BASE);

        break;
      case NumberSystem.OCTAL:
        convertedNumberSystemValue = value;

        break;
      case NumberSystem.DECIMAL:
        convertedNumberSystemValue = int.parse(
          value,
          radix: DECIMAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(OCTAL_NUMBER_SYSTEM_BASE);

        break;
      case NumberSystem.HEXADECIMAL:
        convertedNumberSystemValue = int.parse(
          value,
          radix: HEXADECIMAL_NUMBER_SYSTEM_BASE,
        ).toRadixString(OCTAL_NUMBER_SYSTEM_BASE);

        break;
    }

    return convertedNumberSystemValue;
  }
}
