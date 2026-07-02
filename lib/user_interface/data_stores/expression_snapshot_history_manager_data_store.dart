import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class ExpressionSnapshotHistoryManagerDataStore {
  ExpressionSnapshotHistoryManagerDataStore._();

  static List<ExpressionSnapshotValueObject> getListOfExpressionSnapshots(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<List<ExpressionSnapshotValueObject>>(
      LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOTS_KEY,
      (marshalledData) {
        return ExpressionSnapshotValueObject.fromMarshalledListData(
          marshalledData,
        );
      },
    );
  }

  static void setListOfExpressionSnapshots(
    List<ExpressionSnapshotValueObject>
    updatedListOfPreviousExpressionSnapshots,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOTS_KEY, () {
      return ExpressionSnapshotValueObject.marshalledListData(
        updatedListOfPreviousExpressionSnapshots,
      );
    });
  }
}
