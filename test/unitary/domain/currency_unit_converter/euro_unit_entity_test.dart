import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/australia_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/brazil_real_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/canada_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/currency_unit_converter/euro_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/new_zealand_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/switzerland_franc_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_kingdom_pound_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_states_dollar_unit_entity.dart";
import "../../../concerns/measure_unit_value_formatter.dart";

void main() {
  group("Test \"NewZealandDollarUnitEntity\" Entity", () {
    setUpAll(() {
      CurrencyValuesMediator.currencyValues = CURRENCY_VALUES;
    });

    test(
      "Test If Method \"convertTo\" Converts To Currency Unit Value But Keeping Current Currency Unit",
      () {
        final instance = NewZealandDollarUnitEntity(ZEROED_CURRENCY_UNIT_VALUE);
        final unitedStatesDollarUnit = UnitedStatesDollarUnitEntity(
          CURRENCY_UNIT_VALUE,
        );
        final unitedKingdomPoundUnit = UnitedKingdomPoundUnitEntity(
          CURRENCY_UNIT_VALUE,
        );
        final switzerlandFrancUnit = SwitzerlandFrancUnitEntity(
          CURRENCY_UNIT_VALUE,
        );
        final australiaDollarUnit = AustraliaDollarUnitEntity(
          CURRENCY_UNIT_VALUE,
        );
        final brazilRealUnit = BrazilRealUnitEntity(CURRENCY_UNIT_VALUE);
        final canadaDollarUnit = CanadaDollarUnitEntity(CURRENCY_UNIT_VALUE);
        final newZealandDollarUnit = NewZealandDollarUnitEntity(
          CURRENCY_UNIT_VALUE,
        );
        final euroUnit = EuroUnitEntity(CURRENCY_UNIT_VALUE);
        late String formattedValue;

        instance.convertTo(unitedStatesDollarUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          CURRENCY_UNIT_VALUE,
          UNITED_STATES_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
            CURRENCY_UNIT_VALUE,
            CURRENCY_VALUES,
          ),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(unitedKingdomPoundUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          CURRENCY_UNIT_VALUE,
          UNITED_KINGDOM_POUND_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
            CURRENCY_UNIT_VALUE,
            CURRENCY_VALUES,
          ),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(switzerlandFrancUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          CURRENCY_UNIT_VALUE,
          SWITZERLAND_FRANC_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
            CURRENCY_UNIT_VALUE,
            CURRENCY_VALUES,
          ),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(australiaDollarUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          CURRENCY_UNIT_VALUE,
          AUSTRALIA_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
            CURRENCY_UNIT_VALUE,
            CURRENCY_VALUES,
          ),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(brazilRealUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          CURRENCY_UNIT_VALUE,
          BRAZIL_REAL_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
            CURRENCY_UNIT_VALUE,
            CURRENCY_VALUES,
          ),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(canadaDollarUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          CURRENCY_UNIT_VALUE,
          CANADA_DOLLAR_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
            CURRENCY_UNIT_VALUE,
            CURRENCY_VALUES,
          ),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(euroUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          CURRENCY_UNIT_VALUE,
          EURO_IN_NEW_ZEALAND_DOLLAR_CONVERSION_FORMULA(
            CURRENCY_UNIT_VALUE,
            CURRENCY_VALUES,
          ),
        );

        expect(instance.value, formattedValue);

        instance.convertTo(newZealandDollarUnit);

        expect(instance.value, CURRENCY_UNIT_VALUE);
      },
    );
  });
}
