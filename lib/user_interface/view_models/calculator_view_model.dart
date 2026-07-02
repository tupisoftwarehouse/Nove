import "package:flutter/foundation.dart";
import "package:nove/constants/domains/expression_snapshot_history_manager_constants.dart";
import "package:nove/user_interface/data_stores/scientific_calculator_keyboard_state_data_store.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/calculator/calculator.dart";
import "package:nove/domain/calculator/character.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_value_object.dart";
import "package:nove/domain/expression_snapshot_history_manager/expression_snapshot_history_manager.dart";
import "package:nove/user_interface/data_stores/calculator_data_store.dart";
import "package:nove/user_interface/data_stores/expression_snapshot_history_manager_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/calculator_data/current_expression_snapshot_synchronizing_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/calculator_handling/partial_expression_snapshot_evaluating_transaction_script.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class CalculatorViewModel {
  final Calculator _calculator;
  final ExpressionSnapshotHistoryManager _expressionSnapshotHistoryManager;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  final ValueNotifier<ExpressionSnapshotValueObject> currentExpressionSnapshot =
      ValueNotifier<ExpressionSnapshotValueObject>(EMPTY_EXPRESSION_SNAPSHOT);
  final ValueNotifier<List<ExpressionSnapshotValueObject>>
  listOfPreviousExpressionSnapshots =
      ValueNotifier<List<ExpressionSnapshotValueObject>>([]);
  final ValueNotifier<bool> isScientificCalculatorKeyboardExpanded =
      ValueNotifier<bool>(false);
  List<ExpressionSnapshotValueObject>?
  _listOfPreviousExpressionSnapshotsRecovery;
  bool _isExpressionSnapshotNotAbleToBeTaken = true;
  bool _isExpressionEvaluationFailed = false;

  CalculatorViewModel(
    this._calculator,
    this._expressionSnapshotHistoryManager,
    this._keyValueDatabase,
    this._deviceLanguageStringsViewModel,
  ) {
    try {
      final currentExpressionSnapshotFromKeyValueDatabase =
          CalculatorDataStore.getExpressionSnapshot(_keyValueDatabase);

      currentExpressionSnapshot.value =
          currentExpressionSnapshotFromKeyValueDatabase;
    } catch (_) {
      currentExpressionSnapshot.value = EMPTY_EXPRESSION_SNAPSHOT;
    } finally {
      listOfPreviousExpressionSnapshots.value =
          _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots;
    }

    try {
      isScientificCalculatorKeyboardExpanded.value =
          ScientificCalculatorKeyboardStateDataStore.getScientificCalculatorKeyboardState(
            _keyValueDatabase,
          );
    } catch (_) {}
  }

  void addCharacter(Character characterToBeAdded) {
    late final ExpressionSnapshotValueObject updatedCurrentExpressionSnapshot;

    _calculator.addCharacter(characterToBeAdded);

    updatedCurrentExpressionSnapshot =
        PartialExpressionSnapshotEvaluatingTransactionScript.getPartialEvaluatedExpressionSnapshot(
          _calculator,
        );

    CurrentExpressionSnapshotSynchronizingTransactionScript.synchronizeCurrentExpressionSnapshot(
      updatedCurrentExpressionSnapshot,
      _keyValueDatabase,
      currentExpressionSnapshot,
    );

    _isExpressionSnapshotNotAbleToBeTaken = false;

    _isExpressionEvaluationFailed = false;
  }

  void addCharacterAt(
    Character characterToBeAdded,
    int indexOfCharacterToBeAdded,
  ) {
    late final ExpressionSnapshotValueObject updatedCurrentExpressionSnapshot;

    _calculator.addCharacterAt(characterToBeAdded, indexOfCharacterToBeAdded);

    updatedCurrentExpressionSnapshot =
        PartialExpressionSnapshotEvaluatingTransactionScript.getPartialEvaluatedExpressionSnapshot(
          _calculator,
        );

    CurrentExpressionSnapshotSynchronizingTransactionScript.synchronizeCurrentExpressionSnapshot(
      updatedCurrentExpressionSnapshot,
      _keyValueDatabase,
      currentExpressionSnapshot,
    );

    _isExpressionSnapshotNotAbleToBeTaken = false;

    _isExpressionEvaluationFailed = false;
  }

  void setExpression(String updatedExpression) {
    late final ExpressionSnapshotValueObject updatedCurrentExpressionSnapshot;

    _calculator.expression = updatedExpression;

    updatedCurrentExpressionSnapshot =
        PartialExpressionSnapshotEvaluatingTransactionScript.getPartialEvaluatedExpressionSnapshot(
          _calculator,
        );

    CurrentExpressionSnapshotSynchronizingTransactionScript.synchronizeCurrentExpressionSnapshot(
      updatedCurrentExpressionSnapshot,
      _keyValueDatabase,
      currentExpressionSnapshot,
    );

    _isExpressionSnapshotNotAbleToBeTaken = false;

    _isExpressionEvaluationFailed = false;
  }

  void backspace() {
    late final ExpressionSnapshotValueObject updatedCurrentExpressionSnapshot;

    _calculator.backspace();

    updatedCurrentExpressionSnapshot =
        PartialExpressionSnapshotEvaluatingTransactionScript.getPartialEvaluatedExpressionSnapshot(
          _calculator,
        );

    CurrentExpressionSnapshotSynchronizingTransactionScript.synchronizeCurrentExpressionSnapshot(
      updatedCurrentExpressionSnapshot,
      _keyValueDatabase,
      currentExpressionSnapshot,
    );

    _isExpressionSnapshotNotAbleToBeTaken = false;

    _isExpressionEvaluationFailed = false;
  }

  void backspaceAt(int indexOfCharacterToBeBackspaced) {
    late final ExpressionSnapshotValueObject updatedCurrentExpressionSnapshot;

    _calculator.backspaceAt(indexOfCharacterToBeBackspaced);

    updatedCurrentExpressionSnapshot =
        PartialExpressionSnapshotEvaluatingTransactionScript.getPartialEvaluatedExpressionSnapshot(
          _calculator,
        );

    CurrentExpressionSnapshotSynchronizingTransactionScript.synchronizeCurrentExpressionSnapshot(
      updatedCurrentExpressionSnapshot,
      _keyValueDatabase,
      currentExpressionSnapshot,
    );

    _isExpressionSnapshotNotAbleToBeTaken = false;

    _isExpressionEvaluationFailed = false;
  }

  void clean() {
    late final ExpressionSnapshotValueObject updatedCurrentExpressionSnapshot;

    _calculator.clean();

    updatedCurrentExpressionSnapshot = ExpressionSnapshotValueObject(
      _calculator.expression,
      _calculator.expression,
    );

    CurrentExpressionSnapshotSynchronizingTransactionScript.synchronizeCurrentExpressionSnapshot(
      updatedCurrentExpressionSnapshot,
      _keyValueDatabase,
      currentExpressionSnapshot,
    );

    _isExpressionSnapshotNotAbleToBeTaken = true;

    _isExpressionEvaluationFailed = false;
  }

  void evaluate() {
    if (_isExpressionSnapshotNotAbleToBeTaken) return;

    try {
      final expressionBeforeEvaluation = _calculator.expression;
      late final ExpressionSnapshotValueObject expressionSnapshotToBeStored;

      _calculator.evaluate();

      currentExpressionSnapshot.value = ExpressionSnapshotValueObject(
        _calculator.expression,
        _calculator.expression,
      );

      expressionSnapshotToBeStored = ExpressionSnapshotValueObject(
        expressionBeforeEvaluation,
        _calculator.expression,
      );

      _expressionSnapshotHistoryManager.addExpressionSnapshot(
        expressionSnapshotToBeStored,
      );

      listOfPreviousExpressionSnapshots.value = [
        ..._expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots,
      ];

      CalculatorDataStore.setExpressionSnapshot(
        currentExpressionSnapshot.value,
        _keyValueDatabase,
      );

      ExpressionSnapshotHistoryManagerDataStore.setListOfExpressionSnapshots(
        _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots,
        _keyValueDatabase,
      );

      _isExpressionEvaluationFailed = false;
    } catch (_) {
      currentExpressionSnapshot.value = ExpressionSnapshotValueObject(
        currentExpressionSnapshot.value.expression,
        _deviceLanguageStringsViewModel
            .deviceLanguageStrings
            .value
            .NOT_VALID_EXPRESSION_ERROR_MESSAGE,
      );

      _isExpressionEvaluationFailed = true;
    }

    _isExpressionSnapshotNotAbleToBeTaken = true;
  }

  void cleanListOfPreviousExpressionSnapshots() {
    _listOfPreviousExpressionSnapshotsRecovery =
        _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots;

    _expressionSnapshotHistoryManager.cleanListOfPreviousExpressionSnapshots();

    ExpressionSnapshotHistoryManagerDataStore.setListOfExpressionSnapshots(
      _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots,
      _keyValueDatabase,
    );
    listOfPreviousExpressionSnapshots.value =
        _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots;
  }

  void removeExpressionSnapshotFromListOfPreviousExpressionSnapshotsAt(
    int indexOfExpressionSnapshotToBeRemoved,
  ) {
    _expressionSnapshotHistoryManager.removeExpressionSnapshotAt(
      indexOfExpressionSnapshotToBeRemoved,
    );

    ExpressionSnapshotHistoryManagerDataStore.setListOfExpressionSnapshots(
      _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots,
      _keyValueDatabase,
    );
    listOfPreviousExpressionSnapshots.value = [
      ..._expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots,
    ];
  }

  void restoreExpressionSnapshotAt(int indexOfExpressionSnapshotToBeRestored) {
    final restoredExpressionSnapshot = _expressionSnapshotHistoryManager
        .listOfPreviousExpressionSnapshots[indexOfExpressionSnapshotToBeRestored];

    _calculator.expression = restoredExpressionSnapshot.expression;

    CalculatorDataStore.setExpressionSnapshot(
      restoredExpressionSnapshot,
      _keyValueDatabase,
    );

    _isExpressionSnapshotNotAbleToBeTaken = true;

    _isExpressionEvaluationFailed = false;

    currentExpressionSnapshot.value = restoredExpressionSnapshot;
  }

  void restoreListOfPreviousExpressionSnapshots() {
    _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots =
        _listOfPreviousExpressionSnapshotsRecovery!;

    listOfPreviousExpressionSnapshots.value =
        _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots;

    ExpressionSnapshotHistoryManagerDataStore.setListOfExpressionSnapshots(
      _expressionSnapshotHistoryManager.listOfPreviousExpressionSnapshots,
      _keyValueDatabase,
    );

    _listOfPreviousExpressionSnapshotsRecovery = null;
  }

  void dismissRecoveryOfListOfPreviousExpressionSnapshots() {
    _listOfPreviousExpressionSnapshotsRecovery = null;
  }

  void toggleScientificCalculatorKeyboardState() {
    isScientificCalculatorKeyboardExpanded.value =
        !isScientificCalculatorKeyboardExpanded.value;

    ScientificCalculatorKeyboardStateDataStore.setScientificCalculatorKeyboardState(
      isScientificCalculatorKeyboardExpanded.value,
      _keyValueDatabase,
    );
  }

  void setExpressionToNoValidExpressionMessageOnDeviceLanguage() {
    if (_isExpressionEvaluationFailed) {
      currentExpressionSnapshot.value = ExpressionSnapshotValueObject(
        currentExpressionSnapshot.value.expression,
        _deviceLanguageStringsViewModel
            .deviceLanguageStrings
            .value
            .NOT_VALID_EXPRESSION_ERROR_MESSAGE,
      );
    }
  }
}
