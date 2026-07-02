import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class SwitzerlandFrancUnitEntity extends CurrencyUnitEntity {
  SwitzerlandFrancUnitEntity(String value)
    : super(value, CurrencyUnit.SWITZERLAND_FRANC);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> currencyUnitToConvertTo) {
    late final double convertedToSwissFrancValue;

    switch (currencyUnitToConvertTo.measureUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        convertedToSwissFrancValue =
            UNITED_STATES_DOLLAR_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        convertedToSwissFrancValue =
            AUSTRALIA_DOLLAR_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        convertedToSwissFrancValue =
            BRAZIL_REAL_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        convertedToSwissFrancValue =
            CANADA_DOLLAR_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        convertedToSwissFrancValue =
            UNITED_KINGDOM_POUND_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        convertedToSwissFrancValue =
            NEW_ZEALAND_DOLLAR_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.EURO:
        convertedToSwissFrancValue =
            EURO_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        convertedToSwissFrancValue = double.parse(
          currencyUnitToConvertTo.value,
        );

        break;
    }

    value = convertedToSwissFrancValue.toString();
  }
}
