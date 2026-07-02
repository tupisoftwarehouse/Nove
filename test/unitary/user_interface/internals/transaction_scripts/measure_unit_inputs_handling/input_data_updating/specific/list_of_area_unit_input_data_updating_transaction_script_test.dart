import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/user_interface/compositions/area_unit_input.dart";
import "package:nove/constants/domains/area_unit_converter_constants.dart";
import "package:nove/domain/area_unit_converter/area_unit_converter.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/specific/list_of_area_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfAreaUnitInputDataUpdatingTransactionScript\" Class", () {
    late ValueNotifier<List<AreaUnitInput>> listOfAreaUnitInputs;
    late AreaUnitConverterViewModel areaUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final areaUnitToBeConvertedImplementation = AREA_UNIT_TO_CONVERT_TO(
        (_) {},
      );
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter = MeasureUnitConverter<AreaUnit>(
        ZEROED_AREA_UNIT,
        [
          areaUnitToBeConvertedImplementation,
          areaUnitToBeConvertedImplementation,
        ],
        0,
      );
      final areaUnitConverter = AreaUnitConverter(measureUnitConverter);

      WidgetsFlutterBinding.ensureInitialized();

      areaUnitConverterViewModel = AreaUnitConverterViewModel(
        areaUnitConverter,
        keyValueDatabase,
      );

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      listOfAreaUnitInputs = ValueNotifier([
        AreaUnitInput(
          areaUnitInputIndex: 0,
          areaUnitConverterViewModel: areaUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
        AreaUnitInput(
          areaUnitInputIndex: 1,
          areaUnitConverterViewModel: areaUnitConverterViewModel,
          deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ),
      ]);
    });

    test(
      "Test If Method \"updateListOfAreaUnitInputData\" Updates The List Of Area Unit Input Data With View Model Data And Previous Text Selection But Keep Value Of Base Area Unit Input",
      () {
        ListOfAreaUnitInputDataUpdatingTransactionScript.updateListOfAreaUnitInputData(
          listOfAreaUnitInputs,
          areaUnitConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(listOfAreaUnitInputs.value.first.controller.text, "");
        expect(
          listOfAreaUnitInputs.value.last.controller.text,
          areaUnitConverterViewModel.listOfAreaUnits.value.last.value,
        );
      },
    );
  });
}
