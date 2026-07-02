import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class NewZealandDollarUnitEntity extends CurrencyUnitEntity {
  NewZealandDollarUnitEntity(String value)
    : super(value, CurrencyUnit.NEW_ZEALAND_DOLLAR);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> currencyUnitToConvertTo) {
    late final double convertedToNewZealanderDollarValue;

    switch (currencyUnitToConvertTo.measureUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        convertedToNewZealanderDollarValue =
            UNITED_STATES_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        convertedToNewZealanderDollarValue =
            AUSTRALIA_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        convertedToNewZealanderDollarValue =
            BRAZIL_REAL_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        convertedToNewZealanderDollarValue =
            CANADA_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        convertedToNewZealanderDollarValue =
            UNITED_KINGDOM_POUND_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        convertedToNewZealanderDollarValue =
            SWITZERLAND_FRANC_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.EURO:
        convertedToNewZealanderDollarValue =
            EURO_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        convertedToNewZealanderDollarValue = double.parse(
          currencyUnitToConvertTo.value,
        );

        break;
    }

    value = convertedToNewZealanderDollarValue.toString();
  }
}
