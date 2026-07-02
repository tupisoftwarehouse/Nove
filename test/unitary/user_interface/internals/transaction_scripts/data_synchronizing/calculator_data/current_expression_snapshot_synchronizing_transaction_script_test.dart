import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/data_stores/calculator_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/calculator_data/current_expression_snapshot_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group(
    "Test \"CurrentExpressionSnapshotSynchronizingTransactionScript\" Class",
    () {
      late AbstractKeyValueDatabase keyValueDatabase;
      late ValueNotifier<ExpressionSnapshotValueObject>
      currentExpressionSnapshotState;

      setUpAll(() {
        keyValueDatabase = KeyValueDatabaseMock();

        currentExpressionSnapshotState = ValueNotifier(
          EMPTY_EXPRESSION_SNAPSHOT,
        );
      });

      test(
        "Test If Method \"synchronizeCurrentExpressionSnapshot\" Synchronizes Data To KeyValueDatabase And UI State",
        () {
          CurrentExpressionSnapshotSynchronizingTransactionScript.synchronizeCurrentExpressionSnapshot(
            UPDATED_EXPRESSION_SNAPSHOT,
            keyValueDatabase,
            currentExpressionSnapshotState,
          );

          final expressionSnapshotFromKeyValueDatabase =
              CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

          expect(
            currentExpressionSnapshotState.value.expression,
            UPDATED_EXPRESSION_SNAPSHOT.expression,
          );
          expect(
            currentExpressionSnapshotState.value.result,
            UPDATED_EXPRESSION_SNAPSHOT.result,
          );

          expect(
            expressionSnapshotFromKeyValueDatabase.expression,
            UPDATED_EXPRESSION_SNAPSHOT.expression,
          );
          expect(
            expressionSnapshotFromKeyValueDatabase.result,
            UPDATED_EXPRESSION_SNAPSHOT.result,
          );
        },
      );
    },
  );
}
