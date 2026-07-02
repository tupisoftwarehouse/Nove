import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/acre_unit_entity.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
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
import "package:nove/domain/area_unit_converter/internals/transaction_scripts/area_unit_type_fixing_transaction_script.dart";

void main() {
  group("Test \"AreaUnitTypeFixingTransactionScript\" Class", () {
    test(
      "Test If Method \"getTypeFixedInstanceFromMarshalledData\" Returns A Type Fixed Instance Of Instance From Marshalled Data",
      () {
        final squareKilometerUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.SQUARE_KILOMETER,
        );
        final squareMeterUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.SQUARE_METER,
        );
        final squareCentimeterUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.SQUARE_CENTIMETER,
        );
        final squareMillimeterUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.SQUARE_MILLIMETER,
        );
        final squareMileUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.SQUARE_MILE,
        );
        final squareYardUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.SQUARE_YARD,
        );
        final squareFootUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.SQUARE_FOOT,
        );
        final squareInchUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.SQUARE_INCH,
        );
        final hectareUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.HECTARE,
        );
        final acreUnitInstanceFromMarshalledData = AreaUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
          AreaUnit.ACRE,
        );
        final squareKilometerUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              squareKilometerUnitInstanceFromMarshalledData,
            );
        final squareMeterUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              squareMeterUnitInstanceFromMarshalledData,
            );
        final squareCentimeterUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              squareCentimeterUnitInstanceFromMarshalledData,
            );
        final squareMillimeterUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              squareMillimeterUnitInstanceFromMarshalledData,
            );
        final squareMileUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              squareMileUnitInstanceFromMarshalledData,
            );
        final squareYardUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              squareYardUnitInstanceFromMarshalledData,
            );
        final squareFootUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              squareFootUnitInstanceFromMarshalledData,
            );
        final squareInchUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              squareInchUnitInstanceFromMarshalledData,
            );
        final hectareUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              hectareUnitInstanceFromMarshalledData,
            );
        final acreUnitFixedInstance =
            AreaUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              acreUnitInstanceFromMarshalledData,
            );

        expect(
          squareKilometerUnitFixedInstance,
          isA<SquareKilometerUnitEntity>(),
        );
        expect(squareMeterUnitFixedInstance, isA<SquareMeterUnitEntity>());
        expect(
          squareCentimeterUnitFixedInstance,
          isA<SquareCentimeterUnitEntity>(),
        );
        expect(
          squareMillimeterUnitFixedInstance,
          isA<SquareMillimeterUnitEntity>(),
        );
        expect(squareMileUnitFixedInstance, isA<SquareMileUnitEntity>());
        expect(squareYardUnitFixedInstance, isA<SquareYardUnitEntity>());
        expect(squareFootUnitFixedInstance, isA<SquareFootUnitEntity>());
        expect(squareInchUnitFixedInstance, isA<SquareInchUnitEntity>());
        expect(hectareUnitFixedInstance, isA<HectareUnitEntity>());
        expect(acreUnitFixedInstance, isA<AcreUnitEntity>());
      },
    );
  });
}
