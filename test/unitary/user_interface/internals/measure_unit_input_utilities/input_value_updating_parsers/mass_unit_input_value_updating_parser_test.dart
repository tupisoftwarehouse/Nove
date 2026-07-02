import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/kilogram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/gram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/milligram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/ounce_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/pound_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/tonne_unit_entity.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/mass_unit_input_value_updating_parser.dart";

void main() {
  group("Test \"MassUnitInputValueUpdatingParser\" Class", () {
    late TextEditingController controller;
    late String updatedMassUnitValue;

    setUp(() {
      controller = TextEditingController(text: MASS_UNIT_VALUE);

      updatedMassUnitValue = double.parse(MASS_UNIT_VALUE).toString();
    });

    test(
      "Test If Method \"updateMassUnitValue\" Updates Mass Unit Value On Controller",
      () {
        late final TonneUnitEntity updatedTonneInstance;
        late final KilogramUnitEntity updatedKilogramInstance;
        late final GramUnitEntity updatedGramInstance;
        late final MilligramUnitEntity updatedMilligramInstance;
        late final PoundUnitEntity updatedPoundInstance;
        late final OunceUnitEntity updatedOunceInstance;

        MassUnitInputValueUpdatingParser.updateMassUnitValue(
          controller,
          MassUnit.TONNE,
          (updatedMassUnit) {
            updatedTonneInstance = updatedMassUnit as TonneUnitEntity;
          },
        );

        MassUnitInputValueUpdatingParser.updateMassUnitValue(
          controller,
          MassUnit.KILOGRAM,
          (updatedMassUnit) {
            updatedKilogramInstance = updatedMassUnit as KilogramUnitEntity;
          },
        );

        MassUnitInputValueUpdatingParser.updateMassUnitValue(
          controller,
          MassUnit.GRAM,
          (updatedMassUnit) {
            updatedGramInstance = updatedMassUnit as GramUnitEntity;
          },
        );

        MassUnitInputValueUpdatingParser.updateMassUnitValue(
          controller,
          MassUnit.MILLIGRAM,
          (updatedMassUnit) {
            updatedMilligramInstance = updatedMassUnit as MilligramUnitEntity;
          },
        );

        MassUnitInputValueUpdatingParser.updateMassUnitValue(
          controller,
          MassUnit.POUND,
          (updatedMassUnit) {
            updatedPoundInstance = updatedMassUnit as PoundUnitEntity;
          },
        );

        MassUnitInputValueUpdatingParser.updateMassUnitValue(
          controller,
          MassUnit.OUNCE,
          (updatedMassUnit) {
            updatedOunceInstance = updatedMassUnit as OunceUnitEntity;
          },
        );

        expect(updatedTonneInstance.value, updatedMassUnitValue);
        expect(updatedTonneInstance.measureUnit, MassUnit.TONNE);

        expect(updatedKilogramInstance.value, updatedMassUnitValue);
        expect(updatedKilogramInstance.measureUnit, MassUnit.KILOGRAM);

        expect(updatedGramInstance.value, updatedMassUnitValue);
        expect(updatedGramInstance.measureUnit, MassUnit.GRAM);

        expect(updatedMilligramInstance.value, updatedMassUnitValue);
        expect(updatedMilligramInstance.measureUnit, MassUnit.MILLIGRAM);

        expect(updatedPoundInstance.value, updatedMassUnitValue);
        expect(updatedPoundInstance.measureUnit, MassUnit.POUND);

        expect(updatedOunceInstance.value, updatedMassUnitValue);
        expect(updatedOunceInstance.measureUnit, MassUnit.OUNCE);
      },
    );

    test(
      "Test If Method \"updateMassUnitValue\" Removes Last Character If \"updatedInputValue\" Casting Fails With Value Not Empty And Last Character Is Not Allowed",
      () {
        controller.text = MASS_UNIT_VALUE + NON_NUMERIC_CHARACTER;

        MassUnitInputValueUpdatingParser.updateMassUnitValue(
          controller,
          MassUnit.KILOGRAM,
          (updatedMassUnit) {},
        );

        expect(controller.text, MASS_UNIT_VALUE);
      },
    );
  });
}
