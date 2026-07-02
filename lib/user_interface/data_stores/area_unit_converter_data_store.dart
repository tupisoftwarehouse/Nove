import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class AreaUnitConverterDataStore {
  AreaUnitConverterDataStore._();

  static List<AreaUnitEntity> getListOfAreaUnits(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(LIST_OF_AREA_UNITS_KEY, (marshalledData) {
      return AreaUnitEntity.fromMarshalledListData(marshalledData);
    });
  }

  static void setListOfAreaUnits(
    List<AreaUnitEntity> listOfAreaUnits,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_AREA_UNITS_KEY, () {
      return AreaUnitEntity.marshalledListData(listOfAreaUnits);
    });
  }

  static int getBaseAreaUnitIndex(AbstractKeyValueDatabase keyValueDatabase) {
    return keyValueDatabase.getItem(BASE_AREA_UNIT_ELEMENT_INDEX_KEY, (
      marshalledData,
    ) {
      return int.parse(marshalledData);
    });
  }

  static void setBaseAreaUnitIndex(
    int baseAreaUnitIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(BASE_AREA_UNIT_ELEMENT_INDEX_KEY, () {
      return baseAreaUnitIndex.toString();
    });
  }
}
