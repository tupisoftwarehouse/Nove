import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/acre_unit_entity.dart";
import "package:nove/domain/area_unit_converter/hectare_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_centimeter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_foot_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_inch_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_kilometer_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_meter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_mile_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_millimeter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_yard_unit_entity.dart";

class AreaUnitTypeFixingTransactionScript {
  AreaUnitTypeFixingTransactionScript._();

  static AreaUnitEntity getTypeFixedInstanceFromMarshalledData(
    AreaUnitEntity instanceFromMarshalledData,
  ) {
    late final AreaUnitEntity typeFixedInstance;

    switch (instanceFromMarshalledData.measureUnit) {
      case AreaUnit.SQUARE_KILOMETER:
        typeFixedInstance = SquareKilometerUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case AreaUnit.SQUARE_METER:
        typeFixedInstance = SquareMeterUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case AreaUnit.SQUARE_CENTIMETER:
        typeFixedInstance = SquareCentimeterUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case AreaUnit.SQUARE_MILLIMETER:
        typeFixedInstance = SquareMillimeterUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case AreaUnit.SQUARE_MILE:
        typeFixedInstance = SquareMileUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case AreaUnit.SQUARE_YARD:
        typeFixedInstance = SquareYardUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case AreaUnit.SQUARE_FOOT:
        typeFixedInstance = SquareFootUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case AreaUnit.SQUARE_INCH:
        typeFixedInstance = SquareInchUnitEntity(
          instanceFromMarshalledData.value,
        );

        break;
      case AreaUnit.HECTARE:
        typeFixedInstance = HectareUnitEntity(instanceFromMarshalledData.value);

        break;
      case AreaUnit.ACRE:
        typeFixedInstance = AcreUnitEntity(instanceFromMarshalledData.value);

        break;
    }

    return typeFixedInstance;
  }
}
