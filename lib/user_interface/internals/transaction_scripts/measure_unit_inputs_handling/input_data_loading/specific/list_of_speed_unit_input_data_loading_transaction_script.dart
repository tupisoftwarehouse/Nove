import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/generic/list_of_measure_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/speed_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfSpeedUnitInputDataLoadingTransactionScript {
  ListOfSpeedUnitInputDataLoadingTransactionScript._();

  static void loadListOfSpeedUnitInputData(
    ValueNotifier<List<SpeedUnitInput>> listOfSpeedUnitInputs,
    SpeedUnitConverterViewModel speedUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataLoadingTransactionScript.loadListOfMeasureUnitInputData(
      listOfSpeedUnitInputs,
      speedUnitConverterViewModel.listOfSpeedUnits,
      (speedUnitInputIndex, controller, focusNode) {
        return SpeedUnitInput(
          speedUnitInputIndex: speedUnitInputIndex,
          speedUnitConverterViewModel: speedUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: controller,
          focusNode: focusNode,
        );
      },
    );
  }
}
