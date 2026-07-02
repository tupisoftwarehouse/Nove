import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/generic/list_of_measure_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/currency_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfCurrencyUnitInputDataLoadingTransactionScript {
  ListOfCurrencyUnitInputDataLoadingTransactionScript._();

  static void loadListOfCurrencyUnitInputData(
    ValueNotifier<List<CurrencyUnitInput>> listOfCurrencyUnitInputs,
    CurrencyUnitConverterViewModel currencyUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataLoadingTransactionScript.loadListOfMeasureUnitInputData(
      listOfCurrencyUnitInputs,
      currencyUnitConverterViewModel.listOfCurrencyUnits,
      (currencyUnitInputIndex, controller, focusNode) {
        return CurrencyUnitInput(
          currencyUnitInputIndex: currencyUnitInputIndex,
          currencyUnitConverterViewModel: currencyUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: controller,
          focusNode: focusNode,
        );
      },
    );
  }
}
