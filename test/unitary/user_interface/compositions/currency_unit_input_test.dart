import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_entity.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/compositions/currency_unit_input.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CurrencyUnitInput\" Composition", () {
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late CurrencyUnitConverterViewModel currencyUnitConverterViewModel;
    late TextEditingController controller;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(
        ZEROED_CURRENCY_UNIT as CurrencyUnitEntity,
        [ZEROED_CURRENCY_UNIT as CurrencyUnitEntity],
        0,
      );
      final currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        CURRENCY_VALUES,
      );

      final keyValueDatabase = KeyValueDatabaseMock();

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );

      controller = TextEditingController();
    });

    testWidgets(
      "Test If Composition Shows Remove Unit Button If Item Is Not The First Of List Of Currency Units",
      (tester) async {
        currencyUnitConverterViewModel.addCurrencyUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: CurrencyUnitInput(
              currencyUnitInputIndex: 1,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
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
      "Test If Remove Unit Button Removes Item From List Of Currency Units On Tap",
      (tester) async {
        currencyUnitConverterViewModel.addCurrencyUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: CurrencyUnitInput(
              currencyUnitInputIndex: 1,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.close_rounded));

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
          1,
        );
      },
    );

    testWidgets("Test If Dropdown Menu Changes Measure Unit Of Item On Tap", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CurrencyUnitInput(
            currencyUnitInputIndex: 0,
            currencyUnitConverterViewModel: currencyUnitConverterViewModel,
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
              .UNITED_STATES_DOLLAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .UNITED_STATES_DOLLAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        currencyUnitConverterViewModel
            .listOfCurrencyUnits
            .value
            .first
            .measureUnit,
        CurrencyUnit.UNITED_STATES_DOLLAR,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .UNITED_KINGDOM_POUND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .UNITED_KINGDOM_POUND_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        currencyUnitConverterViewModel
            .listOfCurrencyUnits
            .value
            .first
            .measureUnit,
        CurrencyUnit.UNITED_KINGDOM_POUND,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SWITZERLAND_FRANC_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .SWITZERLAND_FRANC_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        currencyUnitConverterViewModel
            .listOfCurrencyUnits
            .value
            .first
            .measureUnit,
        CurrencyUnit.SWITZERLAND_FRANC,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .AUSTRALIA_DOLLAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .AUSTRALIA_DOLLAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        currencyUnitConverterViewModel
            .listOfCurrencyUnits
            .value
            .first
            .measureUnit,
        CurrencyUnit.AUSTRALIA_DOLLAR,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .BRAZIL_REAL_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .BRAZIL_REAL_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        currencyUnitConverterViewModel
            .listOfCurrencyUnits
            .value
            .first
            .measureUnit,
        CurrencyUnit.BRAZIL_REAL,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .CANADA_DOLLAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .CANADA_DOLLAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        currencyUnitConverterViewModel
            .listOfCurrencyUnits
            .value
            .first
            .measureUnit,
        CurrencyUnit.CANADA_DOLLAR,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .NEW_ZEALAND_DOLLAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .NEW_ZEALAND_DOLLAR_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        currencyUnitConverterViewModel
            .listOfCurrencyUnits
            .value
            .first
            .measureUnit,
        CurrencyUnit.NEW_ZEALAND_DOLLAR,
      );

      await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

      await tester.pumpAndSettle();

      await tester.ensureVisible(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .EURO_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.text(
          deviceLanguageStringsViewModel
              .deviceLanguageStrings
              .value
              .EURO_UNIT_LABEL,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        currencyUnitConverterViewModel
            .listOfCurrencyUnits
            .value
            .first
            .measureUnit,
        CurrencyUnit.EURO,
      );
    });

    testWidgets("Test If Input Updates Its Composition On Change", (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CurrencyUnitInput(
            currencyUnitInputIndex: 0,
            currencyUnitConverterViewModel: currencyUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: controller,
            focusNode: FOCUS_NODE,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), CURRENCY_UNIT_VALUE);

      expect(controller.text, CURRENCY_UNIT_VALUE);
    });

    testWidgets(
      "Test If Composition Shows Add Unit Button If Item Is Not The First Of List Of Currency Units",
      (tester) async {
        currencyUnitConverterViewModel.addCurrencyUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: CurrencyUnitInput(
              currencyUnitInputIndex: 0,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
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
      "Test If Add Unit Button Adds Item From List Of Currency Units On Tap",
      (tester) async {
        currencyUnitConverterViewModel.addCurrencyUnit();

        await tester.pumpWidget(
          MaterialApp(
            home: CurrencyUnitInput(
              currencyUnitInputIndex: 0,
              currencyUnitConverterViewModel: currencyUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: FOCUS_NODE,
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.add_rounded));

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
          3,
        );
      },
    );
  });
}
