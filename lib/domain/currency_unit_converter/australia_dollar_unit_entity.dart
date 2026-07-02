import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class AustraliaDollarUnitEntity extends CurrencyUnitEntity {
  AustraliaDollarUnitEntity(String value)
    : super(value, CurrencyUnit.AUSTRALIA_DOLLAR);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> currencyUnitToConvertTo) {
    late final double convertedToAustralianDollarValue;

    switch (currencyUnitToConvertTo.measureUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        convertedToAustralianDollarValue =
            UNITED_STATES_DOLLAR_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        convertedToAustralianDollarValue =
            BRAZIL_REAL_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        convertedToAustralianDollarValue =
            CANADA_DOLLAR_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        convertedToAustralianDollarValue =
            UNITED_KINGDOM_POUND_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        convertedToAustralianDollarValue =
            SWITZERLAND_FRANC_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        convertedToAustralianDollarValue =
            NEW_ZEALAND_DOLLAR_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.EURO:
        convertedToAustralianDollarValue =
            EURO_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        convertedToAustralianDollarValue = double.parse(
          currencyUnitToConvertTo.value,
        );

        break;
    }

    value = convertedToAustralianDollarValue.toString();
  }
}
