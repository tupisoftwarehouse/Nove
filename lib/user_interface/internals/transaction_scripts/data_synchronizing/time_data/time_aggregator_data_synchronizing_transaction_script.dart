import "package:flutter/foundation.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/time_aggregator_data_store.dart";

class TimeAggregatorDataSynchronizingTransactionScript {
  TimeAggregatorDataSynchronizingTransactionScript._();

  static void synchronizeListOfTimesAndAggregatedTime(
    TimeAggregator timeAggregator,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<TimeValueObject>> listOfTimes,
    ValueNotifier<TimeValueObject> aggregatedTime,
  ) {
    TimeAggregatorDataStore.setListOfTimes(
      timeAggregator.listOfTimes,
      keyValueDatabase,
    );
    TimeAggregatorDataStore.setAggregatedTime(
      timeAggregator.aggregatedTime,
      keyValueDatabase,
    );

    listOfTimes.value = [...timeAggregator.listOfTimes];
    aggregatedTime.value = timeAggregator.aggregatedTime;
  }
}
