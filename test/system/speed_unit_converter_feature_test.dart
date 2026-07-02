import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/speed_unit_input.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/speed_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "../concerns/measure_unit_value_formatter.dart";
import "../mocks/user_interface/key_value_database_mock.dart";
import "../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"Speed Unit Converter\" Feature", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late SpeedUnitConverterViewModel speedUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        ZEROED_SPEED_UNIT,
        [ZEROED_SPEED_UNIT],
        0,
      );
      final speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      speedUnitConverterViewModel = SpeedUnitConverterViewModel(
        speedUnitConverter,
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets("Test Resetting Speed Unit Converter Data", (tester) async {
      speedUnitConverterViewModel.addSpeedUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 1);
    });

    testWidgets("Test Restoring Speed Unit Converter Data", (tester) async {
      speedUnitConverterViewModel.addSpeedUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 2);
    });

    testWidgets("Test Adding Speed", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
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

      expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 2);
    });

    testWidgets("Test Adding Speed Next", (tester) async {
      speedUnitConverterViewModel.addSpeedUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.descendant(
          of: find.byType(InputActionButton),
          matching: find.byIcon(Symbols.add_rounded),
        ),
      );

      expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 3);
    });

    testWidgets("Test Updating Speed Unit", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.descendant(
          of: find.byType(SpeedUnitInput),
          matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
        ),
      );

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOMETER_PER_HOUR_UNIT_LABEL,
        ),
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOMETER_PER_HOUR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value.first.measureUnit,
        SpeedUnit.KILOMETER_PER_HOUR,
      );
    });

    testWidgets("Test Removing Speed", (tester) async {
      speedUnitConverterViewModel.addSpeedUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.close_rounded));

      expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 1);
    });

    testWidgets("Test Converting Speed Unit", (tester) async {
      final convertedSpeedUnitValue =
          MeasureUnitValueFormatter.getFormattedValue(
            SPEED_UNIT_VALUE,
            KILOMETER_PER_HOUR_IN_METER_PER_SECOND_CONVERSION_MULTIPLIER,
          );

      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.descendant(
          of: find.byType(SpeedUnitInput),
          matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KILOMETER_PER_HOUR_UNIT_LABEL,
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
              of: find.byType(SpeedUnitInput),
              matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
            )
            .at(1),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .METER_PER_SECOND_UNIT_LABEL,
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
              of: find.byType(SpeedUnitInput),
              matching: find.byType(material.TextField),
            )
            .at(0),
        SPEED_UNIT_VALUE,
      );

      expect(
        speedUnitConverterViewModel.listOfSpeedUnits.value[1].value,
        convertedSpeedUnitValue,
      );
    });
  });
}
