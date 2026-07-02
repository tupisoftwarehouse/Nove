import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/time_unit_converter/day_unit_entity.dart";
import "package:nove/domain/time_unit_converter/time_unit_entity.dart";

void main() {
  group("Test \"TimeUnitEntity\" Entity", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final timeUnitInstance = TimeUnitEntity.fromMarshalledData(
          MARSHALLED_TIME_UNIT,
        );

        expect(timeUnitInstance, isA<TimeUnitEntity>());
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = DayUnitEntity(
          ZEROED_TIME_UNIT_VALUE,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_TIME_UNIT);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = TimeUnitEntity.fromMarshalledListData(
          MARSHALLED_LIST_OF_TIME_UNIT,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = TimeUnitEntity.marshalledListData([
          ZEROED_TIME_UNIT,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_TIME_UNIT);
      },
    );
  });
}
