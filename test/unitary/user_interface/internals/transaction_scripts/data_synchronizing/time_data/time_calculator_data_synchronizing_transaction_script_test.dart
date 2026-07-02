import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_calculator_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/time_data/time_calculator_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeCalculatorDataSynchronizingTransactionScript\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late ValueNotifier<TimeValueObject> firstTimeToBeCalculatedState;
    late ValueNotifier<TimeValueObject> secondTimeToBeCalculatedState;
    late ValueNotifier<TimeValueObject> calculatedTimeState;

    setUpAll(() {
      keyValueDatabase = KeyValueDatabaseMock();

      firstTimeToBeCalculatedState = ValueNotifier<TimeValueObject>(
        ZEROED_TIME,
      );
      secondTimeToBeCalculatedState = ValueNotifier<TimeValueObject>(
        ZEROED_TIME,
      );
      calculatedTimeState = ValueNotifier<TimeValueObject>(ZEROED_TIME);
    });

    test(
      "Test If Method \"synchronizeTimeData\" Stores Data And Updates State",
      () {
        TimeCalculatorDataSynchronizingTransactionScript.synchronizeTimeData(
          TIME_TO_BE_CALCULATED,
          TIME_TO_BE_CALCULATED,
          CALCULATED_TIME,
          keyValueDatabase,
          firstTimeToBeCalculatedState,
          secondTimeToBeCalculatedState,
          calculatedTimeState,
        );

        final firstTimeFromDatabase =
            TimeCalculatorDataStore.getFirstTimeToBeCalculated(
              keyValueDatabase,
            );
        final secondTimeFromDatabase =
            TimeCalculatorDataStore.getSecondTimeToBeCalculated(
              keyValueDatabase,
            );
        final calculatedTimeFromDatabase =
            TimeCalculatorDataStore.getCalculatedTime(keyValueDatabase);

        expect(
          firstTimeToBeCalculatedState.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          firstTimeToBeCalculatedState.value.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          firstTimeToBeCalculatedState.value.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );

        expect(
          secondTimeToBeCalculatedState.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          secondTimeToBeCalculatedState.value.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          secondTimeToBeCalculatedState.value.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );

        expect(calculatedTimeState.value.hours, CALCULATED_TIME.hours);
        expect(calculatedTimeState.value.minutes, CALCULATED_TIME.minutes);
        expect(calculatedTimeState.value.seconds, CALCULATED_TIME.seconds);

        expect(firstTimeFromDatabase.hours, TIME_TO_BE_CALCULATED.hours);
        expect(firstTimeFromDatabase.minutes, TIME_TO_BE_CALCULATED.minutes);
        expect(firstTimeFromDatabase.seconds, TIME_TO_BE_CALCULATED.seconds);

        expect(secondTimeFromDatabase.hours, TIME_TO_BE_CALCULATED.hours);
        expect(secondTimeFromDatabase.minutes, TIME_TO_BE_CALCULATED.minutes);
        expect(secondTimeFromDatabase.seconds, TIME_TO_BE_CALCULATED.seconds);

        expect(calculatedTimeFromDatabase.hours, CALCULATED_TIME.hours);
        expect(calculatedTimeFromDatabase.minutes, CALCULATED_TIME.minutes);
        expect(calculatedTimeFromDatabase.seconds, CALCULATED_TIME.seconds);
      },
    );
  });
}
