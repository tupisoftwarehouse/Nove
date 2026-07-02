import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/generic/list_of_measure_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/length_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfLengthUnitInputDataUpdatingTransactionScript {
  ListOfLengthUnitInputDataUpdatingTransactionScript._();

  static void updateListOfLengthUnitInputData(
    ValueNotifier<List<LengthUnitInput>> listOfLengthUnitInputs,
    LengthUnitConverterViewModel lengthUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataUpdatingTransactionScript.updateListOfMeasureUnitInputData(
      listOfLengthUnitInputs,
      lengthUnitConverterViewModel.listOfLengthUnits,
      lengthUnitConverterViewModel.baseLengthUnitIndex.value,
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
