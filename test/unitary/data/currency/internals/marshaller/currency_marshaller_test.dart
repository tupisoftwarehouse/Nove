import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/internals/marshaller/currency_marshaller.dart";

void main() {
  group("Test \"CurrencyMarshaller\" Class", () {
    test(
      "Test If Method \"getUnmarshalledCurrencyValues\" Returns Unmarshalled Currency Values",
      () async {
        final unmarshalledCurrencyValues =
            CurrencyMarshaller.getUnmarshalledCurrencyValues(
              MARSHALLED_CURRENCY_VALUES_FROM_SERVICE,
            );

        expect(
          unmarshalledCurrencyValues.unitedKingdomPound,
          CURRENCY_VALUES.unitedKingdomPound,
        );
        expect(
          unmarshalledCurrencyValues.switzerlandFranc,
          CURRENCY_VALUES.switzerlandFranc,
        );
        expect(
          unmarshalledCurrencyValues.australiaDollar,
          CURRENCY_VALUES.australiaDollar,
        );
        expect(
          unmarshalledCurrencyValues.brazilReal,
          CURRENCY_VALUES.brazilReal,
        );
        expect(
          unmarshalledCurrencyValues.canadaDollar,
          CURRENCY_VALUES.canadaDollar,
        );
        expect(
          unmarshalledCurrencyValues.newZealandDollar,
          CURRENCY_VALUES.newZealandDollar,
        );
        expect(unmarshalledCurrencyValues.euro, CURRENCY_VALUES.euro);
      },
    );
  });
}
