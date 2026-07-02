import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/time_aggregator_constants.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/user_interface/compositions/time_aggregator_input.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/time_aggregator_input_controller_holder_value_object.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TimeAggregatorInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TimeAggregatorViewModel timeAggregatorViewModel;
    late TimeAggregatorInputControllerHolderValueObject
    timeAggregatorInputControllerHolder;
    late FocusNode hourInputFocusNode;
    late FocusNode minuteInputFocusNode;
    late FocusNode secondInputFocusNode;

    setUp(() {
      final timeAggregator = TimeAggregator([ZEROED_TIME], ZEROED_TIME);
      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      timeAggregatorInputControllerHolder =
          TIME_AGGREGATOR_INPUT_CONTROLLER_HOLDER();

      timeAggregatorViewModel = TimeAggregatorViewModel(
        timeAggregator,
        keyValueDatabase,
      );

      hourInputFocusNode = FocusNode();
      minuteInputFocusNode = FocusNode();
      secondInputFocusNode = FocusNode();
    });

    testWidgets(
      "Test If Composition Shows Remove Time Button If Item Is Not The First Of List Of Aggregated Time",
      (tester) async {
        timeAggregatorViewModel.addTime();

        await tester.pumpWidget(
          MaterialApp(
            home: TimeAggregatorInput(
              time: ZEROED_TIME,
              timeAggregatorInputControllerHolder:
                  timeAggregatorInputControllerHolder,
              timeAggregatorViewModel: timeAggregatorViewModel,
              timeInputControllerIndex: 1,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              hourInputFocusNode: hourInputFocusNode,
              minuteInputFocusNode: minuteInputFocusNode,
              secondInputFocusNode: secondInputFocusNode,
            ),
          ),
        );

        expect(find.byIcon(Symbols.close_rounded), findsOneWidget);
      },
    );

    testWidgets(
      "Test If Remove Time Button Removes Item From List Of Aggregated Time On Tap",
      (tester) async {
        timeAggregatorViewModel.addTime();

        await tester.pumpWidget(
          MaterialApp(
            home: TimeAggregatorInput(
              time: ZEROED_TIME,
              timeAggregatorInputControllerHolder:
                  timeAggregatorInputControllerHolder,
              timeAggregatorViewModel: timeAggregatorViewModel,
              timeInputControllerIndex: 1,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              hourInputFocusNode: hourInputFocusNode,
              minuteInputFocusNode: minuteInputFocusNode,
              secondInputFocusNode: secondInputFocusNode,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(timeAggregatorViewModel.listOfTimes.value.length, 1);
      },
    );

    testWidgets(
      "Test If Hour Input Updates Its Composition In \"timeAggregatorInputControllerHolder\" On Time Inputs Change",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: TimeAggregatorInput(
              time: ZEROED_TIME,
              timeAggregatorInputControllerHolder:
                  timeAggregatorInputControllerHolder,
              timeAggregatorViewModel: timeAggregatorViewModel,
              timeInputControllerIndex: 0,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              hourInputFocusNode: hourInputFocusNode,
              minuteInputFocusNode: minuteInputFocusNode,
              secondInputFocusNode: secondInputFocusNode,
            ),
          ),
        );

        await tester.enterText(
          find.descendant(
            of: find.byKey(HOUR_INPUT_KEY),
            matching: find.byType(TextField),
          ),
          AGGREGATED_TIME.hours.toString(),
        );

        expect(
          timeAggregatorViewModel.listOfTimes.value[0].hours.toString(),
          AGGREGATED_TIME.hours.toString(),
        );

        expect(
          timeAggregatorInputControllerHolder.timeHourInputController.text,
          AGGREGATED_TIME.hours.toString(),
        );
      },
    );

    testWidgets(
      "Test If Minute Input Updates Its Composition In \"timeAggregatorInputControllerHolder\" On Time Inputs Change",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: TimeAggregatorInput(
              time: ZEROED_TIME,
              timeAggregatorInputControllerHolder:
                  timeAggregatorInputControllerHolder,
              timeAggregatorViewModel: timeAggregatorViewModel,
              timeInputControllerIndex: 0,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              hourInputFocusNode: hourInputFocusNode,
              minuteInputFocusNode: minuteInputFocusNode,
              secondInputFocusNode: secondInputFocusNode,
            ),
          ),
        );

        await tester.enterText(
          find.descendant(
            of: find.byKey(MINUTE_INPUT_KEY),
            matching: find.byType(TextField),
          ),
          AGGREGATED_TIME.minutes.toString(),
        );

        expect(
          timeAggregatorViewModel.listOfTimes.value[0].minutes.toString(),
          AGGREGATED_TIME.minutes.toString(),
        );

        expect(
          timeAggregatorInputControllerHolder.timeMinuteInputController.text,
          AGGREGATED_TIME.minutes.toString(),
        );
      },
    );

    testWidgets(
      "Test If Second Input Updates Its Composition In \"timeAggregatorInputControllerHolder\" On Time Inputs Change",
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: TimeAggregatorInput(
              time: ZEROED_TIME,
              timeAggregatorInputControllerHolder:
                  timeAggregatorInputControllerHolder,
              timeAggregatorViewModel: timeAggregatorViewModel,
              timeInputControllerIndex: 0,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              hourInputFocusNode: hourInputFocusNode,
              minuteInputFocusNode: minuteInputFocusNode,
              secondInputFocusNode: secondInputFocusNode,
            ),
          ),
        );

        await tester.enterText(
          find.descendant(
            of: find.byKey(SECOND_INPUT_KEY),
            matching: find.byType(TextField),
          ),
          AGGREGATED_TIME.seconds.toString(),
        );

        expect(
          timeAggregatorViewModel.listOfTimes.value[0].seconds.toString(),
          AGGREGATED_TIME.seconds.toString(),
        );

        expect(
          timeAggregatorInputControllerHolder.timeSecondInputController.text,
          AGGREGATED_TIME.seconds.toString(),
        );
      },
    );

    testWidgets(
      "Test If Composition Shows Add Next Time Button If Item Is Not The Last Of List Of Aggregated Time",
      (tester) async {
        timeAggregatorViewModel.addTime();

        await tester.pumpWidget(
          MaterialApp(
            home: TimeAggregatorInput(
              time: ZEROED_TIME,
              timeAggregatorInputControllerHolder:
                  timeAggregatorInputControllerHolder,
              timeAggregatorViewModel: timeAggregatorViewModel,
              timeInputControllerIndex: 0,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              hourInputFocusNode: hourInputFocusNode,
              minuteInputFocusNode: minuteInputFocusNode,
              secondInputFocusNode: secondInputFocusNode,
            ),
          ),
        );

        expect(find.byIcon(Symbols.add_rounded), findsOneWidget);
      },
    );

    testWidgets(
      "Test If Add Next Time Button Adds Next Item In List Of Aggregated Time On Tap",
      (tester) async {
        timeAggregatorViewModel.addTime();

        await tester.pumpWidget(
          MaterialApp(
            home: TimeAggregatorInput(
              time: ZEROED_TIME,
              timeAggregatorInputControllerHolder:
                  timeAggregatorInputControllerHolder,
              timeAggregatorViewModel: timeAggregatorViewModel,
              timeInputControllerIndex: 0,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              hourInputFocusNode: hourInputFocusNode,
              minuteInputFocusNode: minuteInputFocusNode,
              secondInputFocusNode: secondInputFocusNode,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(timeAggregatorViewModel.listOfTimes.value.length, 3);
      },
    );
  });
}
