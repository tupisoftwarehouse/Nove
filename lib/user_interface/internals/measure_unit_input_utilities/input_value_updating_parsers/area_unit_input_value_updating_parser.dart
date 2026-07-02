import "package:flutter/widgets.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/acre_unit_entity.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/domain/area_unit_converter/hectare_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_centimeter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_foot_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_inch_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_kilometer_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_meter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_mile_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_millimeter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_yard_unit_entity.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class AreaUnitInputValueUpdatingParser {
  AreaUnitInputValueUpdatingParser._();

  static void updateAreaUnitValue(
    TextEditingController controller,
    AreaUnit selectedAreaUnit,
    void Function(AreaUnitEntity updatedAreaUnit) setAreaUnitValue,
  ) {
    try {
      final parsedUpdatedValue = double.parse(controller.text).toString();
      late final AreaUnitEntity updatedAreaUnit;

      switch (selectedAreaUnit) {
        case AreaUnit.SQUARE_KILOMETER:
          updatedAreaUnit = SquareKilometerUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.SQUARE_METER:
          updatedAreaUnit = SquareMeterUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.SQUARE_CENTIMETER:
          updatedAreaUnit = SquareCentimeterUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.SQUARE_MILLIMETER:
          updatedAreaUnit = SquareMillimeterUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.SQUARE_MILE:
          updatedAreaUnit = SquareMileUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.SQUARE_YARD:
          updatedAreaUnit = SquareYardUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.SQUARE_FOOT:
          updatedAreaUnit = SquareFootUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.SQUARE_INCH:
          updatedAreaUnit = SquareInchUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.HECTARE:
          updatedAreaUnit = HectareUnitEntity(parsedUpdatedValue);

          break;
        case AreaUnit.ACRE:
          updatedAreaUnit = AcreUnitEntity(parsedUpdatedValue);

          break;
      }

      setAreaUnitValue(updatedAreaUnit);
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
