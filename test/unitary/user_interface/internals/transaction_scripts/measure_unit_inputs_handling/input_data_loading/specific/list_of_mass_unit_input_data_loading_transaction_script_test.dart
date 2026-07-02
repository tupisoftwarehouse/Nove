import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/compositions/mass_unit_input.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/specific/list_of_mass_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfMassUnitInputDataLoadingTransactionScript\" Class", () {
    late ValueNotifier<List<MassUnitInput>> listOfMassUnitInputs;
    late MassUnitConverterViewModel massUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter = MeasureUnitConverter<MassUnit>(
        ZEROED_MASS_UNIT,
        [MASS_UNIT_TO_CONVERT_TO((_) {})],
        0,
      );
      final massUnitConverter = MassUnitConverter(measureUnitConverter);

      WidgetsFlutterBinding.ensureInitialized();

      listOfMassUnitInputs = ValueNotifier([]);

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();
      massUnitConverterViewModel = MassUnitConverterViewModel(
        massUnitConverter,
        keyValueDatabase,
      );
    });

    test(
      "Test If Method \"loadListOfMassUnitInputData\" Loads The List Of Mass Unit Input Data With View Model",
      () {
        ListOfMassUnitInputDataLoadingTransactionScript.loadListOfMassUnitInputData(
          listOfMassUnitInputs,
          massUnitConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(
          listOfMassUnitInputs.value.first.controller.text,
          massUnitConverterViewModel.listOfMassUnits.value.first.value,
        );
        expect(
          listOfMassUnitInputs.value.length,
          massUnitConverterViewModel.listOfMassUnits.value.length,
        );
      },
    );
  });
}
