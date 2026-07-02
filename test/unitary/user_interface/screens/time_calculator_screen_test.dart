import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/time_calculator_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_calculator_view_model.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"TimeCalculatorScreen\" Screen", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TimeCalculatorViewModel timeCalculatorViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      timeCalculatorViewModel = TimeCalculatorViewModel(keyValueDatabase);

      timeCalculatorViewModel.firstTimeToBeCalculated.value = ZEROED_TIME;
      timeCalculatorViewModel.secondTimeToBeCalculated.value = ZEROED_TIME;

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
          home: TimeCalculatorScreen(
            timeCalculatorViewModel: timeCalculatorViewModel,
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
      "Test If Toolbar Reset Button Resets Calculated Time Data On Tap",
      (tester) async {
        timeCalculatorViewModel.firstTimeToBeCalculated.value =
            TIME_TO_BE_CALCULATED;
        timeCalculatorViewModel.secondTimeToBeCalculated.value =
            TIME_TO_BE_CALCULATED;

        timeCalculatorViewModel.addTime();

        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        await tester.pumpAndSettle();

        expect(
          (tester.widget(find.byType(Input).at(0)) as Input).controller.text,
          ZEROED_TIME.hours.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(1)) as Input).controller.text,
          ZEROED_TIME.minutes.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(2)) as Input).controller.text,
          ZEROED_TIME.seconds.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(3)) as Input).controller.text,
          ZEROED_TIME.hours.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(4)) as Input).controller.text,
          ZEROED_TIME.minutes.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(5)) as Input).controller.text,
          ZEROED_TIME.seconds.toString(),
        );

        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.hours,
          ZEROED_TIME.hours,
        );
        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.minutes,
          ZEROED_TIME.minutes,
        );
        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.seconds,
          ZEROED_TIME.seconds,
        );

        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.hours,
          ZEROED_TIME.hours,
        );
        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.minutes,
          ZEROED_TIME.minutes,
        );
        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.seconds,
          ZEROED_TIME.seconds,
        );

        expect(
          timeCalculatorViewModel.calculatedTime.value.hours,
          ZEROED_TIME.hours,
        );
        expect(
          timeCalculatorViewModel.calculatedTime.value.minutes,
          ZEROED_TIME.minutes,
        );
        expect(
          timeCalculatorViewModel.calculatedTime.value.seconds,
          ZEROED_TIME.seconds,
        );
      },
    );

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Time Calculator Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
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
        timeCalculatorViewModel.firstTimeToBeCalculated.value =
            TIME_TO_BE_CALCULATED;
        timeCalculatorViewModel.secondTimeToBeCalculated.value =
            TIME_TO_BE_CALCULATED;

        timeCalculatorViewModel.addTime();

        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

        await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

        expect(
          (tester.widget(find.byType(Input).at(0)) as Input).controller.text,
          TIME_TO_BE_CALCULATED.hours.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(1)) as Input).controller.text,
          TIME_TO_BE_CALCULATED.minutes.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(2)) as Input).controller.text,
          TIME_TO_BE_CALCULATED.seconds.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(3)) as Input).controller.text,
          TIME_TO_BE_CALCULATED.hours.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(4)) as Input).controller.text,
          TIME_TO_BE_CALCULATED.minutes.toString(),
        );
        expect(
          (tester.widget(find.byType(Input).at(5)) as Input).controller.text,
          TIME_TO_BE_CALCULATED.seconds.toString(),
        );

        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );

        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );

        expect(
          timeCalculatorViewModel.calculatedTime.value.hours,
          CALCULATED_TIME.hours,
        );
        expect(
          timeCalculatorViewModel.calculatedTime.value.minutes,
          CALCULATED_TIME.minutes,
        );
        expect(
          timeCalculatorViewModel.calculatedTime.value.seconds,
          CALCULATED_TIME.seconds,
        );
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
      timeCalculatorViewModel.firstTimeToBeCalculated.value =
          TIME_TO_BE_CALCULATED;
      timeCalculatorViewModel.secondTimeToBeCalculated.value =
          TIME_TO_BE_CALCULATED;

      timeCalculatorViewModel.addTime();

      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeCalculatorScreen(
            timeCalculatorViewModel: timeCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        timeCalculatorViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets("Test If Input Widgets Load View Model Data On Init", (
      tester,
    ) async {
      final calculatedTimeResultPhrase =
          PhraseResolver.getCalculatedTimeResultPhrase(
            CALCULATED_TIME,
            deviceLanguageStringsViewModel.deviceLanguageStrings.value,
          );

      timeCalculatorViewModel.firstTimeToBeCalculated.value =
          TIME_TO_BE_CALCULATED;
      timeCalculatorViewModel.secondTimeToBeCalculated.value =
          TIME_TO_BE_CALCULATED;

      timeCalculatorViewModel.addTime();

      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeCalculatorScreen(
            timeCalculatorViewModel: timeCalculatorViewModel,
            router: router,
          ),
        ),
      );

      expect(
        (tester.widget(find.byType(Input).at(0)) as Input).controller.text,
        TIME_TO_BE_CALCULATED.hours.toString(),
      );
      expect(
        (tester.widget(find.byType(Input).at(1)) as Input).controller.text,
        TIME_TO_BE_CALCULATED.minutes.toString(),
      );
      expect(
        (tester.widget(find.byType(Input).at(2)) as Input).controller.text,
        TIME_TO_BE_CALCULATED.seconds.toString(),
      );
      expect(
        (tester.widget(find.byType(Input).at(3)) as Input).controller.text,
        TIME_TO_BE_CALCULATED.hours.toString(),
      );
      expect(
        (tester.widget(find.byType(Input).at(4)) as Input).controller.text,
        TIME_TO_BE_CALCULATED.minutes.toString(),
      );
      expect(
        (tester.widget(find.byType(Input).at(5)) as Input).controller.text,
        TIME_TO_BE_CALCULATED.seconds.toString(),
      );

      expect(find.text(calculatedTimeResultPhrase), findsOneWidget);
    });

    testWidgets(
      "Test If First Time Hours Input Updates First Time Hours On Change",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).first,
          TIME_TO_BE_CALCULATED.hours.toString(),
        );

        await tester.pump();

        expect(
          find.text(TIME_TO_BE_CALCULATED.hours.toString()),
          findsOneWidget,
        );

        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
      },
    );

    testWidgets(
      "Test If First Time Minutes Input Updates First Time Minutes On Change",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).at(1),
          TIME_TO_BE_CALCULATED.minutes.toString(),
        );

        await tester.pump();

        expect(
          find.text(TIME_TO_BE_CALCULATED.minutes.toString()),
          findsOneWidget,
        );

        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
      },
    );

    testWidgets(
      "Test If First Time Seconds Input Updates First Time Seconds On Change",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).at(2),
          TIME_TO_BE_CALCULATED.seconds.toString(),
        );

        await tester.pump();

        expect(
          find.text(TIME_TO_BE_CALCULATED.seconds.toString()),
          findsOneWidget,
        );

        expect(
          timeCalculatorViewModel.firstTimeToBeCalculated.value.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );
      },
    );

    testWidgets(
      "Test If Second Time Hours Input Updates Second Time Hours On Change",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).at(3),
          TIME_TO_BE_CALCULATED.hours.toString(),
        );

        await tester.pump();

        expect(
          find.text(TIME_TO_BE_CALCULATED.hours.toString()),
          findsOneWidget,
        );

        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.hours,
          TIME_TO_BE_CALCULATED.hours,
        );
      },
    );

    testWidgets(
      "Test If Second Time Minutes Input Updates Second Time Minutes On Change",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).at(4),
          TIME_TO_BE_CALCULATED.minutes.toString(),
        );

        await tester.pump();

        expect(
          find.text(TIME_TO_BE_CALCULATED.minutes.toString()),
          findsOneWidget,
        );

        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.minutes,
          TIME_TO_BE_CALCULATED.minutes,
        );
      },
    );

    testWidgets(
      "Test If Second Time Seconds Input Updates Second Time Seconds On Change",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeCalculatorScreen(
              timeCalculatorViewModel: timeCalculatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).at(5),
          TIME_TO_BE_CALCULATED.seconds.toString(),
        );

        await tester.pump();

        expect(
          find.text(TIME_TO_BE_CALCULATED.seconds.toString()),
          findsOneWidget,
        );

        expect(
          timeCalculatorViewModel.secondTimeToBeCalculated.value.seconds,
          TIME_TO_BE_CALCULATED.seconds,
        );
      },
    );

    testWidgets("Test If Add Button Adds Time On Tap", (tester) async {
      final calculatedTimeResultPhrase =
          PhraseResolver.getCalculatedTimeResultPhrase(
            CALCULATED_TIME,
            deviceLanguageStringsViewModel.deviceLanguageStrings.value,
          );

      timeCalculatorViewModel.firstTimeToBeCalculated.value =
          TIME_TO_BE_CALCULATED;
      timeCalculatorViewModel.secondTimeToBeCalculated.value =
          TIME_TO_BE_CALCULATED;

      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeCalculatorScreen(
            timeCalculatorViewModel: timeCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .ADD_BUTTON_TITLE,
        ),
      );

      await tester.pump();

      expect(find.text(calculatedTimeResultPhrase), findsOneWidget);

      expect(
        timeCalculatorViewModel.calculatedTime.value.hours,
        CALCULATED_TIME.hours,
      );
      expect(
        timeCalculatorViewModel.calculatedTime.value.minutes,
        CALCULATED_TIME.minutes,
      );
      expect(
        timeCalculatorViewModel.calculatedTime.value.seconds,
        CALCULATED_TIME.seconds,
      );
    });

    testWidgets("Test If Subtract Button Subtracts Time On Tap", (
      tester,
    ) async {
      final calculatedTimeResultPhrase =
          PhraseResolver.getCalculatedTimeResultPhrase(
            ZEROED_TIME,
            deviceLanguageStringsViewModel.deviceLanguageStrings.value,
          );

      timeCalculatorViewModel.firstTimeToBeCalculated.value =
          TIME_TO_BE_CALCULATED;
      timeCalculatorViewModel.secondTimeToBeCalculated.value =
          TIME_TO_BE_CALCULATED;

      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeCalculatorScreen(
            timeCalculatorViewModel: timeCalculatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SUBTRACT_BUTTON_TITLE,
        ),
      );

      await tester.pump();

      expect(find.text(calculatedTimeResultPhrase), findsOneWidget);

      expect(
        timeCalculatorViewModel.calculatedTime.value.hours,
        ZEROED_TIME.hours,
      );
      expect(
        timeCalculatorViewModel.calculatedTime.value.minutes,
        ZEROED_TIME.minutes,
      );
      expect(
        timeCalculatorViewModel.calculatedTime.value.seconds,
        ZEROED_TIME.seconds,
      );
    });
  });
}
