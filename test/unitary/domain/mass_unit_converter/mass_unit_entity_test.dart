import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/kilogram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_entity.dart";

void main() {
  group("Test \"MassUnitEntity\" Entity", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final massUnitInstance = MassUnitEntity.fromMarshalledData(
          MARSHALLED_MASS_UNIT,
        );

        expect(massUnitInstance, isA<MassUnitEntity>());
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = KilogramUnitEntity(
          ZEROED_MASS_UNIT_VALUE,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_MASS_UNIT);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = MassUnitEntity.fromMarshalledListData(
          MARSHALLED_LIST_OF_MASS_UNIT,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = MassUnitEntity.marshalledListData([
          ZEROED_MASS_UNIT,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_MASS_UNIT);
      },
    );
  });
}
