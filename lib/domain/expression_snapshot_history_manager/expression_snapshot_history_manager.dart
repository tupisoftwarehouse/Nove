import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/domain/expression_snapshot_history_manager/internals/checker/expression_snapshot_history_manager_checker.dart";

class ExpressionSnapshotHistoryManager {
  List<ExpressionSnapshotValueObject> listOfPreviousExpressionSnapshots;

  ExpressionSnapshotHistoryManager(this.listOfPreviousExpressionSnapshots);

  void addExpressionSnapshot(
    ExpressionSnapshotValueObject expressionSnapshotToBeAdded,
  ) {
    if (isListOfPreviousExpressionSnapshotsNotFulfilled(
      listOfPreviousExpressionSnapshots,
    )) {
      listOfPreviousExpressionSnapshots.insert(0, expressionSnapshotToBeAdded);
    } else {
      listOfPreviousExpressionSnapshots.removeAt(0);

      listOfPreviousExpressionSnapshots.insert(0, expressionSnapshotToBeAdded);
    }
  }

  void removeExpressionSnapshotAt(int indexOfExpressionSnapshotToBeRemoved) {
    listOfPreviousExpressionSnapshots.removeAt(
      indexOfExpressionSnapshotToBeRemoved,
    );
  }

  void cleanListOfPreviousExpressionSnapshots() {
    listOfPreviousExpressionSnapshots = [];
  }
}
