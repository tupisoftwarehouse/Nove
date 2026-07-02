import "dart:io";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart";
import "package:http/testing.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/currency_gateway.dart";
import "package:nove/data/currency/currency_repository.dart";
import "package:nove/data/currency/internals/timestamp_generator/timestamp_generator.dart";
import "package:nove/dependency_injection/currency_repository_factory.dart";

void main() {
  group("Test \"CurrencyRepositoryFactory\" Class", () {
    setUpAll(() {
      final httpClient = MockClient((_) async {
        return Response(MARSHALLED_CURRENCY_VALUES_FROM_SERVICE, HttpStatus.ok);
      });
      final CurrencyGateway currencyGateway = CurrencyGateway(httpClient);

      CurrencyRepositoryFactory.instance = CurrencyRepository(currencyGateway);
    });

    test(
      "Test If Method \"getInstance\" Returns \"CurrencyRepository\"",
      () async {
        final currentTimeOfTheDay = DateTime.now();
        final updatedAtTimestamp = TimestampGenerator.getUpdatedAtTimestamp(
          currentTimeOfTheDay,
        );
        final updatableAtTimestamp = TimestampGenerator.getUpdatableAtTimestamp(
          currentTimeOfTheDay,
        );
        final instance = CurrencyRepositoryFactory.getInstance();
        final currentCurrencyValues = await instance.getCurrentCurrencyValues();

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
        expect(currentCurrencyValues.updatedAt, updatedAtTimestamp);
        expect(currentCurrencyValues.updatableAt, updatableAtTimestamp);
      },
    );
  });
}
