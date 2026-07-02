import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/currency_values_value_object.dart";

void main() {
  group("Test \"CurrencyValuesValueObject\" Value Object", () {
    test(
      "Test If Method \"fromJson\" Returns An Instance From Marshallable Data",
      () {
        final instanceFromMarshallableData = CurrencyValuesValueObject.fromJson(
          MARSHALLABLE_CURRENCY_VALUES,
        );

        expect(
          instanceFromMarshallableData.australiaDollar,
          CURRENCY_VALUES.australiaDollar,
        );
        expect(
          instanceFromMarshallableData.brazilReal,
          CURRENCY_VALUES.brazilReal,
        );
        expect(
          instanceFromMarshallableData.canadaDollar,
          CURRENCY_VALUES.canadaDollar,
        );
        expect(
          instanceFromMarshallableData.canadaDollar,
          CURRENCY_VALUES.canadaDollar,
        );
        expect(instanceFromMarshallableData.euro, CURRENCY_VALUES.euro);
        expect(
          instanceFromMarshallableData.unitedKingdomPound,
          CURRENCY_VALUES.unitedKingdomPound,
        );
        expect(
          instanceFromMarshallableData.newZealandDollar,
          CURRENCY_VALUES.newZealandDollar,
        );
        expect(
          instanceFromMarshallableData.switzerlandFranc,
          CURRENCY_VALUES.switzerlandFranc,
        );
      },
    );

    test("Test If Method \"toJson\" Returns Marshallable From Instance", () {
      final marshallableDataFromInstance = CurrencyValuesValueObject(
        CURRENCY_VALUES.unitedKingdomPound,
        CURRENCY_VALUES.switzerlandFranc,
        CURRENCY_VALUES.australiaDollar,
        CURRENCY_VALUES.brazilReal,
        CURRENCY_VALUES.canadaDollar,
        CURRENCY_VALUES.newZealandDollar,
        CURRENCY_VALUES.euro,
      ).toJson();

      expect(marshallableDataFromInstance, MARSHALLABLE_CURRENCY_VALUES);
    });
  });
}
