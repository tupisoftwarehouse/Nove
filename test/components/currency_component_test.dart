import "dart:io";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart";
import "package:http/testing.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/currency_gateway.dart";
import "package:nove/data/currency/currency_repository.dart";
import "package:nove/data/currency/internals/timestamp_generator/timestamp_generator.dart";

void main() {
  group("Test \"Currency\" Component", () {
    late CurrencyRepository currencyRepository;

    setUpAll(() {
      final httpClient = MockClient((_) async {
        return Response(MARSHALLED_CURRENCY_VALUES_FROM_SERVICE, HttpStatus.ok);
      });
      final CurrencyGateway currencyGateway = CurrencyGateway(httpClient);

      currencyRepository = CurrencyRepository(currencyGateway);
    });

    test("Test Getting Current Currency Values From Service", () async {
      final currentTimeOfTheDay = DateTime.now();
      final updatedAtTimestamp = TimestampGenerator.getUpdatedAtTimestamp(
        currentTimeOfTheDay,
      );
      final updatableAtTimestamp = TimestampGenerator.getUpdatableAtTimestamp(
        currentTimeOfTheDay,
      );
      final unmarshalledCurrentCurrencyValues = await currencyRepository
          .getCurrentCurrencyValues();

      expect(
        unmarshalledCurrentCurrencyValues.currencyValues.unitedKingdomPound,
        CURRENT_CURRENCY_VALUES.currencyValues.unitedKingdomPound,
      );
      expect(
        unmarshalledCurrentCurrencyValues.currencyValues.switzerlandFranc,
        CURRENT_CURRENCY_VALUES.currencyValues.switzerlandFranc,
      );
      expect(
        unmarshalledCurrentCurrencyValues.currencyValues.australiaDollar,
        CURRENT_CURRENCY_VALUES.currencyValues.australiaDollar,
      );
      expect(
        unmarshalledCurrentCurrencyValues.currencyValues.brazilReal,
        CURRENT_CURRENCY_VALUES.currencyValues.brazilReal,
      );
      expect(
        unmarshalledCurrentCurrencyValues.currencyValues.canadaDollar,
        CURRENT_CURRENCY_VALUES.currencyValues.canadaDollar,
      );
      expect(
        unmarshalledCurrentCurrencyValues.currencyValues.newZealandDollar,
        CURRENT_CURRENCY_VALUES.currencyValues.newZealandDollar,
      );
      expect(
        unmarshalledCurrentCurrencyValues.currencyValues.euro,
        CURRENT_CURRENCY_VALUES.currencyValues.euro,
      );
      expect(unmarshalledCurrentCurrencyValues.updatedAt, updatedAtTimestamp);
      expect(
        unmarshalledCurrentCurrencyValues.updatableAt,
        updatableAtTimestamp,
      );
    });
  });
}
