import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/user_interface/compositions/speed_unit_input.dart";
import "package:nove/constants/domains/speed_unit_converter_constants.dart";
import "package:nove/domain/speed_unit_converter/speed_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/specific/list_of_speed_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfSpeedUnitInputDataUpdatingTransactionScript\" Class", () {
    late ValueNotifier<List<SpeedUnitInput>> listOfSpeedUnitInputs;
    late SpeedUnitConverterViewModel speedUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final speedUnitToBeConvertedImplementation = SPEED_UNIT_TO_CONVERT_TO(
        (_) {},
      );
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter =
          MeasureUnitConverter<SpeedUnit>(ZEROED_SPEED_UNIT, [
            speedUnitToBeConvertedImplementation,
            speedUnitToBeConvertedImplementation,
          ], 0);
      final speedUnitConverter = SpeedUnitConverter(measureUnitConverter);

      WidgetsFlutterBinding.ensureInitialized();

      speedUnitConverterViewModel = SpeedUnitConverterViewModel(
        speedUnitConverter,
        keyValueDatabase,
      );

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      listOfSpeedUnitInputs = ValueNotifier([
        SpeedUnitInput(
          speedUnitInputIndex: 0,
          speedUnitConverterViewModel: speedUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
        SpeedUnitInput(
          speedUnitInputIndex: 1,
          speedUnitConverterViewModel: speedUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
      ]);
    });

    test(
      "Test If Method \"updateListOfSpeedUnitInputData\" Updates The List Of Speed Unit Input Data With View Model Data And Previous Text Selection But Keep Value Of Base Speed Unit Input",
      () {
        ListOfSpeedUnitInputDataUpdatingTransactionScript.updateListOfSpeedUnitInputData(
          listOfSpeedUnitInputs,
          speedUnitConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(listOfSpeedUnitInputs.value.first.controller.text, "");
        expect(
          listOfSpeedUnitInputs.value.last.controller.text,
          speedUnitConverterViewModel.listOfSpeedUnits.value.last.value,
        );
      },
    );
  });
}
