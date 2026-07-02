import "dart:async";
import "package:flutter/widgets.dart" hide Router, Orientation;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/compositions/lower_third_content.dart";
import "package:nove/user_interface/compositions/scaffold_heading.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/time_input_value_updating_parsers/time_calculator_input_value_updating_parser.dart";
import "package:nove/user_interface/compositions/time_input_divider.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/view_models/time_calculator_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/compositions/end_screen_padding.dart";
import "package:nove/user_interface/widgets/icon_button.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/scaffold.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class TimeCalculatorScreen extends StatefulWidget {
  final TimeCalculatorViewModel timeCalculatorViewModel;
  final Router router;

  const TimeCalculatorScreen({
    super.key,
    required this.timeCalculatorViewModel,
    required this.router,
  });

  @override
  State<TimeCalculatorScreen> createState() {
    return _TimeCalculatorScreenState();
  }
}

class _TimeCalculatorScreenState extends State<TimeCalculatorScreen> {
  late final ThemeViewModel _themeViewModel;
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final TextEditingController _firstTimeHourController;
  late final TextEditingController _firstTimeMinuteController;
  late final TextEditingController _firstTimeSecondController;
  late final TextEditingController _secondTimeHourController;
  late final TextEditingController _secondTimeMinuteController;
  late final TextEditingController _secondTimeSecondController;
  late final FocusNode _firstHourInputFocusNode;
  late final FocusNode _firstMinuteInputFocusNode;
  late final FocusNode _firstSecondInputFocusNode;
  late final FocusNode _secondHourInputFocusNode;
  late final FocusNode _secondMinuteInputFocusNode;
  late final FocusNode _secondSecondInputFocusNode;
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

    _firstTimeHourController = TextEditingController();
    _firstTimeMinuteController = TextEditingController();
    _firstTimeSecondController = TextEditingController();

    _secondTimeHourController = TextEditingController();
    _secondTimeMinuteController = TextEditingController();
    _secondTimeSecondController = TextEditingController();

    _firstHourInputFocusNode = FocusNode();
    _firstMinuteInputFocusNode = FocusNode();
    _firstSecondInputFocusNode = FocusNode();

    _secondHourInputFocusNode = FocusNode();
    _secondMinuteInputFocusNode = FocusNode();
    _secondSecondInputFocusNode = FocusNode();

    _bottomPanelKey = GlobalKey();

    _bottomPanelHeight = ValueNotifier(0);

    _isSnackbarShown = ValueNotifier<bool>(false);

    _firstTimeHourController.text = widget
        .timeCalculatorViewModel
        .firstTimeToBeCalculated
        .value
        .hours
        .toString();
    _firstTimeMinuteController.text = widget
        .timeCalculatorViewModel
        .firstTimeToBeCalculated
        .value
        .minutes
        .toString();
    _firstTimeSecondController.text = widget
        .timeCalculatorViewModel
        .firstTimeToBeCalculated
        .value
        .seconds
        .toString();

    _secondTimeHourController.text = widget
        .timeCalculatorViewModel
        .secondTimeToBeCalculated
        .value
        .hours
        .toString();
    _secondTimeMinuteController.text = widget
        .timeCalculatorViewModel
        .secondTimeToBeCalculated
        .value
        .minutes
        .toString();
    _secondTimeSecondController.text = widget
        .timeCalculatorViewModel
        .secondTimeToBeCalculated
        .value
        .seconds
        .toString();

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
    _firstTimeHourController.dispose();
    _firstTimeMinuteController.dispose();
    _firstTimeSecondController.dispose();

    _secondTimeHourController.dispose();
    _secondTimeMinuteController.dispose();
    _secondTimeSecondController.dispose();

