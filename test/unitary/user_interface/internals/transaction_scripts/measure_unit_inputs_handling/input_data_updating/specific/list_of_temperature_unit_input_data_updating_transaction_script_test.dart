import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/user_interface/compositions/temperature_unit_input.dart";
import "package:nove/constants/domains/temperature_unit_converter_constants.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/specific/list_of_temperature_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group(
    "Test \"ListOfTemperatureUnitInputDataUpdatingTransactionScript\" Class",
    () {
      late ValueNotifier<List<TemperatureUnitInput>>
      listOfTemperatureUnitInputs;
      late TemperatureUnitConverterViewModel temperatureUnitConverterViewModel;
      late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

      setUpAll(() {
        final temperatureUnitToBeConvertedImplementation =
            TEMPERATURE_UNIT_TO_CONVERT_TO((_) {});
        final keyValueDatabase = KeyValueDatabaseMock();
        final measureUnitConverter =
            MeasureUnitConverter<TemperatureUnit>(ZEROED_TEMPERATURE_UNIT, [
              temperatureUnitToBeConvertedImplementation,
              temperatureUnitToBeConvertedImplementation,
            ], 0);
        final temperatureUnitConverter = TemperatureUnitConverter(
          measureUnitConverter,
        );

        WidgetsFlutterBinding.ensureInitialized();

        temperatureUnitConverterViewModel = TemperatureUnitConverterViewModel(
          temperatureUnitConverter,
          keyValueDatabase,
        );

        deviceLanguageStringsViewModel =
            DeviceLanguageStringsViewModelFactory.getInstance();

        listOfTemperatureUnitInputs = ValueNotifier([
          TemperatureUnitInput(
            temperatureUnitInputIndex: 0,
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          TemperatureUnitInput(
            temperatureUnitInputIndex: 1,
            temperatureUnitConverterViewModel:
                temperatureUnitConverterViewModel,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
        ]);
      });

      test(
        "Test If Method \"updateListOfTemperatureUnitInputData\" Updates The List Of Temperature Unit Input Data With View Model Data And Previous Text Selection But Keep Value Of Base Temperature Unit Input",
        () {
          ListOfTemperatureUnitInputDataUpdatingTransactionScript.updateListOfTemperatureUnitInputData(
            listOfTemperatureUnitInputs,
            temperatureUnitConverterViewModel,
            deviceLanguageStringsViewModel,
          );

          expect(listOfTemperatureUnitInputs.value.first.controller.text, "");
          expect(
            listOfTemperatureUnitInputs.value.last.controller.text,
            temperatureUnitConverterViewModel
                .listOfTemperatureUnits
                .value
                .last
                .value,
          );
        },
      );
    },
  );
}
