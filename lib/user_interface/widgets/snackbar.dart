import "dart:async";
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/action_button.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class Snackbar extends StatefulWidget {
  final String message;
  final String description;
  final IconData icon;
  final String buttonAccessibilityLabel;
  final String buttonTooltipMessage;
  final VoidCallback onTap;
  final VoidCallback onTimeout;

  const Snackbar({
    super.key,
    required this.message,
    required this.description,
    required this.icon,
    required this.buttonAccessibilityLabel,
    required this.buttonTooltipMessage,
    required this.onTap,
    required this.onTimeout,
  });

  @override
  State<StatefulWidget> createState() {
    return _SnackbarState();
  }
}

class _SnackbarState extends State<Snackbar> {
  late final ThemeViewModel _themeViewModel;
  final _isShown = ValueNotifier(false);
  final _isElementShown = ValueNotifier(false);
  Timer? _isShownTimer;
  Timer? _isElementShownTimer;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  void dispose() {
    _isShown.dispose();
    _isElementShown.dispose();

    _isShownTimer?.cancel();
    _isElementShownTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    _isShown.value = false;
    _isElementShown.value = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isShown.value = true;
      _isElementShown.value = true;

      _isShownTimer = Timer(SNACKBAR_AUTOMATIC_DISMISS_DURATION, () {
        _isShown.value = false;

        _isElementShownTimer = Timer(AnimationDuration.LONG.value, () {
          _isElementShown.value = false;

          widget.onTimeout();
        });
      });
    });

    return SizedBox(
      height: 96,
      width: double.infinity,
      child: ValueListenableBuilder(
        valueListenable: _themeViewModel.theme,
        builder: (_, theme, _) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final snackbarMessageContainerWidth = constraints.maxWidth - 72;

              return ValueListenableBuilder(
                valueListenable: _isShown,
                builder: (_, isShown, _) {
                  return SizedBox(
                    height: double.infinity,
                    width: constraints.maxWidth,
                    child: Padding(
                      padding: const EdgeInsetsGeometry.all(0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            height: 64,
                            width: isShown ? snackbarMessageContainerWidth : 0,
                            duration: AnimationDuration.LONG.value,
                            curve: Curves.easeInOutCirc,
                            child: ValueListenableBuilder(
                              valueListenable: _isElementShown,
                              builder: (_, isElementShown, _) {
                                return isElementShown
                                    ? Surface(
                                        backgroundColor: theme
                                            .elevatedSurface
                                            .backgroundColor,
                                        borderColor:
                                            theme.elevatedSurface.borderColor,
                                        borderRadius: BorderRadius.circular(
                                          1000,
                                        ),
                                        height: 64,
                                        width: 50,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsGeometry.symmetric(
                                                horizontal: 32,
                                              ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                widget.message,
                                                style: HEADING_6(
                                                  theme.textEmphasis9Color,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                widget.description,
                                                style: LABEL_12_SEMIBOLD(
                                                  theme.textEmphasis3Color,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink();
                              },
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: Center(
                              child: AnimatedScale(
                                scale: isShown ? 1 : 0,
                                duration: AnimationDuration.LONG.value,
                                curve: Curves.easeInOutCirc,
                                child: ValueListenableBuilder(
                                  valueListenable: _isElementShown,
                                  builder: (_, isElementShown, _) {
                                    return isElementShown
                                        ? ActionButton(
                                            icon: widget.icon,
                                            backgroundColor: SUCCESS_500,
                                            borderColor: SUCCESS_600,
                                            iconColor: SUCCESS_900,
                                            indicatorColor: NEUTRALS_900,
                                            accessibilityLabel:
                                                widget.buttonAccessibilityLabel,
                                            tooltipMessage:
                                                widget.buttonTooltipMessage,
                                            onTap: () {
                                              widget.onTap();

                                              _isShown.value = false;

                                              _isElementShownTimer = Timer(
                                                AnimationDuration.LONG.value,
                                                () {
                                                  _isElementShown.value = false;
                                                },
                                              );
                                            },
                                          )
                                        : const SizedBox.shrink();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

@Preview()
Widget preview() {
  return Snackbar(
    message: "Equation history has been cleared",
    description: "Tap restore to keep your equation history",
    icon: Symbols.settings_backup_restore_rounded,
    buttonAccessibilityLabel: "Restore deleted equations",
    buttonTooltipMessage: "Restore equations",
    onTap: () {},
    onTimeout: () {},
  );
}
