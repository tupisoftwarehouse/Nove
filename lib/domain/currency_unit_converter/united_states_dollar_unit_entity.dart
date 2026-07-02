import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class UnitedStatesDollarUnitEntity extends CurrencyUnitEntity {
  UnitedStatesDollarUnitEntity(String value)
    : super(value, CurrencyUnit.UNITED_STATES_DOLLAR);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> currencyUnitToConvertTo) {
    late final double convertedToUnitedStatesDollarValue;

    switch (currencyUnitToConvertTo.measureUnit) {
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        convertedToUnitedStatesDollarValue =
            AUSTRALIA_DOLLAR_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;

      case CurrencyUnit.BRAZIL_REAL:
        convertedToUnitedStatesDollarValue =
            BRAZIL_REAL_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;

      case CurrencyUnit.CANADA_DOLLAR:
        convertedToUnitedStatesDollarValue =
            CANADA_DOLLAR_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;

      case CurrencyUnit.UNITED_KINGDOM_POUND:
        convertedToUnitedStatesDollarValue =
            UNITED_KINGDOM_POUND_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;

      case CurrencyUnit.SWITZERLAND_FRANC:
        convertedToUnitedStatesDollarValue =
            SWITZERLAND_FRANC_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;

      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        convertedToUnitedStatesDollarValue =
            NEW_ZEALAND_DOLLAR_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;

      case CurrencyUnit.EURO:
        convertedToUnitedStatesDollarValue =
            EURO_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;

      case CurrencyUnit.UNITED_STATES_DOLLAR:
        convertedToUnitedStatesDollarValue = double.parse(
          currencyUnitToConvertTo.value,
        );

        break;
    }

    value = convertedToUnitedStatesDollarValue.toString();
  }
}
