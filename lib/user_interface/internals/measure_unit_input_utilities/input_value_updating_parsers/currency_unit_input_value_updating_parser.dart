import "package:flutter/widgets.dart";
import "package:nove/data/currency/currency_values_value_object.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/australia_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/brazil_real_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/canada_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/euro_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_kingdom_pound_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/new_zealand_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/switzerland_franc_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_states_dollar_unit_entity.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class CurrencyUnitInputValueUpdatingParser {
  CurrencyUnitInputValueUpdatingParser._();

  static void updateCurrencyUnitValue(
    TextEditingController controller,
    CurrencyUnit selectedCurrencyUnit,
    CurrencyValuesValueObject currencyValues,
    void Function(CurrencyUnitEntity updatedCurrencyUnit) setCurrencyUnitValue,
  ) {
    try {
      final parsedUpdatedValue = double.parse(controller.text).toString();
      late final CurrencyUnitEntity updatedCurrencyUnit;

      switch (selectedCurrencyUnit) {
        case CurrencyUnit.UNITED_STATES_DOLLAR:
          updatedCurrencyUnit = UnitedStatesDollarUnitEntity(
            parsedUpdatedValue,
          );

          break;
        case CurrencyUnit.UNITED_KINGDOM_POUND:
          updatedCurrencyUnit = UnitedKingdomPoundUnitEntity(
            parsedUpdatedValue,
          );

          break;
        case CurrencyUnit.SWITZERLAND_FRANC:
          updatedCurrencyUnit = SwitzerlandFrancUnitEntity(parsedUpdatedValue);

          break;
        case CurrencyUnit.AUSTRALIA_DOLLAR:
          updatedCurrencyUnit = AustraliaDollarUnitEntity(parsedUpdatedValue);

          break;
        case CurrencyUnit.BRAZIL_REAL:
          updatedCurrencyUnit = BrazilRealUnitEntity(parsedUpdatedValue);

          break;
        case CurrencyUnit.CANADA_DOLLAR:
          updatedCurrencyUnit = CanadaDollarUnitEntity(parsedUpdatedValue);

          break;
        case CurrencyUnit.NEW_ZEALAND_DOLLAR:
          updatedCurrencyUnit = NewZealandDollarUnitEntity(parsedUpdatedValue);

          break;
        case CurrencyUnit.EURO:
          updatedCurrencyUnit = EuroUnitEntity(parsedUpdatedValue);

          break;
      }

      setCurrencyUnitValue(updatedCurrencyUnit);
    } catch (_) {
      if (controller.text.isNotEmpty &&
          isCharacterNotAllowed(controller.text)) {
        controller.text = controller.text.substring(
          0,
          controller.text.length - 1,
        );
      }
    }
  }
}
