import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/length_unit_input.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/length_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"LengthUnitConverterScreen\" Screen", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late LengthUnitConverterViewModel lengthUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        RESET_LENGTH_UNIT(),
        [RESET_LENGTH_UNIT()],
        0,
      );
      final lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      lengthUnitConverterViewModel = LengthUnitConverterViewModel(
        lengthUnitConverter,
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
          home: LengthUnitConverterScreen(
            lengthUnitConverterViewModel: lengthUnitConverterViewModel,
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

    testWidgets("Test If Toolbar Reset Button Resets List Of Lengths On Tap", (
      tester,
    ) async {
      lengthUnitConverterViewModel.updateLengthUnitAt(
        UPDATED_LENGTH_UNIT((_) {}),
        0,
      );

      await tester.pumpWidget(
        material.MaterialApp(
          home: LengthUnitConverterScreen(
            lengthUnitConverterViewModel: lengthUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      expect(
        tester.widget<Input>(find.byType(Input).first).controller.text,
        ZEROED_LENGTH_UNIT_VALUE,
      );

      expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 1);
    });

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Length Unit Converter Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: LengthUnitConverterScreen(
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
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
        lengthUnitConverterViewModel.addLengthUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: LengthUnitConverterScreen(
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

        await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

        expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 2);
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
      lengthUnitConverterViewModel.addLengthUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: LengthUnitConverterScreen(
            lengthUnitConverterViewModel: lengthUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        lengthUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets(
      "Test If Input Widgets Load View Model Data On Init And Sets List Of Length Units Change Listener",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: LengthUnitConverterScreen(
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        expect(
          find.byType(LengthUnitInput).evaluate().length,
          lengthUnitConverterViewModel.listOfLengthUnits.value.length,
        );
      },
    );

    testWidgets("Test If All Are Updated On List Of Length Units Resized", (
      tester,
    ) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: LengthUnitConverterScreen(
            lengthUnitConverterViewModel: lengthUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      lengthUnitConverterViewModel.addLengthUnit();

      await tester.pump();

      expect(find.byType(LengthUnitInput).evaluate().length, 2);
    });

    testWidgets(
      "Test If List Length Unit Inputs Beside Selected Length Unit Input Are Updated On List Of Length Units",
      (tester) async {
        lengthUnitConverterViewModel.addLengthUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: LengthUnitConverterScreen(
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(find.byType(Input).at(0), LENGTH_UNIT_VALUE);

        await tester.pump();

        expect(
          tester.widget<Input>(find.byType(Input).at(1)).controller.text,
          LENGTH_UNIT_VALUE,
        );
      },
    );

    testWidgets(
      "Test If All Length Unit Inputs Are Updated On Base Length Unit Index Change",
      (tester) async {
        lengthUnitConverterViewModel.addLengthUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: LengthUnitConverterScreen(
              lengthUnitConverterViewModel: lengthUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        lengthUnitConverterViewModel.updateBaseLengthUnitIndex(1);

        await tester.pump();

        expect(
          tester.widget<Checkbox>(find.byType(Checkbox).at(1)).isChecked,
          true,
        );
      },
    );

    testWidgets("Test If Add Button Adds Length Unit On Tap", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: LengthUnitConverterScreen(
            lengthUnitConverterViewModel: lengthUnitConverterViewModel,
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

      expect(lengthUnitConverterViewModel.listOfLengthUnits.value.length, 2);
    });
  });
}
