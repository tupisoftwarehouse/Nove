import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/currency_unit_converter_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/measure_unit_data/currency_unit_converter_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group(
    "Test \"CurrencyUnitConverterDataSynchronizingTransactionScript\" Class",
    () {
      late CurrencyUnitConverter currencyUnitConverter;
      late MeasureUnitConverter<CurrencyUnit> measureUnitConverter;
      late AbstractKeyValueDatabase keyValueDatabase;
      late ValueNotifier<List<CurrencyUnitEntity>> listOfCurrencyUnitsState;
      late ValueNotifier<int> baseCurrencyUnitIndexState;

      setUpAll(() {
        keyValueDatabase = KeyValueDatabaseMock();

        measureUnitConverter = MeasureUnitConverter<CurrencyUnit>(
          ZEROED_CURRENCY_UNIT,
          [CURRENCY_UNIT_TO_CONVERT_TO((_) {})],
          0,
        );

        currencyUnitConverter = CurrencyUnitConverter(
          measureUnitConverter,
          CURRENCY_VALUES,
        );

        listOfCurrencyUnitsState = ValueNotifier([]);
        baseCurrencyUnitIndexState = ValueNotifier(-1);
      });

      test(
        "Test If Method \"synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex\" Stores List And Base Index And Updates State",
        () {
          CurrencyUnitConverterDataSynchronizingTransactionScript.synchronizeListOfCurrencyUnitsAndBaseCurrencyUnitIndex(
            currencyUnitConverter,
            keyValueDatabase,
            listOfCurrencyUnitsState,
            baseCurrencyUnitIndexState,
          );

          final listOfCurrencyUnitsFromKeyValueDatabase =
              CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
                keyValueDatabase,
              );

          final baseCurrencyUnitIndexFromKeyValueDatabase =
              CurrencyUnitConverterDataStore.getBaseCurrencyUnitIndex(
                keyValueDatabase,
              );

          expect(listOfCurrencyUnitsState.value.length, 1);
          expect(listOfCurrencyUnitsFromKeyValueDatabase.length, 1);

          expect(baseCurrencyUnitIndexState.value, 0);
          expect(baseCurrencyUnitIndexFromKeyValueDatabase, 0);

          expect(
            listOfCurrencyUnitsState.value[0].measureUnit,
            listOfCurrencyUnitsFromKeyValueDatabase[0].measureUnit,
          );
        },
      );
    },
  );
}
