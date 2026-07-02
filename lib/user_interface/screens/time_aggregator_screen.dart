import "dart:async";
import "package:flutter/widgets.dart" hide Router, Orientation;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/time_calculator_constants.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/compositions/lower_third_content.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/data_loading/list_of_aggregated_time_input_data_loading_transaction_script.dart";
import "package:nove/user_interface/compositions/scaffold_heading.dart";
import "package:nove/user_interface/internals/value_objects/widget_values_holder_value_objects/time_aggregator_input_controller_holder_value_object.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/view_models/time_aggregator_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/compositions/end_screen_padding.dart";
import "package:nove/user_interface/widgets/icon_button.dart";
import "package:nove/user_interface/widgets/scaffold.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";
import "package:nove/user_interface/widgets/snackbar.dart";

class TimeAggregatorScreen extends StatefulWidget {
  final TimeAggregatorViewModel timeAggregatorViewModel;
  final Router router;

  const TimeAggregatorScreen({
    super.key,
    required this.timeAggregatorViewModel,
    required this.router,
  });

  @override
  State<StatefulWidget> createState() {
    return _TimeAggregatorScreenState();
  }
}

class _TimeAggregatorScreenState extends State<TimeAggregatorScreen> {
  late final ThemeViewModel _themeViewModel;
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final ValueNotifier<List<Widget>> _listOfAggregatedTimeInputs;
  late List<TimeAggregatorInputControllerHolderValueObject>
  _listOfTimeInputControllerHolders;
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

    _listOfAggregatedTimeInputs = ValueNotifier([]);
    _listOfTimeInputControllerHolders = [];

    _bottomPanelKey = GlobalKey();

    _bottomPanelHeight = ValueNotifier(0);

    _isSnackbarShown = ValueNotifier<bool>(false);

    ListOfAggregatedTimeInputDataLoadingTransactionScript.loadListOfAggregatedTimeInputData(
      _listOfTimeInputControllerHolders,
      _listOfAggregatedTimeInputs,
      widget.timeAggregatorViewModel,
      _deviceLanguageStringsViewModel,
    );

    widget.timeAggregatorViewModel.listOfTimes.addListener(() {
      if (isListOfTimesResized(
        widget.timeAggregatorViewModel.listOfTimes.value.length,
        _listOfTimeInputControllerHolders.length,
      )) {
        ListOfAggregatedTimeInputDataLoadingTransactionScript.loadListOfAggregatedTimeInputData(
          _listOfTimeInputControllerHolders,
          _listOfAggregatedTimeInputs,
          widget.timeAggregatorViewModel,
          _deviceLanguageStringsViewModel,
        );
      }
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
                  valueListenable: widget.timeAggregatorViewModel.listOfTimes,
                  builder: (_, listOfTimes, _) {
                    return AnimatedScale(
                      scale: isTimeAggregatorUnchanged(listOfTimes) ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutCirc,
                      child: ActionButton(
                        icon: Symbols.history_2_rounded,
                        tooltipMessage:
                            deviceLanguageStrings.RESET_BUTTON_TOOLTIP_MESSAGE,
                        accessibilityLabel: deviceLanguageStrings
                            .RESET_BUTTON_ACCESSIBILITY_LABEL,
                        onTap: () {
                          widget.timeAggregatorViewModel.reset();

                          _listOfTimeInputControllerHolders[0]
                              .timeHourInputController
                              .text = ZEROED_TIME.hours
                              .toString();
                          _listOfTimeInputControllerHolders[0]
                              .timeMinuteInputController
                              .text = ZEROED_TIME.minutes
                              .toString();
                          _listOfTimeInputControllerHolders[0]
                              .timeSecondInputController
                              .text = ZEROED_TIME.seconds
                              .toString();

                          _isSnackbarShown.value = true;
                        },
                      ),
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
                                      .TIME_AGGREGATOR_UTILITY_NAME,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth: 489,
                                      maxWidth: 1280,
                                      minHeight: constraints.maxHeight - 430,
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
                                                    width: 90,
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
                                        ValueListenableBuilder(
                                          valueListenable:
                                              _listOfAggregatedTimeInputs,
                                          builder:
                                              (_, listOfAggregatedTimes, _) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        bottom: 16,
                                                      ),
                                                  child: Column(
                                                    children:
                                                        listOfAggregatedTimes,
                                                  ),
                                                );
                                              },
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
                                widget.timeAggregatorViewModel.aggregatedTime,
                            builder: (_, calculatedTime, _) {
                              final aggregatedTimeResultPhrase =
                                  PhraseResolver.getAggregatedTimeResultPhrase(
                                    calculatedTime,
                                    deviceLanguageStrings,
                                  );

                              return ValueListenableBuilder(
                                valueListenable: _themeViewModel.theme,
                                builder: (_, theme, _) {
                                  return Text(
                                    aggregatedTimeResultPhrase,
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
                          child: IconButton(
                            icon: Symbols.add_rounded,
                            title: deviceLanguageStrings.ADD_BUTTON_TITLE,
                            accessibilityLabel: deviceLanguageStrings
                                .ADD_TIME_BUTTON_ACCESSIBILITY_LABEL,
                            onTap: widget.timeAggregatorViewModel.addTime,
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
                              .RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_MESSAGE,
                          description: deviceLanguageStrings
                              .RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_DESCRIPTION,
                          icon: Symbols.settings_backup_restore_rounded,
                          buttonAccessibilityLabel: deviceLanguageStrings
                              .RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_ACCESSIBILITY_LABEL,
                          buttonTooltipMessage: deviceLanguageStrings
                              .RESTORE_DELETED_LIST_OF_AGGREGATED_TIMES_BUTTON_TOOLTIP_MESSAGE,
                          onTap: () {
                            widget.timeAggregatorViewModel.restore();

                            SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
                              _snackbarHidingTimer,
                              _isSnackbarShown,
                            );
                          },
                          onTimeout: () {
                            widget.timeAggregatorViewModel.dismissRecovery();

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
