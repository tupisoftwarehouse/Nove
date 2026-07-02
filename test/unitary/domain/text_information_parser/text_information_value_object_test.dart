import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/domain/text_information_parser/text_information_value_object.dart";

void main() {
  group("Test \"TextInformationValueObject\" Value Object", () {
    test(
      "Test If Method \"fromMarshalledData\" Returns Instance From Marshalled Data",
      () {
        final instanceFromMarshalledData =
            TextInformationValueObject.fromMarshalledData(
              MARSHALLED_TEXT_INFORMATION_FROM_SMALL_TEXT,
            );

        expect(instanceFromMarshalledData.length, SMALL_TEXT_LENGTH);
        expect(
          instanceFromMarshalledData.amountOfWords,
          SMALL_TEXT_AMOUNT_OF_WORDS,
        );
      },
    );

    test(
      "Test If Computed Property \"marshalledData\" Returns Marshalled Data From Instance",
      () {
        final marshalledDataFromInstance = TextInformationValueObject(
          SMALL_TEXT_AMOUNT_OF_WORDS,
          SMALL_TEXT_LENGTH,
        ).marshalledData;

        expect(
          marshalledDataFromInstance,
          MARSHALLED_TEXT_INFORMATION_FROM_SMALL_TEXT,
        );
      },
    );
  });
}
