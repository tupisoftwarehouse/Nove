import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/user_interface/compositions/time_unit_input.dart";
import "package:nove/constants/domains/time_unit_converter_constants.dart";
import "package:nove/domain/time_unit_converter/time_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/specific/list_of_time_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/time_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfTimeUnitInputDataUpdatingTransactionScript\" Class", () {
    late ValueNotifier<List<TimeUnitInput>> listOfTimeUnitInputs;
    late TimeUnitConverterViewModel timeUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final timeUnitToBeConvertedImplementation = TIME_UNIT_TO_CONVERT_TO(
        (_) {},
      );
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter = MeasureUnitConverter<TimeUnit>(
        ZEROED_TIME_UNIT,
        [
          timeUnitToBeConvertedImplementation,
          timeUnitToBeConvertedImplementation,
        ],
        0,
      );
      final timeUnitConverter = TimeUnitConverter(measureUnitConverter);

      WidgetsFlutterBinding.ensureInitialized();

      timeUnitConverterViewModel = TimeUnitConverterViewModel(
        timeUnitConverter,
        keyValueDatabase,
      );

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      listOfTimeUnitInputs = ValueNotifier([
        TimeUnitInput(
          timeUnitInputIndex: 0,
          timeUnitConverterViewModel: timeUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
        TimeUnitInput(
          timeUnitInputIndex: 1,
          timeUnitConverterViewModel: timeUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
      ]);
    });

    test(
      "Test If Method \"updateListOfTimeUnitInputData\" Updates The List Of Time Unit Input Data With View Model Data And Previous Text Selection But Keep Value Of Base Time Unit Input",
      () {
        ListOfTimeUnitInputDataUpdatingTransactionScript.updateListOfTimeUnitInputData(
          listOfTimeUnitInputs,
          timeUnitConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(listOfTimeUnitInputs.value.first.controller.text, "");
        expect(
          listOfTimeUnitInputs.value.last.controller.text,
          timeUnitConverterViewModel.listOfTimeUnits.value.last.value,
        );
      },
    );
  });
}
