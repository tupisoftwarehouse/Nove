import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/internals/concerns/preview_content_wrapper.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/internals/theme/colors.dart";

class ForegroundBackdrop extends StatelessWidget {
  final bool isVisible;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const ForegroundBackdrop({
    super.key,
    required this.isVisible,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: accessibilityLabel,
      button: true,
      child: AnimatedSwitcher(
        duration: AnimationDuration.LONG.value,
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: isVisible
            ? GestureDetector(
                onTap: onTap,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: NEUTRALS_900.withValues(alpha: 0.8),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return PreviewContentWrapper(
    child: Stack(
      children: [
        ForegroundBackdrop(
          isVisible: true,
          accessibilityLabel: "",
          onTap: () {},
        ),
      ],
    ),
  );
}
