import "dart:async";
import "package:flutter/widgets.dart" hide Router, Orientation;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/constants/domains/body_mass_index_calculator_constants.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/compositions/lower_third_content.dart";
import "package:nove/user_interface/compositions/scaffold_heading.dart";
import "package:nove/domain/body_mass_index_calculator/body_mass_index_calculation_candidate_value_object.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:nove/user_interface/view_models/body_mass_index_calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/compositions/end_screen_padding.dart";
import "package:nove/user_interface/widgets/icon_button.dart";
import "package:nove/user_interface/widgets/input.dart";
import "package:nove/user_interface/widgets/scaffold.dart";
import "package:nove/user_interface/widgets/snackbar.dart";

class BodyMassIndexCalculatorScreen extends StatefulWidget {
  final BodyMassIndexCalculatorViewModel bodyMassIndexCalculatorViewModel;
  final Router router;

  const BodyMassIndexCalculatorScreen({
    super.key,
    required this.bodyMassIndexCalculatorViewModel,
    required this.router,
  });

  @override
  State<BodyMassIndexCalculatorScreen> createState() {
    return _BodyMassIndexCalculatorScreenState();
  }
}

class _BodyMassIndexCalculatorScreenState
    extends State<BodyMassIndexCalculatorScreen> {
  late final ThemeViewModel _themeViewModel;
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final TextEditingController _heightInputController;
  late final TextEditingController _weightInputController;
  late final GlobalKey _bottomPanelKey;
  late final ValueNotifier<double> _bottomPanelHeight;
  late final ValueNotifier<bool> _isSnackbarShown;
  late final FocusNode _heightInputFocusNode;
  late final FocusNode _weightInputFocusNode;
  Timer? _snackbarHidingTimer;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();

    _deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();

    _heightInputController = TextEditingController();
    _weightInputController = TextEditingController();

    _bottomPanelKey = GlobalKey();

    _bottomPanelHeight = ValueNotifier(0);

    _isSnackbarShown = ValueNotifier<bool>(false);

    _heightInputFocusNode = FocusNode();
    _weightInputFocusNode = FocusNode();

    _heightInputController.text = widget
        .bodyMassIndexCalculatorViewModel
        .candidateHeight
        .value
        .toString();
    _weightInputController.text = widget
        .bodyMassIndexCalculatorViewModel
        .candidateWeight
        .value
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
    _heightInputController.dispose();
    _weightInputController.dispose();

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
                      widget.bodyMassIndexCalculatorViewModel.candidateHeight,
                  builder: (_, candidateHeight, _) {
                    return ValueListenableBuilder(
                      valueListenable: widget
                          .bodyMassIndexCalculatorViewModel
                          .candidateWeight,
                      builder: (_, candidateWeight, _) {
                        final bodyMassIndexCalculationCandidate =
                            BodyMassIndexCalculationCandidateValueObject(
                              candidateHeight,
                              candidateWeight,
                            );

                        return AnimatedScale(
                          scale:
                              isBodyMassIndexCalculatorUnchanged(
                                bodyMassIndexCalculationCandidate,
                              )
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
                              widget.bodyMassIndexCalculatorViewModel.reset();

                              _heightInputController.text = ZEROED_HEIGHT
                                  .toString();
                              _weightInputController.text = ZEROED_WEIGHT
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
              body: Padding(
                padding: EdgeInsetsGeometry.only(bottom: viewInsets.bottom),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ScaffoldHeading(
                              title: deviceLanguageStrings
                                  .BODY_MASS_INDEX_CALCULATOR_UTILITY_NAME,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable: _themeViewModel.theme,
                                    builder: (_, theme, _) {
                                      return Padding(
                                        padding: const EdgeInsetsGeometry.only(
                                          left: 12,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${deviceLanguageStrings.HEIGHT_INPUT_TITLE}:",
                                            style: PARAGRAPH_12_MEDIUM(
                                              theme.textEmphasis4Color,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 6),
                                  Input(
                                    hintText: deviceLanguageStrings
                                        .HEIGHT_INPUT_PLACEHOLDER,
                                    type: TextInputType.number,
                                    controller: _heightInputController,
                                    focusNode: _heightInputFocusNode,
                                    onChanged: (value) {
                                      try {
                                        final updatedCandidateHeight =
                                            double.parse(value);

                                        widget.bodyMassIndexCalculatorViewModel
                                            .setCandidateHeight(
                                              updatedCandidateHeight,
                                            );
                                      } catch (_) {}
                                    },
                                  ),
                                  const SizedBox(height: 13),
                                  ValueListenableBuilder(
                                    valueListenable: _themeViewModel.theme,
                                    builder: (_, theme, _) {
                                      return Padding(
                                        padding: const EdgeInsetsGeometry.only(
                                          left: 12,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${deviceLanguageStrings.WEIGHT_INPUT_TITLE}:",
                                            style: PARAGRAPH_12_MEDIUM(
                                              theme.textEmphasis4Color,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 6),
                                  Input(
                                    hintText: deviceLanguageStrings
                                        .WEIGHT_INPUT_PLACEHOLDER,
                                    type: TextInputType.number,
                                    controller: _weightInputController,
                                    focusNode: _weightInputFocusNode,
                                    onChanged: (value) {
                                      try {
                                        final updatedCandidateWeight =
                                            double.parse(value);

                                        widget.bodyMassIndexCalculatorViewModel
                                            .setCandidateWeight(
                                              updatedCandidateWeight,
                                            );
                                      } catch (_) {}
                                    },
                                  ),
                                  const SizedBox(height: 13),
                                ],
                              ),
                            ),
                            const EndScreenPadding(),
                            ValueListenableBuilder(
                              valueListenable: _bottomPanelHeight,
                              builder: (_, calculateButtonContainerHeight, _) {
                                return SizedBox(
                                  height: calculateButtonContainerHeight,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            LowerThirdContent(
              isPadded: false,
              child: ValueListenableBuilder(
                valueListenable: _themeViewModel.theme,
                builder: (_, theme, _) {
                  return Container(
                    decoration: BoxDecoration(
                      color: theme.surface.backgroundColor,
                    ),
                    child: Column(
                      key: _bottomPanelKey,
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
                            valueListenable: widget
                                .bodyMassIndexCalculatorViewModel
                                .bodyMassIndex,
                            builder: (_, bodyMassIndex, _) {
                              final bodyMassIndexResultPhrase =
                                  PhraseResolver.getBodyMassIndexResultPhrase(
                                    bodyMassIndex,
                                    deviceLanguageStrings,
                                  );

                              return ValueListenableBuilder(
                                valueListenable: _themeViewModel.theme,
                                builder: (_, theme, _) {
                                  return Text(
                                    bodyMassIndexResultPhrase,
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
                            icon: Symbols.equal_rounded,
                            title: deviceLanguageStrings.CALCULATE_BUTTON_TITLE,
                            accessibilityLabel: deviceLanguageStrings
                                .CALCULATE_BODY_MASS_INDEX_BUTTON_ACCESSIBILITY_LABEL,
                            onTap: widget
                                .bodyMassIndexCalculatorViewModel
                                .calculateBodyMassIndex,
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
                            widget.bodyMassIndexCalculatorViewModel.restore();

                            SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
                              _snackbarHidingTimer,
                              _isSnackbarShown,
                            );
                          },
                          onTimeout: () {
                            widget.bodyMassIndexCalculatorViewModel
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
