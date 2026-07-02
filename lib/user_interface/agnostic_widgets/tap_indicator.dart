import "package:flutter/material.dart" as material;
import "package:flutter/services.dart";
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/user_interface/internals/theme/colors.dart";

class TapIndicator extends StatefulWidget {
  final Color indicatorColor;
  final bool isHapticFeedbackEnabled;
  final VoidCallback onTap;
  final Widget child;

  const TapIndicator({
    super.key,
    required this.indicatorColor,
    this.isHapticFeedbackEnabled = false,
    required this.onTap,
    required this.child,
  });

  @override
  State<TapIndicator> createState() {
    return _TapIndicatorState();
  }
}

class _TapIndicatorState extends State<TapIndicator> {
  late final ValueNotifier<bool> _isTapIndicatorShown;

  @override
  void initState() {
    super.initState();

    _isTapIndicatorShown = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _isTapIndicatorShown.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) {
        _isTapIndicatorShown.value = true;
      },
      onTapUp: (_) async {
        _isTapIndicatorShown.value = false;

        if (widget.isHapticFeedbackEnabled) {
          await HapticFeedback.lightImpact();
        }
      },
      onTapCancel: () {
        _isTapIndicatorShown.value = false;
      },
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Stack(
          children: [
            widget.child,
            ValueListenableBuilder<bool>(
              valueListenable: _isTapIndicatorShown,
              builder: (_, isTapIndicatorShown, _) {
                return Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedSwitcher(
                      duration: AnimationDuration.SHORT.value,
                      switchInCurve: Curves.easeInOutCirc,
                      switchOutCurve: Curves.easeInOutCirc,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: isTapIndicatorShown
                          ? Container(
                              color: widget.indicatorColor.withValues(
                                alpha: 0.3,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return TapIndicator(
    indicatorColor: NEUTRALS_900,
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.all(20),
      child: SelectableRegion(
        selectionControls: material.materialTextSelectionControls,
        child: Text(APPLICATION_LANGUAGE.ADD_BUTTON_TITLE),
      ),
    ),
  );
}
