import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/text_information_parser/text_information_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";

class TextInformationParserDataStore {
  TextInformationParserDataStore._();

  static String getTextToBeParsed(AbstractKeyValueDatabase keyValueDatabase) {
    return keyValueDatabase.getItem<String>(TEXT_TO_BE_PARSED_KEY, (
      marshalledData,
    ) {
      return marshalledData;
    });
  }

  static void setTextToBeParsed(
    String updatedTextToBeParsed,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(TEXT_TO_BE_PARSED_KEY, () {
      return updatedTextToBeParsed;
    });
  }

  static TextInformationValueObject getTextInformation(
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    return keyValueDatabase.getItem<TextInformationValueObject>(
      TEXT_INFORMATION_KEY,
      (marshalledData) {
        return TextInformationValueObject.fromMarshalledData(marshalledData);
      },
    );
  }

  static void setTextInformation(
    TextInformationValueObject updatedTextInformation,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    keyValueDatabase.setItem(TEXT_INFORMATION_KEY, () {
      return updatedTextInformation.marshalledData;
    });
  }
}
