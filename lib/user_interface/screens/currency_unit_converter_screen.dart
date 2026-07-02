import "package:flutter/widgets.dart" hide Router;
import "package:nove/user_interface/internals/adapters/key_value_database/abstract_key_value_database.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/entities/reference_entity.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_loading/currency_unit_converter_view_model_loading_transaction_script.dart";
import "package:nove/user_interface/sections/currency_unit_converting_section.dart";
import "package:nove/user_interface/sections/current_currency_values_fetch_retrying_section.dart";
import "package:nove/user_interface/sections/loading_section.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class CurrencyUnitConverterScreen extends StatefulWidget {
  final AbstractKeyValueDatabase keyValueDatabase;
  final Router router;
  final Future<CurrencyUnitConverterViewModel> Function()
  getCurrencyUnitConverterViewModel;

  const CurrencyUnitConverterScreen({
    super.key,
    required this.keyValueDatabase,
    required this.router,
    required this.getCurrencyUnitConverterViewModel,
  });

  @override
  State<StatefulWidget> createState() {
    return _CurrencyUnitConverterScreenState();
  }
}

class _CurrencyUnitConverterScreenState
    extends State<CurrencyUnitConverterScreen> {
  late final ReferenceEntity<CurrencyUnitConverterViewModel>
  _currencyUnitConverterViewModelReference;
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final ValueNotifier<bool> _isCurrentCurrencyValueLoading;
  late final ValueNotifier<bool> _isCurrentCurrencyValueFetchingFailed;

  @override
  void initState() {
    super.initState();

    _currencyUnitConverterViewModelReference = ReferenceEntity();

    _deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();

    _isCurrentCurrencyValueLoading = ValueNotifier<bool>(true);
    _isCurrentCurrencyValueFetchingFailed = ValueNotifier<bool>(false);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await CurrencyUnitConverterViewModelLoadingTransactionScript.loadCurrencyUnitConverterViewModel(
        _isCurrentCurrencyValueLoading,
        _isCurrentCurrencyValueFetchingFailed,
        _currencyUnitConverterViewModelReference,
        widget.getCurrencyUnitConverterViewModel,
      );
    });
  }

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: _isCurrentCurrencyValueLoading,
      builder: (_, isCurrentCurrencyValueLoading, _) {
        return ValueListenableBuilder(
          valueListenable: _isCurrentCurrencyValueFetchingFailed,
          builder: (_, isCurrentCurrencyValueFetchingFailed, _) {
            if (isCurrentCurrencyValueLoading) {
              return LoadingSection(
                deviceLanguageStringsViewModel: _deviceLanguageStringsViewModel,
                router: widget.router,
              );
            } else if (isCurrentCurrencyValueFetchingFailed) {
              return CurrentCurrencyValuesFetchRetryingSection(
                deviceLanguageStringsViewModel: _deviceLanguageStringsViewModel,
                router: widget.router,
                onTap: () async {
                  await CurrencyUnitConverterViewModelLoadingTransactionScript.loadCurrencyUnitConverterViewModel(
                    _isCurrentCurrencyValueLoading,
                    _isCurrentCurrencyValueFetchingFailed,
                    _currencyUnitConverterViewModelReference,
                    widget.getCurrencyUnitConverterViewModel,
                  );
                },
              );
            } else {
              return CurrencyUnitConvertingSection(
                deviceLanguageStringsViewModel: _deviceLanguageStringsViewModel,
                currencyUnitConverterViewModel:
                    _currencyUnitConverterViewModelReference.value,
                router: widget.router,
              );
            }
          },
        );
      },
    );
  }
}
