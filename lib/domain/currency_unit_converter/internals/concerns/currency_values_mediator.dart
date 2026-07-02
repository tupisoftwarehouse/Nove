import "package:nove/data/currency/currency_values_value_object.dart";

class CurrencyValuesMediator {
  static CurrencyValuesValueObject? _currencyValues;

  CurrencyValuesMediator._();

  static set currencyValues(CurrencyValuesValueObject currentCurrencyValues) {
    _currencyValues = currentCurrencyValues;
  }

  static CurrencyValuesValueObject get currencyValues {
    return _currencyValues!;
  }

  static void dispose() {
    _currencyValues = null;
  }
}
