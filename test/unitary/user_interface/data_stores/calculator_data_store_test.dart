import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/calculator_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CalculatorDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getExpressionSnapshot\" Returns Expression Snapshot From Key-Value Database",
      () {
        keyValueDatabase.setItem(CURRENT_EXPRESSION_SNAPSHOT_KEY, () {
          return EMPTY_EXPRESSION_SNAPSHOT.marshalledData;
        });

        final expressionSnapshotFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        expect(
          expressionSnapshotFromKeyValueDatabase.expression,
          EMPTY_EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          expressionSnapshotFromKeyValueDatabase.result,
          EMPTY_EXPRESSION_SNAPSHOT.result,
        );
      },
    );

    test(
      "Test If Method \"setExpressionSnapshot\" Sets Expression Snapshot On Key-Value Database",
      () {
        CalculatorDataStore.setExpressionSnapshot(
          EMPTY_EXPRESSION_SNAPSHOT,
          keyValueDatabase,
        );

        final expressionSnapshotFromKeyValueDatabase = keyValueDatabase.getItem(
          CURRENT_EXPRESSION_SNAPSHOT_KEY,
          (marshalledData) {
            return ExpressionSnapshotValueObject.fromMarshalledData(
              marshalledData,
            );
          },
        );

        expect(
          expressionSnapshotFromKeyValueDatabase.expression,
          EMPTY_EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          expressionSnapshotFromKeyValueDatabase.result,
          EMPTY_EXPRESSION_SNAPSHOT.result,
        );
      },
    );
  });
}
