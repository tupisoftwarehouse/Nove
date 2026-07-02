import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/domain/text_information_parser/text_information_parser.dart";

void main() {
  group("Test \"TextInformationParser\" Class", () {
    test(
      "Test If Method \"getTextInformation\" Returns Text Information From A Given Text",
      () {
        final informationFromText = TextInformationParser.getTextInformation(
          SMALL_TEXT_TO_BE_PARSED,
        );

        expect(informationFromText.amountOfWords, SMALL_TEXT_AMOUNT_OF_WORDS);
        expect(informationFromText.length, SMALL_TEXT_LENGTH);
      },
    );
  });
}
