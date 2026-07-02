import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class UnitedKingdomPoundUnitEntity extends CurrencyUnitEntity {
  UnitedKingdomPoundUnitEntity(String value)
    : super(value, CurrencyUnit.UNITED_KINGDOM_POUND);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> currencyUnitToConvertTo) {
    late final double convertedToGreatBritainPoundValue;

    switch (currencyUnitToConvertTo.measureUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        convertedToGreatBritainPoundValue =
            UNITED_STATES_DOLLAR_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        convertedToGreatBritainPoundValue =
            AUSTRALIA_DOLLAR_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        convertedToGreatBritainPoundValue =
            BRAZIL_REAL_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        convertedToGreatBritainPoundValue =
            CANADA_DOLLAR_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        convertedToGreatBritainPoundValue =
            SWITZERLAND_FRANC_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        convertedToGreatBritainPoundValue =
            NEW_ZEALAND_DOLLAR_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.EURO:
        convertedToGreatBritainPoundValue =
            EURO_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
              currencyUnitToConvertTo.value,
              CurrencyValuesMediator.currencyValues,
            );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        convertedToGreatBritainPoundValue = double.parse(
          currencyUnitToConvertTo.value,
        );

        break;
    }

    value = convertedToGreatBritainPoundValue.toString();
  }
}
