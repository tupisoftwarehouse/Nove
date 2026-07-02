import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/data_stores/calculator_data_store.dart";

class CurrentExpressionSnapshotSynchronizingTransactionScript {
  CurrentExpressionSnapshotSynchronizingTransactionScript._();

  static void synchronizeCurrentExpressionSnapshot(
    ExpressionSnapshotValueObject updatedCurrentExpressionSnapshot,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<ExpressionSnapshotValueObject> currentExpressionSnapshot,
  ) {
    CalculatorDataStore.setExpressionSnapshot(
      updatedCurrentExpressionSnapshot,
      keyValueDatabase,
    );

    currentExpressionSnapshot.value = updatedCurrentExpressionSnapshot;
  }
}
