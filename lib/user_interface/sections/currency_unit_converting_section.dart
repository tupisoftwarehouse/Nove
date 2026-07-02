import "dart:async";
import "package:flutter/widgets.dart" hide Router, Orientation;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/measure_unit_converter_constants.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/compositions/currency_unit_input.dart";
import "package:nove/user_interface/compositions/end_screen_padding.dart";
import "package:nove/user_interface/compositions/lower_third_content.dart";
import "package:nove/user_interface/compositions/scaffold_heading.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/specific/list_of_currency_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/specific/list_of_currency_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:nove/user_interface/view_models/currency_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/widgets/icon_button.dart";
import "package:nove/user_interface/widgets/scaffold.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";
import "package:nove/user_interface/widgets/snackbar.dart";

class CurrencyUnitConvertingSection extends StatefulWidget {
  final DeviceLanguageStringsViewModel deviceLanguageStringsViewModel;
  final CurrencyUnitConverterViewModel currencyUnitConverterViewModel;
  final Router router;

  const CurrencyUnitConvertingSection({
    super.key,
    required this.deviceLanguageStringsViewModel,
    required this.currencyUnitConverterViewModel,
    required this.router,
  });

  @override
  State<CurrencyUnitConvertingSection> createState() {
    return _CurrencyUnitConvertingSectionState();
  }
}

