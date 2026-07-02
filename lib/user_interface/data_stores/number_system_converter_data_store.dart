import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class NumberSystemConverterDataStore {
  NumberSystemConverterDataStore._();

  static List<NumberSystemEntity> getListOfNumberSystems(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(LIST_OF_NUMBER_SYSTEMS_KEY, (
      marshalledListData,
    ) {
      return NumberSystemEntity.fromMarshalledListData(marshalledListData);
    });
  }

  static void setListOfNumberSystems(
    List<NumberSystemEntity> listOfNumberSystems,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_NUMBER_SYSTEMS_KEY, () {
      return NumberSystemEntity.marshalledListData(listOfNumberSystems);
    });
  }

  static int getBaseNumberSystemIndex(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(BASE_NUMBER_SYSTEM_ELEMENT_INDEX_KEY, (
      marshalledListData,
    ) {
      return int.parse(marshalledListData);
    });
  }

  static void setBaseNumberSystemIndex(
    int baseNumberSystemIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(BASE_NUMBER_SYSTEM_ELEMENT_INDEX_KEY, () {
      return baseNumberSystemIndex.toString();
    });
  }
}
