import "dart:io";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart";
import "package:http/testing.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/currency_gateway.dart";
import "package:nove/data/currency/currency_repository.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";
import "package:nove/data/currency/internals/timestamp_generator/timestamp_generator.dart";
import "package:nove/dependency_injection/currency_repository_factory.dart";
import "package:nove/dependency_injection/current_currency_values_factory.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/data_stores/current_currency_values_data_store.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CurrentCurrencyValuesFactory\" Class", () {
    late Client httpClient;
    late CurrencyGateway currencyGateway;
    late CurrentCurrencyValuesValueObject currentCurrencyValues;

    setUp(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getInstance\" Returns \"CurrentCurrencyValues\" With Stored Data From Key-Value Database If It Is Up To Date",
      () async {
        CurrentCurrencyValuesDataStore.setCurrentCurrencyValues(
          CURRENT_CURRENCY_VALUES,
          KeyValueDatabaseFactory.instance!,
        );

        currentCurrencyValues =
            await CurrentCurrencyValuesFactory.getInstance();

        expect(
          currentCurrencyValues.currencyValues.unitedKingdomPound,
          CURRENT_CURRENCY_VALUES.currencyValues.unitedKingdomPound,
        );
        expect(
          currentCurrencyValues.currencyValues.switzerlandFranc,
          CURRENT_CURRENCY_VALUES.currencyValues.switzerlandFranc,
        );
        expect(
          currentCurrencyValues.currencyValues.australiaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.australiaDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.brazilReal,
          CURRENT_CURRENCY_VALUES.currencyValues.brazilReal,
        );
        expect(
          currentCurrencyValues.currencyValues.canadaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.canadaDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.newZealandDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.newZealandDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.euro,
          CURRENT_CURRENCY_VALUES.currencyValues.euro,
        );
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"CurrentCurrencyValues\" With Data From Service And Synchronizes It To Key-Value Database If It Is Not Up To Date",
      () async {
        final currentTimeOfTheDay = DateTime.now();
        final updatedAtTimestamp = TimestampGenerator.getUpdatedAtTimestamp(
          currentTimeOfTheDay,
        );
        final updatableAtTimestamp = TimestampGenerator.getUpdatableAtTimestamp(
          currentTimeOfTheDay,
        );
        bool isDataFetchedFromService = false;

        httpClient = MockClient((_) async {
          isDataFetchedFromService = true;

          return Response(
            MARSHALLED_CURRENCY_VALUES_FROM_SERVICE,
            HttpStatus.ok,
          );
        });

        currencyGateway = CurrencyGateway(httpClient);

        CurrencyRepositoryFactory.instance = CurrencyRepository(
          currencyGateway,
        );

        CurrentCurrencyValuesDataStore.setCurrentCurrencyValues(
          OUT_DATED_CURRENT_CURRENCY_VALUES,
          KeyValueDatabaseFactory.instance!,
        );

        currentCurrencyValues =
            await CurrentCurrencyValuesFactory.getInstance();

        final currentCurrencyValuesFromKeyValueDatabase =
            CurrentCurrencyValuesDataStore.getCurrentCurrencyValues(
              KeyValueDatabaseFactory.instance!,
            );

        expect(
          currentCurrencyValues.currencyValues.unitedKingdomPound,
          CURRENT_CURRENCY_VALUES.currencyValues.unitedKingdomPound,
        );
        expect(
          currentCurrencyValues.currencyValues.switzerlandFranc,
          CURRENT_CURRENCY_VALUES.currencyValues.switzerlandFranc,
        );
        expect(
          currentCurrencyValues.currencyValues.australiaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.australiaDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.brazilReal,
          CURRENT_CURRENCY_VALUES.currencyValues.brazilReal,
        );
        expect(
          currentCurrencyValues.currencyValues.canadaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.canadaDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.newZealandDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.newZealandDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.euro,
          CURRENT_CURRENCY_VALUES.currencyValues.euro,
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
          updatedAtTimestamp,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.updatableAt,
          updatableAtTimestamp,
        );

        expect(isDataFetchedFromService, true);
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"CurrentCurrencyValues\" With Stored Data From Key-Value Database If Data Fetching From Service Has Failed",
      () async {
        httpClient = MockClient((_) async {
          return Response(
            MARSHALLED_CURRENCY_VALUES_FROM_SERVICE,
            HttpStatus.ok,
          );
        });

        currencyGateway = CurrencyGateway(httpClient);

        CurrencyRepositoryFactory.instance = CurrencyRepository(
          currencyGateway,
        );

        CurrentCurrencyValuesDataStore.setCurrentCurrencyValues(
          CURRENT_CURRENCY_VALUES,
          KeyValueDatabaseFactory.instance!,
        );

        currentCurrencyValues =
            await CurrentCurrencyValuesFactory.getInstance();

        expect(
          currentCurrencyValues.currencyValues.unitedKingdomPound,
          CURRENT_CURRENCY_VALUES.currencyValues.unitedKingdomPound,
        );
        expect(
          currentCurrencyValues.currencyValues.switzerlandFranc,
          CURRENT_CURRENCY_VALUES.currencyValues.switzerlandFranc,
        );
        expect(
          currentCurrencyValues.currencyValues.australiaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.australiaDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.brazilReal,
          CURRENT_CURRENCY_VALUES.currencyValues.brazilReal,
        );
        expect(
          currentCurrencyValues.currencyValues.canadaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.canadaDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.newZealandDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.newZealandDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.euro,
          CURRENT_CURRENCY_VALUES.currencyValues.euro,
        );
      },
    );

    test(
      "Test If Method \"getInstance\" Returns \"CurrentCurrencyValues\" With Data From Service And Synchronizes If There Is No Local Data Stored From Key-Value Database",
      () async {
        final currentTimeOfTheDay = DateTime.now();
        final updatedAtTimestamp = TimestampGenerator.getUpdatedAtTimestamp(
          currentTimeOfTheDay,
        );
        final updatableAtTimestamp = TimestampGenerator.getUpdatableAtTimestamp(
          currentTimeOfTheDay,
        );
        bool isDataFetchedFromService = false;

        httpClient = MockClient((_) async {
          isDataFetchedFromService = true;

          return Response(
            MARSHALLED_CURRENCY_VALUES_FROM_SERVICE,
            HttpStatus.ok,
          );
        });

        currencyGateway = CurrencyGateway(httpClient);

        CurrencyRepositoryFactory.instance = CurrencyRepository(
          currencyGateway,
        );

        currentCurrencyValues =
            await CurrentCurrencyValuesFactory.getInstance();

        final currentCurrencyValuesFromKeyValueDatabase =
            CurrentCurrencyValuesDataStore.getCurrentCurrencyValues(
              KeyValueDatabaseFactory.instance!,
            );

        expect(
          currentCurrencyValues.currencyValues.unitedKingdomPound,
          CURRENT_CURRENCY_VALUES.currencyValues.unitedKingdomPound,
        );
        expect(
          currentCurrencyValues.currencyValues.switzerlandFranc,
          CURRENT_CURRENCY_VALUES.currencyValues.switzerlandFranc,
        );
        expect(
          currentCurrencyValues.currencyValues.australiaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.australiaDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.brazilReal,
          CURRENT_CURRENCY_VALUES.currencyValues.brazilReal,
        );
        expect(
          currentCurrencyValues.currencyValues.canadaDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.canadaDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.newZealandDollar,
          CURRENT_CURRENCY_VALUES.currencyValues.newZealandDollar,
        );
        expect(
          currentCurrencyValues.currencyValues.euro,
          CURRENT_CURRENCY_VALUES.currencyValues.euro,
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
          updatedAtTimestamp,
        );
        expect(
          currentCurrencyValuesFromKeyValueDatabase.updatableAt,
          updatableAtTimestamp,
        );

        expect(isDataFetchedFromService, true);
      },
    );
  });
}
