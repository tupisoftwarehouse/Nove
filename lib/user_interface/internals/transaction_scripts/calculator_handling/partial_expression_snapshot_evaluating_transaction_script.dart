import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";

class PartialExpressionSnapshotEvaluatingTransactionScript {
  PartialExpressionSnapshotEvaluatingTransactionScript._();

  static ExpressionSnapshotValueObject getPartialEvaluatedExpressionSnapshot(
    Calculator calculator,
  ) {
    final expressionBeforeEvaluation = calculator.expression;

    try {
      late final String evaluatedExpression;

      calculator.evaluate();

      evaluatedExpression = calculator.expression;

      calculator.expression = expressionBeforeEvaluation;

      return ExpressionSnapshotValueObject(
        expressionBeforeEvaluation,
        evaluatedExpression,
      );
    } catch (_) {
      return ExpressionSnapshotValueObject(
        expressionBeforeEvaluation,
        expressionBeforeEvaluation,
      );
    }
  }
}
