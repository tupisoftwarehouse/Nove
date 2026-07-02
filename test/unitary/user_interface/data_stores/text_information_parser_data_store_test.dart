import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/text_information_parser/text_information_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/text_information_parser_data_store.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TextInformationParserDataStore\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();
    });

    test(
      "Test If Method \"getTextToBeParsed\" Returns Text To Be Parsed From Key-Value Database",
      () {
        keyValueDatabase.setItem(TEXT_TO_BE_PARSED_KEY, () {
          return SMALL_TEXT_TO_BE_PARSED;
        });

        final textToBeParsedFromKeyValueDatabase =
            TextInformationParserDataStore.getTextToBeParsed(keyValueDatabase);

        expect(textToBeParsedFromKeyValueDatabase, SMALL_TEXT_TO_BE_PARSED);
      },
    );

    test(
      "Test If Method \"setTextToBeParsed\" Sets Text To Be Parsed On Key-Value Database",
      () {
        TextInformationParserDataStore.setTextToBeParsed(
          SMALL_TEXT_TO_BE_PARSED,
          keyValueDatabase,
        );

        final textToBeParsedFromKeyValueDatabase = keyValueDatabase.getItem(
          TEXT_TO_BE_PARSED_KEY,
          (marshalledData) {
            return marshalledData;
          },
        );

        expect(textToBeParsedFromKeyValueDatabase, SMALL_TEXT_TO_BE_PARSED);
      },
    );

    test(
      "Test If Method \"getTextInformation\" Returns Text Information From Key-Value Database",
      () {
        keyValueDatabase.setItem(TEXT_INFORMATION_KEY, () {
          return TEXT_INFORMATION_FROM_SMALL_TEXT.marshalledData;
        });

        final textInformationFromKeyValueDatabase =
            TextInformationParserDataStore.getTextInformation(keyValueDatabase);

        expect(
          textInformationFromKeyValueDatabase.amountOfWords,
          TEXT_INFORMATION_FROM_SMALL_TEXT.amountOfWords,
        );
        expect(
          textInformationFromKeyValueDatabase.length,
          TEXT_INFORMATION_FROM_SMALL_TEXT.length,
        );
      },
    );

    test(
      "Test If Method \"setTextInformation\" Sets Text Information On Key-Value Database",
      () {
        TextInformationParserDataStore.setTextInformation(
          TEXT_INFORMATION_FROM_SMALL_TEXT,
          keyValueDatabase,
        );

        final textInformationFromKeyValueDatabase = keyValueDatabase.getItem(
          TEXT_INFORMATION_KEY,
          (marshalledData) {
            return TextInformationValueObject.fromMarshalledData(
              marshalledData,
            );
          },
        );

        expect(
          textInformationFromKeyValueDatabase.amountOfWords,
          TEXT_INFORMATION_FROM_SMALL_TEXT.amountOfWords,
        );
        expect(
          textInformationFromKeyValueDatabase.length,
          TEXT_INFORMATION_FROM_SMALL_TEXT.length,
        );
      },
    );
  });
}
