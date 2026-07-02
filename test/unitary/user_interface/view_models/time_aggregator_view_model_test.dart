import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_aggregator_constants.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_aggregator_data_store.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeAggregatorViewModel\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late TimeAggregator timeAggregator;
    late TimeAggregatorViewModel timeAggregatorViewModel;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();

      timeAggregator = TimeAggregator([ZEROED_TIME], ZEROED_TIME);

      timeAggregatorViewModel = TimeAggregatorViewModel(
        timeAggregator,
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With \"TimeAggregator\" Data",
      () {
        timeAggregator = TimeAggregator([
          TIME_TO_BE_AGGREGATED,
        ], TIME_TO_BE_AGGREGATED);

        timeAggregatorViewModel = TimeAggregatorViewModel(
          timeAggregator,
          keyValueDatabase,
        );

        expect(
          timeAggregatorViewModel.listOfTimes.value[0].hours,
          TIME_TO_BE_AGGREGATED.hours,
        );
        expect(
          timeAggregatorViewModel.listOfTimes.value[0].minutes,
          TIME_TO_BE_AGGREGATED.minutes,
        );
        expect(
          timeAggregatorViewModel.listOfTimes.value[0].seconds,
          TIME_TO_BE_AGGREGATED.seconds,
        );

        expect(
          timeAggregatorViewModel.aggregatedTime.value.hours,
          TIME_TO_BE_AGGREGATED.hours,
        );
        expect(
          timeAggregatorViewModel.aggregatedTime.value.minutes,
          TIME_TO_BE_AGGREGATED.minutes,
        );
        expect(
          timeAggregatorViewModel.aggregatedTime.value.seconds,
          TIME_TO_BE_AGGREGATED.seconds,
        );
      },
    );

    test(
      "Test If Method \"addTime\" Adds Time And Stores Values On Key-Value Database",
      () {
        timeAggregatorViewModel.addTime();

        final listOfTimesFromDatabase = TimeAggregatorDataStore.getListOfTimes(
          keyValueDatabase,
        );

        final aggregatedTimeFromDatabase =
            TimeAggregatorDataStore.getAggregatedTime(keyValueDatabase);

        expect(timeAggregatorViewModel.listOfTimes.value.length, 2);
        expect(listOfTimesFromDatabase.length, 2);

        expect(
          timeAggregatorViewModel.aggregatedTime.value.hours,
          ZEROED_TIME.hours,
        );
        expect(aggregatedTimeFromDatabase.minutes, ZEROED_TIME.minutes);

        expect(
          timeAggregatorViewModel.listOfTimes.value[1].seconds,
          ZEROED_TIME.seconds,
        );
        expect(listOfTimesFromDatabase[1].seconds, ZEROED_TIME.seconds);
      },
    );

    test(
      "Test If Method \"addTimeAt\" Adds Time At Given Index And Stores Values",
      () {
        timeAggregatorViewModel.addTimeAt(1);

        final listOfTimesFromDatabase = TimeAggregatorDataStore.getListOfTimes(
          keyValueDatabase,
        );

        expect(timeAggregatorViewModel.listOfTimes.value.length, 2);
        expect(listOfTimesFromDatabase.length, 2);
      },
    );

    test(
      "Test If Method \"updateTime\" Updates Time At Given Index And Stores Values",
      () {
        timeAggregatorViewModel.updateTime(TIME_TO_BE_AGGREGATED, 0);

        final aggregatedTimeFromDatabase =
            TimeAggregatorDataStore.getAggregatedTime(keyValueDatabase);

        final listOfTimesFromDatabase = TimeAggregatorDataStore.getListOfTimes(
          keyValueDatabase,
        );

        expect(
          timeAggregatorViewModel.aggregatedTime.value.hours,
          TIME_TO_BE_AGGREGATED.hours,
        );
        expect(
          aggregatedTimeFromDatabase.minutes,
          TIME_TO_BE_AGGREGATED.minutes,
        );

        expect(
          timeAggregatorViewModel.listOfTimes.value[0].seconds,
          TIME_TO_BE_AGGREGATED.seconds,
        );
        expect(
          listOfTimesFromDatabase[0].seconds,
          TIME_TO_BE_AGGREGATED.seconds,
        );
      },
    );

    test(
      "Test If Method \"removeTime\" Removes Time At Given Index And Stores Values",
      () {
        timeAggregator = TimeAggregator([
          TIME_TO_BE_AGGREGATED,
          TIME_TO_BE_AGGREGATED,
        ], AGGREGATED_TIME);

        timeAggregatorViewModel = TimeAggregatorViewModel(
          timeAggregator,
          keyValueDatabase,
        );

        timeAggregatorViewModel.removeTime(1);

        final listOfTimesFromDatabase = TimeAggregatorDataStore.getListOfTimes(
          keyValueDatabase,
        );

        expect(timeAggregatorViewModel.listOfTimes.value.length, 1);
        expect(listOfTimesFromDatabase.length, 1);
      },
    );

    test("Test If Method \"reset\" Resets Aggregator And Stores Values", () {
      TimeAggregatorDataStore.setListOfTimes(
        EDITED_LIST_OF_TIMES,
        keyValueDatabase,
      );
      TimeAggregatorDataStore.setAggregatedTime(
        TIME_TO_BE_AGGREGATED,
        keyValueDatabase,
      );

      timeAggregatorViewModel.reset();

      final aggregatedTimeFromDatabase =
          TimeAggregatorDataStore.getAggregatedTime(keyValueDatabase);

      expect(
        timeAggregatorViewModel.aggregatedTime.value.hours,
        ZEROED_TIME.hours,
      );
      expect(aggregatedTimeFromDatabase.minutes, ZEROED_TIME.minutes);
    });
  });
}
