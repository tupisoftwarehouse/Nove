import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/domain/expression_evaluator/internals/formatter/expression_evaluator_formatter.dart";

void main() {
  group("Test \"ExpressionEvaluatorFormatter\" Class", () {
    test(
      "Test If Method \"getFormatterExpression\" Returns Expression With Expression Evaluator Implementation Valid Symbols",
      () {
        final formattedExpression =
            ExpressionEvaluatorFormatter.getFormatterExpression(
              NOT_FORMATTED_EXPRESSION,
            );

        expect(formattedExpression, FORMATTED_EXPRESSION);
      },
    );
  });
}
