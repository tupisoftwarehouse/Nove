import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/time_aggregator_constants.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/time_aggregator_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"TimeAggregatorScreen\" Screen", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TimeAggregatorViewModel timeAggregatorViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final timeAggregator = TimeAggregator([ZEROED_TIME], ZEROED_TIME);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      timeAggregatorViewModel = TimeAggregatorViewModel(
        timeAggregator,
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
          home: TimeAggregatorScreen(
            timeAggregatorViewModel: timeAggregatorViewModel,
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

    testWidgets("Test If Toolbar Reset Button Resets List Of Times On Tap", (
      tester,
    ) async {
      timeAggregatorViewModel.updateTime(AGGREGATED_TIME, 0);

      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeAggregatorScreen(
            timeAggregatorViewModel: timeAggregatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      expect(
        timeAggregatorViewModel.listOfTimes.value[0].hours,
        ZEROED_TIME.hours,
      );
      expect(
        timeAggregatorViewModel.listOfTimes.value[0].minutes,
        ZEROED_TIME.minutes,
      );
      expect(
        timeAggregatorViewModel.listOfTimes.value[0].seconds,
        ZEROED_TIME.seconds,
      );

      expect(
        tester
            .widget<material.TextField>(find.byType(material.TextField).at(0))
            .controller!
            .text,
        ZEROED_TIME.hours.toString(),
      );
      expect(
        tester
            .widget<material.TextField>(find.byType(material.TextField).at(1))
            .controller!
            .text,
        ZEROED_TIME.minutes.toString(),
      );
      expect(
        tester
            .widget<material.TextField>(find.byType(material.TextField).at(2))
            .controller!
            .text,
        ZEROED_TIME.seconds.toString(),
      );

      expect(
        timeAggregatorViewModel.aggregatedTime.value.hours,
        ZEROED_TIME.hours,
      );
      expect(
        timeAggregatorViewModel.aggregatedTime.value.minutes,
        ZEROED_TIME.minutes,
      );
      expect(
        timeAggregatorViewModel.aggregatedTime.value.seconds,
        ZEROED_TIME.seconds,
      );
    });

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Time Aggregator Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeAggregatorScreen(
              timeAggregatorViewModel: timeAggregatorViewModel,
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
        timeAggregatorViewModel.addTime();

        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeAggregatorScreen(
              timeAggregatorViewModel: timeAggregatorViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

        await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

        expect(timeAggregatorViewModel.listOfTimes.value.length, 2);
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
      timeAggregatorViewModel.addTime();

      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeAggregatorScreen(
            timeAggregatorViewModel: timeAggregatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        timeAggregatorViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets(
      "Test If Input Widgets Load View Model Data On Init And Sets List Of Times Change Listener",
      (tester) async {
        final aggregatedTimeResultPhrase =
            PhraseResolver.getAggregatedTimeResultPhrase(
              AGGREGATED_TIME,
              deviceLanguageStringsViewModel.deviceLanguageStrings.value,
            );

        timeAggregatorViewModel.updateTime(AGGREGATED_TIME, 0);

        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeAggregatorScreen(
              timeAggregatorViewModel: timeAggregatorViewModel,
              router: router,
            ),
          ),
        );

        expect(
          tester
              .widget<material.TextField>(
                find.descendant(
                  of: find.byKey(HOUR_INPUT_KEY),
                  matching: find.byType(material.TextField),
                ),
              )
              .controller!
              .text,
          AGGREGATED_TIME.hours.toString(),
        );
        expect(
          tester
              .widget<material.TextField>(
                find.descendant(
                  of: find.byKey(MINUTE_INPUT_KEY),
                  matching: find.byType(material.TextField),
                ),
              )
              .controller!
              .text,
          AGGREGATED_TIME.minutes.toString(),
        );
        expect(
          tester
              .widget<material.TextField>(
                find.descendant(
                  of: find.byKey(SECOND_INPUT_KEY),
                  matching: find.byType(material.TextField),
                ),
              )
              .controller!
              .text,
          AGGREGATED_TIME.seconds.toString(),
        );

        expect(find.text(aggregatedTimeResultPhrase), findsOneWidget);
      },
    );

    testWidgets(
      "Test If List Aggregated Time Inputs Are Updated On List Of Aggregated Times Resized",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeAggregatorScreen(
              timeAggregatorViewModel: timeAggregatorViewModel,
              router: router,
            ),
          ),
        );

        timeAggregatorViewModel.addTime();

        await tester.pump();

        expect(
          tester
              .widget<material.TextField>(
                find
                    .descendant(
                      of: find.byKey(HOUR_INPUT_KEY),
                      matching: find.byType(material.TextField),
                    )
                    .at(1),
              )
              .controller!
              .text,
          ZEROED_TIME.hours.toString(),
        );
        expect(
          tester
              .widget<material.TextField>(
                find
                    .descendant(
                      of: find.byKey(MINUTE_INPUT_KEY),
                      matching: find.byType(material.TextField),
                    )
                    .at(1),
              )
              .controller!
              .text,
          ZEROED_TIME.minutes.toString(),
        );
        expect(
          tester
              .widget<material.TextField>(
                find
                    .descendant(
                      of: find.byKey(SECOND_INPUT_KEY),
                      matching: find.byType(material.TextField),
                    )
                    .at(1),
              )
              .controller!
              .text,
          ZEROED_TIME.seconds.toString(),
        );
      },
    );

    testWidgets("Test If Add Button Adds Time On Tap", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeAggregatorScreen(
            timeAggregatorViewModel: timeAggregatorViewModel,
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

      expect(timeAggregatorViewModel.listOfTimes.value.length, 2);
    });
  });
}
