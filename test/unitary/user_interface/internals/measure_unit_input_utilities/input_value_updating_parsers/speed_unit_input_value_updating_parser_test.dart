import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/speed_unit_converter/inch_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/knot_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/lightspeed_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mach_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/meter_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/foot_per_second_unit_entity.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/speed_unit_input_value_updating_parser.dart";

void main() {
  group("Test \"SpeedUnitInputValueUpdatingParser\" Class", () {
    late TextEditingController controller;
    late String updatedSpeedUnitValue;

    setUp(() {
      controller = TextEditingController(text: SPEED_UNIT_VALUE);

      updatedSpeedUnitValue = double.parse(SPEED_UNIT_VALUE).toString();
    });

    test(
      "Test If Method \"updateSpeedUnitValue\" Updates Speed Unit Value On Controller",
      () {
        late final LightspeedUnitEntity updatedLightspeedInstance;
        late final InchPerSecondUnitEntity updatedInchPerSecondInstance;
        late final KilometerPerSecondUnitEntity
        updatedKilometerPerSecondInstance;
        late final FootPerSecondUnitEntity updatedFootPerSecondInstance;
        late final KnotUnitEntity updatedKnotInstance;
        late final MachUnitEntity updatedMachInstance;
        late final KilometerPerHourUnitEntity updatedKilometerPerHourInstance;
        late final MeterPerSecondUnitEntity updatedMeterPerSecondInstance;
        late final MilePerSecondUnitEntity updatedMilePerSecondInstance;
        late final MilePerHourUnitEntity updatedMilePerHourInstance;

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.LIGHTSPEED,
          (updatedSpeedUnit) {
            updatedLightspeedInstance =
                updatedSpeedUnit as LightspeedUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.INCH_PER_SECOND,
          (updatedSpeedUnit) {
            updatedInchPerSecondInstance =
                updatedSpeedUnit as InchPerSecondUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.KILOMETER_PER_SECOND,
          (updatedSpeedUnit) {
            updatedKilometerPerSecondInstance =
                updatedSpeedUnit as KilometerPerSecondUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.FOOT_PER_SECOND,
          (updatedSpeedUnit) {
            updatedFootPerSecondInstance =
                updatedSpeedUnit as FootPerSecondUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.KNOT,
          (updatedSpeedUnit) {
            updatedKnotInstance = updatedSpeedUnit as KnotUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.MACH,
          (updatedSpeedUnit) {
            updatedMachInstance = updatedSpeedUnit as MachUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.KILOMETER_PER_HOUR,
          (updatedSpeedUnit) {
            updatedKilometerPerHourInstance =
                updatedSpeedUnit as KilometerPerHourUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.METER_PER_SECOND,
          (updatedSpeedUnit) {
            updatedMeterPerSecondInstance =
                updatedSpeedUnit as MeterPerSecondUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.MILE_PER_SECOND,
          (updatedSpeedUnit) {
            updatedMilePerSecondInstance =
                updatedSpeedUnit as MilePerSecondUnitEntity;
          },
        );

        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.MILE_PER_HOUR,
          (updatedSpeedUnit) {
            updatedMilePerHourInstance =
                updatedSpeedUnit as MilePerHourUnitEntity;
          },
        );

        expect(updatedLightspeedInstance.value, updatedSpeedUnitValue);
        expect(updatedLightspeedInstance.measureUnit, SpeedUnit.LIGHTSPEED);

        expect(updatedInchPerSecondInstance.value, updatedSpeedUnitValue);
        expect(
          updatedInchPerSecondInstance.measureUnit,
          SpeedUnit.INCH_PER_SECOND,
        );

        expect(updatedKilometerPerSecondInstance.value, updatedSpeedUnitValue);
        expect(
          updatedKilometerPerSecondInstance.measureUnit,
          SpeedUnit.KILOMETER_PER_SECOND,
        );

        expect(updatedFootPerSecondInstance.value, updatedSpeedUnitValue);
        expect(
          updatedFootPerSecondInstance.measureUnit,
          SpeedUnit.FOOT_PER_SECOND,
        );

        expect(updatedKnotInstance.value, updatedSpeedUnitValue);
        expect(updatedKnotInstance.measureUnit, SpeedUnit.KNOT);

        expect(updatedMachInstance.value, updatedSpeedUnitValue);
        expect(updatedMachInstance.measureUnit, SpeedUnit.MACH);

        expect(updatedKilometerPerHourInstance.value, updatedSpeedUnitValue);
        expect(
          updatedKilometerPerHourInstance.measureUnit,
          SpeedUnit.KILOMETER_PER_HOUR,
        );

        expect(updatedMeterPerSecondInstance.value, updatedSpeedUnitValue);
        expect(
          updatedMeterPerSecondInstance.measureUnit,
          SpeedUnit.METER_PER_SECOND,
        );

        expect(updatedMilePerSecondInstance.value, updatedSpeedUnitValue);
        expect(
          updatedMilePerSecondInstance.measureUnit,
          SpeedUnit.MILE_PER_SECOND,
        );

        expect(updatedMilePerHourInstance.value, updatedSpeedUnitValue);
        expect(updatedMilePerHourInstance.measureUnit, SpeedUnit.MILE_PER_HOUR);
      },
    );

    test(
      "Test If Method \"updateSpeedUnitValue\" Removes Last Character If \"updatedInputValue\" Casting Fails With Value Not Empty And Last Character Is Not Allowed",
      () {
        controller.text = SPEED_UNIT_VALUE + NON_NUMERIC_CHARACTER;
        SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
          controller,
          SpeedUnit.METER_PER_SECOND,
          (updatedSpeedUnit) {},
        );

        expect(controller.text, SPEED_UNIT_VALUE);
      },
    );
  });
}
