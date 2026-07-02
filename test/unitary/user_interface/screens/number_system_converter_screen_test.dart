import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/number_system_input.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/number_system_converter_screen.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"NumberSystemConverterScreen\" Screen", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late NumberSystemConverterViewModel numberSystemConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<NumberSystem>(
        RESET_NUMBER_SYSTEM(),
        [RESET_NUMBER_SYSTEM()],
        0,
      );
      final numberSystemConverter = NumberSystemConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      numberSystemConverterViewModel = NumberSystemConverterViewModel(
        numberSystemConverter,
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
          home: NumberSystemConverterScreen(
            numberSystemConverterViewModel: numberSystemConverterViewModel,
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
      "Test If Toolbar Reset Button Resets List Of Number Systems On Tap",
      (tester) async {
        numberSystemConverterViewModel.updateNumberSystemAt(
          UPDATED_NUMBER_SYSTEM((_) {}),
          0,
        );

        await tester.pumpWidget(
          material.MaterialApp(
            home: NumberSystemConverterScreen(
              numberSystemConverterViewModel: numberSystemConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        expect(
          tester.widget<Input>(find.byType(Input).first).controller.text,
          ZEROED_NUMBER_SYSTEM_VALUE,
        );

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
          1,
        );
      },
    );

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Number System Converter Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: NumberSystemConverterScreen(
              numberSystemConverterViewModel: numberSystemConverterViewModel,
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
        numberSystemConverterViewModel.addNumberSystem();

        await tester.pumpWidget(
          material.MaterialApp(
            home: NumberSystemConverterScreen(
              numberSystemConverterViewModel: numberSystemConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

        await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

        expect(
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
          2,
        );
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
      numberSystemConverterViewModel.addNumberSystem();

      await tester.pumpWidget(
        material.MaterialApp(
          home: NumberSystemConverterScreen(
            numberSystemConverterViewModel: numberSystemConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        numberSystemConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets(
      "Test If Input Widgets Load View Model Data On Init And Sets List Of Number Systems Change Listener",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: NumberSystemConverterScreen(
              numberSystemConverterViewModel: numberSystemConverterViewModel,
              router: router,
            ),
          ),
        );

        expect(
          find.byType(NumberSystemInput).evaluate().length,
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
        );
      },
    );

    testWidgets("Test If All Are Updated On List Of Number Systems Resized", (
      tester,
    ) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: NumberSystemConverterScreen(
            numberSystemConverterViewModel: numberSystemConverterViewModel,
            router: router,
          ),
        ),
      );

      numberSystemConverterViewModel.addNumberSystem();

      await tester.pump();

      expect(find.byType(NumberSystemInput).evaluate().length, 2);
    });

    testWidgets(
      "Test If List Number System Inputs Beside Selected Number System Input Are Updated On List Of Number Systems",
      (tester) async {
        numberSystemConverterViewModel.addNumberSystem();

        await tester.pumpWidget(
          material.MaterialApp(
            home: NumberSystemConverterScreen(
              numberSystemConverterViewModel: numberSystemConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(find.byType(Input).at(0), NUMBER_SYSTEM_VALUE);

        await tester.pump();

        expect(
          tester.widget<Input>(find.byType(Input).at(1)).controller.text,
          NUMBER_SYSTEM_VALUE,
        );
      },
    );

    testWidgets(
      "Test If All Number System Inputs Are Updated On Base Number System Index Change",
      (tester) async {
        numberSystemConverterViewModel.addNumberSystem();

        await tester.pumpWidget(
          material.MaterialApp(
            home: NumberSystemConverterScreen(
              numberSystemConverterViewModel: numberSystemConverterViewModel,
              router: router,
            ),
          ),
        );

        numberSystemConverterViewModel.updateBaseNumberSystemIndex(1);

        await tester.pump();

        expect(
          tester.widget<Checkbox>(find.byType(Checkbox).at(1)).isChecked,
          true,
        );
      },
    );

    testWidgets("Test If Add Button Adds Number System On Tap", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: NumberSystemConverterScreen(
            numberSystemConverterViewModel: numberSystemConverterViewModel,
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
        numberSystemConverterViewModel.listOfNumberSystems.value.length,
        2,
      );
    });
  });
}
