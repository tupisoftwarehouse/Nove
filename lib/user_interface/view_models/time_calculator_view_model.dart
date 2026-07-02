import "package:flutter/foundation.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/domain/time_calculator/time_calculator.dart";
import "package:nove/user_interface/data_stores/time_calculator_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/time_data/time_calculator_data_synchronizing_transaction_script.dart";

class TimeCalculatorViewModel {
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<TimeValueObject> firstTimeToBeCalculated =
      ValueNotifier<TimeValueObject>(ZEROED_TIME);
  final ValueNotifier<TimeValueObject> secondTimeToBeCalculated =
      ValueNotifier<TimeValueObject>(ZEROED_TIME);
  final ValueNotifier<TimeValueObject> calculatedTime =
      ValueNotifier<TimeValueObject>(ZEROED_TIME);
  TimeValueObject? _firstTimeToBeCalculatedRecovery;
  TimeValueObject? _secondTimeToBeCalculatedRecovery;
  TimeValueObject? _calculatedTimeRecovery;

  TimeCalculatorViewModel(this._keyValueDatabase) {
    try {
      final storedFirstTimeToBeCalculated =
          TimeCalculatorDataStore.getFirstTimeToBeCalculated(_keyValueDatabase);
      final storedSecondTimeToBeCalculated =
          TimeCalculatorDataStore.getSecondTimeToBeCalculated(
            _keyValueDatabase,
          );
      final storedCalculatedTime = TimeCalculatorDataStore.getCalculatedTime(
        _keyValueDatabase,
      );

      firstTimeToBeCalculated.value = storedFirstTimeToBeCalculated;
      secondTimeToBeCalculated.value = storedSecondTimeToBeCalculated;

      calculatedTime.value = storedCalculatedTime;
    } catch (_) {}
  }

  void setFirstTimeToBeCalculated(TimeValueObject updatedTime) {
    TimeCalculatorDataStore.setFirstTimeToBeCalculated(
      updatedTime,
      _keyValueDatabase,
    );

    firstTimeToBeCalculated.value = updatedTime;
  }

  void setSecondTimeToBeCalculated(TimeValueObject updatedTime) {
    TimeCalculatorDataStore.setSecondTimeToBeCalculated(
      updatedTime,
      _keyValueDatabase,
    );

    secondTimeToBeCalculated.value = updatedTime;
  }

  void addTime() {
    final updatedCalculatedTime = TimeCalculator.getAddedTime(
      firstTimeToBeCalculated.value,
      secondTimeToBeCalculated.value,
    );

    TimeCalculatorDataStore.setCalculatedTime(
      updatedCalculatedTime,
      _keyValueDatabase,
    );

    calculatedTime.value = updatedCalculatedTime;
  }

  void subtractTime() {
    final updatedCalculatedTime = TimeCalculator.getSubtractedTime(
      firstTimeToBeCalculated.value,
      secondTimeToBeCalculated.value,
    );

    TimeCalculatorDataStore.setCalculatedTime(
      updatedCalculatedTime,
      _keyValueDatabase,
    );

    calculatedTime.value = updatedCalculatedTime;
  }

  void reset() {
    _firstTimeToBeCalculatedRecovery = firstTimeToBeCalculated.value;
    _secondTimeToBeCalculatedRecovery = secondTimeToBeCalculated.value;
    _calculatedTimeRecovery = calculatedTime.value;

    TimeCalculatorDataSynchronizingTransactionScript.synchronizeTimeData(
      ZEROED_TIME,
      ZEROED_TIME,
      ZEROED_TIME,
      _keyValueDatabase,
      firstTimeToBeCalculated,
      secondTimeToBeCalculated,
      calculatedTime,
    );
  }

  void restore() {
    TimeCalculatorDataSynchronizingTransactionScript.synchronizeTimeData(
      _firstTimeToBeCalculatedRecovery!,
      _secondTimeToBeCalculatedRecovery!,
      _calculatedTimeRecovery!,
      _keyValueDatabase,
      firstTimeToBeCalculated,
      secondTimeToBeCalculated,
      calculatedTime,
    );

    _firstTimeToBeCalculatedRecovery = null;
    _secondTimeToBeCalculatedRecovery = null;
    _calculatedTimeRecovery = null;
  }

  void dismissRecovery() {
    _firstTimeToBeCalculatedRecovery = null;
    _secondTimeToBeCalculatedRecovery = null;
    _calculatedTimeRecovery = null;
  }
}
