import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/internals/theme/colors.dart";

class ContextButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color tapIndicatorColor;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const ContextButton({
    super.key,
    required this.icon,
    required this.color,
    required this.tapIndicatorColor,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: accessibilityLabel,
      button: true,
      child: SizedBox(
        height: 40,
        width: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: TapIndicator(
            indicatorColor: tapIndicatorColor,
            isHapticFeedbackEnabled: true,
            onTap: onTap,
            child: Center(
              child: Icon(
                icon,
                size: 24,
                color: color,
                fill: 1,
                weight: FontWeight.w400.value.toDouble(),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return ContextButton(
    icon: Symbols.delete_rounded,
    color: NEUTRALS_50,
    tapIndicatorColor: NEUTRALS_50,
    accessibilityLabel: "",
    onTap: () {},
  );
}
