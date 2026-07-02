import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/data/currency_constants.dart";
import "package:nove/constants/domains/currency_unit_converter_constants.dart";
import "package:nove/domain/currency_unit_converter/currency_unit_converter.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/measure_unit_converter/measure_unit_converter.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/compositions/currency_unit_input.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/specific/list_of_currency_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "../../../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfCurrencyUnitInputDataLoadingTransactionScript\" Class", () {
    late ValueNotifier<List<CurrencyUnitInput>> listOfCurrencyUnitInputs;
    late CurrencyUnitConverterViewModel currencyUnitConverterViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final keyValueDatabase = KeyValueDatabaseMock();
      final measureUnitConverter = MeasureUnitConverter<CurrencyUnit>(
        ZEROED_CURRENCY_UNIT,
        [CURRENCY_UNIT_TO_CONVERT_TO((_) {})],
        0,
      );
      final currencyUnitConverter = CurrencyUnitConverter(
        measureUnitConverter,
        CURRENCY_VALUES,
      );

      WidgetsFlutterBinding.ensureInitialized();

      listOfCurrencyUnitInputs = ValueNotifier([]);

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();

      currencyUnitConverterViewModel = CurrencyUnitConverterViewModel(
        currencyUnitConverter,
        CURRENT_CURRENCY_VALUES,
        keyValueDatabase,
      );
    });

    test(
      "Test If Method \"loadListOfCurrencyUnitInputData\" Loads The List Of Currency Unit Input Data With View Model",
      () {
        ListOfCurrencyUnitInputDataLoadingTransactionScript.loadListOfCurrencyUnitInputData(
          listOfCurrencyUnitInputs,
          currencyUnitConverterViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(
          listOfCurrencyUnitInputs.value.first.controller.text,
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.first.value,
        );
        expect(
          listOfCurrencyUnitInputs.value.length,
          currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
        );
      },
    );
  });
}
