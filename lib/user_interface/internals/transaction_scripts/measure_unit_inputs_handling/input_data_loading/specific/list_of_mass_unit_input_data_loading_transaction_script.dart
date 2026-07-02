import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/generic/list_of_measure_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/mass_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfMassUnitInputDataLoadingTransactionScript {
  ListOfMassUnitInputDataLoadingTransactionScript._();

  static void loadListOfMassUnitInputData(
    ValueNotifier<List<MassUnitInput>> listOfMassUnitInputs,
    MassUnitConverterViewModel massUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataLoadingTransactionScript.loadListOfMeasureUnitInputData(
      listOfMassUnitInputs,
      massUnitConverterViewModel.listOfMassUnits,
      (massUnitInputIndex, controller, focusNode) {
        return MassUnitInput(
          massUnitInputIndex: massUnitInputIndex,
          massUnitConverterViewModel: massUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: controller,
          focusNode: focusNode,
        );
      },
    );
  }
}
