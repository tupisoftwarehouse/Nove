import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/generic/list_of_measure_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/mass_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfMassUnitInputDataUpdatingTransactionScript {
  ListOfMassUnitInputDataUpdatingTransactionScript._();

  static void updateListOfMassUnitInputData(
    ValueNotifier<List<MassUnitInput>> listOfMassUnitInputs,
    MassUnitConverterViewModel massUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataUpdatingTransactionScript.updateListOfMeasureUnitInputData(
      listOfMassUnitInputs,
      massUnitConverterViewModel.listOfMassUnits,
      massUnitConverterViewModel.baseMassUnitIndex.value,
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
