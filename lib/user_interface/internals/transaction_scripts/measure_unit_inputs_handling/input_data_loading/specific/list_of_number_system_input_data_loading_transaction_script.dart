import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/generic/list_of_measure_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "package:nove/user_interface/compositions/number_system_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfNumberSystemInputDataLoadingTransactionScript {
  ListOfNumberSystemInputDataLoadingTransactionScript._();

  static void loadListOfNumberSystemInputData(
    ValueNotifier<List<NumberSystemInput>> listOfNumberSystemInputs,
    NumberSystemConverterViewModel numberSystemConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataLoadingTransactionScript.loadListOfMeasureUnitInputData(
      listOfNumberSystemInputs,
      numberSystemConverterViewModel.listOfNumberSystems,
      (numberSystemInputIndex, controller, focusNode) {
        return NumberSystemInput(
          numberSystemInputIndex: numberSystemInputIndex,
          numberSystemConverterViewModel: numberSystemConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: controller,
          focusNode: focusNode,
        );
      },
    );
  }
}
