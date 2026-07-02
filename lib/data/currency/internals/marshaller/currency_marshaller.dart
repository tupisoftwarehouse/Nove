import "dart:convert";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/data/currency/currency_values_value_object.dart";
import "package:nove/data/currency/internals/formatter/currency_formatter.dart";

class CurrencyMarshaller {
  CurrencyMarshaller._();

  static CurrencyValuesValueObject getUnmarshalledCurrencyValues(
    String marshalledCurrencyValueResponseFromService,
  ) {
    final List<dynamic> jsonMapOfCurrencyValueResponseFromService = jsonDecode(
      marshalledCurrencyValueResponseFromService,
    );
    final Map<String, double> unmarshalledCurrencyValueFromService = {};
    late final double fixedUnitedKingdomPoundValue;
    late final double fixedSwitzerlandFrancValue;
    late final double fixedAustraliaDollarValue;
    late final double fixedBrazilRealValue;
    late final double fixedCanadaDollarValue;
    late final double fixedNewZealandDollarValue;
    late final double fixedEuroValue;

    for (var unmarshalledCurrencyEntries
        in jsonMapOfCurrencyValueResponseFromService) {
      final currencyCode = unmarshalledCurrencyEntries[CURRENCY_CODE_KEY];

      unmarshalledCurrencyValueFromService[currencyCode] =
          (unmarshalledCurrencyEntries[CURRENCY_VALUE_KEY] as num).toDouble();
    }

    fixedUnitedKingdomPoundValue = CurrencyFormatter.getFixedCurrencyValue(
      unmarshalledCurrencyValueFromService[UNITED_KINGDOM_POUND_CURRENCY_CODE]!,
    );
    fixedSwitzerlandFrancValue = CurrencyFormatter.getFixedCurrencyValue(
      unmarshalledCurrencyValueFromService[SWITZERLAND_FRANC_CURRENCY_CODE]!,
    );
    fixedAustraliaDollarValue = CurrencyFormatter.getFixedCurrencyValue(
      unmarshalledCurrencyValueFromService[AUSTRALIA_DOLLAR_CURRENCY_CODE]!,
    );
    fixedBrazilRealValue = CurrencyFormatter.getFixedCurrencyValue(
      unmarshalledCurrencyValueFromService[BRAZIL_REAL_CURRENCY_CODE]!,
    );
    fixedCanadaDollarValue = CurrencyFormatter.getFixedCurrencyValue(
      unmarshalledCurrencyValueFromService[CANADA_DOLLAR_CURRENCY_CODE]!,
    );
    fixedNewZealandDollarValue = CurrencyFormatter.getFixedCurrencyValue(
      unmarshalledCurrencyValueFromService[NEW_ZEALAND_DOLLAR_CURRENCY_CODE]!,
    );
    fixedEuroValue = CurrencyFormatter.getFixedCurrencyValue(
      unmarshalledCurrencyValueFromService[EURO_CURRENCY_CODE]!,
    );

    return CurrencyValuesValueObject(
      fixedUnitedKingdomPoundValue,
      fixedSwitzerlandFrancValue,
      fixedAustraliaDollarValue,
      fixedBrazilRealValue,
      fixedCanadaDollarValue,
      fixedNewZealandDollarValue,
      fixedEuroValue,
    );
  }
}