class _CurrencyUnitConvertingSectionState
    extends State<CurrencyUnitConvertingSection> {
  late final ThemeViewModel _themeViewModel;
  late final ValueNotifier<List<CurrencyUnitInput>> _listOfCurrencyUnitInputs;
  late final GlobalKey _bottomPanelKey;
  late final ValueNotifier<double> _bottomPanelHeight;
  late final ValueNotifier<bool> _isSnackbarShown;
  Timer? _snackbarHidingTimer;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();

    _listOfCurrencyUnitInputs = ValueNotifier([]);

    _bottomPanelKey = GlobalKey();

    _bottomPanelHeight = ValueNotifier(0);

    _isSnackbarShown = ValueNotifier<bool>(false);

    ListOfCurrencyUnitInputDataLoadingTransactionScript.loadListOfCurrencyUnitInputData(
      _listOfCurrencyUnitInputs,
      widget.currencyUnitConverterViewModel,
      widget.deviceLanguageStringsViewModel,
    );

    widget.currencyUnitConverterViewModel.listOfCurrencyUnits.addListener(() {
      if (isListOfMeasureUnitsResized(
        widget.currencyUnitConverterViewModel.listOfCurrencyUnits.value.length,
        _listOfCurrencyUnitInputs.value.length,
      )) {
        ListOfCurrencyUnitInputDataLoadingTransactionScript.loadListOfCurrencyUnitInputData(
          _listOfCurrencyUnitInputs,
          widget.currencyUnitConverterViewModel,
          widget.deviceLanguageStringsViewModel,
        );
      } else {
        ListOfCurrencyUnitInputDataUpdatingTransactionScript.updateListOfCurrencyUnitInputData(
          _listOfCurrencyUnitInputs,
          widget.currencyUnitConverterViewModel,
          widget.deviceLanguageStringsViewModel,
        );
      }
    });

    widget.currencyUnitConverterViewModel.baseCurrencyUnitIndex.addListener(() {
      ListOfCurrencyUnitInputDataUpdatingTransactionScript.updateListOfCurrencyUnitInputData(
        _listOfCurrencyUnitInputs,
        widget.currencyUnitConverterViewModel,
        widget.deviceLanguageStringsViewModel,
      );
    });

    SnackbarHiddenTimerCancellingListenerSettingTransactionScript.setSnackbarHiddenTimerCancellingListener(
      _isSnackbarShown,
      _snackbarHidingTimer,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bottomPanelRenderBox =
          _bottomPanelKey.currentContext!.findRenderObject() as RenderBox;

      _bottomPanelHeight.value = bottomPanelRenderBox.size.height;
    });
  }

  @override
  void dispose() {
    super.dispose();

    widget.currencyUnitConverterViewModel.disposeConverterCurrencyValues();
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;

    return ValueListenableBuilder(
      valueListenable:
          widget.currencyUnitConverterViewModel.currentCurrencyValues,
      builder: (_, currentCurrencyValues, _) {
        return ValueListenableBuilder(
          valueListenable:
              widget.deviceLanguageStringsViewModel.deviceLanguageStrings,
          builder: (_, deviceLanguageStrings, _) {
            final currencyUpdatedAtTimestampPhrase =
                PhraseResolver.getCurrentCurrencyValuesUpdatedAtTimePhrase(
                  currentCurrencyValues.updatedAt,
                  deviceLanguageStrings,
                );

            return Stack(
              children: [
                Scaffold(
                  onBackButtonTap: () {
                    widget.router.navigateBack(context);
                  },
                  actionButtons: [
                    ValueListenableBuilder(
                      valueListenable: widget
                          .currencyUnitConverterViewModel
                          .listOfCurrencyUnits,
                      builder: (_, listOfCurrencyUnits, _) {
                        return AnimatedScale(
                          scale: isConverterUnchanged(listOfCurrencyUnits)
                              ? 0
                              : 1,
                          duration: AnimationDuration.SHORT.value,
                          curve: Curves.easeInOutCirc,
                          child: ActionButton(
                            icon: Symbols.history_2_rounded,
                            tooltipMessage: deviceLanguageStrings
                                .RESET_BUTTON_TOOLTIP_MESSAGE,
                            accessibilityLabel: deviceLanguageStrings
                                .RESET_BUTTON_ACCESSIBILITY_LABEL,
                            onTap: () {
                              widget.currencyUnitConverterViewModel.reset();

                              _listOfCurrencyUnitInputs
                                      .value
                                      .first
                                      .controller
                                      .text =
                                  ZEROED_VALUE;

                              _isSnackbarShown.value = true;
                            },
                          ),
                        );
                      },
                    ),
                  ],
                  body: LayoutBuilder(
                    builder: (_, constraints) {
                      return Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ScaffoldHeading(
                                    title: deviceLanguageStrings
                                        .CURRENCY_UNIT_CONVERTER_UTILITY_NAME,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      minHeight: constraints.maxHeight - 398,
                                    ),
                                    padding: EdgeInsetsGeometry.only(
                                      bottom: viewInsets.bottom,
                                    ),
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minWidth: 572,
                                          maxWidth: 1280,
                                        ),
                                        width: constraints.maxWidth,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.only(
                                                left: 86,
                                                bottom: 6,
                                              ),
                                              child: ValueListenableBuilder(
                                                valueListenable:
                                                    _themeViewModel.theme,
                                                builder: (_, theme, _) {
                                                  return Text(
                                                    "${deviceLanguageStrings.BASE_UNIT_LABEL}:",
                                                    style: PARAGRAPH_12_MEDIUM(
                                                      theme.iconEmphasis4Color,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            ValueListenableBuilder(
                                              valueListenable:
                                                  _listOfCurrencyUnitInputs,
                                              builder:
                                                  (
                                                    _,
                                                    listOfCurrencyUnitInputs,
                                                    _,
                                                  ) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                            left: 16,
                                                            right: 16,
                                                            bottom: 16,
                                                          ),
                                                      child: Column(
                                                        children:
                                                            listOfCurrencyUnitInputs,
                                                      ),
                                                    );
                                                  },
                                            ),
                                            const EndScreenPadding(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: _bottomPanelHeight,
                            builder: (_, bottomPanelHeight, _) {
                              return SizedBox(height: bottomPanelHeight);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                LowerThirdContent(
                  isPadded: false,
                  child: ValueListenableBuilder(
                    valueListenable: _themeViewModel.theme,
                    builder: (_, theme, _) {
                      return Container(
                        key: _bottomPanelKey,
                        decoration: BoxDecoration(
                          color: theme.surface.backgroundColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(
                              color: theme.elevatedSurface.borderColor,
                              orientation: Orientation.HORIZONTAL,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  const SizedBox(height: 9),
                                  Text(
                                    deviceLanguageStrings
                                        .CURRENT_CURRENCY_VALUES_LAST_UPDATED_AT_DESCRIPTION,
                                    style: HEADING_5(theme.textEmphasis9Color),
                                  ),
                                  const SizedBox(height: 4.5),
                                  Text(
                                    currencyUpdatedAtTimestampPhrase,
                                    style: HEADING_5(theme.textEmphasis9Color),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 16,
                              ),
                              child: IconButton(
                                icon: Symbols.add_rounded,
                                title: deviceLanguageStrings.ADD_BUTTON_TITLE,
                                accessibilityLabel: deviceLanguageStrings
                                    .ADD_UNIT_BUTTON_ACCESSIBILITY_LABEL,
                                onTap: widget
                                    .currencyUnitConverterViewModel
                                    .addCurrencyUnit,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                LowerThirdContent(
                  isPadded: true,
                  child: ValueListenableBuilder(
                    valueListenable: _isSnackbarShown,
                    builder: (_, isSnackbarShown, _) {
                      return isSnackbarShown
                          ? Snackbar(
                              message: deviceLanguageStrings
                                  .RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_MESSAGE,
                              description: deviceLanguageStrings
                                  .RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_DESCRIPTION,
                              icon: Symbols.settings_backup_restore_rounded,
                              buttonAccessibilityLabel: deviceLanguageStrings
                                  .RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_ACCESSIBILITY_LABEL,
                              buttonTooltipMessage: deviceLanguageStrings
                                  .RESTORE_DELETED_LIST_OF_CURRENCY_UNITS_BUTTON_TOOLTIP_MESSAGE,
                              onTap: () {
                                widget.currencyUnitConverterViewModel.restore();

                                SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
                                  _snackbarHidingTimer,
                                  _isSnackbarShown,
                                );
                              },
                              onTimeout: () {
                                widget.currencyUnitConverterViewModel
                                    .dismissRecovery();

                                _isSnackbarShown.value = false;
                              },
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
