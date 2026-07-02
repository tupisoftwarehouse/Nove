import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";
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

class SpeedUnitTypeFixingTransactionScript {
  SpeedUnitTypeFixingTransactionScript._();

  static SpeedUnitEntity getTypeFixedInstanceFromMarshalledData(
    SpeedUnitEntity instanceFromMarshalledData,
  ) {
    late final SpeedUnitEntity typeFixedInstance;

    switch (instanceFromMarshalledData.measureUnit) {
      case SpeedUnit.LIGHTSPEED:
        typeFixedInstance = LightspeedUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case SpeedUnit.INCH_PER_SECOND:
        typeFixedInstance = InchPerSecondUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case SpeedUnit.KILOMETER_PER_SECOND:
        typeFixedInstance = KilometerPerSecondUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case SpeedUnit.FOOT_PER_SECOND:
        typeFixedInstance = FootPerSecondUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case SpeedUnit.KNOT:
        typeFixedInstance = KnotUnitEntity(instanceFromMarshalledData.value);

        break;
      case SpeedUnit.MACH:
        typeFixedInstance = MachUnitEntity(instanceFromMarshalledData.value);

        break;
      case SpeedUnit.KILOMETER_PER_HOUR:
        typeFixedInstance = KilometerPerHourUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case SpeedUnit.METER_PER_SECOND:
        typeFixedInstance = MeterPerSecondUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case SpeedUnit.MILE_PER_SECOND:
        typeFixedInstance = MilePerSecondUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case SpeedUnit.MILE_PER_HOUR:
        typeFixedInstance = MilePerHourUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
    }

    return typeFixedInstance;
  }
}
