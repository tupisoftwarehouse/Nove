import "package:flutter/widgets.dart";
import "package:nove/user_interface/compositions/time_aggregator_input.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/time_aggregator_input_controller_holder_value_object.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";

class ListOfAggregatedTimeInputDataLoadingTransactionScript {
  ListOfAggregatedTimeInputDataLoadingTransactionScript._();

  static void loadListOfAggregatedTimeInputData(
    List<TimeAggregatorInputControllerHolderValueObject>
    listOfTimeInputControllerHolders,
    ValueNotifier<List<Widget>> listOfAggregatedTimeInputs,
    TimeAggregatorViewModel timeAggregatorViewModel,
    DeviceLanguageStringsViewModel deviceLanguageStringsViewModel,
  ) {
    final List<Widget> updatedListOfAggregatedTimeInputs = [];

    listOfTimeInputControllerHolders.clear();

    for (
      var timeAggregatorInputIndex = 0;
      timeAggregatorInputIndex <
          timeAggregatorViewModel.listOfTimes.value.length;
      timeAggregatorInputIndex++
    ) {
      final timeHoursController = TextEditingController(
        text:
            "${timeAggregatorViewModel.listOfTimes.value[timeAggregatorInputIndex].hours}",
      );
      final timeMinutesController = TextEditingController(
        text:
            "${timeAggregatorViewModel.listOfTimes.value[timeAggregatorInputIndex].minutes}",
      );
      final timeSecondsController = TextEditingController(
        text:
            "${timeAggregatorViewModel.listOfTimes.value[timeAggregatorInputIndex].seconds}",
      );
      final timeAggregatorInputControllerHolder =
          TimeAggregatorInputControllerHolderValueObject(
            timeHoursController,
            timeMinutesController,
            timeSecondsController,
          );

      final hourInputFocusNode = FocusNode();
      final minuteInputFocusNode = FocusNode();
      final secondInputFocusNode = FocusNode();

      final timeAggregatorTimeInput = ValueListenableBuilder(
        valueListenable: timeAggregatorViewModel.listOfTimes,
        builder: (_, listOfTimes, _) {
          return TimeAggregatorInput(
            time: listOfTimes[timeAggregatorInputIndex],
            timeAggregatorInputControllerHolder:
                listOfTimeInputControllerHolders[timeAggregatorInputIndex],
            timeAggregatorViewModel: timeAggregatorViewModel,
            timeInputControllerIndex: timeAggregatorInputIndex,
            deviceLanguageStringsViewModel: deviceLanguageStringsViewModel,
            hourInputFocusNode: hourInputFocusNode,
            minuteInputFocusNode: minuteInputFocusNode,
            secondInputFocusNode: secondInputFocusNode,
          );
        },
      );

      listOfTimeInputControllerHolders.add(timeAggregatorInputControllerHolder);

      updatedListOfAggregatedTimeInputs.add(timeAggregatorTimeInput);
    }

    listOfAggregatedTimeInputs.value = updatedListOfAggregatedTimeInputs;
  }
}
