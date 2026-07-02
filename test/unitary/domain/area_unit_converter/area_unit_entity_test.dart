import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_meter_unit_entity.dart";

void main() {
  group("Test \"AreaUnitEntity\" Entity", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final acreUnitInstance = AreaUnitEntity.fromMarshalledData(
          MARSHALLED_AREA_UNIT,
        );

        expect(acreUnitInstance, isA<AreaUnitEntity>());
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = SquareMeterUnitEntity(
          ZEROED_AREA_UNIT_VALUE,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_AREA_UNIT);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = AreaUnitEntity.fromMarshalledListData(
          MARSHALLED_LIST_OF_AREA_UNIT,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = AreaUnitEntity.marshalledListData([
          ZEROED_AREA_UNIT,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_AREA_UNIT);
      },
    );
  });
}
