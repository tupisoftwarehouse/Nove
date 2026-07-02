import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/celsius_unit_entity.dart";

void main() {
  group("Test \"TemperatureUnitEntity\" Entity", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final temperatureUnitInstance =
            TemperatureUnitEntity.fromMarshalledData(
              MARSHALLED_TEMPERATURE_UNIT,
            );

        expect(temperatureUnitInstance, isA<TemperatureUnitEntity>());
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = CelsiusUnitEntity(
          ZEROED_TEMPERATURE_UNIT_VALUE,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_TEMPERATURE_UNIT);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = TemperatureUnitEntity.fromMarshalledListData(
          MARSHALLED_LIST_OF_TEMPERATURE_UNIT,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = TemperatureUnitEntity.marshalledListData([
          ZEROED_TEMPERATURE_UNIT,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_TEMPERATURE_UNIT);
      },
    );
  });
}
