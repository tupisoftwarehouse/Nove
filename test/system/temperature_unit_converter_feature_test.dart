import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/temperature_unit_input.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/temperature_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "../concerns/measure_unit_value_formatter.dart";
import "../mocks/user_interface/key_value_database_mock.dart";
import "../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"Temperature Unit Converter\" Feature", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TemperatureUnitConverterViewModel temperatureUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
        ZEROED_TEMPERATURE_UNIT,
        [ZEROED_TEMPERATURE_UNIT],
        0,
      );
      final temperatureUnitConverter = TemperatureUnitConverter(
        measureUnitConverter,
      );

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
        temperatureUnitConverter,
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets("Test Resetting Temperature Unit Converter Data", (
      tester,
    ) async {
      temperatureUnitConverterViewModel.addTemperatureUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: TemperatureUnitConverterScreen(
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      expect(
        temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
        1,
      );
    });

    testWidgets("Test Restoring Temperature Unit Converter Data", (
      tester,
    ) async {
      temperatureUnitConverterViewModel.addTemperatureUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: TemperatureUnitConverterScreen(
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(
        temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
        2,
      );
    });

    testWidgets("Test Adding Temperature", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: TemperatureUnitConverterScreen(
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
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

      expect(
        temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
        2,
      );
    });

    testWidgets("Test Adding Temperature Next", (tester) async {
      temperatureUnitConverterViewModel.addTemperatureUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: TemperatureUnitConverterScreen(
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
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

      expect(
        temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
        3,
      );
    });

    testWidgets("Test Updating Temperature Unit", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: TemperatureUnitConverterScreen(
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.descendant(
          of: find.byType(TemperatureUnitInput),
          matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
        ),
      );

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .FAHRENHEIT_UNIT_LABEL,
        ),
      );

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .FAHRENHEIT_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        temperatureUnitConverterViewModel
            .listOfTemperatureUnits
            .value
            .first
            .measureUnit,
        TemperatureUnit.FAHRENHEIT,
      );
    });

    testWidgets("Test Removing Temperature", (tester) async {
      temperatureUnitConverterViewModel.addTemperatureUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: TemperatureUnitConverterScreen(
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.close_rounded));

      expect(
        temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
        1,
      );
    });

    testWidgets("Test Converting Temperature Unit", (tester) async {
      final convertedTemperatureUnitValue =
          MeasureUnitValueFormatter.getFormattedValue(
            TEMPERATURE_UNIT_VALUE,
            CELSIUS_IN_KELVIN_CONVERSION_FORMULA(TEMPERATURE_UNIT_VALUE),
          );

      await tester.pumpWidget(
        material.MaterialApp(
          home: TemperatureUnitConverterScreen(
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(
        find.descendant(
          of: find.byType(TemperatureUnitInput),
          matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .CELSIUS_UNIT_LABEL,
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
              of: find.byType(TemperatureUnitInput),
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
              .KELVIN_UNIT_LABEL,
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
              of: find.byType(TemperatureUnitInput),
              matching: find.byType(material.TextField),
            )
            .at(0),
        TEMPERATURE_UNIT_VALUE,
      );

      expect(
        temperatureUnitConverterViewModel.listOfTemperatureUnits.value[1].value,
        convertedTemperatureUnitValue,
      );
    });
  });
}
