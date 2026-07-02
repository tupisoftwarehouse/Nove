import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class TimeCalculatorDataStore {
  TimeCalculatorDataStore._();

  static TimeValueObject getFirstTimeToBeCalculated(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<TimeValueObject>(
      FIRST_TIME_TO_BE_CALCULATED_KEY,
      (marshalledData) {
        return TimeValueObject.fromMarshalledData(marshalledData);
      },
    );
  }

  static void setFirstTimeToBeCalculated(
    TimeValueObject updatedFirstTimeToBeCalculated,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(FIRST_TIME_TO_BE_CALCULATED_KEY, () {
      return updatedFirstTimeToBeCalculated.marshalledData;
    });
  }

  static TimeValueObject getSecondTimeToBeCalculated(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<TimeValueObject>(
      SECOND_TIME_TO_BE_CALCULATED_KEY,
      (marshalledData) {
        return TimeValueObject.fromMarshalledData(marshalledData);
      },
    );
  }

  static void setSecondTimeToBeCalculated(
    TimeValueObject updatedSecondTimeToBeCalculated,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(SECOND_TIME_TO_BE_CALCULATED_KEY, () {
      return updatedSecondTimeToBeCalculated.marshalledData;
    });
  }

  static TimeValueObject getCalculatedTime(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<TimeValueObject>(CALCULATED_TIME_KEY, (
      marshalledData,
    ) {
      return TimeValueObject.fromMarshalledData(marshalledData);
    });
  }

  static void setCalculatedTime(
    TimeValueObject updatedCalculatedTime,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(CALCULATED_TIME_KEY, () {
      return updatedCalculatedTime.marshalledData;
    });
  }
}
