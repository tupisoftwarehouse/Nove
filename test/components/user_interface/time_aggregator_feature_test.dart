import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/time_aggregator_constants.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/time_aggregator_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"Time Aggregator\" Feature", () {
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

    testWidgets("Test Resetting Time Aggregator Data", (tester) async {
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

    testWidgets("Test Restoring Time Aggregator Data", (tester) async {
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
    });

    testWidgets("Test Adding Time", (tester) async {
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

    testWidgets("Test Adding Time Next", (tester) async {
      timeAggregatorViewModel.addTime();

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
              .ADD_TIME_NEXT_BUTTON_ACCESSIBILITY_LABEL,
        ),
      );

      expect(timeAggregatorViewModel.listOfTimes.value.length, 3);
    });

    testWidgets("Test Removing Time", (tester) async {
      timeAggregatorViewModel.addTime();

      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeAggregatorScreen(
            timeAggregatorViewModel: timeAggregatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.close_rounded));

      expect(timeAggregatorViewModel.listOfTimes.value.length, 1);
    });

    testWidgets("Test Aggregating Time", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: TimeAggregatorScreen(
            timeAggregatorViewModel: timeAggregatorViewModel,
            router: router,
          ),
        ),
      );

      await tester.enterText(
        find.descendant(
          of: find.byKey(HOUR_INPUT_KEY),
          matching: find.byType(material.TextField),
        ),
        TIME_TO_BE_AGGREGATED.hours.toString(),
      );
      await tester.enterText(
        find.descendant(
          of: find.byKey(MINUTE_INPUT_KEY),
          matching: find.byType(material.TextField),
        ),
        TIME_TO_BE_AGGREGATED.minutes.toString(),
      );
      await tester.enterText(
        find.descendant(
          of: find.byKey(SECOND_INPUT_KEY),
          matching: find.byType(material.TextField),
        ),
        TIME_TO_BE_AGGREGATED.seconds.toString(),
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

      await tester.enterText(
        find
            .descendant(
              of: find.byKey(HOUR_INPUT_KEY),
              matching: find.byType(material.TextField),
            )
            .at(1),
        TIME_TO_BE_AGGREGATED.hours.toString(),
      );
      await tester.enterText(
        find
            .descendant(
              of: find.byKey(MINUTE_INPUT_KEY),
              matching: find.byType(material.TextField),
            )
            .at(1),
        TIME_TO_BE_AGGREGATED.minutes.toString(),
      );
      await tester.enterText(
        find
            .descendant(
              of: find.byKey(SECOND_INPUT_KEY),
              matching: find.byType(material.TextField),
            )
            .at(1),
        TIME_TO_BE_AGGREGATED.seconds.toString(),
      );

      expect(
        timeAggregatorViewModel.aggregatedTime.value.hours,
        AGGREGATED_TIME.hours,
      );
      expect(
        timeAggregatorViewModel.aggregatedTime.value.minutes,
        AGGREGATED_TIME.minutes,
      );
      expect(
        timeAggregatorViewModel.aggregatedTime.value.seconds,
        AGGREGATED_TIME.seconds,
      );
    });
  });
}
