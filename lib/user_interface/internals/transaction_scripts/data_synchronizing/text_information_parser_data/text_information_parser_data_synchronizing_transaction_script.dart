import "package:flutter/widgets.dart";
import "package:nove/domain/text_information_parser/text_information_value_object.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/text_information_parser_data_store.dart";

class TextInformationParserDataSynchronizingTransactionScript {
  TextInformationParserDataSynchronizingTransactionScript._();

  static void synchronizeTextInformationData(
    String updateTextToBeParsed,
    TextInformationValueObject updateTextInformation,
    ValueNotifier<String> textToBeParsedState,
    ValueNotifier<TextInformationValueObject> textInformationState,
    AbstractKeyValueDatabase keyValueDatabase,
  ) {
    TextInformationParserDataStore.setTextToBeParsed(
      updateTextToBeParsed,
      keyValueDatabase,
    );
    TextInformationParserDataStore.setTextInformation(
      updateTextInformation,
      keyValueDatabase,
    );

    textToBeParsedState.value = updateTextToBeParsed;
    textInformationState.value = updateTextInformation;
  }
}
