import "package:flutter/widgets.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/kilometer_unit_entity.dart";
import "package:nove/domain/length_unit_converter/meter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/centimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/millimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/yard_unit_entity.dart";
import "package:nove/domain/length_unit_converter/foot_unit_entity.dart";
import "package:nove/domain/length_unit_converter/inch_unit_entity.dart";
import "package:nove/domain/length_unit_converter/nautical_mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class LengthUnitInputValueUpdatingParser {
  LengthUnitInputValueUpdatingParser._();

  static void updateLengthUnitValue(
    TextEditingController controller,
    LengthUnit selectedLengthUnit,
    void Function(LengthUnitEntity updatedLengthUnit) setLengthUnitValue,
  ) {
    try {
      final parsedUpdatedValue = double.parse(controller.text).toString();
      late final LengthUnitEntity updatedLengthUnit;

      switch (selectedLengthUnit) {
        case LengthUnit.KILOMETER:
          updatedLengthUnit = KilometerUnitEntity(parsedUpdatedValue);

          break;
        case LengthUnit.METER:
          updatedLengthUnit = MeterUnitEntity(parsedUpdatedValue);

          break;
        case LengthUnit.CENTIMETER:
          updatedLengthUnit = CentimeterUnitEntity(parsedUpdatedValue);

          break;
        case LengthUnit.MILLIMETER:
          updatedLengthUnit = MillimeterUnitEntity(parsedUpdatedValue);

          break;
        case LengthUnit.MILE:
          updatedLengthUnit = MileUnitEntity(parsedUpdatedValue);

          break;
        case LengthUnit.YARD:
          updatedLengthUnit = YardUnitEntity(parsedUpdatedValue);

          break;
        case LengthUnit.FOOT:
          updatedLengthUnit = FootUnitEntity(parsedUpdatedValue);

          break;
        case LengthUnit.INCH:
          updatedLengthUnit = InchUnitEntity(parsedUpdatedValue);

          break;
        case LengthUnit.NAUTICAL_MILE:
          updatedLengthUnit = NauticalMileUnitEntity(parsedUpdatedValue);

          break;
      }

      setLengthUnitValue(updatedLengthUnit);
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
