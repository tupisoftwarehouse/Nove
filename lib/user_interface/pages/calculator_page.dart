import "dart:async";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/compositions/lower_third_content.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/expression_history_closing_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:nove/user_interface/sections/calculator_keyboard_section.dart";
import "package:nove/user_interface/view_models/calculator_view_model.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/expression_viewfinder/expression_viewfinder.dart";
import "package:nove/user_interface/widgets/foreground_backdrop.dart";
import "package:nove/user_interface/widgets/page_content_wrapper.dart";
import "package:nove/user_interface/widgets/snackbar.dart";

class CalculatorPage extends StatefulWidget {
  final CalculatorViewModel calculatorViewModel;
  final ValueNotifier<bool> isExpressionHistoryOpened;
  final ValueNotifier<bool> isViewfinderAnimated;

  const CalculatorPage({
    super.key,
    required this.calculatorViewModel,
    required this.isExpressionHistoryOpened,
    required this.isViewfinderAnimated,
  });

  @override
  State<StatefulWidget> createState() {
    return _CalculatorScreenState();
  }
}

class _CalculatorScreenState extends State<CalculatorPage>
    with AutomaticKeepAliveClientMixin {
  late final ThemeViewModel _themeViewModel;
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final TextEditingController _expressionInputTextController;
  late final FocusNode _expressionInputFocusNode;
  late final ValueNotifier<bool> _isSnackbarShown;
  Timer? _snackbarHidingTimer;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();

    _deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();

    _expressionInputTextController = TextEditingController();

    _expressionInputFocusNode = FocusNode();

    _isSnackbarShown = ValueNotifier<bool>(false);

    SnackbarHiddenTimerCancellingListenerSettingTransactionScript.setSnackbarHiddenTimerCancellingListener(
      _isSnackbarShown,
      _snackbarHidingTimer,
    );
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    final applicationWindowSize = MediaQuery.of(context).size;
    final closedViewfinderHeight =
        isViewfinderSmall(applicationWindowSize.height) ? 173.0 : 232.0;

    super.build(context);

    if (isViewfinderExpressionHistoryNotAbleToBeShown(
      applicationWindowSize.height,
      applicationWindowSize.width,
    )) {
      widget.isExpressionHistoryOpened.value = false;
    }

    return ValueListenableBuilder(
      valueListenable: _themeViewModel.theme,
      builder: (_, theme, _) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _expressionInputFocusNode.unfocus();

            _expressionInputTextController.selection = TextSelection(
              baseOffset: _expressionInputTextController.text.length,
              extentOffset: _expressionInputTextController.text.length,
            );
          },
          child: Container(
            decoration: BoxDecoration(color: theme.surface.backgroundColor),
            child: SafeArea(
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight:
                            isCalculatorScreenSmall(constraints.maxHeight)
                            ? CALCULATOR_SCREEN_MINIMAL_HEIGHT
                            : constraints.maxHeight,
                        minWidth: constraints.maxWidth,
                      ),
                      child: SizedBox(
                        height: isCalculatorScreenSmall(constraints.maxHeight)
                            ? CALCULATOR_SCREEN_MINIMAL_HEIGHT
                            : constraints.maxHeight,
                        child: Stack(
                          children: [
                            PageContentWrapper(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        isViewfinderSmall(
                                          applicationWindowSize.height,
                                        )
                                        ? 281
                                        : 382,
                                  ),
                                  SizedBox(
                                    height:
                                        (isCalculatorScreenSmall(
                                              constraints.maxHeight,
                                            )
                                            ? CALCULATOR_SCREEN_MINIMAL_HEIGHT
                                            : constraints.maxHeight) -
                                        (isViewfinderSmall(
                                              constraints.maxHeight,
                                            )
                                            ? 281
                                            : 382),
                                    width: constraints.maxWidth,
                                    child: CalculatorKeyboardSection(
                                      calculatorViewModel:
                                          widget.calculatorViewModel,
                                      deviceLanguageStringsViewModel:
                                          _deviceLanguageStringsViewModel,
                                      expressionInputTextController:
                                          _expressionInputTextController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: _deviceLanguageStringsViewModel
                                  .deviceLanguageStrings,
                              builder: (_, deviceLanguageStrings, _) {
                                return ValueListenableBuilder(
                                  valueListenable:
                                      widget.isExpressionHistoryOpened,
                                  builder: (_, isExpressionHistoryOpened, _) {
                                    return ForegroundBackdrop(
                                      isVisible: isExpressionHistoryOpened,
                                      accessibilityLabel: deviceLanguageStrings
                                          .FOREGROUND_BACKDROP_ACCESSIBILITY_LABEL,
                                      onTap: () {
                                        ExpressionHistoryClosingTransactionScript.closeExpressionHistory(
                                          widget.isExpressionHistoryOpened,
                                          widget.isViewfinderAnimated,
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            Positioned(
                              top: 96,
                              left: 0,
                              right: 0,
                              child: PageContentWrapper(
                                child: ValueListenableBuilder(
                                  valueListenable: widget.isViewfinderAnimated,
                                  builder: (_, isViewfinderAnimated, _) {
                                    return ValueListenableBuilder(
                                      valueListenable:
                                          widget.isExpressionHistoryOpened,
                                      builder: (_, isExpressionHistoryOpened, _) {
                                        return AnimatedContainer(
                                          height: isExpressionHistoryOpened
                                              ? constraints.maxHeight - 112
                                              : closedViewfinderHeight,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          duration: isViewfinderAnimated
                                              ? AnimationDuration.LONG.value
                                              : AnimationDuration.NONE.value,
                                          curve: isViewfinderAnimated
                                              ? Curves.easeInOutCirc
                                              : Curves.linear,
                                          onEnd: () {
                                            widget.isViewfinderAnimated.value =
                                                false;
                                          },
                                          child: ExpressionViewfinder(
                                            expressionSnapshot: widget
                                                .calculatorViewModel
                                                .currentExpressionSnapshot,
                                            listOfPreviousExpressionSnapshots:
                                                widget
                                                    .calculatorViewModel
                                                    .listOfPreviousExpressionSnapshots,
                                            expressionInputTextController:
                                                _expressionInputTextController,
                                            expressionInputFocusNode:
                                                _expressionInputFocusNode,
                                            onExpressionChange:
                                                (updatedExpression) {
                                                  if (isExpressionInputChanged(
                                                    updatedExpression,
                                                    widget
                                                        .calculatorViewModel
                                                        .currentExpressionSnapshot
                                                        .value
                                                        .expression,
                                                  )) {
                                                    widget.calculatorViewModel
                                                        .setExpression(
                                                          updatedExpression,
                                                        );
                                                  }
                                                },
                                            onCleanListOfPreviousExpressionSnapshots: () {
                                              widget.calculatorViewModel
                                                  .cleanListOfPreviousExpressionSnapshots();

                                              _isSnackbarShown.value = true;

                                              ExpressionHistoryClosingTransactionScript.closeExpressionHistory(
                                                widget
                                                    .isExpressionHistoryOpened,
                                                widget.isViewfinderAnimated,
                                              );
                                            },
                                            onExpressionSnapshotItemTap: (itemIndex) {
                                              widget.calculatorViewModel
                                                  .restoreExpressionSnapshotAt(
                                                    itemIndex,
                                                  );

                                              ExpressionHistoryClosingTransactionScript.closeExpressionHistory(
                                                widget
                                                    .isExpressionHistoryOpened,
                                                widget.isViewfinderAnimated,
                                              );
                                            },
                                            onExpressionSnapshotItemDismissed:
                                                widget
                                                    .calculatorViewModel
                                                    .removeExpressionSnapshotFromListOfPreviousExpressionSnapshotsAt,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            LowerThirdContent(
                              isPadded: true,
                              child: ValueListenableBuilder(
                                valueListenable: _deviceLanguageStringsViewModel
                                    .deviceLanguageStrings,
                                builder: (_, deviceLanguageStrings, _) {
                                  return ValueListenableBuilder(
                                    valueListenable: _isSnackbarShown,
                                    builder: (_, isSnackbarShown, _) {
                                      return isSnackbarShown
                                          ? Snackbar(
                                              message: deviceLanguageStrings
                                                  .RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_MESSAGE,
                                              description: deviceLanguageStrings
                                                  .RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_DESCRIPTION,
                                              icon: Symbols
                                                  .settings_backup_restore_rounded,
                                              buttonAccessibilityLabel:
                                                  deviceLanguageStrings
                                                      .RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_ACCESSIBILITY_LABEL,
                                              buttonTooltipMessage:
                                                  deviceLanguageStrings
                                                      .RESTORE_DELETED_LIST_OF_PREVIOUS_EQUATIONS_BUTTON_TOOLTIP_MESSAGE,
                                              onTap: () {
                                                widget.calculatorViewModel
                                                    .restoreListOfPreviousExpressionSnapshots();

                                                SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
                                                  _snackbarHidingTimer,
                                                  _isSnackbarShown,
                                                );

                                                widget
                                                        .isViewfinderAnimated
                                                        .value =
                                                    true;

                                                widget
                                                        .isExpressionHistoryOpened
                                                        .value =
                                                    true;
                                              },
                                              onTimeout: () {
                                                widget.calculatorViewModel
                                                    .dismissRecoveryOfListOfPreviousExpressionSnapshots();

                                                _isSnackbarShown.value = false;
                                              },
                                            )
                                          : const SizedBox.shrink();
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
