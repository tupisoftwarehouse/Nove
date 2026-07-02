import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/temperature_unit_input.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/temperature_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"TemperatureUnitConverterScreen\" Screen", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late TemperatureUnitConverterViewModel temperatureUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<TemperatureUnit>(
        RESET_TEMPERATURE_UNIT(),
        [RESET_TEMPERATURE_UNIT()],
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
          home: TemperatureUnitConverterScreen(
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
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
      "Test If Toolbar Reset Button Resets List Of Temperatures On Tap",
      (tester) async {
        temperatureUnitConverterViewModel.updateTemperatureUnitAt(
          UPDATED_TEMPERATURE_UNIT((_) {}),
          0,
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

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        expect(
          tester.widget<Input>(find.byType(Input).first).controller.text,
          ZEROED_TEMPERATURE_UNIT_VALUE,
        );

        expect(
          temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
          1,
        );
      },
    );

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Temperature Unit Converter Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TemperatureUnitConverterScreen(
              temperatureUnitConverterViewModel:
                  temperatureUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        expect(
          tester
              .widget<material.AnimatedScale>(
                find.byType(material.AnimatedScale).last,
              )
              .scale,
          0,
        );
      },
    );

    testWidgets(
      "Test If Snackbar Recovers Reset Data On Tap And Cancels Snackbar Hiding Timer On Snackbar Is Not Shown",
      (tester) async {
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
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
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

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        temperatureUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets(
      "Test If Input Widgets Load View Model Data On Init And Sets List Of Temperature Units Change Listener",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TemperatureUnitConverterScreen(
              temperatureUnitConverterViewModel:
                  temperatureUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        expect(
          find.byType(TemperatureUnitInput).evaluate().length,
          temperatureUnitConverterViewModel.listOfTemperatureUnits.value.length,
        );
      },
    );

    testWidgets(
      "Test If All Are Updated On List Of Temperature Units Resized",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: TemperatureUnitConverterScreen(
              temperatureUnitConverterViewModel:
                  temperatureUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        temperatureUnitConverterViewModel.addTemperatureUnit();

        await tester.pump();

        expect(find.byType(TemperatureUnitInput).evaluate().length, 2);
      },
    );

    testWidgets(
      "Test If List Temperature Unit Inputs Beside Selected Temperature Unit Input Are Updated On List Of Temperature Units",
      (tester) async {
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

        await tester.enterText(
          find.byType(Input).at(0),
          TEMPERATURE_UNIT_VALUE,
        );

        await tester.pump();

        expect(
          tester.widget<Input>(find.byType(Input).at(1)).controller.text,
          TEMPERATURE_UNIT_VALUE,
        );
      },
    );

    testWidgets(
      "Test If All Temperature Unit Inputs Are Updated On Base Temperature Unit Index Change",
      (tester) async {
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

        temperatureUnitConverterViewModel.updateBaseTemperatureUnitIndex(1);

        await tester.pump();

        expect(
          tester.widget<Checkbox>(find.byType(Checkbox).at(1)).isChecked,
          true,
        );
      },
    );

    testWidgets("Test If Add Button Adds Temperature Unit On Tap", (
      tester,
    ) async {
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
  });
}
