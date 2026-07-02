import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/domain/expression_evaluator/expression_evaluator.dart";

void main() {
  group("Test \"ExpressionEvaluator\" Component", () {
    test(
      "Test Getting Evaluated Expression From Expression Evaluator Implementation",
      () {
        final evaluatedExpression = ExpressionEvaluator.getEvaluatedExpression(
          EXPRESSION_TO_BE_EVALUATED,
        );

        expect(evaluatedExpression, EVALUATED_EXPRESSION);
      },
    );
  });
}
