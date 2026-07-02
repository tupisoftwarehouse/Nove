import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class MassUnitConverterDataStore {
  MassUnitConverterDataStore._();

  static List<MassUnitEntity> getListOfMassUnits(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(LIST_OF_MASS_UNITS_KEY, (
      marshalledListData,
    ) {
      return MassUnitEntity.fromMarshalledListData(marshalledListData);
    });
  }

  static void setListOfMassUnits(
    List<MassUnitEntity> listOfMassUnits,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_MASS_UNITS_KEY, () {
      return MassUnitEntity.marshalledListData(listOfMassUnits);
    });
  }

  static int getBaseMassUnitIndex(AbstractKeyValueDatabase keyValueDatabase) {
    return keyValueDatabase.getItem(BASE_MASS_UNIT_ELEMENT_INDEX_KEY, (
      marshalledListData,
    ) {
      return int.parse(marshalledListData);
    });
  }

  static void setBaseMassUnitIndex(
    int baseMassUnitIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(BASE_MASS_UNIT_ELEMENT_INDEX_KEY, () {
      return baseMassUnitIndex.toString();
    });
  }
}
