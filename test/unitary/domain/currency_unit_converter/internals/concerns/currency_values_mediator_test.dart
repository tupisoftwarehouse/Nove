import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";

void main() {
  group("Test \"CurrencyValuesMediator\" Class", () {
    test("Test If Method \"dispose\" Turns CurrentCurrencyValues Null", () {
      CurrencyValuesMediator.currencyValues = CURRENCY_VALUES;

      CurrencyValuesMediator.dispose();

      try {
        CurrencyValuesMediator.currencyValues;
      } catch (error) {
        expect(error, isA<TypeError>());
      }
    });
  });
}
