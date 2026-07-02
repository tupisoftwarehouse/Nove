import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/generic/list_of_measure_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/length_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfLengthUnitInputDataLoadingTransactionScript {
  ListOfLengthUnitInputDataLoadingTransactionScript._();

  static void loadListOfLengthUnitInputData(
    ValueNotifier<List<LengthUnitInput>> listOfLengthUnitInputs,
    LengthUnitConverterViewModel lengthUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataLoadingTransactionScript.loadListOfMeasureUnitInputData(
      listOfLengthUnitInputs,
      lengthUnitConverterViewModel.listOfLengthUnits,
      (lengthUnitInputIndex, controller, focusNode) {
        return LengthUnitInput(
          lengthUnitInputIndex: lengthUnitInputIndex,
          lengthUnitConverterViewModel: lengthUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: controller,
          focusNode: focusNode,
        );
      },
    );
  }
}
