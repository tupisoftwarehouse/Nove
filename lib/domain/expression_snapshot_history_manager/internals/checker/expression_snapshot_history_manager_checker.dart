import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";

bool isListOfPreviousExpressionSnapshotsNotFulfilled(
  List<ExpressionSnapshotValueObject> listOfPreviousExpressionSnapshots,
) {
  return (listOfPreviousExpressionSnapshots.length <
      MAXIMUM_AMOUNT_OF_STORED_EXPRESSION_SNAPSHOTS);
}
