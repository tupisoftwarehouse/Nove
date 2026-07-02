import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
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

class LengthUnitTypeFixingTransactionScript {
  LengthUnitTypeFixingTransactionScript._();

  static LengthUnitEntity getTypeFixedInstanceFromMarshalledData(
    LengthUnitEntity instanceFromMarshalledData,
  ) {
    late final LengthUnitEntity typeFixedInstance;

    switch (instanceFromMarshalledData.measureUnit) {
      case LengthUnit.KILOMETER:
        typeFixedInstance = KilometerUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case LengthUnit.METER:
        typeFixedInstance = MeterUnitEntity(instanceFromMarshalledData.value);

        break;
      case LengthUnit.CENTIMETER:
        typeFixedInstance = CentimeterUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case LengthUnit.MILLIMETER:
        typeFixedInstance = MillimeterUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case LengthUnit.MILE:
        typeFixedInstance = MileUnitEntity(instanceFromMarshalledData.value);

        break;
      case LengthUnit.YARD:
        typeFixedInstance = YardUnitEntity(instanceFromMarshalledData.value);

        break;
      case LengthUnit.FOOT:
        typeFixedInstance = FootUnitEntity(instanceFromMarshalledData.value);

        break;
      case LengthUnit.INCH:
        typeFixedInstance = InchUnitEntity(instanceFromMarshalledData.value);

        break;
      case LengthUnit.NAUTICAL_MILE:
        typeFixedInstance = NauticalMileUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
    }

    return typeFixedInstance;
  }
}
