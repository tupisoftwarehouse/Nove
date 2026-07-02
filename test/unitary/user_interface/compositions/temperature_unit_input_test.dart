import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/temperature_unit_input.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"TemperatureUnitInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TemperatureUnitConverterViewModel temperatureUnitConverterViewModel;
    late TextEditingController controller;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(
        ZEROED_TEMPERATURE_UNIT as TemperatureUnitEntity,
        [ZEROED_TEMPERATURE_UNIT as TemperatureUnitEntity],
        0,
      );
      final temperatureUnitConverter = TemperatureUnitConverter(
        measureUnitConverter,
      );

      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
        temperatureUnitConverter,
        keyValueDatabase,
      );

      controller = TextEditingController();
    });

    testWidgets(
      "Test If Composition Shows Remove Unit Button If Item Is Not The First Of List Of Temperature Units",
      (tester) async {
        temperatureUnitConverterViewModel.addTemperatureUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: TemperatureUnitInput(
              temperatureUnitInputIndex: 1,
              temperatureUnitConverterViewModel:
                  temperatureUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        expect(find.byIcon(Symbols.close_rounded), findsOneWidget);
      },
    );

    testWidgets(
      "Test If Remove Unit Button Removes Item From List Of Temperature Units On Tap",
      (tester) async {
        temperatureUnitConverterViewModel.addTemperatureUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: TemperatureUnitInput(
              temperatureUnitInputIndex: 1,
              temperatureUnitConverterViewModel:
                  temperatureUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(
          temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
          1,
        );
      },
    );

    testWidgets("Test If Dropdown Menu Changes Measure Unit Of Item On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TemperatureUnitInput(
            temperatureUnitInputIndex: 0,
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
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
              .CELSIUS_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        temperatureUnitConverterViewModel
            .listOfTemperatureUnits
            .value
            .first
            .measureUnit,
        TemperatureUnit.CELSIUS,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .FAHRENHEIT_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

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

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .KELVIN_UNIT_LABEL,
        ),
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

      expect(
        temperatureUnitConverterViewModel
            .listOfTemperatureUnits
            .value
            .first
            .measureUnit,
        TemperatureUnit.KELVIN,
      );
    });

    testWidgets("Test If Input Updates It sComposition On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TemperatureUnitInput(
            temperatureUnitInputIndex: 0,
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), TEMPERATURE_UNIT_VALUE);

      expect(controller.text, TEMPERATURE_UNIT_VALUE);
    });

    testWidgets(
      "Test If Composition Shows Add Unit Button If Item Is Not The First Of List Of Temperature Units",
      (tester) async {
        temperatureUnitConverterViewModel.addTemperatureUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: TemperatureUnitInput(
              temperatureUnitInputIndex: 0,
              temperatureUnitConverterViewModel:
                  temperatureUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        expect(find.byIcon(Symbols.add_rounded), findsOneWidget);
      },
    );

    testWidgets(
      "Test If Add Unit Button Adds Item From List Of Temperature Units On Tap",
      (tester) async {
        temperatureUnitConverterViewModel.addTemperatureUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: TemperatureUnitInput(
              temperatureUnitInputIndex: 0,
              temperatureUnitConverterViewModel:
                  temperatureUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(
          temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
          3,
        );
      },
    );
  });
}
