import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/time_calculator_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_calculator_view_model.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Calculating Time\" Integration", () {
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

    testWidgets(
      "Test Calculating Time By \"TimeCalculator\" On \"UserInterface\"",
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
        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).first,
          TIME_TO_BE_CALCULATED.minutes.toString(),
        );
        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).first,
          TIME_TO_BE_CALCULATED.seconds.toString(),
        );

        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).first,
          TIME_TO_BE_CALCULATED.hours.toString(),
        );
        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).first,
          TIME_TO_BE_CALCULATED.minutes.toString(),
        );
        await tester.enterText(
          find.text(ZEROED_TIME_UNIT_VALUE.toString()).first,
          TIME_TO_BE_CALCULATED.seconds.toString(),
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .ADD_BUTTON_TITLE,
          ),
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

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .SUBTRACT_BUTTON_TITLE,
          ),
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
  });
}
