import "package:flutter/foundation.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/time_data/time_aggregator_data_synchronizing_transaction_script.dart";

class TimeAggregatorViewModel {
  final TimeAggregator _timeAggregator;
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<List<TimeValueObject>> listOfTimes;
  final ValueNotifier<TimeValueObject> aggregatedTime;
  List<TimeValueObject>? _listOfTimesRecovery;
  TimeValueObject? _aggregatedTimeRecovery;

  TimeAggregatorViewModel(this._timeAggregator, this._keyValueDatabase)
    : listOfTimes = ValueNotifier<List<TimeValueObject>>(
        _timeAggregator.listOfTimes,
      ),
      aggregatedTime = ValueNotifier<TimeValueObject>(
        _timeAggregator.aggregatedTime,
      );

  void addTime() {
    _timeAggregator.addTime();

    TimeAggregatorDataSynchronizingTransactionScript.synchronizeListOfTimesAndAggregatedTime(
      _timeAggregator,
      _keyValueDatabase,
      listOfTimes,
      aggregatedTime,
    );
  }

  void addTimeAt(int indexOfTimeToBeAdded) {
    _timeAggregator.addTimeAt(indexOfTimeToBeAdded);

    TimeAggregatorDataSynchronizingTransactionScript.synchronizeListOfTimesAndAggregatedTime(
      _timeAggregator,
      _keyValueDatabase,
      listOfTimes,
      aggregatedTime,
    );
  }

  void updateTime(TimeValueObject updatedTime, int indexOfTimeToBeUpdated) {
    _timeAggregator.updateTime(updatedTime, indexOfTimeToBeUpdated);

    TimeAggregatorDataSynchronizingTransactionScript.synchronizeListOfTimesAndAggregatedTime(
      _timeAggregator,
      _keyValueDatabase,
      listOfTimes,
      aggregatedTime,
    );
  }

  void removeTime(int indexOfTimeToBeRemoved) {
    _timeAggregator.removeTime(indexOfTimeToBeRemoved);

    TimeAggregatorDataSynchronizingTransactionScript.synchronizeListOfTimesAndAggregatedTime(
      _timeAggregator,
      _keyValueDatabase,
      listOfTimes,
      aggregatedTime,
    );
  }

  void reset() {
    _listOfTimesRecovery = _timeAggregator.listOfTimes;
    _aggregatedTimeRecovery = _timeAggregator.aggregatedTime;

    _timeAggregator.reset();

    TimeAggregatorDataSynchronizingTransactionScript.synchronizeListOfTimesAndAggregatedTime(
      _timeAggregator,
      _keyValueDatabase,
      listOfTimes,
      aggregatedTime,
    );
  }

  void restore() {
    _timeAggregator.aggregatedTime = _aggregatedTimeRecovery!;
    _timeAggregator.listOfTimes = _listOfTimesRecovery!;

    TimeAggregatorDataSynchronizingTransactionScript.synchronizeListOfTimesAndAggregatedTime(
      _timeAggregator,
      _keyValueDatabase,
      listOfTimes,
      aggregatedTime,
    );

    _aggregatedTimeRecovery = null;
    _listOfTimesRecovery = null;
  }

  void dismissRecovery() {
    _aggregatedTimeRecovery = null;
    _listOfTimesRecovery = null;
  }
}
