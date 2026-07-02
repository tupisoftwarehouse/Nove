import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class CalculatorDataStore {
  CalculatorDataStore._();

  static ExpressionSnapshotValueObject getExpressionSnapshot(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<ExpressionSnapshotValueObject>(
      CURRENT_EXPRESSION_SNAPSHOT_KEY,
      (marshalledData) {
        return ExpressionSnapshotValueObject.fromMarshalledData(marshalledData);
      },
    );
  }

  static void setExpressionSnapshot(
    ExpressionSnapshotValueObject updatedExpressionSnapshot,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(CURRENT_EXPRESSION_SNAPSHOT_KEY, () {
      return updatedExpressionSnapshot.marshalledData;
    });
  }
}