    super.dispose();
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
                      widget.timeCalculatorViewModel.firstTimeToBeCalculated,
                  builder: (_, firstTimeToBeCalculated, _) {
                    return ValueListenableBuilder(
                      valueListenable: widget
                          .timeCalculatorViewModel
                          .secondTimeToBeCalculated,
                      builder: (_, secondTimeToBeCalculated, _) {
                        return AnimatedScale(
                          scale:
                              isTimeCalculatorUnchanged(
                                firstTimeToBeCalculated,
                                secondTimeToBeCalculated,
                              )
                              ? 0
                              : 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutCirc,
                          child: ActionButton(
                            icon: Symbols.history_2_rounded,
                            tooltipMessage: deviceLanguageStrings
                                .RESET_BUTTON_TOOLTIP_MESSAGE,
                            accessibilityLabel: deviceLanguageStrings
                                .RESET_BUTTON_ACCESSIBILITY_LABEL,
                            onTap: () {
                              widget.timeCalculatorViewModel.reset();

                              _firstTimeHourController.text = ZEROED_TIME.hours
                                  .toString();
                              _firstTimeMinuteController.text = ZEROED_TIME
                                  .minutes
                                  .toString();
                              _firstTimeSecondController.text = ZEROED_TIME
                                  .seconds
                                  .toString();

                              _secondTimeHourController.text = ZEROED_TIME.hours
                                  .toString();
                              _secondTimeMinuteController.text = ZEROED_TIME
                                  .minutes
                                  .toString();
                              _secondTimeSecondController.text = ZEROED_TIME
                                  .seconds
                                  .toString();

                              _isSnackbarShown.value = true;
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
              body: LayoutBuilder(
                builder: (_, constraints) {
                  return Padding(
                    padding: EdgeInsetsGeometry.only(bottom: viewInsets.bottom),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ScaffoldHeading(
                                  title: deviceLanguageStrings
                                      .TIME_CALCULATOR_UTILITY_NAME,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth: 382,
                                      maxWidth: 1280,
                                      minHeight: constraints.maxHeight - 378,
                                    ),
                                    width: constraints.maxWidth,
                                    child: Column(
                                      children: [
                                        ValueListenableBuilder(
                                          valueListenable:
                                              _themeViewModel.theme,
                                          builder: (_, theme, _) {
                                            return Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 130,
                                                    child: Center(
                                                      child: Text(
                                                        deviceLanguageStrings
                                                            .TIME_HOUR_INPUT_TITLE,
                                                        style: PARAGRAPH_12_MEDIUM(
                                                          theme
                                                              .iconEmphasis5Color,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 19),
                                                  SizedBox(
                                                    width: 90,
                                                    child: Center(
                                                      child: Text(
                                                        deviceLanguageStrings
                                                            .TIME_MINUTE_INPUT_TITLE,
                                                        style: PARAGRAPH_12_MEDIUM(
                                                          theme
                                                              .iconEmphasis5Color,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 19),
                                                  SizedBox(
                                                    width: 90,
                                                    child: Center(
                                                      child: Text(
                                                        deviceLanguageStrings
                                                            .TIME_SECOND_INPUT_TITLE,
                                                        style: PARAGRAPH_12_MEDIUM(
                                                          theme
                                                              .iconEmphasis5Color,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 6),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            bottom: 16,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 130,
                                                    child: Input(
                                                      hintText:
                                                          ZEROED_HOUR_TIME_CYCLE_PLACEHOLDER,
                                                      isCentralized: true,
                                                      type:
                                                          TextInputType.number,
                                                      controller:
                                                          _firstTimeHourController,
                                                      focusNode:
                                                          _firstHourInputFocusNode,
                                                      onChanged: (value) {
                                                        TimeCalculatorInputValueUpdatingParser.updateHoursFromTime(
                                                          value,
                                                          _firstTimeHourController,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .firstTimeToBeCalculated
                                                              .value,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .setFirstTimeToBeCalculated,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const TimeInputDivider(),
                                                  SizedBox(
                                                    width: 93,
                                                    child: Input(
                                                      hintText:
                                                          ZEROED_TIME_PLACEHOLDER,
                                                      isCentralized: true,
                                                      type:
                                                          TextInputType.number,
                                                      controller:
                                                          _firstTimeMinuteController,
                                                      focusNode:
                                                          _firstMinuteInputFocusNode,
                                                      onChanged: (value) {
                                                        TimeCalculatorInputValueUpdatingParser.updateMinutesFromTime(
                                                          value,
                                                          _firstTimeMinuteController,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .firstTimeToBeCalculated
                                                              .value,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .setFirstTimeToBeCalculated,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const TimeInputDivider(),
                                                  SizedBox(
                                                    width: 93,
                                                    child: Input(
                                                      hintText:
                                                          ZEROED_TIME_PLACEHOLDER,
                                                      isCentralized: true,
                                                      type:
                                                          TextInputType.number,
                                                      controller:
                                                          _firstTimeSecondController,
                                                      focusNode:
                                                          _firstSecondInputFocusNode,
                                                      onChanged: (value) {
                                                        TimeCalculatorInputValueUpdatingParser.updateSecondsFromTime(
                                                          value,
                                                          _firstTimeSecondController,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .firstTimeToBeCalculated
                                                              .value,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .setFirstTimeToBeCalculated,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 13),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 130,
                                                    child: Input(
                                                      hintText:
                                                          ZEROED_HOUR_TIME_CYCLE_PLACEHOLDER,
                                                      isCentralized: true,
                                                      type:
                                                          TextInputType.number,
                                                      controller:
                                                          _secondTimeHourController,
                                                      focusNode:
                                                          _secondHourInputFocusNode,
                                                      onChanged: (value) {
                                                        TimeCalculatorInputValueUpdatingParser.updateHoursFromTime(
                                                          value,
                                                          _secondTimeHourController,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .secondTimeToBeCalculated
                                                              .value,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .setSecondTimeToBeCalculated,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const TimeInputDivider(),
                                                  SizedBox(
                                                    width: 93,
                                                    child: Input(
                                                      hintText:
                                                          ZEROED_TIME_PLACEHOLDER,
                                                      isCentralized: true,
                                                      type:
                                                          TextInputType.number,
                                                      controller:
                                                          _secondTimeMinuteController,
                                                      focusNode:
                                                          _secondMinuteInputFocusNode,
                                                      onChanged: (value) {
                                                        TimeCalculatorInputValueUpdatingParser.updateMinutesFromTime(
                                                          value,
                                                          _secondTimeMinuteController,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .secondTimeToBeCalculated
                                                              .value,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .setSecondTimeToBeCalculated,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const TimeInputDivider(),
                                                  SizedBox(
                                                    width: 93,
                                                    child: Input(
                                                      hintText:
                                                          ZEROED_TIME_PLACEHOLDER,
                                                      isCentralized: true,
                                                      type:
                                                          TextInputType.number,
                                                      controller:
                                                          _secondTimeSecondController,
                                                      focusNode:
                                                          _secondSecondInputFocusNode,
                                                      onChanged: (value) {
                                                        TimeCalculatorInputValueUpdatingParser.updateSecondsFromTime(
                                                          value,
                                                          _secondTimeSecondController,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .secondTimeToBeCalculated
                                                              .value,
                                                          widget
                                                              .timeCalculatorViewModel
                                                              .setSecondTimeToBeCalculated,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const EndScreenPadding(),
                                      ],
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
                    ),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(
                          color: theme.elevatedSurface.borderColor,
                          orientation: Orientation.HORIZONTAL,
                        ),
                        const SizedBox(height: 9),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ValueListenableBuilder(
                            valueListenable:
                                widget.timeCalculatorViewModel.calculatedTime,
                            builder: (_, calculatedTime, _) {
                              return ValueListenableBuilder(
                                valueListenable: _themeViewModel.theme,
                                builder: (_, theme, _) {
                                  final calculatedTimeResultPhrase =
                                      PhraseResolver.getCalculatedTimeResultPhrase(
                                        calculatedTime,
                                        deviceLanguageStrings,
                                      );

                                  return Text(
                                    calculatedTimeResultPhrase,
                                    style: HEADING_5(theme.textEmphasis9Color),
                                    textAlign: TextAlign.center,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  icon: Symbols.add_rounded,
                                  title: deviceLanguageStrings.ADD_BUTTON_TITLE,
                                  accessibilityLabel: deviceLanguageStrings
                                      .ADD_TIME_BUTTON_ACCESSIBILITY_LABEL,
                                  onTap: widget.timeCalculatorViewModel.addTime,
                                ),
                              ),
                              const SizedBox(width: 13),
                              Expanded(
                                child: IconButton(
                                  icon: Symbols.remove_rounded,
                                  title: deviceLanguageStrings
                                      .SUBTRACT_BUTTON_TITLE,
                                  accessibilityLabel: deviceLanguageStrings
                                      .SUBTRACT_TIME_BUTTON_ACCESSIBILITY_LABEL,
                                  onTap: widget
                                      .timeCalculatorViewModel
                                      .subtractTime,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
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
                              .RESTORE_DELETED_TIME_CALCULATOR_DATA_MESSAGE,
                          description: deviceLanguageStrings
                              .RESTORE_DELETED_TIME_CALCULATOR_DATA_DESCRIPTION,
                          icon: Symbols.settings_backup_restore_rounded,
                          buttonAccessibilityLabel: deviceLanguageStrings
                              .RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_ACCESSIBILITY_LABEL,
                          buttonTooltipMessage: deviceLanguageStrings
                              .RESTORE_DELETED_TIME_CALCULATOR_DATA_BUTTON_TOOLTIP_MESSAGE,
                          onTap: () {
                            widget.timeCalculatorViewModel.restore();

                            _firstTimeHourController.text = widget
                                .timeCalculatorViewModel
                                .firstTimeToBeCalculated
                                .value
                                .hours
                                .toString();
                            _firstTimeMinuteController.text = widget
                                .timeCalculatorViewModel
                                .firstTimeToBeCalculated
                                .value
                                .minutes
                                .toString();
                            _firstTimeSecondController.text = widget
                                .timeCalculatorViewModel
                                .firstTimeToBeCalculated
                                .value
                                .seconds
                                .toString();

                            _secondTimeHourController.text = widget
                                .timeCalculatorViewModel
                                .secondTimeToBeCalculated
                                .value
                                .hours
                                .toString();
                            _secondTimeMinuteController.text = widget
                                .timeCalculatorViewModel
                                .secondTimeToBeCalculated
                                .value
                                .minutes
                                .toString();
                            _secondTimeSecondController.text = widget
                                .timeCalculatorViewModel
                                .secondTimeToBeCalculated
                                .value
                                .seconds
                                .toString();

                            SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
                              _snackbarHidingTimer,
                              _isSnackbarShown,
                            );
                          },
                          onTimeout: () {
                            widget.timeCalculatorViewModel.dismissRecovery();

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
