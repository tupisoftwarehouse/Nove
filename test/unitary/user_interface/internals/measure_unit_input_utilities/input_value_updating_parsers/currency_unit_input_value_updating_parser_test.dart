import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/australia_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/brazil_real_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/canada_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/euro_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_kingdom_pound_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/new_zealand_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/switzerland_franc_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_states_dollar_unit_entity.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/currency_unit_input_value_updating_parser.dart";

void main() {
  group("Test \"CurrencyUnitInputValueUpdatingParser\" Class", () {
    late TextEditingController controller;
    late String updatedCurrencyUnitValue;

    setUp(() {
      controller = TextEditingController(text: CURRENCY_UNIT_VALUE);

      updatedCurrencyUnitValue = double.parse(CURRENCY_UNIT_VALUE).toString();
    });

    test(
      "Test If Method \"updateCurrencyUnitValue\" Updates Currency Unit Value On Controller",
      () {
        late final UnitedStatesDollarUnitEntity
        updatedUnitedStatesDollarInstance;
        late final UnitedKingdomPoundUnitEntity
        updatedGreatBritainPoundInstance;
        late final SwitzerlandFrancUnitEntity updatedSwissFrancInstance;
        late final AustraliaDollarUnitEntity updatedAustralianDollarInstance;
        late final BrazilRealUnitEntity updatedBrazilianRealInstance;
        late final CanadaDollarUnitEntity updatedCanadianDollarInstance;
        late final NewZealandDollarUnitEntity updatedNewZealanderDollarInstance;
        late final EuroUnitEntity updatedEuroInstance;

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.UNITED_STATES_DOLLAR,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {
            updatedUnitedStatesDollarInstance =
                updatedCurrencyUnit as UnitedStatesDollarUnitEntity;
          },
        );

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.UNITED_KINGDOM_POUND,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {
            updatedGreatBritainPoundInstance =
                updatedCurrencyUnit as UnitedKingdomPoundUnitEntity;
          },
        );

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.SWITZERLAND_FRANC,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {
            updatedSwissFrancInstance =
                updatedCurrencyUnit as SwitzerlandFrancUnitEntity;
          },
        );

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.AUSTRALIA_DOLLAR,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {
            updatedAustralianDollarInstance =
                updatedCurrencyUnit as AustraliaDollarUnitEntity;
          },
        );

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.BRAZIL_REAL,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {
            updatedBrazilianRealInstance =
                updatedCurrencyUnit as BrazilRealUnitEntity;
          },
        );

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.CANADA_DOLLAR,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {
            updatedCanadianDollarInstance =
                updatedCurrencyUnit as CanadaDollarUnitEntity;
          },
        );

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.NEW_ZEALAND_DOLLAR,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {
            updatedNewZealanderDollarInstance =
                updatedCurrencyUnit as NewZealandDollarUnitEntity;
          },
        );

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.EURO,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {
            updatedEuroInstance = updatedCurrencyUnit as EuroUnitEntity;
          },
        );

        expect(
          updatedUnitedStatesDollarInstance.value,
          updatedCurrencyUnitValue,
        );
        expect(
          updatedUnitedStatesDollarInstance.measureUnit,
          CurrencyUnit.UNITED_STATES_DOLLAR,
        );

        expect(
          updatedGreatBritainPoundInstance.value,
          updatedCurrencyUnitValue,
        );
        expect(
          updatedGreatBritainPoundInstance.measureUnit,
          CurrencyUnit.UNITED_KINGDOM_POUND,
        );

        expect(updatedSwissFrancInstance.value, updatedCurrencyUnitValue);
        expect(
          updatedSwissFrancInstance.measureUnit,
          CurrencyUnit.SWITZERLAND_FRANC,
        );

        expect(updatedAustralianDollarInstance.value, updatedCurrencyUnitValue);
        expect(
          updatedAustralianDollarInstance.measureUnit,
          CurrencyUnit.AUSTRALIA_DOLLAR,
        );

        expect(updatedBrazilianRealInstance.value, updatedCurrencyUnitValue);
        expect(
          updatedBrazilianRealInstance.measureUnit,
          CurrencyUnit.BRAZIL_REAL,
        );

        expect(updatedCanadianDollarInstance.value, updatedCurrencyUnitValue);
        expect(
          updatedCanadianDollarInstance.measureUnit,
          CurrencyUnit.CANADA_DOLLAR,
        );

        expect(
          updatedNewZealanderDollarInstance.value,
          updatedCurrencyUnitValue,
        );
        expect(
          updatedNewZealanderDollarInstance.measureUnit,
          CurrencyUnit.NEW_ZEALAND_DOLLAR,
        );

        expect(updatedEuroInstance.value, updatedCurrencyUnitValue);
        expect(updatedEuroInstance.measureUnit, CurrencyUnit.EURO);
      },
    );

    test(
      "Test If Method \"updateCurrencyUnitValue\" Removes Last Character If \"updatedInputValue\" Casting Fails With Value Not Empty And Last Character Is Not Allowed",
      () {
        controller.text = CURRENCY_UNIT_VALUE + NON_NUMERIC_CHARACTER;

        CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
          controller,
          CurrencyUnit.UNITED_STATES_DOLLAR,
          CURRENCY_VALUES,
          (updatedCurrencyUnit) {},
        );

        expect(controller.text, CURRENCY_UNIT_VALUE);
      },
    );
  });
}
