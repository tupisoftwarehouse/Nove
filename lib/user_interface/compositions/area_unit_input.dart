import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/area_unit_dropdown_menu_description_selector.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/area_unit_input_value_updating_parser.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/area_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/domain/area_unit_converter/area_unit.dart";
import "package:nove/domain/area_unit_converter/acre_unit_entity.dart";
import "package:nove/domain/area_unit_converter/hectare_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_centimeter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_foot_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_inch_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_kilometer_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_meter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_mile_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_millimeter_unit_entity.dart";
import "package:nove/domain/area_unit_converter/square_yard_unit_entity.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/widgets/input.dart";

class AreaUnitInput extends StatelessWidget {
  final int areaUnitInputIndex;
  final AreaUnitConverterViewModel areaUnitConverterViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController controller;
  final FocusNode focusNode;

  const AreaUnitInput({
    super.key,
    required this.areaUnitInputIndex,
    required this.areaUnitConverterViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: areaUnitConverterViewModel.baseAreaUnitIndex,
      builder: (_, baseAreaUnitIndex, _) {
        return ValueListenableBuilder(
          valueListenable: areaUnitConverterViewModel.listOfAreaUnits,
          builder: (_, listOfAreaUnits, _) {
            return Column(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      deviceLanguageStringsViewModel.deviceLanguageStrings,
                  builder: (_, deviceLanguageStrings, _) {
                    final dropdownMenuItemDescriptionHolder =
                        AreaUnitDropdownMenuDescriptionSelector.getAreaUnitDropdownMenuDescription(
                          listOfAreaUnits[areaUnitInputIndex].measureUnit,
                          deviceLanguageStrings,
                        );

                    return Row(
                      children: [
                        isControllerNotTheFirst(areaUnitInputIndex)
                            ? InputActionButton(
                                icon: Symbols.close_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  areaUnitConverterViewModel.removeAreaUnit(
                                    areaUnitInputIndex,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                        const SizedBox(width: 13),
                        Checkbox(
                          isChecked: isItemTheBaseMeasureUnit(
                            baseAreaUnitIndex,
                            areaUnitInputIndex,
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
                            areaUnitConverterViewModel.updateBaseAreaUnitIndex(
                              areaUnitInputIndex,
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
                                .AREA_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                            items: [
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .SQUARE_KILOMETER_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SQUARE_KILOMETER_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .SQUARE_KILOMETER_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.SQUARE_KILOMETER.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit =
                                      SquareKilometerUnitEntity(
                                        areaUnitConverterViewModel
                                            .listOfAreaUnits
                                            .value[areaUnitInputIndex]
                                            .value,
                                      );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .SQUARE_METER_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SQUARE_METER_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .SQUARE_METER_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.SQUARE_METER.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit = SquareMeterUnitEntity(
                                    areaUnitConverterViewModel
                                        .listOfAreaUnits
                                        .value[areaUnitInputIndex]
                                        .value,
                                  );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .SQUARE_CENTIMETER_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SQUARE_CENTIMETER_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .SQUARE_CENTIMETER_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.SQUARE_CENTIMETER.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit =
                                      SquareCentimeterUnitEntity(
                                        areaUnitConverterViewModel
                                            .listOfAreaUnits
                                            .value[areaUnitInputIndex]
                                            .value,
                                      );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .SQUARE_MILLIMETER_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SQUARE_MILLIMETER_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .SQUARE_MILLIMETER_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.SQUARE_MILLIMETER.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit =
                                      SquareMillimeterUnitEntity(
                                        areaUnitConverterViewModel
                                            .listOfAreaUnits
                                            .value[areaUnitInputIndex]
                                            .value,
                                      );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .SQUARE_MILE_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SQUARE_MILE_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .SQUARE_MILE_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.SQUARE_MILE.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit = SquareMileUnitEntity(
                                    areaUnitConverterViewModel
                                        .listOfAreaUnits
                                        .value[areaUnitInputIndex]
                                        .value,
                                  );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .SQUARE_YARD_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SQUARE_YARD_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .SQUARE_YARD_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.SQUARE_YARD.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit = SquareYardUnitEntity(
                                    areaUnitConverterViewModel
                                        .listOfAreaUnits
                                        .value[areaUnitInputIndex]
                                        .value,
                                  );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .SQUARE_FOOT_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SQUARE_FOOT_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .SQUARE_FOOT_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.SQUARE_FOOT.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit = SquareFootUnitEntity(
                                    areaUnitConverterViewModel
                                        .listOfAreaUnits
                                        .value[areaUnitInputIndex]
                                        .value,
                                  );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .SQUARE_INCH_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .SQUARE_INCH_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .SQUARE_INCH_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.SQUARE_INCH.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit = SquareInchUnitEntity(
                                    areaUnitConverterViewModel
                                        .listOfAreaUnits
                                        .value[areaUnitInputIndex]
                                        .value,
                                  );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.HECTARE_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .HECTARE_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.HECTARE_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.HECTARE.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit = HectareUnitEntity(
                                    areaUnitConverterViewModel
                                        .listOfAreaUnits
                                        .value[areaUnitInputIndex]
                                        .value,
                                  );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.ACRE_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .ACRE_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.ACRE_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  areaUnitConverterViewModel
                                      .listOfAreaUnits
                                      .value[areaUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  AreaUnit.ACRE.index,
                                ),
                                onTap: () {
                                  final updatedAreaUnit = AcreUnitEntity(
                                    areaUnitConverterViewModel
                                        .listOfAreaUnits
                                        .value[areaUnitInputIndex]
                                        .value,
                                  );

                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    updatedAreaUnit,
                                    areaUnitInputIndex,
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
                              AreaUnitInputValueUpdatingParser.updateAreaUnitValue(
                                controller,
                                areaUnitConverterViewModel
                                    .listOfAreaUnits
                                    .value[areaUnitInputIndex]
                                    .measureUnit,
                                (value) {
                                  areaUnitConverterViewModel.updateAreaUnitAt(
                                    value,
                                    areaUnitInputIndex,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 13),
                        isControllerNotTheLast(
                              areaUnitInputIndex,
                              areaUnitConverterViewModel
                                  .listOfAreaUnits
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
                                  areaUnitConverterViewModel.addAreaUnitAt(
                                    areaUnitInputIndex + 1,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                      ],
                    );
                  },
                ),
                isControllerNotTheLast(
                      areaUnitInputIndex,
                      areaUnitConverterViewModel.listOfAreaUnits.value.length,
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
