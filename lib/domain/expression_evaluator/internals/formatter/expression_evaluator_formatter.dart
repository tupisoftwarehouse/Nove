import "package:nove/constants/domains/expression_evaluator_constants.dart";

class ExpressionEvaluatorFormatter {
  ExpressionEvaluatorFormatter._();

  static String getFormatterExpression(String expressionToBeFormatted) {
    return expressionToBeFormatted
        .replaceAll(
          DIVIDE_SYMBOL_FINDING_REGULAR_EXPRESSION,
          VALID_DIVIDE_SYMBOL,
        )
        .replaceAll(
          SPACE_BETWEEN_TWO_LETTER_CHARACTERS_FINDING_REGULAR_EXPRESSION,
          MULTIPLY_SYMBOL,
        )
        .replaceAll(
          PERCENTAGE_SYMBOL_FINDING_REGULAR_EXPRESSION,
          VALID_PERCENTAGE_SYMBOL,
        )
        .replaceAll(
          EULER_CONSTANT_SYMBOL_FINDING_REGULAR_EXPRESSION,
          VALID_EULER_CONSTANT_SYMBOL,
        )
        .replaceAll(
          PI_CONSTANT_SYMBOL_FINDING_REGULAR_EXPRESSION,
          VALID_PI_CONSTANT_SYMBOL,
        )
        .replaceAllMapped(SQUARE_ROOT_SYMBOL_FINDING_REGULAR_EXPRESSION, (
          match,
        ) {
          final radicandNumber = match.group(SQUARE_ROOT_RADICAL_GROUP)!;

          return "sqrt($radicandNumber)";
        });
  }
}
