import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/time_aggregator_data_store.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";

class TimeAggregatorViewModelFactory {
  TimeAggregatorViewModelFactory._();

  static TimeAggregatorViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    try {
      final listOfTimesFromKeyValueDatabase =
          TimeAggregatorDataStore.getListOfTimes(keyValueDatabase);
      final aggregatedTimeFromKeyValueDatabase =
          TimeAggregatorDataStore.getAggregatedTime(keyValueDatabase);

      final timeAggregator = TimeAggregator(
        listOfTimesFromKeyValueDatabase,
        aggregatedTimeFromKeyValueDatabase,
      );

      return TimeAggregatorViewModel(timeAggregator, keyValueDatabase);
    } catch (_) {
      final timeAggregator = TimeAggregator([ZEROED_TIME], ZEROED_TIME);

      return TimeAggregatorViewModel(timeAggregator, keyValueDatabase);
    }
  }
}
