import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit_entity.dart";
import "package:nove/domain/length_unit_converter/meter_unit_entity.dart";

void main() {
  group("Test \"LengthUnitEntity\" Entity", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final lengthUnitInstance = LengthUnitEntity.fromMarshalledData(
          MARSHALLED_LENGTH_UNIT,
        );

        expect(lengthUnitInstance, isA<LengthUnitEntity>());
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = MeterUnitEntity(
          ZEROED_LENGTH_UNIT_VALUE,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_LENGTH_UNIT);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = LengthUnitEntity.fromMarshalledListData(
          MARSHALLED_LIST_OF_LENGTH_UNIT,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = LengthUnitEntity.marshalledListData([
          ZEROED_LENGTH_UNIT,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_LENGTH_UNIT);
      },
    );
  });
}
