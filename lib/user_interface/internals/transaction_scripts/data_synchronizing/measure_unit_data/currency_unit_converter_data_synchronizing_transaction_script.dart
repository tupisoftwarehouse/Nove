import "package:flutter/foundation.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/currency_unit_converter_data_store.dart";

class CurrencyUnitConverterDataSynchronizingTransactionScript {
  CurrencyUnitConverterDataSynchronizingTransactionScript._();

  static void synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
    CurrencyUnitConverter currencyUnitConverter,
    AbstractKeyValueDatabase keyValueDatabase,
    ValueNotifier<List<CurrencyUnitEntity>> listOfCurrencyUnits,
    ValueNotifier<int> baseCurrencyUnitIndex,
  ) {
    CurrencyUnitConverterDataStore.setListOfCurrencyUnits(
      currencyUnitConverter.listOfCurrencyUnits,
      keyValueDatabase,
    );
    CurrencyUnitConverterDataStore.setBaseCurrencyUnitIndex(
      currencyUnitConverter.baseCurrencyUnitIndex,
      keyValueDatabase,
    );

    listOfCurrencyUnits.value = [...currencyUnitConverter.listOfCurrencyUnits];
    baseCurrencyUnitIndex.value = currencyUnitConverter.baseCurrencyUnitIndex;
  }
}
