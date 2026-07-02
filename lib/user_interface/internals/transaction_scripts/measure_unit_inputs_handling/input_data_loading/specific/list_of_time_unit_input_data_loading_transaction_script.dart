import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/generic/list_of_measure_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/time_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/time_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfTimeUnitInputDataLoadingTransactionScript {
  ListOfTimeUnitInputDataLoadingTransactionScript._();

  static void loadListOfTimeUnitInputData(
    ValueNotifier<List<TimeUnitInput>> listOfTimeUnitInputs,
    TimeUnitConverterViewModel timeUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataLoadingTransactionScript.loadListOfMeasureUnitInputData(
      listOfTimeUnitInputs,
      timeUnitConverterViewModel.listOfTimeUnits,
      (timeUnitInputIndex, controller, focusNode) {
        return TimeUnitInput(
          timeUnitInputIndex: timeUnitInputIndex,
          timeUnitConverterViewModel: timeUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: controller,
          focusNode: focusNode,
        );
      },
    );
  }
}
