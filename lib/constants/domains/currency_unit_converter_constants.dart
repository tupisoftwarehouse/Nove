import "package:nove/data/currency/currency_values_value_object.dart";
import "package:nove/domain/currency_unit_converter/internals/test_utilities/test_currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_states_dollar_unit_entity.dart";

const CURRENCY_UNIT_VALUE = "1";

const INITIAL_CURRENCY_UNIT_VALUE = "0";

CurrencyUnitEntity CURRENCY_UNIT_TO_CONVERT_TO(
  void Function(dynamic measureUnit) convertToImplementation,
) {
  return TestCurrencyUnitEntity(
    CURRENCY_UNIT_VALUE,
    CurrencyUnit.UNITED_STATES_DOLLAR,
    convertToImplementation,
  );
}

CurrencyUnitEntity UPDATED_CURRENCY_UNIT(
  void Function(dynamic measureUnit) convertToImplementation,
) {
  return TestCurrencyUnitEntity(
    CURRENCY_UNIT_VALUE + CURRENCY_UNIT_VALUE,
    CurrencyUnit.UNITED_STATES_DOLLAR,
    convertToImplementation,
  );
}

final OUTDATED_CURRENCY_UNIT = TestCurrencyUnitEntity(
  CURRENCY_UNIT_VALUE + CURRENCY_UNIT_VALUE,
  CurrencyUnit.UNITED_STATES_DOLLAR,
  (_) {},
);

const ZEROED_CURRENCY_UNIT_VALUE = "0";

final ZEROED_CURRENCY_UNIT = UnitedStatesDollarUnitEntity(
  INITIAL_CURRENCY_UNIT_VALUE,
);

CurrencyUnitEntity RESET_CURRENCY_UNIT() {
  return UnitedStatesDollarUnitEntity(INITIAL_CURRENCY_UNIT_VALUE);
}

double UNITED_STATES_DOLLAR_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) * currencyValues.australiaDollar;
}

double BRAZIL_REAL_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.australiaDollar / currencyValues.brazilReal);
}

double CANADA_DOLLAR_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.australiaDollar / currencyValues.canadaDollar);
}

double UNITED_KINGDOM_POUND_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.australiaDollar / currencyValues.unitedKingdomPound);
}

double SWITZERLAND_FRANC_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.australiaDollar / currencyValues.switzerlandFranc);
}

double NEW_ZEALAND_DOLLAR_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.australiaDollar / currencyValues.newZealandDollar);
}

double EURO_IN_AUSTRALIA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.australiaDollar / currencyValues.euro);
}

double UNITED_STATES_DOLLAR_IN_BRAZIL_REAL_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) * currencyValues.brazilReal;
}

double AUSTRALIA_DOLLAR_IN_BRAZIL_REAL_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.brazilReal / currencyValues.australiaDollar);
}

double CANADA_DOLLAR_IN_BRAZIL_REAL_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.brazilReal / currencyValues.canadaDollar);
}

double UNITED_KINGDOM_POUND_IN_BRAZIL_REAL_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.brazilReal / currencyValues.unitedKingdomPound);
}

double SWITZERLAND_FRANC_IN_BRAZIL_REAL_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.brazilReal / currencyValues.switzerlandFranc);
}

double NEW_ZEALAND_DOLLAR_IN_BRAZIL_REAL_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.brazilReal / currencyValues.newZealandDollar);
}

double EURO_IN_BRAZIL_REAL_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.brazilReal / currencyValues.euro);
}

double UNITED_STATES_DOLLAR_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) * currencyValues.canadaDollar;
}

double AUSTRALIA_DOLLAR_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.canadaDollar / currencyValues.australiaDollar);
}

double BRAZIL_REAL_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.canadaDollar / currencyValues.brazilReal);
}

double UNITED_KINGDOM_POUND_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.canadaDollar / currencyValues.unitedKingdomPound);
}

double SWITZERLAND_FRANC_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.canadaDollar / currencyValues.switzerlandFranc);
}

double NEW_ZEALAND_DOLLAR_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.canadaDollar / currencyValues.newZealandDollar);
}

double EURO_IN_CANADA_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.canadaDollar / currencyValues.euro);
}

