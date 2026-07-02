import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/kilometer_unit_entity.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/domain/length_unit_converter/meter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/centimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/millimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/yard_unit_entity.dart";
import "package:nove/domain/length_unit_converter/foot_unit_entity.dart";
import "package:nove/domain/length_unit_converter/inch_unit_entity.dart";
import "package:nove/domain/length_unit_converter/nautical_mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/internals/transaction_scripts/length_unit_type_fixing_transaction_script.dart";

void main() {
  group("Test \"LengthUnitTypeFixingTransactionScript\" Class", () {
    test(
      "Test If Method \"getTypeFixedInstanceFromMarshalledData\" Returns A Type Fixed Instance Of Instance From Marshalled Data",
      () {
        final kilometerUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.KILOMETER,
        );
        final meterUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.METER,
        );
        final centimeterUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.CENTIMETER,
        );
        final millimeterUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.MILLIMETER,
        );
        final mileUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.MILE,
        );
        final yardUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.YARD,
        );
        final footUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.FOOT,
        );
        final inchUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.INCH,
        );
        final nauticalMileUnitInstanceFromMarshalledData = LengthUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
          LengthUnit.NAUTICAL_MILE,
        );
        final kilometerUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              kilometerUnitInstanceFromMarshalledData,
            );
        final meterUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              meterUnitInstanceFromMarshalledData,
            );
        final centimeterUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              centimeterUnitInstanceFromMarshalledData,
            );
        final millimeterUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              millimeterUnitInstanceFromMarshalledData,
            );
        final mileUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              mileUnitInstanceFromMarshalledData,
            );
        final yardUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              yardUnitInstanceFromMarshalledData,
            );
        final footUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              footUnitInstanceFromMarshalledData,
            );
        final inchUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              inchUnitInstanceFromMarshalledData,
            );
        final nauticalMileUnitFixedInstance =
            LengthUnitTypeFixingTransactionScript.getTypeFixedInstanceFromMarshalledData(
              nauticalMileUnitInstanceFromMarshalledData,
            );

        expect(kilometerUnitFixedInstance, isA<KilometerUnitEntity>());
        expect(meterUnitFixedInstance, isA<MeterUnitEntity>());
        expect(centimeterUnitFixedInstance, isA<CentimeterUnitEntity>());
        expect(millimeterUnitFixedInstance, isA<MillimeterUnitEntity>());
        expect(mileUnitFixedInstance, isA<MileUnitEntity>());
        expect(yardUnitFixedInstance, isA<YardUnitEntity>());
        expect(footUnitFixedInstance, isA<FootUnitEntity>());
        expect(inchUnitFixedInstance, isA<InchUnitEntity>());
        expect(nauticalMileUnitFixedInstance, isA<NauticalMileUnitEntity>());
      },
    );
  });
}
