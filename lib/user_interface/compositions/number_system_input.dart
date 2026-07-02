import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/number_system_dropdown_menu_description_selector.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/number_system_input_value_updating_parser.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_converting/number_system_input_data_converting/to_binary_value_converting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_converting/number_system_input_data_converting/to_decimal_value_converting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_converting/number_system_input_data_converting/to_hexadecimal_value_converting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_converting/number_system_input_data_converting/to_octal_value_converting_transaction_script.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/number_system_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/domain/number_system_converter/number_system.dart";
import "package:nove/domain/number_system_converter/binary_number_system_entity.dart";
import "package:nove/domain/number_system_converter/octal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/decimal_number_system_entity.dart";
import "package:nove/domain/number_system_converter/hexadecimal_number_system_entity.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/widgets/input.dart";

class NumberSystemInput extends StatelessWidget {
  final int numberSystemInputIndex;
  final NumberSystemConverterViewModel numberSystemConverterViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController controller;
  final FocusNode focusNode;

  const NumberSystemInput({
    super.key,
    required this.numberSystemInputIndex,
    required this.numberSystemConverterViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: numberSystemConverterViewModel.baseNumberSystemIndex,
      builder: (_, baseNumberSystemIndex, _) {
        return ValueListenableBuilder(
          valueListenable: numberSystemConverterViewModel.listOfNumberSystems,
          builder: (_, listOfNumberSystems, _) {
            return Column(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      deviceLanguageStringsViewModel.deviceLanguageStrings,
                  builder: (_, deviceLanguageStrings, _) {
                    final dropdownMenuItemDescriptionHolder =
                        NumberSystemDropdownMenuDescriptionSelector.getNumberSystemDropdownMenuDescription(
                          listOfNumberSystems[numberSystemInputIndex]
                              .measureUnit,
                          deviceLanguageStrings,
                        );

                    return Row(
                      children: [
                        isControllerNotTheFirst(numberSystemInputIndex)
                            ? InputActionButton(
                                icon: Symbols.close_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  numberSystemConverterViewModel
                                      .removeNumberSystem(
                                        numberSystemInputIndex,
                                      );
                                },
                              )
                            : const SizedBox(width: 56),
                        const SizedBox(width: 13),
                        Checkbox(
                          isChecked: isItemTheBaseMeasureUnit(
                            baseNumberSystemIndex,
                            numberSystemInputIndex,
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
                            numberSystemConverterViewModel
                                .updateBaseNumberSystemIndex(
                                  numberSystemInputIndex,
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
                                .NUMBER_SYSTEM_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                            items: [
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .BINARY_NUMBER_SYSTEM_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .BINARY_NUMBER_SYSTEM_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .BINARY_NUMBER_SYSTEM_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  numberSystemConverterViewModel
                                      .listOfNumberSystems
                                      .value[numberSystemInputIndex]
                                      .measureUnit
                                      .index,
                                  NumberSystem.BINARY.index,
                                ),
                                onTap: () {
                                  final String convertedNumberSystemValue =
                                      ToBinaryValueConvertingTransactionScript.getConvertedToBinaryValue(
                                        numberSystemConverterViewModel
                                            .listOfNumberSystems
                                            .value[numberSystemInputIndex]
                                            .measureUnit,
                                        numberSystemConverterViewModel
                                            .listOfNumberSystems
                                            .value[numberSystemInputIndex]
                                            .value,
                                      );
                                  final updatedNumberSystem =
                                      BinaryNumberSystemEntity(
                                        convertedNumberSystemValue,
                                      );

                                  numberSystemConverterViewModel
                                      .updateNumberSystemAt(
                                        updatedNumberSystem,
                                        numberSystemInputIndex,
                                      );

                                  controller.text = updatedNumberSystem.value;
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .OCTAL_NUMBER_SYSTEM_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .OCTAL_NUMBER_SYSTEM_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .OCTAL_NUMBER_SYSTEM_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  numberSystemConverterViewModel
                                      .listOfNumberSystems
                                      .value[numberSystemInputIndex]
                                      .measureUnit
                                      .index,
                                  NumberSystem.OCTAL.index,
                                ),
                                onTap: () {
                                  final String convertedNumberSystemValue =
                                      ToOctalValueConvertingTransactionScript.getConvertedToOctalValue(
                                        numberSystemConverterViewModel
                                            .listOfNumberSystems
                                            .value[numberSystemInputIndex]
                                            .measureUnit,
                                        numberSystemConverterViewModel
                                            .listOfNumberSystems
                                            .value[numberSystemInputIndex]
                                            .value,
                                      );
                                  final updatedNumberSystem =
                                      OctalNumberSystemEntity(
                                        convertedNumberSystemValue,
                                      );

                                  numberSystemConverterViewModel
                                      .updateNumberSystemAt(
                                        updatedNumberSystem,
                                        numberSystemInputIndex,
                                      );

                                  controller.text = updatedNumberSystem.value;
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .DECIMAL_NUMBER_SYSTEM_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .DECIMAL_NUMBER_SYSTEM_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .DECIMAL_NUMBER_SYSTEM_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  numberSystemConverterViewModel
                                      .listOfNumberSystems
                                      .value[numberSystemInputIndex]
                                      .measureUnit
                                      .index,
                                  NumberSystem.DECIMAL.index,
                                ),
                                onTap: () {
                                  final String convertedNumberSystemValue =
                                      ToDecimalValueConvertingTransactionScript.getConvertedToDecimalValue(
                                        numberSystemConverterViewModel
                                            .listOfNumberSystems
                                            .value[numberSystemInputIndex]
                                            .measureUnit,
                                        numberSystemConverterViewModel
                                            .listOfNumberSystems
                                            .value[numberSystemInputIndex]
                                            .value,
                                      );
                                  final updatedNumberSystem =
                                      DecimalNumberSystemEntity(
                                        convertedNumberSystemValue,
                                      );

                                  numberSystemConverterViewModel
                                      .updateNumberSystemAt(
                                        updatedNumberSystem,
                                        numberSystemInputIndex,
                                      );

                                  controller.text = updatedNumberSystem.value;
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings
                                    .HEXADECIMAL_NUMBER_SYSTEM_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .HEXADECIMAL_NUMBER_SYSTEM_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .HEXADECIMAL_NUMBER_SYSTEM_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  numberSystemConverterViewModel
                                      .listOfNumberSystems
                                      .value[numberSystemInputIndex]
                                      .measureUnit
                                      .index,
                                  NumberSystem.HEXADECIMAL.index,
                                ),
                                onTap: () {
                                  final String convertedNumberSystemValue =
                                      ToHexadecimalValueConvertingTransactionScript.getConvertedToHexadecimalValue(
                                        numberSystemConverterViewModel
                                            .listOfNumberSystems
                                            .value[numberSystemInputIndex]
                                            .measureUnit,
                                        numberSystemConverterViewModel
                                            .listOfNumberSystems
                                            .value[numberSystemInputIndex]
                                            .value,
                                      );
                                  final updatedNumberSystem =
                                      HexadecimalNumberSystemEntity(
                                        convertedNumberSystemValue,
                                      );

                                  numberSystemConverterViewModel
                                      .updateNumberSystemAt(
                                        updatedNumberSystem,
                                        numberSystemInputIndex,
                                      );

                                  controller.text = updatedNumberSystem.value;
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
                            type:
                                isNumberSystemHexadecimal(
                                  numberSystemConverterViewModel
                                      .listOfNumberSystems
                                      .value[numberSystemInputIndex]
                                      .measureUnit,
                                )
                                ? TextInputType.text
                                : TextInputType.number,
                            focusNode: focusNode,
                            onChanged: (updatedValue) {
                              NumberSystemInputValueUpdatingParser.updateNumberSystemValue(
                                controller,
                                numberSystemConverterViewModel
                                    .listOfNumberSystems
                                    .value[numberSystemInputIndex]
                                    .measureUnit,
                                (value) {
                                  numberSystemConverterViewModel
                                      .updateNumberSystemAt(
                                        value,
                                        numberSystemInputIndex,
                                      );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 13),
                        isControllerNotTheLast(
                              numberSystemInputIndex,
                              numberSystemConverterViewModel
                                  .listOfNumberSystems
                                  .value
                                  .length,
                            )
                            ? InputActionButton(
                                icon: Symbols.add_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .ADD_NUMBER_SYSTEM_NEXT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .ADD_NUMBER_SYSTEM_NEXT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  numberSystemConverterViewModel
                                      .addNumberSystemAt(
                                        numberSystemInputIndex + 1,
                                      );
                                },
                              )
                            : const SizedBox(width: 56),
                      ],
                    );
                  },
                ),
                isControllerNotTheLast(
                      numberSystemInputIndex,
                      numberSystemConverterViewModel
                          .listOfNumberSystems
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
