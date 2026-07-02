import "dart:async";
import "package:flutter/services.dart";
import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:flutter/material.dart" as material;
import "package:nove/user_interface/agnostic_widgets/surface.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/checker/user_interface_checker.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class Tooltip extends StatefulWidget {
  final String message;
  final double verticalOffset;
  final Widget child;

  const Tooltip({
    super.key,
    required this.message,
    required this.verticalOffset,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return _TooltipState();
  }
}

class _TooltipState extends State<Tooltip> {
  late final ThemeViewModel themeViewModel;
  late final GlobalKey<material.TooltipState> _tooltipKey;
  Timer? _tooltipShowingTimer;

  @override
  void initState() {
    super.initState();

    themeViewModel = ThemeViewModelFactory.getInstance();

    _tooltipKey = GlobalKey();
  }

  @override
  void dispose() {
    super.dispose();

    if (!isNull(_tooltipShowingTimer)) {
      _tooltipShowingTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext _) {
    return GestureDetector(
      onLongPress: () async {
        _tooltipKey.currentState?.ensureTooltipVisible();

        await HapticFeedback.lightImpact();

        _tooltipShowingTimer = Timer(TOOLTIP_SHOWING_DURATION, () {
          material.Tooltip.dismissAllToolTips();
        });
      },
      child: ValueListenableBuilder(
        valueListenable: themeViewModel.theme,
        builder: (_, theme, _) {
          return material.Tooltip(
            key: _tooltipKey,
            message: widget.message,
            margin: EdgeInsets.zero,
            verticalOffset: widget.verticalOffset,
            constraints: const BoxConstraints.tightFor(height: 30),
            padding: EdgeInsets.symmetric(
              horizontal: LABEL_12_BOLD(theme.textEmphasis9Color).fontSize!,
              vertical: LABEL_12_BOLD(theme.textEmphasis9Color).fontSize! / 2,
            ),
            decoration: BoxDecoration(
              color: theme.elevatedSurface.backgroundColor,
              border: BoxBorder.all(
                color: theme.elevatedSurface.borderColor,
                width: 1,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
              borderRadius: BorderRadius.circular(
                LABEL_12_BOLD(theme.textEmphasis9Color).fontSize! / 2,
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
            enableFeedback: false,
            enableTapToDismiss: false,
            ignorePointer: true,
            excludeFromSemantics: true,
            preferBelow: true,
            triggerMode: material.TooltipTriggerMode.manual,
            mouseCursor: material.MouseCursor.defer,
            textStyle: LABEL_12_BOLD(theme.textEmphasis9Color),
            textAlign: TextAlign.center,
            waitDuration: Duration.zero,
            exitDuration: AnimationDuration.SHORT.value,
            showDuration: AnimationDuration.SHORT.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}

@Preview()
Widget preview() {
  final textStyle = LABEL_12_BOLD(NEUTRALS_900);

  return Tooltip(
    message: APPLICATION_LANGUAGE.BACK_BUTTON_TOOLTIP_MESSAGE,
    verticalOffset: textStyle.fontSize! + 9,
    child: Surface(
      backgroundColor: NEUTRALS_50,
      borderColor: NEUTRALS_300,
      borderRadius: BorderRadius.circular(textStyle.fontSize! / 2),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          vertical: textStyle.fontSize! / 2,
          horizontal: textStyle.fontSize!,
        ),
        child: Text(
          APPLICATION_LANGUAGE.CURRENT_EXPRESSION_SNAPSHOT_RESULT_TITLE,
          style: textStyle,
        ),
      ),
    ),
  );
}
