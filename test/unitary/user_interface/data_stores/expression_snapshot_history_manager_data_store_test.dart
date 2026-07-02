import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/expression_snapshot_history_manager_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ExpressionSnapshotHistoryManagerDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfExpressionSnapshots\" Returns List Of Expression Snapshots From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOTS_KEY, () {
          return ExpressionSnapshotValueObject.marshalledListData([
            EXPRESSION_SNAPSHOT,
          ]);
        });

        final listOfExpressionSnapshotsFromKeyValueDatabase =
            ExpressionSnapshotHistoryManagerDataStore.getListOfExpressionSnapshots(
              keyValueDatabase,
            );

        expect(
          listOfExpressionSnapshotsFromKeyValueDatabase[0].expression,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          listOfExpressionSnapshotsFromKeyValueDatabase[0].result,
          EXPRESSION_SNAPSHOT.result,
        );

        expect(listOfExpressionSnapshotsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfExpressionSnapshots\" Sets List Of Expression Snapshots On Key-Value Database",
      () {
        ExpressionSnapshotHistoryManagerDataStore.setListOfExpressionSnapshots([
          EXPRESSION_SNAPSHOT,
        ], keyValueDatabase);

        final listOfExpressionSnapshotsFromKeyValueDatabase = keyValueDatabase
            .getItem(LIST_OF_PREVIOUS_EXPRESSION_SNAPSHOTS_KEY, (
              marshalledData,
            ) {
              return ExpressionSnapshotValueObject.fromMarshalledListData(
                marshalledData,
              );
            });

        expect(
          listOfExpressionSnapshotsFromKeyValueDatabase[0].expression,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          listOfExpressionSnapshotsFromKeyValueDatabase[0].result,
          EXPRESSION_SNAPSHOT.result,
        );

        expect(listOfExpressionSnapshotsFromKeyValueDatabase.length, 1);
      },
    );
  });
}
