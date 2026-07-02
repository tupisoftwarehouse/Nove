import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/compositions/number_system_input.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/specific/list_of_number_system_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfNumberSystemInputDataUpdatingTransactionScript\" Class", () {
    late ValueNotifier<List<NumberSystemInput>> listOfNumberSystemInputs;
    late NumberSystemConverterViewModel numberSystemConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final numberSystemToBeConvertedImplementation =
          NUMBER_SYSTEM_TO_CONVERT_TO((_) {});
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter =
          MeasureUnitConverter<NumberSystem>(ZEROED_NUMBER_SYSTEM, [
            numberSystemToBeConvertedImplementation,
            numberSystemToBeConvertedImplementation,
          ], 0);
      final numberSystemConverter = NumberSystemConverter(measureUnitConverter);

      WidgetsFlutterBinding.ensureInitialized();

      numberSystemConverterViewModel = NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      listOfNumberSystemInputs = ValueNotifier([
        NumberSystemInput(
          numberSystemInputIndex: 0,
          numberSystemConverterViewModel: numberSystemConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
        NumberSystemInput(
          numberSystemInputIndex: 1,
          numberSystemConverterViewModel: numberSystemConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
      ]);
    });

    test(
      "Test If Method \"updateListOfNumberSystemInputData\" Updates The List Of Number System Input Data With View Model Data And Previous Text Selection But Keep Value Of Base Number System Input",
      () {
        ListOfNumberSystemInputDataUpdatingTransactionScript.updateListOfNumberSystemInputData(
          listOfNumberSystemInputs,
          numberSystemConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(listOfNumberSystemInputs.value.first.controller.text, "");
        expect(
          listOfNumberSystemInputs.value.last.controller.text,
          numberSystemConverterViewModel.listOfNumberSystems.value.last.value,
        );
      },
    );
  });
}
