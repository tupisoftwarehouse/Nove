import "package:flutter/foundation.dart";
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/domain/text_information_parser/text_information_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/text_information_parser_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/text_information_parser_data/text_information_parser_data_synchronizing_transaction_script.dart";
import "../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group(
    "Test \"TextInformationParserDataSynchronizingTransactionScript\" Class",
    () {
      late ValueNotifier<String> textToBeParsedState;
      late ValueNotifier<TextInformationValueObject> textInformationState;
      late AbstractKeyValueDatabase keyValueDatabase;

      setUpAll(() {
        keyValueDatabase = KeyValueDatabaseMock();

        textToBeParsedState = ValueNotifier<String>("");
        textInformationState = ValueNotifier<TextInformationValueObject>(
          ZEROED_TEXT_INFORMATION,
        );
      });

      test(
        "Test If Method \"synchronizeTextInformationData\" Stores Text To lengthBe Parsed And Text Information And Updates State",
        () {
          TextInformationParserDataSynchronizingTransactionScript.synchronizeTextInformationData(
            SMALL_TEXT_TO_BE_PARSED,
            TEXT_INFORMATION_FROM_SMALL_TEXT,
            textToBeParsedState,
            textInformationState,
            keyValueDatabase,
          );

          final textToBeParsedFromKeyValueDatabase =
              TextInformationParserDataStore.getTextToBeParsed(
                keyValueDatabase,
              );
          final textInformationFromKeyValueDatabase =
              TextInformationParserDataStore.getTextInformation(
                keyValueDatabase,
              );

          expect(textToBeParsedState.value, SMALL_TEXT_TO_BE_PARSED);

          expect(
            textInformationState.value.length,
            TEXT_INFORMATION_FROM_SMALL_TEXT.length,
          );
          expect(
            textInformationState.value.amountOfWords,
            TEXT_INFORMATION_FROM_SMALL_TEXT.amountOfWords,
          );

          expect(textToBeParsedFromKeyValueDatabase, SMALL_TEXT_TO_BE_PARSED);

          expect(
            textInformationFromKeyValueDatabase.length,
            TEXT_INFORMATION_FROM_SMALL_TEXT.length,
          );
          expect(
            textInformationFromKeyValueDatabase.amountOfWords,
            TEXT_INFORMATION_FROM_SMALL_TEXT.amountOfWords,
          );
        },
      );
    },
  );
}
