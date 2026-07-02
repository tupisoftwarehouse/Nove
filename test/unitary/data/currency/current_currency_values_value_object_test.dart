import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/current_currency_values_value_object.dart";

void main() {
  group("Test \"CurrentCurrencyValuesValueObject\" Value Object", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns An Instance From Marshalled Data",
      () {
        final instanceFromJsonMap =
            CurrentCurrencyValuesValueObject.fromMarshalledData(
              MARSHALLED_CURRENT_CURRENCY_VALUES,
            );

        expect(
          instanceFromJsonMap.currencyValues.australiaDollar,
          CURRENCY_VALUES.australiaDollar,
        );
        expect(
          instanceFromJsonMap.currencyValues.brazilReal,
          CURRENCY_VALUES.brazilReal,
        );
        expect(
          instanceFromJsonMap.currencyValues.canadaDollar,
          CURRENCY_VALUES.canadaDollar,
        );
        expect(
          instanceFromJsonMap.currencyValues.canadaDollar,
          CURRENCY_VALUES.canadaDollar,
        );
        expect(instanceFromJsonMap.currencyValues.euro, CURRENCY_VALUES.euro);
        expect(
          instanceFromJsonMap.currencyValues.unitedKingdomPound,
          CURRENCY_VALUES.unitedKingdomPound,
        );
        expect(
          instanceFromJsonMap.currencyValues.newZealandDollar,
          CURRENCY_VALUES.newZealandDollar,
        );
        expect(
          instanceFromJsonMap.currencyValues.switzerlandFranc,
          CURRENCY_VALUES.switzerlandFranc,
        );
        expect(
          instanceFromJsonMap.updatedAt,
          CURRENT_CURRENCY_VALUES.updatedAt,
        );
        expect(
          instanceFromJsonMap.updatableAt,
          CURRENT_CURRENCY_VALUES.updatableAt,
        );
      },
    );

    test("Test If Method \"toJson\" Returns Json Map From Instance", () {
      final jsonMapFromInstance = CurrentCurrencyValuesValueObject(
        CURRENCY_VALUES,
        CURRENT_CURRENCY_VALUES.updatedAt,
        CURRENT_CURRENCY_VALUES.updatableAt,
      ).marshalledData;

      expect(jsonMapFromInstance, MARSHALLED_CURRENT_CURRENCY_VALUES);
    });
  });
}
