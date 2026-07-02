import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/user_interface/internals/transaction_scripts/calculator_handling/partial_expression_snapshot_evaluating_transaction_script.dart";

void main() {
  group("Test \"PartialExpressionSnapshotEvaluatingTransactionScript\" Class", () {
    late Calculator calculator;

    setUpAll(() {
      calculator = Calculator(EXPRESSION_TO_BE_EVALUATED);
    });

    test(
      "Test If Method \"getPartialEvaluatedExpressionSnapshot\" Returns Evaluated Partial Expression Snapshot While Keeps Calculator Expression As Previously",
      () {
        final partialEvaluatedExpressionSnapshot =
            PartialExpressionSnapshotEvaluatingTransactionScript.getPartialEvaluatedExpressionSnapshot(
              calculator,
            );

        expect(
          partialEvaluatedExpressionSnapshot.expression,
          UPDATED_EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          partialEvaluatedExpressionSnapshot.result,
          UPDATED_EXPRESSION_SNAPSHOT.result,
        );

        expect(calculator.expression, EXPRESSION_TO_BE_EVALUATED);
      },
    );
  });
}
