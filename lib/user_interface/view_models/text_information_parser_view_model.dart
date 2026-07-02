import "package:flutter/foundation.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/domain/text_information_parser/text_information_value_object.dart";
import "package:nove/domain/text_information_parser/text_information_parser.dart";
import "package:nove/user_interface/data_stores/text_information_parser_data_store.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_synchronizing/text_information_parser_data/text_information_parser_data_synchronizing_transaction_script.dart";

class TextInformationParserViewModel {
  final AbstractKeyValueDatabase _keyValueDatabase;
  final ValueNotifier<String> parsedText = ValueNotifier<String>("");
  final ValueNotifier<TextInformationValueObject> textInformation =
      ValueNotifier<TextInformationValueObject>(ZEROED_TEXT_INFORMATION);
  String? parsedTextRecovery;
  TextInformationValueObject? textInformationRecovery;

  TextInformationParserViewModel(this._keyValueDatabase) {
    try {
      final storedParsedText = TextInformationParserDataStore.getTextToBeParsed(
        _keyValueDatabase,
      );
      final storedTextInformation =
          TextInformationParserDataStore.getTextInformation(_keyValueDatabase);

      parsedText.value = storedParsedText;
      textInformation.value = storedTextInformation;
    } catch (_) {}
  }

  void setParsedText(String textToBeParsed) {
    final textInformationFromUpdatedTextToBeParsed =
        TextInformationParser.getTextInformation(textToBeParsed);

    TextInformationParserDataSynchronizingTransactionScript.synchronizeTextInformationData(
      textToBeParsed,
      textInformationFromUpdatedTextToBeParsed,
      parsedText,
      textInformation,
      _keyValueDatabase,
    );
  }

  void reset() {
    parsedTextRecovery = parsedText.value;
    textInformationRecovery = textInformation.value;

    TextInformationParserDataSynchronizingTransactionScript.synchronizeTextInformationData(
      "",
      ZEROED_TEXT_INFORMATION,
      parsedText,
      textInformation,
      _keyValueDatabase,
    );
  }

  void restore() {
    parsedText.value = parsedTextRecovery!;
    textInformation.value = textInformationRecovery!;

    TextInformationParserDataSynchronizingTransactionScript.synchronizeTextInformationData(
      parsedTextRecovery!,
      textInformationRecovery!,
      parsedText,
      textInformation,
      _keyValueDatabase,
    );

    parsedTextRecovery = null;
    textInformationRecovery = null;
  }

  void dismissRecovery() {
    parsedTextRecovery = null;
    textInformationRecovery = null;
  }
}
