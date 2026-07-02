import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/text_information_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/data_stores/text_information_parser_data_store.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/text_information_parser_view_model.dart";
import "package:nove/user_interface/screens/text_information_parser_screen.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"TextInformationParserScreen\" Screen", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TextInformationParserViewModel textInformationParserViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      textInformationParserViewModel = TextInformationParserViewModel(
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets("Test If Toolbar Back Button Dispatches Its Events On Tap", (
      tester,
    ) async {
      bool isBackButtonTapped = false;
      final navigator = NavigatorMock((_, _) {}, (_) {
        isBackButtonTapped = true;
      });

      router = Router(navigator);

      await tester.pumpWidget(
        material.MaterialApp(
          home: TextInformationParserScreen(
            textInformationParserViewModel: textInformationParserViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.bySemanticsLabel(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .BACK_BUTTON_ACCESSIBILITY_LABEL,
        ),
      );

      expect(isBackButtonTapped, true);
    });

    testWidgets(
      "Test If Toolbar Reset Button Resets Text Information And Text In Text Area On Tap",
      (tester) async {
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

        final zeroedParsedText =
            TextInformationParserDataStore.getTextToBeParsed(keyValueDatabase);

        final zeroedParsedTextInformation =
            TextInformationParserDataStore.getTextInformation(keyValueDatabase);

        expect(
          tester
              .widget<material.TextField>(find.byType(material.TextField))
              .controller!
              .text,
          "",
        );

        expect(textInformationParserViewModel.parsedText.value, "");

        expect(textInformationParserViewModel.textInformation.value.length, 0);
        expect(
          textInformationParserViewModel.textInformation.value.amountOfWords,
          0,
        );

        expect(zeroedParsedText, "");

        expect(zeroedParsedTextInformation.length, 0);
        expect(zeroedParsedTextInformation.amountOfWords, 0);
      },
    );

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Text Information Parser Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TextInformationParserScreen(
              textInformationParserViewModel: textInformationParserViewModel,
              router: router,
            ),
          ),
        );

        expect(
          tester
              .widget<material.AnimatedScale>(
                find.byType(material.AnimatedScale),
              )
              .scale,
          0,
        );
      },
    );

    testWidgets(
      "Test If Snackbar Recovers Reset Data On Tap And Cancels Snackbar Hiding Timer On Snackbar Is Not Shown",
      (tester) async {
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
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
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

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        textInformationParserViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets("Test If TextArea Widget Loads View Model Data On Init", (
      tester,
    ) async {
      textInformationParserViewModel.setParsedText(SMALL_TEXT_TO_BE_PARSED);

      await tester.pumpWidget(
        material.MaterialApp(
          home: TextInformationParserScreen(
            textInformationParserViewModel: textInformationParserViewModel,
            router: router,
          ),
        ),
      );

      expect(
        tester
            .widget<material.TextField>(find.byType(material.TextField))
            .controller!
            .text,
        SMALL_TEXT_TO_BE_PARSED,
      );
    });

    testWidgets(
      "Test If TextArea Changes Text To Be Parsed And Text Information On Change",
      (tester) async {
        final textInformationBreakdownPhrase =
            PhraseResolver.getTextInformationBreakdownPhrase(
              TEXT_INFORMATION_FROM_SMALL_TEXT,
              deviceLanguageStringsViewModel.deviceLanguageStrings.value,
            );

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

        await tester.pump();

        final parsedText = TextInformationParserDataStore.getTextToBeParsed(
          keyValueDatabase,
        );
        final parsedTextInformation =
            TextInformationParserDataStore.getTextInformation(keyValueDatabase);

        final textAreaWidget = find.byType(material.TextField);

        expect(
          tester.widget<material.TextField>(textAreaWidget).controller!.text,
          SMALL_TEXT_TO_BE_PARSED,
        );

        expect(find.text(textInformationBreakdownPhrase), findsOneWidget);

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

        expect(parsedText, SMALL_TEXT_TO_BE_PARSED);

        expect(parsedTextInformation.length, SMALL_TEXT_LENGTH);
        expect(parsedTextInformation.amountOfWords, SMALL_TEXT_AMOUNT_OF_WORDS);
      },
    );
  });
}
