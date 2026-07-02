import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/gram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/kilogram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/milligram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/ounce_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/pound_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/tonne_unit_entity.dart";
import "../../../concerns/measure_unit_value_formatter.dart";

void main() {
  group("Test \"KilogramUnitEntity\" Entity", () {
    test(
      "Test If Method \"convertTo\" Converts To Mass Unit Value But Keeping Current Mass Unit",
      () {
        final instance = KilogramUnitEntity(ZEROED_MASS_UNIT_VALUE);
        final tonneUnit = TonneUnitEntity(MASS_UNIT_VALUE);
        final kilogramUnit = KilogramUnitEntity(MASS_UNIT_VALUE);
        final gramUnit = GramUnitEntity(MASS_UNIT_VALUE);
        final milligramUnit = MilligramUnitEntity(MASS_UNIT_VALUE);
        final poundUnit = PoundUnitEntity(MASS_UNIT_VALUE);
        final ounceUnit = OunceUnitEntity(MASS_UNIT_VALUE);
        late String formattedValue;

        instance.convertTo(tonneUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          MASS_UNIT_VALUE,
          TONNE_IN_KILOGRAM_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(gramUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          MASS_UNIT_VALUE,
          GRAM_IN_KILOGRAM_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(milligramUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          MASS_UNIT_VALUE,
          MILLIGRAM_IN_KILOGRAM_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(poundUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          MASS_UNIT_VALUE,
          POUND_IN_KILOGRAM_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(ounceUnit);

        formattedValue = MeasureUnitValueFormatter.getFormattedValue(
          MASS_UNIT_VALUE,
          OUNCE_IN_KILOGRAM_CONVERSION_MULTIPLIER,
        );

        expect(instance.value, formattedValue);

        instance.convertTo(kilogramUnit);

        expect(instance.value, MASS_UNIT_VALUE);
      },
    );
  });
}
