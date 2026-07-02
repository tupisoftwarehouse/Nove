import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/length_unit_converter_constants.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/length_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/compositions/length_unit_input.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/specific/list_of_length_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfLengthUnitInputDataLoadingTransactionScript\" Class", () {
    late ValueNotifier<List<LengthUnitInput>> listOfLengthUnitInputs;
    late LengthUnitConverterViewModel lengthUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter = MeasureUnitConverter<LengthUnit>(
        ZEROED_LENGTH_UNIT,
        [LENGTH_UNIT_TO_CONVERT_TO((_) {})],
        0,
      );
      final lengthUnitConverter = LengthUnitConverter(measureUnitConverter);

      WidgetsFlutterBinding.ensureInitialized();

      listOfLengthUnitInputs = ValueNotifier([]);

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();
      lengthUnitConverterViewModel = LengthUnitConverterViewModel(
        lengthUnitConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If Method \"loadListOfLengthUnitInputData\" Loads The List Of Length Unit Input Data With View Model",
      () {
        ListOfLengthUnitInputDataLoadingTransactionScript.loadListOfLengthUnitInputData(
          listOfLengthUnitInputs,
          lengthUnitConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(
          listOfLengthUnitInputs.value.first.controller.text,
          lengthUnitConverterViewModel.listOfLengthUnits.value.first.value,
        );
        expect(
          listOfLengthUnitInputs.value.length,
          lengthUnitConverterViewModel.listOfLengthUnits.value.length,
        );
      },
    );
  });
}
