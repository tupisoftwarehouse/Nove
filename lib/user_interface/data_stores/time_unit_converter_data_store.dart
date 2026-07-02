import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class TimeUnitConverterDataStore {
  TimeUnitConverterDataStore._();
  static List<TimeUnitEntity> getListOfTimeUnits(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(LIST_OF_TIME_UNITS_KEY, (marshalledData) {
      return TimeUnitEntity.fromMarshalledListData(marshalledData);
    });
  }

  static void setListOfTimeUnits(
    List<TimeUnitEntity> listOfTimeUnits,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_TIME_UNITS_KEY, () {
      return TimeUnitEntity.marshalledListData(listOfTimeUnits);
    });
  }

  static int getBaseTimeUnitIndex(AbstractKeyValueDatabase keyValueDatabase) {
    return keyValueDatabase.getItem(BASE_TIME_UNIT_ELEMENT_INDEX_KEY, (
      marshalledData,
    ) {
      return int.parse(marshalledData);
    });
  }

  static void setBaseTimeUnitIndex(
    int baseTimeUnitIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(BASE_TIME_UNIT_ELEMENT_INDEX_KEY, () {
      return baseTimeUnitIndex.toString();
    });
  }
}
