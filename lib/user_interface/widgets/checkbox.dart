import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/agnostic_widgets/tooltip.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class Checkbox extends StatefulWidget {
  final bool isChecked;
  final String tooltipMessage;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const Checkbox({
    super.key,
    required this.isChecked,
    required this.tooltipMessage,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _CheckboxState();
  }
}

class _CheckboxState extends State<Checkbox> {
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
            verticalOffset: 27,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: TapIndicator(
                indicatorColor: theme.tapIndicatorColor,
                isHapticFeedbackEnabled: true,
                onTap: widget.onTap,
                child: Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: theme.input.backgroundColor,
                      ),
                    ),
                    AnimatedScale(
                      scale: widget.isChecked ? 1.0 : 0.0,
                      duration: AnimationDuration.SHORT.value,
                      curve: Curves.easeInOutCirc,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: PRIMARY_900,
                        ),
                        child: Center(
                          child: AnimatedScale(
                            scale: widget.isChecked ? 1.0 : 0.0,
                            duration: AnimationDuration.SHORT.value,
                            curve: Curves.easeInOutCirc,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: SECONDARY_500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
  return Checkbox(
    isChecked: false,
    accessibilityLabel: "",
    tooltipMessage: "Select Kilogram as base",
    onTap: () {},
  );
}
