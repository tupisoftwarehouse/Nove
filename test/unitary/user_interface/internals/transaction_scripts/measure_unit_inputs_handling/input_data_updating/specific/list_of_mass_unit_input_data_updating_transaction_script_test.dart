import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/user_interface/compositions/mass_unit_input.dart";
import "package:nove/constants/domains/mass_unit_converter_constants.dart";
import "package:nove/domain/mass_unit_converter/mass_unit_converter.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/specific/list_of_mass_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfMassUnitInputDataUpdatingTransactionScript\" Class", () {
    late ValueNotifier<List<MassUnitInput>> listOfMassUnitInputs;
    late MassUnitConverterViewModel massUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final massUnitToBeConvertedImplementation = MASS_UNIT_TO_CONVERT_TO(
        (_) {},
      );
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter = MeasureUnitConverter<MassUnit>(
        ZEROED_MASS_UNIT,
        [
          massUnitToBeConvertedImplementation,
          massUnitToBeConvertedImplementation,
        ],
        0,
      );
      final massUnitConverter = MassUnitConverter(measureUnitConverter);

      WidgetsFlutterBinding.ensureInitialized();

      massUnitConverterViewModel = MassUnitConverterViewModel(
        massUnitConverter,
        keyValueDatabase,
      );

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      listOfMassUnitInputs = ValueNotifier([
        MassUnitInput(
          massUnitInputIndex: 0,
          massUnitConverterViewModel: massUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
        MassUnitInput(
          massUnitInputIndex: 1,
          massUnitConverterViewModel: massUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
      ]);
    });

    test(
      "Test If Method \"updateListOfMassUnitInputData\" Updates The List Of Mass Unit Input Data With View Model Data And Previous Text Selection But Keep Value Of Base Mass Unit Input",
      () {
        ListOfMassUnitInputDataUpdatingTransactionScript.updateListOfMassUnitInputData(
          listOfMassUnitInputs,
          massUnitConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(listOfMassUnitInputs.value.first.controller.text, "");
        expect(
          listOfMassUnitInputs.value.last.controller.text,
          massUnitConverterViewModel.listOfMassUnits.value.last.value,
        );
      },
    );
  });
}
