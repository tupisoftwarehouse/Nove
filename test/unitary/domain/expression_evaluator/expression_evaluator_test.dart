import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/domain/expression_evaluator/expression_evaluator.dart";

void main() {
  group("Test \"ExpressionEvaluator\" Class", () {
    test(
      "Test If Method \"getEvaluatedExpression\" Returns Evaluated Expression From Expression Evaluator Implementation",
      () {
        final evaluatedExpression = ExpressionEvaluator.getEvaluatedExpression(
          EXPRESSION_TO_BE_EVALUATED,
        );

        expect(evaluatedExpression, EVALUATED_EXPRESSION);
      },
    );

    test(
      "Test If Method \"getEvaluatedExpression\" Throws \"NotValidExpressionError\" If Evaluated Expression Is Failed",
      () {
        try {
          ExpressionEvaluator.getEvaluatedExpression(NOT_VALID_EXPRESSION);
        } catch (error) {
          expect(error.toString(), NOT_VALID_EXPRESSION_ERROR_MESSAGE);
        }
      },
    );
  });
}
