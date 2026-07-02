import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/entities/reference_entity.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";

class CurrencyUnitConverterViewModelLoadingTransactionScript {
  CurrencyUnitConverterViewModelLoadingTransactionScript._();

  static Future<void> loadCurrencyUnitConverterViewModel(
    ValueNotifier<bool> isCurrentCurrencyValueLoading,
    ValueNotifier<bool> isCurrentCurrencyValueFetchingFailed,
    ReferenceEntity<CurrencyUnitConverterViewModel>
    currencyUnitConverterViewModelReference,
    Future<CurrencyUnitConverterViewModel> Function()
    getCurrencyUnitConverterViewModel,
  ) async {
    isCurrentCurrencyValueLoading.value = true;
    isCurrentCurrencyValueFetchingFailed.value = false;

    try {
      currencyUnitConverterViewModelReference.value =
          await getCurrencyUnitConverterViewModel();

      isCurrentCurrencyValueFetchingFailed.value = false;

      isCurrentCurrencyValueLoading.value = false;
    } catch (_) {
      isCurrentCurrencyValueFetchingFailed.value = true;
    } finally {
      isCurrentCurrencyValueLoading.value = false;
    }
  }
}
