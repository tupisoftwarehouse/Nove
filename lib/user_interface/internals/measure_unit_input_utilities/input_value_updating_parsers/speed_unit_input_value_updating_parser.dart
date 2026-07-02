import "package:flutter/widgets.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/lightspeed_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/inch_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/foot_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/knot_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mach_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/meter_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";

class SpeedUnitInputValueUpdatingParser {
  SpeedUnitInputValueUpdatingParser._();

  static void updateSpeedUnitValue(
    TextEditingController controller,
    SpeedUnit selectedSpeedUnit,
    void Function(SpeedUnitEntity updatedSpeedUnit) setSpeedUnitValue,
  ) {
    try {
      final parsedUpdatedValue = double.parse(controller.text).toString();
      late final SpeedUnitEntity updatedSpeedUnit;

      switch (selectedSpeedUnit) {
        case SpeedUnit.LIGHTSPEED:
          updatedSpeedUnit = LightspeedUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.INCH_PER_SECOND:
          updatedSpeedUnit = InchPerSecondUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.KILOMETER_PER_SECOND:
          updatedSpeedUnit = KilometerPerSecondUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.FOOT_PER_SECOND:
          updatedSpeedUnit = FootPerSecondUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.KNOT:
          updatedSpeedUnit = KnotUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.MACH:
          updatedSpeedUnit = MachUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.KILOMETER_PER_HOUR:
          updatedSpeedUnit = KilometerPerHourUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.METER_PER_SECOND:
          updatedSpeedUnit = MeterPerSecondUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.MILE_PER_SECOND:
          updatedSpeedUnit = MilePerSecondUnitEntity(parsedUpdatedValue);

          break;
        case SpeedUnit.MILE_PER_HOUR:
          updatedSpeedUnit = MilePerHourUnitEntity(parsedUpdatedValue);

          break;
      }

      setSpeedUnitValue(updatedSpeedUnit);
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
