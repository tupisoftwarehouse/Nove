import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";

void main() {
  group("Test \"ExpressionSnapshotHistoryManager\" Class", () {
    late ExpressionSnapshotHistoryManager expressionSnapshotHistoryManager;

    setUp(() {
      expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([]);
    });

    test(
      "Test If Method \"addExpressionSnapshot\" Adds Expression Snapshot To The Beginning Of List Of Previous Expression Snapshots",
      () {
        expressionSnapshotHistoryManager.addExpressionSnapshot(
          EXPRESSION_SNAPSHOT,
        );

        expect(
          expressionSnapshotHistoryManager
              .listOfPreviousExpressionSnapshots[0]
              .expression,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          expressionSnapshotHistoryManager
              .listOfPreviousExpressionSnapshots[0]
              .result,
          EXPRESSION_SNAPSHOT.result,
        );
      },
    );

    test(
      "Test If Method \"addExpressionSnapshot\" Removes Oldest Before Adding New Expression Snapshot If List Is Fulfilled",
      () {
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager(
          FULFILLED_LIST_OF_EXPRESSION_SNAPSHOTS(),
        );

        expressionSnapshotHistoryManager.addExpressionSnapshot(
          EXPRESSION_SNAPSHOT,
        );

        expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots;

        expect(
          expressionSnapshotHistoryManager
              .listOfPreviousExpressionSnapshots
              .length,
          MAXIMUM_AMOUNT_OF_STORED_EXPRESSION_SNAPSHOTS,
        );

        expect(
          expressionSnapshotHistoryManager
              .listOfPreviousExpressionSnapshots[0]
              .expression,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          expressionSnapshotHistoryManager
              .listOfPreviousExpressionSnapshots[0]
              .result,
          EXPRESSION_SNAPSHOT.result,
        );
      },
    );

    test(
      "Test If Method \"removeExpressionSnapshotAt\" Removes Expression Snapshot At A Given Index",
      () {
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager(
          FULFILLED_LIST_OF_EXPRESSION_SNAPSHOTS(),
        );

        expressionSnapshotHistoryManager.removeExpressionSnapshotAt(
          MAXIMUM_AMOUNT_OF_STORED_EXPRESSION_SNAPSHOTS - 1,
        );

        expect(
          expressionSnapshotHistoryManager
              .listOfPreviousExpressionSnapshots
              .length,
          FULFILLED_LIST_OF_EXPRESSION_SNAPSHOTS().length - 1,
        );
      },
    );

    test(
      "Test If Method \"cleanListOfPreviousExpressionSnapshots\" Turns List Of Previous Expression Snapshots Empty",
      () {
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager(
          FULFILLED_LIST_OF_EXPRESSION_SNAPSHOTS(),
        );

        expressionSnapshotHistoryManager
            .cleanListOfPreviousExpressionSnapshots();

        expect(
          expressionSnapshotHistoryManager
              .listOfPreviousExpressionSnapshots
              .length,
          0,
        );
      },
    );
  });
}
