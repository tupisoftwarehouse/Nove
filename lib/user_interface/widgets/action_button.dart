import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/agnostic_widgets/tooltip.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class ActionButton extends StatefulWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? indicatorColor;
  final String tooltipMessage;
  final String accessibilityLabel;
  final bool isHapticFeedbackEnabled;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.indicatorColor,
    required this.tooltipMessage,
    required this.accessibilityLabel,
    this.isHapticFeedbackEnabled = true,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _ActionButtonState();
  }
}

class _ActionButtonState extends State<ActionButton> {
  late final ThemeViewModel _themeViewModel;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext _) {
    return ValueListenableBuilder(
      valueListenable: _themeViewModel.theme,
      builder: (_, theme, _) {
        return Semantics(
          label: widget.accessibilityLabel,
          button: true,
          child: Tooltip(
            message: widget.tooltipMessage,
            verticalOffset: 38,
            child: Surface(
              backgroundColor:
                  widget.backgroundColor ??
                  theme.elevatedSurface.backgroundColor,
              borderColor:
                  widget.borderColor ?? theme.elevatedSurface.borderColor,
              borderRadius: BorderRadius.circular(1000),
              height: 64,
              width: 64,
              child: TapIndicator(
                indicatorColor:
                    widget.indicatorColor ?? theme.tapIndicatorColor,
                isHapticFeedbackEnabled: widget.isHapticFeedbackEnabled,
                onTap: widget.onTap,
                child: Center(
                  child: Icon(
                    widget.icon,
                    size: 24,
                    color: widget.iconColor ?? theme.iconEmphasis9Color,
                    fill: 1,
                    weight: FontWeight.w900.value.toDouble(),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return ActionButton(
    icon: Symbols.arrow_back_ios_new_rounded,
    tooltipMessage: "Go back",
    accessibilityLabel: "",
    onTap: () {},
  );
}
