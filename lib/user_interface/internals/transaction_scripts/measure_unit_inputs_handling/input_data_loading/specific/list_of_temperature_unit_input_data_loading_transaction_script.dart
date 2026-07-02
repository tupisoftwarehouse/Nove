import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/generic/list_of_measure_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "package:nove/user_interface/compositions/temperature_unit_input.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";

class ListOfTemperatureUnitInputDataLoadingTransactionScript {
  ListOfTemperatureUnitInputDataLoadingTransactionScript._();

  static void loadListOfTemperatureUnitInputData(
    ValueNotifier<List<TemperatureUnitInput>> listOfTemperatureUnitInputs,
    TemperatureUnitConverterViewModel temperatureUnitConverterViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    ListOfMeasureUnitInputDataLoadingTransactionScript.loadListOfMeasureUnitInputData(
      listOfTemperatureUnitInputs,
      temperatureUnitConverterViewModel.listOfTemperatureUnits,
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
