import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_entity.dart";

void main() {
  group("Test \"SpeedUnitEntity\" Entity", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final speedUnitInstance = SpeedUnitEntity.fromMarshalledData(
          MARSHALLED_SPEED_UNIT,
        );

        expect(speedUnitInstance, isA<SpeedUnitEntity>());
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = KilometerPerHourUnitEntity(
          ZEROED_SPEED_UNIT_VALUE,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_SPEED_UNIT);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = SpeedUnitEntity.fromMarshalledListData(
          MARSHALLED_LIST_OF_SPEED_UNIT,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = SpeedUnitEntity.marshalledListData([
          ZEROED_SPEED_UNIT,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_SPEED_UNIT);
      },
    );
  });
}
