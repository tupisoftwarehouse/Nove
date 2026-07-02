import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_aggregator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_aggregator_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeAggregatorDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfTimes\" Returns List Of Times From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_TIMES_KEY, () {
          return TimeValueObject.marshalledListData([TIME_TO_BE_AGGREGATED]);
        });

        final listOfTimesFromKeyValueDatabase =
            TimeAggregatorDataStore.getListOfTimes(keyValueDatabase);

        expect(
          listOfTimesFromKeyValueDatabase[0].hours,
          TIME_TO_BE_AGGREGATED.hours,
        );
        expect(
          listOfTimesFromKeyValueDatabase[0].minutes,
          TIME_TO_BE_AGGREGATED.minutes,
        );
        expect(
          listOfTimesFromKeyValueDatabase[0].seconds,
          TIME_TO_BE_AGGREGATED.seconds,
        );

        expect(listOfTimesFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfTimes\" Sets List Of Times On Key-Value Database",
      () {
        TimeAggregatorDataStore.setListOfTimes([
          TIME_TO_BE_AGGREGATED,
        ], keyValueDatabase);

        final listOfTimesFromKeyValueDatabase = keyValueDatabase.getItem(
          LIST_OF_TIMES_KEY,
          (marshalledData) {
            return TimeValueObject.fromMarshalledListData(marshalledData);
          },
        );

        expect(
          listOfTimesFromKeyValueDatabase[0].hours,
          TIME_TO_BE_AGGREGATED.hours,
        );
        expect(
          listOfTimesFromKeyValueDatabase[0].minutes,
          TIME_TO_BE_AGGREGATED.minutes,
        );
        expect(
          listOfTimesFromKeyValueDatabase[0].seconds,
          TIME_TO_BE_AGGREGATED.seconds,
        );

        expect(listOfTimesFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getAggregatedTime\" Returns Aggregated Time From Key-Value Database",
      () {
        keyValueDatabase.setItem(AGGREGATED_TIME_KEY, () {
          return TIME_TO_BE_AGGREGATED.marshalledData;
        });

        final aggregatedTimeFromKeyValueDatabase =
            TimeAggregatorDataStore.getAggregatedTime(keyValueDatabase);

        expect(
          aggregatedTimeFromKeyValueDatabase.hours,
          TIME_TO_BE_AGGREGATED.hours,
        );
        expect(
          aggregatedTimeFromKeyValueDatabase.minutes,
          TIME_TO_BE_AGGREGATED.minutes,
        );
        expect(
          aggregatedTimeFromKeyValueDatabase.seconds,
          TIME_TO_BE_AGGREGATED.seconds,
        );
      },
    );

    test(
      "Test If Method \"setAggregatedTime\" Sets Aggregated Time On Key-Value Database",
      () {
        TimeAggregatorDataStore.setAggregatedTime(
          TIME_TO_BE_AGGREGATED,
          keyValueDatabase,
        );

        final aggregatedTimeFromKeyValueDatabase = keyValueDatabase.getItem(
          AGGREGATED_TIME_KEY,
          (marshalledData) {
            return TimeValueObject.fromMarshalledData(marshalledData);
          },
        );

        expect(
          aggregatedTimeFromKeyValueDatabase.hours,
          TIME_TO_BE_AGGREGATED.hours,
        );
        expect(
          aggregatedTimeFromKeyValueDatabase.minutes,
          TIME_TO_BE_AGGREGATED.minutes,
        );
        expect(
          aggregatedTimeFromKeyValueDatabase.seconds,
          TIME_TO_BE_AGGREGATED.seconds,
        );
      },
    );
  });
}
