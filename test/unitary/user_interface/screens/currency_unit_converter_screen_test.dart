import "package:flutter/material.dart" hide Router;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/data_stores/current_currency_values_data_store.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/screens/currency_unit_converter_screen.dart";
import "package:nove/user_interface/sections/currency_unit_converting_section.dart";
import "package:nove/user_interface/sections/current_currency_values_fetch_retrying_section.dart";
import "package:nove/user_interface/sections/loading_section.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "../../../mocks/user_interface/key_value_database_mock.dart";
import "../../../mocks/user_interface/navigator_mock.dart";

void main() {
  group("Test \"CurrencyUnitConverterScreen\" Screen", () {
    late KeyValueDatabaseMock keyValueDatabase;
    late CurrencyUnitConverterViewModel currencyUnitConverterViewModel;
    late Router router;

    setUpAll(() {});

    setUp(() async {
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

      currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );

      router = Router(navigator);

      CurrentCurrencyValuesDataStore.setCurrentCurrencyValues(
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );
    });

    testWidgets(
      "Test If Loading Section Is Shown When Currency Unit Converter View Model Loading And Dispatches Currency Unit Converter View Model Loading And Passes Forward \"onBackButtonTap\"",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: CurrencyUnitConverterScreen(
              keyValueDatabase: keyValueDatabase,
              getCurrencyUnitConverterViewModel: () async {
                return currencyUnitConverterViewModel;
              },
              router: router,
            ),
          ),
        );

        expect(find.byType(LoadingSection), findsOneWidget);
      },
    );

    testWidgets(
      "Test If Current Currency Values Fetch Retrying Section Is Shown When Currency Unit Converter View Model Loading Fail And Handles Currency Unit Converter View Model Retry On Retry Button Tap And Passes Forward \"onBackButtonTap\"",
      (WidgetTester tester) async {
        int amountOfLoadingTries = 0;

        await tester.pumpWidget(
          MaterialApp(
            home: CurrencyUnitConverterScreen(
              keyValueDatabase: keyValueDatabase,
              getCurrencyUnitConverterViewModel: () async {
                late final bool isLoadingFailed;

                amountOfLoadingTries++;

                isLoadingFailed = amountOfLoadingTries == 2;

                if (isLoadingFailed) {
                  return currencyUnitConverterViewModel;
                } else {
                  throw Error();
                }
              },
              router: router,
            ),
          ),
        );

        await tester.pump();

        expect(
          find.byType(CurrentCurrencyValuesFetchRetryingSection),
          findsOneWidget,
        );

        await tester.tap(find.byIcon(Symbols.refresh_rounded));

        await tester.pump();

        expect(find.byType(CurrencyUnitConvertingSection), findsOneWidget);
      },
    );

    testWidgets(
      "Test If Currency Unit Converting Section Is Shown When Currency Unit Converter View Model Loaded Successfully And Passes Forward \"onBackButtonTap\"",
      (WidgetTester tester) async {
        bool isBackButtonTapped = false;
        final navigator = NavigatorMock((_, _) {}, (_) {
          isBackButtonTapped = true;
        });

        router = Router(navigator);

        await tester.pumpWidget(
          MaterialApp(
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

        await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded).last);

        expect(find.byType(CurrencyUnitConvertingSection), findsOneWidget);

        expect(isBackButtonTapped, true);
      },
    );
  });
}
