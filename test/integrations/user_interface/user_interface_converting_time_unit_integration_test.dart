import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/time_unit_input.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/time_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_unit_converter_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "../../concerns/measure_unit_value_formatter.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Converting Time Unit\" Integration", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TimeUnitConverterViewModel timeUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<TimeUnit>(
        ZEROED_TIME_UNIT,
        [ZEROED_TIME_UNIT],
        0,
      );
      final timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      timeUnitConverterViewModel = TimeUnitConverterViewModel(
        timeUnitConverter,
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets(
      "Test Converting Time Unit By \"TimeUnitConverter\" On \"UserInterface\"",
      (tester) async {
        final convertedTimeUnitValue =
            MeasureUnitValueFormatter.getFormattedValue(
              TIME_UNIT_VALUE,
              YEAR_IN_DAY_CONVERSION_MULTIPLIER,
            );

        await tester.pumpWidget(
          material.MaterialApp(
            home: TimeUnitConverterScreen(
              timeUnitConverterViewModel: timeUnitConverterViewModel,
              router: router,
            ),
          ),
        );
        await tester.tap(
          find.descendant(
            of: find.byType(TimeUnitInput),
            matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
          ),
        );

        await tester.pumpAndSettle();

        await tester.ensureVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .YEAR_UNIT_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .YEAR_UNIT_LABEL,
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .ADD_BUTTON_TITLE,
          ),
        );

        await tester.pump();

        await tester.tap(
          find
              .descendant(
                of: find.byType(TimeUnitInput),
                matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
              )
              .at(1),
        );

        await tester.pumpAndSettle();

        await tester.ensureVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .DAY_UNIT_ABBREVIATION,
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .DAY_UNIT_ABBREVIATION,
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(
          find
              .descendant(
                of: find.byType(Checkbox),
                matching: find.byType(TapIndicator),
              )
              .at(0),
        );

        await tester.enterText(
          find
              .descendant(
                of: find.byType(TimeUnitInput),
                matching: find.byType(material.TextField),
              )
              .at(0),
          TIME_UNIT_VALUE,
        );

        expect(
          timeUnitConverterViewModel.listOfTimeUnits.value[1].value,
          convertedTimeUnitValue,
        );
      },
    );
  });
}
