import "dart:async";
import "package:flutter/widgets.dart" hide Router, Orientation;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/measure_unit_converter_constants.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/compositions/end_screen_padding.dart";
import "package:nove/user_interface/compositions/length_unit_input.dart";
import "package:nove/user_interface/compositions/lower_third_content.dart";
import "package:nove/user_interface/compositions/scaffold_heading.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_loading/specific/list_of_length_unit_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/measure_unit_inputs_handling/input_data_updating/specific/list_of_length_unit_input_data_updating_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:nove/user_interface/view_models/length_unit_converter_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/widgets/icon_button.dart";
import "package:nove/user_interface/widgets/scaffold.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";
import "package:nove/user_interface/widgets/snackbar.dart";

class LengthUnitConverterScreen extends StatefulWidget {
  final LengthUnitConverterViewModel lengthUnitConverterViewModel;
  final Router router;

  const LengthUnitConverterScreen({
    super.key,
    required this.lengthUnitConverterViewModel,
    required this.router,
  });

  @override
  State<LengthUnitConverterScreen> createState() {
    return _LengthUnitConverterScreenState();
  }
}

class _LengthUnitConverterScreenState extends State<LengthUnitConverterScreen> {
  late final ThemeViewModel _themeViewModel;
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final ValueNotifier<List<LengthUnitInput>> _listOfLengthUnitInputs;
  late final GlobalKey _bottomPanelKey;
  late final ValueNotifier<double> _bottomPanelHeight;
  late final ValueNotifier<bool> _isSnackbarShown;
  Timer? _snackbarHidingTimer;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();

    _deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();

    _listOfLengthUnitInputs = ValueNotifier([]);

    _bottomPanelKey = GlobalKey();

    _bottomPanelHeight = ValueNotifier(0);

    _isSnackbarShown = ValueNotifier<bool>(false);

    ListOfLengthUnitInputDataLoadingTransactionScript.loadListOfLengthUnitInputData(
      _listOfLengthUnitInputs,
      widget.lengthUnitConverterViewModel,
      _deviceLanguageStringsViewModel,
    );

    widget.lengthUnitConverterViewModel.listOfLengthUnits.addListener(() {
      if (isListOfMeasureUnitsResized(
        widget.lengthUnitConverterViewModel.listOfLengthUnits.value.length,
        _listOfLengthUnitInputs.value.length,
      )) {
        ListOfLengthUnitInputDataLoadingTransactionScript.loadListOfLengthUnitInputData(
          _listOfLengthUnitInputs,
          widget.lengthUnitConverterViewModel,
          _deviceLanguageStringsViewModel,
        );
      } else {
        ListOfLengthUnitInputDataUpdatingTransactionScript.updateListOfLengthUnitInputData(
          _listOfLengthUnitInputs,
          widget.lengthUnitConverterViewModel,
          _deviceLanguageStringsViewModel,
        );
      }
    });

    widget.lengthUnitConverterViewModel.baseLengthUnitIndex.addListener(() {
      ListOfLengthUnitInputDataUpdatingTransactionScript.updateListOfLengthUnitInputData(
        _listOfLengthUnitInputs,
        widget.lengthUnitConverterViewModel,
        _deviceLanguageStringsViewModel,
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
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;

    return ValueListenableBuilder(
      valueListenable: _deviceLanguageStringsViewModel.deviceLanguageStrings,
      builder: (_, deviceLanguageStrings, _) {
        return Stack(
          children: [
            Scaffold(
              onBackButtonTap: () {
                widget.router.navigateBack(context);
              },
              actionButtons: [
                ValueListenableBuilder(
                  valueListenable:
                      widget.lengthUnitConverterViewModel.listOfLengthUnits,
                  builder: (_, listOfLengthUnits, _) {
                    return AnimatedScale(
                      scale: isConverterUnchanged(listOfLengthUnits) ? 0 : 1,
                      duration: AnimationDuration.SHORT.value,
                      curve: Curves.easeInOutCirc,
                      child: ActionButton(
                        icon: Symbols.history_2_rounded,
                        tooltipMessage:
                            deviceLanguageStrings.RESET_BUTTON_TOOLTIP_MESSAGE,
                        accessibilityLabel: deviceLanguageStrings
                            .RESET_BUTTON_ACCESSIBILITY_LABEL,
                        onTap: () {
                          widget.lengthUnitConverterViewModel.reset();

                          _listOfLengthUnitInputs.value.first.controller.text =
                              ZEROED_VALUE;

                          _listOfLengthUnitInputs.value = [
                            _listOfLengthUnitInputs.value.first,
                          ];

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
                                    .LENGTH_UNIT_CONVERTER_UTILITY_NAME,
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight - 292,
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
                                              _listOfLengthUnitInputs,
                                          builder:
                                              (_, listOfLengthUnitInputs, _) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 16,
                                                      ),
                                                  child: Column(
                                                    children:
                                                        listOfLengthUnitInputs,
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
                                .lengthUnitConverterViewModel
                                .addLengthUnit,
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
                              .RESTORE_DELETED_LIST_OF_LENGTH_UNITS_MESSAGE,
                          description: deviceLanguageStrings
                              .RESTORE_DELETED_LIST_OF_LENGTH_UNITS_DESCRIPTION,
                          icon: Symbols.settings_backup_restore_rounded,
                          buttonAccessibilityLabel: deviceLanguageStrings
                              .RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_ACCESSIBILITY_LABEL,
                          buttonTooltipMessage: deviceLanguageStrings
                              .RESTORE_DELETED_LIST_OF_LENGTH_UNITS_BUTTON_TOOLTIP_MESSAGE,
                          onTap: () {
                            widget.lengthUnitConverterViewModel.restore();

                            SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
                              _snackbarHidingTimer,
                              _isSnackbarShown,
                            );
                          },
                          onTimeout: () {
                            widget.lengthUnitConverterViewModel
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
  }
}
