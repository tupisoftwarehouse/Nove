import "package:nove/dependency_injection/key_value_database_factory.dart";
import "package:nove/user_interface/view_models/text_information_parser_view_model.dart";

class TextInformationParserViewModelFactory {
  TextInformationParserViewModelFactory._();

  static TextInformationParserViewModel getInstance() {
    final keyValueDatabase = KeyValueDatabaseFactory.getInstance();

    return TextInformationParserViewModel(keyValueDatabase);
  }
}
