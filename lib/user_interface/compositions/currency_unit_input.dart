import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/dropdown_menu_description_selectors/currency_unit_dropdown_menu_description_selector.dart";
import "package:nove/user_interface/internals/measure_unit_input_utilities/input_value_updating_parsers/currency_unit_input_value_updating_parser.dart";
import "package:nove/user_interface/widgets/input_action_button.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/domain/currency_unit_converter/currency_unit.dart";
import "package:nove/domain/currency_unit_converter/australia_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/brazil_real_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/canada_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/euro_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_kingdom_pound_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/new_zealand_dollar_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/switzerland_franc_unit_entity.dart";
import "package:nove/domain/currency_unit_converter/united_states_dollar_unit_entity.dart";
import "package:nove/user_interface/widgets/checkbox.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu.dart";
import "package:nove/user_interface/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:nove/user_interface/widgets/input.dart";

class CurrencyUnitInput extends StatelessWidget {
  final int currencyUnitInputIndex;
  final CurrencyUnitConverterViewModel currencyUnitConverterViewModel;
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final TextEditingController controller;
  final FocusNode focusNode;

  const CurrencyUnitInput({
    super.key,
    required this.currencyUnitInputIndex,
    required this.currencyUnitConverterViewModel,
    required this.deviceLanguageStringsViewModel,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: currencyUnitConverterViewModel.baseCurrencyUnitIndex,
      builder: (_, baseCurrencyUnitIndex, _) {
        return ValueListenableBuilder(
          valueListenable: currencyUnitConverterViewModel.listOfCurrencyUnits,
          builder: (_, listOfCurrencyUnits, _) {
            return Column(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      deviceLanguageStringsViewModel.deviceLanguageStrings,
                  builder: (_, deviceLanguageStrings, _) {
                    final dropdownMenuItemDescriptionHolder =
                        CurrencyUnitDropdownMenuDescriptionSelector.getCurrencyUnitDropdownMenuDescription(
                          listOfCurrencyUnits[currencyUnitInputIndex]
                              .measureUnit,
                          deviceLanguageStrings,
                        );

                    return ValueListenableBuilder(
                      valueListenable:
                          currencyUnitConverterViewModel.currentCurrencyValues,
                      builder: (_, currentCurrencyValues, _) {
                        return Row(
                          children: [
                            isControllerNotTheFirst(currencyUnitInputIndex)
                                ? InputActionButton(
                                    icon: Symbols.close_rounded,
                                    tooltipMessage: deviceLanguageStrings
                                        .REMOVE_UNIT_BUTTON_TOOLTIP_MESSAGE,
                                    accessibilityLabel: deviceLanguageStrings
                                        .REMOVE_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                    onTap: () {
                                      currencyUnitConverterViewModel
                                          .removeCurrencyUnit(
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  )
                                : const SizedBox(width: 56),
                            const SizedBox(width: 13),
                            Checkbox(
                              isChecked: isItemTheBaseMeasureUnit(
                                baseCurrencyUnitIndex,
                                currencyUnitInputIndex,
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
                                currencyUnitConverterViewModel
                                    .updateBaseCurrencyUnitIndex(
                                      currencyUnitInputIndex,
                                    );
                              },
                            ),
                            const SizedBox(width: 13),
                            SizedBox(
                              width: 171,
                              child: DropdownMenu(
                                selectedItemShortcut:
                                    dropdownMenuItemDescriptionHolder
                                        .abbreviation,
                                accessibilityLabel: deviceLanguageStrings
                                    .CURRENCY_UNIT_DROPDOWN_MENU_ACCESSIBILITY_LABEL,
                                items: [
                                  DropdownMenuItem(
                                    label: deviceLanguageStrings
                                        .UNITED_STATES_DOLLAR_UNIT_LABEL,
                                    abbreviation: CURRENCY_ITEM_DESCRIPTION(
                                      deviceLanguageStrings
                                          .UNITED_STATES_DOLLAR_UNIT_ABBREVIATION,
                                      1,
                                    ),
                                    accessibilityLabel: deviceLanguageStrings
                                        .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                          deviceLanguageStrings
                                              .UNITED_STATES_DOLLAR_UNIT_LABEL,
                                        ),
                                    isSelected: isItemSelected(
                                      currencyUnitConverterViewModel
                                          .listOfCurrencyUnits
                                          .value[currencyUnitInputIndex]
                                          .measureUnit
                                          .index,
                                      CurrencyUnit.UNITED_STATES_DOLLAR.index,
                                    ),
                                    onTap: () {
                                      final updatedCurrencyUnit =
                                          UnitedStatesDollarUnitEntity(
                                            currencyUnitConverterViewModel
                                                .listOfCurrencyUnits
                                                .value[currencyUnitInputIndex]
                                                .value,
                                          );

                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            updatedCurrencyUnit,
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  ),
                                  DropdownMenuItem(
                                    label: deviceLanguageStrings
                                        .UNITED_KINGDOM_POUND_UNIT_LABEL,
                                    abbreviation: CURRENCY_ITEM_DESCRIPTION(
                                      deviceLanguageStrings
                                          .UNITED_KINGDOM_POUND_UNIT_ABBREVIATION,
                                      currentCurrencyValues
                                          .currencyValues
                                          .unitedKingdomPound,
                                    ),
                                    accessibilityLabel: deviceLanguageStrings
                                        .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                          deviceLanguageStrings
                                              .UNITED_KINGDOM_POUND_UNIT_LABEL,
                                        ),
                                    isSelected: isItemSelected(
                                      currencyUnitConverterViewModel
                                          .listOfCurrencyUnits
                                          .value[currencyUnitInputIndex]
                                          .measureUnit
                                          .index,
                                      CurrencyUnit.UNITED_KINGDOM_POUND.index,
                                    ),
                                    onTap: () {
                                      final updatedCurrencyUnit =
                                          UnitedKingdomPoundUnitEntity(
                                            currencyUnitConverterViewModel
                                                .listOfCurrencyUnits
                                                .value[currencyUnitInputIndex]
                                                .value,
                                          );

                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            updatedCurrencyUnit,
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  ),
                                  DropdownMenuItem(
                                    label: deviceLanguageStrings
                                        .SWITZERLAND_FRANC_UNIT_LABEL,
                                    abbreviation: CURRENCY_ITEM_DESCRIPTION(
                                      deviceLanguageStrings
                                          .SWITZERLAND_FRANC_UNIT_ABBREVIATION,
                                      currentCurrencyValues
                                          .currencyValues
                                          .switzerlandFranc,
                                    ),
                                    accessibilityLabel: deviceLanguageStrings
                                        .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                          deviceLanguageStrings
                                              .SWITZERLAND_FRANC_UNIT_LABEL,
                                        ),
                                    isSelected: isItemSelected(
                                      currencyUnitConverterViewModel
                                          .listOfCurrencyUnits
                                          .value[currencyUnitInputIndex]
                                          .measureUnit
                                          .index,
                                      CurrencyUnit.SWITZERLAND_FRANC.index,
                                    ),
                                    onTap: () {
                                      final updatedCurrencyUnit =
                                          SwitzerlandFrancUnitEntity(
                                            currencyUnitConverterViewModel
                                                .listOfCurrencyUnits
                                                .value[currencyUnitInputIndex]
                                                .value,
                                          );

                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            updatedCurrencyUnit,
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  ),
                                  DropdownMenuItem(
                                    label: deviceLanguageStrings
                                        .AUSTRALIA_DOLLAR_UNIT_LABEL,
                                    abbreviation: CURRENCY_ITEM_DESCRIPTION(
                                      deviceLanguageStrings
                                          .AUSTRALIA_DOLLAR_UNIT_ABBREVIATION,
                                      currentCurrencyValues
                                          .currencyValues
                                          .australiaDollar,
                                    ),
                                    accessibilityLabel: deviceLanguageStrings
                                        .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                          deviceLanguageStrings
                                              .AUSTRALIA_DOLLAR_UNIT_LABEL,
                                        ),
                                    isSelected: isItemSelected(
                                      currencyUnitConverterViewModel
                                          .listOfCurrencyUnits
                                          .value[currencyUnitInputIndex]
                                          .measureUnit
                                          .index,
                                      CurrencyUnit.AUSTRALIA_DOLLAR.index,
                                    ),
                                    onTap: () {
                                      final updatedCurrencyUnit =
                                          AustraliaDollarUnitEntity(
                                            currencyUnitConverterViewModel
                                                .listOfCurrencyUnits
                                                .value[currencyUnitInputIndex]
                                                .value,
                                          );

                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            updatedCurrencyUnit,
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  ),
                                  DropdownMenuItem(
                                    label: deviceLanguageStrings
                                        .BRAZIL_REAL_UNIT_LABEL,
                                    abbreviation: CURRENCY_ITEM_DESCRIPTION(
                                      deviceLanguageStrings
                                          .BRAZIL_REAL_UNIT_ABBREVIATION,
                                      currentCurrencyValues
                                          .currencyValues
                                          .brazilReal,
                                    ),
                                    accessibilityLabel: deviceLanguageStrings
                                        .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                          deviceLanguageStrings
                                              .BRAZIL_REAL_UNIT_LABEL,
                                        ),
                                    isSelected: isItemSelected(
                                      currencyUnitConverterViewModel
                                          .listOfCurrencyUnits
                                          .value[currencyUnitInputIndex]
                                          .measureUnit
                                          .index,
                                      CurrencyUnit.BRAZIL_REAL.index,
                                    ),
                                    onTap: () {
                                      final updatedCurrencyUnit =
                                          BrazilRealUnitEntity(
                                            currencyUnitConverterViewModel
                                                .listOfCurrencyUnits
                                                .value[currencyUnitInputIndex]
                                                .value,
                                          );

                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            updatedCurrencyUnit,
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  ),
                                  DropdownMenuItem(
                                    label: deviceLanguageStrings
                                        .CANADA_DOLLAR_UNIT_LABEL,
                                    abbreviation: CURRENCY_ITEM_DESCRIPTION(
                                      deviceLanguageStrings
                                          .CANADA_DOLLAR_UNIT_ABBREVIATION,
                                      currentCurrencyValues
                                          .currencyValues
                                          .canadaDollar,
                                    ),
                                    accessibilityLabel: deviceLanguageStrings
                                        .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                          deviceLanguageStrings
                                              .CANADA_DOLLAR_UNIT_LABEL,
                                        ),
                                    isSelected: isItemSelected(
                                      currencyUnitConverterViewModel
                                          .listOfCurrencyUnits
                                          .value[currencyUnitInputIndex]
                                          .measureUnit
                                          .index,
                                      CurrencyUnit.CANADA_DOLLAR.index,
                                    ),
                                    onTap: () {
                                      final updatedCurrencyUnit =
                                          CanadaDollarUnitEntity(
                                            currencyUnitConverterViewModel
                                                .listOfCurrencyUnits
                                                .value[currencyUnitInputIndex]
                                                .value,
                                          );

                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            updatedCurrencyUnit,
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  ),
                                  DropdownMenuItem(
                                    label: deviceLanguageStrings
                                        .NEW_ZEALAND_DOLLAR_UNIT_LABEL,
                                    abbreviation: CURRENCY_ITEM_DESCRIPTION(
                                      deviceLanguageStrings
                                          .NEW_ZEALAND_DOLLAR_UNIT_ABBREVIATION,
                                      currentCurrencyValues
                                          .currencyValues
                                          .newZealandDollar,
                                    ),
                                    accessibilityLabel: deviceLanguageStrings
                                        .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                          deviceLanguageStrings
                                              .NEW_ZEALAND_DOLLAR_UNIT_LABEL,
                                        ),
                                    isSelected: isItemSelected(
                                      currencyUnitConverterViewModel
                                          .listOfCurrencyUnits
                                          .value[currencyUnitInputIndex]
                                          .measureUnit
                                          .index,
                                      CurrencyUnit.NEW_ZEALAND_DOLLAR.index,
                                    ),
                                    onTap: () {
                                      final updatedCurrencyUnit =
                                          NewZealandDollarUnitEntity(
                                            currencyUnitConverterViewModel
                                                .listOfCurrencyUnits
                                                .value[currencyUnitInputIndex]
                                                .value,
                                          );

                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            updatedCurrencyUnit,
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  ),
                                  DropdownMenuItem(
                                    label:
                                        deviceLanguageStrings.EURO_UNIT_LABEL,
                                    abbreviation: CURRENCY_ITEM_DESCRIPTION(
                                      deviceLanguageStrings
                                          .EURO_UNIT_ABBREVIATION,
                                      currentCurrencyValues.currencyValues.euro,
                                    ),
                                    accessibilityLabel: deviceLanguageStrings
                                        .SELECT_UNIT_ELEMENT_ACCESSIBILITY_LABEL(
                                          deviceLanguageStrings.EURO_UNIT_LABEL,
                                        ),
                                    isSelected: isItemSelected(
                                      currencyUnitConverterViewModel
                                          .listOfCurrencyUnits
                                          .value[currencyUnitInputIndex]
                                          .measureUnit
                                          .index,
                                      CurrencyUnit.EURO.index,
                                    ),
                                    onTap: () {
                                      final updatedCurrencyUnit =
                                          EuroUnitEntity(
                                            currencyUnitConverterViewModel
                                                .listOfCurrencyUnits
                                                .value[currencyUnitInputIndex]
                                                .value,
                                          );

                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            updatedCurrencyUnit,
                                            currencyUnitInputIndex,
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
                                  CurrencyUnitInputValueUpdatingParser.updateCurrencyUnitValue(
                                    controller,
                                    currencyUnitConverterViewModel
                                        .listOfCurrencyUnits
                                        .value[currencyUnitInputIndex]
                                        .measureUnit,
                                    currentCurrencyValues.currencyValues,
                                    (value) {
                                      currencyUnitConverterViewModel
                                          .updateCurrencyUnitAt(
                                            value,
                                            currencyUnitInputIndex,
                                          );
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 13),
                            isControllerNotTheLast(
                                  currencyUnitInputIndex,
                                  currencyUnitConverterViewModel
                                      .listOfCurrencyUnits
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
                                      currencyUnitConverterViewModel
                                          .addCurrencyUnitAt(
                                            currencyUnitInputIndex + 1,
                                          );
                                    },
                                  )
                                : const SizedBox(width: 56),
                          ],
                        );
                      },
                    );
                  },
                ),
                isControllerNotTheLast(
                      currencyUnitInputIndex,
                      currencyUnitConverterViewModel
                          .listOfCurrencyUnits
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
