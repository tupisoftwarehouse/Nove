import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/area_unit_input.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/area_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"AreaUnitConverterScreen\" Screen", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late AreaUnitConverterViewModel areaUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        RESET_AREA_UNIT(),
        [RESET_AREA_UNIT()],
        0,
      );
      final areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      areaUnitConverterViewModel = AreaUnitConverterViewModel(
        areaUnitConverter,
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
          home: AreaUnitConverterScreen(
            areaUnitConverterViewModel: areaUnitConverterViewModel,
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

    testWidgets("Test If Toolbar Reset Button Resets List Of Times On Tap", (
      tester,
    ) async {
      areaUnitConverterViewModel.updateAreaUnitAt(UPDATED_AREA_UNIT((_) {}), 0);

      await tester.pumpWidget(
        material.MaterialApp(
          home: AreaUnitConverterScreen(
            areaUnitConverterViewModel: areaUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      expect(
        tester.widget<Input>(find.byType(Input).first).controller.text,
        ZEROED_AREA_UNIT_VALUE,
      );

      expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 1);
    });

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Area Unit Converter Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: AreaUnitConverterScreen(
              areaUnitConverterViewModel: areaUnitConverterViewModel,
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
        areaUnitConverterViewModel.addAreaUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: AreaUnitConverterScreen(
              areaUnitConverterViewModel: areaUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

        await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

        expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 2);
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
      areaUnitConverterViewModel.addAreaUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: AreaUnitConverterScreen(
            areaUnitConverterViewModel: areaUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        areaUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets(
      "Test If Input Widgets Load View Model Data On Init And Sets List Of Area Units Change Listener",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: AreaUnitConverterScreen(
              areaUnitConverterViewModel: areaUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        expect(
          find.byType(AreaUnitInput).evaluate().length,
          areaUnitConverterViewModel.listOfAreaUnits.value.length,
        );
      },
    );

    testWidgets("Test If All Are Updated Ons List Of Area Units Resized", (
      tester,
    ) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: AreaUnitConverterScreen(
            areaUnitConverterViewModel: areaUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      areaUnitConverterViewModel.addAreaUnit();

      await tester.pump();

      expect(find.byType(AreaUnitInput).evaluate().length, 2);
    });

    testWidgets(
      "Test If List Area Unit Inputs Beside Selected Area Unit Input Are Updated On List Of Area Units",
      (tester) async {
        areaUnitConverterViewModel.addAreaUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: AreaUnitConverterScreen(
              areaUnitConverterViewModel: areaUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(find.byType(Input).at(0), AREA_UNIT_VALUE);

        await tester.pump();

        expect(
          tester.widget<Input>(find.byType(Input).at(1)).controller.text,
          AREA_UNIT_VALUE,
        );
      },
    );

    testWidgets(
      "Test If All Area Unit Inputs Are Updated On Base Area Unit Index Change",
      (tester) async {
        areaUnitConverterViewModel.addAreaUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: AreaUnitConverterScreen(
              areaUnitConverterViewModel: areaUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        areaUnitConverterViewModel.updateBaseAreaUnitIndex(1);

        await tester.pump();

        expect(
          tester.widget<Checkbox>(find.byType(Checkbox).at(1)).isChecked,
          true,
        );
      },
    );

    testWidgets("Test If Add Button Adds Area Unit On Tap", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: AreaUnitConverterScreen(
            areaUnitConverterViewModel: areaUnitConverterViewModel,
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

      expect(areaUnitConverterViewModel.listOfAreaUnits.value.length, 2);
    });
  });
}
