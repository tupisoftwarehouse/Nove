import "package:nove/constants/user_interface_constants.dart";

class UserInterfaceFormatter {
  UserInterfaceFormatter._();

  static String getRoundNumberValue(String value) {
    return value
        .replaceAllMapped(
          REMOVE_UNNECESSARY_TRAILING_ZEROES_FROM_VALUE_REGULAR_EXPRESSION,
          (match) {
            return match.group(1)!;
          },
        )
        .replaceAll(REMOVE_UNNECESSARY_ZEROS_FROM_VALUE_REGEX, "")
        .replaceAll(
          REMOVE_UNNECESSARY_TRAILING_DOTS_FROM_VALUE_REGULAR_EXPRESSION,
          "",
        );
  }

  static String getPaddedValue(String value) {
    return value.padLeft(DECIMAL_NUMBER_OF_DIGITS, DECIMAL_NUMBER_PADDING);
  }
}
