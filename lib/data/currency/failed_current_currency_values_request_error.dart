import "package:nove/constants/data/currency_constants.dart";

class FailedCurrentCurrencyValuesRequestError implements Exception {
  @override
  String toString() {
    return FAILED_CURRENT_CURRENCY_VALUES_REQUEST_ERROR_MESSAGE;
  }
}
