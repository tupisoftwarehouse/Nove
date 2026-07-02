import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/agnostic_widgets/tooltip.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class InputActionButton extends StatefulWidget {
  final IconData icon;
  final String tooltipMessage;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const InputActionButton({
    super.key,
    required this.icon,
    required this.tooltipMessage,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _InputActionButtonState();
  }
}

class _InputActionButtonState extends State<InputActionButton> {
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
            verticalOffset: 30,
            child: Surface(
              backgroundColor: theme.elevatedSurface.backgroundColor,
              borderColor: theme.elevatedSurface.borderColor,
              borderRadius: BorderRadius.circular(1000),
              height: 56,
              width: 56,
              child: TapIndicator(
                indicatorColor: theme.tapIndicatorColor,
                isHapticFeedbackEnabled: true,
                onTap: widget.onTap,
                child: Center(
                  child: Icon(
                    widget.icon,
                    size: 18,
                    color: theme.iconEmphasis9Color,
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
  return InputActionButton(
    icon: Symbols.add_rounded,
    tooltipMessage: "Add time",
    accessibilityLabel: "",
    onTap: () {},
  );
}
