import "package:flutter/widgets.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/tonne_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/kilogram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/gram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/milligram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/pound_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/ounce_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class MassUnitInputValueUpdatingParser {
  MassUnitInputValueUpdatingParser._();

  static void updateMassUnitValue(
    TextEditingController controller,
    MassUnit selectedMassUnit,
    void Function(MassUnitEntity updatedMassUnit) setMassUnitValue,
  ) {
    try {
      final parsedUpdatedValue = double.parse(controller.text).toString();
      late final MassUnitEntity updatedMassUnit;

      switch (selectedMassUnit) {
        case MassUnit.TONNE:
          updatedMassUnit = TonneUnitEntity(parsedUpdatedValue);

          break;
        case MassUnit.KILOGRAM:
          updatedMassUnit = KilogramUnitEntity(parsedUpdatedValue);

          break;
        case MassUnit.GRAM:
          updatedMassUnit = GramUnitEntity(parsedUpdatedValue);

          break;
        case MassUnit.MILLIGRAM:
          updatedMassUnit = MilligramUnitEntity(parsedUpdatedValue);

          break;
        case MassUnit.POUND:
          updatedMassUnit = PoundUnitEntity(parsedUpdatedValue);

          break;
        case MassUnit.OUNCE:
          updatedMassUnit = OunceUnitEntity(parsedUpdatedValue);

          break;
      }

      setMassUnitValue(updatedMassUnit);
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
