import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/generic/list_of_measure_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/temperature_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfTemperatureUnitInputDataUpdatingTransactionScript {
  ListOfTemperatureUnitInputDataUpdatingTransactionScript._();

  static void updateListOfTemperatureUnitInputData(
    ValueNotifier<List<TemperatureUnitInput>> listOfTemperatureUnitInputs,
    TemperatureUnitConverterViewModel temperatureUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataUpdatingTransactionScript.updateListOfMeasureUnitInputData(
      listOfTemperatureUnitInputs,
      temperatureUnitConverterViewModel.listOfTemperatureUnits,
      temperatureUnitConverterViewModel.baseTemperatureUnitIndex.value,
      (temperatureUnitInputIndex, controller, focusNode) {
        return TemperatureUnitInput(
          temperatureUnitInputIndex: temperatureUnitInputIndex,
          temperatureUnitConverterViewModel: temperatureUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: controller,
          focusNode: focusNode,
        );
      },
    );
  }
}
