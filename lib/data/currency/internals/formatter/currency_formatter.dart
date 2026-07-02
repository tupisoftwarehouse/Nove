import "package:nove/constants/data/currency_constants.dart";

class CurrencyFormatter {
  CurrencyFormatter._();

  static double getFixedCurrencyValue(double currencyValue) {
    final fixedCurrencyValue = currencyValue.toStringAsFixed(
      MEANINGFUL_CURRENCY_VALUE_CHARACTERS_AFTER_DECIMAL_POINT,
    );

    return double.parse(fixedCurrencyValue);
  }
}
