import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/user_interface/internals/theme/animation_duration.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/widgets/navigation_bar/indicator.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";
import "package:nove/user_interface/internals/theme/icon_styles.dart";

class NavigationBarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const NavigationBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarItemState();
  }
}

class _NavigationBarItemState extends State<NavigationBarItem> {
  late final ThemeViewModel _themeViewModel;

  @override
  void initState() {
    super.initState();

    _themeViewModel = ThemeViewModelFactory.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.accessibilityLabel,
      button: true,
      child: ValueListenableBuilder(
        valueListenable: _themeViewModel.theme,
        builder: (_, theme, _) {
          return IntrinsicWidth(
            child: TapIndicator(
              indicatorColor: theme.tapIndicatorColor,
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsetsGeometry.only(
                  top: 14,
                  right: 26,
                  bottom: 8,
                  left: 26,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: [
                    Positioned(
                      left: 3,
                      right: 0,
                      top: -6,
                      child: Center(
                        child: Indicator(isShown: widget.isSelected),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: widget.isSelected ? 1 : 0.3,
                      duration: AnimationDuration.SHORT.value,
                      curve: Curves.easeInOutCirc,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LABEL_16_SEMIBOLD_ICON(
                            widget.icon,
                            theme.iconEmphasis9Color,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.title,
                            style: LABEL_12_SEMIBOLD(theme.textEmphasis9Color),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

@Preview()
Widget preview() {
  return Padding(
    padding: EdgeInsetsGeometry.all(16),
    child: NavigationBarItem(
      icon: Symbols.equal_rounded,
      title: "Calculator",
      isSelected: true,
      accessibilityLabel: "",
      onTap: () {},
    ),
  );
}
