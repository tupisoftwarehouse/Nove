import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/internals/checker/expression_snapshot_history_manager_checker.dart";

void main() {
  group("Test \"ExpressionSnapshotHistoryManagerChecker\" Module", () {
    test(
      "Test If Function \"isListOfPreviousExpressionSnapshotsNotFulfilled\" Returns True If List Of Previous Expression Snapshots Not Fulfilled",
      () {
        final listOfPreviousExpressionSnapshotsNotFulfilled =
            isListOfPreviousExpressionSnapshotsNotFulfilled([]);
        final listOfPreviousExpressionSnapshotsFulfilled =
            isListOfPreviousExpressionSnapshotsNotFulfilled(
              FULFILLED_LIST_OF_EXPRESSION_SNAPSHOTS(),
            );

        expect(listOfPreviousExpressionSnapshotsNotFulfilled, true);
        expect(listOfPreviousExpressionSnapshotsFulfilled, false);
      },
    );
  });
}
