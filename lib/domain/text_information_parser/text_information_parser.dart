import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/domain/text_information_parser/text_information_value_object.dart";

class TextInformationParser {
  TextInformationParser._();

  static TextInformationValueObject getTextInformation(String textToBeParsed) {
    final listOfWordsFoundFromText = WORDS_WITH_NO_SYMBOL_OR_NUMBER
        .allMatches(textToBeParsed)
        .toList();

    return TextInformationValueObject(
      listOfWordsFoundFromText.length,
      textToBeParsed.length,
    );
  }
}
