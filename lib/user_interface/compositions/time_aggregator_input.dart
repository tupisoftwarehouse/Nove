import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/domain/time_calculator/time_value_object.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/time_input_value_updating_parsers/time_aggregator_input_value_updating_parser.dart";
import "package:nove/user_interface/compositions/time_input_divider.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/time_aggregator_input_controller_holder_value_object.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";
import "package:nove/user_interface/widgets/input.dart";

class TimeAggregatorInput extends StatelessWidget {
  final TimeValueObject time;
  final TimeAggregatorInputControllerHolderValueObject
  timeAggregatorInputControllerHolder;
  final TimeAggregatorViewModel timeAggregatorViewModel;
  final int timeInputControllerIndex;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final FocusNode hourInputFocusNode;
  final FocusNode minuteInputFocusNode;
  final FocusNode secondInputFocusNode;

  const TimeAggregatorInput({
    super.key,
    required this.time,
    required this.timeAggregatorInputControllerHolder,
    required this.timeAggregatorViewModel,
    required this.timeInputControllerIndex,
    required this.deviceLanguageStringsViewModel,
    required this.hourInputFocusNode,
    required this.minuteInputFocusNode,
    required this.secondInputFocusNode,
  });

  @override
  Widget build(BuildContext _) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable:
                  deviceLanguageStringsViewModel.deviceLanguageStrings,
              builder: (_, deviceLanguageStrings, _) {
                return isControllerNotTheFirst(timeInputControllerIndex)
                    ? InputActionButton(
                        icon: Symbols.close_rounded,
                        tooltipMessage: deviceLanguageStrings
                            .REMOVE_TIME_BUTTON_TOOLTIP_MESSAGE,
                        accessibilityLabel: deviceLanguageStrings
                            .REMOVE_TIME_BUTTON_ACCESSIBILITY_LABEL,
                        onTap: () {
                          timeAggregatorViewModel.removeTime(
                            timeInputControllerIndex,
                          );
                        },
                      )
                    : const SizedBox(width: 56);
              },
            ),
            const SizedBox(width: 13),
            SizedBox(
              width: 93,
              child: Input(
                key: HOUR_INPUT_KEY,
                isCentralized: true,
                type: TextInputType.number,
                controller:
                    timeAggregatorInputControllerHolder.timeHourInputController,
                focusNode: hourInputFocusNode,
                hintText: ZEROED_TIME_PLACEHOLDER,
                onChanged: (value) {
                  TimeAggregatorInputValueUpdatingParser.updateHoursFromTime(
                    value,
                    timeAggregatorInputControllerHolder.timeHourInputController,
                    time,
                    (updatedTime) {
                      timeAggregatorViewModel.updateTime(
                        updatedTime,
                        timeInputControllerIndex,
                      );
                    },
                  );
                },
              ),
            ),
            const TimeInputDivider(),
            SizedBox(
              width: 93,
              child: Input(
                key: MINUTE_INPUT_KEY,
                isCentralized: true,
                type: TextInputType.number,
                controller: timeAggregatorInputControllerHolder
                    .timeMinuteInputController,
                hintText: ZEROED_TIME_PLACEHOLDER,
                focusNode: minuteInputFocusNode,
                onChanged: (value) {
                  TimeAggregatorInputValueUpdatingParser.updateMinutesFromTime(
                    value,
                    timeAggregatorInputControllerHolder
                        .timeMinuteInputController,
                    time,
                    (updatedTime) {
                      timeAggregatorViewModel.updateTime(
                        updatedTime,
                        timeInputControllerIndex,
                      );
                    },
                  );
                },
              ),
            ),
            const TimeInputDivider(),
            SizedBox(
              width: 93,
              child: Input(
                key: SECOND_INPUT_KEY,
                isCentralized: true,
                type: TextInputType.number,
                controller: timeAggregatorInputControllerHolder
                    .timeSecondInputController,
                hintText: ZEROED_TIME_PLACEHOLDER,
                focusNode: secondInputFocusNode,
                onChanged: (value) {
                  TimeAggregatorInputValueUpdatingParser.updateSecondsFromTime(
                    value,
                    timeAggregatorInputControllerHolder
                        .timeSecondInputController,
                    time,
                    (updatedTime) {
                      timeAggregatorViewModel.updateTime(
                        updatedTime,
                        timeInputControllerIndex,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(width: 13),
            ValueListenableBuilder(
              valueListenable:
                  deviceLanguageStringsViewModel.deviceLanguageStrings,
              builder: (_, deviceLanguageStrings, _) {
                return isControllerNotTheLast(
                      timeInputControllerIndex,
                      timeAggregatorViewModel.listOfTimes.value.length,
                    )
                    ? InputActionButton(
                        icon: Symbols.add_rounded,
                        tooltipMessage: deviceLanguageStrings
                            .ADD_TIME_NEXT_BUTTON_TOOLTIP_MESSAGE,
                        accessibilityLabel: deviceLanguageStrings
                            .ADD_TIME_NEXT_BUTTON_ACCESSIBILITY_LABEL,
                        onTap: () {
                          timeAggregatorViewModel.addTimeAt(
                            timeInputControllerIndex + 1,
                          );
                        },
                      )
                    : const SizedBox(width: 56);
              },
            ),
          ],
        ),
        isControllerNotTheLast(
              timeInputControllerIndex,
              timeAggregatorViewModel.listOfTimes.value.length,
            )
            ? const SizedBox(height: 13)
            : const SizedBox.shrink(),
      ],
    );
  }
}
