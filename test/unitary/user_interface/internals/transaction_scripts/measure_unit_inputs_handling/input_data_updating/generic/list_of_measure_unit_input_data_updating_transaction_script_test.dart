import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/compositions/area_unit_input.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/generic/list_of_measure_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfMeasureUnitInputDataUpdatingTransactionScript\" Class", () {
    late ValueNotifier<List<AreaUnitInput>> listOfMeasureUnitInputs;
    late AreaUnitConverterViewModel measureUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final measureUnitToBeConvertedImplementation = AREA_UNIT_TO_CONVERT_TO(
        (_) {},
      );
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter =
          MeasureUnitConverter<AreaUnit>(ZEROED_AREA_UNIT, [
            measureUnitToBeConvertedImplementation,
            measureUnitToBeConvertedImplementation,
          ], 0);
      final measureUnitConverterImplementation = AreaUnitConverter(
        measureUnitConverter,
      );

      WidgetsFlutterBinding.ensureInitialized();

      measureUnitConverterViewModel = AreaUnitConverterViewModel(
        measureUnitConverterImplementation,
        keyValueDatabase,
      );

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      listOfMeasureUnitInputs = ValueNotifier([
        AreaUnitInput(
          areaUnitInputIndex: 0,
          areaUnitConverterViewModel: measureUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
        AreaUnitInput(
          areaUnitInputIndex: 1,
          areaUnitConverterViewModel: measureUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
      ]);
    });

    test(
      "Test If Method \"updateListOfMeasureUnitInputData\" Updates The List Of Measure Unit Input Data With View Model Data And Previous Text Selection But Keep Value Of Base Measure Unit Input",
      () {
        ListOfMeasureUnitInputDataUpdatingTransactionScript.updateListOfMeasureUnitInputData(
          listOfMeasureUnitInputs,
          measureUnitConverterViewModel.listOfAreaUnits,
          measureUnitConverterViewModel.baseAreaUnitIndex.value,
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

        expect(listOfMeasureUnitInputs.value.first.controller.text, "");
        expect(
          listOfMeasureUnitInputs.value.last.controller.text,
          measureUnitConverterViewModel.listOfAreaUnits.value.last.value,
        );
      },
    );
  });
}
