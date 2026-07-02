import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class TimeAggregatorDataStore {
  TimeAggregatorDataStore._();

  static List<TimeValueObject> getListOfTimes(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<List<TimeValueObject>>(LIST_OF_TIMES_KEY, (
      marshalledListData,
    ) {
      return TimeValueObject.fromMarshalledListData(marshalledListData);
    });
  }

  static void setListOfTimes(
    List<TimeValueObject> updatedListOfTimes,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_TIMES_KEY, () {
      return TimeValueObject.marshalledListData(updatedListOfTimes);
    });
  }

  static TimeValueObject getAggregatedTime(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<TimeValueObject>(AGGREGATED_TIME_KEY, (
      marshalledListData,
    ) {
      return TimeValueObject.fromMarshalledData(marshalledListData);
    });
  }

  static void setAggregatedTime(
    TimeValueObject updatedAggregatedTime,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(AGGREGATED_TIME_KEY, () {
      return updatedAggregatedTime.marshalledData;
    });
  }
}
