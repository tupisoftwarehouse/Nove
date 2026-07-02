import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_aggregator_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/time_data/time_aggregator_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeAggregatorDataSynchronizingTransactionScript\" Class", () {
    late TimeAggregator timeAggregator;
    late AbstractKeyValueDatabase keyValueDatabase;
    late ValueNotifier<List<TimeValueObject>> listOfTimesState;
    late ValueNotifier<TimeValueObject> aggregatedTimeState;

    setUpAll(() {
      keyValueDatabase = KeyValueDatabaseMock();

      timeAggregator = TimeAggregator([ZEROED_TIME], ZEROED_TIME);

      listOfTimesState = ValueNotifier<List<TimeValueObject>>([]);
      aggregatedTimeState = ValueNotifier<TimeValueObject>(ZEROED_TIME);
    });

    test(
      "Test If Method \"synchronizeListOfTimesAndAggregatedTime\" Synchronizes Data To KeyValueDatabase And UI State",
      () {
        TimeAggregatorDataSynchronizingTransactionScript.synchronizeListOfTimesAndAggregatedTime(
          timeAggregator,
          keyValueDatabase,
          listOfTimesState,
          aggregatedTimeState,
        );

        final listOfTimesFromKeyValueDatabase =
            TimeAggregatorDataStore.getListOfTimes(keyValueDatabase);

        final aggregatedTimeFromKeyValueDatabase =
            TimeAggregatorDataStore.getAggregatedTime(keyValueDatabase);

        expect(listOfTimesFromKeyValueDatabase.length, 1);
        expect(listOfTimesState.value.length, 1);

        expect(aggregatedTimeFromKeyValueDatabase.hours, ZEROED_TIME.hours);
        expect(aggregatedTimeFromKeyValueDatabase.minutes, ZEROED_TIME.minutes);
        expect(aggregatedTimeFromKeyValueDatabase.seconds, ZEROED_TIME.seconds);

        expect(aggregatedTimeState.value.hours, ZEROED_TIME.hours);
        expect(aggregatedTimeState.value.minutes, ZEROED_TIME.minutes);
        expect(aggregatedTimeState.value.seconds, ZEROED_TIME.seconds);
      },
    );
  });
}
