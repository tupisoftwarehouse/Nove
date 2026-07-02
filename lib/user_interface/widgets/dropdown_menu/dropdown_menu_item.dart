import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:nove/user_interface/agnostic_widgets/tap_indicator.dart";
import "package:nove/dependency_injection/theme_view_model_factory.dart";
import "package:nove/user_interface/internals/theme/colors.dart";
import "package:nove/user_interface/view_models/theme_view_model.dart";
import "package:nove/user_interface/internals/theme/typography_styles.dart";

class DropdownMenuItem extends StatefulWidget {
  final String label;
  final String abbreviation;
  final bool isSelected;
  final String accessibilityLabel;
  final VoidCallback onTap;

  const DropdownMenuItem({
    super.key,
    required this.label,
    required this.abbreviation,
    required this.isSelected,
    required this.accessibilityLabel,
    required this.onTap,
  });

  @override
  State<DropdownMenuItem> createState() {
    return _DropdownMenuItemState();
  }
}

class _DropdownMenuItemState extends State<DropdownMenuItem> {
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
          selected: widget.isSelected,
          child: TapIndicator(
            indicatorColor: widget.isSelected
                ? NEUTRALS_900
                : theme.tapIndicatorColor,
            onTap: widget.onTap,
            child: Container(
              height: 48,
              width: double.infinity,
              color: widget.isSelected
                  ? SECONDARY_200
                  : theme.input.backgroundColor,
              child: Padding(
                padding: const EdgeInsetsGeometry.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectionContainer.disabled(
                      child: Text(
                        widget.label,
                        style: HEADING_5(
                          widget.isSelected
                              ? NEUTRALS_900
                              : theme.textEmphasis9Color,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SelectionContainer.disabled(
                      child: Text(
                        widget.abbreviation,
                        style: LABEL_12_SEMIBOLD(
                          widget.isSelected
                              ? NEUTRALS_500
                              : theme.textEmphasis5Color,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
  return DropdownMenuItem(
    label: "Binary",
    abbreviation: "BIN",
    isSelected: true,
    accessibilityLabel: "",
    onTap: () {},
  );
}