double UNITED_STATES_DOLLAR_IN_EURO_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) * currencyValues.euro;
}

double AUSTRALIA_DOLLAR_IN_EURO_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.euro / currencyValues.australiaDollar);
}

double BRAZIL_REAL_IN_EURO_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.euro / currencyValues.brazilReal);
}

double CANADA_DOLLAR_IN_EURO_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.euro / currencyValues.canadaDollar);
}

double UNITED_KINGDOM_POUND_IN_EURO_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.euro / currencyValues.unitedKingdomPound);
}

double NEW_ZEALAND_DOLLAR_IN_EURO_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.euro / currencyValues.newZealandDollar);
}

double SWITZERLAND_FRANC_IN_EURO_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.euro / currencyValues.switzerlandFranc);
}

double UNITED_STATES_DOLLAR_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) * currencyValues.unitedKingdomPound;
}

double AUSTRALIA_DOLLAR_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.unitedKingdomPound / currencyValues.australiaDollar);
}

double BRAZIL_REAL_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.unitedKingdomPound / currencyValues.brazilReal);
}

double CANADA_DOLLAR_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.unitedKingdomPound / currencyValues.canadaDollar);
}

double SWITZERLAND_FRANC_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.unitedKingdomPound / currencyValues.switzerlandFranc);
}

double NEW_ZEALAND_DOLLAR_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.unitedKingdomPound / currencyValues.newZealandDollar);
}

double EURO_IN_UNITED_KINGDOM_POUND_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.unitedKingdomPound / currencyValues.euro);
}

double EURO_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) / currencyValues.euro;
}

double AUSTRALIA_DOLLAR_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) / currencyValues.australiaDollar;
}

double BRAZIL_REAL_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) / currencyValues.brazilReal;
}

double CANADA_DOLLAR_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) / currencyValues.canadaDollar;
}

double UNITED_KINGDOM_POUND_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) / currencyValues.unitedKingdomPound;
}

double SWITZERLAND_FRANC_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) / currencyValues.switzerlandFranc;
}

double NEW_ZEALAND_DOLLAR_IN_UNITED_STATES_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) / currencyValues.newZealandDollar;
}

double UNITED_STATES_DOLLAR_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) * currencyValues.switzerlandFranc;
}

double AUSTRALIA_DOLLAR_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.switzerlandFranc / currencyValues.australiaDollar);
}

double BRAZIL_REAL_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.switzerlandFranc / currencyValues.brazilReal);
}

double CANADA_DOLLAR_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.switzerlandFranc / currencyValues.canadaDollar);
}

double UNITED_KINGDOM_POUND_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.switzerlandFranc / currencyValues.unitedKingdomPound);
}

double NEW_ZEALAND_DOLLAR_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.switzerlandFranc / currencyValues.newZealandDollar);
}

double EURO_IN_SWITZERLAND_FRANC_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.switzerlandFranc / currencyValues.euro);
}

double UNITED_STATES_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) * currencyValues.newZealandDollar;
}

double AUSTRALIA_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.newZealandDollar / currencyValues.australiaDollar);
}

double BRAZIL_REAL_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.newZealandDollar / currencyValues.brazilReal);
}

double CANADA_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.newZealandDollar / currencyValues.canadaDollar);
}

double UNITED_KINGDOM_POUND_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.newZealandDollar / currencyValues.unitedKingdomPound);
}

double SWITZERLAND_FRANC_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.newZealandDollar / currencyValues.switzerlandFranc);
}

double EURO_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
  String valueToBeConverted,
  CurrencyValuesValueObject currencyValues,
) {
  return double.parse(valueToBeConverted) *
      (currencyValues.newZealandDollar / currencyValues.euro);
}

final MARSHALLED_CURRENCY_UNIT =
    "{\"measureUnit\":\"${CurrencyUnit.UNITED_STATES_DOLLAR.name}\",\"value\":\"$INITIAL_CURRENCY_UNIT_VALUE\"}";

final MARSHALLED_LIST_OF_CURRENCY_UNIT = "[$MARSHALLED_CURRENCY_UNIT]";

final MARSHALLED_LIST_OF_CURRENCY_UNIT_WITH_OUTDATED_CURRENCY_VALUES =
    "[$MARSHALLED_CURRENCY_UNIT]";
