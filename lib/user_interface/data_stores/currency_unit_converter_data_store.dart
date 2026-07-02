import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class CurrencyUnitConverterDataStore {
  CurrencyUnitConverterDataStore._();

  static List<CurrencyUnitEntity> getListOfCurrencyUnits(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(LIST_OF_CURRENCY_UNITS_KEY, (
      marshalledListData,
    ) {
      return CurrencyUnitEntity.fromMarshalledListData(marshalledListData);
    });
  }

  static void setListOfCurrencyUnits(
    List<CurrencyUnitEntity> listOfCurrencyUnits,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(LIST_OF_CURRENCY_UNITS_KEY, () {
      return CurrencyUnitEntity.marshalledListData(listOfCurrencyUnits);
    });
  }

  static int getBaseCurrencyUnitIndex(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem(BASE_CURRENCY_UNIT_ELEMENT_INDEX_KEY, (
      marshalledListData,
    ) {
      return int.parse(marshalledListData);
    });
  }

  static void setBaseCurrencyUnitIndex(
    int baseCurrencyUnitIndex,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(BASE_CURRENCY_UNIT_ELEMENT_INDEX_KEY, () {
      return baseCurrencyUnitIndex.toString();
    });
  }
}
