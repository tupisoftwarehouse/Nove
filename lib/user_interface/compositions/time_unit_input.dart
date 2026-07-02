import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/time_unit_dropdown_menu_description_selector.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/time_unit_input_value_updating_parser.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/time_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/domain/time_unit_converter/time_unit.dart";
import "package:nove/domain/time_unit_converter/year_unit_entity.dart";
import "package:nove/domain/time_unit_converter/week_unit_entity.dart";
import "package:nove/domain/time_unit_converter/day_unit_entity.dart";
import "package:nove/domain/time_unit_converter/hour_unit_entity.dart";
import "package:nove/domain/time_unit_converter/minute_unit_entity.dart";
import "package:nove/domain/time_unit_converter/second_unit_entity.dart";
import "package:nove/domain/time_unit_converter/millisecond_unit_entity.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/widgets/input.dart";

class TimeUnitInput extends StatelessWidget {
  final int timeUnitInputIndex;
  final TimeUnitConverterViewModel timeUnitConverterViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController controller;
  final FocusNode focusNode;

  const TimeUnitInput({
    super.key,
    required this.timeUnitInputIndex,
    required this.timeUnitConverterViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: timeUnitConverterViewModel.baseTimeUnitIndex,
      builder: (_, baseTimeUnitIndex, _) {
        return ValueListenableBuilder(
          valueListenable: timeUnitConverterViewModel.listOfTimeUnits,
          builder: (_, listOfTimeUnits, _) {
            return Column(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      deviceLanguageStringsViewModel.deviceLanguageStrings,
                  builder: (_, deviceLanguageStrings, _) {
                    final dropdownMenuItemDescriptionHolder =
                        TimeUnitDropdownMenuDescriptionSelector.getTimeUnitDropdownMenuDescription(
                          listOfTimeUnits[timeUnitInputIndex].measureUnit,
                          deviceLanguageStrings,
                        );

                    return Row(
                      children: [
                        isControllerNotTheFirst(timeUnitInputIndex)
                            ? InputActionButton(
                                icon: Symbols.close_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  timeUnitConverterViewModel.removeTimeUnit(
                                    timeUnitInputIndex,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                        const SizedBox(width: 13),
                        Checkbox(
                          isChecked: isItemTheBaseMeasureUnit(
                            baseTimeUnitIndex,
                            timeUnitInputIndex,
                          ),
                          tooltipMessage: deviceLanguageStrings
                              .SELECT_UNIT_ELEMENT_TOOLTIP_MESSAGE(
                                dropdownMenuItemDescriptionHolder.label,
                              ),
                          accessibilityLabel: deviceLanguageStrings
                              .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                dropdownMenuItemDescriptionHolder.label,
                              ),
                          onTap: () {
                            timeUnitConverterViewModel.updateBaseTimeUnitIndex(
                              timeUnitInputIndex,
                            );
                          },
                        ),
                        const SizedBox(width: 13),
                        SizedBox(
                          width: 171,
                          child: DropdownMenu(
                            selectedItemShortcut:
                                dropdownMenuItemDescriptionHolder.abbreviation,
                            accessibilityLabel: deviceLanguageStrings
                                .TIME_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                            items: [
                              DropdownMenuItem(
                                label: deviceLanguageStrings.YEAR_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .YEAR_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.YEAR_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  timeUnitConverterViewModel
                                      .listOfTimeUnits
                                      .value[timeUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TimeUnit.YEAR.index,
                                ),
                                onTap: () {
                                  final updatedTimeUnit = YearUnitEntity(
                                    timeUnitConverterViewModel
                                        .listOfTimeUnits
                                        .value[timeUnitInputIndex]
                                        .value,
                                  );

                                  timeUnitConverterViewModel.updateTimeUnitAt(
                                    updatedTimeUnit,
                                    timeUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.WEEK_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .WEEK_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.WEEK_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  timeUnitConverterViewModel
                                      .listOfTimeUnits
                                      .value[timeUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TimeUnit.WEEK.index,
                                ),
                                onTap: () {
                                  final updatedTimeUnit = WeekUnitEntity(
                                    timeUnitConverterViewModel
                                        .listOfTimeUnits
                                        .value[timeUnitInputIndex]
                                        .value,
                                  );

                                  timeUnitConverterViewModel.updateTimeUnitAt(
                                    updatedTimeUnit,
                                    timeUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.DAY_UNIT_LABEL,
                                abbreviation:
                                    deviceLanguageStrings.DAY_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.DAY_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  timeUnitConverterViewModel
                                      .listOfTimeUnits
                                      .value[timeUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TimeUnit.DAY.index,
                                ),
                                onTap: () {
                                  final updatedTimeUnit = DayUnitEntity(
                                    timeUnitConverterViewModel
                                        .listOfTimeUnits
                                        .value[timeUnitInputIndex]
                                        .value,
                                  );

                                  timeUnitConverterViewModel.updateTimeUnitAt(
                                    updatedTimeUnit,
                                    timeUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.HOUR_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .HOUR_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.HOUR_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  timeUnitConverterViewModel
                                      .listOfTimeUnits
                                      .value[timeUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TimeUnit.HOUR.index,
                                ),
                                onTap: () {
                                  final updatedTimeUnit = HourUnitEntity(
                                    timeUnitConverterViewModel
                                        .listOfTimeUnits
                                        .value[timeUnitInputIndex]
                                        .value,
                                  );

                                  timeUnitConverterViewModel.updateTimeUnitAt(
                                    updatedTimeUnit,
                                    timeUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.MINUTE_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .MINUTE_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.MINUTE_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  timeUnitConverterViewModel
                                      .listOfTimeUnits
                                      .value[timeUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TimeUnit.MINUTE.index,
                                ),
                                onTap: () {
                                  final updatedTimeUnit = MinuteUnitEntity(
                                    timeUnitConverterViewModel
                                        .listOfTimeUnits
                                        .value[timeUnitInputIndex]
                                        .value,
                                  );

                                  timeUnitConverterViewModel.updateTimeUnitAt(
                                    updatedTimeUnit,
                                    timeUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.SECOND_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SECOND_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.SECOND_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  timeUnitConverterViewModel
                                      .listOfTimeUnits
                                      .value[timeUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TimeUnit.SECOND.index,
                                ),
                                onTap: () {
                                  final updatedTimeUnit = SecondUnitEntity(
                                    timeUnitConverterViewModel
                                        .listOfTimeUnits
                                        .value[timeUnitInputIndex]
                                        .value,
                                  );

                                  timeUnitConverterViewModel.updateTimeUnitAt(
                                    updatedTimeUnit,
                                    timeUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .MILLISECOND_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .MILLISECOND_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .MILLISECOND_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  timeUnitConverterViewModel
                                      .listOfTimeUnits
                                      .value[timeUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TimeUnit.MILLISECOND.index,
                                ),
                                onTap: () {
                                  final updatedTimeUnit = MillisecondUnitEntity(
                                    timeUnitConverterViewModel
                                        .listOfTimeUnits
                                        .value[timeUnitInputIndex]
                                        .value,
                                  );

                                  timeUnitConverterViewModel.updateTimeUnitAt(
                                    updatedTimeUnit,
                                    timeUnitInputIndex,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Input(
                            hintText: deviceLanguageStrings
                                .CONVERTER_INPUT_PLACEHOLDER,
                            controller: controller,
                            type: TextInputType.number,
                            focusNode: focusNode,
                            onChanged: (updatedValue) {
                              TimeUnitInputValueUpdatingParser.updateTimeUnitValue(
                                controller,
                                timeUnitConverterViewModel
                                    .listOfTimeUnits
                                    .value[timeUnitInputIndex]
                                    .measureUnit,
                                (value) {
                                  timeUnitConverterViewModel.updateTimeUnitAt(
                                    value,
                                    timeUnitInputIndex,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 13),
                        isControllerNotTheLast(
                              timeUnitInputIndex,
                              timeUnitConverterViewModel
                                  .listOfTimeUnits
                                  .value
                                  .length,
                            )
                            ? InputActionButton(
                                icon: Symbols.add_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .ADD_UNIT_NEXT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .ADD_UNIT_NEXT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  timeUnitConverterViewModel.addTimeUnitAt(
                                    timeUnitInputIndex + 1,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                      ],
                    );
                  },
                ),
                isControllerNotTheLast(
                      timeUnitInputIndex,
                      timeUnitConverterViewModel.listOfTimeUnits.value.length,
                    )
                    ? const SizedBox(height: 12)
                    : const SizedBox.shrink(),
              ],
            );
          },
        );
      },
    );
  }
}
