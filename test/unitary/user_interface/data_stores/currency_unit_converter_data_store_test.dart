import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/currency_unit_converter_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CurrencyUnitConverterDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getListOfCurrencyUnits\" Returns List Of Currency Units From Key-Value Database",
      () {
        keyValueDatabase.setItem(LIST_OF_CURRENCY_UNITS_KEY, () {
          return CurrencyUnitEntity.marshalledListData([ZEROED_CURRENCY_UNIT]);
        });

        final listOfCurrencyUnitsFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getListOfCurrencyUnits(
              keyValueDatabase,
            );

        expect(
          listOfCurrencyUnitsFromKeyValueDatabase[0].value,
          ZEROED_CURRENCY_UNIT.value,
        );
        expect(
          listOfCurrencyUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_CURRENCY_UNIT.measureUnit,
        );

        expect(listOfCurrencyUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"setListOfCurrencyUnits\" Sets List Of Currency Units On Key-Value Database",
      () {
        CurrencyUnitConverterDataStore.setListOfCurrencyUnits([
          ZEROED_CURRENCY_UNIT,
        ], keyValueDatabase);

        final listOfCurrencyUnitsFromKeyValueDatabase = keyValueDatabase
            .getItem(LIST_OF_CURRENCY_UNITS_KEY, (marshalledData) {
              return CurrencyUnitEntity.fromMarshalledListData(marshalledData);
            });

        expect(
          listOfCurrencyUnitsFromKeyValueDatabase[0].value,
          ZEROED_CURRENCY_UNIT.value,
        );
        expect(
          listOfCurrencyUnitsFromKeyValueDatabase[0].measureUnit,
          ZEROED_CURRENCY_UNIT.measureUnit,
        );

        expect(listOfCurrencyUnitsFromKeyValueDatabase.length, 1);
      },
    );

    test(
      "Test If Method \"getBaseCurrencyUnitIndex\" Returns Base Currency Unit Index From Key-Value Database",
      () {
        keyValueDatabase.setItem(BASE_CURRENCY_UNIT_ELEMENT_INDEX_KEY, () {
          return "0";
        });

        final baseCurrencyUnitIndexFromKeyValueDatabase =
            CurrencyUnitConverterDataStore.getBaseCurrencyUnitIndex(
              keyValueDatabase,
            );

        expect(baseCurrencyUnitIndexFromKeyValueDatabase, 0);
      },
    );

    test(
      "Test If Method \"setBaseCurrencyUnitIndex\" Sets Base Currency Unit Index On Key-Value Database",
      () {
        CurrencyUnitConverterDataStore.setBaseCurrencyUnitIndex(
          0,
          keyValueDatabase,
        );

        final baseCurrencyUnitIndexFromKeyValueDatabase = keyValueDatabase
            .getItem(BASE_CURRENCY_UNIT_ELEMENT_INDEX_KEY, (marshalledData) {
              return int.parse(marshalledData);
            });

        expect(baseCurrencyUnitIndexFromKeyValueDatabase, 0);
      },
    );
  });
}
