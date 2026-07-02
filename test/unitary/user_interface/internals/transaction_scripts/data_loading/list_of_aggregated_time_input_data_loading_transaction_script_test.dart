import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:nove/constants/domains/time_aggregator_constants.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/domain/time_aggregator/time_aggregator.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/time_aggregator_input_controller_holder_value_object.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_loading/list_of_aggregated_time_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";
import "../../../../../mocks/user_interface/key_value_database_mock.dart";

void main() {
  group("Test \"ListOfAggregatedTimeInputDataLoadingTransactionScript\" Class", () {
    late ValueNotifier<List<Widget>> listOfAggregatedTimeInputs;
    late List<TimeAggregatorInputControllerHolderValueObject>
    listOfTimeInputControllerHolders;
    late TimeAggregatorViewModel timeAggregatorViewModel;
    late DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;

    setUpAll(() {
      final keyValueDatabase = KeyValueDatabaseMock();
      final timeAggregator = TimeAggregator([
        AGGREGATED_TIME,
        ZEROED_TIME,
      ], AGGREGATED_TIME);

      WidgetsFlutterBinding.ensureInitialized();

      listOfAggregatedTimeInputs = ValueNotifier([]);
      listOfTimeInputControllerHolders = [];

      deviceLanguageStringsViewModel =
          DeviceLanguageStringsViewModelFactory.getInstance();
      timeAggregatorViewModel = TimeAggregatorViewModel(
        timeAggregator,
        keyValueDatabase,
      );
    });

    test(
      "Test \"loadListOfAggregatedTimeInputData\" Loads List Of Aggregated Time Data Into List Of Aggregated Time Input And Its Controller",
      () {
        ListOfAggregatedTimeInputDataLoadingTransactionScript.loadListOfAggregatedTimeInputData(
          listOfTimeInputControllerHolders,
          listOfAggregatedTimeInputs,
          timeAggregatorViewModel,
          deviceLanguageStringsViewModel,
        );

        expect(
          listOfTimeInputControllerHolders.length,
          timeAggregatorViewModel.listOfTimes.value.length,
        );
        expect(
          listOfAggregatedTimeInputs.value.length,
          timeAggregatorViewModel.listOfTimes.value.length,
        );
      },
    );
  });
}
