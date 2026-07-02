import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/internals/entities/reference_entity.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_loading/currency_unit_converter_view_model_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"CurrencyUnitConverterViewModelLoadingTransactionScript\" Class", () {
    late AbstractKeyValueDatabase keyValueDatabase;
    late CurrencyUnitConverterViewModel currencyUnitConverterViewModel;
    late ReferenceEntity<CurrencyUnitConverterViewModel>
    currencyUnitConverterViewModelReference;
    late ValueNotifier<bool> isCurrentCurrencyValueLoading;
    late ValueNotifier<bool> isCurrentCurrencyValueFetchingFailed;

    setUp(() {
      final measureUnitConverter = MeasureUnitConverter(ZEROED_CURRENCY_UNIT, [
        ZEROED_CURRENCY_UNIT,
      ], 0);
      final currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        CURRENCY_VALUES,
      );

      keyValueDatabase = KeyValueDatabaseMock();

      currencyUnitConverterViewModelReference =
          ReferenceEntity<CurrencyUnitConverterViewModel>();

      isCurrentCurrencyValueLoading = ValueNotifier<bool>(true);
      isCurrentCurrencyValueFetchingFailed = ValueNotifier<bool>(false);

      currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );
    });

    test(
      "Test If Method \"loadCurrencyUnitConverterViewModel\" Loads Currency Unit Converter View Model And Turns \"isCurrentCurrencyValueLoading\" To False After Turning To True And \"isCurrentCurrencyValueFetchingFailed\" To False After Turning To False Initially",
      () async {
        await CurrencyUnitConverterViewModelLoadingTransactionScript.loadCurrencyUnitConverterViewModel(
          isCurrentCurrencyValueLoading,
          isCurrentCurrencyValueFetchingFailed,
          currencyUnitConverterViewModelReference,
          () async {
            return currencyUnitConverterViewModel;
          },
        );

        expect(
          currencyUnitConverterViewModelReference.value,
          isA<CurrencyUnitConverterViewModel>(),
        );
        expect(isCurrentCurrencyValueLoading.value, false);
        expect(isCurrentCurrencyValueFetchingFailed.value, false);
      },
    );

    test(
      "Test If Method \"loadCurrencyUnitConverterViewModel\" Turns \"isCurrentCurrencyValueLoading\" To False After Turning To True And \"isCurrentCurrencyValueFetchingFailed\" To False After Turning To False Initially When View Model Loading Fails",
      () async {
        await CurrencyUnitConverterViewModelLoadingTransactionScript.loadCurrencyUnitConverterViewModel(
          isCurrentCurrencyValueLoading,
          isCurrentCurrencyValueFetchingFailed,
          currencyUnitConverterViewModelReference,
          () async {
            throw Error();
          },
        );

        expect(isCurrentCurrencyValueLoading.value, false);
        expect(isCurrentCurrencyValueFetchingFailed.value, true);
      },
    );
  });
}
