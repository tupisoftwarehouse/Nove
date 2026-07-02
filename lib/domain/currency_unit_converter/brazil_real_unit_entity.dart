import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class BrazilRealUnitEntity extends CurrencyUnitEntity {
  BrazilRealUnitEntity(String value) : super(value, CurrencyUnit.BRAZIL_REAL);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> currencyUnitToConvertTo) {
    late final double convertedToBrazilianRealValue;

    switch (currencyUnitToConvertTo.measureUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        convertedToBrazilianRealValue =
            UNITED_STATES_DOLLAR_IN_BRAZIL_REAL_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        convertedToBrazilianRealValue =
            AUSTRALIA_DOLLAR_IN_BRAZIL_REAL_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        convertedToBrazilianRealValue =
            CANADA_DOLLAR_IN_BRAZIL_REAL_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        convertedToBrazilianRealValue =
            UNITED_KINGDOM_POUND_IN_BRAZIL_REAL_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        convertedToBrazilianRealValue =
            SWITZERLAND_FRANC_IN_BRAZIL_REAL_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        convertedToBrazilianRealValue =
            NEW_ZEALAND_DOLLAR_IN_BRAZIL_REAL_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.EURO:
        convertedToBrazilianRealValue = EURO_IN_BRAZIL_REAL_CONVERSION_FORMULA(
          currencyUnitToConvertTo.value,
          CurrencyValuesMediator.currencyValues,
        );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        convertedToBrazilianRealValue = double.parse(
          currencyUnitToConvertTo.value,
        );

        break;
    }

    value = convertedToBrazilianRealValue.toString();
  }
}
