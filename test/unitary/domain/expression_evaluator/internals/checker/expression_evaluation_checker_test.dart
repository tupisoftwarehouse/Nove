import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/domain/expression_evaluator/internals/checker/expression_evaluation_checker.dart";

void main() {
  group("Test \"ExpressionEvaluationChecker\" Module", () {
    test(
      "Test If Function \"isEvaluatedExpressionRound\" Returns True If Evaluated Expression Is Round",
      () {
        final evaluatedExpressionIsRound = isEvaluatedExpressionRound(
          EVALUATED_EXPRESSION,
        );

        final evaluatedExpressionIsNotRound = isEvaluatedExpressionRound(
          NOT_ROUND_EVALUATED_EXPRESSION,
        );

        expect(evaluatedExpressionIsRound, true);
        expect(evaluatedExpressionIsNotRound, false);
      },
    );
  });
}
