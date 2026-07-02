import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/text_information_parser_data_store.dart";
import "package:nove/user_interface/view_models/text_information_parser_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TextInformationParserViewModel\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late TextInformationParserViewModel textInformationParserViewModel;

    setUp(() {
      keyValueDatabase = KeyValueDatabaseMock();

      textInformationParserViewModel = TextInformationParserViewModel(
        keyValueDatabase,
      );
    });

    test(
      "Test If View Model Initializes Its States With Key-Value Database Data",
      () {
        TextInformationParserDataStore.setTextToBeParsed(
          SMALL_TEXT_TO_BE_PARSED,
          keyValueDatabase,
        );
        TextInformationParserDataStore.setTextInformation(
          TEXT_INFORMATION_FROM_SMALL_TEXT,
          keyValueDatabase,
        );

        textInformationParserViewModel = TextInformationParserViewModel(
          keyValueDatabase,
        );

        expect(
          textInformationParserViewModel.parsedText.value,
          SMALL_TEXT_TO_BE_PARSED,
        );

        expect(
          textInformationParserViewModel.textInformation.value.amountOfWords,
          SMALL_TEXT_AMOUNT_OF_WORDS,
        );
        expect(
          textInformationParserViewModel.textInformation.value.length,
          SMALL_TEXT_LENGTH,
        );
      },
    );

    test(
      "Test If Method \"setParsedText\" Updates State And Stores Values",
      () {
        textInformationParserViewModel.setParsedText(SMALL_TEXT_TO_BE_PARSED);

        final parsedTextFromDatabase =
            TextInformationParserDataStore.getTextToBeParsed(keyValueDatabase);

        final textInformationFromDatabase =
            TextInformationParserDataStore.getTextInformation(keyValueDatabase);

        expect(
          textInformationParserViewModel.parsedText.value,
          SMALL_TEXT_TO_BE_PARSED,
        );
        expect(
          textInformationParserViewModel.textInformation.value.amountOfWords,
          SMALL_TEXT_AMOUNT_OF_WORDS,
        );

        expect(parsedTextFromDatabase, SMALL_TEXT_TO_BE_PARSED);
        expect(
          textInformationFromDatabase.amountOfWords,
          SMALL_TEXT_AMOUNT_OF_WORDS,
        );
      },
    );

    test(
      "Test If Method \"reset\" Resets Text And Text Information And Stores Values",
      () {
        TextInformationParserDataStore.setTextToBeParsed(
          SMALL_TEXT_TO_BE_PARSED,
          keyValueDatabase,
        );
        TextInformationParserDataStore.setTextInformation(
          TEXT_INFORMATION_FROM_SMALL_TEXT,
          keyValueDatabase,
        );

        textInformationParserViewModel = TextInformationParserViewModel(
          keyValueDatabase,
        );

        textInformationParserViewModel.reset();

        expect(textInformationParserViewModel.parsedText.value, "");

        expect(
          textInformationParserViewModel.textInformation.value.amountOfWords,
          0,
        );
        expect(textInformationParserViewModel.textInformation.value.length, 0);
      },
    );

    test(
      "Test If Method \"restore\" Restores Deleted Text Information And Stores Values On Key-Value Database",
      () {
        TextInformationParserDataStore.setTextToBeParsed(
          SMALL_TEXT_TO_BE_PARSED,
          keyValueDatabase,
        );
        TextInformationParserDataStore.setTextInformation(
          TEXT_INFORMATION_FROM_SMALL_TEXT,
          keyValueDatabase,
        );

        textInformationParserViewModel = TextInformationParserViewModel(
          keyValueDatabase,
        );

        textInformationParserViewModel.reset();

        textInformationParserViewModel.restore();

        expect(
          textInformationParserViewModel.parsedText.value,
          SMALL_TEXT_TO_BE_PARSED,
        );

        expect(
          textInformationParserViewModel.textInformation.value.amountOfWords,
          TEXT_INFORMATION_FROM_SMALL_TEXT.amountOfWords,
        );
        expect(
          textInformationParserViewModel.textInformation.value.length,
          TEXT_INFORMATION_FROM_SMALL_TEXT.length,
        );
      },
    );

    test("Test If Method \"dismissRecovery\" Deletes Restorable Data", () {
      TextInformationParserDataStore.setTextToBeParsed(
        SMALL_TEXT_TO_BE_PARSED,
        keyValueDatabase,
      );
      TextInformationParserDataStore.setTextInformation(
        TEXT_INFORMATION_FROM_SMALL_TEXT,
        keyValueDatabase,
      );

      textInformationParserViewModel = TextInformationParserViewModel(
        keyValueDatabase,
      );

      textInformationParserViewModel.reset();

      expect(textInformationParserViewModel.parsedText.value, "");

      expect(
        textInformationParserViewModel.textInformation.value.amountOfWords,
        0,
      );
      expect(textInformationParserViewModel.textInformation.value.length, 0);
    });
  });
}
