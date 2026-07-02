import "package:nove/constants/domains/calculator_constants.dart";

class CalculatorFormatter {
  CalculatorFormatter._();

  static String getExpressionWithoutLastCharacter(String expression) {
    if (expression.isNotEmpty) {
      return expression.substring(0, expression.length - 1);
    } else {
      return "";
    }
  }

  static String getExpressionWithoutCharacterAt(
    String expression,
    int indexOfCharacterToBeBackspaced,
  ) {
    if (expression.isNotEmpty) {
      return expression.substring(0, indexOfCharacterToBeBackspaced - 1) +
          expression.substring(indexOfCharacterToBeBackspaced);
    } else {
      return "";
    }
  }

  static String getExpressionWithCharacterAdded(
    String expression,
    String characterToBeAdded,
  ) {
    return expression + characterToBeAdded;
  }

  static String getExpressionWithCharacterAddedAt(
    String expression,
    String characterToBeAdded,
    int indexOfCharacterToBeAdded,
  ) {
    return expression.substring(0, indexOfCharacterToBeAdded) +
        characterToBeAdded +
        expression.substring(indexOfCharacterToBeAdded);
  }

  static String getExpressionWithFixedTruncation(String value) {
    try {
      return double.parse(value).toStringAsFixed(
        EXPRESSION_VALUE_FLOATING_POINT_FIXED_TRUNCATION_LENGTH,
      );
    } catch (_) {
      return value;
    }
  }

  static String getExpressionWithoutUnnecessaryZeros(String value) {
    return value
        .replaceAllMapped(
          REMOVE_UNNECESSARY_TRAILING_ZEROES_FROM_VALUE_REGULAR_EXPRESSION,
          (match) {
            return match.group(
              VALUE_WITHOUT_UNNECESSARY_TRAILING_ZEROES_GROUP,
            )!;
          },
        )
        .replaceAll(REMOVE_UNNECESSARY_ZEROS_FROM_VALUE_REGEX, "")
        .replaceAll(
          REMOVE_UNNECESSARY_TRAILING_DOTS_FROM_VALUE_REGULAR_EXPRESSION,
          "",
        );
  }
}
