import "dart:async";
import "package:flutter/widgets.dart" hide Router, Orientation;
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/internals/phrase_resolver/phrase_resolver.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/compositions/lower_third_content.dart";
import "package:nove/user_interface/compositions/scaffold_heading.dart";
import "package:nove/user_interface/router/router.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/device_language_strings_view_model_factory.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_cancelling_listener_setting_transaction_script.dart";
import "package:nove/user_interface/internals/transaction_scripts/user_interface_handling/snackbar_hidden_timer_starting_transaction_script.dart";
import "package:nove/user_interface/view_models/device_language_strings_view_model.dart";
import "package:nove/user_interface/view_models/text_information_parser_view_model.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/widgets/divider.dart";
import "package:nove/user_interface/widgets/scaffold.dart";
import "package:nove/user_interface/widgets/snackbar.dart";
import "package:nove/user_interface/widgets/text_area.dart";
import "package:nove/user_interface/internals/enums/orientation.dart";

class TextInformationParserScreen extends StatefulWidget {
  final TextInformationParserViewModel textInformationParserViewModel;
  final Router router;

  const TextInformationParserScreen({
    super.key,
    required this.textInformationParserViewModel,
    required this.router,
  });

  @override
  State<StatefulWidget> createState() {
    return _TextInformationParserScreenState();
  }
}

class _TextInformationParserScreenState
    extends State<TextInformationParserScreen> {
  late final ThemeViewModel _themeViewModel;
  late final DeviceLanguageStringsViewModel _deviceLanguageStringsViewModel;
  late final TextEditingController _textController;
  late final GlobalKey _bottomPanelKey;
  late final ValueNotifier<double> _bottomPanelHeight;
  late final ValueNotifier<bool> _isSnackbarShown;
  Timer? _snackbarHidingTimer;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();

    _deviceLanguageStringsViewModel =
        DeviceLanguageStringsViewModelFactory.getInstance();

    _textController = TextEditingController();

    _bottomPanelKey = GlobalKey();

    _bottomPanelHeight = ValueNotifier(0);

    _isSnackbarShown = ValueNotifier<bool>(false);

    _focusNode = FocusNode();

    _textController.text =
        widget.textInformationParserViewModel.parsedText.value;

    widget.textInformationParserViewModel.parsedText.addListener(() {
      _textController.text =
          widget.textInformationParserViewModel.parsedText.value;
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
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      widget.textInformationParserViewModel.parsedText,
                  builder: (_, parsedText, _) {
                    return AnimatedScale(
                      scale: parsedText.isEmpty ? 0 : 1,
                      duration: AnimationDuration.SHORT.value,
                      curve: Curves.easeInOutCirc,
                      child: ActionButton(
                        icon: Symbols.history_2_rounded,
                        tooltipMessage:
                            deviceLanguageStrings.RESET_BUTTON_TOOLTIP_MESSAGE,
                        accessibilityLabel: deviceLanguageStrings
                            .RESET_BUTTON_ACCESSIBILITY_LABEL,
                        onTap: () {
                          widget.textInformationParserViewModel.reset();

                          _isSnackbarShown.value = true;
                        },
                      ),
                    );
                  },
                ),
              ],
              body: Column(
                children: [
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ScaffoldHeading(
                                    title: deviceLanguageStrings
                                        .TEXT_INFORMATION_PARSER_UTILITY_NAME,
                                  ),
                                  Expanded(
                                    child: TextArea(
                                      placeholder: deviceLanguageStrings
                                          .TEXT_AREA_PLACEHOLDER,
                                      controller: _textController,
                                      focusNode: _focusNode,
                                      onChanged: widget
                                          .textInformationParserViewModel
                                          .setParsedText,
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
                  ValueListenableBuilder(
                    valueListenable: _bottomPanelHeight,
                    builder: (_, bottomPanelHeight, _) {
                      return SizedBox(height: bottomPanelHeight);
                    },
                  ),
                ],
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
                        ValueListenableBuilder(
                          valueListenable: _themeViewModel.theme,
                          builder: (_, theme, _) {
                            return Divider(
                              color: theme.elevatedSurface.borderColor,
                              orientation: Orientation.HORIZONTAL,
                            );
                          },
                        ),
                        ValueListenableBuilder(
                          valueListenable: widget
                              .textInformationParserViewModel
                              .textInformation,
                          builder: (_, textInformation, _) {
                            final textInformationBreakdownPhrase =
                                PhraseResolver.getTextInformationBreakdownPhrase(
                                  textInformation,
                                  deviceLanguageStrings,
                                );

                            return ValueListenableBuilder(
                              valueListenable: _themeViewModel.theme,
                              builder: (_, theme, _) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    textInformationBreakdownPhrase,
                                    style: HEADING_5(theme.textEmphasis9Color),
                                  ),
                                );
                              },
                            );
                          },
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
                              .RESTORE_DELETED_TEXT_INFORMATION_DATA_MESSAGE,
                          description: deviceLanguageStrings
                              .RESTORE_DELETED_TEXT_INFORMATION_DATA_DESCRIPTION,
                          icon: Symbols.settings_backup_restore_rounded,
                          buttonAccessibilityLabel: deviceLanguageStrings
                              .RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_ACCESSIBILITY_LABEL,
                          buttonTooltipMessage: deviceLanguageStrings
                              .RESTORE_DELETED_TEXT_INFORMATION_DATA_BUTTON_TOOLTIP_MESSAGE,
                          onTap: () {
                            widget.textInformationParserViewModel.restore();

                            SnackbarHiddenTimerStartingTransactionScript.startSnackbarHiddenTimer(
                              _snackbarHidingTimer,
                              _isSnackbarShown,
                            );
                          },
                          onTimeout: () {
                            widget.textInformationParserViewModel
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
