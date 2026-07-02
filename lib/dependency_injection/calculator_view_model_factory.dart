import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/calculator_data_store.dart";
import "package:nove/user_interface/data_stores/expression_snapshot_history_manager_data_store.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";

class CalculatorViewModelFactory {
  static CalculatorViewModel? instance;

  CalculatorViewModelFactory._();

  static CalculatorViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();
    final deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();

    if (isNull(instance)) {
      late final Calculator calculator;
      late final ExpressionSnapshotHistoryManager
      expressionSnapshotHistoryManager;

      try {
        final expressionSnapshotsFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        calculator = Calculator(
          expressionSnapshotsFromKeyValueDatabase.expression,
        );
      } catch (_) {
        calculator = Calculator("");
      }

      try {
        final listOfPreviousExpressionSnapshotsFromKeyValueDatabase =
            ExpressionSnapshotHistoryManagerDataStore.getListOfExpressionSnapshots(
              keyValueDatabase,
            );

        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager(
          listOfPreviousExpressionSnapshotsFromKeyValueDatabase,
        );
      } catch (_) {
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([]);
      }

      instance = CalculatorViewModel(
        calculator,
        expressionSnapshotHistoryManager,
        keyValueDatabase,
        deviceLanguageStringsViewModel,
      );
    }

    return instance!;
  }
}
