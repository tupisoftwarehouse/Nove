import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/dependency_injection/text_information_parser_view_model_factory.dart";
import "package:nove/user_interface/view_models/text_information_parser_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TextInformationParserViewModelFactory\" Class", () {
    late TextInformationParserViewModel instance;

    setUpAll(() {
      KeyValueDatabaseFactory.instance = KeyValueDatabaseMock();
    });
    test(
      "Test If Method \"getInstance\" Returns \"TextInformationParserViewModel\" With Stored Data From Key-Value Database",
      () {
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[TEXT_TO_BE_PARSED_KEY] =
            SMALL_TEXT_TO_BE_PARSED;
        (KeyValueDatabaseFactory.instance as KeyValueDatabaseMock)
                .mapOfItems[TEXT_INFORMATION_KEY] =
            MARSHALLED_TEXT_INFORMATION_FROM_SMALL_TEXT;

        instance = TextInformationParserViewModelFactory.getInstance();

        expect(instance.parsedText.value, SMALL_TEXT_TO_BE_PARSED);
        expect(
          instance.textInformation.value.amountOfWords,
          SMALL_TEXT_AMOUNT_OF_WORDS,
        );
        expect(instance.textInformation.value.length, SMALL_TEXT_LENGTH);
      },
    );
  });
}
