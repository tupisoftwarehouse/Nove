import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/compositions/area_unit_input.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/generic/list_of_measure_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfMeasureUnitInputDataLoadingTransactionScript\" Class", () {
    late ValueNotifier<List<AreaUnitInput>> listOfMeasureUnitInputs;
    late AreaUnitConverterViewModel measureUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        [AREA_UNIT_TO_CONVERT_TO((_) {})],
        0,
      );
      final measureUnitConverterImplementation = AreaUnitConverter(
        measureUnitConverter,
      );

      WidgetsFlutterBinding.ensureInitialized();

      listOfMeasureUnitInputs = ValueNotifier([]);

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();
      measureUnitConverterViewModel = AreaUnitConverterViewModel(
        measureUnitConverterImplementation,
        keyValueDatabase,
      );
    });

    test(
      "Test If Method \"loadListOfMeasureUnitInputData\" Loads The List Of Measure Unit Input Data With View Model",
      () {
        ListOfMeasureUnitInputDataLoadingTransactionScript.loadListOfMeasureUnitInputData(
          listOfMeasureUnitInputs,
          measureUnitConverterViewModel.listOfAreaUnits,
          (
            int measureUnitInputIndex,
            TextEditingController controller,
            FocusNode focusNode,
          ) {
            return AreaUnitInput(
              areaUnitInputIndex: measureUnitInputIndex,
              areaUnitConverterViewModel: measureUnitConverterViewModel,
              deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
              controller: controller,
              focusNode: focusNode,
            );
          },
        );

        expect(
          listOfMeasureUnitInputs.value.first.controller.text,
          measureUnitConverterViewModel.listOfAreaUnits.value.first.value,
        );
        expect(
          listOfMeasureUnitInputs.value.length,
          measureUnitConverterViewModel.listOfAreaUnits.value.length,
        );
      },
    );
  });
}
