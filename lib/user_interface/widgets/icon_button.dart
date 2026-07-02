import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/internals/theme/icon_styles.dart";

class IconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const IconButton({
    super.key,
    required this.icon,
    required this.title,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext _) {
    return Semantics(
      button: true,
      label: accessibilityLabel,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            color: SECONDARY_500,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TapIndicator(
            indicatorColor: NEUTRALS_900,
            isHapticFeedbackEnabled: true,
            onTap: onTap,
            child: Container(
              padding: .symmetric(vertical: 13, horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 6.5,
                children: [
                  HEADING_4_ICON(icon, NEUTRALS_900),
                  Flexible(
                    child: SelectionContainer.disabled(
                      child: Text(
                        title,
                        style: HEADING_4(NEUTRALS_900),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
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
  return IconButton(
    icon: Symbols.add_rounded,
    title: "Add",
    accessibilityLabel: "",
    onTap: () {},
  );
}
