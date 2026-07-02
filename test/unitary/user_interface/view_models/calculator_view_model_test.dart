import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/expression_evaluator_constants.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/calculator/character.dart";
import "package:nove/user_interface/data_stores/scientific_calculator_keyboard_state_data_store.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/data_stores/calculator_data_store.dart";
import "package:nove/user_interface/data_stores/expression_snapshot_history_manager_data_store.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CalculatorViewModel\" Class", () {
    late Calculator calculator;
    late AbstractKeyValueDatabase keyValueDatabase;
    late ExpressionSnapshotHistoryManager expressionSnapshotHistoryManager;
    late CalculatorViewModel calculatorViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUp(() {
      calculator = Calculator("");
      keyValueDatabase = KeyValueDatabaseMock();
      expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([]);
      deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
        APPLICATION_LANGUAGE,
        (_) {},
      );

      calculatorViewModel = CalculatorViewModel(
        calculator,
        expressionSnapshotHistoryManager,
        keyValueDatabase,
        deviceLanguageStringsViewModel,
      );
    });

    test(
      "Test If View Model Initializes Its States With Calculator And Key-Value Database Data",
      () {
        CalculatorDataStore.setExpressionSnapshot(
          EXPRESSION_SNAPSHOT,
          keyValueDatabase,
        );
        ScientificCalculatorKeyboardStateDataStore.setScientificCalculatorKeyboardState(
          true,
          keyValueDatabase,
        );

        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([
          EXPRESSION_SNAPSHOT,
        ]);

        calculatorViewModel = CalculatorViewModel(
          calculator,
          expressionSnapshotHistoryManager,
          keyValueDatabase,
          deviceLanguageStringsViewModel,
        );

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          EXPRESSION_SNAPSHOT.result,
        );

        expect(
          calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
          1,
        );

        expect(
          calculatorViewModel.isScientificCalculatorKeyboardExpanded.value,
          true,
        );
      },
    );

    test(
      "Test If View Model Initializes Its Current Expression Snapshot States With Empty Data If There Is No Data In Key-Value Database",
      () {
        calculator = Calculator("");
        keyValueDatabase = KeyValueDatabaseMock();
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([
          EXPRESSION_SNAPSHOT,
        ]);
        deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
          APPLICATION_LANGUAGE,
          (_) {},
        );

        calculatorViewModel = CalculatorViewModel(
          calculator,
          expressionSnapshotHistoryManager,
          keyValueDatabase,
          deviceLanguageStringsViewModel,
        );

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          EMPTY_EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          EMPTY_EXPRESSION_SNAPSHOT.result,
        );

        expect(
          calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
          1,
        );
      },
    );

    test(
      "Test If Method \"addCharacter\" Adds Character To Expression And Stores Snapshot",
      () {
        calculatorViewModel.addCharacter(Character.ONE);

        final currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          Character.ONE.value,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          Character.ONE.value,
        );

        expect(calculator.expression, Character.ONE.value);

        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .expression,
          Character.ONE.value,
        );
        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .result,
          Character.ONE.value,
        );
      },
    );

    test(
      "Test If Method \"addCharacterAt\" Adds Character At A Given Index To Expression And Stores Snapshot",
      () {
        calculator.expression = EXPRESSION_TO_BE_EVALUATED.substring(
          1,
          EXPRESSION_TO_BE_EVALUATED.length,
        );

        calculatorViewModel.addCharacterAt(Character.ONE, 0);

        final currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          EXPRESSION_TO_BE_EVALUATED,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          EVALUATED_EXPRESSION.toString(),
        );

        expect(calculator.expression, EXPRESSION_TO_BE_EVALUATED);

        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .expression,
          EXPRESSION_TO_BE_EVALUATED,
        );
        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .result,
          EVALUATED_EXPRESSION.toString(),
        );
      },
    );

    test(
      "Test If Method \"setExpression\" Updates Expression And Stores Snapshot",
      () {
        calculatorViewModel.setExpression(EXPRESSION_TO_BE_EVALUATED);

        final currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          EXPRESSION_TO_BE_EVALUATED,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          EVALUATED_EXPRESSION.toString(),
        );

        expect(calculator.expression, EXPRESSION_TO_BE_EVALUATED);

        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .expression,
          EXPRESSION_TO_BE_EVALUATED,
        );
        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .result,
          EVALUATED_EXPRESSION.toString(),
        );
      },
    );

    test(
      "Test If Method \"backspace\" Backspaces Expression And Stores Snapshot",
      () {
        calculator.addCharacter(Character.ONE);

        calculatorViewModel.backspace();

        final currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          "",
        );
        expect(calculatorViewModel.currentExpressionSnapshot.value.result, "");

        expect(calculator.expression, "");

        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .expression,
          "",
        );
        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .result,
          "",
        );
      },
    );

    test(
      "Test If Method \"backspaceAt\" Backspaces Expression At A Given Index And Stores Snapshot",
      () {
        calculator.addCharacter(Character.ONE);
        calculator.addCharacter(Character.TWO);
        calculator.addCharacter(Character.THREE);

        calculatorViewModel.backspaceAt(1);

        final currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          Character.TWO.value + Character.THREE.value,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          Character.TWO.value + Character.THREE.value,
        );

        expect(
          calculator.expression,
          Character.TWO.value + Character.THREE.value,
        );

        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .expression,
          Character.TWO.value + Character.THREE.value,
        );
        expect(
          currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
              .result,
          Character.TWO.value + Character.THREE.value,
        );
      },
    );

    test("Test If Method \"clean\" Cleans Expression And Stores Snapshot", () {
      calculator.addCharacter(Character.ONE);

      calculatorViewModel.clean();

      final currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase =
          CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

      expect(
        calculatorViewModel.currentExpressionSnapshot.value.expression,
        "",
      );
      expect(calculatorViewModel.currentExpressionSnapshot.value.result, "");

      expect(calculator.expression, "");

      expect(
        currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase
            .expression,
        "",
      );
      expect(
        currentExpressionSnapshotExpressionSnapshotFromKeyValueDatabase.result,
        "",
      );
    });

    test(
      "Test If Method \"evaluate\" Evaluates Expression And Stores Snapshot",
      () {
        calculatorViewModel.addCharacter(Character.ONE);
        calculatorViewModel.addCharacter(Character.PLUS);
        calculatorViewModel.addCharacter(Character.ONE);

        calculatorViewModel.evaluate();

        final currentExpressionSnapshotFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        final listOfPreviewExpressionSnapshotsFromKeyValueDatabase =
            ExpressionSnapshotHistoryManagerDataStore.getListOfExpressionSnapshots(
              keyValueDatabase,
            );

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          Character.TWO.value,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          Character.TWO.value,
        );

        expect(
          currentExpressionSnapshotFromKeyValueDatabase.expression,
          Character.TWO.value,
        );
        expect(
          listOfPreviewExpressionSnapshotsFromKeyValueDatabase.first.result,
          Character.TWO.value,
        );
        expect(listOfPreviewExpressionSnapshotsFromKeyValueDatabase.length, 1);

        expect(
          listOfPreviewExpressionSnapshotsFromKeyValueDatabase[0].expression,
          Character.ONE.value + Character.PLUS.value + Character.ONE.value,
        );
        expect(
          listOfPreviewExpressionSnapshotsFromKeyValueDatabase[0].result,
          Character.TWO.value,
        );
      },
    );

    test(
      "Test If Method \"evaluate\" Turns Expression Not Valid On Device Language",
      () {
        calculatorViewModel.addCharacter(Character.ONE);
        calculatorViewModel.addCharacter(Character.PLUS);

        calculatorViewModel.evaluate();

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          Character.ONE.value + Character.PLUS.value,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .NOT_VALID_EXPRESSION_ERROR_MESSAGE,
        );
      },
    );

    test(
      "Test If Method \"cleanListOfPreviousExpressionSnapshots\" Cleans History",
      () {
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([
          EXPRESSION_SNAPSHOT,
        ]);

        calculatorViewModel = CalculatorViewModel(
          calculator,
          expressionSnapshotHistoryManager,
          keyValueDatabase,
          deviceLanguageStringsViewModel,
        );

        calculatorViewModel.cleanListOfPreviousExpressionSnapshots();

        final listOfPreviousExpressionSnapshotsFromKeyValueDatabase =
            ExpressionSnapshotHistoryManagerDataStore.getListOfExpressionSnapshots(
              keyValueDatabase,
            );

        expect(
          calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
          0,
        );
        expect(listOfPreviousExpressionSnapshotsFromKeyValueDatabase.length, 0);
      },
    );

    test(
      "Test If Method \"restoreExpressionSnapshotAt\" Restores Snapshot",
      () {
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([
          EXPRESSION_SNAPSHOT,
        ]);

        calculatorViewModel = CalculatorViewModel(
          calculator,
          expressionSnapshotHistoryManager,
          keyValueDatabase,
          deviceLanguageStringsViewModel,
        );

        calculatorViewModel.restoreExpressionSnapshotAt(0);

        final currentExpressionSnapshotFromKeyValueDatabase =
            CalculatorDataStore.getExpressionSnapshot(keyValueDatabase);

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.expression,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          EXPRESSION_SNAPSHOT.result,
        );

        expect(
          currentExpressionSnapshotFromKeyValueDatabase.expression,
          EXPRESSION_SNAPSHOT.expression,
        );
        expect(
          currentExpressionSnapshotFromKeyValueDatabase.result,
          EXPRESSION_SNAPSHOT.result,
        );
      },
    );

    test(
      "Test If Method \"restoreListOfPreviousExpressionSnapshots\" Restores List Of Previous Expression Snapshots",
      () {
        calculator = Calculator("");
        keyValueDatabase = KeyValueDatabaseMock();
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([
          EXPRESSION_SNAPSHOT,
        ]);
        deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
          APPLICATION_LANGUAGE,
          (_) {},
        );

        calculatorViewModel = CalculatorViewModel(
          calculator,
          expressionSnapshotHistoryManager,
          keyValueDatabase,
          deviceLanguageStringsViewModel,
        );

        calculatorViewModel.cleanListOfPreviousExpressionSnapshots();

        calculatorViewModel.restoreListOfPreviousExpressionSnapshots();

        final listOfPreviousExpressionSnapshotsFromKeyValueDatabase =
            ExpressionSnapshotHistoryManagerDataStore.getListOfExpressionSnapshots(
              keyValueDatabase,
            );

        expect(
          calculatorViewModel.listOfPreviousExpressionSnapshots.value.length,
          1,
        );
        expect(listOfPreviousExpressionSnapshotsFromKeyValueDatabase.length, 1);
        expect(
          expressionSnapshotHistoryManager
              .listOfPreviousExpressionSnapshots
              .length,
          1,
        );
      },
    );

    test(
      "Test If Method \"dismissRecoveryOfListOfPreviousExpressionSnapshots\" Dismisses Recovery Of List Of Previous Expression Snapshots",
      () {
        calculator = Calculator("");
        keyValueDatabase = KeyValueDatabaseMock();
        expressionSnapshotHistoryManager = ExpressionSnapshotHistoryManager([
          EXPRESSION_SNAPSHOT,
        ]);
        deviceLanguageStringsViewModel = DeviceLanguageStringsViewModel(
          APPLICATION_LANGUAGE,
          (_) {},
        );

        calculatorViewModel = CalculatorViewModel(
          calculator,
          expressionSnapshotHistoryManager,
          keyValueDatabase,
          deviceLanguageStringsViewModel,
        );

        calculatorViewModel.cleanListOfPreviousExpressionSnapshots();

        calculatorViewModel
            .dismissRecoveryOfListOfPreviousExpressionSnapshots();

        try {
          calculatorViewModel.restoreListOfPreviousExpressionSnapshots();
        } catch (error) {
          expect(error, isA<Error>());
        }
      },
    );

    test(
      "Test If Method \"toggleCalculatorKeyboardState\" Toggles Calculator Keyboard State",
      () {
        calculatorViewModel.toggleScientificCalculatorKeyboardState();

        final scientificCalculatorKeyboardStateFromKeyValueDatabase =
            ScientificCalculatorKeyboardStateDataStore.getScientificCalculatorKeyboardState(
              keyValueDatabase,
            );

        expect(
          calculatorViewModel.isScientificCalculatorKeyboardExpanded.value,
          true,
        );
        expect(scientificCalculatorKeyboardStateFromKeyValueDatabase, true);
      },
    );

    test(
      "Test If Method \"setExpressionToNoValidExpressionMessage\" Sets Expression Snapshot Result To No Valid Expression Message On Device Language Current If Expression Evaluation Is Failed",
      () {
        calculatorViewModel.addCharacter(Character.ONE);
        calculatorViewModel.addCharacter(Character.PLUS);

        calculatorViewModel.evaluate();

        calculatorViewModel
            .setExpressionToNoValidExpressionMessageOnDeviceLanguage();

        expect(
          calculatorViewModel.currentExpressionSnapshot.value.result,
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .NOT_VALID_EXPRESSION_ERROR_MESSAGE,
        );
      },
    );
  });
}
