import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/speed_unit_converter/lightspeed_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/inch_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/foot_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/knot_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mach_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/meter_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/internals/transaction_scripts/speed_unit_type_fixing_transaction_script.dart";

void main() {
  group("Test \"SpeedUnitTypeFixingTransactionScript\" Class", () {
    test(
      "Test If Method \"getTypeFixedInstanceFromMarshalledData\" Returns A Type Fixed Instance Of Instance From Marshalled Data",
      () {
        final lightspeedUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.LIGHTSPEED,
        );
        final inchPerSecondUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.INCH_PER_SECOND,
        );
        final kilometerPerSecondUnitInstanceFromMarshalledData =
            SpeedUnitEntity(
              ZEROED_SPEED_UNIT_VALUE,
              SpeedUnit.KILOMETER_PER_SECOND,
            );
        final footPerSecondUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.FOOT_PER_SECOND,
        );
        final knotUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.KNOT,
        );
        final machUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.MACH,
        );
        final kilometerPerHourUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.KILOMETER_PER_HOUR,
        );
        final meterPerSecondUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.METER_PER_SECOND,
        );
        final milePerSecondUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.MILE_PER_SECOND,
        );
        final milePerHourUnitInstanceFromMarshalledData = SpeedUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
          SpeedUnit.MILE_PER_HOUR,
        );
        final lightspeedUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              lightspeedUnitInstanceFromMarshalledData,
            );
        final inchPerSecondUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              inchPerSecondUnitInstanceFromMarshalledData,
            );
        final kilometerPerSecondUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              kilometerPerSecondUnitInstanceFromMarshalledData,
            );
        final footPerSecondUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              footPerSecondUnitInstanceFromMarshalledData,
            );
        final knotUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              knotUnitInstanceFromMarshalledData,
            );
        final machUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              machUnitInstanceFromMarshalledData,
            );
        final kilometerPerHourUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              kilometerPerHourUnitInstanceFromMarshalledData,
            );
        final meterPerSecondUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              meterPerSecondUnitInstanceFromMarshalledData,
            );
        final milePerSecondUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              milePerSecondUnitInstanceFromMarshalledData,
            );
        final milePerHourUnitFixedInstance =
            SpeedUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              milePerHourUnitInstanceFromMarshalledData,
            );

        expect(lightspeedUnitFixedInstance, isA<LightspeedUnitEntity>());
        expect(inchPerSecondUnitFixedInstance, isA<InchPerSecondUnitEntity>());
        expect(
          kilometerPerSecondUnitFixedInstance,
          isA<KilometerPerSecondUnitEntity>(),
        );
        expect(footPerSecondUnitFixedInstance, isA<FootPerSecondUnitEntity>());
        expect(knotUnitFixedInstance, isA<KnotUnitEntity>());
        expect(machUnitFixedInstance, isA<MachUnitEntity>());
        expect(
          kilometerPerHourUnitFixedInstance,
          isA<KilometerPerHourUnitEntity>(),
        );
        expect(
          meterPerSecondUnitFixedInstance,
          isA<MeterPerSecondUnitEntity>(),
        );
        expect(milePerSecondUnitFixedInstance, isA<MilePerSecondUnitEntity>());
        expect(milePerHourUnitFixedInstance, isA<MilePerHourUnitEntity>());
      },
    );
  });
}
