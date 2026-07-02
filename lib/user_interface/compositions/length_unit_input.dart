import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/length_unit_dropdown_menu_description_selector.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/length_unit_input_value_updating_parser.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/domain/length_unit_converter/length_unit.dart";
import "package:nove/domain/length_unit_converter/kilometer_unit_entity.dart";
import "package:nove/domain/length_unit_converter/meter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/centimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/millimeter_unit_entity.dart";
import "package:nove/domain/length_unit_converter/mile_unit_entity.dart";
import "package:nove/domain/length_unit_converter/yard_unit_entity.dart";
import "package:nove/domain/length_unit_converter/foot_unit_entity.dart";
import "package:nove/domain/length_unit_converter/inch_unit_entity.dart";
import "package:nove/domain/length_unit_converter/nautical_mile_unit_entity.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/widgets/input.dart";

class LengthUnitInput extends StatelessWidget {
  final int lengthUnitInputIndex;
  final LengthUnitConverterViewModel lengthUnitConverterViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController controller;
  final FocusNode focusNode;

  const LengthUnitInput({
    super.key,
    required this.lengthUnitInputIndex,
    required this.lengthUnitConverterViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: lengthUnitConverterViewModel.baseLengthUnitIndex,
      builder: (_, baseLengthUnitIndex, _) {
        return ValueListenableBuilder(
          valueListenable: lengthUnitConverterViewModel.listOfLengthUnits,
          builder: (_, listOfLengthUnits, _) {
            return Column(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      deviceLanguageStringsViewModel.deviceLanguageStrings,
                  builder: (_, deviceLanguageStrings, _) {
                    final dropdownMenuItemDescriptionHolder =
                        LengthUnitDropdownMenuDescriptionSelector.getLengthUnitDropdownMenuDescription(
                          listOfLengthUnits[lengthUnitInputIndex].measureUnit,
                          deviceLanguageStrings,
                        );

                    return Row(
                      children: [
                        isControllerNotTheFirst(lengthUnitInputIndex)
                            ? InputActionButton(
                                icon: Symbols.close_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  lengthUnitConverterViewModel.removeLengthUnit(
                                    lengthUnitInputIndex,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                        const SizedBox(width: 13),
                        Checkbox(
                          isChecked: isItemTheBaseMeasureUnit(
                            baseLengthUnitIndex,
                            lengthUnitInputIndex,
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
                            lengthUnitConverterViewModel
                                .updateBaseLengthUnitIndex(
                                  lengthUnitInputIndex,
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
                                .LENGTH_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                            items: [
                              DropdownMenuItem(
                                label:
                                    deviceLanguageStrings.KILOMETER_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .KILOMETER_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .KILOMETER_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.KILOMETER.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit = KilometerUnitEntity(
                                    lengthUnitConverterViewModel
                                        .listOfLengthUnits
                                        .value[lengthUnitInputIndex]
                                        .value,
                                  );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.METER_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .METER_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.METER_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.METER.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit = MeterUnitEntity(
                                    lengthUnitConverterViewModel
                                        .listOfLengthUnits
                                        .value[lengthUnitInputIndex]
                                        .value,
                                  );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label:
                                    deviceLanguageStrings.CENTIMETER_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .CENTIMETER_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .CENTIMETER_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.CENTIMETER.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit =
                                      CentimeterUnitEntity(
                                        lengthUnitConverterViewModel
                                            .listOfLengthUnits
                                            .value[lengthUnitInputIndex]
                                            .value,
                                      );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label:
                                    deviceLanguageStrings.MILLIMETER_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .MILLIMETER_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .MILLIMETER_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.MILLIMETER.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit =
                                      MillimeterUnitEntity(
                                        lengthUnitConverterViewModel
                                            .listOfLengthUnits
                                            .value[lengthUnitInputIndex]
                                            .value,
                                      );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.MILE_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .MILE_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.MILE_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.MILE.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit = MileUnitEntity(
                                    lengthUnitConverterViewModel
                                        .listOfLengthUnits
                                        .value[lengthUnitInputIndex]
                                        .value,
                                  );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.YARD_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .YARD_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.YARD_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.YARD.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit = YardUnitEntity(
                                    lengthUnitConverterViewModel
                                        .listOfLengthUnits
                                        .value[lengthUnitInputIndex]
                                        .value,
                                  );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.FOOT_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .FOOT_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.FOOT_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.FOOT.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit = FootUnitEntity(
                                    lengthUnitConverterViewModel
                                        .listOfLengthUnits
                                        .value[lengthUnitInputIndex]
                                        .value,
                                  );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.INCH_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .INCH_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.INCH_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.INCH.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit = InchUnitEntity(
                                    lengthUnitConverterViewModel
                                        .listOfLengthUnits
                                        .value[lengthUnitInputIndex]
                                        .value,
                                  );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .NAUTICAL_MILE_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .NAUTICAL_MILE_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .NAUTICAL_MILE_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  lengthUnitConverterViewModel
                                      .listOfLengthUnits
                                      .value[lengthUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  LengthUnit.NAUTICAL_MILE.index,
                                ),
                                onTap: () {
                                  final updatedLengthUnit =
                                      NauticalMileUnitEntity(
                                        lengthUnitConverterViewModel
                                            .listOfLengthUnits
                                            .value[lengthUnitInputIndex]
                                            .value,
                                      );

                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        updatedLengthUnit,
                                        lengthUnitInputIndex,
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
                              LengthUnitInputValueUpdatingParser.updateLengthUnitValue(
                                controller,
                                lengthUnitConverterViewModel
                                    .listOfLengthUnits
                                    .value[lengthUnitInputIndex]
                                    .measureUnit,
                                (value) {
                                  lengthUnitConverterViewModel
                                      .updateLengthUnitAt(
                                        value,
                                        lengthUnitInputIndex,
                                      );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 13),
                        isControllerNotTheLast(
                              lengthUnitInputIndex,
                              lengthUnitConverterViewModel
                                  .listOfLengthUnits
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
                                  lengthUnitConverterViewModel.addLengthUnitAt(
                                    lengthUnitInputIndex + 1,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                      ],
                    );
                  },
                ),
                isControllerNotTheLast(
                      lengthUnitInputIndex,
                      lengthUnitConverterViewModel
                          .listOfLengthUnits
                          .value
                          .length,
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
