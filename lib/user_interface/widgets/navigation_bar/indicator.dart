import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/constants/user_interface_constants.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";

class Indicator extends StatefulWidget {
  final bool isShown;

  const Indicator({super.key, required this.isShown});

  @override
  State<StatefulWidget> createState() {
    return _IndicatorState();
  }
}

class _IndicatorState extends State<Indicator> {
  late final ThemeViewModel _themeViewModel;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _themeViewModel.theme,
      builder: (_, theme, _) {
        return SizedBox(
          width: 43,
          height: 27,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                left: 21,
                child: Transform.rotate(
                  angle: INDICATOR_BAR_ROTATION_ANGLE,
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 24,
                    width: 8.5,
                    child: Center(
                      child: AnimatedContainer(
                        duration: AnimationDuration.SHORT.value,
                        curve: Curves.easeInOutCirc,
                        height: widget.isShown ? 24 : 0,
                        width: 8.5,
                        decoration: BoxDecoration(
                          color: theme.navigationBarIndicatorColor,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 4.5,
                left: 28.5,
                child: Transform.rotate(
                  angle: INDICATOR_BAR_ROTATION_ANGLE,
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 24,
                    width: 8.5,
                    child: Center(
                      child: AnimatedContainer(
                        duration: AnimationDuration.SHORT.value,
                        curve: Curves.easeInOutCirc,
                        height: widget.isShown ? 24 : 0,
                        width: 8.5,
                        decoration: BoxDecoration(
                          color: theme.navigationBarIndicatorColor,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 9,
                left: 36,
                child: Transform.rotate(
                  angle: INDICATOR_BAR_ROTATION_ANGLE,
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 24,
                    width: 8.5,
                    child: Center(
                      child: AnimatedContainer(
                        duration: AnimationDuration.SHORT.value,
                        curve: Curves.easeInOutCirc,
                        height: widget.isShown ? 24 : 0,
                        width: 8.5,
                        decoration: BoxDecoration(
                          color: theme.navigationBarIndicatorColor,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

@Preview()
Widget preview() {
  return Indicator(isShown: true);
}
