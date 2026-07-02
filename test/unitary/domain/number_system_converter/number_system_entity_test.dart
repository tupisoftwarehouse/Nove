import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system_entity.dart";
import "package:nove/domain/number_system_converter/decimal_number_system_entity.dart";

void main() {
  group("Test \"NumberSystemEntity\" Entity", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final numberSystemInstance = NumberSystemEntity.fromMarshalledData(
          MARSHALLED_NUMBER_SYSTEM,
        );

        expect(numberSystemInstance, isA<NumberSystemEntity>());
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = DecimalNumberSystemEntity(
          ZEROED_NUMBER_SYSTEM_VALUE,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_NUMBER_SYSTEM);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = NumberSystemEntity.fromMarshalledListData(
          MARSHALLED_LIST_OF_NUMBER_SYSTEM,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = NumberSystemEntity.marshalledListData([
          ZEROED_NUMBER_SYSTEM,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_NUMBER_SYSTEM);
      },
    );
  });
}
