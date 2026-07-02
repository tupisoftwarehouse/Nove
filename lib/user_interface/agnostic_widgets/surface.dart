import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class Surface extends StatelessWidget {
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color borderColor;
  final BorderRadius borderRadius;
  final Widget child;

  const Surface({
    super.key,
    this.width,
    this.height,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext _) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: borderColor,
          width: 1,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        boxShadow: [
          BoxShadow(
            color: NEUTRALS_1000.withValues(alpha: 0.15),
            offset: const Offset(0, 6),
            blurRadius: 10,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: NEUTRALS_1000.withValues(alpha: 0.3),
            offset: const Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: ClipRRect(borderRadius: borderRadius, child: child),
    );
  }
}

@Preview()
Widget preview() {
  return Surface(
    backgroundColor: PRIMARY_900,
    borderColor: PRIMARY_800,
    borderRadius: BorderRadius.circular(
      LABEL_12_BOLD(SECONDARY_500).fontSize! / 2,
    ),
    child: Padding(
      padding: EdgeInsetsGeometry.symmetric(
        vertical: LABEL_12_BOLD(SECONDARY_500).fontSize! / 2,
        horizontal: LABEL_12_BOLD(SECONDARY_500).fontSize!,
      ),
      child: Text(
        APPLICATION_LANGUAGE.CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE,
        style: LABEL_12_BOLD(SECONDARY_500),
      ),
    ),
  );
}
