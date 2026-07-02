import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/internals/concerns/currency_values_mediator.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/currency_unit_input.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/sections/currency_unit_converting_section.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"CurrencyUnitConvertingSection\" Section", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late CurrencyUnitConverterViewModel currencyUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<CurrencyUnit>(
        RESET_CURRENCY_UNIT(),
        [RESET_CURRENCY_UNIT()],
        0,
      );
      final currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        CURRENCY_VALUES,
      );

      keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        CURRENT_CURRENCY_VALUES,
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
          home: CurrencyUnitConvertingSection(
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            currencyUnitConverterViewModel: currencyUnitConverterViewModel,
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
      "Test If Toolbar Reset Button Resets List Of Currencies On Tap",
      (tester) async {
        currencyUnitConverterViewModel.updateCurrencyUnitAt(
          UPDATED_CURRENCY_UNIT((_) {}),
          0,
        );

        await tester.pumpWidget(
          material.MaterialApp(
            home: CurrencyUnitConvertingSection(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        expect(
          tester.widget<Input>(find.byType(Input).first).controller.text,
          ZEROED_CURRENCY_UNIT.value,
        );

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
          1,
        );
      },
    );

    testWidgets(
      "Test If Toolbar Reset Button Is Not Appearing If Currency Unit Converter Is Unchanged",
      (tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: CurrencyUnitConvertingSection(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
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
        currencyUnitConverterViewModel.addCurrencyUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: CurrencyUnitConvertingSection(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.history_2_rounded));

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.settings_backup_restore_rounded));

        await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
          2,
        );
      },
    );

    testWidgets("Test If Snackbar Dismisses Recovery If Time Is Out", (
      tester,
    ) async {
      currencyUnitConverterViewModel.addCurrencyUnit();

      await tester.pumpWidget(
        material.MaterialApp(
          home: CurrencyUnitConvertingSection(
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            currencyUnitConverterViewModel: currencyUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      await tester.tap(find.byIcon(Symbols.history_2_rounded));

      await tester.pumpAndSettle();

      await tester.pump(SNACKBAR_AUTOMATIC_DISMISS_DURATION);

      expect(find.byType(Snackbar), findsNothing);

      try {
        currencyUnitConverterViewModel.restore();
      } catch (error) {
        expect(error, isA<Error>());
      }
    });

    testWidgets(
      "Test If Input Widgets Load View Model Data On Init And Sets List Of Currency Units Change Listener",
      (tester) async {
        final currencyUpdatedAtTimestampPhrase =
            PhraseResolver.getCurrentCurrencyValuesUpdatedAtTimePhrase(
              CURRENT_CURRENCY_VALUES.updatedAt,
              deviceLanguageStringsViewModel.deviceLanguageStrings.value,
            );

        await tester.pumpWidget(
          material.MaterialApp(
            home: CurrencyUnitConvertingSection(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        expect(
          find.byType(CurrencyUnitInput).evaluate().length,
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
        );

        expect(find.text(currencyUpdatedAtTimestampPhrase), findsOneWidget);
      },
    );

    testWidgets("Test If All Are Updated On List Of Currency Units Resized", (
      tester,
    ) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: CurrencyUnitConvertingSection(
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            currencyUnitConverterViewModel: currencyUnitConverterViewModel,
            router: router,
          ),
        ),
      );

      currencyUnitConverterViewModel.addCurrencyUnit();

      await tester.pump();

      expect(find.byType(CurrencyUnitInput).evaluate().length, 2);
    });

    testWidgets(
      "Test If List Currency Unit Inputs Beside Selected Currency Unit Input Are Updated On List Of Currency Units",
      (tester) async {
        currencyUnitConverterViewModel.addCurrencyUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: CurrencyUnitConvertingSection(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.enterText(find.byType(Input).at(0), CURRENCY_UNIT_VALUE);

        await tester.pump();

        expect(
          tester.widget<Input>(find.byType(Input).at(1)).controller.text,
          CURRENCY_UNIT_VALUE,
        );
      },
    );

    testWidgets(
      "Test If All Currency Unit Inputs Are Updated On Base Currency Unit Index Change",
      (tester) async {
        currencyUnitConverterViewModel.addCurrencyUnit();

        await tester.pumpWidget(
          material.MaterialApp(
            home: CurrencyUnitConvertingSection(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        currencyUnitConverterViewModel.updateBaseCurrencyUnitIndex(1);

        await tester.pump();

        expect(
          tester.widget<Checkbox>(find.byType(Checkbox).at(1)).isChecked,
          true,
        );
      },
    );

    testWidgets("Test If Add Button Adds Currency Unit On Tap", (tester) async {
      await tester.pumpWidget(
        material.MaterialApp(
          home: CurrencyUnitConvertingSection(
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            currencyUnitConverterViewModel: currencyUnitConverterViewModel,
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
        currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
        2,
      );
    });

    testWidgets(
      "Test If Converter Currency Value Is Disposed On Section Disposed",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: CurrencyUnitConvertingSection(
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
              router: router,
            ),
          ),
        );

        await tester.pump();

        await tester.pumpWidget(ANOTHER_SCREEN);

        try {
          CurrencyValuesMediator.currencyValues;
        } catch (error) {
          expect(error, isA<TypeError>());
        }
      },
    );
  });
}
