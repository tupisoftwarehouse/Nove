import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_entity.dart";

class EuroUnitEntity extends CurrencyUnitEntity {
  EuroUnitEntity(String value) : super(value, CurrencyUnit.EURO);

  @override
  void convertTo(MeasureUnitEntity<CurrencyUnit> currencyUnitToConvertTo) {
    late final double convertedToEuroValue;

    switch (currencyUnitToConvertTo.measureUnit) {
      case CurrencyUnit.UNITED_STATES_DOLLAR:
        convertedToEuroValue = UNITED_STATES_DOLLAR_IN_EURO_CONVERSION_FORMULA(
          currencyUnitToConvertTo.value,
          CurrencyValuesMediator.currencyValues,
        );

        break;
      case CurrencyUnit.AUSTRALIA_DOLLAR:
        convertedToEuroValue = AUSTRALIA_DOLLAR_IN_EURO_CONVERSION_FORMULA(
          currencyUnitToConvertTo.value,
          CurrencyValuesMediator.currencyValues,
        );

        break;
      case CurrencyUnit.BRAZIL_REAL:
        convertedToEuroValue = BRAZIL_REAL_IN_EURO_CONVERSION_FORMULA(
          currencyUnitToConvertTo.value,
          CurrencyValuesMediator.currencyValues,
        );

        break;
      case CurrencyUnit.CANADA_DOLLAR:
        convertedToEuroValue = CANADA_DOLLAR_IN_EURO_CONVERSION_FORMULA(
          currencyUnitToConvertTo.value,
          CurrencyValuesMediator.currencyValues,
        );

        break;
      case CurrencyUnit.UNITED_KINGDOM_POUND:
        convertedToEuroValue = UNITED_KINGDOM_POUND_IN_EURO_CONVERSION_FORMULA(
          currencyUnitToConvertTo.value,
          CurrencyValuesMediator.currencyValues,
        );

        break;
      case CurrencyUnit.SWITZERLAND_FRANC:
        convertedToEuroValue = SWITZERLAND_FRANC_IN_EURO_CONVERSION_FORMULA(
          currencyUnitToConvertTo.value,
          CurrencyValuesMediator.currencyValues,
        );

        break;
      case CurrencyUnit.NEW_ZEALAND_DOLLAR:
        convertedToEuroValue = NEW_ZEALAND_DOLLAR_IN_EURO_CONVERSION_FORMULA(
          currencyUnitToConvertTo.value,
          CurrencyValuesMediator.currencyValues,
        );

        break;
      case CurrencyUnit.EURO:
        convertedToEuroValue = double.parse(currencyUnitToConvertTo.value);

        break;
    }

    value = convertedToEuroValue.toString();
  }
}
