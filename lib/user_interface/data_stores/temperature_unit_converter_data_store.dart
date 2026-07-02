import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class TemperatureUnitConverterDataStore {
  TemperatureUnitConverterDataStore._();

  static List<TemperatureUnitEntity> getListOfTemperatureUnits(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(LIST_OF_TEMPERATURE_UNITS_KEY, (
      marshalledListData,
    ) {
      return TemperatureUnitEntity.fromMarshalledListData(marshalledListData);
    });
  }

  static void setListOfTemperatureUnits(
    List<TemperatureUnitEntity> listOfTemperatureUnits,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_TEMPERATURE_UNITS_KEY, () {
      return TemperatureUnitEntity.marshalledListData(listOfTemperatureUnits);
    });
  }

  static int getBaseTemperatureUnitIndex(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(BASE_TEMPERATURE_UNIT_ELEMENT_INDEX_KEY, (
      marshalledListData,
    ) {
      return int.parse(marshalledListData);
    });
  }

  static void setBaseTemperatureUnitIndex(
    int baseTemperatureUnitIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(BASE_TEMPERATURE_UNIT_ELEMENT_INDEX_KEY, () {
      return baseTemperatureUnitIndex.toString();
    });
  }
}
