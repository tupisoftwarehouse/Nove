import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/view_models/text_information_parser_view_model.dart";
import "package:nove/user_interface/screens/text_information_parser_screen.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"Text Information Parser\" Feature", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late TextInformationParserViewModel textInformationParserViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});

      keyValueDatabase = KeyValueDatabaseMock();

      textInformationParserViewModel = TextInformationParserViewModel(
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets("Test Resetting Text Information Data", (tester) async {
      textInformationParserViewModel.setParsedText(SMALL_TEXT_TO_BE_PARSED);

      await tester.pumpWidget(
        material.MaterialApp(
          home: TextInformationParserScreen(
            textInformationParserViewModel: textInformationParserViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      expect(textInformationParserViewModel.parsedText.value, "");

      expect(textInformationParserViewModel.textInformation.value.length, 0);
      expect(
        textInformationParserViewModel.textInformation.value.amountOfWords,
        0,
      );
    });

    testWidgets("Test Restoring Reset Text Information Data", (tester) async {
      textInformationParserViewModel.setParsedText(SMALL_TEXT_TO_BE_PARSED);

      await tester.pumpWidget(
        material.MaterialApp(
          home: TextInformationParserScreen(
            textInformationParserViewModel: textInformationParserViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

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
    });

    testWidgets("Test Parsing Text Information", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: TextInformationParserScreen(
            textInformationParserViewModel: textInformationParserViewModel,
            router: router,
          ),
        ),
      );

      await tester.enterText(
        find.byType(material.TextField),
        SMALL_TEXT_TO_BE_PARSED,
      );

      expect(
        textInformationParserViewModel.parsedText.value,
        SMALL_TEXT_TO_BE_PARSED,
      );

      expect(
        textInformationParserViewModel.textInformation.value.length,
        SMALL_TEXT_LENGTH,
      );
      expect(
        textInformationParserViewModel.textInformation.value.amountOfWords,
        SMALL_TEXT_AMOUNT_OF_WORDS,
      );
    });
  });
}
