import "dart:io";
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart";
import "package:http/testing.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/currency_gateway.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";
import "package:nove/data/currency/internals/timestamp_generator/timestamp_generator.dart";

void main() {
  group("Test \"CurrencyGateway\" Class", () {
    late CurrencyGateway currencyGateway;
    late Client httpClient;

    test(
      "Test If Method \"getCurrentCurrencyValues\" Returns Unmarshalled Current Currency Values From Service",
      () async {
        final currentTimeOfTheDay = DateTime.now();
        final updatedAtTimestamp = TimestampGenerator.getUpdatedAtTimestamp(
          currentTimeOfTheDay,
        );
        final updatableAtTimestamp = TimestampGenerator.getUpdatableAtTimestamp(
          currentTimeOfTheDay,
        );
        final httpClient = MockClient((_) async {
          return Response(
            MARSHALLED_CURRENCY_VALUES_FROM_SERVICE,
            HttpStatus.ok,
          );
        });
        final CurrencyGateway currencyGateway = CurrencyGateway(httpClient);
        final CurrentCurrencyValuesValueObject
        unmarshalledCurrentCurrencyValues = await currencyGateway
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
      },
    );

    test(
      "Test If Method \"getCurrentCurrencyValues\" Returns Unmarshalled Current Currency Values From Service",
      () async {
        final currentTimeOfTheDay = DateTime.now();
        final updatedAtTimestamp = TimestampGenerator.getUpdatedAtTimestamp(
          currentTimeOfTheDay,
        );
        final updatableAtTimestamp = TimestampGenerator.getUpdatableAtTimestamp(
          currentTimeOfTheDay,
        );
        int amountOfFetchingAttempts = 1;

        final httpClient = MockClient((_) async {
          late final bool isMaximumAmountOfFetchingAttemptsReached;

          amountOfFetchingAttempts++;

          isMaximumAmountOfFetchingAttemptsReached =
              amountOfFetchingAttempts ==
              CURRENT_CURRENCY_VALUE_FETCHING_MAXIMUM_ATTEMPTS;

          if (isMaximumAmountOfFetchingAttemptsReached) {
            return Response(
              MARSHALLED_CURRENCY_VALUES_FROM_SERVICE,
              HttpStatus.ok,
            );
          } else {
            throw Exception();
          }
        });

        final currencyGateway = CurrencyGateway(httpClient);

        final unmarshalledCurrentCurrencyValues = await currencyGateway
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

        expect(
          amountOfFetchingAttempts,
          CURRENT_CURRENCY_VALUE_FETCHING_MAXIMUM_ATTEMPTS,
        );
      },
    );

    test(
      "Test If Method \"getCurrentCurrencyValues\" Throws \"FailedCurrentCurrencyValuesRequestError\" If Request Fails",
      () async {
        httpClient = MockClient((_) async {
          throw Error();
        });

        currencyGateway = CurrencyGateway(httpClient);

        try {
          await currencyGateway.getCurrentCurrencyValues();
        } catch (error) {
          expect(
            error.toString(),
            FAILED_CURRENT_CURRENCY_VALUES_REQUEST_ERROR_MESSAGE,
          );
        }
      },
    );
  });
}
