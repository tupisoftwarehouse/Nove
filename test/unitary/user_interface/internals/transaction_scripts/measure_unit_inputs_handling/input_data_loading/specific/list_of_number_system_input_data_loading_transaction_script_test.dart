import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/number_system_converter_constants.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/number_system_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/compositions/number_system_input.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/specific/list_of_number_system_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfNumberSystemInputDataLoadingTransactionScript\" Class", () {
    late ValueNotifier<List<NumberSystemInput>> listOfNumberSystemInputs;
    late NumberSystemConverterViewModel numberSystemConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter = MeasureUnitConverter<NumberSystem>(
        ZEROED_NUMBER_SYSTEM,
        [NUMBER_SYSTEM_TO_CONVERT_TO((_) {})],
        0,
      );
      final numberSystemConverter = NumberSystemConverter(measureUnitConverter);

      WidgetsFlutterBinding.ensureInitialized();

      listOfNumberSystemInputs = ValueNotifier([]);

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();
      numberSystemConverterViewModel = NumberSystemConverterViewModel(
        numberSystemConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If Method \"loadListOfNumberSystemInputData\" Loads The List Of Number System Input Data With View Model",
      () {
        ListOfNumberSystemInputDataLoadingTransactionScript.loadListOfNumberSystemInputData(
          listOfNumberSystemInputs,
          numberSystemConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(
          listOfNumberSystemInputs.value.first.controller.text,
          numberSystemConverterViewModel.listOfNumberSystems.value.first.value,
        );
        expect(
          listOfNumberSystemInputs.value.length,
          numberSystemConverterViewModel.listOfNumberSystems.value.length,
        );
      },
    );
  });
}
