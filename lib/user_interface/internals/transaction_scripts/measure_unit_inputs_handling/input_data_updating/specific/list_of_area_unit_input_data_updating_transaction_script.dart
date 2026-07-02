import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/generic/list_of_measure_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/area_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfAreaUnitInputDataUpdatingTransactionScript {
  ListOfAreaUnitInputDataUpdatingTransactionScript._();

  static void updateListOfAreaUnitInputData(
    ValueNotifier<List<AreaUnitInput>> listOfAreaUnitInputs,
    AreaUnitConverterViewModel areaUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataUpdatingTransactionScript.updateListOfMeasureUnitInputData(
      listOfAreaUnitInputs,
      areaUnitConverterViewModel.listOfAreaUnits,
      areaUnitConverterViewModel.baseAreaUnitIndex.value,
      (areaUnitInputIndex, controller, focusNode) {
        return AreaUnitInput(
          areaUnitInputIndex: areaUnitInputIndex,
          areaUnitConverterViewModel: areaUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: controller,
          focusNode: focusNode,
        );
      },
    );
  }
}
