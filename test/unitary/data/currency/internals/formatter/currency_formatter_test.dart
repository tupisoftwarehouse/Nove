import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/internals/formatter/currency_formatter.dart";

void main() {
  group("Test \"CurrencyFormatter\" Class", () {
    test(
      "Test If Method \"getFixedCurrencyValue\" Returns Currency Value With Fixed Truncation For Meaningful Characters After Decimal Point",
      () {
        final currencyValueWithFixedTruncation =
            CurrencyFormatter.getFixedCurrencyValue(NOT_FIXED_CURRENCY_VALUE);

        expect(currencyValueWithFixedTruncation, FIXED_CURRENCY_VALUE);
      },
    );
  });
}
