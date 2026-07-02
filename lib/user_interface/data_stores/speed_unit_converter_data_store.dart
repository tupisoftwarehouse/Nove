import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class SpeedUnitConverterDataStore {
  SpeedUnitConverterDataStore._();

  static List<SpeedUnitEntity> getListOfSpeedUnits(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(LIST_OF_SPEED_UNITS_KEY, (
      marshalledListData,
    ) {
      return SpeedUnitEntity.fromMarshalledListData(marshalledListData);
    });
  }

  static void setListOfSpeedUnits(
    List<SpeedUnitEntity> listOfSpeedUnits,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_SPEED_UNITS_KEY, () {
      return SpeedUnitEntity.marshalledListData(listOfSpeedUnits);
    });
  }

  static int getBaseSpeedUnitIndex(AbstractKeyValueDatabase keyValueDatabase) {
    return keyValueDatabase.getItem(BASE_SPEED_UNIT_ELEMENT_INDEX_KEY, (
      marshalledListData,
    ) {
      return int.parse(marshalledListData);
    });
  }

  static void setBaseSpeedUnitIndex(
    int baseSpeedUnitIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(BASE_SPEED_UNIT_ELEMENT_INDEX_KEY, () {
      return baseSpeedUnitIndex.toString();
    });
  }
}
