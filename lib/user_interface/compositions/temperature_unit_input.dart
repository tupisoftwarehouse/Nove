import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/temperature_unit_dropdown_menu_description_selector.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/temperature_unit_input_value_updating_parser.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/temperature_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/domain/temperature_unit_converter/temperature_unit.dart";
import "package:nove/domain/temperature_unit_converter/celsius_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/fahrenheit_unit_entity.dart";
import "package:nove/domain/temperature_unit_converter/kelvin_unit_entity.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/widgets/input.dart";

class TemperatureUnitInput extends StatelessWidget {
  final int temperatureUnitInputIndex;
  final TemperatureUnitConverterViewModel temperatureUnitConverterViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController controller;
  final FocusNode focusNode;

  const TemperatureUnitInput({
    super.key,
    required this.temperatureUnitInputIndex,
    required this.temperatureUnitConverterViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable:
          temperatureUnitConverterViewModel.baseTemperatureUnitIndex,
      builder: (_, baseTemperatureUnitIndex, _) {
        return ValueListenableBuilder(
          valueListenable:
              temperatureUnitConverterViewModel.listOfTemperatureUnits,
          builder: (_, listOfTemperatureUnits, _) {
            return Column(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      deviceLanguageStringsViewModel.deviceLanguageStrings,
                  builder: (_, deviceLanguageStrings, _) {
                    final dropdownMenuItemDescriptionHolder =
                        TemperatureUnitDropdownMenuDescriptionSelector.getTemperatureUnitDropdownMenuDescription(
                          listOfTemperatureUnits[temperatureUnitInputIndex]
                              .measureUnit,
                          deviceLanguageStrings,
                        );

                    return Row(
                      children: [
                        isControllerNotTheFirst(temperatureUnitInputIndex)
                            ? InputActionButton(
                                icon: Symbols.close_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  temperatureUnitConverterViewModel
                                      .removeTemperatureUnit(
                                        temperatureUnitInputIndex,
                                      );
                                },
                              )
                            : const SizedBox(width: 56),
                        const SizedBox(width: 13),
                        Checkbox(
                          isChecked: isItemTheBaseMeasureUnit(
                            baseTemperatureUnitIndex,
                            temperatureUnitInputIndex,
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
                            temperatureUnitConverterViewModel
                                .updateBaseTemperatureUnitIndex(
                                  temperatureUnitInputIndex,
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
                                .TEMPERATURE_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                            items: [
                              DropdownMenuItem(
                                label: deviceLanguageStrings.CELSIUS_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .CELSIUS_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.CELSIUS_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  listOfTemperatureUnits[temperatureUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TemperatureUnit.CELSIUS.index,
                                ),
                                onTap: () {
                                  temperatureUnitConverterViewModel
                                      .updateTemperatureUnitAt(
                                        CelsiusUnitEntity(
                                          listOfTemperatureUnits[temperatureUnitInputIndex]
                                              .value,
                                        ),
                                        temperatureUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label:
                                    deviceLanguageStrings.FAHRENHEIT_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .FAHRENHEIT_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings
                                          .FAHRENHEIT_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  listOfTemperatureUnits[temperatureUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TemperatureUnit.FAHRENHEIT.index,
                                ),
                                onTap: () {
                                  temperatureUnitConverterViewModel
                                      .updateTemperatureUnitAt(
                                        FahrenheitUnitEntity(
                                          listOfTemperatureUnits[temperatureUnitInputIndex]
                                              .value,
                                        ),
                                        temperatureUnitInputIndex,
                                      );
                                },
                              ),
                              DropdownMenuItem(
                                label: deviceLanguageStrings.KELVIN_UNIT_LABEL,
                                abbreviation: deviceLanguageStrings
                                    .KELVIN_UNIT_ABBREVIATION,
                                accessibilityLabel: deviceLanguageStrings
                                    .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                      deviceLanguageStrings.KELVIN_UNIT_LABEL,
                                    ),
                                isSelected: isItemSelected(
                                  listOfTemperatureUnits[temperatureUnitInputIndex]
                                      .measureUnit
                                      .index,
                                  TemperatureUnit.KELVIN.index,
                                ),
                                onTap: () {
                                  temperatureUnitConverterViewModel
                                      .updateTemperatureUnitAt(
                                        KelvinUnitEntity(
                                          listOfTemperatureUnits[temperatureUnitInputIndex]
                                              .value,
                                        ),
                                        temperatureUnitInputIndex,
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
                            onChanged: (_) {
                              TemperatureUnitInputValueUpdatingParser.updateTemperatureUnitValue(
                                controller,
                                listOfTemperatureUnits[temperatureUnitInputIndex]
                                    .measureUnit,
                                (value) {
                                  temperatureUnitConverterViewModel
                                      .updateTemperatureUnitAt(
                                        value,
                                        temperatureUnitInputIndex,
                                      );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 13),
                        isControllerNotTheLast(
                              temperatureUnitInputIndex,
                              listOfTemperatureUnits.length,
                            )
                            ? InputActionButton(
                                icon: Symbols.add_rounded,
                                tooltipMessage: deviceLanguageStrings
                                    .ADD_UNIT_NEXT_BUTTON_TOOLTIP_MESSAGE,
                                accessibilityLabel: deviceLanguageStrings
                                    .ADD_UNIT_NEXT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: () {
                                  temperatureUnitConverterViewModel
                                      .addTemperatureUnitAt(
                                        temperatureUnitInputIndex + 1,
                                      );
                                },
                              )
                            : const SizedBox(width: 56),
                      ],
                    );
                  },
                ),
                isControllerNotTheLast(
                      temperatureUnitInputIndex,
                      listOfTemperatureUnits.length,
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
