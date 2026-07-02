import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class CanadaDollarUnitEntity extends CurrencyUnitEntity {
  CanadaDollarUnitEntity(String value)
    : super(value, CurrencyUnit.CANADA_DOLLAR);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> currencyUnitToConvertTo) {
    late final double convertedToCanadianDollarValue;

    switch (currencyUnitToConvertTo.measureUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        convertedToCanadianDollarValue =
            UNITED_STATES_DOLLAR_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        convertedToCanadianDollarValue =
            AUSTRALIA_DOLLAR_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        convertedToCanadianDollarValue =
            BRAZIL_REAL_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        convertedToCanadianDollarValue =
            UNITED_KINGDOM_POUND_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        convertedToCanadianDollarValue =
            SWITZERLAND_FRANC_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        convertedToCanadianDollarValue =
            NEW_ZEALAND_DOLLAR_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.EURO:
        convertedToCanadianDollarValue =
            EURO_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        convertedToCanadianDollarValue = double.parse(
          currencyUnitToConvertTo.value,
        );

        break;
    }

    value = convertedToCanadianDollarValue.toString();
  }
}
