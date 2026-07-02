import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/current_currency_values_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CurrentCurrencyValuesDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getCurrentCurrencyValues\" Returns Current Currency Values From Key-Value Database",
      () {
        keyValueDatabase.setItem(CURRENT_CURRENCY_VALUES_KEY, () {
          return CURRENT_CURRENCY_VALUES.marshalledData;
        });

        final CurrentCurrencyValuesValueObject
        currentCurrencyValuesFromKeyValueDatabase =
            CurrentCurrencyValuesDataStore.getCurrentCurrencyValues(
              keyValueDatabase,
            );

        expect(
          currentCurrencyValuesFromKeyValueDatabase
              .currencyValues
              .unitedKingdomPound,
          CURRENT_CURRENCY_VALUES.currencyValues.unitedKingdomPound,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase
              .currencyValues
              .switzerlandFranc,
          CURRENT_CURRENCY_VALUES.currencyValues.switzerlandFranc,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase
              .currencyValues
              .australiaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.australiaDollar,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.currencyValues.brazilReal,
          CURRENT_CURRENCY_VALUES.currencyValues.brazilReal,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.currencyValues.canadaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.canadaDollar,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase
              .currencyValues
              .newZealandDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.newZealandDollar,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.currencyValues.euro,
          CURRENT_CURRENCY_VALUES.currencyValues.euro,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.updatedAt,
          CURRENT_CURRENCY_VALUES.updatedAt,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.updatableAt,
          CURRENT_CURRENCY_VALUES.updatableAt,
        );
      },
    );

    test(
      "Test If Method \"setCurrentCurrencyValues\" Sets Current Currency Values On Key-Value Database",
      () {
        CurrentCurrencyValuesDataStore.setCurrentCurrencyValues(
          CURRENT_CURRENCY_VALUES,
          keyValueDatabase,
        );

        final currentCurrencyValuesFromKeyValueDatabase = keyValueDatabase
            .getItem(CURRENT_CURRENCY_VALUES_KEY, (marshalledData) {
              return CurrentCurrencyValuesValueObject.fromMarshalledData(
                marshalledData,
              );
            });

        expect(
          currentCurrencyValuesFromKeyValueDatabase
              .currencyValues
              .unitedKingdomPound,
          CURRENT_CURRENCY_VALUES.currencyValues.unitedKingdomPound,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase
              .currencyValues
              .switzerlandFranc,
          CURRENT_CURRENCY_VALUES.currencyValues.switzerlandFranc,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase
              .currencyValues
              .australiaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.australiaDollar,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.currencyValues.brazilReal,
          CURRENT_CURRENCY_VALUES.currencyValues.brazilReal,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.currencyValues.canadaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.canadaDollar,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase
              .currencyValues
              .newZealandDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.newZealandDollar,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.currencyValues.euro,
          CURRENT_CURRENCY_VALUES.currencyValues.euro,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.updatedAt,
          CURRENT_CURRENCY_VALUES.updatedAt,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.updatableAt,
          CURRENT_CURRENCY_VALUES.updatableAt,
        );
      },
    );
  });
}
