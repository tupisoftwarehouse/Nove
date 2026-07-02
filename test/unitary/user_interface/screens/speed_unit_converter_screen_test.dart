import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/speed_unit_input.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/speed_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"SpeedUnitConverterScreen\" Screen", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late SpeedUnitConverterViewModel speedUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<SpeedUnit>(
        RESET_SPEED_UNIT(),
        [RESET_SPEED_UNIT()],
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
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
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

    testWidgets("Test If Toolbar Reset Button Resets List Of Speeds On Tap", (
      tester,
    ) async {
      speedUnitConverterViewModel.updateSpeedUnitAt(
        UPDATED_SPEED_UNIT((_) {}),
        0,
      );

      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      expect(
        tester.widget<Input>(find.byType(Input).first).controller.text,
        ZEROED_SPEED_UNIT_VALUE,
      );

      expect(speedUnitConverterViewModel.listOfSpeedUnits.value.length, 1);
    });

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Speed Unit Converter Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: SpeedUnitConverterScreen(
              speedUnitConverterViewModel: speedUnitConverterViewModel,
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
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
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

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        speedUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets(
      "Test If Input Widgets Load View Model Data On Init And Sets List Of Speed Units Change Listener",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: SpeedUnitConverterScreen(
              speedUnitConverterViewModel: speedUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        expect(
          find.byType(SpeedUnitInput).evaluate().length,
          speedUnitConverterViewModel.listOfSpeedUnits.value.length,
        );
      },
    );

    testWidgets("Test If All Are Updated Ons List Of Speed Units Resized", (
      tester,
    ) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: SpeedUnitConverterScreen(
            speedUnitConverterViewModel: speedUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      speedUnitConverterViewModel.addSpeedUnit();

      await tester.pump();

      expect(find.byType(SpeedUnitInput).evaluate().length, 2);
    });

    testWidgets(
      "Test If List Speed Unit Inputs Beside Selected Speed Unit Input Are Updated On List Of Speed Units",
      (tester) async {
        speedUnitConverterViewModel.addSpeedUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: SpeedUnitConverterScreen(
              speedUnitConverterViewModel: speedUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(find.byType(Input).at(0), SPEED_UNIT_VALUE);

        await tester.pump();

        expect(
          tester.widget<Input>(find.byType(Input).at(1)).controller.text,
          SPEED_UNIT_VALUE,
        );
      },
    );

    testWidgets(
      "Test If All Speed Unit Inputs Are Updated On Base Speed Unit Index Change",
      (tester) async {
        speedUnitConverterViewModel.addSpeedUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: SpeedUnitConverterScreen(
              speedUnitConverterViewModel: speedUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        speedUnitConverterViewModel.updateBaseSpeedUnitIndex(1);

        await tester.pump();

        expect(
          tester.widget<Checkbox>(find.byType(Checkbox).at(1)).isChecked,
          true,
        );
      },
    );

    testWidgets("Test If Add Button Adds Speed Unit On Tap", (tester) async {
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
  });
}
