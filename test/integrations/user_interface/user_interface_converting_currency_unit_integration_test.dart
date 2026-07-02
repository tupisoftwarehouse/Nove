import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart" as material;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/compositions/currency_unit_input.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/data_stores/current_currency_values_data_store.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/screens/currency_unit_converter_screen.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "../../concerns/measure_unit_value_formatter.dart";
import "../../mocks/user_interface/key_value_database_mock.dart";
import "../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"User Interface Converting Currency Unit\" Integration", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
    late CurrencyUnitConverterViewModel currencyUnitConverterViewModel;
    late Router router;

    setUp(() {
      final navigator = NavigatorMock((_, _) {}, (_) {});
      final measureUnitConverter = MeasureUnitConverter<CurrencyUnit>(
        ZEROED_CURRENCY_UNIT,
        [ZEROED_CURRENCY_UNIT],
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

      CurrentCurrencyValuesDataStore.setCurrentCurrencyValues(
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );

      router = Router(navigator);
    });

    testWidgets(
      "Test Converting Currency Unit By \"CurrencyUnitConverter\" On \"UserInterface\"",
      (tester) async {
        final convertedCurrencyUnitValue =
            MeasureUnitValueFormatter.getFormattedValue(
              CURRENCY_UNIT_VALUE,
              UNITED_STATES_DOLLAR_IN_EURO_CONVERSION_FORMULA(
                CURRENCY_UNIT_VALUE,
                CURRENCY_VALUES,
              ),
            );

        await tester.pumpWidget(
          material.MaterialApp(
            home: CurrencyUnitConverterScreen(
              keyValueDatabase: keyValueDatabase,
              getCurrencyUnitConverterViewModel: () async {
                return currencyUnitConverterViewModel;
              },
              router: router,
            ),
          ),
        );

        await tester.pump();

        await tester.tap(
          find.descendant(
            of: find.byType(CurrencyUnitInput),
            matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
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
                of: find.byType(CurrencyUnitInput),
                matching: find.byIcon(Symbols.arrow_back_ios_new_rounded),
              )
              .at(1),
        );

        await tester.pumpAndSettle();

        await tester.ensureVisible(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .EURO_UNIT_LABEL,
          ),
        );

        await tester.tap(
          find.text(
            deviceLanguageStringsViewModel
                .deviceLanguageStrings
                .value
                .EURO_UNIT_LABEL,
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
                of: find.byType(CurrencyUnitInput),
                matching: find.byType(material.TextField),
              )
              .at(0),
          CURRENCY_UNIT_VALUE,
        );

        expect(
          currencyUnitConverterViewModel.listOfCurrencyUnits.value[1].value,
          convertedCurrencyUnitValue,
        );
      },
    );
  });
}
