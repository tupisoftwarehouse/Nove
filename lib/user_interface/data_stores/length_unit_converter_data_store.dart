import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class LengthUnitConverterDataStore {
  LengthUnitConverterDataStore._();

  static List<LengthUnitEntity> getListOfLengthUnits(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(LIST_OF_LENGTH_UNITS_KEY, (
      marshalledListData,
    ) {
      return LengthUnitEntity.fromMarshalledListData(marshalledListData);
    });
  }

  static void setListOfLengthUnits(
    List<LengthUnitEntity> listOfLengthUnits,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_LENGTH_UNITS_KEY, () {
      return LengthUnitEntity.marshalledListData(listOfLengthUnits);
    });
  }

  static int getBaseLengthUnitIndex(AbstractKeyValueDatabase keyValueDatabase) {
    return keyValueDatabase.getItem(BASE_LENGTH_UNIT_ELEMENT_INDEX_KEY, (
      marshalledListData,
    ) {
      return int.parse(marshalledListData);
    });
  }

  static void setBaseLengthUnitIndex(
    int baseLengthUnitIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(BASE_LENGTH_UNIT_ELEMENT_INDEX_KEY, () {
      return baseLengthUnitIndex.toString();
    });
  }
}
