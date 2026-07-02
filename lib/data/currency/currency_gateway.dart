import "dart:async";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/internals/marshaller/currency_marshaller.dart";
import "package:nove/data/currency/internals/timestamp_generator/timestamp_generator.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";
import "package:http/http.dart";
import "package:nove/data/currency/failed_current_currency_values_request_error.dart";
import "package:retry/retry.dart";

class CurrencyGateway {
  final Client httpClient;

  CurrencyGateway(this.httpClient);

  Future<CurrentCurrencyValuesValueObject> getCurrentCurrencyValues() async {
    try {
      final retryOptions = RetryOptions(
        maxAttempts: CURRENT_CURRENCY_VALUE_FETCHING_MAXIMUM_ATTEMPTS,
      );
      final currencyValueFromServiceRequestResponse = await retryOptions.retry(
        () {
          return httpClient
              .get(CURRENCY_VALUE_SERVICE_URL)
              .timeout(CURRENT_CURRENCY_VALUE_FETCHING_EXPECTED_TIMEOUT);
        },
      );
      final currencyValues = CurrencyMarshaller.getUnmarshalledCurrencyValues(
        currencyValueFromServiceRequestResponse.body,
      );
      final currentTimeOfTheDay = DateTime.now();
      final updatedAtTimestamp = TimestampGenerator.getUpdatedAtTimestamp(
        currentTimeOfTheDay,
      );
      final updatableAtTimestamp = TimestampGenerator.getUpdatableAtTimestamp(
        currentTimeOfTheDay,
      );

      return CurrentCurrencyValuesValueObject(
        currencyValues,
        updatedAtTimestamp,
        updatableAtTimestamp,
      );
    } catch (_) {
      throw FailedCurrentCurrencyValuesRequestError();
    }
  }
}
