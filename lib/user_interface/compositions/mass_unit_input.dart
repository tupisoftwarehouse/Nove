import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/mass_unit_dropdown_menu_description_selector.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/mass_unit_input_value_updating_parser.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/mass_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/domain/mass_unit_converter/mass_unit.dart";
import "package:nove/domain/mass_unit_converter/tonne_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/kilogram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/gram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/milligram_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/pound_unit_entity.dart";
import "package:nove/domain/mass_unit_converter/ounce_unit_entity.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/widgets/input.dart";

class MassUnitInput extends StatelessWidget {
  final int massUnitInputIndex;
  final MassUnitConverterViewModel massUnitConverterViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController controller;
  final FocusNode focusNode;

  const MassUnitInput({
    super.key,
    required this.massUnitInputIndex,
    required this.massUnitConverterViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: massUnitConverterViewModel.baseMassUnitIndex,
      builder: (_, baseMassUnitIndex, _) {
        return ValueListenableBuilder(
          valueListenable: massUnitConverterViewModel.listOfMassUnits,
          builder: (_, listOfMassUnits, _) {
            return Column(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      deviceLanguageStringsViewModel.deviceLanguageStrings,
                  builder: (_, deviceLanguageStrings, _) {
                    final dropdownMenuItemDescriptionHolder =
                        MassUnitDropdownMenuDescriptionSelector.getMassUnitDropdownMenuDescription(
                          listOfMassUnits[massUnitInputIndex].measureUnit,
                          deviceLanguageStrings,
                        );

                    return Row(
                      children: [
                        isControllerNotTheFirst(massUnitInputIndex)
                            ? InputActionButton(
                                icon: Symbols.close_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  massUnitConverterViewModel.removeMassUnit(
                                    massUnitInputIndex,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                        const SizedBox(width: 13),
                        Checkbox(
                          isChecked: isItemTheBaseMeasureUnit(
                            baseMassUnitIndex,
                            massUnitInputIndex,
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
                            massUnitConverterViewModel.updateBaseMassUnitIndex(
                              massUnitInputIndex,
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
                                .MASS_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                            items: [
                              DropdownMenuItem(
                                label: deviceLanguageStrings.TONNE_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .TONNE_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.TONNE_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  massUnitConverterViewModel
                                      .listOfMassUnits
                                      .value[massUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  MassUnit.TONNE.index,
                                ),
                                onTap: () {
                                  final updatedMassUnit = TonneUnitEntity(
                                    massUnitConverterViewModel
                                        .listOfMassUnits
                                        .value[massUnitInputIndex]
                                        .value,
                                  );

                                  massUnitConverterViewModel.updateMassUnitAt(
                                    updatedMassUnit,
                                    massUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label:
                                    deviceLanguageStrings.KILOGRAM_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .KILOGRAM_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.KILOGRAM_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  massUnitConverterViewModel
                                      .listOfMassUnits
                                      .value[massUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  MassUnit.KILOGRAM.index,
                                ),
                                onTap: () {
                                  final updatedMassUnit = KilogramUnitEntity(
                                    massUnitConverterViewModel
                                        .listOfMassUnits
                                        .value[massUnitInputIndex]
                                        .value,
                                  );

                                  massUnitConverterViewModel.updateMassUnitAt(
                                    updatedMassUnit,
                                    massUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.GRAM_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .GRAM_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.GRAM_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  massUnitConverterViewModel
                                      .listOfMassUnits
                                      .value[massUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  MassUnit.GRAM.index,
                                ),
                                onTap: () {
                                  final updatedMassUnit = GramUnitEntity(
                                    massUnitConverterViewModel
                                        .listOfMassUnits
                                        .value[massUnitInputIndex]
                                        .value,
                                  );

                                  massUnitConverterViewModel.updateMassUnitAt(
                                    updatedMassUnit,
                                    massUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label:
                                    deviceLanguageStrings.MILLIGRAM_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .MILLIGRAM_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .MILLIGRAM_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  massUnitConverterViewModel
                                      .listOfMassUnits
                                      .value[massUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  MassUnit.MILLIGRAM.index,
                                ),
                                onTap: () {
                                  final updatedMassUnit = MilligramUnitEntity(
                                    massUnitConverterViewModel
                                        .listOfMassUnits
                                        .value[massUnitInputIndex]
                                        .value,
                                  );

                                  massUnitConverterViewModel.updateMassUnitAt(
                                    updatedMassUnit,
                                    massUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.POUND_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .POUND_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.POUND_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  massUnitConverterViewModel
                                      .listOfMassUnits
                                      .value[massUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  MassUnit.POUND.index,
                                ),
                                onTap: () {
                                  final updatedMassUnit = PoundUnitEntity(
                                    massUnitConverterViewModel
                                        .listOfMassUnits
                                        .value[massUnitInputIndex]
                                        .value,
                                  );

                                  massUnitConverterViewModel.updateMassUnitAt(
                                    updatedMassUnit,
                                    massUnitInputIndex,
                                  );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.OUNCE_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .OUNCE_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.OUNCE_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  massUnitConverterViewModel
                                      .listOfMassUnits
                                      .value[massUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  MassUnit.OUNCE.index,
                                ),
                                onTap: () {
                                  final updatedMassUnit = OunceUnitEntity(
                                    massUnitConverterViewModel
                                        .listOfMassUnits
                                        .value[massUnitInputIndex]
                                        .value,
                                  );

                                  massUnitConverterViewModel.updateMassUnitAt(
                                    updatedMassUnit,
                                    massUnitInputIndex,
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
                              MassUnitInputValueUpdatingParser.updateMassUnitValue(
                                controller,
                                massUnitConverterViewModel
                                    .listOfMassUnits
                                    .value[massUnitInputIndex]
                                    .measureUnit,
                                (value) {
                                  massUnitConverterViewModel.updateMassUnitAt(
                                    value,
                                    massUnitInputIndex,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 13),
                        isControllerNotTheLast(
                              massUnitInputIndex,
                              massUnitConverterViewModel
                                  .listOfMassUnits
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
                                  massUnitConverterViewModel.addMassUnitAt(
                                    massUnitInputIndex + 1,
                                  );
                                },
                              )
                            : const SizedBox(width: 56),
                      ],
                    );
                  },
                ),
                isControllerNotTheLast(
                      massUnitInputIndex,
                      massUnitConverterViewModel.listOfMassUnits.value.length,
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
