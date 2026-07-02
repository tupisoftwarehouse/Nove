import "package:flutter/widgets.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_calculator_data_store.dart";

class TimeCalculatorDataSynchronizingTransactionScript {
  TimeCalculatorDataSynchronizingTransactionScript._();

  static void synchronizeTimeData(
    TimeValueObject updateFirstTimeToBeCalculated,
    TimeValueObject updateSecondTimeToBeCalculated,
    TimeValueObject updateCalculatedTime,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<TimeValueObject> firstTimeToBeCalculated,
    ValueNotifier<TimeValueObject> secondTimeToBeCalculated,
    ValueNotifier<TimeValueObject> calculatedTime,
  ) {
    TimeCalculatorDataStore.setFirstTimeToBeCalculated(
      updateFirstTimeToBeCalculated,
      keyValueDatabase,
    );
    TimeCalculatorDataStore.setSecondTimeToBeCalculated(
      updateSecondTimeToBeCalculated,
      keyValueDatabase,
    );
    TimeCalculatorDataStore.setCalculatedTime(
      updateCalculatedTime,
      keyValueDatabase,
    );

    firstTimeToBeCalculated.value = updateFirstTimeToBeCalculated;
    secondTimeToBeCalculated.value = updateSecondTimeToBeCalculated;
    calculatedTime.value = updateCalculatedTime;
  }
}
