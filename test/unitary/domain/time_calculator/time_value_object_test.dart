import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";

void main() {
  group("Test \"TimeValueObject\" Value Object", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final instanceFromMarshalledData = TimeValueObject.fromMarshalledData(
          MARSHALLED_TIME,
        );

        expect(instanceFromMarshalledData.hours, HOURS_OF_TIME);
        expect(instanceFromMarshalledData.minutes, MINUTES_OF_TIME);
        expect(instanceFromMarshalledData.seconds, SECONDS_OF_TIME);
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = TimeValueObject(
          HOURS_OF_TIME,
          MINUTES_OF_TIME,
          SECONDS_OF_TIME,
        ).marshalledData;

        expect(marshalledDataFromInstance, MARSHALLED_TIME);
      },
    );

    test(
      "Test If Method \"fromMarshalledListData\" Returns List Of Instances From Marshalled List Data",
      () {
        final instance = TimeValueObject.fromMarshalledListData(
          MARSHALLED_LIST_OF_TIME,
        );

        expect(instance.length, 1);
      },
    );

    test(
      "Test If Method \"marshalledListData\" Returns Marshalled List Data",
      () {
        final marshalledListData = TimeValueObject.marshalledListData([
          TIME_TO_BE_CALCULATED,
        ]);

        expect(marshalledListData, MARSHALLED_LIST_OF_TIME);
      },
    );
  });
}
