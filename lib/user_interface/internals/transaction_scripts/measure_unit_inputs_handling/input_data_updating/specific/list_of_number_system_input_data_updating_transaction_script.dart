import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/generic/list_of_measure_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "package:nove/user_interface/compositions/number_system_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfNumberSystemInputDataUpdatingTransactionScript {
  ListOfNumberSystemInputDataUpdatingTransactionScript._();

  static void updateListOfNumberSystemInputData(
    ValueNotifier<List<NumberSystemInput>> listOfNumberSystemInputs,
    NumberSystemConverterViewModel numberSystemConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataUpdatingTransactionScript.updateListOfMeasureUnitInputData(
      listOfNumberSystemInputs,
      numberSystemConverterViewModel.listOfNumberSystems,
      numberSystemConverterViewModel.baseNumberSystemIndex.value,
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
