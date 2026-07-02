import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/generic/list_of_measure_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/currency_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfCurrencyUnitInputDataUpdatingTransactionScript {
  ListOfCurrencyUnitInputDataUpdatingTransactionScript._();

  static void updateListOfCurrencyUnitInputData(
    ValueNotifier<List<CurrencyUnitInput>> listOfCurrencyUnitInputs,
    CurrencyUnitConverterViewModel currencyUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataUpdatingTransactionScript.updateListOfMeasureUnitInputData(
      listOfCurrencyUnitInputs,
      currencyUnitConverterViewModel.listOfCurrencyUnits,
      currencyUnitConverterViewModel.baseCurrencyUnitIndex.value,
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
