import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/speed_unit_dropdown_menu_description_selector.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/speed_unit_input_value_updating_parser.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/speed_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/domain/speed_unit_converter/speed_unit.dart";
import "package:nove/domain/speed_unit_converter/lightspeed_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/inch_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/foot_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/knot_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mach_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/kilometer_per_hour_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/meter_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_second_unit_entity.dart";
import "package:nove/domain/speed_unit_converter/mile_per_hour_unit_entity.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/widgets/input.dart";

class SpeedUnitInput extends StatelessWidget {
  final int speedUnitInputIndex;
  final SpeedUnitConverterViewModel speedUnitConverterViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController controller;
  final FocusNode focusNode;

  const SpeedUnitInput({
    super.key,
    required this.speedUnitInputIndex,
    required this.speedUnitConverterViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: speedUnitConverterViewModel.baseSpeedUnitIndex,
      builder: (_, baseSpeedUnitIndex, _) {
        return ValueListenableBuilder(
          valueListenable: speedUnitConverterViewModel.listOfSpeedUnits,
          builder: (_, listOfSpeedUnits, _) {
            return Column(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      deviceLanguageStringsViewModel.deviceLanguageStrings,
                  builder: (_, deviceLanguageStrings, _) {
                    final dropdownMenuItemDescriptionHolder =
                        SpeedUnitDropdownMenuDescriptionSelector.getSpeedUnitDropdownMenuDescription(
                          listOfSpeedUnits[speedUnitInputIndex].measureUnit,
                          deviceLanguageStrings,
                        );

                    return Row(
                      children: [
                        isControllerNotTheFirst(speedUnitInputIndex)
                            ? InputActionButton(
                                icon: Symbols.close_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  speedUnitConverterViewModel.removeSpeedUnit(
                                    speedUnitInputIndex,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                        const SizedBox(width: 13),
                        Checkbox(
                          isChecked: isItemTheBaseMeasureUnit(
                            baseSpeedUnitIndex,
                            speedUnitInputIndex,
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
                            speedUnitConverterViewModel
                                .updateBaseSpeedUnitIndex(speedUnitInputIndex);
                          },
                        ),
                        const SizedBox(width: 13),
                        SizedBox(
                          width: 171,
                          child: DropdownMenu(
                            selectedItemShortcut:
                                dropdownMenuItemDescriptionHolder.abbreviation,
                            accessibilityLabel: deviceLanguageStrings
                                .SPEED_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                            items: [
                              DropdownMenuItem(
                                label:
                                    deviceLanguageStrings.LIGHTSPEED_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .LIGHTSPEED_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .LIGHTSPEED_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.LIGHTSPEED.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit = LightspeedUnitEntity(
                                    speedUnitConverterViewModel
                                        .listOfSpeedUnits
                                        .value[speedUnitInputIndex]
                                        .value,
                                  );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .INCH_PER_SECOND_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .INCH_PER_SECOND_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .INCH_PER_SECOND_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.INCH_PER_SECOND.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit =
                                      InchPerSecondUnitEntity(
                                        speedUnitConverterViewModel
                                            .listOfSpeedUnits
                                            .value[speedUnitInputIndex]
                                            .value,
                                      );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .KILOMETER_PER_SECOND_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .KILOMETER_PER_SECOND_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .KILOMETER_PER_SECOND_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.KILOMETER_PER_SECOND.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit =
                                      KilometerPerSecondUnitEntity(
                                        speedUnitConverterViewModel
                                            .listOfSpeedUnits
                                            .value[speedUnitInputIndex]
                                            .value,
                                      );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .FOOT_PER_SECOND_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .FOOT_PER_SECOND_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .FOOT_PER_SECOND_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.FOOT_PER_SECOND.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit =
                                      FootPerSecondUnitEntity(
                                        speedUnitConverterViewModel
                                            .listOfSpeedUnits
                                            .value[speedUnitInputIndex]
                                            .value,
                                      );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.KNOT_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .KNOT_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.KNOT_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.KNOT.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit = KnotUnitEntity(
                                    speedUnitConverterViewModel
                                        .listOfSpeedUnits
                                        .value[speedUnitInputIndex]
                                        .value,
                                  );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.MACH_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .MACH_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.MACH_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.MACH.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit = MachUnitEntity(
                                    speedUnitConverterViewModel
                                        .listOfSpeedUnits
                                        .value[speedUnitInputIndex]
                                        .value,
                                  );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .KILOMETER_PER_HOUR_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .KILOMETER_PER_HOUR_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .KILOMETER_PER_HOUR_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.KILOMETER_PER_HOUR.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit =
                                      KilometerPerHourUnitEntity(
                                        speedUnitConverterViewModel
                                            .listOfSpeedUnits
                                            .value[speedUnitInputIndex]
                                            .value,
                                      );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .METER_PER_SECOND_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .METER_PER_SECOND_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .METER_PER_SECOND_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.METER_PER_SECOND.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit =
                                      MeterPerSecondUnitEntity(
                                        speedUnitConverterViewModel
                                            .listOfSpeedUnits
                                            .value[speedUnitInputIndex]
                                            .value,
                                      );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .MILE_PER_SECOND_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .MILE_PER_SECOND_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .MILE_PER_SECOND_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.MILE_PER_SECOND.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit =
                                      MilePerSecondUnitEntity(
                                        speedUnitConverterViewModel
                                            .listOfSpeedUnits
                                            .value[speedUnitInputIndex]
                                            .value,
                                      );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .MILE_PER_HOUR_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .MILE_PER_HOUR_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .MILE_PER_HOUR_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  speedUnitConverterViewModel
                                      .listOfSpeedUnits
                                      .value[speedUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  SpeedUnit.MILE_PER_HOUR.index,
                                ),
                                onTap: () {
                                  final updatedSpeedUnit =
                                      MilePerHourUnitEntity(
                                        speedUnitConverterViewModel
                                            .listOfSpeedUnits
                                            .value[speedUnitInputIndex]
                                            .value,
                                      );

                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    updatedSpeedUnit,
                                    speedUnitInputIndex,
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
                              SpeedUnitInputValueUpdatingParser.updateSpeedUnitValue(
                                controller,
                                speedUnitConverterViewModel
                                    .listOfSpeedUnits
                                    .value[speedUnitInputIndex]
                                    .measureUnit,
                                (value) {
                                  speedUnitConverterViewModel.updateSpeedUnitAt(
                                    value,
                                    speedUnitInputIndex,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 13),
                        isControllerNotTheLast(
                              speedUnitInputIndex,
                              speedUnitConverterViewModel
                                  .listOfSpeedUnits
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
                                  speedUnitConverterViewModel.addSpeedUnitAt(
                                    speedUnitInputIndex + 1,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                      ],
                    );
                  },
                ),
                isControllerNotTheLast(
                      speedUnitInputIndex,
                      speedUnitConverterViewModel.listOfSpeedUnits.value.length,
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
